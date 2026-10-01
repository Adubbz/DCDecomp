#include <algorithm>
#include <bit>
#include <cmath>
#include <cstring>

#include "context.hpp"

namespace gfx {

namespace detail {

namespace {

constexpr VkAccessFlags2 kWriteAccess =
    VK_ACCESS_2_TRANSFER_WRITE_BIT | VK_ACCESS_2_COLOR_ATTACHMENT_WRITE_BIT |
    VK_ACCESS_2_DEPTH_STENCIL_ATTACHMENT_WRITE_BIT | VK_ACCESS_2_SHADER_WRITE_BIT |
    VK_ACCESS_2_HOST_WRITE_BIT | VK_ACCESS_2_MEMORY_WRITE_BIT;

constexpr uint32_t kSlotBits = 16;
constexpr uint32_t kSlotMask = (1u << kSlotBits) - 1;

uint32_t MakeHandle(uint16_t generation, uint32_t slot) {
    return (static_cast<uint32_t>(generation) << kSlotBits) | slot;
}

uint16_t NextGeneration(uint16_t generation) { return generation == 0xFFFF ? 1 : generation + 1; }

uint32_t TexelSize(TextureFormat format) { return format == TextureFormat::Index8 ? 1 : 4; }

VkFormat VulkanFormat(TextureFormat format) {
    return format == TextureFormat::Index8 ? VK_FORMAT_R8_UNORM : kColorFormat;
}

void WriteTextureDescriptor(uint32_t slot, VkImageView view) {
    VkDescriptorImageInfo image = {VK_NULL_HANDLE, view, VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL};
    VkWriteDescriptorSet  write = {};
    write.sType = VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET;
    write.dstSet = g.texture_set;
    write.dstBinding = 0;
    write.dstArrayElement = slot;
    write.descriptorCount = 1;
    write.descriptorType = VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE;
    write.pImageInfo = &image;
    vkUpdateDescriptorSets(g.device, 1, &write, 0, nullptr);
}

void ClearImage(VkCommandBuffer cmd, Image &image, const VkClearColorValue &color) {
    Transition(cmd, image, TransferDst());
    VkImageSubresourceRange range = {VK_IMAGE_ASPECT_COLOR_BIT, 0, image.mips, 0, 1};
    vkCmdClearColorImage(cmd, image.image, VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, &color, 1, &range);
    ToRest(cmd, image);
}

void ClearDepth(VkCommandBuffer cmd, Image &image) {
    Transition(cmd, image, TransferDst());
    VkImageSubresourceRange  range = {VK_IMAGE_ASPECT_DEPTH_BIT, 0, 1, 0, 1};
    VkClearDepthStencilValue far = {0.0f, 0};
    vkCmdClearDepthStencilImage(cmd, image.image, VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, &far, 1, &range);
    ToRest(cmd, image);
}

uint32_t AllocateTextureSlot() {
    if (!g.free_texture_slots.empty()) {
        uint32_t slot = g.free_texture_slots.back();
        g.free_texture_slots.pop_back();
        return slot;
    }
    if (g.textures.size() >= kMaxTextures) {
        return 0;
    }
    g.textures.emplace_back();
    return static_cast<uint32_t>(g.textures.size() - 1);
}

bool CheckSize(uint32_t width, uint32_t height) {
    uint32_t limit = g.properties.limits.maxImageDimension2D;
    if (width == 0 || height == 0 || width > limit || height > limit) {
        Error("texture size %ux%u is outside what the device supports (1..%u)", width, height, limit);
        return false;
    }
    return true;
}

void MemoryBarrier(VkCommandBuffer cmd, VkPipelineStageFlags2 src_stage, VkAccessFlags2 src_access,
                   VkPipelineStageFlags2 dst_stage, VkAccessFlags2 dst_access) {
    VkMemoryBarrier2 barrier = {};
    barrier.sType = VK_STRUCTURE_TYPE_MEMORY_BARRIER_2;
    barrier.srcStageMask = src_stage;
    barrier.srcAccessMask = src_access;
    barrier.dstStageMask = dst_stage;
    barrier.dstAccessMask = dst_access;
    VkDependencyInfo dependency = {};
    dependency.sType = VK_STRUCTURE_TYPE_DEPENDENCY_INFO;
    dependency.memoryBarrierCount = 1;
    dependency.pMemoryBarriers = &barrier;
    vkCmdPipelineBarrier2(cmd, &dependency);
}

constexpr VkPipelineStageFlags2 kVertexInput =
    VK_PIPELINE_STAGE_2_VERTEX_ATTRIBUTE_INPUT_BIT | VK_PIPELINE_STAGE_2_INDEX_INPUT_BIT;
constexpr VkAccessFlags2 kVertexRead = VK_ACCESS_2_VERTEX_ATTRIBUTE_READ_BIT | VK_ACCESS_2_INDEX_READ_BIT;

void UploadToBuffer(Mesh &mesh, VkDeviceSize offset, const void *data, VkDeviceSize size) {
    TransientSpan staging = AllocateTransient(size, 16);
    std::memcpy(staging.data, data, size);
    VkCommandBuffer cmd = CommandsForWrite(mesh.last_draw_use);
    MemoryBarrier(cmd, kVertexInput, kVertexRead, VK_PIPELINE_STAGE_2_COPY_BIT,
                  VK_ACCESS_2_TRANSFER_WRITE_BIT);
    VkBufferCopy region = {staging.offset, offset, size};
    vkCmdCopyBuffer(cmd, staging.buffer, mesh.buffer.buffer, 1, &region);
    MemoryBarrier(cmd, VK_PIPELINE_STAGE_2_COPY_BIT, VK_ACCESS_2_TRANSFER_WRITE_BIT, kVertexInput,
                  kVertexRead);
}

Image CreateTargetImage(uint32_t width, uint32_t height) {
    return CreateImage(width, height, 1, kColorFormat,
                       VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT | VK_IMAGE_USAGE_SAMPLED_BIT |
                           VK_IMAGE_USAGE_TRANSFER_SRC_BIT | VK_IMAGE_USAGE_TRANSFER_DST_BIT);
}

Image CreateTargetDepth(uint32_t width, uint32_t height) {
    return CreateImage(width, height, 1, kDepthFormat,
                       VK_IMAGE_USAGE_DEPTH_STENCIL_ATTACHMENT_BIT | VK_IMAGE_USAGE_TRANSFER_SRC_BIT |
                           VK_IMAGE_USAGE_TRANSFER_DST_BIT);
}

uint32_t ScaledSize(uint32_t logical, float scale) {
    return std::max(1u, static_cast<uint32_t>(std::ceil(static_cast<float>(logical) * scale)));
}

} // namespace

ImageState RestState(const Image &image) {
    if (image.aspect & VK_IMAGE_ASPECT_DEPTH_BIT) {
        return {VK_IMAGE_LAYOUT_DEPTH_ATTACHMENT_OPTIMAL,
                VK_PIPELINE_STAGE_2_EARLY_FRAGMENT_TESTS_BIT | VK_PIPELINE_STAGE_2_LATE_FRAGMENT_TESTS_BIT,
                VK_ACCESS_2_DEPTH_STENCIL_ATTACHMENT_READ_BIT |
                    VK_ACCESS_2_DEPTH_STENCIL_ATTACHMENT_WRITE_BIT};
    }
    return {VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL, VK_PIPELINE_STAGE_2_FRAGMENT_SHADER_BIT,
            VK_ACCESS_2_SHADER_SAMPLED_READ_BIT};
}

ImageState TransferSrc() {
    return {VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL, VK_PIPELINE_STAGE_2_ALL_TRANSFER_BIT,
            VK_ACCESS_2_TRANSFER_READ_BIT};
}

ImageState TransferDst() {
    return {VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, VK_PIPELINE_STAGE_2_ALL_TRANSFER_BIT,
            VK_ACCESS_2_TRANSFER_WRITE_BIT};
}

Image CreateImage(uint32_t width, uint32_t height, uint32_t mips, VkFormat format, VkImageUsageFlags usage) {
    Image image;
    image.format = format;
    image.aspect = format == kDepthFormat ? VK_IMAGE_ASPECT_DEPTH_BIT : VK_IMAGE_ASPECT_COLOR_BIT;
    image.width = width;
    image.height = height;
    image.mips = mips;

    VkImageCreateInfo info = {};
    info.sType = VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO;
    info.imageType = VK_IMAGE_TYPE_2D;
    info.format = format;
    info.extent = {width, height, 1};
    info.mipLevels = mips;
    info.arrayLayers = 1;
    info.samples = VK_SAMPLE_COUNT_1_BIT;
    info.tiling = VK_IMAGE_TILING_OPTIMAL;
    info.usage = usage;
    info.sharingMode = VK_SHARING_MODE_EXCLUSIVE;
    info.initialLayout = VK_IMAGE_LAYOUT_UNDEFINED;
    Check(vkCreateImage(g.device, &info, nullptr, &image.image), "vkCreateImage");

    VkMemoryRequirements requirements;
    vkGetImageMemoryRequirements(g.device, image.image, &requirements);
    image.memory = AllocateMemory(requirements, VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT, 0, false);
    Check(vkBindImageMemory(g.device, image.image, image.memory.memory, image.memory.offset),
          "vkBindImageMemory");

    VkImageViewCreateInfo view = {};
    view.sType = VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO;
    view.image = image.image;
    view.viewType = VK_IMAGE_VIEW_TYPE_2D;
    view.format = format;
    view.subresourceRange = {image.aspect, 0, mips, 0, 1};
    Check(vkCreateImageView(g.device, &view, nullptr, &image.view), "vkCreateImageView");
    return image;
}

void DestroyImage(Image &image) {
    if (image.view != VK_NULL_HANDLE) {
        vkDestroyImageView(g.device, image.view, nullptr);
    }
    if (image.image != VK_NULL_HANDLE) {
        vkDestroyImage(g.device, image.image, nullptr);
    }
    FreeMemory(image.memory);
    image = {};
}

void Transition(VkCommandBuffer cmd, Image &image, const ImageState &to) {
    ImageState &from = image.state;
    if (from.layout == to.layout && !(from.access & kWriteAccess) && !(to.access & kWriteAccess)) {
        from.stage |= to.stage;
        from.access |= to.access;
        return;
    }
    VkImageMemoryBarrier2 barrier = {};
    barrier.sType = VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER_2;
    barrier.srcStageMask = from.stage;
    barrier.srcAccessMask = from.access;
    barrier.dstStageMask = to.stage;
    barrier.dstAccessMask = to.access;
    barrier.oldLayout = from.layout;
    barrier.newLayout = to.layout;
    barrier.srcQueueFamilyIndex = VK_QUEUE_FAMILY_IGNORED;
    barrier.dstQueueFamilyIndex = VK_QUEUE_FAMILY_IGNORED;
    barrier.image = image.image;
    barrier.subresourceRange = {image.aspect, 0, image.mips, 0, 1};
    VkDependencyInfo dependency = {};
    dependency.sType = VK_STRUCTURE_TYPE_DEPENDENCY_INFO;
    dependency.imageMemoryBarrierCount = 1;
    dependency.pImageMemoryBarriers = &barrier;
    vkCmdPipelineBarrier2(cmd, &dependency);
    image.state = to;
}

void ToRest(VkCommandBuffer cmd, Image &image) { Transition(cmd, image, RestState(image)); }

VkCommandBuffer CommandsForWrite(uint64_t &last_draw_use) {
    if (g.in_frame && last_draw_use == g.frame_serial) {
        EndRendering();
        return DrawCommands();
    }
    return UploadCommands();
}

void InitResources() {
    g.textures.clear();
    g.textures.resize(kFirstUserSlot);
    g.free_texture_slots.clear();
    g.meshes.clear();
    g.meshes.resize(1);
    g.free_mesh_slots.clear();

    // Slot 0 backs every draw without a texture so no descriptor the shaders can reach is unset.
    Texture &null = g.textures[0];
    null.image =
        CreateImage(1, 1, 1, kColorFormat, VK_IMAGE_USAGE_SAMPLED_BIT | VK_IMAGE_USAGE_TRANSFER_DST_BIT);
    null.desc.width = 1;
    null.desc.height = 1;
    ClearImage(UploadCommands(), null.image,
               VkClearColorValue{
                   {1.0f, 1.0f, 1.0f, 1.0f}
    });
    WriteTextureDescriptor(0, null.image.view);
}

void ShutdownResources() {
    for (Texture &texture : g.textures) {
        DestroyImage(texture.image);
        DestroyImage(texture.depth);
    }
    for (Mesh &mesh : g.meshes) {
        DestroyBuffer(mesh.buffer);
    }
    g.textures.clear();
    g.meshes.clear();
}

Texture *LookupTexture(TextureHandle handle) {
    uint32_t slot = handle & kSlotMask;
    if (slot < kFirstUserSlot || slot >= g.textures.size()) {
        return nullptr;
    }
    Texture &texture = g.textures[slot];
    if (!texture.live || texture.generation != handle >> kSlotBits) {
        return nullptr;
    }
    return &texture;
}

Mesh *LookupMesh(MeshHandle handle) {
    uint32_t slot = handle & kSlotMask;
    if (slot == 0 || slot >= g.meshes.size()) {
        return nullptr;
    }
    Mesh &mesh = g.meshes[slot];
    if (!mesh.live || mesh.generation != handle >> kSlotBits) {
        return nullptr;
    }
    return &mesh;
}

Image *ColorImageOf(TextureHandle handle) {
    if (handle == kMainTarget) {
        return &CurrentMainColor();
    }
    if (handle == kPreviousFrame) {
        return &PreviousMainColor();
    }
    Texture *texture = LookupTexture(handle);
    return texture ? &texture->image : nullptr;
}

uint32_t SamplerIndex(Filter filter, Wrap wrap_u, Wrap wrap_v) {
    return static_cast<uint32_t>(filter) * 4 + static_cast<uint32_t>(wrap_u) * 2 +
           static_cast<uint32_t>(wrap_v);
}

void RecreateRenderTargets() {
    vkDeviceWaitIdle(g.device);
    RunOneShot([](VkCommandBuffer cmd) {
        for (uint32_t slot = kFirstUserSlot; slot < g.textures.size(); slot++) {
            Texture &texture = g.textures[slot];
            if (!texture.live || !texture.render_target) {
                continue;
            }
            uint32_t width = ScaledSize(texture.logical_width, g.render_scale);
            uint32_t height = ScaledSize(texture.logical_height, g.render_scale);
            if (!CheckSize(width, height)) {
                width = texture.image.width;
                height = texture.image.height;
            }
            Image image = CreateTargetImage(width, height);
            Image depth = CreateTargetDepth(width, height);
            Transition(cmd, texture.image, TransferSrc());
            Transition(cmd, image, TransferDst());
            VkImageBlit region = {};
            region.srcSubresource = {VK_IMAGE_ASPECT_COLOR_BIT, 0, 0, 1};
            region.srcOffsets[1] = {static_cast<int32_t>(texture.image.width),
                                    static_cast<int32_t>(texture.image.height), 1};
            region.dstSubresource = {VK_IMAGE_ASPECT_COLOR_BIT, 0, 0, 1};
            region.dstOffsets[1] = {static_cast<int32_t>(width), static_cast<int32_t>(height), 1};
            vkCmdBlitImage(cmd, texture.image.image, VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL, image.image,
                           VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, 1, &region, VK_FILTER_LINEAR);
            ToRest(cmd, image);
            ClearDepth(cmd, depth);
            Image old_image = texture.image;
            Image old_depth = texture.depth;
            DeferDestroy([old_image, old_depth]() mutable {
                DestroyImage(old_image);
                DestroyImage(old_depth);
            });
            texture.image = image;
            texture.depth = depth;
            WriteTextureDescriptor(slot, image.view);
        }
    });
}

} // namespace detail

using namespace detail;

TextureHandle CreateTexture(const TextureDesc &desc) {
    if (!CheckSize(desc.width, desc.height)) {
        return kNullTexture;
    }
    uint32_t max_mips = std::bit_width(std::max(desc.width, desc.height));
    if (desc.mip_levels == 0 || desc.mip_levels > max_mips) {
        Error("texture %ux%u cannot have %u mip levels", desc.width, desc.height, desc.mip_levels);
        return kNullTexture;
    }
    uint32_t slot = AllocateTextureSlot();
    if (slot == 0) {
        Error("out of texture slots (%u)", kMaxTextures);
        return kNullTexture;
    }
    Texture &texture = g.textures[slot];
    texture.live = true;
    texture.generation = NextGeneration(texture.generation);
    texture.desc = desc;
    texture.render_target = false;
    texture.logical_width = desc.width;
    texture.logical_height = desc.height;
    texture.last_draw_use = 0;
    texture.image = CreateImage(desc.width, desc.height, desc.mip_levels, VulkanFormat(desc.format),
                                VK_IMAGE_USAGE_SAMPLED_BIT | VK_IMAGE_USAGE_TRANSFER_DST_BIT |
                                    VK_IMAGE_USAGE_TRANSFER_SRC_BIT);
    ClearImage(UploadCommands(), texture.image, VkClearColorValue{});
    WriteTextureDescriptor(slot, texture.image.view);
    return MakeHandle(texture.generation, slot);
}

TextureHandle CreatePalette() { return CreateTexture(TextureDesc{256, 1, TextureFormat::Rgba8, 1, true}); }

TextureHandle CreateRenderTarget(uint32_t logical_width, uint32_t logical_height, bool has_alpha) {
    uint32_t width = ScaledSize(logical_width, g.render_scale);
    uint32_t height = ScaledSize(logical_height, g.render_scale);
    if (logical_width == 0 || logical_height == 0 || !CheckSize(width, height)) {
        return kNullTexture;
    }
    uint32_t slot = AllocateTextureSlot();
    if (slot == 0) {
        Error("out of texture slots (%u)", kMaxTextures);
        return kNullTexture;
    }
    Texture &texture = g.textures[slot];
    texture.live = true;
    texture.generation = NextGeneration(texture.generation);
    texture.desc = TextureDesc{logical_width, logical_height, TextureFormat::Rgba8, 1, has_alpha};
    texture.render_target = true;
    texture.logical_width = logical_width;
    texture.logical_height = logical_height;
    texture.last_draw_use = 0;
    texture.image = CreateTargetImage(width, height);
    texture.depth = CreateTargetDepth(width, height);
    VkCommandBuffer cmd = UploadCommands();
    ClearImage(cmd, texture.image,
               VkClearColorValue{
                   {0.0f, 0.0f, 0.0f, 1.0f}
    });
    ClearDepth(cmd, texture.depth);
    WriteTextureDescriptor(slot, texture.image.view);
    return MakeHandle(texture.generation, slot);
}

TextureHandle NamedRenderTarget(std::string_view name, uint32_t logical_width, uint32_t logical_height,
                                bool has_alpha) {
    TextureHandle existing = FindNamedRenderTarget(name);
    if (existing != kNullTexture) {
        const Texture &texture = *LookupTexture(existing);
        if (texture.logical_width == logical_width && texture.logical_height == logical_height &&
            texture.desc.has_alpha == has_alpha) {
            return existing;
        }
        DestroyTexture(existing);
    }
    TextureHandle created = CreateRenderTarget(logical_width, logical_height, has_alpha);
    if (created != kNullTexture) {
        g.named_targets.emplace(std::string(name), created);
    }
    return created;
}

TextureHandle FindNamedRenderTarget(std::string_view name) {
    auto it = g.named_targets.find(name);
    return it == g.named_targets.end() ? kNullTexture : it->second;
}

void DestroyTexture(TextureHandle handle) {
    Texture *texture = LookupTexture(handle);
    if (texture == nullptr) {
        return;
    }
    std::erase_if(g.named_targets, [handle](const auto &entry) { return entry.second == handle; });
    if (g.target == handle) {
        SetRenderTarget(kMainTarget);
    }
    uint32_t slot = handle & kSlotMask;
    Image    image = texture->image;
    Image    depth = texture->depth;
    texture->live = false;
    texture->image = {};
    texture->depth = {};
    DeferDestroy([slot, image, depth]() mutable {
        WriteTextureDescriptor(slot, g.textures[0].image.view);
        DestroyImage(image);
        DestroyImage(depth);
        g.free_texture_slots.push_back(slot);
    });
}

bool UpdateTexture(TextureHandle handle, uint32_t mip, uint32_t x, uint32_t y, uint32_t w, uint32_t h,
                   const void *pixels, uint32_t row_length) {
    Texture *texture = LookupTexture(handle);
    if (texture == nullptr || pixels == nullptr) {
        Error("UpdateTexture: no texture %#x", handle);
        return false;
    }
    Image   &image = texture->image;
    uint32_t mip_width = std::max(1u, image.width >> mip);
    uint32_t mip_height = std::max(1u, image.height >> mip);
    if (mip >= image.mips || w == 0 || h == 0 || x + w > mip_width || y + h > mip_height) {
        Error("UpdateTexture: %ux%u at %u,%u is outside mip %u of %ux%u", w, h, x, y, mip, mip_width,
              mip_height);
        return false;
    }
    uint32_t texel = TexelSize(texture->desc.format);
    uint32_t stride = (row_length ? row_length : w) * texel;
    uint32_t row = w * texel;

    TransientSpan staging = AllocateTransient(static_cast<VkDeviceSize>(row) * h, 16);
    for (uint32_t i = 0; i < h; i++) {
        std::memcpy(staging.data + static_cast<size_t>(i) * row,
                    static_cast<const uint8_t *>(pixels) + static_cast<size_t>(i) * stride, row);
    }

    VkCommandBuffer cmd = CommandsForWrite(texture->last_draw_use);
    Transition(cmd, image, TransferDst());
    VkBufferImageCopy region = {};
    region.bufferOffset = staging.offset;
    region.imageSubresource = {VK_IMAGE_ASPECT_COLOR_BIT, mip, 0, 1};
    region.imageOffset = {static_cast<int32_t>(x), static_cast<int32_t>(y), 0};
    region.imageExtent = {w, h, 1};
    vkCmdCopyBufferToImage(cmd, staging.buffer, image.image, VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, 1,
                           &region);
    ToRest(cmd, image);
    return true;
}

bool UpdatePalette(TextureHandle palette, const uint32_t *rgba, uint32_t first, uint32_t count) {
    if (first + count > 256) {
        Error("UpdatePalette: entries %u..%u are past 256", first, first + count);
        return false;
    }
    return UpdateTexture(palette, 0, first, 0, count, 1, rgba);
}

std::optional<TextureInfo> GetTextureInfo(TextureHandle handle) {
    if (handle == kMainTarget || handle == kPreviousFrame) {
        const Image &image = *ColorImageOf(handle);
        return TextureInfo{static_cast<uint32_t>(kLogicalWidth),
                           static_cast<uint32_t>(kLogicalHeight),
                           image.width,
                           image.height,
                           TextureFormat::Rgba8,
                           1,
                           true,
                           true};
    }
    Texture *texture = LookupTexture(handle);
    if (texture == nullptr) {
        return std::nullopt;
    }
    return TextureInfo{texture->logical_width, texture->logical_height, texture->image.width,
                       texture->image.height, texture->desc.format, texture->desc.mip_levels,
                       texture->desc.has_alpha, texture->render_target};
}

void ConvertPs2Alpha(uint32_t *rgba, size_t count) {
    uint8_t *bytes = reinterpret_cast<uint8_t *>(rgba);
    for (size_t i = 0; i < count; i++) {
        uint8_t &alpha = bytes[i * 4 + 3];
        alpha = static_cast<uint8_t>(std::min(alpha * 2, 255));
    }
}

MeshHandle CreateMesh(std::span<const Vertex3D> vertices, std::span<const uint32_t> indices) {
    if (vertices.empty() || indices.empty()) {
        Error("CreateMesh: empty mesh");
        return kNullMesh;
    }
    uint32_t slot;
    if (!g.free_mesh_slots.empty()) {
        slot = g.free_mesh_slots.back();
        g.free_mesh_slots.pop_back();
    } else if (g.meshes.size() < kMaxMeshes) {
        g.meshes.emplace_back();
        slot = static_cast<uint32_t>(g.meshes.size() - 1);
    } else {
        Error("out of mesh slots (%u)", kMaxMeshes);
        return kNullMesh;
    }
    Mesh        &mesh = g.meshes[slot];
    VkDeviceSize vertex_bytes = vertices.size_bytes();
    VkDeviceSize index_bytes = indices.size_bytes();
    mesh.live = true;
    mesh.generation = NextGeneration(mesh.generation);
    mesh.vertex_count = static_cast<uint32_t>(vertices.size());
    mesh.index_count = static_cast<uint32_t>(indices.size());
    mesh.last_draw_use = 0;
    mesh.buffer = CreateBuffer(vertex_bytes + index_bytes,
                               VK_BUFFER_USAGE_VERTEX_BUFFER_BIT | VK_BUFFER_USAGE_INDEX_BUFFER_BIT |
                                   VK_BUFFER_USAGE_TRANSFER_DST_BIT,
                               false);
    UploadToBuffer(mesh, 0, vertices.data(), vertex_bytes);
    UploadToBuffer(mesh, vertex_bytes, indices.data(), index_bytes);
    return MakeHandle(mesh.generation, slot);
}

bool UpdateMeshVertices(MeshHandle handle, uint32_t first, std::span<const Vertex3D> vertices) {
    Mesh *mesh = LookupMesh(handle);
    if (mesh == nullptr || first + vertices.size() > mesh->vertex_count) {
        Error("UpdateMeshVertices: bad mesh %#x or range", handle);
        return false;
    }
    if (!vertices.empty()) {
        UploadToBuffer(*mesh, first * sizeof(Vertex3D), vertices.data(), vertices.size_bytes());
    }
    return true;
}

void DestroyMesh(MeshHandle handle) {
    Mesh *mesh = LookupMesh(handle);
    if (mesh == nullptr) {
        return;
    }
    uint32_t slot = handle & kSlotMask;
    Buffer   buffer = mesh->buffer;
    mesh->live = false;
    mesh->buffer = {};
    DeferDestroy([slot, buffer]() mutable {
        DestroyBuffer(buffer);
        g.free_mesh_slots.push_back(slot);
    });
}

} // namespace gfx
