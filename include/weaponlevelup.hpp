#pragma once

#include "common.h"

#include "character.hpp"
#include "itemdata.hpp"

class CMenuItemStep;

/**
 * Stores the state used by the weapon enhancement effect menu.
 *
 * The first attachment-shaped record is also used as the temporary status
 * break item written into the dungeon consumable inventory.
 */
class CWeaponLevelUp {
public:
    WEAPON_HAVE preview;    /**< Working copy of the weapon holding the level-up or build-up result the menu shows. */
    s16 status_item_no;     /**< Item id of the synthesis item a status break produces. */
    s16 status_weapon_no;   /**< Item id of the weapon broken down into the synthesis item. */
    s16 status_flags;       /**< Special-behaviour flags carried by the synthesis item. */
    s8 status_weapon_level; /**< Level of the weapon broken down, shown in the break message. */
    u8 unk_ff;
    s16 status_stats[4];   /**< Attack, endurance, speed and magic carried over, at 60% of the weapon's. */
    s8 status_elements[5]; /**< Fire, ice, thunder, wind and holy values carried over, at 60% of the weapon's. */
    s8 status_monster[10]; /**< Monster-effectiveness values carried over, at 60% of the weapon's. */
    u8 unk_117[9];
    CCharacter effect;        /**< Model whose motions play the menu effect. */
    s32 reserved_word;        /**< Cleared on initialisation and never read. */
    WEAPON_HAVE *weapon;      /**< Weapon the active effect changes. */
    CCharacter *chara;        /**< Character whose weapon the active effect changes. */
    s16 effect_motion;        /**< Motion number the effect model plays. */
    s16 buildup_weapon_no;    /**< Item id of the weapon a build-up turns the weapon into. */
    s8 buildup_complete;      /**< Set once the build-up has rewritten the weapon. */
    s8 lost_default_weapon;   /**< Set when a status break reset a character's default weapon instead of removing it. */
    s16 message_no;           /**< Character named in a cure message, or a message id of 0x190 and above shown on its own. */
    s32 message_value;        /**< Number shown in a cure message. */
    s16 synthesis_count;      /**< Number of synthesis items the level-up absorbed. */
    s16 reserved_half;        /**< Cleared on initialisation and never read. */
    s16 attachment_icons[5];  /**< Item ids of the attachments orbiting the level-up effect. */
    s16 attachment_values[5]; /**< Values drawn beside the orbiting attachment icons. */
    s16 effect_active;        /**< Nonzero while the effect plays, which holds back the result message. */
    s16 operation_kind;       /**< Active effect: 0 level-up, 1 status break, 2 build-up, 3 recovery, 4 and above a cure, -1 idle. */
    s16 texture_block;        /**< Texture block the effect's textures load into. */
    u8 unk_1306[2];
    float effect_x;     /**< Horizontal position a cure effect plays at. */
    float effect_y;     /**< Vertical position a cure effect plays at. */
    float effect_timer; /**< Frames since the effect started, negative before it has. */
    s16 effect_state;   /**< Step of the effect state machine, starting at a per-operation base. */
    s16 snd_volume;     /**< Background-music volume the fade has reached. */
    s16 snd_from;       /**< Background-music volume the fade started from, restored afterwards. */
    s16 snd_to;         /**< Background-music volume the fade ends at. */
    s16 snd_step;       /**< Signed volume change per frame, zero once the fade ends. */
    u8 unk_131e[0xA];
    u_long128 *effect_buffer; /**< Next free position in the buffer the effect package and sound load into. */
    u8 unk_132c[4];

    /**
     * Loads the package and sound data for one menu effect.
     *
     * @mangled CMenuEffectDataLoad__14CWeaponLevelUpFP1i
     * @address 0x00236000
     * @size 0x1E4
     */
    void CMenuEffectDataLoad(CWeaponLevelUp *load_buffer, int kind);

    /**
     * Clears the menu's tables and runtime state.
     *
     * @mangled Initialize__14CWeaponLevelUpFv
     * @address 0x002361F0
     * @size 0x90
     */
    void Initialize();

    /**
     * Calculates and starts the weapon level-up effect.
     *
     * @mangled SetLevelUpValue__14CWeaponLevelUpFP11WEAPON_HAVEP10CCharacterP1i
     * @address 0x00236280
     * @size 0x4E8
     */
    void SetLevelUpValue(WEAPON_HAVE *have, CCharacter *character, CWeaponLevelUp *load_buffer, int tex_block);

