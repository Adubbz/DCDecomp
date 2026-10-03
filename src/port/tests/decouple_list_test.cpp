#include <cstring>
#include <functional>

#include "gfx/displaylist.hpp"
#include "gfx_fixture.hpp"

using namespace dc::test;

namespace {

using gfx::detail::Mat4;

constexpr std::array<uint8_t, 4> kBlack = {0, 0, 0, 0x80};
constexpr std::array<uint8_t, 4> kWhite = {0xFF, 0xFF, 0xFF, 0x80};
constexpr Mat4                   kIdentity = {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1};

Mat4 Translation(float x, float y, float z = 0.0f) {
    Mat4 m = kIdentity;
    m[12] = x;
    m[13] = y;
    m[14] = z;
    return m;
}

// About z, then scaled by s on every axis.
Mat4 RotationZ(float degrees, float s = 1.0f) {
    float radians = degrees * 3.14159265f / 180.0f;
    Mat4  m = kIdentity;
    m[0] = std::cos(radians) * s;
    m[1] = std::sin(radians) * s;
    m[4] = -std::sin(radians) * s;
    m[5] = std::cos(radians) * s;
    m[10] = s;
    return m;
}

// A 0.2 x 0.2 square in clip space around the origin at depth 0.5: mvp is the model.
gfx::MeshHandle Square() {
    std::array<gfx::Vertex3D, 4> vertices = {};
    float                        corners[4][2] = {{-0.1f, -0.1f}, {0.1f, -0.1f}, {0.1f, 0.1f}, {-0.1f, 0.1f}};
    for (int i = 0; i < 4; i++) {
        vertices[i].position[0] = corners[i][0];
        vertices[i].position[1] = corners[i][1];
        vertices[i].position[2] = 0.5f;
        vertices[i].normal[2] = -1.0f;
        for (uint8_t &c : vertices[i].color) {
            c = 0x80;
        }
    }
    std::array<uint32_t, 6> indices = {0, 1, 2, 0, 2, 3};
    return gfx::CreateMesh(vertices, indices);
}

void Draw(gfx::MeshHandle mesh, const Mat4 &model, const Mat4 &view = kIdentity) {
    gfx::MeshConstants constants = {};
    Mat4               mvp = gfx::detail::Multiply(view, model);
    std::memcpy(constants.mvp, mvp.data(), sizeof(constants.mvp));
    constants.normal_matrix[0] = constants.normal_matrix[5] = constants.normal_matrix[10] = 1.0f;
    for (float &value : constants.diffuse) {
        value = 1.0f;
    }
    gfx::MeshTransform transform = gfx::IdentityMeshTransform();
    std::memcpy(transform.model, model.data(), sizeof(transform.model));
    std::memcpy(transform.view, view.data(), sizeof(transform.view));
    gfx::DrawMesh(mesh, 0, 6, constants, {}, {}, &transform);
}

gfx::DisplayListRef Tick(const std::function<void()> &record) {
    gfx::BeginRecording();
    gfx::Clear(true, kBlack.data(), true, 0.0f);
    record();
    gfx::DisplayListRef list = gfx::EndRecording();
    DC_CHECK(gfx::RenderList(*list, 1.0f, {.canonical = true}));
    return list;
}

void Display(GfxFixture &fixture, const gfx::DisplayListRef &list, const gfx::DisplayListRef &previous,
             float alpha) {
    DC_CHECK(gfx::RenderList(*list, alpha, {.previous = previous.get(), .present = true}));
    DC_CHECK(gfx::ReadbackFrame(fixture.pixels, fixture.width, fixture.height));
}

// The square lit at x (0..640 across clip -1..1), dark elsewhere along the middle row.
bool SquareAt(const GfxFixture &fixture, uint32_t x) {
    return fixture.PixelNear(x, 240, 0x80, 0x80, 0x80) && fixture.PixelNear(x - 40, 240, 0, 0, 0) &&
           fixture.PixelNear(x + 40, 240, 0, 0, 0);
}

bool Near(const Mat4 &a, const Mat4 &b) {
    for (int i = 0; i < 16; i++) {
        if (std::fabs(a[i] - b[i]) > 1e-4f) {
            std::fprintf(stderr, "element %d: %g, expected %g\n", i, a[i], b[i]);
            return false;
        }
    }
    return true;
}

} // namespace

