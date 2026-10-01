#include "gfx_fixture.hpp"

using namespace dc::test;

namespace {

constexpr std::array<uint8_t, 4> kBlack = {0, 0, 0, 0x80};

gfx::MeshConstants Constants() {
    gfx::MeshConstants constants = {};
    for (int i = 0; i < 4; i++) {
        constants.mvp[i * 5] = 1.0f;
    }
    constants.normal_matrix[0] = 1.0f;
    constants.normal_matrix[5] = 1.0f;
    constants.normal_matrix[10] = 1.0f;
    for (float &value : constants.diffuse) {
        value = 1.0f;
    }
    constants.fog[3] = 255.0f;
    return constants;
}

gfx::Vertex3D Vertex(float x, float y, float z, float u = 0, float v = 0,
                     std::array<uint8_t, 4> color = {0x80, 0x80, 0x80, 0x80}) {
    gfx::Vertex3D vertex = {};
    vertex.position[0] = x;
    vertex.position[1] = y;
    vertex.position[2] = z;
    vertex.normal[2] = -1.0f;
    vertex.uv[0] = u;
    vertex.uv[1] = v;
    for (int i = 0; i < 4; i++) {
        vertex.color[i] = color[i];
    }
    return vertex;
}

} // namespace

DC_TEST(gfx_mesh_lit_fog_alpha) {
    GfxFixture                   fixture;
    std::array<gfx::Vertex3D, 3> triangle = {Vertex(-0.9f, -0.5f, 0.5f), Vertex(-0.1f, -0.5f, 0.5f),
                                             Vertex(-0.5f, 0.5f, 0.5f)};
    std::array<uint32_t, 3>      indices = {0, 1, 2};
    gfx::MeshHandle              mesh = gfx::CreateMesh(triangle, indices);
    DC_CHECK(mesh != gfx::kNullMesh);

    uint32_t           texels[2] = {Rgba(255, 0, 0), Rgba(0, 255, 0)};
    gfx::TextureHandle texture = gfx::CreateTexture({2, 1, gfx::TextureFormat::Rgba8, 1, true});
    DC_CHECK(gfx::UpdateTexture(texture, 0, 0, 0, 2, 1, texels));

    fixture.Frame(kBlack, [&] {
        // One white light along +z onto a normal facing -z, material (1, 0.5, 0.25): GS bytes
        // (0x80, 0x40, 0x20), then fogged halfway towards red.
        gfx::MeshConstants lit = Constants();
        lit.flags = gfx::kMeshLit | gfx::kMeshFog;
        lit.light_count = 1;
        lit.light_direction[0][2] = 1.0f;
        lit.light_color[0][0] = 1.0f;
        lit.light_color[0][1] = 1.0f;
        lit.light_color[0][2] = 1.0f;
        lit.diffuse[1] = 0.5f;
        lit.diffuse[2] = 0.25f;
        lit.fog[0] = 128.0f;
        gfx::DrawState state;
        state.fog = true;
        state.fog_color[0] = 255;
        state.depth_test = gfx::DepthTest::GEqual;
        state.depth_write = true;
        gfx::DrawMesh(mesh, 0, 3, lit, {}, state);

        // Moved right and given alpha 0x20, it fails an alpha test of GEQUAL 0x40.
        gfx::MeshConstants faint = Constants();
        faint.mvp[12] = 1.0f;
        faint.diffuse[3] = 0.25f;
        gfx::DrawState tested;
        tested.alpha_test = true;
        tested.alpha_func = gfx::AlphaFunc::GEqual;
        tested.alpha_ref = 0x40;
        gfx::DrawMesh(mesh, 0, 3, faint, {}, tested);

        // Wound clockwise on screen: culled as a back face, kept as a front-culled one.
        gfx::MeshConstants below = Constants();
        below.mvp[13] = 1.0f;
        gfx::DrawState back;
        back.cull = gfx::CullMode::Back;
        gfx::DrawMesh(mesh, 0, 3, below, {}, back);
        below.mvp[12] = 1.0f;
        back.cull = gfx::CullMode::Front;
        gfx::DrawMesh(mesh, 0, 3, below, {}, back);

        // A textured, vertex-coloured mesh that lives for this frame.
        std::array<gfx::Vertex3D, 4> quad = {Vertex(-0.2f, -1.0f, 0.5f, 0, 0),
                                             Vertex(0.2f, -1.0f, 0.5f, 1, 0), Vertex(0.2f, -0.6f, 0.5f, 1, 1),
                                             Vertex(-0.2f, -0.6f, 0.5f, 0, 1)};
        std::array<uint32_t, 6>      twice = {0, 1, 2, 0, 2, 3};
        gfx::MeshConstants           plain = Constants();
        plain.flags = gfx::kMeshVertexColor;
        gfx::TextureBinding binding;
        binding.texture = texture;
        binding.filter = gfx::Filter::Nearest;
        gfx::DrawMeshImmediate(quad, twice, plain, binding, gfx::DrawState{});

        gfx::ReadDepth(0, 160, 200, 4, 4);
    });

    DC_CHECK(fixture.PixelNear(160, 210, 191, 32, 16));
    DC_CHECK(fixture.PixelNear(480, 210, 0, 0, 0));
    DC_CHECK(fixture.PixelNear(160, 450, 0, 0, 0));
    DC_CHECK(fixture.PixelNear(480, 450, 128, 128, 128));
    DC_CHECK(fixture.PixelNear(300, 30, 255, 0, 0));
    DC_CHECK(fixture.PixelNear(340, 30, 0, 255, 0));
    std::optional<float> depth = gfx::DepthResult(0);
    DC_CHECK(depth.has_value());
    DC_CHECK_NEAR(*depth, 0.5f, 1e-4f);

    gfx::DestroyMesh(mesh);
    gfx::DestroyTexture(texture);
}

