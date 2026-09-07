#pragma once

#include "common.h"

#include "dataalloc_fwd.hpp"

#include <libvu0.h>

#include "character.hpp"

class CDungeonMap;

class CFrame;

/**
 * Records what one monster of the floor is doing.
 */
struct MONSTOR {
    s32 state; /**< 2 while the monster stands on the floor and takes part. */
    u8 unk_004[0x1C];
    s32 max_hp; /**< Life the monster has at full health. */
    s32 hp;     /**< Life the monster has left. */
    u8 unk_028[0x14];
    s32 unk_03C;
    s16 kind;    /**< 2 for a monster the lock-on cursor leaves alone. */
    s16 name_no; /**< Identifies the name the lock-on cursor shows. */
    float unk_044;
    u8 unk_048[0x78];
    s32 unk_0C0;
    u8 unk_0C4[0x10];
    s16 unk_0D4;
    u8 unk_0D6[0x26];
    s32 unk_0FC;
    sceVu0FVECTOR unk_100;
    float unk_110;
    float unk_114;
    float lock_range; /**< Distance up to which the monster can be locked on to. */
    s16 unk_11C;
    u8 unk_11E[0x72];
};

STATIC_ASSERT(sizeof(MONSTOR) == 0x190);

/**
 * Draws one monster of the floor.
 */
class CMonstorChara : public CCharacter {
public:
    u8 unk_11B0[0x2360];
};

STATIC_ASSERT(sizeof(CMonstorChara) == 0x3510);

class CMonstorUnit {
public:
    void *script[16];  /**< Script working memory for each monster on the floor. */
    CFrame *collision; /**< Collision model that every monster on the floor shares. */
    u8 unk_044[4];
    s32 unk_048;
    u8 unk_04C[0x44];
    s32 unk_090;
    s32 unk_094;
    u8 unk_098[0x1E338];
    MONSTOR monster[16];     /**< What each monster of the floor is doing. */
    CMonstorChara chara[16]; /**< The model each monster draws with. */
    u8 unk_54DD0[0xB980];

    /**
     * @mangled GetMonstorNum__12CMonstorUnitFv
     * @address 0x1D7A40
     * @size 0x60
     * @unknownret
     */
    int GetMonstorNum(void);

    /**
     * @mangled DrawMapSymbol__12CMonstorUnitFPf
     * @address 0x1D7AA0
     * @size 0x1E0
     * @unknownret
     */
    void DrawMapSymbol(float *);

    /**
     * @mangled SetKey__12CMonstorUnitFv
     * @address 0x1D7C80
     * @size 0x150
     * @unknownret
     */
    void SetKey(void);

    /**
     * @mangled CheckEventFlag2__12CMonstorUnitFv
     * @address 0x1D7F30
     * @size 0x90
     * @unknownret
     */
    int CheckEventFlag2(void);

    /**
     * @mangled ArrangementPos__12CMonstorUnitFP11CDungeonMapiii
     * @address 0x1D7FC0
     * @size 0x3A0
     * @unknownret
     */
    void ArrangementPos(CDungeonMap *, int, int, int);

    /**
     * @mangled AllBin2__12CMonstorUnitFv
     * @address 0x1D8360
     * @size 0x50
     * @unknownret
     */
    void AllBin2(void);

    /**
     * @mangled PalletSet__12CMonstorUnitFv
     * @address 0x1D83B0
     * @size 0x1C0
     * @unknownret
     */
    void PalletSet(void);

    /**
     * @mangled PalletStep__12CMonstorUnitFv
     * @address 0x1D8570
     * @size 0x420
     * @unknownret
     */
    void PalletStep(void);

    /**
     * @mangled SoundCheck__12CMonstorUnitFv
     * @address 0x1D8990
     * @size 0x340
     * @unknownret
     */
    void SoundCheck(void);

    /**
     * @mangled DrawMonstor__12CMonstorUnitFv
     * @address 0x1D8CD0
     * @size 0x540
     * @unknownret
     */
    void DrawMonstor(void);

    /**
     * @mangled DrawMonstorCursor__12CMonstorUnitFv
     * @address 0x1D9210
     * @size 0xE0
     * @unknownret
     */
    void DrawMonstorCursor(void);

    /**
     * @mangled DrawShadowMonstor__12CMonstorUnitFv
     * @address 0x1D9800
     * @size 0x1A0
     * @unknownret
     */
    void DrawShadowMonstor(void);

    /**
     * @mangled CheckViewLevel__12CMonstorUnitFv
     * @address 0x1D99A0
     * @size 0x3C0
     * @unknownret
     */
    void CheckViewLevel(void);

    /**
     * @mangled SelectAttachi__12CMonstorUnitFv
     * @address 0x1D9D60
     * @size 0x1B0
     * @unknownret
     */
    void SelectAttachi(void);

    /**
     * @mangled CheckDmg__12CMonstorUnitFv
     * @address 0x1D9F10
     * @size 0x2910
     * @unknownret
     */
    void CheckDmg(void);

    /**
     * @mangled MoveCheck__12CMonstorUnitFPfPfi
     * @address 0x1DC820
     * @size 0x5B0
     * @unknownret
     */
    void MoveCheck(float *, float *, int);

    /**
     * @mangled MoveCheck2__12CMonstorUnitFv
     * @address 0x1DCDD0
     * @size 0x370
     * @unknownret
     */
    void MoveCheck2(void);

    /**
     * @mangled MoveChecMonster__12CMonstorUnitFv
     * @address 0x1DD140
     * @size 0x400
     * @unknownret
     */
    void MoveChecMonster(void);

    /**
     * @mangled Step__12CMonstorUnitFi
     * @address 0x1DD540
     * @size 0x24B0
     * @unknownret
     */
    void Step(int);

    /**
     * @mangled CleanViewMonstor__12CMonstorUnitFi
     * @address 0x1DF9F0
     * @size 0x4A0
     * @unknownret
     */
    void CleanViewMonstor(int);

    /**
     * Loads the models one monster needs, and says how many it took.
     *
     * @mangled SetupBaseModel__12CMonstorUnitFiiiP14CDataAlloc2_1_
     * @address 0x1DFE90
     * @size 0x420
     * @unknownret
     */
    int SetupBaseModel(int, int, int, CDataAlloc2<1> *);

    /**
     * @mangled SetupViewMonstor__12CMonstorUnitFiPfi
     * @address 0x1E02B0
     * @size 0x1390
     * @unknownret
     */
    void SetupViewMonstor(int, float *, int);
};
