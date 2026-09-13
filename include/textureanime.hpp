#pragma once

#include "common.h"

/**
 * Animates the texture of one part of a model.
 */
class CTexAnimeData {
public:
    u8 unk_00[88];

    /**
     * Sets the animation to play no frame.
     *
     * @mangled Initialize__13CTexAnimeDataFv
     * @address 0x1670D0
     * @size 0xA0
     * @unknownret
     */
    void Initialize(void);

    /**
     * @mangled __ct__13CTexAnimeDataFv
     * @address 0x1670A0
     * @size 0x30
     */
    CTexAnimeData(void);
};

STATIC_ASSERT(sizeof(CTexAnimeData) == 0x58);

/**
 * Plays groups of texture animation records from a caller-supplied pool.
 */
class CTextureAnime {
public:
    s32 enabled[24];            /**< Enables playback for each animation group. */
    CTexAnimeData *first[24];   /**< Points to each group's first animation record. */
    CTexAnimeData *last[24];    /**< Points to each group's last animation record. */
    CTexAnimeData *current[24]; /**< Points to the record being played by each group. */
    s32 frame[24];              /**< Counts playback frames for each group's current record. */
    CTexAnimeData *data;        /**< Holds the animation record pool. */
    s32 data_count;             /**< Gives the number of records in the pool. */
    u8 unk_1e8[8];

    /**
     * @mangled TexAnime__13CTextureAnimeFi
     * @address 0x167170
     * @size 0x6B0
     * @unknownret
     */
    void TexAnime(int);

    /**
     * Assigns the record pool and clears every animation group.
     *
     * @mangled Initialize__13CTextureAnimeFP13CTexAnimeDatai
     * @address 0x167820
     * @size 0x50
     */
    void Initialize(CTexAnimeData *records, int count);

    /**
     * Creates an animation player using the supplied record pool.
     *
     * @mangled __ct__13CTextureAnimeFP13CTexAnimeDatai
     * @address 0x167870
     * @size 0x30
     */
    CTextureAnime(CTexAnimeData *records = 0, int count = 0);

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

STATIC_ASSERT(sizeof(CTextureAnime) == 0x1F0);
