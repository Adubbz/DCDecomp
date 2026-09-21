#pragma once

#include "common.h"
#include "rect.hpp"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CCharacter;
class ClsMes;
struct RECT;
struct WEAPON_HAVE;

/**
 * Holds a gradient's four corner colours.
 */
struct GRADATION_COLOR_INFO2 {
    spRGBA colors[4]; /**< Corner colours, in the order DrawMenuColorGradation takes them. */
};

STATIC_ASSERT(sizeof(GRADATION_COLOR_INFO2) == 0x10);

/**
 * Tracks which character and weapon the weapon menu's cursor is on.
 */
struct WEP_MENU_INFO {
    char unk_00[2];
    s16 unk_02;
    s8 weapon_slot; /**< Weapon slot the cursor is on, within the selected character's chara_weapons row. */
    s8 chara;       /**< Party member index the weapon menu is showing. */
    char unk_06[2];
    s8 unk_08;
    char unk_09[3];
    s16 unk_0C;
    char unk_0E[0x12];
    s32 unk_20;
    char unk_24[8];
    s32 unk_2C;
    char unk_30[0x149];
    s8 unk_179;
    char unk_17A[2];
};

STATIC_ASSERT(sizeof(WEP_MENU_INFO) == 0x17C);

/**
 * Tracks what a message on the item menu is currently about.
 */
struct ITEM_MENU_MODE_INFO {
    s16 unk_00;
    s16 chara; /**< Party member index the item page is showing. */
    char unk_04[0x20];
    s32 unk_24;
    char unk_28[4];
    s32 unk_2C;
    char unk_30[0x154];
    s16 message_item_no; /**< Item number the last SetNowEquipWeaponDataForMsg call named. */
    s16 message_slot;    /**< Slot number the last SetNowEquipWeaponDataForMsg call named. */
};

STATIC_ASSERT(sizeof(ITEM_MENU_MODE_INFO) == 0x188);

/**
 * Holds the battle menu's character page state.
 */
struct MENU_CHARA_INFO {
    s16 unk_00;
    s8 unk_02;
    s8 unk_03;
    float unk_04;
    float unk_08;
};

STATIC_ASSERT(sizeof(MENU_CHARA_INFO) == 0xC);

/**
 * Holds one party member's place on the character page's turntable.
 */
struct SYS_CHARA_INFO {
    s8 unk_00;
    s8 unk_01;
    char unk_02[2];
    s32 unk_04;
    s32 unk_08;
};

STATIC_ASSERT(sizeof(SYS_CHARA_INFO) == 0xC);

/**
 * Holds the travel page's state.
 */
struct MENU_MOVE_INFO {
    s32 unk_00;
    s32 unk_04;
    char unk_08[0xC];
    s32 unk_14;
    char unk_18[8];
};

STATIC_ASSERT(sizeof(MENU_MOVE_INFO) == 0x20);

/**
 * Ranks one world-map destination by how near it is.
 *
 * Every field below is taken from GetNearWorldPos, the only function that
 * fills these in: it builds sixteen of them on the stack, sorts them on
 * `distance`, and reads nothing else back out. The offsets and widths are
 * what that code uses; the names are what its arithmetic implies.
 */
struct MAP_JUMP_COMPARE {
    s8 index;        /**< Identifies the destination this entry stands for. */
    s8 reachable;    /**< Is one when the destination can be jumped to, zero when it cannot. */
    char unk_02[2];  /**< Contains the padding before `distance`. */
    float distance;  /**< Orders the entries; GetNearWorldPos sorts on this ascending. */
    s32 dx;          /**< Contains one axis of the offset to the destination. */
    s32 dy;          /**< Contains the other axis of the offset to the destination. */
    s32 distance_sq; /**< Contains dx squared plus dy squared. */
};

STATIC_ASSERT(sizeof(MAP_JUMP_COMPARE) == 0x14);

/**
 * Holds the screen position of one icon on the battle menu ring.
 */
struct MENU_ICON_POS {
    float x; /**< Horizontal screen position of the icon. */
    float y; /**< Vertical screen position of the icon. */
};

