#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CTexAnimeData;


class CTextureAnime {
public:
    /* ?ret */ void TexAnime(int); // @ 0x167170 (0x6B0 bytes) -- mangled: TexAnime__13CTextureAnimeFi
    /* ?ret */ void Initialize(CTexAnimeData *, int); // @ 0x167820 (0x50 bytes) -- mangled: Initialize__13CTextureAnimeFP13CTexAnimeDatai
    CTextureAnime(CTexAnimeData *, int); // @ 0x167870 (0x30 bytes) -- mangled: __ct__13CTextureAnimeFP13CTexAnimeDatai
    /* ?ret */ void NewTexAnimeData(void); // @ 0x1678A0 (0x60 bytes) -- mangled: NewTexAnimeData__13CTextureAnimeFv
    /* ?ret */ void NewTexAnimeGroupData(int); // @ 0x167900 (0xE0 bytes) -- mangled: NewTexAnimeGroupData__13CTextureAnimeFi
    /* ?ret */ void EnterTexAnime(CTexAnimeData *); // @ 0x1679E0 (0x100 bytes) -- mangled: EnterTexAnime__13CTextureAnimeFP13CTexAnimeData
    /* ?ret */ void DisableAll(void); // @ 0x167AE0 (0x60 bytes) -- mangled: DisableAll__13CTextureAnimeFv
    /* ?ret */ void Enable(int); // @ 0x167B40 (0x40 bytes) -- mangled: Enable__13CTextureAnimeFi
    /* ?ret */ void Disable(int); // @ 0x167B80 (0x40 bytes) -- mangled: Disable__13CTextureAnimeFi
    /* ?ret */ void LoadCFGFile(char *, int); // @ 0x167BC0 (0xC0 bytes) -- mangled: LoadCFGFile__13CTextureAnimeFPci
};
