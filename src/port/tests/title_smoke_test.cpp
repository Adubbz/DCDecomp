// SDL's headers name parameters A and B, which libgraph.h defines as macros: SDL goes first.
#include <SDL3/SDL.h>

#include "draw3d_fixture.hpp"
#include "framevu1.hpp"
#include "visual.hpp"

// What the title's smoke rests on: the sky dome's 'S' frame culls its back faces, so the clouds
// inside it are not hidden by its near half.

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
