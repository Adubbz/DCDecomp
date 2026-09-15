#include "textureanime.hpp"

#include <cstring>

INCLUDE_ASM("asm/nonmatchings/textureanime", Copy__16CTextureTexAnimeFP8CTexture);
INCLUDE_ASM("asm/nonmatchings/textureanime", __ct__13CTexAnimeDataFv);

void CTexAnimeData::Initialize() {
    unk_00 = -1;
    unk_02 = 0;
    unk_04 = 0;
    memset(&first_texture, 0, sizeof(first_texture));
    first_texture.block = -1;
    memset(&second_texture, 0, sizeof(second_texture));
    second_texture.block = -1;
    unk_3E = 0;
    unk_3C = 0;
    unk_3A = 0;
    unk_38 = 0;
    unk_42 = 0;
    unk_40 = 0;
    unk_50 = 0;
    unk_4C = 0;
    unk_48 = 0;
    unk_44 = 0;
    unk_54 = 0;
    unk_06 = -1;
}
INCLUDE_ASM("asm/nonmatchings/textureanime", TexAnime__13CTextureAnimeFi);

void CTextureAnime::Initialize(CTexAnimeData *records, int count) {
    data = records;
    data_count = count;
    for (int group = 0; group < 24; group++) {
        first[group] = 0;
        current[group] = 0;
        last[group] = 0;
        frame[group] = 0;
        enabled[group] = 0;
    }
}

CTextureAnime::CTextureAnime(CTexAnimeData *records, int count) {
    Initialize(records, count);
}
INCLUDE_ASM("asm/nonmatchings/textureanime", NewTexAnimeData__13CTextureAnimeFv);
INCLUDE_ASM("asm/nonmatchings/textureanime", NewTexAnimeGroupData__13CTextureAnimeFi);
INCLUDE_ASM("asm/nonmatchings/textureanime", EnterTexAnime__13CTextureAnimeFP13CTexAnimeData);
void CTextureAnime::DisableAll() {
    for (int group = 0; group < 24; group++) {
        Disable(group);
    }
}
void CTextureAnime::Enable(int group) {
    if (group < 0 || group >= 24) {
        return;
    }
    enabled[group] = 1;
}
void CTextureAnime::Disable(int group) {
    if (group < 0 || group >= 24) {
        return;
    }
    enabled[group] = 0;
    current[group] = first[group];
    frame[group] = 0;
}
INCLUDE_ASM("asm/nonmatchings/textureanime", LoadCFGFile__13CTextureAnimeFPci);

INCLUDE_RODATA("asm/nonmatchings/textureanime", @447__2);
INCLUDE_RODATA("asm/nonmatchings/textureanime", @448);
INCLUDE_RODATA("asm/nonmatchings/textureanime", @449);
INCLUDE_RODATA("asm/nonmatchings/textureanime", @450);
INCLUDE_RODATA("asm/nonmatchings/textureanime", @451);
INCLUDE_ASM("asm/nonmatchings/textureanime", CommandTEX_ANIME__FPPv);
INCLUDE_ASM("asm/nonmatchings/textureanime", CommandTEX_ANIME_DATA__FPPv);
INCLUDE_ASM("asm/nonmatchings/textureanime", CommandTEX_ANIME_DATA2__FPPv);
INCLUDE_ASM("asm/nonmatchings/textureanime", CommandTEX_SCROLL_DATA__FPPv);

/**
 * Ends a texture animation command; nothing remains to be done.
 *
 * @mangled CommandTEX_ANIME_END__FPPv
 * @address 0x1680F0
 * @size 0x8
 */
void CommandTEX_ANIME_END(void **arguments) {
}
