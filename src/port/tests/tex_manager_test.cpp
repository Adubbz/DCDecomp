#include <algorithm>
#include <set>

#include "tex_fixture.hpp"

using namespace dc::test;
using namespace texfix;

namespace {

sceGsTex0 Tex0Of(const CTexture *texture) {
    sceGsTex0 tex0;
    std::memcpy(&tex0, &texture->tex0, sizeof tex0);
    return tex0;
}

CTexture *Named(const char *name, int block = -1) {
    std::string mutable_name(name);
    return TexManager.GetTexture(mutable_name.data(), block);
}

Bytes ThreeKinds() {
    return Img({
        {"idx",  Tim2({TIM2_IDTEX8, 4, 1, {{1, 2, 3, 4}}, Clut256({{1, Gs(255, 0, 0)}}), 256})},
        {"rgba", Tim2({TIM2_RGB32, 2, 2, {Bytes(16, 0x40)}, {}, 0})                           },
        {"rgb",  Tim2({TIM2_RGB24, 2, 1, {Bytes(6, 0x20)}, {}, 0})                            }
    });
}

void Enter(Bytes &img, int block) {
    TexManager.BeginEnterTextureBlock(block);
    TexManager.EnterIMGFile(img.data(), block, 0, 0);
    TexManager.EndEnterTextureBlock(block);
}

// Every TBP0 and CBP the registry's textures hold, by block.
std::multiset<unsigned> Keys(int block) {
    std::multiset<unsigned> keys;
    for (int i = 0; i < 196; i++) {
        const CTexture &texture = TexManager.textures[i];
        if (texture.name[0] == 0 || (block != -2 && texture.block != block)) {
            continue;
        }
        sceGsTex0 tex0 = Tex0Of(&texture);
        keys.insert(tex0.TBP0);
        if (tex0.CLD) {
            keys.insert(tex0.CBP);
        }
    }
    return keys;
}

} // namespace

DC_TEST(tex_placeholders_become_named_targets) {
    TexEnv           env;
    char             shadow[] = "#shadow_buf#640#256#4";
    char             font[] = "#fontbase#512#256#1";
    char             frame24[] = "#frame24#64#32#3";
    char             defaults[] = "#defaults#";
    char             end[] = "";
    LOADTEXTURE_INFO table[] = {
        {shadow,   3, 0},
        {font,     3, 0},
        {frame24,  4, 0},
        {defaults, 4, 0},
        {end,      0, 0}
    };
    TexManager.LoadTextureBlock(-1, table, nullptr);

    PortTextureRef shadow_ref = PortTextureFromCTexture(Named("shadow_buf"));
    DC_CHECK(shadow_ref.valid && shadow_ref.width == 640 && shadow_ref.height == 256);
    DC_CHECK(shadow_ref.binding.texture == gfx::FindNamedRenderTarget("shadow_buf"));
    auto shadow_info = gfx::GetTextureInfo(shadow_ref.binding.texture);
    DC_CHECK(shadow_info && shadow_info->render_target && shadow_info->has_alpha && shadow_info->width == 640 &&
             shadow_info->height == 256);
    DC_CHECK(Named("shadow_buf")->block == 3);

    CTexture      *font_texture = Named("fontbase");
    PortTextureRef font_ref = PortTextureFromCTexture(font_texture);
    DC_CHECK(font_ref.valid && font_ref.binding.palette != gfx::kNullTexture);
    auto font_info = gfx::GetTextureInfo(font_ref.binding.texture);
    DC_CHECK(font_info && font_info->format == gfx::TextureFormat::Index8 && font_info->width == 512);
    DC_CHECK(Tex0Of(font_texture).PSM == SCE_GS_PSMT8 && Tex0Of(font_texture).CLD == 1);

    auto frame_info = gfx::GetTextureInfo(PortTextureFromCTexture(Named("frame24")).binding.texture);
    DC_CHECK(frame_info && frame_info->render_target && !frame_info->has_alpha && frame_info->width == 64);
    auto default_info = gfx::GetTextureInfo(gfx::FindNamedRenderTarget("defaults"));
    DC_CHECK(default_info && default_info->width == 32 && default_info->height == 32);

    // The game renders into a placeholder and draws from it.
    env.gfx.Frame({0, 0, 0, 0x80}, [&] {
        const uint8_t red[4] = {255, 0, 0, 0x80};
        gfx::SetRenderTarget(shadow_ref.binding.texture);
        gfx::Clear(true, red, false, 0.0f);
        gfx::SetRenderTarget(gfx::kMainTarget);
        env.Draw(shadow_ref, 0, 0, 100, 100, 0, 0, 640, 256);
    });
    DC_CHECK(env.gfx.PixelNear(50, 50, 255, 0, 0));

    // The same name at another size while the first is live gets a target of its own.
    char             small[] = "#shadow_buf#320#240#4";
    LOADTEXTURE_INFO second[] = {
        {small, 5, 0},
        {end,   0, 0}
    };
    TexManager.LoadTextureBlock(5, second, nullptr);
    PortTextureRef small_ref = PortTextureFromCTexture(Named("shadow_buf", 5));
    DC_CHECK(small_ref.valid && small_ref.width == 320 && small_ref.binding.texture != shadow_ref.binding.texture);
    DC_CHECK(small_ref.binding.texture == gfx::FindNamedRenderTarget("#shadow_buf#320#240#4"));
    DC_CHECK(PortTextureFromCTexture(Named("shadow_buf", 3)).binding.texture == shadow_ref.binding.texture);

    // Targets outlive the block, so a mode that enters them again keeps their contents.
    TexManager.DeleteTextureBlock(3);
    DC_CHECK(Named("shadow_buf", 3) == nullptr);
    DC_CHECK(gfx::FindNamedRenderTarget("shadow_buf") == shadow_ref.binding.texture);
    TexManager.LoadTextureBlock(3, table, nullptr);
    DC_CHECK(PortTextureFromCTexture(Named("shadow_buf", 3)).binding.texture == shadow_ref.binding.texture);
}

