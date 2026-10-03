#include <gtest/gtest.h>
#include <libvu0.h>

#include <cstddef>
#include <cstring>

#include "../shadowclip.hpp"
#include "mdt.hpp"
#include "renderinfo.hpp"

namespace {

// An MDT with four vertices and a shadow section of two shapes: a triangle facing the light (up,
// as the light points down) and its reverse in the first, one facing away in the second.
struct alignas(16) ShadowModel {
    MDT_HEADER    header;
    sceVu0FVECTOR vertex[4];
    int           shadow[4];
    int           shape0[3];
    MDT_SVERTEX   corner0[6];
    int           shape1[3];
    MDT_SVERTEX   corner1[3];
};

ShadowModel &BuildModel() {
    static ShadowModel m;
    std::memset(&m, 0, sizeof(m));
    m.header.vertex_num = 4;
    m.header.vertex_ofs = offsetof(ShadowModel, vertex);
    m.header.mesh_ofs = offsetof(ShadowModel, shadow);
    const float vertices[4][4] = {
        {0, 0, 5, 1},
        {1, 0, 5, 1},
        {0, 0, 6, 1},
        {1, 0, 8, 1}
    };
    std::memcpy(m.vertex, vertices, sizeof(vertices));
    m.shadow[2] = 2;
    m.shape0[1] = 6;
    const int first[6] = {0, 1, 2, 0, 2, 1};
    for (int i = 0; i < 6; i++) {
        m.corner0[i].index = first[i];
        m.corner0[i].edge = i & 1;
    }
    m.shape1[1] = 3;
    m.corner1[0].index = 0;
    m.corner1[1].index = 3;
    m.corner1[2].index = 1;
    m.corner1[2].edge = 1;
    return m;
}

RenderInfo &BuildInfo(float near_z) {
    static RenderInfo info;
    sceVu0UnitMatrix(info.view_scaled);
    sceVu0UnitMatrix(info.perspective);
    std::memset(info.light_direction, 0, sizeof(info.light_direction));
    info.light_direction[1][0] = -1.0f;
    const float point[4] = {0.0f, -10.0f, 0.0f, 1.0f};
    const float normal[4] = {0.0f, 1.0f, 0.0f, 0.0f};
    std::memcpy(info.shadow_point, point, sizeof(point));
    std::memcpy(info.shadow_normal, normal, sizeof(normal));
    info.near[2] = near_z;
    return info;
}

} // namespace

// Only triangles with face . light <= 0 come out, in shape order, with their corners' edge flags,
// the model-space corners a, b, c, c and, clear of the near plane, a cap of five copies of a.
TEST(MathShadowclip, SelectsAndCopies) {
    ShadowModel  &model = BuildModel();
    RenderInfo   &info = BuildInfo(1.0f);
    sceVu0FMATRIX matrix;
    sceVu0UnitMatrix(matrix);

    ShadowClipTriangle out[4];
    ASSERT_TRUE(ShadowClipBuild(out, 4, (unsigned int *) &model, &info, matrix, 0) == 2);

    ASSERT_TRUE(out[0].edges[0] == 1 && out[0].edges[1] == 0 && out[0].edges[2] == 1 && out[0].edges[3] == 0);
    ASSERT_TRUE(std::memcmp(out[0].local[0], model.vertex[0], 16) == 0);
    ASSERT_TRUE(std::memcmp(out[0].local[1], model.vertex[2], 16) == 0);
    ASSERT_TRUE(std::memcmp(out[0].local[2], model.vertex[1], 16) == 0);
    ASSERT_TRUE(std::memcmp(out[0].local[3], model.vertex[1], 16) == 0);
    ASSERT_TRUE(out[0].counts[0] == 0 && out[0].counts[1] == 0 && out[0].counts[2] == 0 && out[0].counts[3] == 1);
    for (int k = 0; k < 5; k++) {
        ASSERT_TRUE(std::memcmp(out[0].cap[k], model.vertex[0], 16) == 0);
    }

    ASSERT_TRUE(out[1].edges[0] == 0 && out[1].edges[2] == 1);
    ASSERT_TRUE(std::memcmp(out[1].local[1], model.vertex[3], 16) == 0);

    ASSERT_TRUE(ShadowClipBuild(out, 1, (unsigned int *) &model, &info, matrix, 0) == 2);
    ASSERT_TRUE(ShadowClipBuild(out, 4, nullptr, &info, matrix, 0) == 0);
}

// A triangle straddling the near plane (z 5 and 6 about 5.5) gives a four-point cap on the plane;
// with an identity perspective the cap is in eye space. Pass 1 zeroes the counts and repeats the
// last cap entry of pass 0.
TEST(MathShadowclip, NearCap) {
    ShadowModel  &model = BuildModel();
    RenderInfo   &info = BuildInfo(5.5f);
    sceVu0FMATRIX matrix;
    sceVu0UnitMatrix(matrix);

    ShadowClipTriangle first[2];
    ASSERT_TRUE(ShadowClipBuild(first, 2, (unsigned int *) &model, &info, matrix, 0) == 2);
    ASSERT_TRUE(first[0].counts[0] == 4 && first[0].counts[1] == 0 && first[0].counts[3] == 1);
    for (int k = 0; k < 5; k++) {
        ASSERT_TRUE(first[0].cap[k][2] == 5.5f);
        ASSERT_TRUE(first[0].cap[k][3] == 1.0f);
    }

    ShadowClipTriangle second[2];
    ASSERT_TRUE(ShadowClipBuild(second, 2, (unsigned int *) &model, &info, matrix, 1) == 2);
    ASSERT_TRUE(second[0].counts[0] == 0 && second[0].counts[1] == 0 && second[0].counts[3] == 1);
    for (int k = 0; k < 5; k++) {
        ASSERT_TRUE(std::memcmp(second[0].cap[k], first[0].cap[4], 16) == 0);
    }
    ASSERT_TRUE(std::memcmp(second[0].local, first[0].local, sizeof(first[0].local)) == 0);
}