STATIC_ASSERT(sizeof(MENU_ICON_POS) == 0x8);

/**
 * Gives the weapon a party member starts with.
 *
 * @mangled GetDefaultWeaponNo__Fi
 * @address 0x1F3DA0
 * @size 0x1C
 * Returns the first weapon identifier in a character's weapon chain.
 */
int GetDefaultWeaponNo(int character_no);

/**
 * Reports which party member a weapon is the starting weapon of, or -1 for none.
 *
 * @mangled IsDefaultWeapon__Fi
 * @address 0x1F3DC0
 * @size 0x84
 */
int IsDefaultWeapon(int weapon_no);

/**
 * Remembers the weapon and slot a message is about to name.
 *
 * @mangled SetNowEquipWeaponDataForMsg__Fii
 * @address 0x1F3E50
 * @size 0x18
 * Records the weapon the item menu's message is about.
 */
void SetNowEquipWeaponDataForMsg(int item_no, int slot);

/**
 * Gives the item number and slot the last message was told about.
 *
 * @mangled GetNowEquipWeaponDataForMsg__FRiRi
 * @address 0x1F3E70
 * @size 0x68
 */
void GetNowEquipWeaponDataForMsg(int &item_no, int &slot);

/**
 * Gives one of the menu's gradient colour pairs.
 *
 * @mangled GetGradationColorInfo2__Fi
 * @address 0x1F3EE0
 * @size 0x18
 */
GRADATION_COLOR_INFO2 *GetGradationColorInfo2(int index);

/**
 * Sets whether the party is escaping the dungeon.
 *
 * @mangled SetEscapeDngFlag__Fi
 * @address 0x1F3FA0
 * @size 0xC
 */
void SetEscapeDngFlag(int flag);

/**
 * Returns the flag that says the party is escaping the dungeon.
 *
 * @mangled GetEscapeDngFlag__Fv
 * @address 0x1F3FB0
 * @size 0xC
 */
s16 GetEscapeDngFlag(void);

/**
 * Sets whether the party is leaving an interior area.
 *
 * @mangled SetInteriorOutFlag__Fi
 * @address 0x1F3FC0
 * @size 0xC
 */
void SetInteriorOutFlag(int flag);

/**
 * Returns the flag that says the party is leaving an interior area.
 *
 * @mangled GetInteriorOutFlag__Fv
 * @address 0x1F3FD0
 * @size 0xC
 */
s16 GetInteriorOutFlag(void);

/**
 * Chooses the message that explains why the party may not leave the zone.
 *
 * @mangled GetLimmitMsg__Fv
 * @address 0x1F44F0
 * @size 0x6C
 */
int GetLimmitMsg(void);

/**
 * Draws the menu's main page: the bar, the selected icon's title and its help text.
 *
 * @mangled DrawBattleMain__Fv
 * @address 0x1F4560
 * @size 0x310
 */
void DrawBattleMain(void);

/**
 * Draws one unselected party member's face, life and magic bars.
 *
 * @mangled DrawOtherCharaStatus__Fiiii
 * @address 0x1F4870
 * @size 0x484
 */
void DrawOtherCharaStatus(int, int, int, int);

/**
 * Draws one party member's dungeon status panel with their weapon and condition.
 *
 * @mangled DngComStatus__Fiiii
 * @address 0x1F4D00
 * @size 0x720
 */
void DngComStatus(int, int, int, int);

/**
 * Draws the selected party member's full status panel.
 *
 * @mangled DrawSelCharaStatus__Fffiiiiii
 * @address 0x1F5420
 * @size 0x3EC
 */
void DrawSelCharaStatus(float, float, int, int, int, int, int, int);

/**
 * Loads the battle menu's texture blocks and message buffers.
 *
 * @mangled BattleMenuTexEnter__Fv
 * @address 0x1F59C0
 * @size 0x140
 */
void BattleMenuTexEnter(void);

