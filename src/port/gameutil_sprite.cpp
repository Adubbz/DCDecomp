#include <vector>

#include "draw2d_port.hpp"
#include "gameutil.hpp"
#include "rect.hpp"
#include "snd.hpp"
#include "texture.hpp"

namespace {

// Retail's sprite batches filter with a file-static flag nothing ever sets.
constexpr u_long kBatchTex1 = 0x41;

bool                       g_batch_open = false;
u_long                     g_batch_tex0 = 0;
std::vector<gfx::Vertex2D> g_batch;

} // namespace

// The batch draws when it closes, which is where retail's packet reaches the GS: nothing else may
// write to the packet between Start and End.
void set2DSprite_Start(sceVif1Packet *packet, CTexture *texture) {
    g_batch.clear();
    g_batch_open = texture != nullptr;
    if (texture != nullptr) {
        g_batch_tex0 = texture->tex0;
    }
}

void set2DSprite_Core(sceVif1Packet *packet, CTexture *texture, const CRect_i_ &screen, const CRect_i_ &texel,
                      u8 red, u8 green, u8 blue, u8 alpha) {
    if (texture == nullptr || !g_batch_open) {
        return;
    }

    const float x0 = static_cast<float>(screen.x);
    const float y0 = static_cast<float>(screen.y);
    const float x1 = static_cast<float>(screen.x + screen.width);
    const float y1 = static_cast<float>(screen.y + screen.height);
    const float u0 = static_cast<float>(texel.x);
    const float v0 = static_cast<float>(texel.y);
    const float u1 = static_cast<float>(texel.x + texel.width);
    const float v1 = static_cast<float>(texel.y + texel.height);

    g_batch.push_back(draw2d::Vertex(x0, y0, 0.0f, u0, v0, red, green, blue, alpha));
    g_batch.push_back(draw2d::Vertex(x1, y0, 0.0f, u1, v0, red, green, blue, alpha));
    g_batch.push_back(draw2d::Vertex(x1, y1, 0.0f, u1, v1, red, green, blue, alpha));
    g_batch.push_back(draw2d::Vertex(x0, y1, 0.0f, u0, v1, red, green, blue, alpha));
}

void set2DSprite_End(sceVif1Packet *packet, CTexture *texture) {
    if (!g_batch_open) {
        return;
    }

    g_batch_open = false;
    draw2d::DrawTextured(gfx::Primitive::Quads, g_batch, g_batch_tex0, kBatchTex1, draw2d::SpriteState());
    draw2d::RestoreTestZbuf();
    g_batch.clear();
}

// The CLUT goes up as a 16x16 PSMCT32 block that the GS reads in CSM1 order, which swaps bits 3
// and 4 of the index; the palette is indexed by the texel value itself.
void SetClut(sceVif1Packet *packet, CTexture *texture, i *clut) {
    if (texture == nullptr || clut == nullptr) {
        return;
    }

    PortTextureRef ref = draw2d::Get().texture(texture->tex0, 0);
    if (!ref.valid || ref.binding.palette == gfx::kNullTexture) {
        return;
    }

    const u_int *uploaded = reinterpret_cast<const u_int *>(clut);
    uint32_t     entries[256];
    for (uint32_t index = 0; index < 256; index++) {
        const uint32_t stored = ((index >> 3) ^ (index >> 4)) & 1 ? index ^ 0x18 : index;
        entries[index] = uploaded[stored];
    }
    gfx::ConvertPs2Alpha(entries, 256);
    gfx::UpdatePalette(ref.binding.palette, entries);
}
