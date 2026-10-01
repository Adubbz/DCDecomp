#pragma once

#include "gfx/gfx.hpp"

#include <libgraph.h>

class CTexture;

// What the renderer needs to sample one of the game's textures. The game passes textures
// around as TEX0/TEX1 register values and as registry handles; the texture manager keeps the
// TBP0 of every live texture unique (and CBP of every palette), so a TEX0 resolves to exactly
// one image. TBP0 kMGPortFrameTbp0 and kMGPortPreviousFrameTbp0 (mglib_port.hpp) resolve to
// gfx::kMainTarget and gfx::kPreviousFrame.
struct PortTextureRef {
    gfx::TextureBinding binding;
    unsigned            width = 0;  // logical texels
    unsigned            height = 0; // logical texels
    bool                valid = false;
};

PortTextureRef PortTextureFromTex0(u_long tex0, u_long tex1);
PortTextureRef PortTextureFromTex0(const sceGsTex0 &tex0, u_long tex1 = 0);
PortTextureRef PortTextureFromHandle(int handle);
PortTextureRef PortTextureFromCTexture(const CTexture *texture);
