#pragma once

#include "common.h"

#include "character.hpp"
#include "itemdata.hpp"

/**
 * Stores the state used by the weapon enhancement effect menu.
 *
 * The first attachment-shaped record is also used as the temporary status
 * break item written into the dungeon consumable inventory.
 */
class CWeaponLevelUp {
public:
    WEAPON_HAVE preview;         /**< Weapon values shown by the menu. */
    s16 status_item_no;          /**< Item id of the temporary status-break item. */
    s16 status_weapon_no;        /**< Weapon id recorded in the status-break item. */
    s16 status_flags;            /**< Status flags collected from the weapon. */
    s8 status_weapon_kind;       /**< Character/weapon kind recorded in the status-break item. */
    u8 status_stat_padding;      /**< Padding between the status-break kind and its stats. */
    s16 status_stats[4];         /**< Reduced attack, endurance, speed and magic values. */
    s8 status_elements[5];       /**< Reduced fire, ice, thunder, wind and holy values. */
    s8 status_monster[10];       /**< Reduced monster-effectiveness values. */
    u8 status_padding[9];        /**< Tail bytes of the temporary attachment record. */
    CCharacter effect;           /**< Character animation displayed by the menu. */
    s32 unk_12d0;                /**< Unused state word retained by the menu object. */
    WEAPON_HAVE *weapon;         /**< Weapon being enhanced by the active effect. */
    CCharacter *chara;           /**< Character associated with the active effect. */
    s16 effect_motion;           /**< Current motion number in the effect animation. */
    s16 buildup_weapon_no;       /**< Weapon id selected by the build-up operation. */
    s8 buildup_complete;         /**< Whether the build-up operation has completed. */
    s8 lost_default_weapon;      /**< Whether the operation consumed a default weapon. */
    s16 message_no;              /**< Message number used by the result window. */
    s32 message_value;           /**< Value displayed in the result window. */
    s16 synthesis_count;         /**< Number of synthesis attachments consumed. */
    s16 unk_12ea;                /**< Unused word between synthesis and icon tables. */
    s16 attachment_icons[5];     /**< Attachment ids shown orbiting the effect. */
    s16 attachment_values[5];    /**< Values displayed beside the attachment icons. */
    s16 effect_active;           /**< Nonzero while the effect animation is active. */
    s16 operation_kind;          /**< Active operation: level-up, break, build-up or recovery. */
    s16 texture_block;           /**< Texture block used by the active menu effect. */
    u8 texture_padding[2];       /**< Alignment padding after the texture block id. */
    float effect_x;              /**< X coordinate for a positioned effect. */
    float effect_y;              /**< Y coordinate for a positioned effect. */
    float effect_timer;          /**< Frame timer for the active effect sequence. */
    s16 effect_state;            /**< State-machine step for the active effect sequence. */
    s16 snd_volume;              /**< Current background-music volume during a fade. */
    s16 snd_from;                /**< Background-music volume at the start of a fade. */
    s16 snd_to;                  /**< Background-music volume at the end of a fade. */
    s16 snd_step;                /**< Volume change applied on each fade step. */
    u8 sound_padding[0xA];       /**< Unused bytes before the effect data buffer. */
    u_long128 *effect_buffer;    /**< Aligned buffer used to load effect data. */
    u8 effect_buffer_padding[4]; /**< Tail padding preserving the object size. */

    /**
     * Loads the package and sound data for one menu effect.
     *
     * @mangled CMenuEffectDataLoad__14CWeaponLevelUpFP1i
     * @address 0x00236000
     * @size 0x1E4
     */
    void CMenuEffectDataLoad(CWeaponLevelUp *, int);

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
    void SetLevelUpValue(WEAPON_HAVE *, CCharacter *, CWeaponLevelUp *, int);

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
    void SetStatusBreak(WEAPON_HAVE *, CCharacter *, CWeaponLevelUp *, int);

    /**
     * Calculates and starts the weapon build-up effect.
     *
     * @mangled SetBuildUp__14CWeaponLevelUpFP11WEAPON_HAVEP10CCharacterP1i
     * @address 0x00236C30
     * @size 0xCC
     */
    void SetBuildUp(WEAPON_HAVE *, CCharacter *, CWeaponLevelUp *, int);

    /**
     * Starts the weapon recovery effect.
     *
     * @mangled WepRecover__14CWeaponLevelUpFP11WEAPON_HAVEP10CCharacterP1i
     * @address 0x00236D00
     * @size 0x8C
     */
    void WepRecover(WEAPON_HAVE *, CCharacter *, CWeaponLevelUp *, int);

    /**
     * Starts an effect for curing a weapon-related status.
     *
     * @mangled CureEffect__14CWeaponLevelUpFiiP1ii
     * @address 0x00236D90
     * @size 0x100
     */
    void CureEffect(int, int, CWeaponLevelUp *, int, int);

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
    void SetSnd(int, int, int);

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

/**
 * Adds scaled attachment values to an accumulated attachment record.
 *
 * @mangled AttachMentValuePlus__FP11ATTACH_LISTP11ATTACH_LISTf
 * @address 0x00235A10
 * @size 0x1EC
 */
void AttachMentValuePlus(ATTACH_LIST *, ATTACH_LIST *, float);

/**
 * Calculates the weapon values produced by one or more level-ups.
 *
 * @mangled WeaponLevelUpValueCalc__FP11WEAPON_HAVEP11WEAPON_HAVEii
 * @address 0x00235C00
 * @size 0x3FC
 */
void WeaponLevelUpValueCalc(WEAPON_HAVE *, WEAPON_HAVE *, int, int);
