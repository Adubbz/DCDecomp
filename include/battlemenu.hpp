#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CCharacter;
class ClsMes;
struct RECT;
struct WEAPON_HAVE;

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
 * Returns the first weapon identifier in a character's weapon chain.
 *
 * @mangled GetDefaultWeaponNo__Fi
 * @address 0x1F3DA0
 * @size 0x20
 */
int GetDefaultWeaponNo(int character_no);

/**
 * @mangled IsDefaultWeapon__Fi
 * @address 0x1F3DC0
 * @size 0x90
 * @unknownret
 */
int IsDefaultWeapon(int);

/**
 * Records the weapon the item menu's message is about.
 *
 * @mangled SetNowEquipWeaponDataForMsg__Fii
 * @address 0x1F3E50
 * @size 0x20
 */
void SetNowEquipWeaponDataForMsg(int, int);

/**
 * @mangled GetNowEquipWeaponDataForMsg__FRiRi
 * @address 0x1F3E70
 * @size 0x70
 * @unknownret
 */
void GetNowEquipWeaponDataForMsg(int &, int &);

/**
 * @mangled GetGradationColorInfo2__Fi
 * @address 0x1F3EE0
 * @size 0x20
 * @unknownret
 */
void GetGradationColorInfo2(int);

/**
 * Returns the weapon the weapon menu's cursor is on.
 *
 * @mangled GetNowSelectWeapon__Fv
 * @address 0x1F3F00
 * @size 0x40
 */
WEAPON_HAVE *GetNowSelectWeapon(void);

/**
 * @mangled EscapeDungeonMode__Fv
 * @address 0x1F3F40
 * @size 0x60
 * @unknownret
 */
void EscapeDungeonMode(void);

/**
 * @mangled SetEscapeDngFlag__Fi
 * @address 0x1F3FA0
 * @size 0x10
 * @unknownret
 */
void SetEscapeDngFlag(int);

/**
 * Returns the flag that says the party is escaping the dungeon.
 *
 * @mangled GetEscapeDngFlag__Fv
 * @address 0x1F3FB0
 * @size 0x10
 */
s16 GetEscapeDngFlag(void);

/**
 * @mangled SetInteriorOutFlag__Fi
 * @address 0x1F3FC0
 * @size 0x10
 * @unknownret
 */
void SetInteriorOutFlag(int);

/**
 * @mangled GetInteriorOutFlag__Fv
 * @address 0x1F3FD0
 * @size 0x10
 * @unknownret
 */
void GetInteriorOutFlag(void);

/**
 * @mangled DrawDngYesNoDialog__Fiii
 * @address 0x1F3FE0
 * @size 0xC0
 * @unknownret
 */
void DrawDngYesNoDialog(int, int, int);

/**
 * Returns how many icons the battle menu ring currently offers.
 *
 * @mangled GetMenuModeMax__Fv
 * @address 0x1F40A0
 * @size 0x70
 */
int GetMenuModeMax(void);

/**
 * Writes the screen position of one battle menu icon into the pair of integers it is given.
 *
 * @mangled GetMenuIconPos__FiPi
 * @address 0x1F4110
 * @size 0x50
 */
void GetMenuIconPos(int, int *);

/**
 * @mangled BtlMenuMekeIconInfo__FPii
 * @address 0x1F4160
 * @size 0xF0
 * @unknownret
 */
void BtlMenuMekeIconInfo(int *, int);

/**
 * @mangled DrawBtlMenuBar__Fv
 * @address 0x1F4250
 * @size 0x2A0
 * @unknownret
 */
void DrawBtlMenuBar(void);

/**
 * @mangled GetLimmitMsg__Fv
 * @address 0x1F44F0
 * @size 0x70
 * @unknownret
 */
void GetLimmitMsg(void);

/**
 * @mangled DrawBattleMain__Fv
 * @address 0x1F4560
 * @size 0x310
 * @unknownret
 */
void DrawBattleMain(void);

/**
 * @mangled DrawOtherCharaStatus__Fiiii
 * @address 0x1F4870
 * @size 0x490
 * @unknownret
 */
