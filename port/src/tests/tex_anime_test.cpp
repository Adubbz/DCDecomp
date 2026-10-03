#include <gtest/gtest.h>

#include "tex_fixture.hpp"
#include "textureanime.hpp"

using namespace dc::test;
using namespace texfix;

namespace {

CTexture *Named(const char *name) {
    std::string mutable_name(name);
    return TexManager.GetTexture(mutable_name.data(), -1);
}

std::vector<uint8_t> Indices(const CTexture *texture) {
    std::vector<uint8_t> pixels;
    uint32_t             width;
    uint32_t             height;
    EXPECT_TRUE(gfx::ReadbackTexture(PortTextureFromCTexture(texture).binding.texture, pixels, width, height));
    return pixels;
}

unsigned Cbp(const CTexture *texture) {
    return static_cast<unsigned>((texture->tex0 >> 37) & 0x3FFF);
}

// Three 4x4 8-bit textures in block 6: "src" with indices 0..15 and a CLUT of its own, "dst" and
// "part" zeroed with black CLUTs.
void EnterTextures() {
    Bytes ramp(16);
    for (int i = 0; i < 16; i++) {
        ramp[i] = static_cast<uint8_t>(i);
    }
    std::vector<uint32_t> words(256);
    for (int i = 0; i < 256; i++) {
        words[i] = Gs(static_cast<uint8_t>(i), 0, 0);
    }
    Bytes clut(1024);
    std::memcpy(clut.data(), words.data(), 1024);
    static Bytes img = Img({
        {"src",  Tim2({TIM2_IDTEX8, 4, 4, {ramp}, clut, 256})               },
        {"dst",  Tim2({TIM2_IDTEX8, 4, 4, {Bytes(16, 0)}, Clut256({}), 256})},
        {"part", Tim2({TIM2_IDTEX8, 4, 4, {Bytes(16, 0)}, Clut256({}), 256})}
    });
    TexManager.BeginEnterTextureBlock(6);
    TexManager.EnterIMGFile(img.data(), 6, 0, 0);
    TexManager.EndEnterTextureBlock(6);
}

CTexAnimeData Record(int kind, int group, const char *from, const char *to, int x, int y, int w, int h, int dx,
                     int dy) {
    CTexAnimeData record;
    record.kind = static_cast<s16>(kind);
    record.group = static_cast<s16>(group);
    record.duration = -1;
    record.first_texture.Copy(Named(from));
    record.second_texture.Copy(Named(to));
    record.source_x = static_cast<s16>(x);
    record.source_y = static_cast<s16>(y);
    record.source_width = static_cast<s16>(w);
    record.source_height = static_cast<s16>(h);
    record.dest_x = static_cast<s16>(dx);
    record.dest_y = static_cast<s16>(dy);
    return record;
}

} // namespace

TEST(TexAnime, RectCopyAndClut) {
    TexEnv env;
    EnterTextures();
    CTexAnimeData pool[4];
    CTextureAnime anime(pool, 4);
    CTextureAnime::stop_anime = 0;

    CTexAnimeData whole = Record(0, 2, "src", "dst", 0, 0, 4, 4, 0, 0);
    ASSERT_TRUE(anime.EnterTexAnime(&whole));
    // The CFG gives rects bottom-up; EnterTexAnime turns them over.
    CTexAnimeData corner = Record(0, 3, "src", "part", 0, 0, 2, 2, 0, 0);
    ASSERT_TRUE(anime.EnterTexAnime(&corner));
    anime.Enable(2);
    anime.Enable(3);
    anime.TexAnime(6);

    ASSERT_TRUE(Indices(Named("dst")) == Indices(Named("src")));
    uint32_t source[256];
    uint32_t copied[256];
    ASSERT_TRUE(PortPaletteEntries(Cbp(Named("src")), source));
    ASSERT_TRUE(PortPaletteEntries(Cbp(Named("dst")), copied));
    ASSERT_TRUE(std::memcmp(source, copied, sizeof source) == 0);

    std::vector<uint8_t> part = Indices(Named("part"));
    for (int y = 0; y < 4; y++) {
        for (int x = 0; x < 4; x++) {
            int expected = (y >= 2 && x < 2) ? y * 4 + x : 0;
            ASSERT_TRUE(part[y * 4 + x] == expected);
        }
    }
    // Only a whole-texture copy carries the CLUT.
    uint32_t untouched[256];
    ASSERT_TRUE(PortPaletteEntries(Cbp(Named("part")), untouched));
    ASSERT_TRUE(untouched[5] == Rgba(0, 0, 0));

    // Groups of another block are left alone.
    Bytes zero(16, 0);
    gfx::UpdateTexture(PortTextureFromCTexture(Named("dst")).binding.texture, 0, 0, 0, 4, 4, zero.data());
    anime.TexAnime(5);
    ASSERT_TRUE(Indices(Named("dst")) == std::vector<uint8_t>(16, 0));
}