/**
 * Clears the menu's item list and hands the party's state back to the game.
 *
 * @mangled ExitBattleMenu__Fi
 * @address 0x1F5B00
 * @size 0x1EC
 * Tears the battle menu down: its textures, its buffers, the gamepad and the BGM volume.
 */
void ExitBattleMenu(int);

/**
 * Takes the texture blocks the menu was given, sets the pad up and opens the chosen
 * mode.
 *
 * @mangled BattleMenuInit__FPii
 * @address 0x1F5CF0
 * @size 0x45C
 */
void BattleMenuInit(int *, int);

/**
 * Draws the whole menu for one frame, choosing the page from the menu state.
 *
 * @mangled BattleMenuDraw__Fv
 * @address 0x1F61E0
 * @size 0x540
 */
void BattleMenuDraw(void);

/**
 * Runs one frame of the menu, stepping the party and dispatching on the menu state.
 *
 * @mangled BattleMenuCursor__Fv
 * @address 0x1F6720
 * @size 0x194
 */
int BattleMenuCursor(void);

/**
 * Slides the bar icons into place and reports when they have all arrived.
 *
 * @mangled BattleMenuAppear__Fv
 * @address 0x1F68C0
 * @size 0x17C
 */
void BattleMenuAppear(void);

/**
 * Moves the cursor along the menu bar and opens the page it settles on.
 *
 * @mangled BattleMenuSelect__Fv
 * @address 0x1F6B20
 * @size 0x438
 */
void BattleMenuSelect(void);

/**
 * Slides the page in or out and reports when the movement has finished.
 *
 * @mangled ToFromSelect__Fi
 * @address 0x1F6F60
 * @size 0x29C
 * Steps the battle menu ring towards the icon it is given and returns the icon it settles on.
 */
int ToFromSelect(int);

/**
 * Handles input on the character page, including the turntable and the equipment list.
 *
 * @mangled BattleMenuCharaKey__Fv
 * @address 0x1F7440
 * @size 0x9EC
 */
void BattleMenuCharaKey(void);

/**
 * Draws the character page with its model, status and equipment.
 *
 * @mangled DrawCharaSelect__Fv
 * @address 0x1F7E30
 * @size 0xEF4
 */
void DrawCharaSelect(void);

/**
 * Draws one weapon's attack and endurance bars with its experience.
 *
 * @mangled DrawWepDamageDraw__F4RECTP11WEAPON_HAVEi
 * @address 0x1F8D30
 * @size 0x4B4
 */
void DrawWepDamageDraw(RECT, WEAPON_HAVE *, int);

/**
 * Draws one weapon's status panel.
 *
 * @mangled DrawWepStatus__FiiP11WEAPON_HAVEii
 * @address 0x1F91F0
 * @size 0xD8
 */
void DrawWepStatus(int, int, WEAPON_HAVE *, int, int);

/**
 * Draws the bars comparing a weapon's current values against its built-up ones.
 *
 * @mangled DrawWepVolumeDisplay__FiiP11WEAPON_HAVEi
 * @address 0x1F92D0
 * @size 0x2A8
 */
void DrawWepVolumeDisplay(int, int, WEAPON_HAVE *, int);

/**
 * Returns the x position that centers a weapon name of a width.
 *
 * @mangled GetWeaponNamePutX__Fii
 * @address 0x1F96C0
 * @size 0x10
 */
s32 GetWeaponNamePutX(int, int);

/**
 * Draws the names of the weapons either side of the cursor as they slide past.
 *
 * @mangled WeaponNameDraw__Fiii
 * @address 0x1F96D0
 * @size 0x550
 */
void WeaponNameDraw(int, int, int);

/**
 * Draws one weapon-status bar, filled to the value's share of its maximum.
 *
 * @mangled WepStatusVolumeDraw__F4RECTiPiiiii
 * @address 0x1F9C20
 * @size 0x220
 */
void WepStatusVolumeDraw(RECT, int, int *, int, int, int, int);

/**
 * Draws the gradient frame a weapon-status row sits in.
 *
 * @mangled DrawWeaponStatusWaku__Fiiii
 * @address 0x1F9E40
 * @size 0x68
 */
