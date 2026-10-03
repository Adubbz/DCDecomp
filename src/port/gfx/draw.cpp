#include <algorithm>
#include <cmath>
#include <cstring>

#include "context.hpp"
#include "displaylist.hpp"

namespace gfx {

namespace detail {

namespace {

constexpr uint32_t kSlotMask = 0xFFFF;

struct Target {
    Image         *color = nullptr;
    Image         *depth = nullptr;
    Texture       *texture = nullptr;
    LogicalMapping mapping = {};
    bool           has_alpha = true;
};

Target ResolveTarget(TextureHandle handle) {
    Target target;
    if (handle == kMainTarget) {
        target.color = &MainColorTarget();
        target.depth = &MainDepth();
        target.mapping = MainMapping(target.color->width, target.color->height);
        return target;
    }
    Texture *texture = LookupTexture(handle);
    if (texture != nullptr && texture->render_target) {
        target.color = &texture->image;
        target.depth = texture->shares_main_depth ? &MainDepth() : &texture->depth;
        target.texture = texture;
        target.mapping = TextureMapping(*texture);
        target.has_alpha = texture->desc.has_alpha;
    }
    return target;
}

ImageState ColorAttachment() {
    return {VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL, VK_PIPELINE_STAGE_2_COLOR_ATTACHMENT_OUTPUT_BIT,
            VK_ACCESS_2_COLOR_ATTACHMENT_READ_BIT | VK_ACCESS_2_COLOR_ATTACHMENT_WRITE_BIT};
}

ImageState DepthAttachment() {
    return {VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL,
            VK_PIPELINE_STAGE_2_EARLY_FRAGMENT_TESTS_BIT | VK_PIPELINE_STAGE_2_LATE_FRAGMENT_TESTS_BIT,
            VK_ACCESS_2_DEPTH_STENCIL_ATTACHMENT_READ_BIT | VK_ACCESS_2_DEPTH_STENCIL_ATTACHMENT_WRITE_BIT};
}

void EnsureRendering(Target &target) {
    target = ResolveTarget(g.target);
    if (target.color == nullptr) {
        g.target = kMainTarget;
        target = ResolveTarget(g.target);
    }
    if (g.rendering) {
        return;
    }
    VkCommandBuffer cmd = DrawCommands();
    Transition(cmd, *target.color, ColorAttachment());
    Transition(cmd, *target.depth, DepthAttachment());
    if (target.texture != nullptr) {
        target.texture->last_draw_use = g.frame_serial;
    }

    VkRenderingAttachmentInfo color = {};
    color.sType = VK_STRUCTURE_TYPE_RENDERING_ATTACHMENT_INFO;
    color.imageView = target.color->view;
    color.imageLayout = VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL;
    color.loadOp = VK_ATTACHMENT_LOAD_OP_LOAD;
    color.storeOp = VK_ATTACHMENT_STORE_OP_STORE;
    VkRenderingAttachmentInfo depth = color;
    depth.imageView = target.depth->view;
    depth.imageLayout = VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL;

    VkRenderingInfo info = {};
    info.sType = VK_STRUCTURE_TYPE_RENDERING_INFO;
    info.renderArea.extent = {target.color->width, target.color->height};
    info.layerCount = 1;
    info.colorAttachmentCount = 1;
    info.pColorAttachments = &color;
    info.pDepthAttachment = &depth;
    info.pStencilAttachment = &depth;
    vkCmdBeginRendering(cmd, &info);
    g.rendering = true;

    VkViewport viewport = {
        0.0f, 0.0f, static_cast<float>(target.color->width), static_cast<float>(target.color->height),
        0.0f, 1.0f};
    vkCmdSetViewport(cmd, 0, 1, &viewport);
    g.bound.scissor = {
        {-1, -1},
        {0,  0 }
    };
}

VkRect2D PixelRect(const LogicalMapping &mapping, const LogicalRect &rect) {
    float x0 = std::clamp(std::floor(rect.x * mapping.scale_x + mapping.offset_x), 0.0f,
                          static_cast<float>(mapping.pixel_width));
    float y0 = std::clamp(std::floor(rect.y * mapping.scale_y + mapping.offset_y), 0.0f,
                          static_cast<float>(mapping.pixel_height));
    float x1 = std::clamp(std::ceil((rect.x + rect.w) * mapping.scale_x + mapping.offset_x), x0,
                          static_cast<float>(mapping.pixel_width));
    float y1 = std::clamp(std::ceil((rect.y + rect.h) * mapping.scale_y + mapping.offset_y), y0,
                          static_cast<float>(mapping.pixel_height));
    return VkRect2D{
        {static_cast<int32_t>(x0),       static_cast<int32_t>(y0)      },
        {static_cast<uint32_t>(x1 - x0), static_cast<uint32_t>(y1 - y0)}
    };
}

bool SameRect(const VkRect2D &a, const VkRect2D &b) {
    return a.offset.x == b.offset.x && a.offset.y == b.offset.y && a.extent.width == b.extent.width &&
           a.extent.height == b.extent.height;
}

VkStencilOp StencilOpOf(StencilOp op) { return static_cast<VkStencilOp>(op); }

int PackStencilOps(const StencilFace &face) {
    return static_cast<int>(face.compare) | static_cast<int>(face.fail) << 4 |
           static_cast<int>(face.pass) << 8 | static_cast<int>(face.depth_fail) << 12;
}

// masks gives the reference and the compare and write masks, which a portability-subset device
// without separateStencilMaskRef needs equal on both faces.
void SetStencilFace(VkCommandBuffer cmd, uint32_t index, const StencilFace &face, const StencilFace &masks) {
    VkStencilFaceFlags flags = index == 0 ? VK_STENCIL_FACE_FRONT_BIT : VK_STENCIL_FACE_BACK_BIT;
    int                ops = PackStencilOps(face);
    if (g.bound.stencil_ops[index] != ops) {
        g.bound.stencil_ops[index] = ops;
        vkCmdSetStencilOp(cmd, flags, StencilOpOf(face.fail), StencilOpOf(face.pass), StencilOpOf(face.depth_fail),
                          static_cast<VkCompareOp>(face.compare));
    }
    if (g.bound.stencil_reference[index] != masks.reference) {
        g.bound.stencil_reference[index] = masks.reference;
        vkCmdSetStencilReference(cmd, flags, masks.reference);
    }
    if (g.bound.stencil_compare_mask[index] != masks.compare_mask) {
        g.bound.stencil_compare_mask[index] = masks.compare_mask;
        vkCmdSetStencilCompareMask(cmd, flags, masks.compare_mask);
    }
    if (g.bound.stencil_write_mask[index] != masks.write_mask) {
        g.bound.stencil_write_mask[index] = masks.write_mask;
        vkCmdSetStencilWriteMask(cmd, flags, masks.write_mask);
    }
}

VkCompareOp DepthOp(DepthTest test) {
    switch (test) {
        case DepthTest::Never:
            return VK_COMPARE_OP_NEVER;
        case DepthTest::Always:
            return VK_COMPARE_OP_ALWAYS;
        case DepthTest::GEqual:
            return VK_COMPARE_OP_GREATER_OR_EQUAL;
        default:
            return VK_COMPARE_OP_GREATER;
    }
}

// Resolves the binding and the state into push constants and binds the pipeline and dynamic
// state. False when the draw must be dropped.
bool Prepare(PipelineFamily family, VkPrimitiveTopology topology, const TextureBinding &binding,
             const DrawState &state, PushConstants &push) {
    if (!g.in_frame) {
        return false;
    }
    std::memset(&push, 0, sizeof(push));
    push.uv_xform[0] = 1.0f;
    push.uv_xform[1] = 1.0f;

    TextureMode mode = kTextureNone;
    bool        texa = false;
    if (binding.texture != kNullTexture) {
        if (binding.texture == kMainTarget || binding.texture == g.target) {
            Error("a draw samples the target it renders to; snapshot it first");
            return false;
        }
        if (binding.texture == kPreviousFrame) {
            const Image   &image = PreviousFrameImage();
            LogicalMapping mapping = MainMapping(image.width, image.height);
            float          width = static_cast<float>(image.width);
            float          height = static_cast<float>(image.height);
            mode = kTextureRgba;
            push.texture_slot = PreviousFrameSlot();
            if (family != kFamilyMesh) {
                push.uv_xform[0] = mapping.scale_x / width;
                push.uv_xform[1] = mapping.scale_y / height;
                push.uv_xform[2] = mapping.offset_x / width;
                push.uv_xform[3] = mapping.offset_y / height;
            }
        } else {
            Texture *texture = LookupTexture(binding.texture);
            if (texture == nullptr) {
                Error("a draw names texture %#x, which does not exist", binding.texture);
                return false;
            }
            texture->last_draw_use = g.frame_serial;
            push.texture_slot = binding.texture & kSlotMask;
            if (family != kFamilyMesh) {
                // Logical texels land on the image through its mapping, letterbox offset included.
                LogicalMapping mapping = TextureMapping(*texture);
                float          width = static_cast<float>(texture->image.width);
                float          height = static_cast<float>(texture->image.height);
                push.uv_xform[0] = mapping.scale_x / width;
                push.uv_xform[1] = mapping.scale_y / height;
                push.uv_xform[2] = mapping.offset_x / width;
                push.uv_xform[3] = mapping.offset_y / height;
            }
            if (texture->desc.format == TextureFormat::Index8) {
                Texture *palette = LookupTexture(binding.palette);
                if (palette == nullptr || palette->desc.format != TextureFormat::Rgba8) {
                    Error("index texture %#x is drawn without a palette", binding.texture);
                    return false;
                }
                palette->last_draw_use = g.frame_serial;
                push.palette_slot = binding.palette & kSlotMask;
                mode = kTexturePalette;
            } else {
                mode = kTextureRgba;
                texa = !texture->desc.has_alpha;
            }
        }
    }

    Target target;
    EnsureRendering(target);
    VkCommandBuffer cmd = DrawCommands();

    BlendMapping blend = MapBlend(state.alpha, state.blend);
    uint32_t     pipeline = !g.dynamic_color_write_mask && state.color_write_mask == 0
                                ? NoColorPipelineIndex(family, mode, state.alpha_test)
                                : PipelineIndex(family, blend.slot, mode, state.alpha_test);
    if (g.bound.pipeline != g.pipelines[pipeline]) {
        g.bound.pipeline = g.pipelines[pipeline];
        vkCmdBindPipeline(cmd, VK_PIPELINE_BIND_POINT_GRAPHICS, g.bound.pipeline);
    }

    const LogicalMapping &mapping = target.mapping;
    push.xform[0] = 2.0f * mapping.scale_x / static_cast<float>(mapping.pixel_width);
    push.xform[1] = 2.0f * mapping.scale_y / static_cast<float>(mapping.pixel_height);
    push.xform[2] = 2.0f * mapping.offset_x / static_cast<float>(mapping.pixel_width) - 1.0f;
    push.xform[3] = 2.0f * mapping.offset_y / static_cast<float>(mapping.pixel_height) - 1.0f;
    // Index textures are looked up texel by texel in the shader, so their sampler never filters.
    Filter filter = mode == kTexturePalette ? Filter::Nearest : binding.filter;
    push.sampler_slot = SamplerIndex(filter, binding.wrap_u, binding.wrap_v);
    push.flags = static_cast<uint32_t>(blend.transform) << kPushTransformShift;
    if (state.fog) {
        push.flags |= kPushFog;
    }
    if (texa) {
        push.flags |= kPushTexa | (state.texa_aem ? kPushAem : 0);
    }
    if (!target.has_alpha) {
        push.flags |= kPushOpaqueTarget;
    }
    if (blend.fix) {
        push.flags |= kPushFactorFix;
    }
    if (binding.filter == Filter::Linear) {
        push.flags |= kPushLinear;
    }
    push.alpha = state.alpha_ref | (static_cast<uint32_t>(state.alpha_func) & 7) << 8 |
                 static_cast<uint32_t>(state.alpha.fix) << 16 | static_cast<uint32_t>(state.texa_ta0) << 24;
    push.fog_color = state.fog_color[0] | state.fog_color[1] << 8 | state.fog_color[2] << 16;
    vkCmdPushConstants(cmd, g.pipeline_layout, VK_SHADER_STAGE_VERTEX_BIT | VK_SHADER_STAGE_FRAGMENT_BIT, 0,
                       sizeof(push), &push);

    int cull = static_cast<int>(state.cull);
    if (g.bound.cull != cull) {
        g.bound.cull = cull;
        vkCmdSetCullMode(cmd, state.cull == CullMode::None   ? VK_CULL_MODE_NONE
                              : state.cull == CullMode::Back ? VK_CULL_MODE_BACK_BIT
                                                             : VK_CULL_MODE_FRONT_BIT);
    }
    // An always-passing test that writes nothing is the same as no test, and cheaper.
    int test = state.depth_test == DepthTest::Always && !state.depth_write ? 0 : 1;
    int write = state.depth_write ? 1 : 0;
    int op = static_cast<int>(DepthOp(state.depth_test));
    if (g.bound.depth_test != test) {
        g.bound.depth_test = test;
        vkCmdSetDepthTestEnable(cmd, test);
    }
    if (g.bound.depth_write != write) {
        g.bound.depth_write = write;
        vkCmdSetDepthWriteEnable(cmd, write);
    }
    if (g.bound.depth_op != op) {
        g.bound.depth_op = op;
        vkCmdSetDepthCompareOp(cmd, static_cast<VkCompareOp>(op));
    }
    int stencil = state.stencil_test ? 1 : 0;
    if (g.bound.stencil_test != stencil) {
        g.bound.stencil_test = stencil;
        vkCmdSetStencilTestEnable(cmd, stencil);
    }
    // The pipelines declare every stencil parameter dynamic, so each must be set once before
    // the first draw even while the test is off.
    if (g.separate_stencil_masks) {
        SetStencilFace(cmd, 0, state.stencil_front, state.stencil_front);
        SetStencilFace(cmd, 1, state.stencil_back, state.stencil_back);
    } else {
        // The face culling leaves is the one whose masks matter; with both drawn the front's win.
        const StencilFace &masks = state.cull == CullMode::Front ? state.stencil_back : state.stencil_front;
        const StencilFace &other = state.cull == CullMode::Front ? state.stencil_front : state.stencil_back;
        static bool        warned = false;
        if (state.stencil_test && state.cull == CullMode::None && !warned &&
            (other.reference != masks.reference || other.compare_mask != masks.compare_mask ||
             other.write_mask != masks.write_mask)) {
            warned = true;
            Error("the device takes one stencil reference and mask pair for both faces; the back face "
                  "uses the front's");
        }
        SetStencilFace(cmd, 0, state.stencil_front, masks);
        SetStencilFace(cmd, 1, state.stencil_back, masks);
    }
    if (g.dynamic_color_write_mask && g.bound.color_write_mask != state.color_write_mask) {
        g.bound.color_write_mask = state.color_write_mask;
        VkColorComponentFlags mask = state.color_write_mask & kWriteRgba;
        g.cmd_set_color_write_mask(cmd, 0, 1, &mask);
    }
    if (g.bound.topology != static_cast<int>(topology)) {
        g.bound.topology = static_cast<int>(topology);
        vkCmdSetPrimitiveTopology(cmd, topology);
    }
    VkRect2D scissor = state.scissor ? PixelRect(mapping, state.scissor_rect)
                                     : VkRect2D{
                                           {0,                   0                   },
                                           {mapping.pixel_width, mapping.pixel_height}
    };
    if (!SameRect(g.bound.scissor, scissor)) {
        g.bound.scissor = scissor;
        vkCmdSetScissor(cmd, 0, 1, &scissor);
    }
    return true;
}

void BindVertices(VkBuffer buffer, VkDeviceSize offset) {
    if (g.bound.vertex_buffer != buffer || g.bound.vertex_offset != offset) {
        g.bound.vertex_buffer = buffer;
        g.bound.vertex_offset = offset;
        vkCmdBindVertexBuffers(DrawCommands(), 0, 1, &buffer, &offset);
    }
}

void BindConstants(const MeshConstants &constants) {
    TransientSpan span =
        AllocateTransient(sizeof(MeshConstants), g.properties.limits.minUniformBufferOffsetAlignment);
    std::memcpy(span.data, &constants, sizeof(MeshConstants));
    uint32_t offset = static_cast<uint32_t>(span.offset);
    vkCmdBindDescriptorSets(DrawCommands(), VK_PIPELINE_BIND_POINT_GRAPHICS, g.pipeline_layout, 1, 1,
                            &span.constants_set, 1, &offset);
}

// Pixel rectangle of a logical one on an image, for copies and blits.
bool ResolveCopyRect(TextureHandle handle, const Rect &rect, Image *&image, Texture *&texture,
                     VkOffset3D offsets[2]) {
    texture = nullptr;
    LogicalMapping mapping;
    if (handle == kMainTarget || handle == kPreviousFrame) {
        image = ColorImageOf(handle);
        mapping = MainMapping(image->width, image->height);
    } else {
        texture = LookupTexture(handle);
        if (texture == nullptr) {
            Error("copy names texture %#x, which does not exist", handle);
            return false;
        }
        image = &texture->image;
        mapping = TextureMapping(*texture);
    }
    auto x = [&](int32_t value) {
        return std::clamp(
            static_cast<int32_t>(std::lround(static_cast<float>(value) * mapping.scale_x + mapping.offset_x)),
            0, static_cast<int32_t>(image->width));
    };
    auto y = [&](int32_t value) {
        return std::clamp(
            static_cast<int32_t>(std::lround(static_cast<float>(value) * mapping.scale_y + mapping.offset_y)),
            0, static_cast<int32_t>(image->height));
    };
    offsets[0] = {x(rect.x), y(rect.y), 0};
    offsets[1] = {x(rect.x + rect.w), y(rect.y + rect.h), 1};
    return offsets[0].x != offsets[1].x && offsets[0].y != offsets[1].y;
}

VkCommandBuffer CopyCommands() {
    if (g.in_frame) {
        EndRendering();
        return DrawCommands();
    }
    return UploadCommands();
}

void MarkUsed(Texture *texture) {
    if (texture != nullptr && g.in_frame) {
        texture->last_draw_use = g.frame_serial;
    }
}

// A copy or blit from src to dst, through a scratch image when both are one image, since
// Vulkan copies within an image need GENERAL layout and must not overlap.
void Transfer(VkCommandBuffer cmd, Image &src, const VkOffset3D src_offsets[2], Image &dst,
              const VkOffset3D dst_offsets[2], VkFilter filter) {
    auto width = [](const VkOffset3D o[2]) { return std::abs(o[1].x - o[0].x); };
    auto height = [](const VkOffset3D o[2]) { return std::abs(o[1].y - o[0].y); };

    if (&src == &dst) {
        Image      scratch = CreateImage(static_cast<uint32_t>(width(src_offsets)),
                                         static_cast<uint32_t>(height(src_offsets)), 1, src.format,
                                         VK_IMAGE_USAGE_TRANSFER_SRC_BIT | VK_IMAGE_USAGE_TRANSFER_DST_BIT |
                                             VK_IMAGE_USAGE_SAMPLED_BIT);
        VkOffset3D whole[2] = {
            {0,                                   0,                                    0},
            {static_cast<int32_t>(scratch.width), static_cast<int32_t>(scratch.height), 1}
        };
        VkOffset3D ordered[2] = {
            {std::min(src_offsets[0].x, src_offsets[1].x), std::min(src_offsets[0].y, src_offsets[1].y), 0},
            {std::max(src_offsets[0].x, src_offsets[1].x), std::max(src_offsets[0].y, src_offsets[1].y), 1}
        };
        Transfer(cmd, src, ordered, scratch, whole, VK_FILTER_NEAREST);
        // Mirroring, if any, happens on the way back.
        VkOffset3D back[2] = {whole[0], whole[1]};
        if (src_offsets[1].x < src_offsets[0].x) {
            std::swap(back[0].x, back[1].x);
        }
        if (src_offsets[1].y < src_offsets[0].y) {
            std::swap(back[0].y, back[1].y);
        }
        Transfer(cmd, scratch, back, dst, dst_offsets, filter);
        DeferDestroy([scratch]() mutable { DestroyImage(scratch); });
        return;
    }

    Transition(cmd, src, TransferSrc());
    Transition(cmd, dst, TransferDst());
    bool same_size = width(src_offsets) == width(dst_offsets) && height(src_offsets) == height(dst_offsets) &&
                     src_offsets[1].x > src_offsets[0].x && src_offsets[1].y > src_offsets[0].y &&
                     dst_offsets[1].x > dst_offsets[0].x && dst_offsets[1].y > dst_offsets[0].y;
    if (same_size) {
        VkImageCopy region = {};
        region.srcSubresource = {VK_IMAGE_ASPECT_COLOR_BIT, 0, 0, 1};
        region.srcOffset = src_offsets[0];
        region.dstSubresource = {VK_IMAGE_ASPECT_COLOR_BIT, 0, 0, 1};
        region.dstOffset = dst_offsets[0];
        region.extent = {static_cast<uint32_t>(width(src_offsets)),
                         static_cast<uint32_t>(height(src_offsets)), 1};
        vkCmdCopyImage(cmd, src.image, VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL, dst.image,
                       VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, 1, &region);
    } else {
        VkImageBlit region = {};
        region.srcSubresource = {VK_IMAGE_ASPECT_COLOR_BIT, 0, 0, 1};
        region.srcOffsets[0] = src_offsets[0];
        region.srcOffsets[1] = src_offsets[1];
        region.dstSubresource = {VK_IMAGE_ASPECT_COLOR_BIT, 0, 0, 1};
        region.dstOffsets[0] = dst_offsets[0];
        region.dstOffsets[1] = dst_offsets[1];
        vkCmdBlitImage(cmd, src.image, VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL, dst.image,
                       VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, 1, &region, filter);
    }
    ToRest(cmd, src);
    ToRest(cmd, dst);
}

} // namespace

LogicalMapping MainMapping(uint32_t width, uint32_t height) {
    float w = static_cast<float>(width);
    float h = static_cast<float>(height);
    float scale = std::min(w / kLogicalWidth, h / kLogicalHeight);
    return LogicalMapping{scale,
                          scale,
                          std::floor((w - kLogicalWidth * scale) * 0.5f),
                          std::floor((h - kLogicalHeight * scale) * 0.5f),
                          width,
                          height};
}

void EndRendering() {
    if (g.rendering) {
        vkCmdEndRendering(DrawCommands());
        g.rendering = false;
    }
}

void ResetDrawState() {
    g.bound = {};
    VkCommandBuffer cmd = DrawCommands();
    vkCmdBindDescriptorSets(cmd, VK_PIPELINE_BIND_POINT_GRAPHICS, g.pipeline_layout, 0, 1, &g.texture_set, 0,
                            nullptr);
    vkCmdSetFrontFace(cmd, VK_FRONT_FACE_COUNTER_CLOCKWISE);
}

void ReleaseTarget() {
    Target target = ResolveTarget(g.target);
    if (target.texture != nullptr) {
        ToRest(DrawCommands(), *target.color);
    }
}

} // namespace detail

using namespace detail;

void SetRenderTarget(TextureHandle handle) {
    if (handle == (RecordingCalls() ? g.record_target : g.target)) {
        return;
    }
    if (handle != kMainTarget) {
        Texture *texture = LookupTexture(handle);
        if (texture == nullptr || !texture->render_target) {
            Error("SetRenderTarget: %#x is not a render target", handle);
            return;
        }
    }
    if (RecordingCalls()) {
        RecordEntry(TargetEntry{handle});
        g.record_target = handle;
        return;
    }
    if (g.in_frame) {
        EndRendering();
        ReleaseTarget();
    }
    g.target = handle;
}

TextureHandle CurrentRenderTarget() { return RecordingCalls() ? g.record_target : g.target; }

LogicalMapping GetLogicalMapping(TextureHandle handle) {
    if (handle == kMainTarget || handle == kPreviousFrame) {
        const Image &image = *ColorImageOf(handle);
        return MainMapping(image.width, image.height);
    }
    Texture *texture = LookupTexture(handle);
    if (texture == nullptr) {
        return LogicalMapping{1.0f, 1.0f, 0.0f, 0.0f, 0, 0};
    }
    return TextureMapping(*texture);
}

void Draw2D(Primitive primitive, std::span<const Vertex2D> vertices, const TextureBinding &binding,
            const DrawState &state) {
    if (vertices.empty()) {
        return;
    }
    if (RecordingCalls()) {
        RecordEntry(
            Draw2DEntry{primitive, std::vector<Vertex2D>(vertices.begin(), vertices.end()), binding, state});
        return;
    }
    bool lines = primitive == Primitive::Lines || primitive == Primitive::LineStrip;
    // VK_KHR_portability_subset may lack fans (Metal has none); the same triangles go as a list.
    bool                fan_as_list = primitive == Primitive::TriangleFan && !g.triangle_fans;
    VkPrimitiveTopology topology = VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST;
    switch (primitive) {
        case Primitive::TriangleStrip:
            topology = VK_PRIMITIVE_TOPOLOGY_TRIANGLE_STRIP;
            break;
        case Primitive::TriangleFan:
            topology = fan_as_list ? VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST : VK_PRIMITIVE_TOPOLOGY_TRIANGLE_FAN;
            break;
        case Primitive::Lines:
            topology = VK_PRIMITIVE_TOPOLOGY_LINE_LIST;
            break;
        case Primitive::LineStrip:
            topology = VK_PRIMITIVE_TOPOLOGY_LINE_STRIP;
            break;
        default:
            break;
    }
    PushConstants push;
    if (!Prepare(lines ? kFamily2DLines : kFamily2DTriangles, topology, binding, state, push)) {
        return;
    }
    VkCommandBuffer cmd = DrawCommands();
    TransientSpan   data = AllocateTransient(vertices.size_bytes(), sizeof(float));
    std::memcpy(data.data, vertices.data(), vertices.size_bytes());
    BindVertices(data.buffer, data.offset);

    if (fan_as_list) {
        uint32_t triangles = vertices.size() < 3 ? 0 : static_cast<uint32_t>(vertices.size() - 2);
        if (triangles == 0) {
            return;
        }
        TransientSpan indices = AllocateTransient(triangles * 3 * sizeof(uint32_t), sizeof(uint32_t));
        uint32_t     *index = reinterpret_cast<uint32_t *>(indices.data);
        // Vulkan's own order for fan triangle i, so interpolation rounds as the fan's would.
        for (uint32_t i = 0; i < triangles; i++) {
            index[0] = i + 1;
            index[1] = i + 2;
            index[2] = 0;
            index += 3;
        }
        vkCmdBindIndexBuffer(cmd, indices.buffer, indices.offset, VK_INDEX_TYPE_UINT32);
        vkCmdDrawIndexed(cmd, triangles * 3, 1, 0, 0, 0);
        return;
    }
    if (primitive != Primitive::Quads) {
        vkCmdDraw(cmd, static_cast<uint32_t>(vertices.size()), 1, 0, 0);
        return;
    }
    uint32_t quads = static_cast<uint32_t>(vertices.size() / 4);
    if (quads == 0) {
        return;
    }
    TransientSpan indices = AllocateTransient(quads * 6 * sizeof(uint32_t), sizeof(uint32_t));
    uint32_t     *index = reinterpret_cast<uint32_t *>(indices.data);
    for (uint32_t i = 0; i < quads; i++) {
        uint32_t base = i * 4;
        index[0] = base;
        index[1] = base + 1;
        index[2] = base + 2;
        index[3] = base;
        index[4] = base + 2;
        index[5] = base + 3;
        index += 6;
    }
    vkCmdBindIndexBuffer(cmd, indices.buffer, indices.offset, VK_INDEX_TYPE_UINT32);
    vkCmdDrawIndexed(cmd, quads * 6, 1, 0, 0, 0);
}

void DrawMesh(MeshHandle handle, uint32_t first_index, uint32_t index_count, const MeshConstants &constants,
              const TextureBinding &binding, const DrawState &state, const MeshTransform *transform) {
    Mesh *mesh = LookupMesh(handle);
    if (mesh == nullptr || first_index + index_count > mesh->index_count) {
        Error("DrawMesh: bad mesh %#x or index range", handle);
        return;
    }
    if (RecordingCalls()) {
        if (index_count != 0) {
            RecordMesh(MeshEntry{handle, first_index, index_count, {}, {}, constants, binding, state, 0},
                       transform);
        }
        return;
    }
    PushConstants push;
    if (index_count == 0 ||
        !Prepare(kFamilyMesh, VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST, binding, state, push)) {
        return;
    }
    mesh->last_draw_use = g.frame_serial;
    VkCommandBuffer cmd = DrawCommands();
    BindConstants(constants);
    BindVertices(mesh->buffer.buffer, 0);
    vkCmdBindIndexBuffer(cmd, mesh->buffer.buffer, mesh->vertex_count * sizeof(Vertex3D),
                         VK_INDEX_TYPE_UINT32);
    vkCmdDrawIndexed(cmd, index_count, 1, first_index, 0, 0);
}

void DrawMeshImmediate(std::span<const Vertex3D> vertices, std::span<const uint32_t> indices,
                       const MeshConstants &constants, const TextureBinding &binding, const DrawState &state,
                       const MeshTransform *transform) {
    if (RecordingCalls()) {
        if (!vertices.empty() && !indices.empty()) {
            MeshEntry entry{kNullMesh, 0, 0, {}, {}, constants, binding, state, 0};
            entry.index_count = static_cast<uint32_t>(indices.size());
            entry.vertices.assign(vertices.begin(), vertices.end());
            entry.indices.assign(indices.begin(), indices.end());
            RecordMesh(std::move(entry), transform);
        }
        return;
    }
    PushConstants push;
    if (vertices.empty() || indices.empty() ||
        !Prepare(kFamilyMesh, VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST, binding, state, push)) {
        return;
    }
    VkCommandBuffer cmd = DrawCommands();
    TransientSpan   vertex_data = AllocateTransient(vertices.size_bytes(), sizeof(float));
    std::memcpy(vertex_data.data, vertices.data(), vertices.size_bytes());
    TransientSpan index_data = AllocateTransient(indices.size_bytes(), sizeof(uint32_t));
    std::memcpy(index_data.data, indices.data(), indices.size_bytes());
    BindConstants(constants);
    BindVertices(vertex_data.buffer, vertex_data.offset);
    vkCmdBindIndexBuffer(cmd, index_data.buffer, index_data.offset, VK_INDEX_TYPE_UINT32);
    vkCmdDrawIndexed(cmd, static_cast<uint32_t>(indices.size()), 1, 0, 0, 0);
}

void Clear(bool clear_color, const uint8_t color[4], bool clear_depth, float depth, const LogicalRect *rect) {
    if (RecordingCalls() && (clear_color || clear_depth)) {
        ClearEntry entry;
        entry.color = clear_color;
        entry.depth = clear_depth;
        if (color != nullptr) {
            std::memcpy(entry.rgba, color, sizeof(entry.rgba));
        }
        entry.z = depth;
        entry.has_rect = rect != nullptr;
        entry.rect = rect ? *rect : LogicalRect{};
        RecordClear(entry);
        return;
    }
    if (!g.in_frame || (!clear_color && !clear_depth)) {
        return;
    }
    Target target;
    EnsureRendering(target);
    VkClearRect clear = {};
    clear.rect = rect ? PixelRect(target.mapping, *rect)
                      : VkRect2D{
                            {0,                          0                          },
                            {target.mapping.pixel_width, target.mapping.pixel_height}
    };
    clear.layerCount = 1;
    if (clear.rect.extent.width == 0 || clear.rect.extent.height == 0) {
        return;
    }
    VkClearAttachment attachments[2] = {};
    uint32_t          count = 0;
    if (clear_color) {
        float alpha = target.has_alpha ? std::min(static_cast<float>(color[3]) / 128.0f, 1.0f) : 1.0f;
        attachments[count].aspectMask = VK_IMAGE_ASPECT_COLOR_BIT;
        attachments[count].clearValue.color = {
            {color[0] / 255.0f, color[1] / 255.0f, color[2] / 255.0f, alpha}
        };
        count++;
    }
    if (clear_depth) {
        attachments[count].aspectMask = VK_IMAGE_ASPECT_DEPTH_BIT;
        attachments[count].clearValue.depthStencil = {std::clamp(depth, 0.0f, 1.0f), 0};
        count++;
    }
    vkCmdClearAttachments(DrawCommands(), count, attachments, 1, &clear);
}

void ClearStencil(uint8_t value, const LogicalRect *rect) {
    if (RecordingCalls()) {
        ClearEntry entry;
        entry.stencil = true;
        entry.stencil_value = value;
        entry.has_rect = rect != nullptr;
        entry.rect = rect ? *rect : LogicalRect{};
        RecordClear(entry);
        return;
    }
    if (!g.in_frame) {
        return;
    }
    Target target;
    EnsureRendering(target);
    VkClearRect clear = {};
    clear.rect = rect ? PixelRect(target.mapping, *rect)
                      : VkRect2D{
                            {0,                          0                          },
                            {target.mapping.pixel_width, target.mapping.pixel_height}
    };
    clear.layerCount = 1;
    if (clear.rect.extent.width == 0 || clear.rect.extent.height == 0) {
        return;
    }
    VkClearAttachment attachment = {};
    attachment.aspectMask = VK_IMAGE_ASPECT_STENCIL_BIT;
    attachment.clearValue.depthStencil = {0.0f, value};
    vkCmdClearAttachments(DrawCommands(), 1, &attachment, 1, &clear);
}

bool CopyTexture(TextureHandle src, Rect src_rect, TextureHandle dst, int32_t dst_x, int32_t dst_y) {
    Image     *src_image;
    Image     *dst_image;
    Texture   *src_texture;
    Texture   *dst_texture;
    VkOffset3D src_offsets[2];
    VkOffset3D dst_offsets[2];
    Rect       dst_rect = {dst_x, dst_y, src_rect.w, src_rect.h};
    if (src_rect.w <= 0 || src_rect.h <= 0 ||
        !ResolveCopyRect(src, src_rect, src_image, src_texture, src_offsets) ||
        !ResolveCopyRect(dst, dst_rect, dst_image, dst_texture, dst_offsets)) {
        return false;
    }
    if (src_image->format != dst_image->format) {
        Error("CopyTexture between an index and a colour texture");
        return false;
    }
    // Between images of one scale the copy is exact, clipped by whichever edge comes first;
    // between a scaled render target and a plain texture it becomes a nearest blit.
    LogicalMapping src_mapping = GetLogicalMapping(src);
    LogicalMapping dst_mapping = GetLogicalMapping(dst);
    if (src_mapping.scale_x == dst_mapping.scale_x && src_mapping.scale_y == dst_mapping.scale_y) {
        int32_t width = std::min(src_offsets[1].x - src_offsets[0].x, dst_offsets[1].x - dst_offsets[0].x);
        int32_t height = std::min(src_offsets[1].y - src_offsets[0].y, dst_offsets[1].y - dst_offsets[0].y);
        src_offsets[1] = {src_offsets[0].x + width, src_offsets[0].y + height, 1};
        dst_offsets[1] = {dst_offsets[0].x + width, dst_offsets[0].y + height, 1};
    }
    if (RecordingCalls()) {
        RecordEntry(CopyEntry{CopyEntry::Copy, src, src_rect, dst, dst_rect, Filter::Nearest});
        return true;
    }
    VkCommandBuffer cmd = CopyCommands();
    MarkUsed(src_texture);
    MarkUsed(dst_texture);
    Transfer(cmd, *src_image, src_offsets, *dst_image, dst_offsets, VK_FILTER_NEAREST);
    return true;
}

bool BlitTexture(TextureHandle src, Rect src_rect, TextureHandle dst, Rect dst_rect, Filter filter) {
    Image     *src_image;
    Image     *dst_image;
    Texture   *src_texture;
    Texture   *dst_texture;
    VkOffset3D src_offsets[2];
    VkOffset3D dst_offsets[2];
    if (!ResolveCopyRect(src, src_rect, src_image, src_texture, src_offsets) ||
        !ResolveCopyRect(dst, dst_rect, dst_image, dst_texture, dst_offsets)) {
        return false;
    }
    if (src_image->format != dst_image->format) {
        Error("BlitTexture between an index and a colour texture");
        return false;
    }
    if (RecordingCalls()) {
        RecordEntry(CopyEntry{CopyEntry::Blit, src, src_rect, dst, dst_rect, filter});
        return true;
    }
    VkFilter vk_filter =
        filter == Filter::Linear && src_image->format == kColorFormat ? VK_FILTER_LINEAR : VK_FILTER_NEAREST;
    VkCommandBuffer cmd = CopyCommands();
    MarkUsed(src_texture);
    MarkUsed(dst_texture);
    Transfer(cmd, *src_image, src_offsets, *dst_image, dst_offsets, vk_filter);
    return true;
}

bool SnapshotFrame(TextureHandle dst) {
    std::optional<TextureInfo> info = GetTextureInfo(dst);
    if (!info || dst == kMainTarget || dst == kPreviousFrame) {
        Error("SnapshotFrame: %#x is not a texture", dst);
        return false;
    }
    return BlitTexture(kMainTarget,
                       Rect{0, 0, static_cast<int32_t>(kLogicalWidth), static_cast<int32_t>(kLogicalHeight)},
                       dst, Rect{0, 0, static_cast<int32_t>(info->width), static_cast<int32_t>(info->height)},
                       Filter::Linear);
}

} // namespace gfx
