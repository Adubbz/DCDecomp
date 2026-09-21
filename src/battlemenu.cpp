#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000

#include "battlemenu.hpp"

#include <cstring>

#include "clsmes.hpp"
#include "dataread.hpp"
#include "dngstatusdata.hpp"
#include "dun/gameloop.hpp"
#include "eastking.hpp"
#include "itemdata.hpp"
#include "memcard.hpp"
#include "menu_draw.hpp"
#include "menu_inventory.hpp"
#include "menu_manual.hpp"
#include "menu_misc.hpp"
#include "monstorunit.hpp"
#include "snd.hpp"

/**
 * Stores whether the party is escaping the dungeon.
 */
extern s16 EscapeDngFlg;

/**
 * Stores whether the party is leaving an interior area.
 */
extern s16 RoomOutFlag;

/**
 * Stores the active battle-menu state.
 */
extern s32 BattleMenuFlag;

/**
 * Stores the battle-menu transition phase.
 */
extern s32 BtlEffectFlag;

/**
 * Stores the selected battle-menu entry, then the icon highlighted on the menu ring.
 */
extern s32 MenuSelect[2];

/**
 * Stores the screen positions of the battle menu ring's eight icons.
 */
extern MENU_ICON_POS NorMenuIcon[8];

/**
 * Is nonzero while the battle menu shows a warning message, which dims its icons.
 */
extern s32 MenuWarningMsgFlag;

/**
 * Stores the battle-menu transition timer.
 */
extern float BtlEffectCt;

/**
 * Stores the dungeon status used by the battle menu.
 */
extern CDngStatusData *BtlMenuStatusPt;

/**
 * Stores the active battle-menu submode.
 */
extern s32 BtlMenuMode;

/**
 * Tracks the weapon menu's selected character and weapon slot.
 */
extern WEP_MENU_INFO WepMenu;

/**
 * Tracks what the item menu's message is currently about.
 */
extern ITEM_MENU_MODE_INFO ItemMenuMode;

/**
 * Holds the menu's gradient colour pairs.
 */
extern GRADATION_COLOR_INFO2 MenuColorInfo2[26];

/**
 * Texture the dungeon status plates are drawn from.
 */
extern CTexture *BtStatus;

/**
 * Icon numbers the menu bar shows for each menu mode.
 */
extern s16 BtlDrawTbl[2][8];

INCLUDE_ASM("asm/nonmatchings/battlemenu", GetDefaultWeaponNo__Fi);

#ifdef NON_MATCHING
int IsDefaultWeapon(int weapon_no) {
    int chara;

    for (chara = 0; chara < 6; chara++) {
        int default_weapon_no = GetDefaultWeaponNo(chara);
        if (default_weapon_no == weapon_no || default_weapon_no + 1 == weapon_no) {
            return chara;
        }
    }
    return -1;
}
#else
INCLUDE_ASM("asm/nonmatchings/battlemenu", IsDefaultWeapon__Fi);
#endif
void SetNowEquipWeaponDataForMsg(int item_no, int slot) {
    ItemMenuMode.message_item_no = item_no;
    ItemMenuMode.message_slot = slot;
}
#ifdef NON_MATCHING
void GetNowEquipWeaponDataForMsg(int &item_no, int &slot) {
    COM_ITEM_INFO *item_info = GetCommonItemInfo(ItemMenuMode.message_item_no);
    if (item_info != NULL) {
        item_no = item_info->icon_index;
    } else {
        item_no = 0;
    }
    slot = ItemMenuMode.message_slot;
}
#else
INCLUDE_ASM("asm/nonmatchings/battlemenu", GetNowEquipWeaponDataForMsg__FRiRi);
#endif
GRADATION_COLOR_INFO2 *GetGradationColorInfo2(int index) {
    return &MenuColorInfo2[index];
}
#ifdef NON_MATCHING
WEAPON_HAVE *GetNowSelectWeapon(void) {
    return &BtlMenuStatusPt->chara_weapons[WepMenu.chara][WepMenu.weapon_slot];
}
#else
INCLUDE_ASM("asm/nonmatchings/battlemenu", GetNowSelectWeapon__Fv);
#endif
/**
 * Reports whether the party may leave the floor: freely, with an escape item, or not at
 * all.
 *
 * @mangled EscapeDungeonMode__Fv
 * @address 0x1F3F40
 * @size 0x5C
 */