DC_TEST(decouple_interpolate_affine) {
    Mat4 out;
    DC_CHECK(gfx::detail::InterpolateAffine(Translation(-2, 0, 4), Translation(2, 6, 4), 0.25f, out));
    DC_CHECK(Near(out, Translation(-1, 1.5f, 4)));
    // Rotation slerps (0 to 90 degrees about z gives 45), scale lerps (1 to 3 gives 2).
    DC_CHECK(gfx::detail::InterpolateAffine(RotationZ(0, 1), RotationZ(90, 3), 0.5f, out));
    DC_CHECK(Near(out, RotationZ(45, 2)));
    // The short way round: 350 to 10 degrees passes through 0.
    DC_CHECK(gfx::detail::InterpolateAffine(RotationZ(350), RotationZ(10), 0.5f, out));
    DC_CHECK(Near(out, RotationZ(0)));
    // A projective or degenerate matrix is not interpolated.
    Mat4 flat = RotationZ(30);
    flat[10] = 0.0f;
    DC_CHECK(!gfx::detail::InterpolateAffine(flat, RotationZ(10), 0.5f, out));
    DC_CHECK(out == RotationZ(10));
    Mat4 inverse;
    DC_CHECK(
        gfx::detail::InvertAffine(gfx::detail::Multiply(Translation(1, 2, 3), RotationZ(30, 2)), inverse));
    DC_CHECK(
        Near(gfx::detail::Multiply(inverse, gfx::detail::Multiply(Translation(1, 2, 3), RotationZ(30, 2))),
             kIdentity));
}

// A keyed mesh at x -0.5 in one tick and +0.5 in the next is drawn at 0 halfway between them.
DC_TEST(decouple_mesh_interpolates_between_ticks) {
    GfxFixture          fixture;
    gfx::MeshHandle     mesh = Square();
    gfx::DisplayListRef first = Tick([&] {
        gfx::SetInterpKey(7);
        Draw(mesh, Translation(-0.5f, 0));
    });
    gfx::DisplayListRef second = Tick([&] {
        gfx::SetInterpKey(7);
        Draw(mesh, Translation(0.5f, 0));
    });
    // The canonical render is the tick as recorded.
    DC_CHECK(gfx::PresentCanonical());
    DC_CHECK(gfx::ReadbackFrame(fixture.pixels, fixture.width, fixture.height));
    DC_CHECK(SquareAt(fixture, 480));
    Display(fixture, second, first, 0.5f);
    DC_CHECK(SquareAt(fixture, 320));
    Display(fixture, second, first, 0.0f);
    DC_CHECK(SquareAt(fixture, 160));
    Display(fixture, second, first, 0.75f);
    DC_CHECK(SquareAt(fixture, 400));
    // Without a predecessor, or at alpha 1, it is where this tick put it.
    Display(fixture, second, nullptr, 0.5f);
    DC_CHECK(SquareAt(fixture, 480));
    Display(fixture, second, first, 1.0f);
    DC_CHECK(SquareAt(fixture, 480));
}