void DrawOtherCharaStatus(int, int, int, int);

/**
 * @mangled DngComStatus__Fiiii
 * @address 0x1F4D00
 * @size 0x720
 * @unknownret
 */
void DngComStatus(int, int, int, int);

/**
 * @mangled DrawSelCharaStatus__Fffiiiiii
 * @address 0x1F5420
 * @size 0x3F0
 * @unknownret
 */
void DrawSelCharaStatus(float, float, int, int, int, int, int, int);

/**
 * @mangled DrawBtlAtoraSelect__Fv
 * @address 0x1F5810
 * @size 0x20
 * @unknownret
 */
void DrawBtlAtoraSelect(void);

/**
 * @mangled BtlDrawOption__Fv
 * @address 0x1F5830
 * @size 0x30
 * @unknownret
 */
void BtlDrawOption(void);

/**
 * @mangled BtlDrawSave__Fv
 * @address 0x1F5860
 * @size 0x40
 * @unknownret
 */
void BtlDrawSave(void);

/**
 * Looks the battle menu's fixed textures up in the texture manager and keeps them.
 *
 * @mangled BtlMenuTexBlockEnter__Fv
 * @address 0x1F58A0
 * @size 0x120
 */
void BtlMenuTexBlockEnter(void);

/**
 * Loads the battle menu's texture blocks and message buffers.
 *
 * @mangled BattleMenuTexEnter__Fv
 * @address 0x1F59C0
 * @size 0x140
 */
void BattleMenuTexEnter(void);

/**
 * Tears the battle menu down: its textures, its buffers, the gamepad and the BGM volume.
 *
 * @mangled ExitBattleMenu__Fi
 * @address 0x1F5B00
 * @size 0x1F0
 */
void ExitBattleMenu(int);

/**
 * @mangled BattleMenuInit__FPii
 * @address 0x1F5CF0
 * @size 0x460
 * @unknownret
 */
void BattleMenuInit(int *, int);

/**
 * @mangled BtlMenuDrawSpecialFlag__Fi
 * @address 0x1F6150
 * @size 0x90
 * @unknownret
 */
void BtlMenuDrawSpecialFlag(int);

/**
 * @mangled BattleMenuDraw__Fv
 * @address 0x1F61E0
 * @size 0x540
 * @unknownret
 */
void BattleMenuDraw(void);

/**
 * @mangled BattleMenuCursor__Fv
 * @address 0x1F6720
 * @size 0x1A0
 * @unknownret
 */
int BattleMenuCursor(void);

/**
 * @mangled BattleMenuAppear__Fv
 * @address 0x1F68C0
 * @size 0x180
 * @unknownret
 */
void BattleMenuAppear(void);

/**
 * @mangled BattleMenuExit__Fv
 * @address 0x1F6A40
 * @size 0xE0
 * @unknownret
 */
void BattleMenuExit(void);

/**
 * @mangled BattleMenuSelect__Fv
 * @address 0x1F6B20
 * @size 0x440
 * @unknownret
 */
void BattleMenuSelect(void);

/**
 * Steps the battle menu ring towards the icon it is given and returns the icon it settles on.
 *
 * @mangled ToFromSelect__Fi
 * @address 0x1F6F60
 * @size 0x2A0
 */
int ToFromSelect(int);

/**
 * Puts the menu cursor back on the icon of the mode the menu is returning to.
 *
 * @mangled ForBackMenu__Fv
 * @address 0x1F7200
 * @size 0xE0
 */
void ForBackMenu(void);

/**
 * @mangled InitMenuChara__FP1
 * @address 0x1F72E0
 * @size 0x160
 * @unknownret
 */
void InitMenuChara(void /* CW back-ref target unresolved */ *);

/**
 * @mangled BattleMenuCharaKey__Fv
 * @address 0x1F7440
 * @size 0x9F0
 * @unknownret
 */
void BattleMenuCharaKey(void);

/**
 * @mangled DrawCharaSelect__Fv
 * @address 0x1F7E30
 * @size 0xF00
 * @unknownret
 */
void DrawCharaSelect(void);

