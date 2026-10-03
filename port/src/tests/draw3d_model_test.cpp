#include <gtest/gtest.h>

// SDL's headers name parameters A and B, which libgraph.h defines as macros: SDL goes first.
#include <SDL3/SDL.h>

#include "draw3d_fixture.hpp"
#include "framevu1.hpp"
#include "rect.hpp"
#include "texture.hpp"
#include "visual.hpp"

using namespace dc::test;

namespace {

// A model built the way CreateVisual builds one, hung on a frame at the origin with the screen
// cull off (its bound is a point).
struct Model {
    explicit Model(const MdtBuilder &builder) : image(builder.Build()) {
        visual.CreateVUdataFromMDT(block, image.data(), 0, 0);
        visual.vu_data_buffer[0] = visual.vu_data;
        visual.vu_data_buffer[1] = visual.vu_data;
        visual.SetMDTDataAddress(image.data());
        frame.SetVisual(&visual);
        frame.attr.cull_enable = false;
    }

    std::vector<u_int> image;
    alignas(64) unsigned int block[64] = {};
    CVisualMDTVu1 visual;
    CFrameVu1     frame;
};

constexpr std::array<float, 4> kOrange = {1.0f, 0.5f, 0.25f, 1.0f};
constexpr std::array<float, 4> kGreen = {0.0f, 1.0f, 0.0f, 1.0f};

} // namespace

// A quad from (-10, -5) to (10, 5) at depth 100 projects to 320 +- 800 * 10 / 100 and
// 240 +- 800 * 5 / 100: logical (240, 200) to (400, 280), the full-height frame of what retail's
// field squeeze put on 120 field rows. The ambient-only light gives the material's ambient in
// GS bytes, 0x80 per 1.0.
TEST(Draw3dModel, LandsAtProjectedPixel) {
    Draw3DFixture fixture;
    MdtBuilder    builder;
    builder.Quad(-10.0f, -5.0f, 10.0f, 5.0f, 100.0f, builder.Material(kOrange));
    builder.strips.push_back({
        3u, builder.Material(kGreen), {{{20.0f, -5.0f, 100.0f}, {0, 0}}, {{30.0f, -5.0f, 100.0f}, {0, 0}}, {{20.0f, 5.0f, 100.0f}, {0, 0}}}
    });
    Model model(builder);

    fixture.Frame([&] { MGDraw(&model.frame); });

    ASSERT_TRUE(fixture.PixelNear(320, 240, 128, 64, 32));
    ASSERT_TRUE(fixture.PixelNear(242, 202, 128, 64, 32));
    ASSERT_TRUE(fixture.PixelNear(397, 277, 128, 64, 32));
    ASSERT_TRUE(fixture.PixelNear(237, 240, 0, 0, 0));
    ASSERT_TRUE(fixture.PixelNear(403, 240, 0, 0, 0));
    ASSERT_TRUE(fixture.PixelNear(320, 197, 0, 0, 0));
    ASSERT_TRUE(fixture.PixelNear(320, 283, 0, 0, 0));
    // The list triangle: (480, 200), (560, 200), (480, 280).
    ASSERT_TRUE(fixture.PixelNear(485, 205, 0, 128, 0));
    ASSERT_TRUE(fixture.PixelNear(555, 275, 0, 0, 0));

    // MGRotTransPers2D puts the corners where the mesh's edges are.
    int           screen[4];
    sceVu0FVECTOR corner = {10.0f, 5.0f, 100.0f, 1.0f};
    ASSERT_TRUE(MGRotTransPers2D(screen, corner, 0) == 1);
    ASSERT_TRUE(screen[0] == 400 && screen[1] == 280);
    sceVu0FVECTOR other = {-10.0f, -5.0f, 100.0f, 1.0f};
    MGRotTransPers2D(screen, other, 0);
    ASSERT_TRUE(screen[0] == 240 && screen[1] == 200);

    // MGRotTransPers keeps retail's GS field coordinates: y on 2048 + 400 * y / z, which the 2D
    // units' MGPortLogicalY doubles back to the same logical row.
    MGRotTransPers(screen, corner, 0);
    ASSERT_TRUE(screen[0] == (2048 + 80) * 16 && screen[1] == (2048 + 20) * 16);
    ASSERT_TRUE(MGPortLogicalX(screen[0]) == 400.0f);
    ASSERT_TRUE(MGPortLogicalY(screen[1]) == 280.0f);
}