// The no-interpolation flag (a teleport), a cut list and an unkeyed draw all stay put.
DC_TEST(decouple_flagged_mesh_does_not_interpolate) {
    GfxFixture          fixture;
    gfx::MeshHandle     mesh = Square();
    gfx::DisplayListRef first = Tick([&] {
        gfx::SetInterpKey(7);
        Draw(mesh, Translation(-0.5f, 0));
    });
    gfx::DisplayListRef flagged = Tick([&] {
        gfx::SetInterpKey(7, true);
        Draw(mesh, Translation(0.5f, 0));
    });
    Display(fixture, flagged, first, 0.5f);
    DC_CHECK(SquareAt(fixture, 480));

    gfx::DisplayListRef jumped = Tick([&] {
        gfx::SetInterpKey(7, false, 0.9f);
        Draw(mesh, Translation(-0.5f, 0));
    });
    Display(fixture, jumped, flagged, 0.5f);
    DC_CHECK(SquareAt(fixture, 160));

    gfx::DisplayListRef cut = Tick([&] {
        gfx::CutInterpolation();
        gfx::SetInterpKey(7);
        Draw(mesh, Translation(-0.5f, 0));
    });
    Display(fixture, cut, flagged, 0.5f);
    DC_CHECK(SquareAt(fixture, 160));

    gfx::DisplayListRef unkeyed = Tick([&] { Draw(mesh, Translation(0.5f, 0)); });
    Display(fixture, unkeyed, cut, 0.5f);
    DC_CHECK(SquareAt(fixture, 480));
}

// The camera interpolates for every draw that carries a transform, keyed or not; a camera cut
// stops it.
DC_TEST(decouple_camera_interpolates) {
    GfxFixture          fixture;
    gfx::MeshHandle     mesh = Square();
    gfx::DisplayListRef first = Tick([&] { Draw(mesh, kIdentity, Translation(-0.5f, 0)); });
    gfx::DisplayListRef second = Tick([&] { Draw(mesh, kIdentity, Translation(0.5f, 0)); });
    Display(fixture, second, first, 0.5f);
    DC_CHECK(SquareAt(fixture, 320));
    Display(fixture, second, first, 0.25f);
    DC_CHECK(SquareAt(fixture, 240));

    gfx::DisplayListRef cut = Tick([&] {
        gfx::CutCameraInterpolation();
        Draw(mesh, kIdentity, Translation(-0.5f, 0));
    });
    Display(fixture, cut, second, 0.5f);
    DC_CHECK(SquareAt(fixture, 160));
}

// A scroll done with copies in the list moves once per tick, however many display frames replay it.
DC_TEST(decouple_texture_scroll_once_per_tick) {
    GfxFixture         fixture;
    gfx::TextureHandle strip = gfx::CreateTexture({4, 1, gfx::TextureFormat::Rgba8, 1, true});
    gfx::TextureHandle scratch = gfx::CreateTexture({4, 1, gfx::TextureFormat::Rgba8, 1, true});
    uint32_t           texels[4] = {Rgba(10, 0, 0), Rgba(20, 0, 0), Rgba(30, 0, 0), Rgba(40, 0, 0)};
    DC_CHECK(gfx::UpdateTexture(strip, 0, 0, 0, 4, 1, texels));

    gfx::DisplayListRef previous;
    for (int tick = 0; tick < 3; tick++) {
        gfx::DisplayListRef list = Tick([&] {
            DC_CHECK(gfx::CopyTexture(strip, {1, 0, 3, 1}, scratch, 0, 0));
            DC_CHECK(gfx::CopyTexture(strip, {0, 0, 1, 1}, scratch, 3, 0));
            DC_CHECK(gfx::CopyTexture(scratch, {0, 0, 4, 1}, strip, 0, 0));
            gfx::TextureBinding binding;
            binding.texture = strip;
            binding.filter = gfx::Filter::Nearest;
            auto quad = Quad(0, 0, 640, 480, {0x80, 0x80, 0x80, 0x80}, 0, 0, 4, 1);
            gfx::Draw2D(gfx::Primitive::Quads, quad, binding, {});
        });
        for (int frame = 0; frame < 4; frame++) {
            DC_CHECK(gfx::RenderList(*list, frame / 4.0f, {.previous = previous.get(), .present = true}));
        }
        previous = list;
    }
    std::vector<uint8_t> pixels;
    uint32_t             width;
    uint32_t             height;
    DC_CHECK(gfx::ReadbackTexture(strip, pixels, width, height));
    DC_CHECK(pixels[0] == 40 && pixels[4] == 10 && pixels[8] == 20 && pixels[12] == 30);
    // The display frames drew the scrolled strip as the canonical render left it.
    DC_CHECK(gfx::ReadbackFrame(fixture.pixels, fixture.width, fixture.height));
    DC_CHECK(fixture.Pixel(80, 240)[0] == 40 && fixture.Pixel(240, 240)[0] == 10);
}