/**
 * @mangled DrawWepDamageDraw__F4RECTP11WEAPON_HAVEi
 * @address 0x1F8D30
 * @size 0x4C0
 * @unknownret
 */
void DrawWepDamageDraw(RECT, WEAPON_HAVE *, int);

/**
 * @mangled DrawWepStatus__FiiP11WEAPON_HAVEii
 * @address 0x1F91F0
 * @size 0xE0
 * @unknownret
 */
void DrawWepStatus(int, int, WEAPON_HAVE *, int, int);

/**
 * @mangled DrawWepVolumeDisplay__FiiP11WEAPON_HAVEi
 * @address 0x1F92D0
 * @size 0x2B0
 * @unknownret
 */
void DrawWepVolumeDisplay(int, int, WEAPON_HAVE *, int);

/**
 * @mangled DrawWeaponNameBoard__Fiiiii
 * @address 0x1F9580
 * @size 0x140
 * @unknownret
 */
void DrawWeaponNameBoard(int, int, int, int, int);

/**
 * Returns the x position that centers a weapon name of a width.
 *
 * @mangled GetWeaponNamePutX__Fii
 * @address 0x1F96C0
 * @size 0x10
 */
s32 GetWeaponNamePutX(int, int);

/**
 * @mangled WeaponNameDraw__Fiii
 * @address 0x1F96D0
 * @size 0x550
 * @unknownret
 */
void WeaponNameDraw(int, int, int);

/**
 * @mangled WepStatusVolumeDraw__F4RECTiPiiiii
 * @address 0x1F9C20
 * @size 0x220
 * @unknownret
 */
void WepStatusVolumeDraw(RECT, int, int *, int, int, int, int);

/**
 * @mangled DrawWeaponStatusWaku__Fiiii
 * @address 0x1F9E40
 * @size 0x70
 * @unknownret
 */
void DrawWeaponStatusWaku(int, int, int, int);

/**
 * @mangled DrawLimmitMax__Fiii
 * @address 0x1F9EB0
 * @size 0x60
 * @unknownret
 */
void DrawLimmitMax(int, int, int);

/**
 * @mangled DrawBtlMenuLRCursor__Fiiii
 * @address 0x1F9F10
 * @size 0x1A0
 * @unknownret
 */
void DrawBtlMenuLRCursor(int, int, int, int);

/**
 * Draws one weapon's status tags: their values, their gradation bars and their experience numbers.
 *
 * @mangled DrawWeaponStatusTag__FiiP11WEAPON_HAVEiii
 * @address 0x1FA0B0
 * @size 0x7C0
 */
void DrawWeaponStatusTag(int, int, WEAPON_HAVE *, int, int, int);

/**
 * Draws one weapon's elemental tags with their volume bars.
 *
 * @mangled DrawWeaponElemTag__FiiP11WEAPON_HAVEiii
 * @address 0x1FA870
 * @size 0x430
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
 * @mangled DrawWeaponTagBoard__FiiP11WEAPON_HAVEiii
 * @address 0x1FAFF0
 * @size 0x210
 * @unknownret
 */
void DrawWeaponTagBoard(int, int, WEAPON_HAVE *, int, int, int);

/**
 * @mangled DrawAallWeapon__FiifP10CCharacterP11WEAPON_HAVEiii
 * @address 0x1FB200
 * @size 0x560
 * @unknownret
 */
void DrawAallWeapon(int, int, float, CCharacter *, WEAPON_HAVE *, int, int, int);

/**
 * @mangled BtlWeaponDraw__Fifii
 * @address 0x1FB760
 * @size 0x750
 * @unknownret
 */
void BtlWeaponDraw(int, float, int, int);

/**
 * @mangled NowWeaponStatusValue__FP11WEAPON_HAVE
 * @address 0x1FBEB0
 * @size 0x120
 * @unknownret
 */
void NowWeaponStatusValue(WEAPON_HAVE *);

/**
 * @mangled EnableWeaponElemNone__Fi
 * @address 0x1FBFD0
 * @size 0x80
 * @unknownret
 */
void EnableWeaponElemNone(int);

