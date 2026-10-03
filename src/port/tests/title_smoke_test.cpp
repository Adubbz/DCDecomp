// SDL's headers name parameters A and B, which libgraph.h defines as macros: SDL goes first.
#include <SDL3/SDL.h>
#include <libgraph.h>

#include "draw3d_fixture.hpp"
#include "framevu1.hpp"
#include "rect.hpp"
#include "texture_port.hpp"
#include "visual.hpp"

// The two mechanisms the title's smoke rests on: the sky dome's 'S' frame culls its back faces,
// so the clouds inside it are not hidden by its near half, and the frame grab the smoke trail is
// blended back from carries TEXA's alpha, not whatever the frame's last draw wrote.

using namespace dc::test;

namespace {

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

struct Grab {
    static inline gfx::TextureHandle target = gfx::kNullTexture;

    static u_long Tex0() { return SCE_GS_SET_TEX0(0x100, 10, SCE_GS_PSMCT32, 10, 8, 1, 0, 0, 0, 0, 0, 0); }

    static PortTextureRef Resolve(u_long tex0) {
        PortTextureRef ref;
        unsigned       tbp0 = static_cast<unsigned>(tex0 & 0x3FFF);
        if (tbp0 == kMGPortFrameTbp0) {
            ref.binding.texture = gfx::kMainTarget;
            ref.width = 640;
            ref.height = 480;
            ref.valid = true;
        } else if (tbp0 == 0x100 && target != gfx::kNullTexture) {
            ref.binding.texture = target;
            ref.width = 640;
            ref.height = 256;
            ref.valid = true;
        }
        return ref;
    }
};

sceGsTex0 AsTex0(u_long value) {
    sceGsTex0 tex0;
    std::memcpy(&tex0, &value, sizeof(value));
    return tex0;
}

std::array<uint8_t, 4> Texel(const std::vector<uint8_t> &pixels, uint32_t width, uint32_t x, uint32_t y) {
    const uint8_t *p = &pixels[(static_cast<size_t>(y) * width + x) * 4];
    return {p[0], p[1], p[2], p[3]};
}

} // namespace

// Two quads as GS strips: the left one clockwise on the y-down screen (top-left, top-right,
// bottom-left), the right one counter-clockwise (top-left, bottom-left, top-right). Without the
// frame's program option VU1 draws both; with it, the culling outputs drop the clockwise one.
DC_TEST(draw3d_program_option_culls_clockwise_triangles) {
    Draw3DFixture fixture;
    MdtBuilder    builder;
    int           material = builder.Material(kOrange);
    builder.Quad(-30.0f, -5.0f, -10.0f, 5.0f, 100.0f, material);
    builder.strips.push_back({
        4u,
        material,
        {{{10.0f, -5.0f, 100.0f}, {0, 0}},
          {{10.0f, 5.0f, 100.0f}, {0, 1}},
          {{30.0f, -5.0f, 100.0f}, {1, 0}},
          {{30.0f, 5.0f, 100.0f}, {1, 1}}}
    });
    Model model(builder);

    fixture.Frame([&] { MGDraw(&model.frame); });
    DC_CHECK(fixture.PixelNear(160, 240, 128, 64, 32));
    DC_CHECK(fixture.PixelNear(480, 240, 128, 64, 32));

    model.frame.attr.program_option = 1;
    fixture.Frame([&] { MGDraw(&model.frame); });
    DC_CHECK(fixture.PixelNear(160, 240, 0, 0, 0));
    DC_CHECK(fixture.PixelNear(480, 240, 128, 64, 32));
}

// The title and the depth of field grab the frame as PSMCT24 under TEXA AEM 1, TA0 0x80: the
// copy's alpha is 0x80 (0xFF in the renderer's units) over everything drawn and 0 where the frame
// is pure black, whatever alpha the frame's own draws left. A PSMCT32 source keeps its alpha.
DC_TEST(draw3d_stretch_from_psmct24_takes_texa_alpha) {
    Draw3DFixture fixture;
    Grab::target = gfx::CreateRenderTarget(640, 256, true);
    Draw3DSetResolvers(Grab::Resolve, nullptr);
    sceGsTex0 frame;
    MGGetFBuffTex(&frame);
    sceGsTex0 grab = AsTex0(Grab::Tex0());

    auto record = [&](int psm) {
        fixture.Frame([&] {
            MGClearScreen(0, 0, 0, 0x10);
            MGFillBox(CRect_i_(0, 0, 320 * 16, 240 * 16), 90, 60, 200, 0x20);
            sceGsTex0 source = frame;
            source.PSM = psm;
            MGStretchMoveImage(&source, CRect_i_(0, 0, 640 * 16, 240 * 16), &grab,
                               CRect_i_(0, 0, 640 * 16, 240 * 16));
        });
    };

    std::vector<uint8_t> pixels;
    uint32_t             width = 0;
    uint32_t             height = 0;

    record(SCE_GS_PSMCT24);
    DC_CHECK(gfx::ReadbackTexture(Grab::target, pixels, width, height));
    // The box blends at a quarter over black.
    std::array<uint8_t, 4> drawn = Texel(pixels, width, 100, 60);
    DC_CHECK(std::abs(drawn[0] - 22) <= 2 && std::abs(drawn[1] - 15) <= 2 && std::abs(drawn[2] - 50) <= 2);
    DC_CHECK(drawn[3] == 0xFF);
    std::array<uint8_t, 4> black = Texel(pixels, width, 500, 200);
    DC_CHECK(black[0] == 0 && black[1] == 0 && black[2] == 0 && black[3] == 0);

    record(SCE_GS_PSMCT32);
    DC_CHECK(gfx::ReadbackTexture(Grab::target, pixels, width, height));
    DC_CHECK(std::abs(Texel(pixels, width, 100, 60)[3] - 0x40) <= 1);
    DC_CHECK(std::abs(Texel(pixels, width, 500, 200)[3] - 0x20) <= 1);

    gfx::DestroyTexture(Grab::target);
    Grab::target = gfx::kNullTexture;
}