    /**
     * Applies the completed level-up values to the weapon.
     *
     * @mangled SetLevelUpWeaponData__14CWeaponLevelUpFv
     * @address 0x00236770
     * @size 0x158
     */
    void SetLevelUpWeaponData();

    /**
     * Calculates and starts the status-break effect.
     *
     * @mangled SetStatusBreak__14CWeaponLevelUpFP11WEAPON_HAVEP10CCharacterP1i
     * @address 0x002368D0
     * @size 0x358
     */
    void SetStatusBreak(WEAPON_HAVE *have, CCharacter *character, CWeaponLevelUp *load_buffer, int tex_block);

    /**
     * Calculates and starts the weapon build-up effect.
     *
     * @mangled SetBuildUp__14CWeaponLevelUpFP11WEAPON_HAVEP10CCharacterP1i
     * @address 0x00236C30
     * @size 0xCC
     */
    void SetBuildUp(WEAPON_HAVE *have, CCharacter *character, CWeaponLevelUp *load_buffer, int tex_block);

    /**
     * Starts the weapon recovery effect.
     *
     * @mangled WepRecover__14CWeaponLevelUpFP11WEAPON_HAVEP10CCharacterP1i
     * @address 0x00236D00
     * @size 0x8C
     */
    void WepRecover(WEAPON_HAVE *have, CCharacter *character, CWeaponLevelUp *load_buffer, int tex_block);

    /**
     * Starts an effect for curing a weapon-related status.
     *
     * @mangled CureEffect__14CWeaponLevelUpFiiP1ii
     * @address 0x00236D90
     * @size 0x100
     */
    void CureEffect(int x, int y, CWeaponLevelUp *load_buffer, int tex_block, int kind);

    /**
     * Resets the background-music fade state.
     *
     * @mangled InitSnd__14CWeaponLevelUpFv
     * @address 0x00236E90
     * @size 0x1C
     */
    void InitSnd();

    /**
     * Starts a background-music fade from one volume to another.
     *
     * @mangled SetSnd__14CWeaponLevelUpFiii
     * @address 0x00236EB0
     * @size 0x3C
     */
    void SetSnd(int from, int to, int step);

    /**
     * Advances the active background-music fade by one step.
     *
     * @mangled StepSnd__14CWeaponLevelUpFv
     * @address 0x00236EF0
     * @size 0x98
     */
    void StepSnd();

    /**
     * Restores the current background-music volume and clears the fade.
     *
     * @mangled CheckSnd__14CWeaponLevelUpFv
     * @address 0x00236F90
     * @size 0x78
     */
    void CheckSnd();

    /**
     * Advances the active weapon effect state machine.
     *
     * @mangled Step__14CWeaponLevelUpFv
     * @address 0x00237010
     * @size 0x91C
     */
    void Step();

    /**
     * Draws the active weapon effect and its attachment icons.
     *
     * @mangled Draw__14CWeaponLevelUpFv
     * @address 0x00237930
     * @size 0x36C
     */
    void Draw();

    /**
     * Draws the result message for the active weapon effect.
     *
     * @mangled DrawMes__14CWeaponLevelUpFv
     * @address 0x00237CA0
     * @size 0x404
     */
    void DrawMes();
};

STATIC_ASSERT(sizeof(CWeaponLevelUp) == 0x1330);

/** State of the weapon menu's repair, level-up and build-up effects. */
extern CWeaponLevelUp MenuWepLevelUp;

/**
 * Adds scaled attachment values to an accumulated attachment record.
 *
 * @mangled AttachMentValuePlus__FP11ATTACH_LISTP11ATTACH_LISTf
 * @address 0x00235A10
 * @size 0x1EC
 */
void AttachMentValuePlus(ATTACH_LIST *total, ATTACH_LIST *attach, float scale);

/**
 * Calculates the weapon values produced by one or more level-ups.
 *
 * @mangled WeaponLevelUpValueCalc__FP11WEAPON_HAVEP11WEAPON_HAVEii
 * @address 0x00235C00
 * @size 0x3FC
 */
void WeaponLevelUpValueCalc(WEAPON_HAVE *src, WEAPON_HAVE *dst, int levels, int unused);

/** Whether an interior is being entered, and the item-volume step to check. */
extern CMenuItemStep ItemVolumeStep;