DC_TEST(tex_tbp0_keys_are_unique_and_released) {
    TexEnv env;
    Bytes  first = ThreeKinds();
    Bytes  second = ThreeKinds();
    Enter(first, 1);
    Enter(second, 2);

    std::multiset<unsigned> all = Keys(-2);
    std::multiset<unsigned> block1 = Keys(1);
    std::multiset<unsigned> block2 = Keys(2);
    DC_CHECK(block1.size() == 4 && block2.size() == 4);
    DC_CHECK(std::set<unsigned>(all.begin(), all.end()).size() == all.size());
    for (unsigned key : all) {
        DC_CHECK(key != 0 && key != 0xFFF && key < 0x4000 && PortKeyLive(key));
    }
    // The same name in two blocks is two textures.
    DC_CHECK(Tex0Of(Named("idx", 1)).TBP0 != Tex0Of(Named("idx", 2)).TBP0);

    // "work", the manager's own entry, resolves to its named target.
    PortTextureRef work = PortTextureFromHandle(0);
    DC_CHECK(work.valid && work.binding.texture == gfx::FindNamedRenderTarget("work"));
    DC_CHECK(std::string(TexManager.textures[0].name) == "work");

    TexManager.DeleteTextureBlock(1);
    for (unsigned key : block1) {
        DC_CHECK(!PortKeyLive(key));
    }
    for (unsigned key : block2) {
        DC_CHECK(PortKeyLive(key));
    }
    DC_CHECK(PortTextureFromCTexture(Named("rgba", 2)).valid);
    DC_CHECK(PortTextureFromCTexture(Named("idx", 2)).valid);

    // A freed key is not handed out again straight away, so stale copies of a TEX0 resolve to
    // nothing rather than to the next texture.
    Bytes third = ThreeKinds();
    Enter(third, 3);
    for (unsigned key : Keys(3)) {
        DC_CHECK(block1.count(key) == 0 && block2.count(key) == 0);
    }
    DC_CHECK(!PortTextureFromTex0(Tex0Of(&TexManager.textures[0]).TBP0 + 0x2000, 0).valid);

    unsigned work_key = Tex0Of(&TexManager.textures[0]).TBP0;
    TexManager.DeleteTextureBlock(-1);
    DC_CHECK(!PortKeyLive(work_key));
    DC_CHECK(Keys(-2).empty());
}

