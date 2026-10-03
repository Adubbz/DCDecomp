#include <gtest/gtest.h>
#include <libvu0.h>

#include <cmath>
#include <cstddef>
#include <cstring>

#include "framevu1.hpp"
#include "gameutil.hpp"
#include "mdt.hpp"
#include "visualvu1.hpp"

namespace {

struct alignas(16) SkinModel {
    MDT_HEADER    header;
    sceVu0FVECTOR vertex[2];
};

class SkinVisual : public CVisualVu1 {
public:
    unsigned int *model;

    unsigned int *GetMDTDataAddress() override {
        return model;
    }
};

void Translation(sceVu0FMATRIX m, float x, float y, float z) {
    sceVu0UnitMatrix(m);
    m[3][0] = x;
    m[3][1] = y;
    m[3][2] = z;
}

bool Near(const float *v, float x, float y, float z, float w) {
    const float e = 1e-5f;
    return std::fabs(v[0] - x) <= e && std::fabs(v[1] - y) <= e && std::fabs(v[2] - z) <= e && std::fabs(v[3] - w) <= e;
}

} // namespace

// Frame 0 is the root, frame 1 the skinned mesh (both children of the root) sitting at z = 5, and
// frame 2 a bone bound at y = 2 that now stands at y = 2 turned 90 degrees about z. Vertex 0
// (1, 0, 0) belongs to the root and half to the bone; vertex 1 (0, 3, 0) wholly to the bone.
//
// The root driver resets the bones to identity, so vertex 0 stays put. Through the bone, a vertex
// v goes to bone * (v - (0, 2, 0)): vertex 1 lands on (-1, 2, 0); vertex 0 would land on (2, 3, 0)
// and moves half way, to (1.5, 1.5, 0). The MDT copy is the deformed vertex back in the mesh
// frame's space, so z drops by 5, and w passes through the inverse with the base vertex's 1.
TEST(MathMotion, Proc2TwoBones) {
    static CFrameVu1  frame[3];
    static SkinModel  model;
    static SkinVisual visual;

    std::memset(&model, 0, sizeof(model));
    model.header.vertex_num = 2;
    model.header.vertex_ofs = offsetof(SkinModel, vertex);
    visual.model = (unsigned int *) &model;
    frame[1].SetVisual(&visual);
    frame[1].attr.remake_pending = 0;

    sceVu0FMATRIX turned = {
        {0.0f,  1.0f, 0.0f, 0.0f},
        {-1.0f, 0.0f, 0.0f, 0.0f},
        {0.0f,  0.0f, 1.0f, 0.0f},
        {0.0f,  2.0f, 0.0f, 1.0f},
    };
    sceVu0CopyMatrix(frame[2].local, turned);

    static sceVu0FVECTOR base_vertices[2] = {
        {1.0f, 0.0f, 0.0f, 1.0f},
        {0.0f, 3.0f, 0.0f, 1.0f}
    };
    static tagFRAME_INF info[3];
    std::memset(info, 0, sizeof(info));
    info[0].parent_frame = -1;
    info[1].parent_frame = 0;
    info[1].vertex_count = 2;
    info[1].base_vertices = base_vertices;
    Translation(info[1].matrix, 0.0f, 0.0f, 5.0f);
    info[2].parent_frame = 0;

    static sceVu0FMATRIX base_matrices[3];
    sceVu0UnitMatrix(base_matrices[0]);
    sceVu0UnitMatrix(base_matrices[1]);
    Translation(base_matrices[2], 0.0f, 2.0f, 0.0f);
    static tagMOTION_TYPE motion;
    motion.base_matrices = base_matrices;

    static Mot_Key root_keys[1];
    root_keys[0].frame = 0;
    root_keys[0].value[0] = 100.0f;
    static Mot_Key bone_keys[2];
    bone_keys[0].frame = 1;
    bone_keys[0].value[0] = 100.0f;
    bone_keys[1].frame = 0;
    bone_keys[1].value[0] = 50.0f;

    static Mot_List skip;
    static Mot_List bone;
    static Mot_List root;
    root = {.frame = 1, .target = 0, .type = 0, .key_count = 1, .keys = root_keys, .next = &skip};
    skip = {.frame = 1, .target = 2, .type = MOTION_KEY_SKIP, .key_count = 2, .keys = bone_keys, .next = &bone};
    bone = {.frame = 1, .target = 2, .type = 0, .key_count = 2, .keys = bone_keys, .next = nullptr};

    ASSERT_TRUE(MotionProc2(frame, &motion, info, &root) == &skip);
    ASSERT_TRUE(frame[1].attr.remake_pending == 1);
    ASSERT_TRUE(Near(model.vertex[0], 1.0f, 0.0f, -5.0f, 1.0f));
    ASSERT_TRUE(info[0].bone_matrix[0][0] == 1.0f && info[0].bone_base_matrix[3][3] == 1.0f);

    ASSERT_TRUE(MotionProc2(frame, &motion, info, &skip) == &bone);
    ASSERT_TRUE(Near(model.vertex[1], 0.0f, 0.0f, 0.0f, 0.0f));

    ASSERT_TRUE(MotionProc2(frame, &motion, info, &bone) == nullptr);
    ASSERT_TRUE(Near(model.vertex[1], -1.0f, 2.0f, -5.0f, 1.0f));
    ASSERT_TRUE(Near(model.vertex[0], 1.5f, 1.5f, -5.0f, 1.0f));
    ASSERT_TRUE(std::memcmp(info[2].bone_matrix, turned, sizeof(turned)) == 0);
    ASSERT_TRUE(info[2].bone_base_matrix[3][1] == 2.0f);
    ASSERT_TRUE(base_vertices[1][1] == 3.0f);
}