static int EscapeDungeonMode(void) {
    int mode = 0;

    if (BtlMenuStatusPt->SearchItemIndexNo(ITEM_ESCAPE_POWDER) >= 0) {
        mode = 1;
    }
    if (NowMonstorUnit->GetMonstorNum() <= 0) {
        mode = 2;
    }
    return mode;
}

void SetEscapeDngFlag(int flag) {
    EscapeDngFlg = flag;
}

s16 GetEscapeDngFlag() {
    return EscapeDngFlg;
}

void SetInteriorOutFlag(int flag) {
    RoomOutFlag = flag;
}

s16 GetInteriorOutFlag() {
    return RoomOutFlag;
}

/**
 * Draws the two-line yes-or-no plate the dungeon menu asks with.
 *
 * @mangled DrawDngYesNoDialog__Fiii
 * @address 0x1F3FE0
 * @size 0xB8
 */
static void DrawDngYesNoDialog(int x, int y, int mode) {
    CRect_i_ dst(x, y, 0x60, 0x20);
    CRect_i_ src(0, 0, 0x60, 0x20);

    for (int row = 0; row < 2; row++) {
        DrawMenu2DSprite(BtStatus, dst, src, mode);
        dst.y += 0x1C;
        src.y += 0x20;
    }
}

/**
 * Gives how many icons the battle menu ring shows, which depends on the menu mode and
 * whether the manual entry is enabled.
 *
 * @mangled GetMenuModeMax__Fv
 * @address 0x1F40A0
 * @size 0x68
 */
static int GetMenuModeMax() {
    int icon_count;
    switch (BtlMenuMode) {
        case 0:
            icon_count = 7;
            break;
        case 1:
            icon_count = 8;
            break;
    }
    if (GetGameFlagForManualMenu() == 0) {
        icon_count--;
    }
    return icon_count;
}

/**
 * Writes the screen coordinates of one icon on the battle menu ring.
 */
static void GetMenuIconPos(int icon, int *position) {
    int next = icon + 1;
    int x = next * 16 + 80;
    int y = icon * 40 + 54;
    if (next > 4) {
        x -= ((icon - 4) << 5) + 16;
    }
    position[0] = x;
    position[1] = y;
}

