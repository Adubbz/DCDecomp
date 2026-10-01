#include <algorithm>
#include <vector>

#include "context.hpp"

namespace gfx::detail {

namespace {

// The game creates thousands of meshes and hundreds of textures; one VkDeviceMemory each would
// run into maxMemoryAllocationCount (4096 on many drivers), so they share large blocks.
constexpr VkDeviceSize kBlockSize = 64ull << 20;
constexpr VkDeviceSize kDedicatedThreshold = kBlockSize / 2;
constexpr VkDeviceSize kTransientChunkSize = 8ull << 20;

struct Range {
    VkDeviceSize offset;
    VkDeviceSize size;
};

struct Block {
    VkDeviceMemory     memory = VK_NULL_HANDLE;
    uint8_t           *mapped = nullptr;
    std::vector<Range> free;
};

struct Pool {
    uint32_t           type;
    bool               linear;
    std::vector<Block> blocks;
};

std::vector<Pool> g_pools;

VkDeviceSize AlignUp(VkDeviceSize value, VkDeviceSize alignment) {
    return (value + alignment - 1) / alignment * alignment;
}

uint32_t FindMemoryType(uint32_t type_bits, VkMemoryPropertyFlags required, VkMemoryPropertyFlags preferred) {
    const VkPhysicalDeviceMemoryProperties &properties = g.memory_properties;
    for (VkMemoryPropertyFlags wanted : {required | preferred, required}) {
        for (uint32_t i = 0; i < properties.memoryTypeCount; i++) {
            if ((type_bits & (1u << i)) && (properties.memoryTypes[i].propertyFlags & wanted) == wanted) {
                return i;
            }
        }
    }
    Fatal("no memory type with properties 0x%x", required);
}

bool IsHostVisible(uint32_t type) {
    return (g.memory_properties.memoryTypes[type].propertyFlags & VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT) != 0;
}

VkDeviceMemory AllocateRaw(VkDeviceSize size, uint32_t type, uint8_t **mapped) {
    VkMemoryAllocateInfo info = {};
    info.sType = VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO;
    info.allocationSize = size;
    info.memoryTypeIndex = type;
    VkDeviceMemory memory = VK_NULL_HANDLE;
    Check(vkAllocateMemory(g.device, &info, nullptr, &memory), "vkAllocateMemory");
    *mapped = nullptr;
    if (IsHostVisible(type)) {
        void *pointer = nullptr;
        Check(vkMapMemory(g.device, memory, 0, VK_WHOLE_SIZE, 0, &pointer), "vkMapMemory");
        *mapped = static_cast<uint8_t *>(pointer);
    }
    return memory;
}

bool AllocateFromBlock(Block &block, VkDeviceSize size, VkDeviceSize alignment, VkDeviceSize *offset) {
    for (size_t i = 0; i < block.free.size(); i++) {
        Range       &range = block.free[i];
        VkDeviceSize aligned = AlignUp(range.offset, alignment);
        if (aligned + size > range.offset + range.size) {
            continue;
        }
        VkDeviceSize end = range.offset + range.size;
        Range        before{range.offset, aligned - range.offset};
        Range        after{aligned + size, end - (aligned + size)};
        block.free.erase(block.free.begin() + static_cast<std::ptrdiff_t>(i));
        if (after.size > 0) {
            block.free.insert(block.free.begin() + static_cast<std::ptrdiff_t>(i), after);
        }
        if (before.size > 0) {
            block.free.insert(block.free.begin() + static_cast<std::ptrdiff_t>(i), before);
        }
        *offset = aligned;
        return true;
    }
    return false;
}

void ReturnToBlock(Block &block, VkDeviceSize offset, VkDeviceSize size) {
    auto it = std::lower_bound(block.free.begin(), block.free.end(), offset,
                               [](const Range &range, VkDeviceSize value) { return range.offset < value; });
    it = block.free.insert(it, Range{offset, size});
    if (it + 1 != block.free.end() && it->offset + it->size == (it + 1)->offset) {
        it->size += (it + 1)->size;
        block.free.erase(it + 1);
    }
    if (it != block.free.begin() && (it - 1)->offset + (it - 1)->size == it->offset) {
        (it - 1)->size += it->size;
        block.free.erase(it);
    }
}

} // namespace

Allocation AllocateMemory(const VkMemoryRequirements &requirements, VkMemoryPropertyFlags required,
                          VkMemoryPropertyFlags preferred, bool linear) {
    uint32_t   type = FindMemoryType(requirements.memoryTypeBits, required, preferred);
    Allocation allocation;
    allocation.size = requirements.size;

    if (requirements.size >= kDedicatedThreshold) {
        allocation.memory = AllocateRaw(requirements.size, type, &allocation.mapped);
        return allocation;
    }

    uint32_t pool_index = 0;
    for (; pool_index < g_pools.size(); pool_index++) {
        if (g_pools[pool_index].type == type && g_pools[pool_index].linear == linear) {
            break;
        }
    }
    if (pool_index == g_pools.size()) {
        g_pools.push_back(Pool{type, linear, {}});
    }
    Pool &pool = g_pools[pool_index];
    allocation.pool = pool_index;

    for (uint32_t i = 0; i < pool.blocks.size(); i++) {
        VkDeviceSize offset;
        if (AllocateFromBlock(pool.blocks[i], requirements.size, requirements.alignment, &offset)) {
            allocation.block = i;
            allocation.offset = offset;
            allocation.memory = pool.blocks[i].memory;
            allocation.mapped = pool.blocks[i].mapped ? pool.blocks[i].mapped + offset : nullptr;
            return allocation;
        }
    }

    Block block;
    block.memory = AllocateRaw(kBlockSize, type, &block.mapped);
    block.free.push_back(Range{0, kBlockSize});
    VkDeviceSize offset = 0;
    AllocateFromBlock(block, requirements.size, requirements.alignment, &offset);
    pool.blocks.push_back(std::move(block));
    allocation.block = static_cast<uint32_t>(pool.blocks.size() - 1);
    allocation.offset = offset;
    allocation.memory = pool.blocks.back().memory;
    allocation.mapped = pool.blocks.back().mapped ? pool.blocks.back().mapped + offset : nullptr;
    return allocation;
}

void FreeMemory(Allocation &allocation) {
    if (allocation.memory == VK_NULL_HANDLE) {
        return;
    }
    if (allocation.block == UINT32_MAX) {
        vkFreeMemory(g.device, allocation.memory, nullptr);
    } else {
        ReturnToBlock(g_pools[allocation.pool].blocks[allocation.block], allocation.offset, allocation.size);
    }
    allocation = {};
}

void ShutdownMemory() {
    for (Pool &pool : g_pools) {
        for (Block &block : pool.blocks) {
            vkFreeMemory(g.device, block.memory, nullptr);
        }
    }
    g_pools.clear();
}

Buffer CreateBuffer(VkDeviceSize size, VkBufferUsageFlags usage, bool host_visible) {
    Buffer             buffer;
    VkBufferCreateInfo info = {};
    info.sType = VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO;
    info.size = size;
    info.usage = usage;
    info.sharingMode = VK_SHARING_MODE_EXCLUSIVE;
    Check(vkCreateBuffer(g.device, &info, nullptr, &buffer.buffer), "vkCreateBuffer");

    VkMemoryRequirements requirements;
    vkGetBufferMemoryRequirements(g.device, buffer.buffer, &requirements);
    if (host_visible) {
        buffer.memory = AllocateMemory(requirements,
                                       VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT | VK_MEMORY_PROPERTY_HOST_COHERENT_BIT,
                                       VK_MEMORY_PROPERTY_HOST_CACHED_BIT, true);
    } else {
        buffer.memory = AllocateMemory(requirements, VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT, 0, true);
    }
    Check(vkBindBufferMemory(g.device, buffer.buffer, buffer.memory.memory, buffer.memory.offset), "vkBindBufferMemory");
    buffer.size = size;
    return buffer;
}

void DestroyBuffer(Buffer &buffer) {
    if (buffer.buffer != VK_NULL_HANDLE) {
        vkDestroyBuffer(g.device, buffer.buffer, nullptr);
    }
    FreeMemory(buffer.memory);
    buffer = {};
}

TransientSpan AllocateTransient(VkDeviceSize size, VkDeviceSize alignment) {
    Frame       &frame = CurrentFrame();
    VkDeviceSize align = std::max<VkDeviceSize>(alignment, 16);

    for (; frame.chunk < frame.chunks.size(); frame.chunk++) {
        TransientChunk &chunk = frame.chunks[frame.chunk];
        VkDeviceSize    offset = AlignUp(chunk.used, align);
        if (offset + size <= chunk.buffer.size) {
            chunk.used = offset + size;
            return TransientSpan{chunk.buffer.buffer, offset, chunk.buffer.memory.mapped + offset, chunk.constants_set};
        }
    }

    TransientChunk chunk;
    chunk.buffer = CreateBuffer(std::max(kTransientChunkSize, AlignUp(size, 1 << 20)),
                                VK_BUFFER_USAGE_TRANSFER_SRC_BIT | VK_BUFFER_USAGE_TRANSFER_DST_BIT |
                                    VK_BUFFER_USAGE_VERTEX_BUFFER_BIT | VK_BUFFER_USAGE_INDEX_BUFFER_BIT |
                                    VK_BUFFER_USAGE_UNIFORM_BUFFER_BIT,
                                true);

    VkDescriptorSetAllocateInfo allocate = {};
    allocate.sType = VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO;
    allocate.descriptorPool = g.constants_pool;
    allocate.descriptorSetCount = 1;
    allocate.pSetLayouts = &g.constants_set_layout;
    Check(vkAllocateDescriptorSets(g.device, &allocate, &chunk.constants_set), "vkAllocateDescriptorSets");

    VkDescriptorBufferInfo buffer_info = {chunk.buffer.buffer, 0, sizeof(MeshConstants)};
    VkWriteDescriptorSet   write = {};
    write.sType = VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET;
    write.dstSet = chunk.constants_set;
    write.descriptorCount = 1;
    write.descriptorType = VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER_DYNAMIC;
    write.pBufferInfo = &buffer_info;
    vkUpdateDescriptorSets(g.device, 1, &write, 0, nullptr);

    chunk.used = size;
    frame.chunks.push_back(chunk);
    frame.chunk = static_cast<uint32_t>(frame.chunks.size() - 1);
    return TransientSpan{chunk.buffer.buffer, 0, chunk.buffer.memory.mapped, chunk.constants_set};
}

void ResetTransients(Frame &frame) {
    // A chunk grown for one oversized upload is not kept around for every later frame.
    for (size_t i = frame.chunks.size(); i-- > 0;) {
        if (frame.chunks[i].buffer.size > kTransientChunkSize || i >= 8) {
            vkFreeDescriptorSets(g.device, g.constants_pool, 1, &frame.chunks[i].constants_set);
            DestroyBuffer(frame.chunks[i].buffer);
            frame.chunks.erase(frame.chunks.begin() + static_cast<std::ptrdiff_t>(i));
        }
    }
    for (TransientChunk &chunk : frame.chunks) {
        chunk.used = 0;
    }
    frame.chunk = 0;
}

void DestroyTransients(Frame &frame) {
    for (TransientChunk &chunk : frame.chunks) {
        DestroyBuffer(chunk.buffer);
    }
    frame.chunks.clear();
    frame.chunk = 0;
}

} // namespace gfx::detail