/**
 * @mangled WeaponMenuCheckElemValue__FP11WEAPON_HAVEP11WEAPON_HAVE
 * @address 0x1FC050
 * @size 0xC0
 * @unknownret
 */
void WeaponMenuCheckElemValue(WEAPON_HAVE *, WEAPON_HAVE *);

/**
 * @mangled WeaponMenuCheckEnableSetElem__FP11WEAPON_HAVEP11WEAPON_HAVEi
 * @address 0x1FC110
 * @size 0x110
 * @unknownret
 */
void WeaponMenuCheckEnableSetElem(WEAPON_HAVE *, WEAPON_HAVE *, int);

/**
 * @mangled DrawWeaponSelectDialog__Fiii
 * @address 0x1FC220
 * @size 0x530
 * @unknownret
 */
void DrawWeaponSelectDialog(int, int, int);

/**
 * @mangled InitWeaponSelect__Fii
 * @address 0x1FC750
 * @size 0x3D0
 * @unknownret
 */
void InitWeaponSelect(int, int);

/**
 * @mangled ExitWeaponMenuSelect__Fv
 * @address 0x1FCB20
 * @size 0x2D0
 * @unknownret
 */
void ExitWeaponMenuSelect(void);

/**
 * @mangled WeaponMenuSelect__Fv
 * @address 0x1FCDF0
 * @size 0x1080
 * @unknownret
 */
void WeaponMenuSelect(void);

/**
 * @mangled WeaponMenuKastumSelectUp__Fii
 * @address 0x1FDE70
 * @size 0x60
 * @unknownret
 */
void WeaponMenuKastumSelectUp(int, int);

/**
 * @mangled WeaponMenuKastumSelectDown__Fii
 * @address 0x1FDED0
 * @size 0x50
 * @unknownret
 */
void WeaponMenuKastumSelectDown(int, int);

/**
 * @mangled WeaponSelectKey__Fv
 * @address 0x1FDF20
 * @size 0x1790
 * @unknownret
 */
void WeaponSelectKey(void);

/**
 * Puts the attachment the weapon menu is holding back where it came from.
 *
 * @mangled WepAttachHaveCancel__Fv
 * @address 0x1FF6B0
 * @size 0x1A0
 */
void WepAttachHaveCancel(void);

/**
 * @mangled WeaponMenuAttachModeKey__Fv
 * @address 0x1FF850
 * @size 0x240
 * @unknownret
 */
void WeaponMenuAttachModeKey(void);

/**
 * Handles input on the weapon menu's equipped weapon row.
 *
 * @mangled WeaponMenuActWepKey__Fv
 * @address 0x1FFA90
 * @size 0xD0
 */
void WeaponMenuActWepKey(void);

/**
 * Handles input on the weapon menu's tag row, fitting and removing tags.
 *
 * @mangled WeaponMenuTagKey__Fv
 * @address 0x1FFB60
 * @size 0x5C0
 */
void WeaponMenuTagKey(void);

/**
 * Handles input while an attachment is being fitted to a weapon.
 *
 * @mangled WeaponMenuAttachWepKey__Fv
 * @address 0x200120
 * @size 0x420
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
 * @mangled RepairAndLevelUpDraw__Fiii
 * @address 0x2007B0
 * @size 0x290
 * @unknownret
 */
void RepairAndLevelUpDraw(int, int, int);

/**
 * @mangled DrawBuildUpWeaponSelect__Fiii
 * @address 0x200A40
 * @size 0x240
 * @unknownret
 */
void DrawBuildUpWeaponSelect(int, int, int);

/**
 * @mangled WeaponMenuDraw__Fv
 * @address 0x200C80
 * @size 0x11B0
 * @unknownret
 */
void WeaponMenuDraw(void);

/**
 * @mangled ItemTrushKey__FPiPii
 * @address 0x201E30
 * @size 0x2F0
 * @unknownret
 */
void ItemTrushKey(int *, int *, int);

/**
 * @mangled DrawTrushItem__Fv
 * @address 0x202120
 * @size 0x300
 * @unknownret
 */
void DrawTrushItem(void);