// A previous-frame feedback trail (the title's) comes out byte for byte the same whether each tick
// is displayed once or many times between canonical renders.
DC_TEST(decouple_previous_frame_feedback_is_tick_exact) {
    GfxFixture      fixture;
    gfx::MeshHandle mesh = Square();
    auto            run = [&](int displays) {
        gfx::DisplayListRef previous;
        for (int tick = 0; tick < 6; tick++) {
            gfx::DisplayListRef list = Tick([&] {
                if (tick > 0) {
                    gfx::TextureBinding binding;
                    binding.texture = gfx::kPreviousFrame;
                    gfx::DrawState state;
                    state.blend = true;
                    auto quad = Quad(0, 0, 640, 480, {0x80, 0x80, 0x80, 0x46}, 0, 0, 640, 480);
                    gfx::Draw2D(gfx::Primitive::Quads, quad, binding, state);
                }
                gfx::SetInterpKey(3);
                Draw(mesh, Translation(-0.8f + 0.3f * static_cast<float>(tick), 0.0f));
            });
            for (int frame = 0; frame < displays; frame++) {
                DC_CHECK(gfx::RenderList(*list, static_cast<float>(frame) / static_cast<float>(displays),
                                                    {.previous = previous.get(), .present = true}));
            }
            previous = list;
        }
        DC_CHECK(gfx::PresentCanonical());
        std::vector<uint8_t> pixels;
        DC_CHECK(gfx::ReadbackFrame(pixels, fixture.width, fixture.height));
        return pixels;
    };
    std::vector<uint8_t> once = run(0);
    std::vector<uint8_t> many = run(4);
    DC_CHECK(once == many);
    // The trail is there: the square's older positions show dimmed.
    fixture.pixels = once;
    DC_CHECK(fixture.Pixel(448, 240)[0] > 0x10 && fixture.Pixel(448, 240)[0] < 0x70);
}

// The canonical render of a list is the frame immediate drawing makes, and presenting it as it is
// (interpolation off) shows exactly that.
DC_TEST(decouple_canonical_matches_immediate) {
    GfxFixture         fixture;
    gfx::MeshHandle    mesh = Square();
    gfx::TextureHandle target = gfx::CreateRenderTarget(64, 64, true);
    gfx::TextureHandle copy = gfx::CreateTexture({64, 64, gfx::TextureFormat::Rgba8, 1, true});
    uint32_t           palette_texels[2] = {Rgba(200, 40, 40), Rgba(40, 200, 40)};
    gfx::TextureHandle palette = gfx::CreateTexture({2, 1, gfx::TextureFormat::Rgba8, 1, true});
    auto               draw = [&] {
        gfx::Clear(true, kBlack.data(), true, 0.0f);
        DC_CHECK(gfx::UpdateTexture(palette, 0, 0, 0, 2, 1, palette_texels));
        gfx::SetRenderTarget(target);
        gfx::Clear(true, kWhite.data(), true, 0.0f);
        gfx::TextureBinding binding;
        binding.texture = palette;
        binding.filter = gfx::Filter::Nearest;
        auto stripe = Quad(0, 0, 640, 240, {0x80, 0x80, 0x80, 0x80}, 0, 0, 2, 1);
        gfx::Draw2D(gfx::Primitive::Quads, stripe, binding, {});
        gfx::SetRenderTarget(gfx::kMainTarget);
        Draw(mesh, Translation(0.3f, -0.2f));
        DC_CHECK(gfx::BlitTexture(target, {0, 0, 64, 64}, copy, {0, 0, 64, 64}, gfx::Filter::Linear));
        binding.texture = copy;
        auto corner = Quad(16, 16, 128, 128, {0x80, 0x80, 0x80, 0x80}, 0, 0, 64, 64);
        gfx::Draw2D(gfx::Primitive::Quads, corner, binding, {});
        gfx::ReadDepth(0, 400, 180, 4, 4);
    };
    DC_CHECK(gfx::BeginFrame());
    draw();
    gfx::EndFrame();
    std::vector<uint8_t> immediate;
    DC_CHECK(gfx::ReadbackFrame(immediate, fixture.width, fixture.height));
    std::optional<float> immediate_depth = gfx::DepthResult(0);

    gfx::BeginRecording();
    DC_CHECK(gfx::InFrame() && gfx::Recording());
    draw();
    gfx::DisplayListRef   list = gfx::EndRecording();
    gfx::DisplayListStats stats = gfx::ListStats(*list);
    DC_CHECK(stats.draws_2d == 2 && stats.mesh_draws == 1 && stats.stateful == 3);
    DC_CHECK(gfx::RenderList(*list, 1.0f, {.canonical = true}));
    DC_CHECK(gfx::PresentCanonical());
    std::vector<uint8_t> canonical;
    DC_CHECK(gfx::ReadbackFrame(canonical, fixture.width, fixture.height));
    DC_CHECK(canonical == immediate);
    DC_CHECK(immediate_depth && gfx::DepthResult(0) && *gfx::DepthResult(0) == *immediate_depth);

    // A display render at alpha 1 with nothing to interpolate draws the same picture.
    DC_CHECK(gfx::RenderList(*list, 1.0f, {.present = true}));
    std::vector<uint8_t> display;
    DC_CHECK(gfx::ReadbackFrame(display, fixture.width, fixture.height));
    DC_CHECK(display == immediate);
}

