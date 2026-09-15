#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 638

#include "menu_dungeon.hpp"

#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "camera.hpp"
#include "clsmes.hpp"
#include "dataread.hpp"
#include "dun/gameloop.hpp"
#include "editatra.hpp"
#include "gamepad.hpp"
#include "itemdata.hpp"
#include "mainitemmodel.hpp"
#include "memcard.hpp"
#include "memorycardaccess.hpp"
#include "menu_inventory.hpp"
#include "menuitemstep.hpp"
#include "mglib.hpp"
#include "rect.hpp"
#include "savedata.hpp"
#include "snd.hpp"
#include "texture.hpp"
#include "userstatus.hpp"

DUN_ENTER_MENU DEnterMenu;
CDngStatusData *DEnterStatusPt;
int MenuEtcErrCnt;

/** Number of floors available in each dungeon. */
static int maxFloorTbl__4[7] = {15, 17, 18, 18, 15, 25, 100};

INCLUDE_ASM("asm/nonmatchings/menu_dungeon", PlusAttachmentVolume__FP11ATTACH_LISTP11ATTACH_LISTf);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", GetWeaponAttachStatusUp__FP11WEAPON_HAVEi);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", SetWeaponAttachStatus__FP11WEAPON_HAVE);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @638__3);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @639__4);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", WeaponAllValueSet__FP11WEAPON_HAVEP11WEAPON_HAVEi);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", SetAttachMentValue__FiisP11ATTACH_LIST);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", GetAttachVolumeForMsg__FP11ATTACH_LIST);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", InitDunEnterMenu__Fiii);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @762__2);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @763__3);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @764__2);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @765__2);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @776__3);

void ExitDunEnterMenu() {
    GamePad.AutoRepeatOff();
    GamePad.MenuModeOff();
    MenuTextureReload(DEnterMenu.texture_block);
    DngActiveItemTextureCopy();
    DngActiveWeaponTextureCopy();
    TexManager.DeleteTextureBlock(DEnterMenu.texture_block);
}

int DunEnterMenuLoop() {
    rand();
    ReadBG();
    int result = DunEnterMenuKey();
    DunEnterDraw();
    ItemVolumeStep.LoopStep(60);
    if (0 <= result) {
        ExitDunEnterMenu();
        ItemVolumeStep.CheckItemVolume();
        result = DEnterMenu.result;
    }
    return result;
}
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DunEnterMenuKey__Fv);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @843__2);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @844);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @845);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @846);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @847);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DunEnterDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DunEnterBoardWaku__Fiii);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DunEnterBoard__Fiii);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DrawEnemyNum__Fiiiiii);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DrawGetAtoraNumBoard__Fiiiiii);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DrawDunNumberClip__Fiiiiii);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DrawDunEnterBack__Fi);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @1255__2);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @1301);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DrawDunEnterFloorName__Fiiiiii);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", StartQuickChange__FP1iPii);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @1348__2);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @1349);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @1350__3);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", CharaChangeLoop__Fv);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @1373);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @1374);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @1375);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", CharaChangeKey__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", CharaChangeDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DngActItemModelReadStart__FP1);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @1663);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @1664__2);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DngActItemModelBuild__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DngActiveItemTextureCopy__Fv);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @1728__2);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @1841);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @2044);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @2045);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @2046);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @2047);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @2048);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @2049);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @2050);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @2051);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DngActiveWeaponTextureCopy__Fv);

s32 GetWeaponMsgNo(WEAPON_HAVE *weapon) {
    s16 item_no;

    if (weapon == NULL) {
        return 0;
    }
    item_no = weapon->item_no;
    if (item_no < 0x101) {
        return 0x3E7;
    }
    return GetCommonItemInfo((s32) item_no)->msg + 0x64;
}

s16 GetWeaponMsgNo2(s32 item_no) {
    COM_ITEM_INFO *info;

    info = GetCommonItemInfo(item_no);
    if (info != NULL) {
        return info->msg;
    }
    return 0;
}
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DrawWepAttach__FiiP11WEAPON_HAVEii);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", GetAtraTipNowHave__Fii);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", GetDispVolumeForFloat__Ff);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", InitItemPolygonView__FiP1);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", EnterItemPolygonView__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", LocalDrawItemPolygonView__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DrawItemPolygonView__Fv);

int ConvDebugSelectToExcelListNo(int selection) {
    int item_no;

    item_no = selection + 0x81;
    if ((item_no > 0x160) && (item_no < 0x138)) {
        return -1;
    }
    if ((selection >= 0xF8) && (selection < 0x120)) {
        item_no = selection - 0xA7;
    }
    return item_no;
}
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DebugItemGetKey__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DebugItemGetDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DrawItemDataView__Fi);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @2140__2);