void DrawWeaponStatusWaku(int, int, int, int);

/**
 * Draws the left and right cursor arrows, bobbing them with a sine.
 *
 * @mangled DrawBtlMenuLRCursor__Fiiii
 * @address 0x1F9F10
 * @size 0x194
 */
void DrawBtlMenuLRCursor(int, int, int, int);

/**
 * Draws a weapon's status tags with their volume bars.
 *
 * @mangled DrawWeaponStatusTag__FiiP11WEAPON_HAVEiii
 * @address 0x1FA0B0
 * @size 0x7B8
 * Draws one weapon's status tags: their values, their gradation bars and their experience numbers.
 */
void DrawWeaponStatusTag(int, int, WEAPON_HAVE *, int, int, int);

/**
 * Draws a weapon's elemental tags with their volume bars.
 *
 * @mangled DrawWeaponElemTag__FiiP11WEAPON_HAVEiii
 * @address 0x1FA870
 * @size 0x42C
 * Draws one weapon's elemental tags with their volume bars.
 */
void DrawWeaponElemTag(int, int, WEAPON_HAVE *, int, int, int);

/**
 * Draws one weapon's anti-monster tags with their volume bars.
 *
 * @mangled DrawWeaponVsMonster__FiiP11WEAPON_HAVEiii
 * @address 0x1FACA0
 * @size 0x350
 */
void DrawWeaponVsMonster(int, int, WEAPON_HAVE *, int, int, int);

/**
 * Draws the three tag pages of a weapon and highlights the one the cursor is on.
 *
 * @mangled DrawWeaponTagBoard__FiiP11WEAPON_HAVEiii
 * @address 0x1FAFF0
 * @size 0x210
 */
void DrawWeaponTagBoard(int, int, WEAPON_HAVE *, int, int, int);

/**
 * Draws one weapon's model, name and every panel that describes it.
 *
 * @mangled DrawAallWeapon__FiifP10CCharacterP11WEAPON_HAVEiii
 * @address 0x1FB200
 * @size 0x55C
 */
void DrawAallWeapon(int, int, float, CCharacter *, WEAPON_HAVE *, int, int, int);

/**
 * Draws the weapon page for one party member, sliding between their weapons.
 *
 * @mangled BtlWeaponDraw__Fifii
 * @address 0x1FB760
 * @size 0x748
 */
void BtlWeaponDraw(int, float, int, int);

/**
 * Draws the dialog that offers to repair, build up or scrap the selected weapon.
 *
 * @mangled DrawWeaponSelectDialog__Fiii
 * @address 0x1FC220
 * @size 0x530
 */
void DrawWeaponSelectDialog(int, int, int);

/**
 * Opens the weapon page in one of its modes and puts the cursor where it was left.
 *
 * @mangled InitWeaponSelect__Fii
 * @address 0x1FC750
 * @size 0x3CC
 */
void InitWeaponSelect(int, int);

/**
 * Rebuilds the player's equipped weapon model and gives the menu's textures back.
 *
 * @mangled ExitWeaponMenuSelect__Fv
 * @address 0x1FCB20
 * @size 0x2CC
 */
void ExitWeaponMenuSelect(void);

/**
 * Runs one frame of the weapon page, dispatching on which of its modes is open.
 *
 * @mangled WeaponMenuSelect__Fv
 * @address 0x1FCDF0
 * @size 0x107C
 */
void WeaponMenuSelect(void);

/**
 * Moves the cursor across the weapon list and opens what it settles on.
 *
 * @mangled WeaponSelectKey__Fv
 * @address 0x1FDF20
 * @size 0x178C
 */
void WeaponSelectKey(void);

/**
 * Takes the held attachment back out of the player's hand.
 *
 * @mangled WepAttachHaveCancel__Fv
 * @address 0x1FF6B0
 * @size 0x198
 * Puts the attachment the weapon menu is holding back where it came from.
 */
void WepAttachHaveCancel(void);