// A texture or mesh destroyed during a tick stays drawable by that tick's list until the list goes.
DC_TEST(decouple_destroy_waits_for_the_list) {
    GfxFixture         fixture;
    gfx::MeshHandle    mesh = Square();
    gfx::TextureHandle texture = gfx::CreateTexture({1, 1, gfx::TextureFormat::Rgba8, 1, true});
    uint32_t           red = Rgba(0xFF, 0, 0);
    DC_CHECK(gfx::UpdateTexture(texture, 0, 0, 0, 1, 1, &red));
    gfx::DisplayListRef list = Tick([&] {
        gfx::TextureBinding binding;
        binding.texture = texture;
        auto quad = Quad(0, 0, 64, 64, {0x80, 0x80, 0x80, 0x80}, 0, 0, 1, 1);
        gfx::Draw2D(gfx::Primitive::Quads, quad, binding, {});
        Draw(mesh, kIdentity);
        gfx::DestroyTexture(texture);
        gfx::DestroyMesh(mesh);
        DC_CHECK(!gfx::GetTextureInfo(texture));
    });
    DC_CHECK(gfx::PresentCanonical());
    DC_CHECK(gfx::ReadbackFrame(fixture.pixels, fixture.width, fixture.height));
    DC_CHECK(fixture.PixelNear(32, 32, 0xFF, 0, 0) && SquareAt(fixture, 320));
    DC_CHECK(gfx::RenderList(*list, 1.0f, {.present = true}));
    DC_CHECK(gfx::ReadbackFrame(fixture.pixels, fixture.width, fixture.height));
    DC_CHECK(fixture.PixelNear(32, 32, 0xFF, 0, 0) && SquareAt(fixture, 320));
    list.reset();
    DC_CHECK(!gfx::GetTextureInfo(texture));
}

// An immediate frame (the loading screen) between ticks takes the main images over: no display
// render of the old list until the next canonical one.
DC_TEST(decouple_immediate_frame_stops_display_renders) {
    GfxFixture          fixture;
    gfx::DisplayListRef list = Tick([] {});
    DC_CHECK(gfx::RenderList(*list, 0.5f, {.present = true}));
    fixture.Frame(kWhite, [] {});
    DC_CHECK(!gfx::RenderList(*list, 0.5f, {.present = true}));
    DC_CHECK(!gfx::PresentCanonical());
    DC_CHECK(fixture.PixelNear(10, 10, 0xFF, 0xFF, 0xFF));
}
