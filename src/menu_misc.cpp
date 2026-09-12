#include "menu_misc.hpp"

INCLUDE_ASM("asm/nonmatchings/menu_misc", NowGetGameFlagForBtlMenu__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetMenuHebikiriFlag__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", EquipDefaultWeapon__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", DrawMenuNothing__FiiiiPcii);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetMenuItemUseVolume__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", ItemUseFunc__FP11CUserStatusiiiP11WEAPON_HAVE);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @869);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @870__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @871__2);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetNowWeaponRate__FP11WEAPON_HAVE);
INCLUDE_ASM("asm/nonmatchings/menu_misc", WeaponStatusBreakEnable__FP11WEAPON_HAVE);
INCLUDE_ASM("asm/nonmatchings/menu_misc", WeaponStatusBuildUp__FP11WEAPON_HAVERi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", MenuWeaponSpSet__FP10CCharacterP11WEAPON_HAVE);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @914__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @915__2);
INCLUDE_ASM("asm/nonmatchings/menu_misc", SetMenuCharaEffectReadFlag__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetMenuCharaEffectReadFlag__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetDngWepEffectPointer__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetWepEffectMenuReadBuf__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", SetOldEffectKind__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", SetWepEffectMenuReadBuf__FP1);
INCLUDE_ASM("asm/nonmatchings/menu_misc", DngWepEffectReadStart__Fv);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @936__3);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @947__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @948);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @949);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @950);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @951);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @952);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @956);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @957);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @958__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @959__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @960__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @961);
INCLUDE_ASM("asm/nonmatchings/menu_misc", MenuWeaponEffectSet__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetNowTestNo__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", StartReadWepMDS__FP1i);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @969__3);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @970__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @985__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @986__3);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @987);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @988);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @989);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @990__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @992__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @993__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @994);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @995);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @996__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @997);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1002);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetMenuWeaponModelData__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", InitMenuWeaponModelData__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetMenuWeaponModelInfo__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", InitMenuWeaponModelReference__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", SetMenuWeaponModelReference__Fiii);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetMenuWeaponModelFrameNo__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", EnterWeaponModel__Fiii);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1032);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1033);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1034__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1035__3);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1036__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1037__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1038__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1039__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1040__2);
INCLUDE_ASM("asm/nonmatchings/menu_misc", WeaponModelBuildFunc__Fii);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1104);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1105);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1106);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1107);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1108);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1109);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1110);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1111);
INCLUDE_ASM("asm/nonmatchings/menu_misc", DngWeaponEquipModelBuild__FiiP1);
s32 GetNowMotionStepCnt(s32 arg0) {
    s32 var_2;

    var_2 = 0;
    if (arg0 & 0x40) {
        var_2 = 1;
    }
    if ((arg0 & 4) || (arg0 & 2)) {
        var_2 = 2;
    }
    return var_2;
}
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetNowActiveCharaStatus__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", SetNowCharaMotionNo__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", SetItemMenuColor__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", SetItemMenuOldAmbient__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", StartLoadCharaMDS__FP1ii);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1176);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1177);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1178);
INCLUDE_ASM("asm/nonmatchings/menu_misc", MenuCharaMDSBuild2__Fii);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1199__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1200);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetCharaChangeReadCharaFilePath__FPci);
INCLUDE_ASM("asm/nonmatchings/menu_misc", CharaChangeInitToGL__FP1i);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", MenuWepDir);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1205);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1206);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1207__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1208);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1209);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1210);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1236);
INCLUDE_ASM("asm/nonmatchings/menu_misc", CharaChangeInitToGL2__Fi);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1242);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1243);
INCLUDE_ASM("asm/nonmatchings/menu_misc", BtMenuLoadChara__Fv);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1250);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1251);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1254);
INCLUDE_ASM("asm/nonmatchings/menu_misc", BtMenuLoad2__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", EastKingCheckComplete__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", SetMonsterNameDrawFlag__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetMonsterNameDrawFlag__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", MonsterNameInit__FP6ClsMesPsPUc);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1287__2);
INCLUDE_ASM("asm/nonmatchings/menu_misc", MonsterNameMake__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", MonsterNamePosSet__Fii);
INCLUDE_ASM("asm/nonmatchings/menu_misc", MonsterNameDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", DngEscapeMsgInit__FP6ClsMesP6ClsMesi);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1341);
INCLUDE_ASM("asm/nonmatchings/menu_misc", DngEscapeMsgDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", DngEscapeMsgLoop__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", CheckItemThrow__FPiPi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", SetWeaponElementStatus__FP11WEAPON_HAVE);
int CheckWeaponOptionStatus(s32 arg0) {
    s32 var_4;

    var_4 = arg0;
    if ((var_4 & 2) && (var_4 & 4)) {
        var_4 &= ~6;
    }
    if ((var_4 & 8) && (var_4 & 0x10)) {
        var_4 &= ~0x18;
    }
    if ((var_4 & 0x100) && (var_4 & 0x200)) {
        var_4 &= ~0x300;
    }
    if ((var_4 & 0x400) && (var_4 & 0x800)) {
        var_4 &= ~0xC00;
    }
    return var_4;
}
INCLUDE_ASM("asm/nonmatchings/menu_misc", IsWeaponOptionGoodOrBad__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", DefaultWeaponOptionSet__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", WeaponOptionStatusDraw__FP11WEAPON_HAVEiii);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1507);
INCLUDE_ASM("asm/nonmatchings/menu_misc", WeaponStarDraw__FiiP11WEAPON_HAVEi);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1536);
INCLUDE_ASM("asm/nonmatchings/menu_misc", LocalWeaponDataChange__FPciii);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1549__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1616__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1617__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1618__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1619__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1620__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1621__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1622__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1623__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1624__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1625__2);
INCLUDE_ASM("asm/nonmatchings/menu_misc", WeaponDataChangeByRGate__FP11WEAPON_HAVEi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetNumHowManyItemsHave__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetEditMenuMax__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", DrawMenuIcon__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetEditMenuIconPos__FiPi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", DrawMoveMenuIcon__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", CalMoveFromMenuIcon__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", CalMoveToMenuIcon__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", EditMenuInit__FPii);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @464__3);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @465__2);
INCLUDE_ASM("asm/nonmatchings/menu_misc", EditMenuExit__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetDrawHelpWindow__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", EditMenuLoop__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", EditMenuDraw__Fv);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @573__2);
INCLUDE_ASM("asm/nonmatchings/menu_misc", EditMenuStart__Fv);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @583);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @584__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @585__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @586__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @587__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @588__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @589__3);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @590__3);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @650__5);
INCLUDE_ASM("asm/nonmatchings/menu_misc", EditMenuSelectDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", EditMenuSelect__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", EditMenuToExitDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", EditMenuToExit__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", AtoraSelectDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", AtoraSelect__Fv);
void AtoraMoveDraw(void) {
}
INCLUDE_ASM("asm/nonmatchings/menu_misc", AtoraMove__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", AnalyzeBackDraw__Fii);
INCLUDE_ASM("asm/nonmatchings/menu_misc", AnalyzeRequestPer__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", AnalyzeBarDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", ToAnalyzeEditDraw__Fv);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @894__3);
INCLUDE_ASM("asm/nonmatchings/menu_misc", ToAnalyzeEdit__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", AnalyzeEditDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", AnalyzeEdit__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", FromAnalyzeEditDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", FromAnalyzeEdit__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", EditSaveDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", EditSaveKey__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", OptionDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", EdOptionSelect__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", EdMenuManualKey__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", EdMenuManualDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", InitSaveFileInfoTbl__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetOpenAttribute__FPc);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @346__2);