#ifdef NON_MATCHING
void BtlMenuMekeIconInfo(int *icons, int menu_mode) {
    int icon_count = GetMenuModeMax();

    for (int i = 0; i < icon_count; i++) {
        icons[i] = BtlDrawTbl[BtlMenuMode][i];
    }
    if (BtlMenuMode != 0) {
        int special_icon;
        switch (NowGetGameFlagForBtlMenu(BtlMenuMode)) {
            case 2:
                special_icon = 0xC;
                break;
            case 1:
                special_icon = 8;
                break;
            case 10:
            case 11:
                special_icon = 9;
                break;
        }
        icons[4] = special_icon;
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/battlemenu", BtlMenuMekeIconInfo__FPii);
#endif

/**
 * Draws the battle menu ring and its icons, fading them out with the closing effect and
 * dimming them while a warning message is shown.
 *
 * @mangled DrawBtlMenuBar__Fv
 * @address 0x1F4250
 * @size 0x294
 */
static void DrawBtlMenuBar() {
    int alpha;
    int icon_alpha;
    int i;
    int x;
    int menu_flag;
    int brightness;
    int selected;
    int y;

    if (BtlEffectFlag == 0 || BattleMenuFlag == -1) {
        alpha = 10.0f * BtlEffectCt;
        if (alpha >= 128) {
            alpha = 128;
        }
    }
    if (BtlEffectFlag == 1 || BattleMenuFlag == 28) {
        alpha = 128.0f - 10.0f * BtlEffectCt;
        if (alpha < 0) {
            alpha = 0;
        }
    } else {
        alpha = 128;
    }

    NowGetGameFlagForBtlMenu(BtlMenuMode);
    int icon_count = GetMenuModeMax();
    int icons[8];
    BtlMenuMekeIconInfo(icons, BtlMenuMode);
    for (i = 0; i < icon_count; i++) {
        icon_alpha = alpha;
        brightness = 128;
        if (MenuWarningMsgFlag != 0) {
            brightness = 64;
        }
        menu_flag = BattleMenuFlag;
        if (0 < menu_flag && menu_flag < 9) {
            icon_alpha = 0;
        }
        selected = 0;
        float icon_x = NorMenuIcon[i].x;
        x = icon_x;
        float icon_y = NorMenuIcon[i].y;
        float lowered_y = 2.0f + icon_y;
        y = 1.0f + lowered_y;
        if (i == MenuSelect[1]) {
            if ((menu_flag == -1 || menu_flag == 28) && menu_flag == 13) {
                icon_alpha = alpha;
            }
            selected = 1;
            x = icon_x - 10.0f;
            y = 1.0f + (icon_y - 2.0f);
            icon_alpha = 128;
        }
        if (icons[i] >= 0) {
            DrawMainMenuIcon(x, y, icons[i], selected, brightness, icon_alpha);
        }
    }
}

#ifdef NON_MATCHING
int GetLimmitMsg(void) {
    switch (BtlMenuStatusPt->res_limit_zone_current) {
        case -1:
            return -1;
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
            return 0x1A0;
        case 6:
        case 7:
        case 8:
        case 9:
            break;
        case 10:
            return 0x19E;
        case 11:
            return 0x19F;
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/battlemenu", GetLimmitMsg__Fv);
#endif
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawBattleMain__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawOtherCharaStatus__Fiiii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DngComStatus__Fiiii);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @885__2);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawSelCharaStatus__Fffiiiiii);

/**
 * Draws the battle menu's Atora selection screen.
 */
static void DrawBtlAtoraSelect() {
    DrawMenuAtoraSelect();
}

/**
 * Draws the battle menu options and restores unfiltered rendering.
 */
static void BtlDrawOption() {
    DrawMenuOption();
    setbilinear(0);
}

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

/**
 * Returns the restriction on selecting no element for a weapon.
 */
static int EnableWeaponElemNone(int weapon_no) {
    if (WhoIsWeaponEquip(weapon_no) == CHARA_RUBY) {
        return 1;
    }
    if ((unsigned int) (weapon_no - ITEM_WEAPON_BLESSING_GUN) <= 1U ||
        weapon_no == ITEM_WEAPON_HEXA_BLASTER || weapon_no == ITEM_WEAPON_SUPERNOVA) {
        return 2;
    }
    return 0;
}

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

/**
 * Finds the preceding enabled customization row, wrapping from the top row.
 */
static int WeaponMenuKastumSelectUp(int row, int enabled_rows) {
    if (row == 0) {
        row = 7;
    }
    int selected_row = 3;
    while (row >= 4) {
        if (enabled_rows & (1 << (row - 4))) {
            selected_row = row - 1;
            break;
        }
        row--;
    }
    return selected_row;
}

/**
 * Finds the following enabled customization row, wrapping to the top row.
 */
static int WeaponMenuKastumSelectDown(int row, int enabled_rows) {
    int selected_row = 0;
    while (row <= 6) {
        if (enabled_rows & (1 << (row - 3))) {
            selected_row = row;
            break;
        }
        row++;
    }
    return selected_row;
}

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

/**
 * Waits for the item page's data and opens it on the throw-away mode.
 *
 * @mangled InitItemTrushStart__Fv
 * @address 0x202C10
 * @size 0x74
 */
static void InitItemTrushStart() {
    if (ReadBGSync() == 0) {
        BattleMenuTexEnter();
        if (BtlMenuMode == 1) {
            BtlMenuStatusPt->unk_04 = 0;
        }
        InitItemMode(0, BtlMenuStatusPt->unk_04);
        BattleMenuFlag = MenuSelect[0] + 8;
        BtlEffectFlag = 1;
        BtlEffectCt = 0.0f;
    }
}

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

void BattleManualInit(int *result, u_long128 *load_buffer) {
    InitMenuManual(result, load_buffer);
}

int BattleManualKey() {
    int transition_done = 0;

    switch (BtlEffectFlag) {
        case 1:
            transition_done = ToFromSelect(0);
            if (transition_done != 0) {
                BtlEffectFlag = -1;
                BtlEffectCt = 0.0f;
            }
            break;
        case 0:
            transition_done = ToFromSelect(1);
            break;
    }

    if (BtlEffectFlag != -1) {
        BtlEffectCt += 1.0f;
    } else {
        BtlEffectCt = 0.0f;
    }

    MenuManualKey();
    if (GetNowManualMenuMode() == 1) {
        BtlEffectFlag = 0;
        if (transition_done != 0) {
            MenuSelect[0] = 8;
            BattleMenuFlag = 0x17;
            ForBackMenu();
            BattleMenuFlag = 0;
        }
    }

    return 0;
}

static void BattleManualDraw() {
    MenuManualDraw();
}

INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawStatusNumberNowAndMax__FPiiiii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawWepHole__FiiP11WEAPON_HAVEii);

