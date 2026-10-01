#include <cstring>
#include <optional>

#include "draw3d.hpp"
#include "mglib.hpp"
#include "renderinfo.hpp"
#include "texture.hpp"
#include "water.hpp"

// VU1 program 15 drew the CPU-built height field with FST texel coordinates into a copy of the
// frame's field: each vertex samples the copy where the vertex itself lands on the screen, shifted
// by the ripple's slope (uv_base (320, 120) plus distortion is that offset from the field's
// centre). The port draws the field from model space with the frame's mvp and computes the same
// texel per vertex from the logical frame position.

namespace {

constexpr float kFieldCentreX = 320.0f;
constexpr float kFieldCentreY = SCREEN_QUARTER_HEIGHT_F;

// The game copies the frame into "water" (dungeon) or "water_buff" (town, title) and draws with
// "work"'s TEX0, which retail's VRAM layout puts at the same address; the named copies win.
PortTextureRef FrameCopy() {
    for (const char *name : {"water", "water_buff"}) {
        gfx::TextureHandle target = gfx::FindNamedRenderTarget(name);
        if (std::optional<gfx::TextureInfo> info = gfx::GetTextureInfo(target); target != gfx::kNullTexture && info) {
            PortTextureRef ref;
            ref.binding.texture = target;
            ref.width = info->width;
            ref.height = info->height;
            ref.valid = true;
            return ref;
        }
    }
    char      name[] = "work";
    CTexture *work = TexManager.GetTexture(TexManager.GetTextureHandle(name, -1));
    return Draw3DResolveTex0(work->tex0);
}

} // namespace

int CWater::CreateVUData(unsigned int *output, RenderInfo *info) {
    if (output == nullptr || rows < 2 || columns < 2) {
        return kDraw3DBlockQuads;
    }
    Draw3DVisual &visual = Draw3DRegisterVisual(output, true);
    visual.vertex_colour = true;

    sceVu0FMATRIX local_to_world;
    sceVu0FMATRIX local_to_eye;
    frame.GetLWMatrix(local_to_world);
    Draw3DMul(local_to_eye, info->view_scaled, local_to_world);

    PortTextureRef copy = FrameCopy();
    float          inv_width = copy.valid && copy.width ? 1.0f / static_cast<float>(copy.width) : 0.0f;
    float          inv_height = copy.valid && copy.height ? 1.0f / static_cast<float>(copy.height) : 0.0f;

    sceVu0FVECTOR row_step;
    sceVu0FVECTOR column_step;
    for (int i = 0; i < 3; i++) {
        row_step[i] = (vertex[1][i] - vertex[0][i]) / static_cast<float>(rows - 1);
        column_step[i] = (vertex[2][i] - vertex[0][i]) / static_cast<float>(columns - 1);
    }
    row_step[1] = column_step[1] = 0.0f;

    uint8_t rgba[4] = {color[0], color[1], color[2], color[3]};
    float   row_f = 0.0f;
    for (int i = 0; i < rows; i++, row_f += 1.0f) {
        sceVu0FVECTOR position = {vertex[0][0] + row_f * row_step[0], vertex[0][1] + row_f * row_step[1],
                                  vertex[0][2] + row_f * row_step[2], 1.0f};
        float        *here = &height[i * columns];
        float        *above = i == 0 ? here : here - columns;
        for (int j = 0; j < columns; j++, here++, above++) {
            gfx::Vertex3D out = {};
            std::memcpy(out.position, position, sizeof(out.position));
            std::memcpy(out.color, rgba, sizeof(rgba));

            sceVu0FVECTOR eye;
            sceVu0ApplyMatrix(eye, local_to_eye, position);
            float depth = eye[2] > 1.0f ? eye[2] : 1.0f;
            float screen_x = kFieldCentreX + info->scale[0] * eye[0] / depth;
            float screen_y = kFieldCentreY + info->scale[1] * eye[1] / depth * 0.5f;
            out.uv[0] = (screen_x + distortion * (*above - *here)) * inv_width;
            out.uv[1] = (screen_y + distortion * (here[0] - here[1])) * inv_height;
            visual.vertices.push_back(out);

            // Retail transforms the cell before lifting it, so each vertex carries the height of
            // the cell before it.
            position[0] += column_step[0];
            position[2] += column_step[2];
            position[1] = *here * height_scale;
        }
    }

    for (int i = 0; i < rows - 1; i++) {
        std::vector<uint32_t> strip;
        for (int j = 0; j < columns; j++) {
            strip.push_back(static_cast<uint32_t>(i * columns + j));
            strip.push_back(static_cast<uint32_t>((i + 1) * columns + j));
        }
        size_t first = visual.indices.size();
        Draw3DStripToList(visual.indices, 0, static_cast<uint32_t>(strip.size()));
        for (size_t k = first; k < visual.indices.size(); k++) {
            visual.indices[k] = strip[visual.indices[k]];
        }
    }

    Draw3DStrip strip;
    strip.index_count = static_cast<uint32_t>(visual.indices.size());
    visual.strips.push_back(strip);
    return kDraw3DBlockQuads;
}

extern "C" int DrawVu1__6CWaterFP10RenderInfoP13sceVif1PacketP1(CWater *water, RenderInfo *info,
                                                                sceVif1Packet *draw_packet, void *parent_info) {
    if (water->CheckClip() != 0) {
        return 0;
    }
    u_int *block = water->packet[!DBuffID + 1];
    if (block == nullptr) {
        return 0;
    }

    sceGsTest test = mgPixelTest;
    test.bits.ate = 0;
    test.bits.date = 0;
    MGPortCurrent().test = test;

    sceVu0FMATRIX local_to_world;
    water->frame.GetLWMatrix(local_to_world);
    water->CreateVUData(block, &mgRenderInfo);
    info->fog_enabled = false;

    const Draw3DVisual *visual = Draw3DFindVisual(block);
    if (visual != nullptr && !visual->indices.empty()) {
        gfx::MeshConstants constants = {};
        Draw3DSceneConstants(constants, *info, local_to_world);
        constants.flags = gfx::kMeshVertexColor;
        for (float &value : constants.diffuse) {
            value = 1.0f;
        }
        gfx::DrawState      state = Draw3DState(*info, false);
        PortTextureRef      copy = FrameCopy();
        gfx::TextureBinding binding;
        if (copy.valid && copy.binding.texture != gfx::CurrentRenderTarget() && copy.binding.texture != gfx::kMainTarget) {
            binding = copy.binding;
            binding.filter = gfx::Filter::Linear;
            binding.wrap_u = gfx::Wrap::Clamp;
            binding.wrap_v = gfx::Wrap::Clamp;
        }
        gfx::DrawMeshImmediate(visual->vertices, visual->indices, constants, binding, state);
    }

    MGPortCurrent().test = mgPixelTest;
    return 0;
}
