#include "effectmacro.hpp"

#include <libgraph.h>
#include <libvu0.h>

#include <cstdlib>
#include <vector>

#include "draw2d_port.hpp"
#include "mglib.hpp"
#include "mglib_port.hpp"
#include "rect.hpp"
#include "texture.hpp"

namespace {

// TEX1 0x61: LCM 1, linear magnification and minification.
constexpr u_long kTex1Linear = 0x61;

// The jitter table. Retail reads rd[i][j + 1] for j up to 14, which runs one entry past the end of
// the last row; the spare entry stands in for that word and stays zero.
float g_jitter[21 * 15 + 1];

float &Jitter(int i, int j) { return g_jitter[i * 15 + j]; }

gfx::Vertex2D StripVertex(int x, int y, unsigned z, int u, int v, int alpha) {
    return draw2d::Vertex(MGPortLogicalX(x), MGPortLogicalY(y), MGPortDepth(z & 0xFFFFFF),
                          static_cast<float>(u) / 16.0f, static_cast<float>(v) / 16.0f, 0x80, 0x80, 0x80,
                          static_cast<u_char>(alpha));
}

// One GS triangle strip as a triangle list, so that every band of the effect goes in one draw.
void AppendStrip(std::vector<gfx::Vertex2D> &triangles, const std::vector<gfx::Vertex2D> &strip) {
    for (size_t i = 2; i < strip.size(); i++) {
        triangles.push_back(strip[i - 2]);
        triangles.push_back(strip[i - 1]);
        triangles.push_back(strip[i]);
    }
}

} // namespace

// The frame is shrunk into frame_image twice (half width at 0, quarter width at 320), then drawn
// back over itself in bands whose depth is that of the focus planes, alpha blended and depth tested
// GEQUAL without writes: only what lies beyond a plane takes the blurred copy. The first pass
// alternates the near plane's two depths column by column, the second the far plane's, and with
// blur the second pass's columns wander sideways by up to blur sixteenths of a pixel.
void DepthOfField(float *focus, int level, int alpha, int blur) {
    sceGsTex0 frame;
    sceGsTex0 image;
    int       phase;
    int       i;
    int       j;
    int       k;

    MGGetFBuffTex(&frame);
    image = *(sceGsTex0 *) &TexManager.GetTexture(const_cast<char *>("frame_image"), -1)->tex0;
    frame.PSM = SCE_GS_PSMCT24;
    MGStretchMoveImage(&frame, CRect_i_(0, 0, 0x2800, (SCREEN_HALF_HEIGHT << 4)), &image,
                       CRect_i_(0, 0, 0x1400, (SCREEN_HALF_HEIGHT << 4)));
    MGStretchMoveImage(&image, CRect_i_(0, 0, 0x1400, (SCREEN_HALF_HEIGHT << 4)), &image,
                       CRect_i_(0x1400, 0, 0xA00, (SCREEN_HALF_HEIGHT << 4)));

    sceVu0FVECTOR depth_point[4] = {
        {0.0f, 0.0f, focus[0],         1.0f},
        {0.0f, 0.0f, focus[0] + 30.0f, 1.0f},
        {0.0f, 0.0f, focus[1],         1.0f},
        {0.0f, 0.0f, focus[1] + 20.0f, 1.0f},
    };
    int screen[4][4] = {};

    for (i = 0; i < 4; i++) {
        sceVu0ApplyMatrix(depth_point[i], mgRenderInfo.screen, depth_point[i]);
        depth_point[i][2] /= depth_point[i][3];
        screen[i][2] = (int) depth_point[i][2];
    }

    const draw2d::Services &services = draw2d::Get();
    sceGsTest               test = mgPixelTest;
    test.bits.ate = 0;
    test.bits.aref = 0;
    test.bits.atst = 1;
    test.bits.zte = 1;
    test.bits.ztst = 2;
    services.set_test(&test);
    sceGsZbuf zbuffer = mgZBuffer;
    zbuffer.bits.zmsk = 1;
    services.set_zbuf(&zbuffer);

    std::vector<gfx::Vertex2D> triangles;
    std::vector<gfx::Vertex2D> strip;

    for (phase = 0; phase < 1; phase++) {
        for (k = 0; k < 8; k++) {
            strip.clear();

            for (j = 0; j < 41; j++) {
                int x = (j << 8) + 0x6C00;
                int v = k << 9;
                int y = v + GS_Y_OFFSET;
                int u = j << 7;
                strip.push_back(StripVertex(x, y, screen[(j + phase) % 2][2], u, v, alpha));
                strip.push_back(StripVertex(x, y + 0x200, screen[(j + phase) % 2][2], u, v + 0x200, alpha));
            }

            AppendStrip(triangles, strip);
        }
    }

    if (level >= 2) {
        if (blur > 0) {
            for (i = 0; i < 21; i++) {
                for (j = 0; j < 15; j++) {
                    if (blur > 0) {
                        Jitter(i, j) += 0.2f * ((float) blur * ((float) rand() / 2147483648.0f - 0.5f));

                        if (Jitter(i, j) < 0.0f) {
                            Jitter(i, j) = 0.0f;
                        }

                        if (Jitter(i, j) > (float) blur) {
                            Jitter(i, j) = (float) blur;
                        }
                    } else {
                        Jitter(i, j) = 0.0f;
                    }
                }
            }
        }

        if (blur > 0) {
            alpha = 0x80;
        }

        for (j = 0; j < SCREEN_HALF_HEIGHT / 16; j++) {
            strip.clear();

            for (i = 0; i < 21; i++) {
                int x = (i << 9) + 0x6C00;
                int v = j << 8;
                int y = v + GS_Y_OFFSET;
                int y_bottom = y + 0x100;
                int u = (i << 7) + 0x1400;
                int v_bottom = v + 0x100;

                if (blur > 0) {
                    strip.push_back(StripVertex(x - (int) Jitter(i, j), y, screen[2 + i % 2][2], u, v, alpha));
                    strip.push_back(StripVertex(x - (int) Jitter(i, j + 1), y_bottom, screen[2 + i % 2][2], u,
                                                v_bottom, alpha));
                } else {
                    strip.push_back(StripVertex(x, y, screen[2 + i % 2][2], u, v, alpha));
                    strip.push_back(StripVertex(x, y_bottom, screen[2 + i % 2][2], u, v_bottom, alpha));
                }
            }

            AppendStrip(triangles, strip);
        }
    }

    gfx::DrawState state = services.draw_state();
    state.blend = true;
    state.fog = false;
    state.cull = gfx::CullMode::None;
    draw2d::DrawTextured(gfx::Primitive::Triangles, triangles, *reinterpret_cast<u_long *>(&image), kTex1Linear,
                         state);

    services.set_test(nullptr);
    services.set_zbuf(nullptr);
}
