#include "title_port.hpp"

#include <libgraph.h>
#include <libvu0.h>

#include <bit>

#include "mglib.hpp"
#include "rect.hpp"
#include "snd.hpp"
#include "texture.hpp"

// The title units declare their own rectangle template where every other unit takes CRect_i_.
// MWCC mangled both the same, so retail linked the title's calls to the shared definitions; clang
// mangles CRect<int> apart, so these give the title's spelling a body (clothread.cpp has MoveImageTest's).
template <class T>
class CRect {
public:
    T x;
    T y;
    T w;
    T h;
};

class RenderInfo;

namespace {

CRect_i_ Rect(const CRect<int> &rect) { return CRect_i_(rect.x, rect.y, rect.w, rect.h); }

} // namespace

// The previous frame is 640x480 logical; its TEX0 counts field rows, as the frame buffer's did.
void TitlePortFeedback(u_char alpha) {
    sceGsTex0 back;
    MGGetFBuffBackTex(&back);
    CTexture texture;
    texture.tex0 = std::bit_cast<u_long>(back);
    set2DSprite(Vif1Packet, &texture, CRect_i_(0, 0, 640, SCREEN_HEIGHT), CRect_i_(0, 0, 640, SCREEN_HALF_HEIGHT), 128,
                128, 128, alpha);
}

void set2DSprite(sceVif1Packet *packet, CTexture *texture, const CRect<int> &screen, const CRect<int> &texel,
                 u_char alpha) {
    set2DSprite(packet, texture, Rect(screen), Rect(texel), alpha);
}

void set2DSprite(sceVif1Packet *packet, CTexture *texture, const CRect<int> &screen, const CRect<int> &texel,
                 u_char red, u_char green, u_char blue, u_char alpha) {
    set2DSprite(packet, texture, Rect(screen), Rect(texel), red, green, blue, alpha);
}

void set2DSprite(sceVif1Packet *packet, CTexture *texture, const CRect<int> &screen, const CRect<int> &texel,
                 int pivot_x, int pivot_y, float angle) {
    set2DSprite(packet, texture, Rect(screen), Rect(texel), pivot_x, pivot_y, angle);
}

void MGMoveImage(sceGsTex0 *src, const CRect<int> &rect, sceGsTex0 *dst, int dst_x, int dst_y, int direction) {
    MGMoveImage(src, Rect(rect), dst, dst_x, dst_y, direction);
}

void MGStretchMoveImage(sceGsTex0 *src, const CRect<int> &src_rect, sceGsTex0 *dst, const CRect<int> &dst_rect) {
    MGStretchMoveImage(src, Rect(src_rect), dst, Rect(dst_rect));
}

void MGFillBox(const CRect<int> &rect, u_char r, u_char g, u_char b, u_char a) { MGFillBox(Rect(rect), r, g, b, a); }

// The title's own CWater declares DrawVu1 with a u_long128 * where water.hpp has a RenderInfo *;
// both reach the one body retail has.
class CWater {
public:
    int DrawVu1(RenderInfo *info, sceVif1Packet *packet, u_long128 *parent_info);
};

extern "C" int DrawVu1__6CWaterFP10RenderInfoP13sceVif1PacketP1(CWater *water, RenderInfo *info,
                                                                sceVif1Packet *draw_packet, void *parent_info);

int CWater::DrawVu1(RenderInfo *info, sceVif1Packet *packet, u_long128 *parent_info) {
    return DrawVu1__6CWaterFP10RenderInfoP13sceVif1PacketP1(this, info, packet, parent_info);
}
