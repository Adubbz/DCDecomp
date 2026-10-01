#include <algorithm>
#include <array>
#include <cmath>
#include <cstring>
#include <fstream>

#include "context.hpp"

namespace gfx {

namespace detail {

namespace {

// A query reads at most this many pixels on a side; at high resolutions a small logical rect
// still covers hundreds of pixels and the farthest of them is as good as the farthest of all.
constexpr uint32_t kMaxQuerySide = 64;

void HostBarrier(VkCommandBuffer cmd) {
    VkMemoryBarrier2 barrier = {};
    barrier.sType = VK_STRUCTURE_TYPE_MEMORY_BARRIER_2;
    barrier.srcStageMask = VK_PIPELINE_STAGE_2_ALL_TRANSFER_BIT;
    barrier.srcAccessMask = VK_ACCESS_2_TRANSFER_WRITE_BIT;
    barrier.dstStageMask = VK_PIPELINE_STAGE_2_HOST_BIT;
    barrier.dstAccessMask = VK_ACCESS_2_HOST_READ_BIT;
    VkDependencyInfo dependency = {};
    dependency.sType = VK_STRUCTURE_TYPE_DEPENDENCY_INFO;
    dependency.memoryBarrierCount = 1;
    dependency.pMemoryBarriers = &barrier;
    vkCmdPipelineBarrier2(cmd, &dependency);
}

bool ReadImage(Image &image, uint32_t texel_size, std::vector<uint8_t> &pixels) {
    VkDeviceSize size = static_cast<VkDeviceSize>(image.width) * image.height * texel_size;
    Buffer       buffer = CreateBuffer(size, VK_BUFFER_USAGE_TRANSFER_DST_BIT, true);
    RunOneShot([&](VkCommandBuffer cmd) {
        Transition(cmd, image, TransferSrc());
        VkBufferImageCopy region = {};
        region.imageSubresource = {VK_IMAGE_ASPECT_COLOR_BIT, 0, 0, 1};
        region.imageExtent = {image.width, image.height, 1};
        vkCmdCopyImageToBuffer(cmd, image.image, VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL, buffer.buffer, 1, &region);
        HostBarrier(cmd);
        ToRest(cmd, image);
    });
    pixels.assign(buffer.memory.mapped, buffer.memory.mapped + size);
    DestroyBuffer(buffer);
    return true;
}

uint32_t Crc32(const uint8_t *data, size_t size, uint32_t crc = 0) {
    static const std::array<uint32_t, 256> table = [] {
        std::array<uint32_t, 256> entries{};
        for (uint32_t i = 0; i < 256; i++) {
            uint32_t value = i;
            for (int bit = 0; bit < 8; bit++) {
                value = (value & 1) ? 0xEDB88320u ^ (value >> 1) : value >> 1;
            }
            entries[i] = value;
        }
        return entries;
    }();
    crc = ~crc;
    for (size_t i = 0; i < size; i++) {
        crc = table[(crc ^ data[i]) & 0xFF] ^ (crc >> 8);
    }
    return ~crc;
}

void PutBigEndian(std::vector<uint8_t> &out, uint32_t value) {
    out.push_back(static_cast<uint8_t>(value >> 24));
    out.push_back(static_cast<uint8_t>(value >> 16));
    out.push_back(static_cast<uint8_t>(value >> 8));
    out.push_back(static_cast<uint8_t>(value));
}

void PutChunk(std::vector<uint8_t> &out, const char type[4], const std::vector<uint8_t> &data) {
    PutBigEndian(out, static_cast<uint32_t>(data.size()));
    size_t start = out.size();
    out.insert(out.end(), type, type + 4);
    out.insert(out.end(), data.begin(), data.end());
    PutBigEndian(out, Crc32(out.data() + start, out.size() - start));
}

} // namespace

void RecordDepthQueries(VkCommandBuffer cmd) {
    Image         &depth = g.main_depth;
    LogicalMapping mapping = MainMapping(depth.width, depth.height);
    bool           transition = false;
    for (DepthQuery &query : g.depth_queries) {
        if (!query.queued) {
            continue;
        }
        query.queued = false;
        query.recorded = false;
        query.valid = false;
        float x0 = std::floor(query.rect.x * mapping.scale_x + mapping.offset_x);
        float y0 = std::floor(query.rect.y * mapping.scale_y + mapping.offset_y);
        float x1 = std::ceil((query.rect.x + query.rect.w) * mapping.scale_x + mapping.offset_x);
        float y1 = std::ceil((query.rect.y + query.rect.h) * mapping.scale_y + mapping.offset_y);
        x0 = std::max(x0, 0.0f);
        y0 = std::max(y0, 0.0f);
        x1 = std::min(x1, static_cast<float>(depth.width));
        y1 = std::min(y1, static_cast<float>(depth.height));
        if (x1 <= x0 || y1 <= y0) {
            continue;
        }
        uint32_t width = std::min(static_cast<uint32_t>(x1 - x0), kMaxQuerySide);
        uint32_t height = std::min(static_cast<uint32_t>(y1 - y0), kMaxQuerySide);
        int32_t  x = static_cast<int32_t>((x0 + x1) * 0.5f) - static_cast<int32_t>(width / 2);
        int32_t  y = static_cast<int32_t>((y0 + y1) * 0.5f) - static_cast<int32_t>(height / 2);
        x = std::clamp(x, 0, static_cast<int32_t>(depth.width - width));
        y = std::clamp(y, 0, static_cast<int32_t>(depth.height - height));

        TransientSpan span = AllocateTransient(static_cast<VkDeviceSize>(width) * height * sizeof(float), 16);
        if (!transition) {
            Transition(cmd, depth, TransferSrc());
            transition = true;
        }
        VkBufferImageCopy region = {};
        region.bufferOffset = span.offset;
        region.imageSubresource = {VK_IMAGE_ASPECT_DEPTH_BIT, 0, 0, 1};
        region.imageOffset = {x, y, 0};
        region.imageExtent = {width, height, 1};
        vkCmdCopyImageToBuffer(cmd, depth.image, VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL, span.buffer, 1, &region);
        query.data = span.data;
        query.texels = width * height;
        query.recorded = true;
    }
    if (transition) {
        HostBarrier(cmd);
        ToRest(cmd, depth);
        g.depth_queries_recorded = true;
    }
}

void HarvestDepthQueries() {
    for (DepthQuery &query : g.depth_queries) {
        if (!query.recorded) {
            continue;
        }
        float farthest = 1.0f;
        for (uint32_t i = 0; i < query.texels; i++) {
            float value;
            std::memcpy(&value, query.data + i * sizeof(float), sizeof(float));
            farthest = std::min(farthest, value);
        }
        query.result = farthest;
        query.valid = true;
        query.recorded = false;
        query.data = nullptr;
    }
    g.depth_queries_recorded = false;
}

} // namespace detail

using namespace detail;

void ReadDepth(uint32_t id, float x, float y, float w, float h) {
    if (id >= kDepthQueryCount) {
        Error("ReadDepth: query %u is past %u", id, kDepthQueryCount);
        return;
    }
    DepthQuery &query = g.depth_queries[id];
    query.rect = LogicalRect{x, y, w, h};
    query.queued = true;
}

std::optional<float> DepthResult(uint32_t id) {
    if (id >= kDepthQueryCount || !g.depth_queries[id].valid) {
        return std::nullopt;
    }
    return g.depth_queries[id].result;
}

bool ReadbackFrame(std::vector<uint8_t> &rgba, uint32_t &width, uint32_t &height) {
    if (g.in_frame) {
        Error("ReadbackFrame inside a frame");
        return false;
    }
    Image &image = PreviousMainColor();
    width = image.width;
    height = image.height;
    return ReadImage(image, 4, rgba);
}

bool ReadbackTexture(TextureHandle handle, std::vector<uint8_t> &pixels, uint32_t &width, uint32_t &height) {
    if (g.in_frame) {
        Error("ReadbackTexture inside a frame");
        return false;
    }
    Image *image = ColorImageOf(handle);
    if (image == nullptr) {
        Error("ReadbackTexture: no texture %#x", handle);
        return false;
    }
    width = image->width;
    height = image->height;
    return ReadImage(*image, image->format == kColorFormat ? 4 : 1, pixels);
}

bool WritePng(const std::filesystem::path &path, const uint8_t *rgba, uint32_t width, uint32_t height) {
    std::vector<uint8_t> raw;
    raw.reserve((static_cast<size_t>(width) * 3 + 1) * height);
    for (uint32_t y = 0; y < height; y++) {
        raw.push_back(0);
        const uint8_t *row = rgba + static_cast<size_t>(y) * width * 4;
        for (uint32_t x = 0; x < width; x++) {
            raw.insert(raw.end(), row + x * 4, row + x * 4 + 3);
        }
    }

    // zlib stream of stored deflate blocks: no compressor, and screenshots are for tests.
    std::vector<uint8_t> zlib = {0x78, 0x01};
    size_t               pos = 0;
    do {
        size_t length = std::min<size_t>(raw.size() - pos, 0xFFFF);
        bool   last = pos + length == raw.size();
        zlib.push_back(last ? 1 : 0);
        zlib.push_back(static_cast<uint8_t>(length));
        zlib.push_back(static_cast<uint8_t>(length >> 8));
        zlib.push_back(static_cast<uint8_t>(~length));
        zlib.push_back(static_cast<uint8_t>(~length >> 8));
        zlib.insert(zlib.end(), raw.begin() + static_cast<std::ptrdiff_t>(pos),
                    raw.begin() + static_cast<std::ptrdiff_t>(pos + length));
        pos += length;
    } while (pos < raw.size());
    uint32_t a = 1;
    uint32_t b = 0;
    for (uint8_t byte : raw) {
        a = (a + byte) % 65521;
        b = (b + a) % 65521;
    }
    PutBigEndian(zlib, (b << 16) | a);

    std::vector<uint8_t> header;
    PutBigEndian(header, width);
    PutBigEndian(header, height);
    header.insert(header.end(), {8, 2, 0, 0, 0});

    std::vector<uint8_t> png = {0x89, 'P', 'N', 'G', '\r', '\n', 0x1A, '\n'};
    PutChunk(png, "IHDR", header);
    PutChunk(png, "IDAT", zlib);
    PutChunk(png, "IEND", {});

    std::error_code error;
    if (path.has_parent_path()) {
        std::filesystem::create_directories(path.parent_path(), error);
    }
    std::ofstream file(path, std::ios::binary | std::ios::trunc);
    return file && file.write(reinterpret_cast<const char *>(png.data()), static_cast<std::streamsize>(png.size()));
}

} // namespace gfx
