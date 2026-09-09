#pragma once

#include "common.h"

#include <libvu0.h>

#include "bt_shot_effect.hpp"
#include "character.hpp"
#include "dataalloc_fwd.hpp"
#include "runscript.hpp"

class CDungeonMap;

class CFrame;

/**
 * Records what one monster of the floor is doing.
 */
struct MONSTOR {
    s32 state;         /**< 2 while the monster stands on the floor and takes part. */
    s32 last_attacker; /**< Character credited with the kill, or -1. */
    s32 unk_008;
    s32 unk_00C;
    s32 unk_010;
    s32 unk_014;
    float player_distance;    /**< Distance from the player, measured by CheckViewLevel. */
    s32 base_model;           /**< Index of the loaded model the monster was set up from. */
    s32 max_hp;               /**< Life the monster has at full health. */
    s32 hp;                   /**< Life the monster has left. */
    s16 attachment_kind;      /**< Attachment family the monster drops from. */
    s16 attachment_weight[5]; /**< Weight of each attachment kind in the drop choice and in elemental damage. */
    s32 unk_034;
    s32 unk_038;
    s32 unk_03C;
    s16 kind;    /**< 2 for a monster the lock-on cursor leaves alone. */
    s16 name_no; /**< Identifies the name the lock-on cursor shows. */
    float unk_044;
    float collision_radius; /**< Radius the monster keeps from other monsters. */
    CCPoly *collision_poly; /**< Polygons the monster tests its movement against this step. */
    s32 unk_050;
    u8 unk_054[0x0C];
    sceVu0FVECTOR movement; /**< Direction the monster moves in. */
    sceVu0FVECTOR unk_070;
    float movement_speed; /**< Distance the monster moves each step. */
    float unk_084;
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
    u8 unk_0B6[2];
    float ground_distance; /**< Height of the monster above the ground beneath it. */
    float ground_y;        /**< Height of the ground beneath the monster. */
    s32 unk_0C0;
    s32 last_hit_id; /**< Identifies the attack that last hit the monster, or -1. */
    s32 hit_element; /**< Element of the attack that last hit the monster; 5 for none. */
    float unk_0CC;
    s16 unk_0D0;
    s16 unk_0D2;
    s16 unk_0D4;
    s16 unk_0D6;
    s16 unk_0D8;
    s16 unk_0DA;
    s16 unk_0DC;
    s16 unk_0DE;
    s16 unk_0E0;
    u8 unk_0E2[2];
    s32 unk_0E4;
    s32 unk_0E8;
    s16 requested_motion;         /**< Motion the script asked the monster to play. */
    s16 requested_motion_flags;   /**< Flags of the requested motion. */
    float requested_motion_speed; /**< Speed of the requested motion; below zero for the motion's own. */
    s16 unk_0F4;
    s16 event_flag2;         /**< Value returned when CheckEventFlag2 consumes the event. */
    s16 event_flag2_pending; /**< Nonzero until CheckEventFlag2 consumes the event. */
    u8 unk_0FA[2];
    CFrame *unk_0FC;
    sceVu0FVECTOR unk_100;
    float unk_110;
    float unk_114;
    float lock_range; /**< Distance up to which the monster can be locked on to. */
    s16 unk_11C;
    u8 unk_11E[2];
    float palette_alpha;      /**< Alpha of the monster's ambient light. */
    float palette_alpha_step; /**< Amount the alpha falls by each step. */
    s32 palette_delay;        /**< Steps to wait before the alpha starts falling. */
    u8 unk_12C[0x04];
    sceVu0FVECTOR palette_target;   /**< Colour the palette cycle blends towards. */
    sceVu0FVECTOR palette_color;    /**< Ambient colour the monster draws with. */
    sceVu0FVECTOR palette_override; /**< Colour that replaces the ambient for one draw. */
    s32 palette_override_pending;   /**< Nonzero while the override colour waits to be applied. */
    s32 palette_cycles;             /**< Blend cycles left towards the target colour. */
    float palette_step;             /**< Amount the blend moves by each step; negated at each end. */
    float palette_blend;            /**< Fraction of the way from the ambient to the target colour. */
    sceVu0FVECTOR unk_170;
    sceVu0FVECTOR unk_180;
};

STATIC_ASSERT(sizeof(MONSTOR) == 0x190);

/**
 * The characters one monster draws with: its model and up to two attachments.
 */
typedef CCharacter CMonstorChara[3];

STATIC_ASSERT(sizeof(CMonstorChara) == 0x3510);

/**
 * Frame windows and retrigger delays for one monster's sounds.
 */
