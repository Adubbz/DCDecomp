#include <gtest/gtest.h>

#include <cstdint>
#include <cstring>
#include <vector>

#include "bits64_fixture.hpp"
#include "collision.hpp"
#include "collisionmdt.hpp"
#include "dataalloc.hpp"
#include "mds.hpp"
#include "mdt.hpp"

namespace {

constexpr std::uint32_t kVertices = 0x40;
constexpr std::uint32_t kMesh = 0x80;
constexpr int           kPolyCount = 2;

// A floor square of side 162 at y 0, as a dungeon part's first two triangles: the first one's
// first corner is the far x edge, which a collision written over it would move to x 0.
const float kCorners[4][4] = {
    {81.0f,  0.0f, -81.0f, 1.0f},
    {-81.0f, 0.0f, -81.0f, 1.0f},
    {-81.0f, 0.0f, 81.0f,  1.0f},
    {81.0f,  0.0f, 81.0f,  1.0f},
};

std::vector<u_long128> DiscModel() {
    std::uint32_t          size = kMesh + 0x18 + kPolyCount * sizeof(MDT_CPOLY);
    std::vector<u_long128> quads((size + 15) / 16 + 1);
    auto                  *bytes = reinterpret_cast<unsigned char *>(quads.data());
    auto                  *header = reinterpret_cast<MDT_HEADER *>(bytes);
    header->size = size;
    header->vertex_num = 4;
    header->vertex_ofs = kVertices;
    header->mesh_ofs = kMesh;
    header->info_ofs = 0;
    std::memcpy(bytes + kVertices, kCorners, sizeof(kCorners));
    auto *mesh = reinterpret_cast<MDT_COLLISION *>(bytes + kMesh);
    mesh->set.num = kPolyCount;
    const int corners[kPolyCount][3] = {
        {0, 1, 2},
        {0, 2, 3}
    };
    for (int i = 0; i < kPolyCount; i++) {
        std::memcpy(mesh->set.poly[i].vertex, corners[i], sizeof(corners[i]));
        mesh->set.poly[i].info_index = -1;
    }
    return quads;
}

using dc::test::Arena;

} // namespace

TEST(Bits64Collisionmdt, BuildKeepsTheFirstTriangle) {
    std::vector<u_long128> disc = DiscModel();
    Arena                  arena(1024);
    CCollisionMDT         *collision = CreateCollisionMDT(reinterpret_cast<u_int *>(disc.data()), &arena.alloc);

    ASSERT_TRUE(collision->mesh_count == kPolyCount);
    ASSERT_TRUE(reinterpret_cast<u_char *>(collision->mesh) >= reinterpret_cast<u_char *>(collision + 1));
    for (int i = 0; i < 3; i++) {
        ASSERT_TRUE(collision->mesh[0].poly.vertex[0][i] == kCorners[0][i]);
    }
    ASSERT_TRUE(collision->mesh[0].box.max[0] == 81.0f && collision->mesh[0].box.min[0] == -81.0f);
}

// MoveCheck's ground probe on the triangles a box pick hands back finds the floor over the first
// triangle's whole area, here just inside its far x edge.
TEST(Bits64Collisionmdt, GroundUnderTheFirstTriangle) {
    std::vector<u_long128> disc = DiscModel();
    Arena                  arena(1024);
    CCollisionMDT         *collision = CreateCollisionMDT(reinterpret_cast<u_int *>(disc.data()), &arena.alloc);

    CBoxVu0 box = {
        {20.0f, 20.0f,  -40.0f, 1.0f},
        {0.0f,  -40.0f, -79.0f, 1.0f}
    };
    CCPoly polys[kPolyCount];
    int    count = collision->PickUpNearPoly(polys, box);
    ASSERT_TRUE(count == kPolyCount);

    sceVu0FVECTOR probe = {10.0f, 4.0f, -60.0f, 1.0f};
    sceVu0FVECTOR ground = {};
    CCPoly        foot;
    ASSERT_TRUE(GetFootPoly(probe, 15.0f, &foot, ground, polys, count, 1) == 1);
    ASSERT_TRUE(ground[1] == 0.0f);
}