DC_TEST(gfx_depth_test_and_readback) {
    GfxFixture fixture(800, 600);
    fixture.Frame(kBlack, [&] {
        gfx::DrawState state;
        state.depth_test = gfx::DepthTest::GEqual;
        state.depth_write = true;
        auto near_quad = Quad(100, 100, 200, 200, {255, 0, 0, 0x80}, 0, 0, 0, 0, 0.75f);
        gfx::Draw2D(gfx::Primitive::Quads, near_quad, {}, state);
        auto far_quad = Quad(200, 100, 200, 200, {0, 255, 0, 0x80}, 0, 0, 0, 0, 0.25f);
        gfx::Draw2D(gfx::Primitive::Quads, far_quad, {}, state);

        gfx::DrawState over;
        over.depth_test = gfx::DepthTest::Greater;
        auto nearer = Quad(250, 100, 20, 200, {0, 0, 255, 0x80}, 0, 0, 0, 0, 0.9f);
        gfx::Draw2D(gfx::Primitive::Quads, nearer, {}, over);
        over.depth_test = gfx::DepthTest::Never;
        auto never = Quad(0, 0, 640, 480, {255, 255, 255, 0x80});
        gfx::Draw2D(gfx::Primitive::Quads, never, {}, over);

        gfx::ReadDepth(0, 120, 120, 8, 8);
        gfx::ReadDepth(1, 350, 150, 8, 8);
        gfx::ReadDepth(2, 10, 10, 8, 8);
        gfx::ReadDepth(3, 290, 150, 20, 4);
        gfx::ReadDepth(4, -100, -100, 1, 1);
    });

    // 800x600 holds 640x480 at 1.25 with no bars.
    auto at = [](float x, float y) {
        return std::pair<uint32_t, uint32_t>(static_cast<uint32_t>(x * 1.25f),
                                             static_cast<uint32_t>(y * 1.25f));
    };
    auto [rx, ry] = at(150, 150);
    DC_CHECK(fixture.PixelNear(rx, ry, 255, 0, 0));
    auto [ox, oy] = at(220, 150);
    DC_CHECK(fixture.PixelNear(ox, oy, 255, 0, 0));
    auto [gx, gy] = at(350, 150);
    DC_CHECK(fixture.PixelNear(gx, gy, 0, 255, 0));
    auto [bx, by] = at(260, 150);
    DC_CHECK(fixture.PixelNear(bx, by, 0, 0, 255));

    DC_CHECK_NEAR(gfx::DepthResult(0).value_or(-1.0f), 0.75f, 1e-6f);
    DC_CHECK_NEAR(gfx::DepthResult(1).value_or(-1.0f), 0.25f, 1e-6f);
    DC_CHECK_NEAR(gfx::DepthResult(2).value_or(-1.0f), 0.0f, 1e-6f);
    DC_CHECK_NEAR(gfx::DepthResult(3).value_or(-1.0f), 0.25f, 1e-6f);
    DC_CHECK(!gfx::DepthResult(4).has_value());
    DC_CHECK(!gfx::DepthResult(5).has_value());

    // Results stay until asked again; a new frame with no query leaves them.
    fixture.Frame(kBlack, [] {});
    DC_CHECK_NEAR(gfx::DepthResult(0).value_or(-1.0f), 0.75f, 1e-6f);
}
