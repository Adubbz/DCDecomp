#include <gtest/gtest.h>

#include "shadow_fixture.hpp"

using namespace dc::test;

namespace {

// The box hangs over the floor at y 20 around x 0, z 150; the shadow plane is under the floor, as
// the game drops it shadow_offset (or 12.8) past the feet, so the prisms cross the floor there.
// On the floor the footprint covers rows 340 to 354 and, at z 150, columns 267 to 373.
ShadowMesh HangingBox(float x0 = -10.0f, float x1 = 10.0f) {
    ShadowMesh mesh;
    mesh.Box({x0, -10.0f, 140.0f}, {x1, 0.0f, 160.0f});
    return mesh;
}

sceVu0FVECTOR kPlanePoint = {0.0f, 25.0f, 0.0f, 1.0f};
sceVu0FVECTOR kPlaneNormal = {0.0f, 1.0f, 0.0f, 0.0f};

using Pass = void (*)(CFrame *, float *, float *);

void DrawShadows(std::initializer_list<CFrame *> frames, Pass pass, u_char alpha = 0x40) {
    MGBeginDrawShadow(sceGsTex0{});
    for (CFrame *frame : frames) {
        pass(frame, kPlanePoint, kPlaneNormal);
    }
    MGEndDrawShadow(alpha);
}

// Pixels on the floor inside the footprint halve (Cd - Cd * 0x40 / 0x80); those whose ray passes
// through the volume to floor beyond it, those in front of it and those beside it do not.
void CheckFootprint(ShadowScene &scene) {
    ASSERT_TRUE(scene.PixelNear(320, 347, 100, 100, 100));
    ASSERT_TRUE(scene.PixelNear(290, 347, 100, 100, 100));
    ASSERT_TRUE(scene.PixelNear(320, 330, 200, 200, 200));
    ASSERT_TRUE(scene.PixelNear(320, 365, 200, 200, 200));
    ASSERT_TRUE(scene.PixelNear(250, 347, 200, 200, 200));
}

} // namespace

TEST(ShadowVolume, FastVolumeOnFloor) {
    ShadowScene  scene;
    ShadowCaster caster(HangingBox());
    for (Pass pass : {&MGDrawShadowFast, &MGDrawShadowFast2, &MGDrawShadow}) {
        scene.Frame([&] {
            ShadowScene::Floor(20.0f);
            DrawShadows({&caster.frame}, pass);
            ASSERT_TRUE(gfx::CurrentRenderTarget() == gfx::kMainTarget);
        });
        CheckFootprint(scene);
    }

    // Outside MGBeginDrawShadow/MGEndDrawShadow a shadow pass draws nothing.
    scene.Frame([&] {
        ShadowScene::Floor(20.0f);
        MGDrawShadowFast(&caster.frame, kPlanePoint, kPlaneNormal);
    });
    ASSERT_TRUE(scene.PixelNear(320, 347, 200, 200, 200));

    // Nothing receives the volume where the scene is empty: front and back faces cancel.
    scene.Frame([&] { DrawShadows({&caster.frame}, &MGDrawShadowFast); });
    ASSERT_TRUE(scene.PixelNear(320, 347, 0, 0, 0));
}

// A wall at z 100 standing on the floor right of x 0 hides the right half of the footprint: those
// pixels keep the wall's colour, the left half of the footprint is still darkened.
TEST(ShadowVolume, OccluderHidesVolume) {
    ShadowScene  scene;
    ShadowCaster caster(HangingBox());
    for (Pass pass : {&MGDrawShadowFast, &MGDrawShadow}) {
        scene.Frame([&] {
            ShadowScene::Floor(20.0f);
            ShadowScene::Quad({
                                  {{0.0f, -100.0f, 100.0f}, {300.0f, -100.0f, 100.0f}, {300.0f, 20.0f, 100.0f}, {0.0f, 20.0f, 100.0f}}
            },
                              {40, 80, 160});
            DrawShadows({&caster.frame}, pass);
        });
        ASSERT_TRUE(scene.PixelNear(300, 347, 100, 100, 100));
        ASSERT_TRUE(scene.PixelNear(340, 347, 40, 80, 160));
        ASSERT_TRUE(scene.PixelNear(360, 347, 40, 80, 160));
    }
}

