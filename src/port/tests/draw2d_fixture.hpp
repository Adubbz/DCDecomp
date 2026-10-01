#pragma once

#include <SDL3/SDL.h>
#include <libgraph.h>

#include <map>
#include <memory>
#include <string>
#include <vector>

#include "draw2d_port.hpp"
#include "gfx_fixture.hpp"
#include "mglib.hpp"
#include "texture.hpp"

namespace dc::test {

// Stands in for the 3D path's register state and the texture manager, which other phases provide:
// textures are found by TBP0, the ALPHA register is tracked through setAlphaFlag and friends.
struct FakeGs {
    struct Texture {
        gfx::TextureHandle handle;
        gfx::TextureHandle palette;
        unsigned           width;
        unsigned           height;
    };

    gfx::DrawState                                   state;
    std::map<unsigned, Texture>                      textures;
    std::map<std::string, std::unique_ptr<CTexture>> named;
    int                                              test_writes = 0;
    int                                              zbuf_writes = 0;
    int                                              alpha_writes = 0;
    int                                              texa_writes = 0;

    static FakeGs *&Current() {
        static FakeGs *current = nullptr;
        return current;
    }

    static void Decode(gfx::DrawState &state, const sceGsAlpha &alpha) {
        state.alpha.a = static_cast<uint8_t>(alpha.A);
        state.alpha.b = static_cast<uint8_t>(alpha.B);
        state.alpha.c = static_cast<uint8_t>(alpha.C);
        state.alpha.d = static_cast<uint8_t>(alpha.D);
        state.alpha.fix = static_cast<uint8_t>(alpha.FIX);
    }

    FakeGs();

    ~FakeGs() {
        draw2d::SetServices(nullptr);
        for (auto &[tbp, texture] : textures) {
            if (texture.handle > gfx::kPreviousFrame) {
                gfx::DestroyTexture(texture.handle);
            }
            if (texture.palette != gfx::kNullTexture) {
                gfx::DestroyTexture(texture.palette);
            }
        }
        Current() = nullptr;
    }

    // A CTexture whose TEX0 names tbp0, registered under name.
    CTexture *Name(const std::string &name, unsigned tbp0, unsigned tcc = 1) {
        auto texture = std::make_unique<CTexture>();
        texture->tex0 = SCE_GS_SET_TEX0(tbp0, 1, 0, 8, 8, tcc, 0, 0, 0, 0, 0, 0);
        CTexture *raw = texture.get();
        named[name] = std::move(texture);
        return raw;
    }

    // An RGBA texture filled with one renderer colour (alpha 0xFF is GS 0x80).
    CTexture *Solid(const std::string &name, unsigned tbp0, unsigned width, unsigned height, uint32_t rgba,
                    bool has_alpha = true) {
        std::vector<uint32_t> texels(static_cast<size_t>(width) * height, rgba);
        return Image(name, tbp0, width, height, texels.data(), has_alpha);
    }

    CTexture *Image(const std::string &name, unsigned tbp0, unsigned width, unsigned height,
                    const uint32_t *rgba, bool has_alpha = true) {
        gfx::TextureHandle handle =
            gfx::CreateTexture({width, height, gfx::TextureFormat::Rgba8, 1, has_alpha});
        DC_CHECK(handle != gfx::kNullTexture);
        DC_CHECK(gfx::UpdateTexture(handle, 0, 0, 0, width, height, rgba));
        textures[tbp0] = {handle, gfx::kNullTexture, width, height};
        return Name(name, tbp0);
    }
};

inline constexpr draw2d::Services kFakeServices = {
    [] { return FakeGs::Current()->state; },
    [](u_long tex0, u_long) {
        PortTextureRef ref;
        auto           found = FakeGs::Current()->textures.find(static_cast<unsigned>(tex0 & 0x3FFF));
        if (found != FakeGs::Current()->textures.end()) {
            ref.binding.texture = found->second.handle;
            ref.binding.palette = found->second.palette;
            ref.width = found->second.width;
            ref.height = found->second.height;
            ref.valid = true;
        }
        return ref;
    },
    [](const char *name) -> CTexture * {
        auto found = FakeGs::Current()->named.find(name);
        return found != FakeGs::Current()->named.end() ? found->second.get() : nullptr;
    },
    [](sceGsTest *) { FakeGs::Current()->test_writes++; },
    [](sceGsZbuf *) { FakeGs::Current()->zbuf_writes++; },
    [](sceGsAlpha *alpha) {
        FakeGs::Current()->alpha_writes++;
        FakeGs::Decode(FakeGs::Current()->state, alpha != nullptr ? *alpha : mgAlpha);
    },
    [](sceGsTexa *) { FakeGs::Current()->texa_writes++; },
};

inline FakeGs::FakeGs() {
    Current() = this;
    mgAlpha.value = 0;
    mgAlpha.A = 0;
    mgAlpha.B = 1;
    mgAlpha.C = 0;
    mgAlpha.D = 1;
    Decode(state, mgAlpha);
    draw2d::SetServices(&kFakeServices);
}

} // namespace dc::test