void MenuClsMes::InitMes() {
    message = &EastKingMsgCls;
}

void MenuClsMes::InitData() {
    unk_08 = 366;
    unk_0C = 166;
    mode = 0;
    option_flags = 0;
    option_count = 0;
    unk_06 = 0;
}

INCLUDE_ASM("asm/nonmatchings/battlemenu", SetBuffInfo__10MenuClsMesFPs);

void MenuClsMes::NowWeaponStatus(WEAPON_HAVE *selected_weapon) {
    weapon = selected_weapon;
    option_flags = 1;
    option_count = 0;
    if (selected_weapon != NULL) {
        option_flags = selected_weapon->flags;
        for (int slot = 0; slot < 6; slot++) {
            ATTACH_LIST *attachment = &weapon->attach[slot];
            s16 attachment_flags = attachment->unk_04;
            if (attachment_flags != 0 && attachment_flags != 1) {
                option_flags |= attachment_flags;
            }
        }
        option_flags = CheckWeaponOptionStatus(option_flags);
        option_count = 0;
        int clear_slot;
        int changed = 0;
        for (int bit = 1; bit <= 13; bit++) {
            if (option_flags & (1 << bit)) {
                int message_no = bit + 69;
                ClsMes *window = message;
                int index = option_count;
                if (message_no != window->mes_no[index]) {
                    changed = 1;
                }
                window->mes_no[index] = message_no;
                option_count++;
            }
        }
        for (clear_slot = option_count; clear_slot < 10; clear_slot++) {
            ClsMes *window = message;
            window->mes_no[clear_slot] = 0;
        }
        if (changed != 0) {
            message->mes_made = -1;
            message->MakeMesWin(422);
        }
    }
}

void MenuClsMes::Step() {
    if (message != NULL) {
        switch (mode) {
            case 0:
                break;
            case 1:
            case 2:
                NowWeaponStatus(GetNowSelectWeapon());
                message->Step();
                break;
        }
    }
}

INCLUDE_ASM("asm/nonmatchings/battlemenu", Draw1__10MenuClsMesFiii);