DC_TEST(tex_initialize_releases_everything) {
    TexEnv env;
    Bytes  img = ThreeKinds();
    Enter(img, 7);
    std::multiset<unsigned> keys = Keys(7);
    gfx::TextureHandle      handle = PortTextureFromCTexture(Named("rgba")).binding.texture;
    DC_CHECK(gfx::GetTextureInfo(handle).has_value());
    TexManager.Initialize(16352);
    for (unsigned key : keys) {
        DC_CHECK(!PortKeyLive(key));
    }
    DC_CHECK(!gfx::GetTextureInfo(handle).has_value());
    DC_CHECK(Named("rgba") == nullptr);
}

DC_TEST(tex_staging_and_vram_bookkeeping_follow_retail) {
    TexEnv env;
    Bytes  img = Img({
        {"square", Tim2({TIM2_RGB32, 16, 16, {Bytes(1024, 0x11)}, {}, 0})}
    });
    int    vram_start = TexManager.blocks[1].vram_end;
    Enter(img, 1);
    // 1024 bytes are four 256-byte blocks, and a block end is aligned to 32 of them.
    DC_CHECK(TexManager.buffer_used == 512);
    DC_CHECK(TexManager.blocks[1].vram_end == vram_start + 32);
    CTexture *texture = Named("square");
    DC_CHECK(texture->image[0] == (u_int *) TexManager.buffer);
    DC_CHECK(texture->width == 16 && texture->bpp == 4 && texture->block == 1);
    sceGsTex0 tex0 = Tex0Of(texture);
    DC_CHECK(tex0.PSM == SCE_GS_PSMCT32 && tex0.TW == 4 && tex0.TH == 4 && tex0.TBW == 1 && tex0.TCC == 1);

    // EnterTextureEX keeps the caller's pixels and stages nothing.
    LOADTEXTURE_INFO2 extended[] = {
        {(char *) img.data(), 2, 0},
        {nullptr,             0, 0}
    };
    TexManager.LoadTextureBlockEX(2, extended);
    DC_CHECK(TexManager.buffer_used == 512);
    CTexture *kept = Named("square", 2);
    DC_CHECK(kept != nullptr && TexManager.blocks[2].extend);
    DC_CHECK((u_char *) kept->image[0] > img.data() && (u_char *) kept->image[0] < img.data() + img.size());
    DC_CHECK(PortTextureFromCTexture(kept).valid);

    TexManager.ReloadTexture(nullptr, 2);
    DC_CHECK(TexManager.last_block == 2 && TexManager.blocks[2].loaded);
    TexManager.ReloadTexture(nullptr, 99);
    DC_CHECK(TexManager.last_block == -1);
}

