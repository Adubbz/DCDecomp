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
    u8 unk_004[0x0C];
    s32 unk_010; /**< Set to 300 by AllBin2; cleared when the monster is released. */
    u8 unk_014[0x0C];
    s32 max_hp; /**< Life the monster has at full health. */
    s32 hp;     /**< Life the monster has left. */
    s16 attachment_kind; // 0x028
    s16 attachment_weight[5]; // 0x02A
    u8 unk_034[8];
    s32 unk_03C;
    s16 kind;    /**< 2 for a monster the lock-on cursor leaves alone. */
    s16 name_no; /**< Identifies the name the lock-on cursor shows. */
    float unk_044;
    float collision_radius; // 0x048
    u8 unk_04C[0x14];
    sceVu0FVECTOR movement; // 0x060
    sceVu0FVECTOR unk_070;
    float movement_speed; // 0x080
    u8 unk_084[0x3C];
    s32 unk_0C0;
    u8 unk_0C4[0x0C];
    s16 unk_0D0;
    s16 unk_0D2;
    s16 unk_0D4;
    u8 unk_0D6[0x20];
    s16 event_flag2;         /**< Value returned when CheckEventFlag2 consumes the event. */
    s16 event_flag2_pending; /**< Nonzero until CheckEventFlag2 consumes the event. */
    u8 unk_0FA[2];
    s32 unk_0FC;
    sceVu0FVECTOR unk_100;
    float unk_110;
    float unk_114;
    float lock_range; /**< Distance up to which the monster can be locked on to. */
    s16 unk_11C;
    u8 unk_11E[2];
    float palette_alpha; // 0x120
    float palette_alpha_step; // 0x124
    s32 palette_delay; // 0x128
    u8 unk_12C[0x04];
    sceVu0FVECTOR palette_target; // 0x130
    sceVu0FVECTOR palette_color; // 0x140
    sceVu0FVECTOR palette_override; // 0x150
    s32 palette_override_pending; // 0x160
    s32 palette_cycles; // 0x164
    float palette_step; // 0x168
    float palette_blend; // 0x16C
    u8 unk_170[0x20];
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

/** Frame windows and retrigger delays for one monster's sounds. */
struct MONSTOR_SOUND {
    float start[16];
    float end[16];
    s32 id[16];
    s32 cooldown[16];
    float sequence_start;
    float sequence_end;
    s32 sequence_step;
    s32 sequence_id;
};

STATIC_ASSERT(sizeof(MONSTOR_SOUND) == 0x110);

/** Model and script description copied into a loaded monster slot. */
struct MONSTOR_MODEL {
    char model_name[4][16];
    char script_name[40];
    s16 shot_effect[2];
    u8 unk_06C[0x0C];
    s16 kind;
    u8 unk_07A[0x22];
};

STATIC_ASSERT(sizeof(MONSTOR_MODEL) == 0x9C);

class CMonstorUnit {
public:
    void *script[16];  /**< Script working memory for each monster on the floor. */
    CFrame *collision; /**< Collision model that every monster on the floor shares. */
    u8 unk_044[4];
    s32 unk_048;
    u8 unk_04C[0x44];
    s32 unk_090;
    s32 unk_094;
    u8 unk_098[8];
    CMonstorChara base_chara[9]; // 0x0A0
    MONSTOR_MODEL model[9]; // 0x1DE30
    void *script_data[9]; // 0x1E3AC
    MONSTOR monster[16];     /**< What each monster of the floor is doing. */
    CMonstorChara chara[16]; /**< The model each monster draws with. */
    u8 unk_54DD0[0xA080];
    MONSTOR_SOUND sound[16]; // 0x5EE50
    u8 unk_5FF50[0x800];

    /**
     * @mangled GetMonstorNum__12CMonstorUnitFv
     * @address 0x1D7A40
     * @size 0x60
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
     */
    int SelectAttachi(void);

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
