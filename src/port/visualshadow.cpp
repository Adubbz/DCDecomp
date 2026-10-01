#include "visualshadow.hpp"

#include <libvu0.h>

#include <cstring>
#include <vector>

#include "dataalloc.hpp"
#include "dataset.hpp"
#include "draw3d.hpp"
#include "mdt.hpp"
#include "mglib.hpp"
#include "renderinfo.hpp"
#include "shadowclip.hpp"

// Retail's shadows are volumes VU1 extrudes from the caster down to the shadow plane and counts
// into the black shadow target with Cs + Cd on one pass and Cd - Cs on the other, depth-tested
// against the scene's Z buffer. A render target here has a depth buffer of its own, so the count
// cannot be depth-tested against the scene; what is drawn instead is the volume's far cap, the
// caster's triangles flattened onto the plane by info.shadow, added into the target. The result
// darkens the receiving plane as retail does and does not wrap onto geometry above it.

namespace {

void AddTriangle(Draw3DVisual &visual, const float *a, const float *b, const float *c) {
    for (const float *corner : {a, b, c}) {
        gfx::Vertex3D vertex = {};
        std::memcpy(vertex.position, corner, sizeof(vertex.position));
        vertex.color[0] = vertex.color[1] = vertex.color[2] = vertex.color[3] = 0x80;
        visual.indices.push_back(static_cast<uint32_t>(visual.vertices.size()));
        visual.vertices.push_back(vertex);
    }
}

void CloseStrip(Draw3DVisual &visual) {
    Draw3DStrip strip;
    strip.index_count = static_cast<uint32_t>(visual.indices.size());
    visual.strips.push_back(strip);
}

} // namespace

// The flat triangles of every shape, which the fast passes project onto the plane.
int CVisualShadow::CreateVUdataShadow(u_int *block, u_int *model_data) {
    vu_data = block;
    vu_size = kDraw3DBlockQuads;
    Draw3DVisual &visual = Draw3DRegisterVisual(block, false);

    MDT_HEADER    *model = reinterpret_cast<MDT_HEADER *>(model_data);
    MDT_SHADOW    *shadow = reinterpret_cast<MDT_SHADOW *>(reinterpret_cast<u_char *>(model) + model->mesh_ofs);
    sceVu0FVECTOR *vertices = reinterpret_cast<sceVu0FVECTOR *>(reinterpret_cast<u_char *>(model) + model->vertex_ofs);
    MDT_SVERTEX   *corner = reinterpret_cast<MDT_SVERTEX *>(shadow->shape);
    for (int shape = 0; shape < shadow->shape_num; shape++) {
        int index_num = reinterpret_cast<MDT_SSHAPE *>(corner)->index_num;
        corner = reinterpret_cast<MDT_SSHAPE *>(corner)->vertex;
        for (int emitted = 0; emitted < index_num; emitted += 3, corner += 3) {
            AddTriangle(visual, vertices[corner[0].index], vertices[corner[1].index], vertices[corner[2].index]);
        }
    }
    CloseStrip(visual);
    Draw3DFinishVisual(visual);
    return vu_size;
}

int CVisualShadow::RemakeData(u_int *block) {
    if (data == nullptr) {
        return 0;
    }
    return CreateVUdataShadow(vu_data_buffer[DBuffID], data);
}

// The triangles facing away from light 0, which is the cap the volume pass closes the shadow with,
// for this frame only.
int CVisualShadow::CreateVUdataShadowCLIP(u_int *block, u_int *model_data, RenderInfo *info, float (*matrix)[4]) {
    if (model_data == nullptr) {
        return 0;
    }
    vu_data = block;
    vu_size = kDraw3DBlockQuads;
    Draw3DVisual &visual = Draw3DRegisterVisual(block, true);

    int                             count = ShadowClipBuild(nullptr, 0, model_data, info, matrix, 0);
    std::vector<ShadowClipTriangle> triangles(static_cast<size_t>(count));
    ShadowClipBuild(triangles.data(), count, model_data, info, matrix, 0);
    for (const ShadowClipTriangle &triangle : triangles) {
        AddTriangle(visual, triangle.local[0], triangle.local[1], triangle.local[2]);
    }
    CloseStrip(visual);
    return vu_size;
}

int CVisualShadow::DrawVu1(u_int *packet, float (*matrix)[4], RenderInfo *info, VU1_PROGRAM program,
                           u_long128 *draw_state, int unknown1, int unknown2) {
    if (info->shadow_pass != 2) {
        return CVisualMDTVu1::DrawVu1(packet, matrix, info, program, draw_state, unknown1, unknown2);
    }
    u_int *saved_primary = vu_data_buffer[0];
    u_int *saved_secondary = vu_data_buffer[1];
    u_int  saved_size = vu_size;
    ActiveData->Align64();
    ActiveData->Alloc(CreateVUdataShadowCLIP(reinterpret_cast<u_int *>(ActiveData->base + ActiveData->used * 16), data,
                                             info, matrix));
    vu_data_buffer[0] = vu_data;
    vu_data_buffer[1] = vu_data;
    int result = CVisualMDTVu1::DrawVu1(packet, matrix, info, program, draw_state, unknown1, unknown2);
    vu_data_buffer[0] = saved_primary;
    vu_data_buffer[1] = saved_secondary;
    vu_size = saved_size;
    return result;
}

int CVisualShadow::DrawVu1(sceVif1Packet *packet, float (*matrix)[4], RenderInfo *info, VU1_PROGRAM program,
                           u_long128 *draw_state, int unknown1, int unknown2) {
    return CVisualShadow::DrawVu1(static_cast<u_int *>(nullptr), matrix, info, program, draw_state, unknown1, unknown2);
}