struct MONSTOR_SOUND {
    float start[16];      /**< Motion frame each sound starts on. */
    float end[16];        /**< Motion frame each sound stops on. */
    s32 id[16];           /**< Sound effect each window plays, or -1. */
    s32 cooldown[16];     /**< Steps before each sound may play again. */
    float sequence_start; /**< Motion frame the sound sequence starts on. */
    float sequence_end;   /**< Motion frame the sound sequence stops on. */
    s32 sequence_step;    /**< Step of the sound sequence to play. */
    s32 sequence_id;      /**< Sound sequence to play, or -1. */
};

STATIC_ASSERT(sizeof(MONSTOR_SOUND) == 0x110);

/**
 * Model, script and combat parameters of one kind of monster.
 */
struct MONSTOR_MODEL {
    char model_name[4][16];   /**< Model file of the monster and of up to three attachments. */
    char script_name[16];     /**< Script file that drives the monster. */
    s32 max_hp;               /**< Life the monster has at full health. */
    s16 attachment_kind;      /**< Attachment family the monster drops from. */
    s16 attachment_weight[5]; /**< Weight of each attachment kind in the drop choice and in elemental damage. */
    float collision_radius;   /**< Radius the monster keeps from other monsters. */
    s16 unk_064;
    s16 unk_066;
    s16 shot_effect[2]; /**< Entry effects the monster fires, or -1. */
    s16 unk_06C;
    u8 unk_06E[2];
    s32 unk_070;
    s32 unk_074;
    s16 kind; /**< 2 for a monster the lock-on cursor leaves alone. */
    u8 unk_07A[2];
    s16 name_no; /**< Identifies the name the lock-on cursor shows. */
    u8 unk_07E[2];
    s16 unk_080;
    s16 unk_082;
    s16 unk_084;
    s16 unk_086;
    s16 unk_088;
    s16 effect_parameter[6]; /**< Percentage of damage taken from each attacker. */
    u8 unk_096[2];
    float unk_098;
};

STATIC_ASSERT(sizeof(MONSTOR_MODEL) == 0x9C);

/**
 * Hits one monster can take, one slot per collision sphere.
 */
struct MONSTOR_EFFECT_STATE {
    sceVu0FVECTOR position[16]; /**< World position of each sphere. */
    CFrame *frame[16];          /**< Frame each sphere follows. */
    float radius[16];           /**< Radius of each sphere. */
    float motion_start[16];     /**< Motion frame each sphere starts taking hits on; 0 for always. */
    float motion_end[16];       /**< Motion frame each sphere stops taking hits on. */
    s32 timer[16];              /**< Nonzero while each sphere is in use. */
    u8 unk_240[0x140];
    s32 parameter[16][6]; /**< Percentage of damage each sphere takes from each attacker. */
    s32 hit_slot;         /**< Sphere the last hit landed on. */
    s32 hit_attributes;   /**< Weapon flags of the last hit. */
    u8 unk_508[8];
};

STATIC_ASSERT(sizeof(MONSTOR_EFFECT_STATE) == 0x510);

/**
 * Hits one monster gives, one slot per collision sphere.
 */
struct MONSTOR_EFFECT_STATE2 {
    sceVu0FVECTOR position[16]; /**< World position of each sphere. */
    CFrame *frame[16];          /**< Frame each sphere follows. */
    float radius[16];           /**< Radius of each sphere. */
    s32 damage[16];             /**< Damage each sphere deals. */
    s32 kind[16];               /**< Kind of hit each sphere deals. */
    float angle[16];            /**< Direction each sphere throws the player in, in degrees; 0 for away. */
    s32 flags[16];              /**< What each sphere's hit does besides damage. */
    float motion_start[16];     /**< Motion frame each sphere starts hitting on. */
    float motion_end[16];       /**< Motion frame each sphere stops hitting on. */
    s32 active[16];             /**< Nonzero while each sphere is in use. */
    u8 unk_340[0x10];
};

STATIC_ASSERT(sizeof(MONSTOR_EFFECT_STATE2) == 0x350);

/**
 * Spheres that block the player's movement around one monster.
 */
struct MONSTOR_EFFECT_STATE3 {
    sceVu0FVECTOR position[12]; /**< World position of each sphere. */
    CFrame *frame[12];          /**< Frame each sphere follows. */
    float radius[12];           /**< Radius of each sphere. */
    s32 timer[12];              /**< Nonzero while each sphere is in use. */
    s32 count;                  /**< Spheres in use. */
    u8 unk_154[0x0C];
};