// Whichever is drawn first, the nearer of two overlapping models covers the farther one.
TEST(Draw3dModel, DepthTest) {
    Draw3DFixture fixture;
    MdtBuilder    near_builder;
    near_builder.Quad(-10.0f, -5.0f, 10.0f, 5.0f, 100.0f, near_builder.Material(kOrange));
    MdtBuilder far_builder;
    far_builder.Quad(-40.0f, -20.0f, 40.0f, 20.0f, 200.0f, far_builder.Material(kGreen));
    Model near_model(near_builder);
    Model far_model(far_builder);

    fixture.Frame([&] {
        MGDraw(&near_model.frame);
        MGDraw(&far_model.frame);
    });
    ASSERT_TRUE(fixture.PixelNear(320, 240, 128, 64, 32));
    ASSERT_TRUE(fixture.PixelNear(200, 240, 0, 128, 0));

    fixture.Frame([&] {
        MGDraw(&far_model.frame);
        MGDraw(&near_model.frame);
    });
    ASSERT_TRUE(fixture.PixelNear(320, 240, 128, 64, 32));
    ASSERT_TRUE(fixture.PixelNear(200, 240, 0, 128, 0));

    // The pick-Z of the near quad is the GS Z MGRotTransPers gives for its depth.
    int           screen[4];
    sceVu0FVECTOR centre = {0.0f, 0.0f, 100.0f, 1.0f};
    MGRotTransPers(screen, centre, 0);
    mgPickZBuff[0].enable = 1;
    mgPickZBuff[0].x = 320;
    mgPickZBuff[0].y = 240;
    fixture.Frame([&] { MGDraw(&near_model.frame); });
    mgPickZBuff[0].enable = 0;
    ASSERT_TRUE(std::abs(mgPickZBuff[0].z - screen[2]) <= 64);
}

// On a window wider than 4:3 the logical frame is pillarboxed; the model lands inside the same
// letterboxed frame as a 2D fill of the rect it covers.
TEST(Draw3dModel, LetterboxedWith2d) {
    Draw3DFixture fixture(800, 480);
    MdtBuilder    builder;
    builder.Quad(-10.0f, -5.0f, 10.0f, 5.0f, 100.0f, builder.Material(kOrange));
    Model model(builder);

    gfx::LogicalMapping mapping = gfx::GetLogicalMapping(gfx::kMainTarget);
    ASSERT_TRUE(mapping.offset_x == 80.0f && mapping.scale_x == 1.0f);

    fixture.Frame([&] {
        MGDraw(&model.frame);
        // 2D fill right of it: logical (400, 200) to (480, 280), x in 12.4, y in field 12.4.
        MGFillBox(CRect_i_(400 * 16, 100 * 16, 80 * 16, 40 * 16), 0, 0, 0x80, 0x80);
    });
    ASSERT_TRUE(fixture.PixelNear(80 + 242, 202, 128, 64, 32));
    ASSERT_TRUE(fixture.PixelNear(80 + 397, 277, 128, 64, 32));
    ASSERT_TRUE(fixture.PixelNear(80 + 237, 240, 0, 0, 0));
    ASSERT_TRUE(fixture.PixelNear(80 + 402, 240, 0, 0, 128));
    ASSERT_TRUE(fixture.PixelNear(80 + 478, 278, 0, 0, 128));
    ASSERT_TRUE(fixture.PixelNear(80 + 482, 240, 0, 0, 0));
    // The bars stay black.
    ASSERT_TRUE(fixture.PixelNear(10, 240, 0, 0, 0));
}

// A textured strip resolves its material's texture by name through TexManager and draws with
// the handle's renderer texture; GS UVs are normalised to 2^TW, which for a power-of-two texture
// is its own size.
TEST(Draw3dModel, TexturedThroughHandle) {
    Draw3DFixture      fixture;
    gfx::TextureHandle texture = gfx::CreateTexture({2, 2, gfx::TextureFormat::Rgba8, 1, true});
    uint32_t           texels[4] = {Rgba(255, 0, 0), Rgba(0, 255, 0), Rgba(0, 0, 255), Rgba(255, 255, 255)};
    ASSERT_TRUE(gfx::UpdateTexture(texture, 0, 0, 0, 2, 2, texels));

    constexpr int kHandle = 5;
    CTexture     &entry = TexManager.textures[kHandle];
    int           saved_max = TexManager.texture_max;
    entry.Initialize();
    std::strcpy(entry.name, "synth");
    entry.width = 2;
    entry.height = 2;
    entry.tex0 = SCE_GS_SET_TEX0(0x2000, 1, SCE_GS_PSMCT32, 1, 1, 1, 0, 0, 0, 0, 0, 0);
    entry.tex1 = SCE_GS_SET_TEX1(1, 0, 0, 0, 0, 0, 0);
    TexManager.texture_max = kHandle + 1;
    static gfx::TextureHandle resolved;
    resolved = texture;
    Draw3DSetResolvers(nullptr, [](int handle) {
        PortTextureRef ref;
        if (handle == kHandle) {
            ref.binding.texture = resolved;
            ref.width = 2;
            ref.height = 2;
            ref.valid = true;
        }
        return ref;
    });

    MdtBuilder builder;
    builder.Quad(-10.0f, -5.0f, 10.0f, 5.0f, 100.0f, builder.Material({1.0f, 1.0f, 1.0f, 1.0f}, "synth"));
    Model model(builder);
    fixture.Frame([&] { MGDraw(&model.frame); });

    // MODULATE by 0x80 leaves the texels; TEX1 MMAG 0 is nearest.
    ASSERT_TRUE(fixture.PixelNear(260, 220, 255, 0, 0));
    ASSERT_TRUE(fixture.PixelNear(380, 220, 0, 255, 0));
    ASSERT_TRUE(fixture.PixelNear(260, 260, 0, 0, 255));
    ASSERT_TRUE(fixture.PixelNear(380, 260, 255, 255, 255));

    // Unlit draws are untextured (VU1's PRMODE takes TME from the lighting switch): the material
    // diffuse, white.
    mgRenderInfo.unlit = 1;
    fixture.Frame([&] { MGDraw(&model.frame); });
    mgRenderInfo.unlit = 0;
    ASSERT_TRUE(fixture.PixelNear(260, 220, 128, 128, 128));

    TexManager.texture_max = saved_max;
    entry.Initialize();
}

