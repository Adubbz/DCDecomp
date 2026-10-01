#include <libgraph.h>

#include "dataset.hpp"
#include "draw3d_fixture.hpp"
#include "framevu1.hpp"
#include "rect.hpp"
#include "visualshadow.hpp"

using namespace dc::test;

namespace {

int g_ticks_seen;

int CountTick(int) {
    g_ticks_seen++;
    return 0;
}

// TEX0 values the test resolver maps onto gfx textures by TBP0, standing in for the texture
// phase's registry; the frame's two TBP0s resolve as the contract says.
struct Registry {
    static inline gfx::TextureHandle textures[4];

    static u_long Tex0(unsigned slot) {
        return SCE_GS_SET_TEX0(0x100 * (slot + 1), 1, SCE_GS_PSMCT32, 6, 6, 1, 0, 0, 0, 0, 0, 0);
    }

    static PortTextureRef Resolve(u_long tex0) {
        PortTextureRef ref;
        unsigned       tbp0 = static_cast<unsigned>(tex0 & 0x3FFF);
        if (tbp0 == kMGPortFrameTbp0 || tbp0 == kMGPortPreviousFrameTbp0) {
            ref.binding.texture = tbp0 == kMGPortFrameTbp0 ? gfx::kMainTarget : gfx::kPreviousFrame;
            ref.width = 640;
            ref.height = 480;
            ref.valid = true;
            return ref;
        }
        for (unsigned slot = 0; slot < 4; slot++) {
            if (tbp0 == 0x100 * (slot + 1) && textures[slot] != gfx::kNullTexture) {
                std::optional<gfx::TextureInfo> info = gfx::GetTextureInfo(textures[slot]);
                ref.binding.texture = textures[slot];
                ref.width = info->width;
                ref.height = info->height;
                ref.valid = true;
            }
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

// In unbounded mode every MGEndFrame moves the count by exactly one tick and runs the callback
// MGInitVSyncCallBack installed once for it, whether or not the game asked to wait; sceGsSyncV
// waits a tick too.
DC_TEST(draw3d_vsync_group) {
    Draw3DFixture fixture;
    g_ticks_seen = 0;
    MGInitVSyncCallBack(CountTick);
    int start = MGGetVSyncCount();
    int buffer = DBuffID;

    MGFlipWaitVSync(0);
    MGBeginFrame();
    MGEndFrame();
    DC_CHECK(MGGetVSyncCount() == start + 1);
    DC_CHECK(DBuffID == !buffer);

    MGFlipWaitVSync(1);
    MGBeginFrame();
    MGEndFrame();
    DC_CHECK(MGGetVSyncCount() == start + 2);

    // EditLoop presents from inside the main loop's frame.
    MGBeginFrame();
    MGEndFrame();
    MGBeginFrame();
    MGEndFrame();
    DC_CHECK(MGGetVSyncCount() == start + 4);
    DC_CHECK(g_ticks_seen == 4);

    sceGsSyncV(0);
    DC_CHECK(MGGetVSyncCount() == start + 5);
    DC_CHECK(g_ticks_seen == 5);
    DC_CHECK(VSyncField__2 == 0);
    MGInitVSyncCallBack(nullptr);
}

// MGClearScreen fills the logical frame; MGFillBox takes x in 12.4 and y in 12.4 field rows.
DC_TEST(draw3d_fill_and_clear) {
    Draw3DFixture fixture;
    fixture.Frame([] {
        MGClearScreen(10, 20, 30, 0x80);
        MGFillBox(CRect_i_(100 * 16, 30 * 16, 100 * 16, 40 * 16), 200, 0, 0, 0x80);
    });
    DC_CHECK(fixture.PixelNear(50, 50, 10, 20, 30));
    DC_CHECK(fixture.PixelNear(101, 61, 200, 0, 0));
    DC_CHECK(fixture.PixelNear(198, 138, 200, 0, 0));
    DC_CHECK(fixture.PixelNear(202, 100, 10, 20, 30));
    DC_CHECK(fixture.PixelNear(150, 142, 10, 20, 30));
    DC_CHECK(fixture.PixelNear(150, 58, 10, 20, 30));

    // The background colour clears every frame; all components negative turns the clear off.
    MGSetBGColor(0.0f, 0.0f, 90.0f, 128.0f);
    fixture.Frame([] {});
    DC_CHECK(fixture.PixelNear(320, 240, 0, 0, 90));
}

// Pick-Z reads back what MGClearZBuffer wrote, in GS units; requests off the edges get -1.
DC_TEST(draw3d_pick_z_round_trip) {
    Draw3DFixture fixture;
    mgPickZBuff[0] = {1, 320, 240, 0};
    mgPickZBuff[1] = {1, 2, 240, 0};
    mgPickZBuff[2] = {1, 320, 478, 0};
    fixture.Frame([] { MGClearZBuffer(1000000); });
    DC_CHECK(std::abs(mgPickZBuff[0].z - 1000000) <= 2);
    DC_CHECK(mgPickZBuff[1].z == -1);
    DC_CHECK(mgPickZBuff[2].z == -1);

    // The cleared buffer is Z 0.
    fixture.Frame([] {});
    DC_CHECK(mgPickZBuff[0].z == 0);
    for (MG_PICKZ &pick : mgPickZBuff) {
        pick = {};
    }
    DC_CHECK(MGPortDepth(16700000) == 1.0f && MGPortDepth(1) == 0.0f && MGPortDepth(0) == 0.0f);
}

// MGMoveImage copies a rect between two TEX0s; MGStretchMoveImage scales one (rects in 12.4).
// The frame buffer's rects count field rows, so a frame grab of 640x240 is the full frame.
DC_TEST(draw3d_move_images) {
    Draw3DFixture fixture;
    Registry::textures[0] = gfx::CreateTexture({64, 64, gfx::TextureFormat::Rgba8, 1, true});
    Registry::textures[1] = gfx::CreateTexture({64, 64, gfx::TextureFormat::Rgba8, 1, true});
    Registry::textures[2] = gfx::CreateRenderTarget(640, 256, true);
    std::vector<uint32_t> pattern(64 * 64);
    for (uint32_t y = 0; y < 64; y++) {
        for (uint32_t x = 0; x < 64; x++) {
            pattern[y * 64 + x] = Rgba(static_cast<uint8_t>(x * 4), static_cast<uint8_t>(y * 4), 77);
        }
    }
    DC_CHECK(gfx::UpdateTexture(Registry::textures[0], 0, 0, 0, 64, 64, pattern.data()));

    // Without a resolver every TEX0 is unknown: nothing happens and nothing breaks.
    sceGsTex0 a = AsTex0(Registry::Tex0(0));
    sceGsTex0 b = AsTex0(Registry::Tex0(1));
    sceGsTex0 grab = AsTex0(Registry::Tex0(2));
    fixture.Frame([&] { MGMoveImage(&a, CRect_i_(0, 0, 16, 16), &b, 0, 0, 0); });

    Draw3DSetResolvers(Registry::Resolve, nullptr);
    sceGsTex0 frame;
    MGGetFBuffTex(&frame);
    DC_CHECK(frame.TBP0 == kMGPortFrameTbp0 && frame.bits.tw == 10 && frame.bits.th == 8);
    sceGsTex0 back;
    MGGetFBuffBackTex(&back);
    DC_CHECK(back.TBP0 == kMGPortPreviousFrameTbp0);

    fixture.Frame([&] {
        MGClearScreen(0, 0, 0, 0x80);
        MGFillBox(CRect_i_(0, 0, 320 * 16, 60 * 16), 0, 200, 0, 0x80);
        MGMoveImage(&a, CRect_i_(8, 4, 16, 16), &b, 32, 40, 0);
        MGStretchMoveImage(&a, CRect_i_(0, 0, 16 * 16, 16 * 16), &b, CRect_i_(0, 0, 32 * 16, 32 * 16));
        MGMoveImage(&frame, CRect_i_(0, 0, 640, 240), &grab, 0, 0, 0);
    });

    std::vector<uint8_t> pixels;
    uint32_t             width = 0;
    uint32_t             height = 0;
    DC_CHECK(gfx::ReadbackTexture(Registry::textures[1], pixels, width, height));
    std::array<uint8_t, 4> moved = Texel(pixels, width, 32 + 3, 40 + 5);
    DC_CHECK(moved[0] == (8 + 3) * 4 && moved[1] == (4 + 5) * 4 && moved[2] == 77);
    DC_CHECK(Texel(pixels, width, 31, 39)[2] == 0);
    // Doubled: destination texel 20 samples source 10.
    std::array<uint8_t, 4> stretched = Texel(pixels, width, 21, 9);
    DC_CHECK(std::abs(stretched[0] - 10 * 4 - 2) <= 3 && std::abs(stretched[1] - 4 * 4 - 2) <= 3);

    // The grab: the frame's top 120 logical rows were green over the left half, which on the
    // field-high copy are its top 60 rows.
    DC_CHECK(gfx::ReadbackTexture(Registry::textures[2], pixels, width, height));
    DC_CHECK(Texel(pixels, width, 100, 50)[1] == 200);
    DC_CHECK(Texel(pixels, width, 100, 70)[1] == 0);
    DC_CHECK(Texel(pixels, width, 330, 50)[1] == 0);

    // MGMoveFrameBuffImage weaves both fields into a full-height image.
    gfx::TextureHandle full = gfx::CreateTexture({640, 480, gfx::TextureFormat::Rgba8, 1, true});
    Registry::textures[3] = full;
    sceGsTex0 image = AsTex0(Registry::Tex0(3));
    fixture.Frame([&] {
        MGFillBox(CRect_i_(0, 0, 320 * 16, 60 * 16), 0, 0, 220, 0x80);
        MGMoveFrameBuffImage(&image, 0, 0, 0);
    });
    DC_CHECK(gfx::ReadbackTexture(full, pixels, width, height));
    DC_CHECK(Texel(pixels, width, 100, 110)[2] == 220);
    DC_CHECK(Texel(pixels, width, 100, 130)[2] == 0);

    for (gfx::TextureHandle &texture : Registry::textures) {
        gfx::DestroyTexture(texture);
        texture = gfx::kNullTexture;
    }
}

// The fast shadow pass flattens the caster onto the plane along light 0 into shadow_buf, and
// MGEndDrawShadow(0x40) halves the frame wherever the target is not black: Cd - Cd * 0x40 / 0x80.
// A horizontal caster at y = 0 over depths 60..160 dropped onto the plane y = 5 covers logical
// rows 240 + 4000 / z, 265 to 307, around x = 320.
DC_TEST(draw3d_shadow_composite) {
    Draw3DFixture fixture;
    // The volume pass builds its clipped geometry in the frame's ActiveData arena.
    InitializeDataBuffer();
    gfx::TextureHandle target = gfx::NamedRenderTarget("shadow_buf", 640, 256, false);
    DC_CHECK(target != gfx::kNullTexture);

    std::vector<u_int> image(256, 0);
    auto              *bytes = reinterpret_cast<unsigned char *>(image.data());
    auto              *header = reinterpret_cast<MDT_HEADER *>(bytes);
    header->vertex_ofs = 64;
    header->vertex_num = 4;
    header->mesh_ofs = 128;
    float corners[4][4] = {
        {-10.0f, 0.0f, 60.0f,  1.0f},
        {10.0f,  0.0f, 60.0f,  1.0f},
        {-10.0f, 0.0f, 160.0f, 1.0f},
        {10.0f,  0.0f, 160.0f, 1.0f},
    };
    std::memcpy(bytes + 64, corners, sizeof(corners));
    auto *shadow = reinterpret_cast<MDT_SHADOW *>(bytes + 128);
    shadow->shape_num = 1;
    shadow->shape[0].index_num = 6;
    int order[6] = {0, 1, 2, 2, 1, 3};
    for (int i = 0; i < 6; i++) {
        shadow->shape[0].vertex[i].index = order[i];
    }

    alignas(64) unsigned int block[64] = {};
    CVisualShadow            visual;
    visual.CreateVUdataShadow(block, image.data());
    visual.vu_data_buffer[0] = visual.vu_data_buffer[1] = visual.vu_data;
    visual.SetMDTDataAddress(image.data());
    CFrameVu1 frame;
    frame.SetVisual(&visual);
    frame.attr.cull_enable = false;

    sceVu0FMATRIX light = {};
    light[1][0] = 1.0f;
    sceVu0FMATRIX colour = {};
    MGSetPLight(light, colour);
    sceVu0FVECTOR point = {0.0f, 5.0f, 0.0f, 1.0f};
    sceVu0FVECTOR normal = {0.0f, 1.0f, 0.0f, 0.0f};

    MGSetBGColor(200.0f, 200.0f, 200.0f, 128.0f);
    fixture.Frame([&] {
        sceGsTex0 unknown = {};
        MGBeginDrawShadow(unknown);
        DC_CHECK(gfx::CurrentRenderTarget() == target);
        MGDrawShadowFast(&frame, point, normal);
        MGEndDrawShadow(0x40);
        DC_CHECK(gfx::CurrentRenderTarget() == gfx::kMainTarget);
    });
    DC_CHECK(fixture.PixelNear(320, 285, 100, 100, 100));
    DC_CHECK(fixture.PixelNear(320, 250, 200, 200, 200));
    DC_CHECK(fixture.PixelNear(320, 320, 200, 200, 200));
    DC_CHECK(fixture.PixelNear(200, 285, 200, 200, 200));

    // Outside MGBeginDrawShadow/MGEndDrawShadow a shadow pass draws nothing.
    fixture.Frame([&] { MGDrawShadowFast(&frame, point, normal); });
    DC_CHECK(fixture.PixelNear(320, 285, 200, 200, 200));

    // The volume pass casts the triangles that face away from the light: the same footprint.
    fixture.Frame([&] {
        sceGsTex0 unknown = {};
        MGBeginDrawShadow(unknown);
        MGDrawShadow(&frame, point, normal);
        MGEndDrawShadow(0x40);
    });
    DC_CHECK(fixture.PixelNear(320, 285, 100, 100, 100));
    DC_CHECK(fixture.PixelNear(320, 250, 200, 200, 200));
    gfx::DestroyTexture(target);
}