DC_TEST(tex_fixed_textures_and_stayframe) {
    TexEnv env;
    Bytes  fixed = Img({
        {"fixed", Tim2({TIM2_RGB32, 16, 16, {Bytes(1024, 0x80)}, {}, 0})}
    });
    int    vram_fix = TexManager.vram_fix;
    TexManager.EnterIMGFile(fixed.data(), -1, 0, 0);
    CTexture *fixed_texture = Named("fixed");
    DC_CHECK(fixed_texture && fixed_texture->block == -1 && TexManager.vram_fix == vram_fix - 32);
    DC_CHECK(PortTextureFromCTexture(fixed_texture).valid);

    Bytes sheet(640 * 16, 0);
    std::fill(sheet.begin() + 640 * 8, sheet.end(), 1);
    Bytes stayframe = Img({
        {"stayframe", Tim2({TIM2_IDTEX8, 640, 16, {sheet}, Clut256({{1, Gs(0, 0, 255)}}), 256})}
    });
    TexManager.EnterFixTextureZ(stayframe.data());
    CTexture *stay = Named("stayframe");
    DC_CHECK(stay != nullptr && stay->block == 73 && stay->width == 640 && stay->height == 16);
    sceGsTex0 tex0 = Tex0Of(stay);
    DC_CHECK(tex0.PSM == 27 && tex0.TBW == 10 && tex0.TW == 10 && tex0.TH == 8 && tex0.CLD == 1);
    PortTextureRef ref = PortTextureFromCTexture(stay);
    DC_CHECK(ref.valid && ref.width == 640 && ref.height == 16 && ref.binding.palette != gfx::kNullTexture);
    // Menus draw pieces of the sheet by texel rect.
    env.gfx.Frame({0, 0, 0, 0x80}, [&] { env.Draw(ref, 0, 0, 120, 160, 0, 0, 12, 16); });
    DC_CHECK(env.gfx.PixelNear(60, 40, 0, 0, 0));
    DC_CHECK(env.gfx.PixelNear(60, 120, 0, 0, 255));

    // Only a 640-wide 8-bit picture of at most a field's height is taken.
    Bytes wrong = Img({
        {"narrow", Tim2({TIM2_IDTEX8, 320, 16, {Bytes(320 * 16, 0)}, Clut256({}), 256})}
    });
    TexManager.EnterFixTextureZ(wrong.data());
    DC_CHECK(Named("narrow") == nullptr);

    // A DeleteTextureBlock of every block takes the fixed ones too, as retail's does.
    TexManager.DeleteTextureBlock(-1);
    DC_CHECK(Named("stayframe") == nullptr && Named("fixed") == nullptr);
    DC_CHECK(!PortKeyLive(tex0.TBP0) && !PortKeyLive(tex0.CBP));
}

DC_TEST(tex_frame_keys_and_clut_loads) {
    TexEnv         env;
    PortTextureRef frame = PortTextureFromTex0(SCE_GS_SET_TEX0(0, 10, 0, 10, 8, 0, 0, 0, 0, 0, 0, 0), 0);
    DC_CHECK(frame.valid && frame.binding.texture == gfx::kMainTarget && frame.width == 640 && frame.height == 480);
    PortTextureRef back = PortTextureFromTex0(SCE_GS_SET_TEX0(0xFFF, 10, 0, 10, 8, 0, 0, 0, 0, 0, 0, 0), 1 << 5);
    DC_CHECK(back.valid && back.binding.texture == gfx::kPreviousFrame && back.binding.filter == gfx::Filter::Linear);

    Bytes img = Img({
        {"text", Tim2({TIM2_IDTEX8, 2, 1, {{8, 9}}, Clut256({}), 256})}
    });
    Enter(img, 0);
    CTexture *text = Named("text");
    sceGsTex0 tex0 = Tex0Of(text);

    // SetClut's upload: a 16x16 PSMCT32 image in CSM1 order, GS alpha.
    std::vector<u_int> clut(256, Gs(0, 0, 0));
    clut[16] = Gs(255, 0, 0, 0x40);
    clut[17] = Gs(0, 255, 0);
    DC_CHECK(PortLoadClut(tex0.CBP, clut.data()));
    uint32_t palette[256];
    DC_CHECK(PortPaletteEntries(tex0.CBP, palette));
    DC_CHECK(palette[8] == Rgba(255, 0, 0, 0x80) && palette[9] == Rgba(0, 255, 0));
    PortTextureRef ref = PortTextureFromCTexture(text);
    env.gfx.Frame({0, 0, 0, 0x80}, [&] { env.Draw(ref, 0, 0, 200, 100, 0, 0, 2, 1); });
    DC_CHECK(env.gfx.PixelNear(150, 50, 0, 255, 0));

    // A TEX0 whose CBP names another palette draws with that one.
    Bytes other = Img({
        {"other", Tim2({TIM2_IDTEX8, 2, 1, {{8, 9}}, Clut256({{16, Gs(0, 0, 255)}, {17, Gs(0, 0, 255)}}), 256})}
    });
    Enter(other, 0);
    sceGsTex0 swapped = tex0;
    swapped.CBP = Tex0Of(Named("other")).CBP;
    u_long bits;
    std::memcpy(&bits, &swapped, sizeof bits);
    PortTextureRef recoloured = PortTextureFromTex0(bits, 0);
    DC_CHECK(recoloured.valid && recoloured.binding.texture == ref.binding.texture &&
             recoloured.binding.palette != ref.binding.palette);
}