/**
 * Moves the cursor between the three attachment pages.
 *
 * @mangled WeaponMenuAttachModeKey__Fv
 * @address 0x1FF850
 * @size 0x23C
 */
void WeaponMenuAttachModeKey(void);

/**
 * Moves the cursor down the tags of the open attachment page.
 *
 * @mangled WeaponMenuTagKey__Fv
 * @address 0x1FFB60
 * @size 0x5B4
 * Handles input on the weapon menu's tag row, fitting and removing tags.
 */
void WeaponMenuTagKey(void);

/**
 * Moves the cursor across the weapons an attachment may be put on.
 *
 * @mangled WeaponMenuAttachWepKey__Fv
 * @address 0x200120
 * @size 0x414
 * Handles input while an attachment is being fitted to a weapon.
 */
void WeaponMenuAttachWepKey(void);

/**
 * Handles input while an attachment is being moved on the weapon menu.
 *
 * @mangled WeaponMenuAttachKey__Fv
 * @address 0x200540
 * @size 0x270
 */
void WeaponMenuAttachKey(void);

/**
 * Draws the repair and build-up dialog with the counts of the items it needs.
 *
 * @mangled RepairAndLevelUpDraw__Fiii
 * @address 0x2007B0
 * @size 0x290
 */
void RepairAndLevelUpDraw(int, int, int);

/**
 * Draws the list of weapons the selected one may be built up into.
 *
 * @mangled DrawBuildUpWeaponSelect__Fiii
 * @address 0x200A40
 * @size 0x238
 */
void DrawBuildUpWeaponSelect(int, int, int);

/**
 * Draws the weapon page and whichever dialog is open over it.
 *
 * @mangled WeaponMenuDraw__Fv
 * @address 0x200C80
 * @size 0x11A8
 */
void WeaponMenuDraw(void);

/**
 * Handles input while items are being thrown away.
 *
 * @mangled ItemTrushKey__FPiPii
 * @address 0x201E30
 * @size 0x2F0
 */
void ItemTrushKey(int *, int *, int);

/**
 * Draws the list of items that may be thrown away.
 *
 * @mangled DrawTrushItem__Fv
 * @address 0x202120
 * @size 0x2F4
 */
void DrawTrushItem(void);

/**
 * Remembers where the item page's cursor stood and closes it.
 *
 * @mangled ExitItemSelect__Fv
 * @address 0x202420
 * @size 0x88
 */
void ExitItemSelect(void);

/**
 * Waits for the item page's weapon icons and enters them into the texture manager.
 *
 * @mangled ReadSyncItemMenuWepIcon__Fv
 * @address 0x202510
 * @size 0xC8
 */
void ReadSyncItemMenuWepIcon(void);

/**
 * Opens the item page on one party member, restoring the mode it was left in.
 *
 * @mangled InitItemMode__Fii
 * @address 0x2025E0
 * @size 0x624
 */
void InitItemMode(int, int);

/**
 * Gives the item page's textures back and re-equips anyone left without a weapon.
 *
 * @mangled ExistItemMenu__Fv
 * @address 0x202C90
 * @size 0xC0
 */
void ExistItemMenu(void);

/**
 * Runs one frame of the item page, dispatching on which of its modes is open.
 *
 * @mangled ItemMenuMainKey__Fv
 * @address 0x202F10
 * @size 0x2AA0
 */
void ItemMenuMainKey(void);

/**
 * Draws the item page for whichever of its modes is open.
 *
 * @mangled ItemMenuModeDraw__Fv
 * @address 0x2059B0
 * @size 0xA30
 */
void ItemMenuModeDraw(void);

/**
 * Moves the cursor across the item list and wraps it at the ends.
 *
 * @mangled ItemMenuModeKey__Fv
 * @address 0x2063E0
 * @size 0x4D8
 */
void ItemMenuModeKey(void);

/**
 * Draws the party member's active item slots and what stands in them.
 *
 * @mangled ActiveItemDraw__Fiii
 * @address 0x2068C0
 * @size 0x1EC
 */