// Without a texture phase the placeholder resolver answers invalid and the strip draws untextured.
TEST(Draw3dModel, UnresolvedTextureDrawsUntextured) {
    Draw3DFixture fixture;
    MdtBuilder    builder;
    builder.Quad(-10.0f, -5.0f, 10.0f, 5.0f, 100.0f, builder.Material(kOrange, "missing"));
    Model model(builder);
    fixture.Frame([&] { MGDraw(&model.frame); });
    ASSERT_TRUE(fixture.PixelNear(320, 240, 128, 64, 32));
}

// Remaking moves the vertices in place: the retained MDT is edited and remake_pending set, as
// MotionProc2 does after skinning.
TEST(Draw3dModel, RemakeMovesVertices) {
    Draw3DFixture fixture;
    MdtBuilder    builder;
    builder.Quad(-10.0f, -5.0f, 10.0f, 5.0f, 100.0f, builder.Material(kOrange));
    Model model(builder);

    auto *header = reinterpret_cast<MDT_HEADER *>(model.image.data());
    auto *vertices = reinterpret_cast<float (*)[4]>(reinterpret_cast<unsigned char *>(model.image.data()) + header->vertex_ofs);
    for (int i = 0; i < header->vertex_num; i++) {
        vertices[i][0] += 20.0f;
    }
    model.frame.attr.remake_pending = 1;
    fixture.Frame([&] { MGDraw(&model.frame); });
    ASSERT_TRUE(model.frame.attr.remake_pending == 0);
    ASSERT_TRUE(fixture.PixelNear(320, 240, 0, 0, 0));
    ASSERT_TRUE(fixture.PixelNear(480, 240, 128, 64, 32));
}

// Strips become lists wound as their first triangle: on a zigzag the signed areas all agree.
TEST(Draw3dModel, StripWinding) {
    std::vector<uint32_t> indices;
    Draw3DStripToList(indices, 10, 5);
    ASSERT_TRUE((indices == std::vector<uint32_t>{10, 11, 12, 12, 11, 13, 12, 13, 14}));

    const float x[5] = {0, 1, 0, 1, 0};
    const float y[5] = {0, 0, 1, 1, 2};
    for (size_t t = 0; t < indices.size(); t += 3) {
        uint32_t a = indices[t] - 10;
        uint32_t b = indices[t + 1] - 10;
        uint32_t c = indices[t + 2] - 10;
        float    area = (x[b] - x[a]) * (y[c] - y[a]) - (x[c] - x[a]) * (y[b] - y[a]);
        ASSERT_TRUE(area > 0.0f);
    }
}

// A block the game's arena clears or reuses loses its record (and mesh) at the next frame.
TEST(Draw3dModel, RecordSweptWithItsBlock) {
    Draw3DFixture fixture;
    MdtBuilder    builder;
    builder.Quad(-10.0f, -5.0f, 10.0f, 5.0f, 100.0f, builder.Material(kOrange));
    Model model(builder);
    ASSERT_TRUE(Draw3DFindVisual(model.block) != nullptr);
    MGBeginFrame();
    MGEndFrame();
    ASSERT_TRUE(Draw3DFindVisual(model.block) != nullptr);
    std::memset(model.block, 0, sizeof(model.block));
    MGBeginFrame();
    MGEndFrame();
    ASSERT_TRUE(Draw3DFindVisual(model.block) == nullptr);
}
