#include "textureanime.hpp"

#include <cstring>

INCLUDE_ASM("asm/nonmatchings/textureanime", Copy__16CTextureTexAnimeFP8CTexture);
INCLUDE_ASM("asm/nonmatchings/textureanime", __ct__13CTexAnimeDataFv);

void CTexAnimeData::Initialize() {
    unk_00 = -1;
    unk_02 = 0;
    unk_04 = 0;
    memset(&unk_08, 0, 0x18);
    unk_08 = -1;
    memset(&unk_20, 0, 0x18);
    unk_20 = -1;
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