void ActiveItemDraw(int, int, int);

/**
 * Draws the item page's status panel for one party member.
 *
 * @mangled ItemMenuCharaStatusDraw__Fiiii
 * @address 0x206B40
 * @size 0xDA0
 */
void ItemMenuCharaStatusDraw(int, int, int, int);

/**
 * Chooses which of the use, equip and throw prompts an item offers.
 *
 * @mangled ItemNaviCursor__Fi
 * @address 0x2078E0
 * @size 0x2D8
 */
void ItemNaviCursor(int);

/**
 * Draws the party member's status ailments, bobbing the icons with a sine.
 *
 * @mangled CharaStatusMsgDraw__Fiiiii
 * @address 0x207BC0
 * @size 0x22C
 */
void CharaStatusMsgDraw(int, int, int, int, int);

/**
 * Opens the travel page, either on the world map or on the local one.
 *
 * @mangled InitMenuMove__FiiP1
 * @address 0x207EF0
 * @size 0x414
 */
void InitMenuMove(int, int, void /* CW back-ref target unresolved */ *);

/**
 * Places the party's marker on the town or dungeon the cursor stands on.
 *
 * @mangled GetTownOrDngPos__Fv
 * @address 0x208310
 * @size 0x180
 */
void GetTownOrDngPos(void);

/**
 * Handles input on the travel page and reports the destination that was chosen.
 *
 * @mangled MenuMoveKey__Fv
 * @address 0x208490
 * @size 0xB54
 */
void MenuMoveKey(void);

/**
 * Draws the travel page with its map, its names and its confirmation plate.
 *
 * @mangled DrawMenuMove__Fv
 * @address 0x208FF0
 * @size 0xCC8
 */
void DrawMenuMove(void);

/**
 * Draws the escape item dialog with its count, its money board and its help window.
 *
 * @mangled DrawEscapeItem__Fiii
 * @address 0x209CC0
 * @size 0x2C0
 */
void DrawEscapeItem(int, int, int);

/**
 * Starts reading one region's world map in the background.
 *
 * @mangled StartLoadWorldMap__FiP1
 * @address 0x209F80
 * @size 0xBC
 */
void StartLoadWorldMap(int, void /* CW back-ref target unresolved */ *);

/**
 * Waits for the world map and enters its textures and model.
 *
 * @mangled LoadWorldMap__Fv
 * @address 0x20A040
 * @size 0x32C
 */
void LoadWorldMap(void);

/**
 * Exchanges two world-map destination rankings.
 *
 * Unlike the menu_draw.cpp overloads of this name, this one does not check
 * either pointer: its only caller passes addresses of stack entries.
 *
 * @mangled MenuDataSwap__FP16MAP_JUMP_COMPAREP16MAP_JUMP_COMPARE
 * @address 0x20A430
 * @size 0x6C
 */
void MenuDataSwap(MAP_JUMP_COMPARE *first, MAP_JUMP_COMPARE *second);

/**
 * Finds the world-map place nearest the direction the pad was pushed in.
 *
 * @mangled GetNearWorldPos__FiPi
 * @address 0x20A4A0
 * @size 0x3BC
 * Returns the reachable world map destination nearest the one it is given, or -1 when there
 * is none.
 */
int GetNearWorldPos(int, int *);

/**
 * Moves the world-map cursor between places and reports the one chosen.
 *
 * @mangled WorldMapMoveKey__Fv
 * @address 0x20A860
 * @size 0x148
 */
void WorldMapMoveKey(void);

/**
 * Draws the plate that asks whether to travel to the chosen place.
 *
 * @mangled DrawMapCheck__Fi
 * @address 0x20A9B0
 * @size 0x150
 */
void DrawMapCheck(int);

/**
 * Reports whether a world-map place has been visited and may be travelled to.
 *
 * @mangled GetVisitInfo__Fii
 * @address 0x20AB00
 * @size 0x164
 */
void GetVisitInfo(int, int);