TEST(TexAnime, ScrollWraps) {
    TexEnv env;
    EnterTextures();
    CTexAnimeData pool[2];
    CTextureAnime anime(pool, 2);
    CTextureAnime::stop_anime = 0;
    CTexAnimeData scroll = Record(1, 0, "src", "dst", 0, 0, 4, 4, 0, 0);
    scroll.scroll_x_step = 1.0f;
    ASSERT_TRUE(anime.EnterTexAnime(&scroll));
    anime.Enable(0);
    anime.TexAnime(6);
    ASSERT_TRUE(Indices(Named("dst")) == Indices(Named("src")));
    anime.TexAnime(6);
    std::vector<uint8_t> dst = Indices(Named("dst"));
    for (int y = 0; y < 4; y++) {
        for (int x = 0; x < 4; x++) {
            ASSERT_TRUE(dst[y * 4 + x] == y * 4 + (x + 1) % 4);
        }
    }
}

// A CLUT is a 16x16 PSMCT32 image read in CSM1 order, so a rect of it is a scattered set of
// entries: the eight positions from (8, 0) hold entries 16..23, and "src" was loaded with each
// position's value equal to the position.
TEST(TexAnime, ClutRectCopyFollowsCsm1Positions) {
    TexEnv env;
    EnterTextures();
    unsigned from = Cbp(Named("src"));
    unsigned to = Cbp(Named("dst"));
    ASSERT_TRUE(PortMoveImage(from, SCE_GS_PSMCT32, 8, 0, 8, 1, to, SCE_GS_PSMCT32, 0, 0));
    uint32_t palette[256];
    ASSERT_TRUE(PortPaletteEntries(to, palette));
    for (int i = 0; i < 8; i++) {
        ASSERT_TRUE(palette[i] == Rgba(static_cast<uint8_t>(8 + i), 0, 0));
    }
    ASSERT_TRUE(palette[8] == Rgba(0, 0, 0));

    // And the copy reaches the renderer's palette: index 3 of "dst" now draws position 11's red.
    gfx::UpdateTexture(PortTextureFromCTexture(Named("dst")).binding.texture, 0, 0, 0, 1, 1,
                       std::array<uint8_t, 1>{3}.data());
    PortTextureRef ref = PortTextureFromCTexture(Named("dst"));
    env.gfx.Frame({0, 0, 0, 0x80}, [&] { env.Draw(ref, 0, 0, 100, 100, 0, 0, 1, 1); });
    ASSERT_TRUE(env.gfx.PixelNear(50, 50, 11, 0, 0));

    // Images copy by texel; a palette and an image do not mix.
    ASSERT_TRUE(PortMoveImage(Named("src")->tex0 & 0x3FFF, SCE_GS_PSMT8, 0, 0, 4, 4,
                              Named("part")->tex0 & 0x3FFF, SCE_GS_PSMT8, 0, 0));
    ASSERT_TRUE(Indices(Named("part")) == Indices(Named("src")));
    ASSERT_TRUE(!PortMoveImage(from, SCE_GS_PSMCT32, 0, 0, 4, 4, Named("part")->tex0 & 0x3FFF, SCE_GS_PSMT8, 0, 0));
}
