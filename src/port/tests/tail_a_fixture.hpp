#pragma once

// SDL's headers name parameters A and B, which libgraph.h defines as macros: SDL goes first.
#include <SDL3/SDL.h>

#include <array>
#include <cstring>
#include <string>
#include <vector>

#include "draw3d_fixture.hpp"
#include "tex_fixture.hpp"
#include "texture.hpp"
#include "texture_port.hpp"

namespace dc::test {

// The game's renderer state (Draw3DFixture) with a fresh texture manager, so the long-tail units
// find their textures by name as they do in the game.
struct TailAFixture : Draw3DFixture {
    TailAFixture() {
        TexManager.Initialize(16352);
        TexManager.SetBuffer(texfix::staging, static_cast<int>(std::size(texfix::staging)));
    }

    ~TailAFixture() { TexManager.Initialize(16352); }

    // Placeholders ("#name#w#h#bpp") entered as the game's texture tables enter them.
    void Placeholders(std::initializer_list<const char *> names, int block = 3) {
        std::vector<std::string>      storage(names.begin(), names.end());
        std::vector<LOADTEXTURE_INFO> table;
        for (std::string &name : storage) {
            table.push_back({name.data(), block, 0});
        }
        char end[] = "";
        table.push_back({end, 0, 0});
        TexManager.LoadTextureBlock(-1, table.data(), nullptr);
    }

    void Images(texfix::Bytes img, int block = 4) {
        images.push_back(std::move(img));
        TexManager.BeginEnterTextureBlock(block);
        TexManager.EnterIMGFile(images.back().data(), block, 0, 0);
        TexManager.EndEnterTextureBlock(block);
    }

    static CTexture *Named(const char *name) {
        std::string mutable_name(name);
        return TexManager.GetTexture(mutable_name.data(), -1);
    }

    static gfx::TextureHandle Handle(const char *name) {
        return PortTextureFromCTexture(Named(name)).binding.texture;
    }

    // A texture's base level at its pixel size, read outside a frame.
    struct Pixels {
        std::vector<uint8_t> rgba;
        uint32_t             width = 0;
        uint32_t             height = 0;

        std::array<uint8_t, 4> At(uint32_t x, uint32_t y) const {
            const uint8_t *p = &rgba[(static_cast<size_t>(y) * width + x) * 4];
            return {p[0], p[1], p[2], p[3]};
        }

        bool Near(uint32_t x, uint32_t y, int r, int g, int b, int a = -1, int tolerance = 3) const {
            std::array<uint8_t, 4> p = At(x, y);
            bool                   near = std::abs(p[0] - r) <= tolerance && std::abs(p[1] - g) <= tolerance &&
                        std::abs(p[2] - b) <= tolerance && (a < 0 || std::abs(p[3] - a) <= tolerance);
            if (!near) {
                std::fprintf(stderr, "texel %u,%u is %d,%d,%d,%d, expected %d,%d,%d,%d\n", x, y, p[0], p[1], p[2],
                             p[3], r, g, b, a);
            }
            return near;
        }
    };

    static Pixels Read(gfx::TextureHandle texture) {
        Pixels pixels;
        DC_CHECK(gfx::ReadbackTexture(texture, pixels.rgba, pixels.width, pixels.height));
        return pixels;
    }

    std::vector<texfix::Bytes> images;
};

// A 32-bit TIM2 of one GS colour (alpha 0x80 opaque).
inline texfix::Bytes SolidTim2(int width, int height, uint32_t gs_rgba) {
    texfix::Bytes texels;
    for (int i = 0; i < width * height; i++) {
        for (int shift = 0; shift < 32; shift += 8) {
            texels.push_back(static_cast<uint8_t>(gs_rgba >> shift));
        }
    }
    return texfix::Tim2({TIM2_RGB32, width, height, {texels}, {}, 0});
}

// One-pixel vertical stripes over a logical rect, nearest sampled: what a blur must smear.
inline void Stripes(float x, float y, float w, float h, uint32_t even, uint32_t odd) {
    static gfx::TextureHandle texture = gfx::kNullTexture;
    if (texture == gfx::kNullTexture || !gfx::GetTextureInfo(texture)) {
        texture = gfx::CreateTexture({2, 1, gfx::TextureFormat::Rgba8, 1, true});
    }
    uint32_t texels[2] = {even, odd};
    gfx::UpdateTexture(texture, 0, 0, 0, 2, 1, texels);
    gfx::TextureBinding binding;
    binding.texture = texture;
    binding.filter = gfx::Filter::Nearest;
    binding.wrap_u = gfx::Wrap::Repeat;
    auto quad = Quad(x, y, w, h, {0x80, 0x80, 0x80, 0x80}, 0.0f, 0.0f, w, 1.0f);
    gfx::Draw2D(gfx::Primitive::Quads, quad, binding, gfx::DrawState{});
}

} // namespace dc::test
