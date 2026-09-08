#pragma once

#include "common.h"

#include "dataalloc_fwd.hpp"

#include <libvu0.h>

#include "character.hpp"
#include "runscript.hpp"

class CDungeonMap;

class CFrame;

/**
 * Records what one monster of the floor is doing.
 */
struct MONSTOR {
    s32 state; /**< 2 while the monster stands on the floor and takes part. */
    u8 unk_004[4];
    s32 unk_008;
    s32 unk_00C;
    s32 unk_010; /**< Set to 300 by AllBin2; cleared when the monster is released. */
    s32 unk_014;
    float player_distance; // 0x018
    s32 base_model; // 0x01C
    s32 max_hp; /**< Life the monster has at full health. */
    s32 hp;     /**< Life the monster has left. */
    s16 attachment_kind; // 0x028
    s16 attachment_weight[5]; // 0x02A
    s32 unk_034;
    s32 unk_038;
    s32 unk_03C;
    s16 kind;    /**< 2 for a monster the lock-on cursor leaves alone. */
    s16 name_no; /**< Identifies the name the lock-on cursor shows. */
    float unk_044;
    float collision_radius; // 0x048
    u8 unk_04C[4];
    s32 unk_050;
    u8 unk_054[0x0C];
    sceVu0FVECTOR movement; // 0x060
    sceVu0FVECTOR unk_070;
    float movement_speed; // 0x080
    s32 unk_084;
    s32 unk_088;
    u8 unk_08C[4];
    s16 unk_090;
    s16 unk_092;
    s16 unk_094;
    u8 unk_096[2];
    s32 unk_098;
    u8 unk_09C[4];
    s16 unk_0A0;
    u8 unk_0A2[2];
    float unk_0A4;
    s32 unk_0A8;
    s16 unk_0AC;
    s16 unk_0AE;
    s32 unk_0B0;
    s16 unk_0B4;
    u8 unk_0B6[0x0A];
    s32 unk_0C0;
    u8 unk_0C4[8];
    float unk_0CC;
    s16 unk_0D0;
    s16 unk_0D2;
    s16 unk_0D4;
    s16 unk_0D6;
    s16 unk_0D8;
    s16 unk_0DA; // permits assignment of a dungeon key
    s16 unk_0DC;
    s16 unk_0DE;
    s16 unk_0E0;
    u8 unk_0E2[6];
    s32 unk_0E8;
    u8 unk_0EC[8];
    s16 unk_0F4;
    s16 event_flag2;         /**< Value returned when CheckEventFlag2 consumes the event. */
    s16 event_flag2_pending; /**< Nonzero until CheckEventFlag2 consumes the event. */
    u8 unk_0FA[2];
    CFrame *unk_0FC; // frame supplying the monster target position
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
    sceVu0FVECTOR unk_170;
    sceVu0FVECTOR unk_180;
};

STATIC_ASSERT(sizeof(MONSTOR) == 0x190);

/**
 * Draws one monster of the floor.
 */
typedef CCharacter CMonstorChara[3];

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
    char script_name[16];
    s32 max_hp;
    s16 attachment_kind;
    s16 attachment_weight[5];
    float collision_radius;
    s16 unk_064;
    s16 unk_066;
    s16 shot_effect[2];
    s16 unk_06C;
    u8 unk_06E[2];
    s32 unk_070;
    s32 unk_074;
    s16 kind;
    u8 unk_07A[2];
    s16 name_no; // 0x07C
    u8 unk_07E[2];
    s16 unk_080;
    s16 unk_082;
    s16 unk_084;
    s16 unk_086;
    s16 unk_088;
    s16 effect_parameter[6]; // 0x08A
    u8 unk_096[2];
    float unk_098;
};

STATIC_ASSERT(sizeof(MONSTOR_MODEL) == 0x9C);

/** Per-monster effect slots; unused members retain their retail space. */
struct MONSTOR_EFFECT_STATE {
    sceVu0FVECTOR position[16]; // 0x000
    CFrame *frame[16]; // 0x100
    u8 unk_140[0x40];
    s32 active[16];
    u8 unk_1C0[0x40];
    s32 timer[16];
    u8 unk_240[0x140];
    s32 parameter[16][6];
    u8 unk_500[0x10];
};
STATIC_ASSERT(sizeof(MONSTOR_EFFECT_STATE) == 0x510);