STATIC_ASSERT(sizeof(MONSTOR_EFFECT_STATE3) == 0x160);

/**
 * A projectile one monster is about to fire.
 */
struct MONSTOR_EVENT_STATE {
    sceVu0FVECTOR local_position; /**< Direction the projectile leaves in. */
    sceVu0FVECTOR position;       /**< World position the projectile leaves from. */
    CFrame *frame;                /**< Frame the projectile leaves from. */
    s32 timer;                    /**< 1 once asked for, 2 once positioned, 0 once fired. */
    s32 damage_override;          /**< Damage that replaces the effect's own, or -1. */
    u8 unk_02C[4];
};

STATIC_ASSERT(sizeof(MONSTOR_EVENT_STATE) == 0x30);

/**
 * Motion frames during which one monster guards against hits.
 */
struct MONSTOR_GUARD_WINDOW {
    s16 active[3]; /**< Nonzero while each window is in use. */
    u8 unk_006[2];
    float motion_start[3]; /**< Motion frame each window opens on. */
    float motion_end[3];   /**< Motion frame each window closes on. */
};

STATIC_ASSERT(sizeof(MONSTOR_GUARD_WINDOW) == 0x20);

/**
 * Runs the monsters of one dungeon floor.
 */
class CMonstorUnit {
public:
    /**
     * Index of the monster whose behaviour is being evaluated.
     */
    int GetCurrentMonsterIndex() { return unk_090; }

    CDataAlloc2<1> *script[16]; /**< Script working memory for each monster on the floor. */
    CFrame *collision;          /**< Collision model that every monster on the floor shares. */
    s32 unk_044;
    s32 unk_048;
    s32 unk_04C;
    s32 script_state[16]; /**< 1 while each monster's script is running. */
    s32 unk_090;
    s32 unk_094;
    s32 unk_098;
    s32 unk_09C;
    CMonstorChara base_chara[9];       /**< Characters loaded for each kind of monster on the floor. */
    MONSTOR_MODEL model[9];            /**< Parameters of each kind of monster on the floor. */
    char *script_data[9];              /**< Script of each kind of monster on the floor. */
    MONSTOR monster[16];               /**< What each monster of the floor is doing. */
    CMonstorChara chara[16];           /**< The characters each monster draws with. */
    CRunScript interpreter[16];        /**< Script interpreter of each monster. */
    MONSTOR_EFFECT_STATE effect[16];   /**< Hits each monster can take. */
    MONSTOR_EFFECT_STATE2 effect2[16]; /**< Hits each monster gives. */
    MONSTOR_EFFECT_STATE3 effect3[16]; /**< Spheres that block the player around each monster. */
    MONSTOR_SOUND sound[16];           /**< Sounds each monster plays. */
    MONSTOR_EVENT_STATE event[16];     /**< First projectile each monster fires. */
    MONSTOR_EVENT_STATE event2[16];    /**< Second projectile each monster fires. */

    union {
        s16 event_flags[16][16];        /**< Guard windows of each monster, as the words set-up clears. */
        MONSTOR_GUARD_WINDOW guard[16]; /**< Guard windows of each monster. */
    };

    /**
     * Counts the monsters present on the floor.
     *
     * @mangled GetMonstorNum__12CMonstorUnitFv
     * @address 0x1D7A40
     * @size 0x60
     */
    int GetMonstorNum(void);

    /**
     * Draws the monsters' symbols on the minimap.
     *
     * @mangled DrawMapSymbol__12CMonstorUnitFPf
     * @address 0x1D7AA0
     * @size 0x1E0
     * @unknownret
     */
    void DrawMapSymbol(float *);

    /**
     * Gives the floor's key to one monster.
     *
     * @mangled SetKey__12CMonstorUnitFv
     * @address 0x1D7C80
     * @size 0x150
     * @unknownret
     */
    void SetKey(void);

    /**
     * Returns and clears the event a defeated monster raised, or -1.
     *
     * @mangled CheckEventFlag2__12CMonstorUnitFv
     * @address 0x1D7F30
     * @size 0x90
     */
    int CheckEventFlag2(void);

    /**
     * Places monsters on the floor, apart from the others.
     *
     * @mangled ArrangementPos__12CMonstorUnitFP11CDungeonMapiii
     * @address 0x1D7FC0
     * @size 0x3A0
     */
    void ArrangementPos(CDungeonMap *, int, int, int);

    /**
     * Starts a timed status on every monster of the floor.
     *
     * @mangled AllBin2__12CMonstorUnitFv
     * @address 0x1D8360
     * @size 0x50
     */
    void AllBin2(void);

