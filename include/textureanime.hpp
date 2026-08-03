#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CTexAnimeData;


class CTextureAnime {
public:
    /**
     * @mangled TexAnime__13CTextureAnimeFi
     * @address 0x167170
     * @size 0x6B0
     * @unknownret
     */
    void TexAnime(int);

    /**
     * @mangled Initialize__13CTextureAnimeFP13CTexAnimeDatai
     * @address 0x167820
     * @size 0x50
     * @unknownret
     */
    void Initialize(CTexAnimeData *, int);

    /**
     * @mangled __ct__13CTextureAnimeFP13CTexAnimeDatai
     * @address 0x167870
     * @size 0x30
     */
    CTextureAnime(CTexAnimeData *, int);

    /**
     * @mangled NewTexAnimeData__13CTextureAnimeFv
     * @address 0x1678A0
     * @size 0x60
     * @unknownret
     */
    void NewTexAnimeData(void);

    /**
     * @mangled NewTexAnimeGroupData__13CTextureAnimeFi
     * @address 0x167900
     * @size 0xE0
     * @unknownret
     */
    void NewTexAnimeGroupData(int);

    /**
     * @mangled EnterTexAnime__13CTextureAnimeFP13CTexAnimeData
     * @address 0x1679E0
     * @size 0x100
     * @unknownret
     */
    void EnterTexAnime(CTexAnimeData *);

    /**
     * @mangled DisableAll__13CTextureAnimeFv
     * @address 0x167AE0
     * @size 0x60
     * @unknownret
     */
    void DisableAll(void);

    /**
     * @mangled Enable__13CTextureAnimeFi
     * @address 0x167B40
     * @size 0x40
     * @unknownret
     */
    void Enable(int);

    /**
     * @mangled Disable__13CTextureAnimeFi
     * @address 0x167B80
     * @size 0x40
     * @unknownret
     */
    void Disable(int);

    /**
     * @mangled LoadCFGFile__13CTextureAnimeFPci
     * @address 0x167BC0
     * @size 0xC0
     * @unknownret
     */
    void LoadCFGFile(char *, int);
};
