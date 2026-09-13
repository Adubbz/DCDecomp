#include "textureanime.hpp"

INCLUDE_ASM("asm/nonmatchings/textureanime", Copy__16CTextureTexAnimeFP8CTexture);
INCLUDE_ASM("asm/nonmatchings/textureanime", __ct__13CTexAnimeDataFv);
INCLUDE_ASM("asm/nonmatchings/textureanime", Initialize__13CTexAnimeDataFv);
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

INCLUDE_ASM("asm/nonmatchings/textureanime", __ct__13CTextureAnimeFP13CTexAnimeDatai);
INCLUDE_ASM("asm/nonmatchings/textureanime", NewTexAnimeData__13CTextureAnimeFv);
INCLUDE_ASM("asm/nonmatchings/textureanime", NewTexAnimeGroupData__13CTextureAnimeFi);
INCLUDE_ASM("asm/nonmatchings/textureanime", EnterTexAnime__13CTextureAnimeFP13CTexAnimeData);
INCLUDE_ASM("asm/nonmatchings/textureanime", DisableAll__13CTextureAnimeFv);
INCLUDE_ASM("asm/nonmatchings/textureanime", Enable__13CTextureAnimeFi);
INCLUDE_ASM("asm/nonmatchings/textureanime", Disable__13CTextureAnimeFi);
INCLUDE_ASM("asm/nonmatchings/textureanime", LoadCFGFile__13CTextureAnimeFPci);