/**
 * Gives the region whose world map should be read for the party's position.
 *
 * @mangled IsLoadMapNo__Fv
 * @address 0x20AC70
 * @size 0x110
 */
void IsLoadMapNo(void);

/**
 * Turns a map number into the world-map place that stands for it.
 *
 * @mangled MapNoTransFunc__Fi
 * @address 0x20AD80
 * @size 0xD8
 */
void MapNoTransFunc(int);

/**
 * Runs the options page and returns to the menu bar when it closes.
 *
 * @mangled BattleMenuOptionKey__Fv
 * @address 0x20AE60
 * @size 0x108
 */
void BattleMenuOptionKey(void);

/**
 * Runs the save page and returns to the menu bar when it closes.
 *
 * @mangled BattleMenuSaveKey__Fv
 * @address 0x20AF70
 * @size 0xF4
 */
void BattleMenuSaveKey(void);

/**
 * Initializes the battle manual menu from its placement data and load buffer.
 *
 * @mangled BattleManualInit__FPiP1
 * @address 0x20B070
 * @size 0x20
 */
void BattleManualInit(int *result, u_long128 *load_buffer);

/**
 * Processes battle-manual input and returns zero after updating transitions.
 *
 * @mangled BattleManualKey__Fv
 * @address 0x20B090
 * @size 0xFC
 */
int BattleManualKey(void);

/**
 * Draws a current-over-maximum pair, reddening it as the value runs low.
 *
 * @mangled DrawStatusNumberNowAndMax__FPiiiii
 * @address 0x20B1B0
 * @size 0x128
 */
void DrawStatusNumberNowAndMax(int *, int, int, int, int);

/**
 * Draws the sockets of a weapon and what is fitted into them.
 *
 * @mangled DrawWepHole__FiiP11WEAPON_HAVEii
 * @address 0x20B2E0
 * @size 0x294
 */
void DrawWepHole(int, int, WEAPON_HAVE *, int, int);

/**
 * Displays the selected weapon's option messages in the battle menu.
 */
class MenuClsMes {
public:
    s8 mode; /**< Selects the weapon option display mode. */
    char unk_01;
    s16 alpha;        /**< Opacity used for the option icons and message window. */
    s16 option_count; /**< Number of option messages selected for the weapon. */
    s16 unk_06;
    s32 unk_08;
    s32 unk_0C;
    s32 option_flags;    /**< Combined option bits of the weapon and its attachments. */
    WEAPON_HAVE *weapon; /**< Weapon whose option messages are displayed. */
    s32 unk_18;
    ClsMes *message; /**< Message window that holds the option text. */
    /**
     * Selects the shared East King message window for weapon option text.
     *
     * @mangled InitMes__10MenuClsMesFv
     * @address 0x20B580
     * @size 0x14
     */
    void InitMes(void);

    /**
     * Resets the weapon option display state and position.
     *
     * @mangled InitData__10MenuClsMesFv
     * @address 0x20B5A0
     * @size 0x28
     */
    void InitData(void);

    /**
     * Presets the shared message window and points it at a message buffer.
     *
     * @mangled SetBuffInfo__10MenuClsMesFPs
     * @address 0x20B5D0
     * @size 0x21C
     * @unknownret
     */
    void SetBuffInfo(short *);

    /**
     * Updates option messages from the weapon and its attachments.
     *
     * @mangled NowWeaponStatus__10MenuClsMesFP11WEAPON_HAVE
     * @address 0x20B7F0
     * @size 0x164
     */
    void NowWeaponStatus(WEAPON_HAVE *);

    /**
     * Updates the active weapon option messages and advances their window.
     *
     * @mangled Step__10MenuClsMesFv
     * @address 0x20B960
     * @size 0x80
     */
    void Step(void);

    /**
     * Draws the message window's single line over the menu.
     *
     * @mangled Draw1__10MenuClsMesFiii
     * @address 0x20B9E0
     * @size 0x4DC
     * @unknownret
     */
    void Draw1(int, int, int);
};

STATIC_ASSERT(sizeof(MenuClsMes) == 0x20);