/**
 * @mangled ExitItemSelect__Fv
 * @address 0x202420
 * @size 0x90
 * @unknownret
 */
void ExitItemSelect(void);

/**
 * @mangled StartBGReadItemMenuWepIcon__FP1Ri
 * @address 0x2024B0
 * @size 0x60
 * @unknownret
 */
void StartBGReadItemMenuWepIcon(void /* CW back-ref target unresolved */ *, int &);

/**
 * @mangled ReadSyncItemMenuWepIcon__Fv
 * @address 0x202510
 * @size 0xD0
 * @unknownret
 */
void ReadSyncItemMenuWepIcon(void);

/**
 * @mangled InitItemMode__Fii
 * @address 0x2025E0
 * @size 0x630
 * @unknownret
 */
void InitItemMode(int, int);

/**
 * @mangled InitItemTrushStart__Fv
 * @address 0x202C10
 * @size 0x80
 * @unknownret
 */
void InitItemTrushStart(void);

/**
 * @mangled ExistItemMenu__Fv
 * @address 0x202C90
 * @size 0xC0
 * @unknownret
 */
void ExistItemMenu(void);

/**
 * @mangled ChangeMenuChara__Fv
 * @address 0x202D50
 * @size 0x1C0
 * @unknownret
 */
void ChangeMenuChara(void);

/**
 * @mangled ItemMenuMainKey__Fv
 * @address 0x202F10
 * @size 0x2AA0
 * @unknownret
 */
void ItemMenuMainKey(void);

/**
 * @mangled ItemMenuModeDraw__Fv
 * @address 0x2059B0
 * @size 0xA30
 * @unknownret
 */
void ItemMenuModeDraw(void);

/**
 * @mangled ItemMenuModeKey__Fv
 * @address 0x2063E0
 * @size 0x4E0
 * @unknownret
 */
void ItemMenuModeKey(void);

/**
 * @mangled ActiveItemDraw__Fiii
 * @address 0x2068C0
 * @size 0x1F0
 * @unknownret
 */
void ActiveItemDraw(int, int, int);

/**
 * @mangled MenuCharaPolyDraw__Fv
 * @address 0x206AB0
 * @size 0x90
 * @unknownret
 */
void MenuCharaPolyDraw(void);

/**
 * @mangled ItemMenuCharaStatusDraw__Fiiii
 * @address 0x206B40
 * @size 0xDA0
 * @unknownret
 */
void ItemMenuCharaStatusDraw(int, int, int, int);

/**
 * @mangled ItemNaviCursor__Fi
 * @address 0x2078E0
 * @size 0x2E0
 * @unknownret
 */
void ItemNaviCursor(int);

/**
 * @mangled CharaStatusMsgDraw__Fiiiii
 * @address 0x207BC0
 * @size 0x230
 * @unknownret
 */
void CharaStatusMsgDraw(int, int, int, int, int);

/**
 * @mangled BattleMenuAtoraKey__Fv
 * @address 0x207DF0
 * @size 0x100
 * @unknownret
 */
void BattleMenuAtoraKey(void);

/**
 * @mangled InitMenuMove__FiiP1
 * @address 0x207EF0
 * @size 0x420
 * @unknownret
 */
void InitMenuMove(int, int, void /* CW back-ref target unresolved */ *);

/**
 * @mangled GetTownOrDngPos__Fv
 * @address 0x208310
 * @size 0x180
 * @unknownret
 */
void GetTownOrDngPos(void);

/**
 * @mangled MenuMoveKey__Fv
 * @address 0x208490
 * @size 0xB60
 * @unknownret
 */
void MenuMoveKey(void);

/**
 * @mangled DrawMenuMove__Fv
 * @address 0x208FF0
 * @size 0xCD0
 * @unknownret
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
 * @mangled StartLoadWorldMap__FiP1
 * @address 0x209F80
 * @size 0xC0
 * @unknownret
 */
void StartLoadWorldMap(int, void /* CW back-ref target unresolved */ *);

/**
 * @mangled LoadWorldMap__Fv
 * @address 0x20A040
 * @size 0x330
 * @unknownret
 */
void LoadWorldMap(void);