struct MONSTOR_EFFECT_STATE2 {
    sceVu0FVECTOR position[16]; // 0x000
    CFrame *frame[16]; // 0x100
    u8 unk_140[0x1C0];
    s32 active[16];
    u8 unk_340[0x10];
};
STATIC_ASSERT(sizeof(MONSTOR_EFFECT_STATE2) == 0x350);

struct MONSTOR_EFFECT_STATE3 {
    sceVu0FVECTOR position[12]; // 0x000: collision sphere centers
    CFrame *frame[12]; // 0x0C0
    float radius[12]; // 0x0F0
    s32 timer[12];
    s32 count;
    u8 unk_154[0x0C];
};
STATIC_ASSERT(sizeof(MONSTOR_EFFECT_STATE3) == 0x160);

struct MONSTOR_EVENT_STATE {
    sceVu0FVECTOR local_position;
    sceVu0FVECTOR position;
    CFrame *frame;
    s32 timer;
    u8 unk_028[8];
};
STATIC_ASSERT(sizeof(MONSTOR_EVENT_STATE) == 0x30);

class CMonstorUnit {
public:
    CDataAlloc2<1> *script[16];  /**< Script working memory for each monster on the floor. */
    CFrame *collision; /**< Collision model that every monster on the floor shares. */
    s32 unk_044;
    s32 unk_048;
    s32 unk_04C;
    s32 script_state[16];
    s32 unk_090;
    s32 unk_094;
    s32 unk_098;
    s32 unk_09C;
    CMonstorChara base_chara[9]; // 0x0A0
    MONSTOR_MODEL model[9]; // 0x1DE30
    char *script_data[9]; // 0x1E3AC
    MONSTOR monster[16];     /**< What each monster of the floor is doing. */
    CMonstorChara chara[16]; /**< The model each monster draws with. */
    CRunScript interpreter[16]; // 0x54DD0
    MONSTOR_EFFECT_STATE effect[16]; // 0x55250
    MONSTOR_EFFECT_STATE2 effect2[16]; // 0x5A350
    MONSTOR_EFFECT_STATE3 effect3[16]; // 0x5D850
    MONSTOR_SOUND sound[16]; // 0x5EE50
    MONSTOR_EVENT_STATE event[16]; // 0x5FF50
    MONSTOR_EVENT_STATE event2[16]; // 0x60250
    s16 event_flags[16][16]; // 0x60550

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
     */
    void PalletSet(void);

    /**
     * @mangled PalletStep__12CMonstorUnitFv
     * @address 0x1D8570
     * @size 0x420
     */
    void PalletStep(void);

    /**
     * @mangled SoundCheck__12CMonstorUnitFv
     * @address 0x1D8990
     * @size 0x340
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
     */
    void MoveCheck2(void);

    /**
     * @mangled MoveChecMonster__12CMonstorUnitFv
     * @address 0x1DD140
     * @size 0x400
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
    int SetupViewMonstor(int, float *, int);
};

STATIC_ASSERT(sizeof(CMonstorUnit) == 0x60750);

/** Animation frame and phase of one rendered bee. */
struct BEE_STATE {
    s32 row;
    float phase;
};
STATIC_ASSERT(sizeof(BEE_STATE) == 8);
extern BEE_STATE BeeTbl[800];

/** Retail initialized floor limits; data ownership still pending. */
extern "C" int maxFloorTbl__3[7];

/** Shared pool constructed by retail's monstor translation-unit initializer. */
extern "C" CTexAnimeData MonsterTexAnim[320];

/**
 * Names one monster of a floor's enemy layout.
 */
struct BT_ENEMY_LAYOUT {
    s32 unk_00;
    s32 monster_no; /**< Identifies the monster, or -1 where the list ends. */
    s32 unk_08;
};

/**
 * Names every monster one floor lays out.
 */
struct BT_ENEMY_FLOOR {
    BT_ENEMY_LAYOUT monster[9]; /**< The monsters the floor can hold. */
    s32 unk_6C;
};


STATIC_ASSERT(sizeof(BT_ENEMY_LAYOUT) == 0x0C);
STATIC_ASSERT(sizeof(BT_ENEMY_FLOOR) == 0x70);

extern "C" MONSTOR_MODEL MonstorTable[167];
#include "bt_shot_effect.hpp"
extern "C" BT_SHOT_EFFECT *BtEntryEffectTbl[34];
