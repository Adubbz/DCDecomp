#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000

#include "battlemenu.hpp"

#include <cstring>

#include "menu_manual.hpp"

INCLUDE_ASM("asm/nonmatchings/battlemenu", GetDefaultWeaponNo__Fi);
INCLUDE_ASM("asm/nonmatchings/battlemenu", IsDefaultWeapon__Fi);
INCLUDE_ASM("asm/nonmatchings/battlemenu", SetNowEquipWeaponDataForMsg__Fii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", GetNowEquipWeaponDataForMsg__FRiRi);
INCLUDE_ASM("asm/nonmatchings/battlemenu", GetGradationColorInfo2__Fi);
INCLUDE_ASM("asm/nonmatchings/battlemenu", GetNowSelectWeapon__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", EscapeDungeonMode__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", SetEscapeDngFlag__Fi);
INCLUDE_ASM("asm/nonmatchings/battlemenu", GetEscapeDngFlag__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", SetInteriorOutFlag__Fi);
INCLUDE_ASM("asm/nonmatchings/battlemenu", GetInteriorOutFlag__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawDngYesNoDialog__Fiii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", GetMenuModeMax__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", GetMenuIconPos__FiPi);
INCLUDE_ASM("asm/nonmatchings/battlemenu", BtlMenuMekeIconInfo__FPii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawBtlMenuBar__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", GetLimmitMsg__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawBattleMain__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawOtherCharaStatus__Fiiii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DngComStatus__Fiiii);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @885__2);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawSelCharaStatus__Fffiiiiii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawBtlAtoraSelect__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", BtlDrawOption__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", BtlDrawSave__Fv);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @924__2);
INCLUDE_ASM("asm/nonmatchings/battlemenu", BtlMenuTexBlockEnter__Fv);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @926__2);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @927__2);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @928__3);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @929__3);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @930__3);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @931__4);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @932__3);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @933__3);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @934);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @935__2);
INCLUDE_ASM("asm/nonmatchings/battlemenu", BattleMenuTexEnter__Fv);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @940__2);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @941);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @942);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @962);
INCLUDE_ASM("asm/nonmatchings/battlemenu", ExitBattleMenu__Fi);
INCLUDE_ASM("asm/nonmatchings/battlemenu", BattleMenuInit__FPii);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @1011__2);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @1012);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @1013);
INCLUDE_ASM("asm/nonmatchings/battlemenu", BtlMenuDrawSpecialFlag__Fi);
INCLUDE_ASM("asm/nonmatchings/battlemenu", BattleMenuDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", BattleMenuCursor__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", BattleMenuAppear__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", BattleMenuExit__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", BattleMenuSelect__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", ToFromSelect__Fi);
INCLUDE_ASM("asm/nonmatchings/battlemenu", ForBackMenu__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", InitMenuChara__FP1);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @1348);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @1363__3);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @1511__3);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @1512__3);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @1513__2);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @1514__2);
INCLUDE_ASM("asm/nonmatchings/battlemenu", BattleMenuCharaKey__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawCharaSelect__Fv);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @1665);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @1668);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawWepDamageDraw__F4RECTP11WEAPON_HAVEi);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawWepStatus__FiiP11WEAPON_HAVEii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawWepVolumeDisplay__FiiP11WEAPON_HAVEi);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawWeaponNameBoard__Fiiiii);