/**
 * Draws the world map's menu character.
 *
 * @mangled LocalDrawWorldMap__Fv
 * @address 0x20A370
 * @size 0x70
 */
void LocalDrawWorldMap(void);

/**
 * @mangled DrawWorldMap__Fi
 * @address 0x20A3E0
 * @size 0x50
 * @unknownret
 */
void DrawWorldMap(int);

/**
 * Exchanges two world-map destination rankings.
 *
 * Unlike the menu_draw.cpp overloads of this name, this one does not check
 * either pointer: its only caller passes addresses of stack entries.
 *
 * @mangled MenuDataSwap__FP16MAP_JUMP_COMPAREP16MAP_JUMP_COMPARE
 * @address 0x20A430
 * @size 0x70
 */
void MenuDataSwap(MAP_JUMP_COMPARE *first, MAP_JUMP_COMPARE *second);

/**
 * Returns the reachable world map destination nearest the one it is given, or -1 when there
 * is none.
 *
 * @mangled GetNearWorldPos__FiPi
 * @address 0x20A4A0
 * @size 0x3C0
 */
int GetNearWorldPos(int, int *);

/**
 * @mangled WorldMapMoveKey__Fv
 * @address 0x20A860
 * @size 0x150
 * @unknownret
 */
void WorldMapMoveKey(void);

/**
 * @mangled DrawMapCheck__Fi
 * @address 0x20A9B0
 * @size 0x150
 * @unknownret
 */
void DrawMapCheck(int);

/**
 * @mangled GetVisitInfo__Fii
 * @address 0x20AB00
 * @size 0x170
 * @unknownret
 */
void GetVisitInfo(int, int);

/**
 * @mangled IsLoadMapNo__Fv
 * @address 0x20AC70
 * @size 0x110
 * @unknownret
 */
void IsLoadMapNo(void);

/**
 * @mangled MapNoTransFunc__Fi
 * @address 0x20AD80
 * @size 0xE0
 * @unknownret
 */
void MapNoTransFunc(int);

/**
 * @mangled BattleMenuOptionKey__Fv
 * @address 0x20AE60
 * @size 0x110
 * @unknownret
 */
void BattleMenuOptionKey(void);

/**
 * @mangled BattleMenuSaveKey__Fv
 * @address 0x20AF70
 * @size 0x100
 * @unknownret
 */
void BattleMenuSaveKey(void);

/**
 * @mangled BattleManualInit__FPiP1
 * @address 0x20B070
 * @size 0x20
 * @unknownret
 */
void BattleManualInit(int *, void /* CW back-ref target unresolved */ *);

/**
 * @mangled BattleManualKey__Fv
 * @address 0x20B090
 * @size 0x100
 * @unknownret
 */
void BattleManualKey(void);

/**
 * @mangled DrawStatusNumberNowAndMax__FPiiiii
 * @address 0x20B1B0
 * @size 0x130
 * @unknownret
 */
void DrawStatusNumberNowAndMax(int *, int, int, int, int);

/**
 * @mangled DrawWepHole__FiiP11WEAPON_HAVEii
 * @address 0x20B2E0
 * @size 0x2A0
 * @unknownret
 */
void DrawWepHole(int, int, WEAPON_HAVE *, int, int);

/**
 * Displays the selected weapon's option messages in the battle menu.
 */
class MenuClsMes {
public:
    s8 mode; /**< Selects the weapon option display mode. */
    char unk_01;
    s16 alpha; /**< Opacity used for the option icons and message window. */
    s16 option_count; /**< Number of option messages selected for the weapon. */
    s16 unk_06;
    s32 unk_08;
    s32 unk_0C;
    s32 option_flags; /**< Combined option bits of the weapon and its attachments. */
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
     * @mangled SetBuffInfo__10MenuClsMesFPs
     * @address 0x20B5D0
     * @size 0x220
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
     * @mangled Draw1__10MenuClsMesFiii
     * @address 0x20B9E0
     * @size 0x4E0
     * @unknownret
     */
    void Draw1(int, int, int);
};

STATIC_ASSERT(sizeof(MenuClsMes) == 0x20);