// Two casters whose footprints overlap between x 0 and 10 darken the overlap once, as retail's
// TEXA turns any non-black count into the same alpha.
TEST(ShadowVolume, OverlapDarkensOnce) {
    ShadowScene  scene;
    ShadowCaster left(HangingBox(-10.0f, 10.0f));
    ShadowCaster right(HangingBox(0.0f, 20.0f));
    scene.Frame([&] {
        ShadowScene::Floor(20.0f);
        DrawShadows({&left.frame, &right.frame}, &MGDrawShadowFast);
    });
    ASSERT_TRUE(scene.PixelNear(290, 347, 100, 100, 100));
    ASSERT_TRUE(scene.PixelNear(347, 347, 100, 100, 100));
    ASSERT_TRUE(scene.PixelNear(390, 347, 100, 100, 100));
    ASSERT_TRUE(scene.PixelNear(440, 347, 200, 200, 200));
}

// The floor rises towards the eye (y = 20 + (z - 150) / 2, row 640 - 44000 / z) and the plane is
// far below it: the volume meets the slope over z 140 to 160, rows 326 to 365, where a caster
// flattened onto the plane would land off the frame.
TEST(ShadowVolume, FollowsSlopedFloor) {
    ShadowScene   scene;
    ShadowCaster  caster(HangingBox());
    sceVu0FVECTOR deep = {0.0f, 200.0f, 0.0f, 1.0f};
    for (Pass pass : {&MGDrawShadow, &MGDrawShadowFast}) {
        scene.Frame([&] {
            ShadowScene::Quad({
                                  {{-400.0f, -30.0f, 50.0f}, {400.0f, -30.0f, 50.0f}, {400.0f, 145.0f, 400.0f}, {-400.0f, 145.0f, 400.0f}}
            },
                              {200, 200, 200});
            MGBeginDrawShadow(sceGsTex0{});
            pass(&caster.frame, deep, kPlaneNormal);
            MGEndDrawShadow(0x40);
        });
        ASSERT_TRUE(scene.PixelNear(320, 335, 100, 100, 100));
        ASSERT_TRUE(scene.PixelNear(320, 347, 100, 100, 100));
        ASSERT_TRUE(scene.PixelNear(320, 360, 100, 100, 100));
        ASSERT_TRUE(scene.PixelNear(320, 318, 200, 200, 200));
        ASSERT_TRUE(scene.PixelNear(320, 372, 200, 200, 200));
    }
}

// With the eye inside a volume (a caster overhead, the plane below the floor) MGDrawShadow's
// near-plane cap keeps the count: the floor under the caster is shadowed and the floor past the
// volume's far side (z above 200) is not. The fast program has no cap, as retail's has none.
TEST(ShadowVolume, EyeInside) {
    ShadowScene scene;
    ShadowMesh  mesh;
    mesh.Box({-50.0f, -60.0f, -50.0f}, {50.0f, -40.0f, 200.0f});
    ShadowCaster caster(mesh);
    scene.Frame([&] {
        ShadowScene::Floor(20.0f);
        DrawShadows({&caster.frame}, &MGDrawShadow);
    });
    ASSERT_TRUE(scene.PixelNear(320, 400, 100, 100, 100));
    ASSERT_TRUE(scene.PixelNear(320, 340, 100, 100, 100));
    ASSERT_TRUE(scene.PixelNear(320, 300, 200, 200, 200));
    ASSERT_TRUE(scene.PixelNear(5, 300, 200, 200, 200));
}

// Whatever lands in the shadow target (MGDrawShade's meshes write their colour there as they are)
// is depth-tested against the scene drawn before MGBeginDrawShadow.
TEST(ShadowVolume, TargetSharesSceneDepth) {
    ShadowScene scene;
    scene.Frame([&] {
        ShadowScene::Floor(20.0f);
        MGBeginDrawShadow(sceGsTex0{});
        gfx::TextureHandle              target = gfx::CurrentRenderTarget();
        std::optional<gfx::TextureInfo> info = gfx::GetTextureInfo(target);
        ASSERT_TRUE(target != gfx::kMainTarget && info && info->shares_main_depth);
        // A quad at the floor's depth range but behind it (y 30) fails; one in front (y 10) lands.
        ShadowScene::Quad({
                              {{-50.0f, 30.0f, 100.0f}, {0.0f, 30.0f, 100.0f}, {0.0f, 30.0f, 200.0f}, {-50.0f, 30.0f, 200.0f}}
        },
                          {255, 255, 255});
        ShadowScene::Quad({
                              {{0.0f, 10.0f, 100.0f}, {50.0f, 10.0f, 100.0f}, {50.0f, 10.0f, 200.0f}, {0.0f, 10.0f, 200.0f}}
        },
                          {255, 255, 255});
        MGEndDrawShadow(0x40);
    });
    ASSERT_TRUE(scene.PixelNear(300, 360, 200, 200, 200));
    ASSERT_TRUE(scene.PixelNear(330, 300, 100, 100, 100));
}