s32 GetWeaponNamePutX(s32 center_x, s32 width) {
    return center_x - (width >> 1);
}
INCLUDE_ASM("asm/nonmatchings/battlemenu", WeaponNameDraw__Fiii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", WepStatusVolumeDraw__F4RECTiPiiiii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawWeaponStatusWaku__Fiiii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawLimmitMax__Fiii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawBtlMenuLRCursor__Fiiii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawWeaponStatusTag__FiiP11WEAPON_HAVEiii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawWeaponElemTag__FiiP11WEAPON_HAVEiii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawWeaponVsMonster__FiiP11WEAPON_HAVEiii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawWeaponTagBoard__FiiP11WEAPON_HAVEiii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawAallWeapon__FiifP10CCharacterP11WEAPON_HAVEiii);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @2244);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @2245);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @2246__2);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @2247);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @2248);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @2249);
INCLUDE_ASM("asm/nonmatchings/battlemenu", BtlWeaponDraw__Fifii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", NowWeaponStatusValue__FP11WEAPON_HAVE);
INCLUDE_ASM("asm/nonmatchings/battlemenu", EnableWeaponElemNone__Fi);
INCLUDE_ASM("asm/nonmatchings/battlemenu", WeaponMenuCheckElemValue__FP11WEAPON_HAVEP11WEAPON_HAVE);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @2339__2);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @2340__2);
INCLUDE_ASM("asm/nonmatchings/battlemenu", WeaponMenuCheckEnableSetElem__FP11WEAPON_HAVEP11WEAPON_HAVEi);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @2356);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @2357);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawWeaponSelectDialog__Fiii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", InitWeaponSelect__Fii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", ExitWeaponMenuSelect__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", WeaponMenuSelect__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", WeaponMenuKastumSelectUp__Fii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", WeaponMenuKastumSelectDown__Fii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", WeaponSelectKey__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", WepAttachHaveCancel__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", WeaponMenuAttachModeKey__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", WeaponMenuActWepKey__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", WeaponMenuTagKey__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", WeaponMenuAttachWepKey__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", WeaponMenuAttachKey__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", RepairAndLevelUpDraw__Fiii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawBuildUpWeaponSelect__Fiii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", WeaponMenuDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", ItemTrushKey__FPiPii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawTrushItem__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", ExitItemSelect__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", StartBGReadItemMenuWepIcon__FP1Ri);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @4330);
INCLUDE_ASM("asm/nonmatchings/battlemenu", ReadSyncItemMenuWepIcon__Fv);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @4334);
INCLUDE_ASM("asm/nonmatchings/battlemenu", InitItemMode__Fii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", InitItemTrushStart__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", ExistItemMenu__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", ChangeMenuChara__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", ItemMenuMainKey__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", ItemMenuModeDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", ItemMenuModeKey__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", ActiveItemDraw__Fiii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", MenuCharaPolyDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", ItemMenuCharaStatusDraw__Fiiii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", ItemNaviCursor__Fi);
INCLUDE_ASM("asm/nonmatchings/battlemenu", CharaStatusMsgDraw__Fiiiii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", BattleMenuAtoraKey__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", InitMenuMove__FiiP1);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @5858);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @5859);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @5860);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @5861);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @5862);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @5863);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @5864);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @5865);
INCLUDE_ASM("asm/nonmatchings/battlemenu", GetTownOrDngPos__Fv);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @5881);
INCLUDE_ASM("asm/nonmatchings/battlemenu", MenuMoveKey__Fv);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @6221);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @6222);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @6223);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @6224);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @6225);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @6226);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawMenuMove__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawEscapeItem__Fiii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", StartLoadWorldMap__FiP1);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @6229);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @6234);
INCLUDE_ASM("asm/nonmatchings/battlemenu", LoadWorldMap__Fv);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @6248);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @6249);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @6250);
INCLUDE_ASM("asm/nonmatchings/battlemenu", LocalDrawWorldMap__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawWorldMap__Fi);

void MenuDataSwap(MAP_JUMP_COMPARE *first, MAP_JUMP_COMPARE *second) {
    MAP_JUMP_COMPARE temp;

    memcpy(&temp, first, sizeof(MAP_JUMP_COMPARE));
    memcpy(first, second, sizeof(MAP_JUMP_COMPARE));
    memcpy(second, &temp, sizeof(MAP_JUMP_COMPARE));
}

INCLUDE_ASM("asm/nonmatchings/battlemenu", GetNearWorldPos__FiPi);
INCLUDE_ASM("asm/nonmatchings/battlemenu", WorldMapMoveKey__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawMapCheck__Fi);
INCLUDE_ASM("asm/nonmatchings/battlemenu", GetVisitInfo__Fii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", IsLoadMapNo__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", MapNoTransFunc__Fi);
INCLUDE_ASM("asm/nonmatchings/battlemenu", BattleMenuOptionKey__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", BattleMenuSaveKey__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", BattleManualInit__FPiP1);
INCLUDE_ASM("asm/nonmatchings/battlemenu", BattleManualKey__Fv);

static void BattleManualDraw() {
    MenuManualDraw();
}

INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawStatusNumberNowAndMax__FPiiiii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawWepHole__FiiP11WEAPON_HAVEii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", InitMes__10MenuClsMesFv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", InitData__10MenuClsMesFv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", SetBuffInfo__10MenuClsMesFPs);
INCLUDE_ASM("asm/nonmatchings/battlemenu", NowWeaponStatus__10MenuClsMesFP11WEAPON_HAVE);
INCLUDE_ASM("asm/nonmatchings/battlemenu", Step__10MenuClsMesFv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", Draw1__10MenuClsMesFiii);