    /**
     * Applies the monster's palette to the ambient light before it draws.
     *
     * @mangled PalletSet__12CMonstorUnitFv
     * @address 0x1D83B0
     * @size 0x1C0
     */
    void PalletSet(void);

    /**
     * Advances the monster's palette fade and colour cycle.
     *
     * @mangled PalletStep__12CMonstorUnitFv
     * @address 0x1D8570
     * @size 0x420
     */
    void PalletStep(void);

    /**
     * Plays the monster's motion sounds that fall on the current frame.
     *
     * @mangled SoundCheck__12CMonstorUnitFv
     * @address 0x1D8990
     * @size 0x340
     */
    void SoundCheck(void);

    /**
     * Steps and draws every monster in play.
     *
     * @mangled DrawMonstor__12CMonstorUnitFv
     * @address 0x1D8CD0
     * @size 0x540
     * @unknownret
     */
    void DrawMonstor(void);

    /**
     * Draws the cursor over monsters that the view limit put on hold.
     *
     * @mangled DrawMonstorCursor__12CMonstorUnitFv
     * @address 0x1D9210
     * @size 0xE0
     * @unknownret
     */
    void DrawMonstorCursor(void);

    /**
     * Draws the shadows of the monsters in play.
     *
     * @mangled DrawShadowMonstor__12CMonstorUnitFv
     * @address 0x1D9800
     * @size 0x1A0
     * @unknownret
     */
    void DrawShadowMonstor(void);

    /**
     * Wakes monsters near the player, and limits how many are active at once.
     *
     * @mangled CheckViewLevel__12CMonstorUnitFv
     * @address 0x1D99A0
     * @size 0x3C0
     */
    void CheckViewLevel(void);

    /**
     * Chooses the attachment a defeated monster drops, or -1.
     *
     * @mangled SelectAttachi__12CMonstorUnitFv
     * @address 0x1D9D60
     * @size 0x1B0
     */
    int SelectAttachi(void);

    /**
     * Applies the hits a monster gives and takes this step; 1 when hit, 2 when killed.
     *
     * @mangled CheckDmg__12CMonstorUnitFv
     * @address 0x1D9F10
     * @size 0x2910
     */
    int CheckDmg(void);

    /**
     * Stops the player's movement where it would run into a monster.
     *
     * @mangled MoveCheck__12CMonstorUnitFPfPfi
     * @address 0x1DC820
     * @size 0x5B0
     * @unknownret
     */
    void MoveCheck(float *, float *, int);

    /**
     * Stops the monster's movement where it would run into the player.
     *
     * @mangled MoveCheck2__12CMonstorUnitFv
     * @address 0x1DCDD0
     * @size 0x370
     */
    void MoveCheck2(void);

    /**
     * Stops the monster's movement where it would run into another monster.
     *
     * @mangled MoveChecMonster__12CMonstorUnitFv
     * @address 0x1DD140
     * @size 0x400
     */
    void MoveChecMonster(void);

    /**
     * Runs every monster's script, movement, damage and rewards for one frame.
     *
     * @mangled Step__12CMonstorUnitFi
     * @address 0x1DD540
     * @size 0x24B0
     * @unknownret
     */
    void Step(int);

    /**
     * Clears every monster and effect on the floor.
     *
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
     * Puts a loaded monster model on the floor at a position.
     *
     * @mangled SetupViewMonstor__12CMonstorUnitFiPfi
     * @address 0x1E02B0
     * @size 0x1390
     * @unknownret
     */
    int SetupViewMonstor(int, float *, int);
};

STATIC_ASSERT(sizeof(CMonstorUnit) == 0x60750);

/**
 * Animation frame and phase of one rendered bee.
 */
struct BEE_STATE {
    s32 row;     /**< Row of the bee's texture cell. */
    float phase; /**< Column of the bee's texture cell, advanced each draw. */
};

STATIC_ASSERT(sizeof(BEE_STATE) == 8);

/** Animation state of every bee drawn around the bee monster. */
extern BEE_STATE BeeTbl[800];

/** Number of floors in each dungeon. */
extern "C" int maxFloorTbl__3[7];

/** Texture animations shared by every monster model. */
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

/** Model, script and combat parameters of every kind of monster. */
extern "C" MONSTOR_MODEL MonstorTable[167];

/** Projectile effects the monsters fire, indexed by MONSTOR_MODEL::shot_effect. */
extern "C" BT_SHOT_EFFECT *BtEntryEffectTbl[34];
