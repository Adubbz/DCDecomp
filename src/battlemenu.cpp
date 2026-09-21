#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000

#include "battlemenu.hpp"

#include <cstdio>
#include <cstring>

#include "character.hpp"
#include "clsmes.hpp"
#include "dataread.hpp"
#include "dngstatusdata.hpp"
#include "dun/gameloop.hpp"
#include "eastking.hpp"
#include "gamepad.hpp"
#include "itemdata.hpp"
#include "memcard.hpp"
#include "menu_draw.hpp"
#include "menu_inventory.hpp"
#include "menu_manual.hpp"
#include "menu_misc.hpp"
#include "menu_save.hpp"
#include "monstorunit.hpp"
#include "snd.hpp"
#include "texture.hpp"
#include "weapon_buildup.hpp"
#include "weaponlevelup.hpp"

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

/**
 * Holds the source rectangle of the menu's digit sprites.
 */
extern RECT NumberSprite;

/**
 * Holds each party member's starting weapon.
 */
extern s16 MenuDefaultWeaponNo[7];

/**
 * Holds the character page's state.
 */
extern MENU_CHARA_INFO MenuChara;

/**
 * Holds each party member's place on the character page's turntable.
 */
extern SYS_CHARA_INFO SysChara[6];

/**
 * Holds the menu cursor's screen position.
 */
extern float SysCur[3];

/**
 * Is nonzero while the menu's frames need rebuilding.
 */
extern s8 BtlWakuMake2;

/**
 * Is set once the character page's extra data has been read.
 */
extern s32 BtlMenuExReadFlag;

/**
 * Stores the character page's turntable radius.
 */
extern float chara_r_long;

/**
 * Stores the character page's turntable movement.
 */
extern s32 MenuCharaMove;

/**
 * Texture the weapon status panels are drawn from.
 */
extern CTexture *WepStatus;

/**
 * Texture the party members' faces are drawn from.
 */
extern CTexture *MenuCharaFace;

/**
 * Texture the weapon icons are drawn from.
 */
extern CTexture *WepIcon;

/**
 * Texture the item icons are drawn from.
 */
extern CTexture *ItemIcon;

/**
 * Texture the personal boards are drawn from.
 */
extern CTexture *PerBoardTex;

/**
 * Texture the frames and digits are drawn from.
 */
extern CTexture *StayTex;

/**
 * Points to the item pack the battle menu shows.
 */
extern ITEM_PACK *MenuItemPackPt;

/**
 * Is set once the item page's weapon icons have been entered.
 */
extern s32 ItemMenuAlreadyReadWepIconTexFlag;

/**
 * Buffer the item page reads the party member's model into.
 */
extern u_long128 *ItemMenuCharaReadBuf;

/**
 * Character the menus draw a party member or map marker with.
 */
extern CCharacter MenuCharaFrame;

/**
 * Holds the world-map marker's position.
 */
extern float mapo[4];

/**
 * Holds the travel page's state.
 */
extern MENU_MOVE_INFO MenuMove;

/**
 * Holds the frame name of each world-map place.
 */
extern char TownOrDngPos[16][16];

/**
 * Points to the frame name of the world-map place the cursor moves to.
 */
extern char *NextWorldPos;

/**
 * Frame of the world-map place the cursor stands on.
 */
extern CFrame *MapMoveCursor;

/**
 * Runs the weapon menu's repair, level-up and build-up effects.
 */
extern CWeaponLevelUp MenuWepLevelUp;

int GetDefaultWeaponNo(int character_no) {
    return MenuDefaultWeaponNo[character_no];
}

int IsDefaultWeapon(int weapon_no) {
    int owner = -1;
    int chara;

    for (chara = 0; chara <= 5; chara++) {
        int default_weapon_no = GetDefaultWeaponNo(chara);
        if (default_weapon_no == weapon_no || default_weapon_no + 1 == weapon_no) {
            owner = chara;
            break;
        }
    }
    return owner;
}
void SetNowEquipWeaponDataForMsg(int item_no, int slot) {
    ItemMenuMode.message_item_no = item_no;
    ItemMenuMode.message_slot = slot;
}
void GetNowEquipWeaponDataForMsg(int &item_no, int &slot) {
    COM_ITEM_INFO *item_info = GetCommonItemInfo(ItemMenuMode.message_item_no);
    if (item_info != NULL) {
        item_no = item_info->msg;
    } else {
        item_no = 0;
    }
    slot = ItemMenuMode.message_slot;
}
GRADATION_COLOR_INFO2 *GetGradationColorInfo2(int index) {
    return &MenuColorInfo2[index];
}

/**
 * Gives the weapon the weapon menu's cursor is on.
 *
 * @mangled GetNowSelectWeapon__Fv
 * @address 0x1F3F00
 * @size 0x3C
 */
static WEAPON_HAVE *GetNowSelectWeapon() {
    int chara = WepMenu.chara;
    CDngStatusData *status = BtlMenuStatusPt;
    WEAPON_HAVE *row = status->chara_weapons[chara];
    return &row[WepMenu.weapon_slot];
}
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

/**
 * Fills in the icon numbers the menu bar draws for one mode.
 *
 * @mangled BtlMenuMekeIconInfo__FPii
 * @address 0x1F4160
 * @size 0xE8
 */
static void BtlMenuMekeIconInfo(int *icons, int menu_mode) {
    int icon_count = GetMenuModeMax();

    for (int i = 0; i < icon_count; i++) {
        icons[i] = BtlDrawTbl[BtlMenuMode][i];
    }
    if (BtlMenuMode != 0) {
        int special_icon;
        switch (NowGetGameFlagForBtlMenu(BtlMenuMode)) {
            case 11:
            case 10:
                special_icon = 9;
                break;
            case 1:
                special_icon = 8;
                break;
            case 2:
                special_icon = 0xC;
                break;
        }
        icons[4] = special_icon;
    }
}

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

int GetLimmitMsg(void) {
    int message;

    switch (BtlMenuStatusPt->res_limit_zone_current) {
        case -1:
            message = -1;
            break;
        case 10:
            message = 0x19E;
            break;
        case 11:
            message = 0x19F;
            break;
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
            message = 0x1A0;
            break;
    }
    return message;
}
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

/**
 * Draws the saving notice over the menu and restores unfiltered rendering.
 *
 * @mangled BtlDrawSave__Fv
 * @address 0x1F5860
 * @size 0x34
 */
static void BtlDrawSave() {
    DrawMenuSave("frame_image");
    setbilinear(0);
}

/**
 * Looks the battle menu's fixed textures up in the texture manager and keeps them.
 *
 * @mangled BtlMenuTexBlockEnter__Fv
 * @address 0x1F58A0
 * @size 0x118
 */
static void BtlMenuTexBlockEnter() {
    MenuCharaFace = TexManager.GetTexture("charaface", BtlMenuReadBlock);
    BtStatus = TexManager.GetTexture("btstatus2", BtlMenuReadBlock);
    WepIcon = TexManager.GetTexture("wepicon", -1);
    ItemIcon = TexManager.GetTexture("itemicon", BtlMenuReadBlock);
    PerBoardTex = TexManager.GetTexture("perbrd", BtlMenuReadBlock);
    WepStatus = TexManager.GetTexture("wepstatus", BtlMenuReadBlock);
    VillageName = TexManager.GetTexture("vilname", -1);
    VillageBar = TexManager.GetTexture("viltag", -1);
}
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

/**
 * Suppresses a draw flag while an Atla event or a character page is showing.
 *
 * @mangled BtlMenuDrawSpecialFlag__Fi
 * @address 0x1F6150
 * @size 0x88
 */
static int BtlMenuDrawSpecialFlag(int flag) {
    if ((BattleMenuFlag == 12 || BattleMenuFlag == 4 || BattleMenuFlag == 20) &&
        GetMenuAtraEventFlag() != 0) {
        flag = 0;
    }
    if (MenuChara.unk_03 == 4 || MenuChara.unk_03 == 5) {
        flag = 0;
    }
    return flag;
}
INCLUDE_ASM("asm/nonmatchings/battlemenu", BattleMenuDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", BattleMenuCursor__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", BattleMenuAppear__Fv);

/**
 * Slides the bar icons off the screen and closes the menu once they are gone.
 *
 * @mangled BattleMenuExit__Fv
 * @address 0x1F6A40
 * @size 0xDC
 */
static int BattleMenuExit() {
    int i;

    for (i = 0; i < GetMenuModeMax(); i++) {
        NorMenuIcon[i].x += (-198.0f - NorMenuIcon[i].x) / 4.0f;
    }
    BtlEffectCt += 1.0f;
    if (!(BtlEffectCt <= 20.0f) && ReadBGSync() == 0) {
        ExitBattleMenu(1);
        return 0;
    }
    return 1;
}
INCLUDE_ASM("asm/nonmatchings/battlemenu", BattleMenuSelect__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", ToFromSelect__Fi);

/**
 * Puts the menu cursor back on the icon of the mode the menu is returning to.
 *
 * @mangled ForBackMenu__Fv
 * @address 0x1F7200
 * @size 0xE0
 */
static void ForBackMenu() {
    int position[2];

    BtlEffectCt = 0.0f;
    BtlEffectFlag = -1;
    BtlWakuMake2 = 1;
    CommonMenuMes1.mes_made = -1;
    CommonMenuMes1.auto_pos = -1;
    CommonMenuMes1.edge_alpha = 128;
    for (int i = 0; i < 10; i++) {
        CommonMenuMes1.mes_no[i] = -1;
        CommonMenuMes1.values[i] = -1;
    }
    MenuSelect[0] = BattleMenuFlag - 16;
    GetMenuIconPos(MenuSelect[1], position);
    SysCur[0] = position[0] - 40;
    SysCur[1] = position[1] + 20;
}

/**
 * Reads the character page's models and textures and starts its turntable.
 *
 * @mangled InitMenuChara__FP1
 * @address 0x1F72E0
 * @size 0x158
 */
static void InitMenuChara(u_long128 *buffer) {
    StartReadBG();
    LoadFileBGMenuData("charatex.img", buffer);
    ReadBG();
    BtlMenuExReadFlag = 0;
    MenuChara.unk_03 = 1;
    MenuChara.unk_04 = 0.0f;
    chara_r_long = 118.0f;
    BtlEffectCt = 0.0f;
    MenuCharaMove = 0;
    SysCur[0] = 60.0f;
    SysCur[1] = 160.0f;
    CDngStatusData *status = BtlMenuStatusPt;
    int chara = status->unk_04;
    MenuChara.unk_00 = chara;
    for (int i = 0; i < MenuChara.unk_02; i++) {
        SysChara[i].unk_01 = i - chara;
        SysChara[i].unk_00 = i;
        SysChara[i].unk_04 = 0;
        SysChara[i].unk_08 = 0;
        if (SysChara[i].unk_01 < 0) {
            SysChara[i].unk_01 = MenuChara.unk_02 + SysChara[i].unk_01;
        }
    }
    int message_no = chara + 30;
    if (status->party_size - 1 < chara) {
        message_no = 39;
    }
    CommonMenuMes2.mes_made = -1;
    CommonMenuMes2.MakeMesWin(message_no);
}
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

/**
 * Draws the board a weapon's name sits on.
 *
 * @mangled DrawWeaponNameBoard__Fiiiii
 * @address 0x1F9580
 * @size 0x13C
 */
static void DrawWeaponNameBoard(int x, int y, int width, int alpha, int brightness) {
    CRect_i_ left(x, y + 1, 0x28, 0x1F);
    CRect_i_ middle(x + 0x28, y + 1, 0x99, 0x1F);
    CRect_i_ right(x + 0xAC, y + 1, 0x20, 0x1F);

    DrawMenu2DSprite(WepStatus, left, CRect_i_(0xE0, 0x1A8, 0x28, 0x20), brightness, brightness,
                     brightness, alpha);
    DrawMenu2DSprite(WepStatus, middle, CRect_i_(0x108, 0x1A8, 0x78, 0x20), brightness, brightness,
                     brightness, alpha);
    DrawMenu2DSprite(WepStatus, right, CRect_i_(0xD4, 0x1D4, 0x20, 0x20), brightness, brightness,
                     brightness, alpha);
}

s32 GetWeaponNamePutX(s32 center_x, s32 width) {
    return center_x - (width >> 1);
}
INCLUDE_ASM("asm/nonmatchings/battlemenu", WeaponNameDraw__Fiii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", WepStatusVolumeDraw__F4RECTiPiiiii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawWeaponStatusWaku__Fiiii);

/**
 * Draws the mark that says a weapon value has reached its ceiling.
 *
 * @mangled DrawLimmitMax__Fiii
 * @address 0x1F9EB0
 * @size 0x60
 */
static void DrawLimmitMax(int x, int y, int alpha) {
    DrawMenu2DSprite(WepStatus, CRect_i_(x, y, 0x1E, 0xA), CRect_i_(0xF8, 0x158, 0x1E, 0xA), alpha);
}
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

/**
 * Reports whether a weapon can be repaired, built up, or neither, as a set of flags.
 *
 * @mangled NowWeaponStatusValue__FP11WEAPON_HAVE
 * @address 0x1FBEB0
 * @size 0x11C
 */
static int NowWeaponStatusValue(WEAPON_HAVE *weapon) {
    if (weapon == NULL) {
        return 0;
    }
    int status = 0;
    if (weapon->unk_14 >= GetWeaponMaxExp(weapon) || GetNowItemNum(0xB2, MenuItemPackPt) > 0) {
        status |= 2;
    }
    if (WeaponStatusBreakEnable(weapon) != 0) {
        status |= 4;
    }
    status |= 8;
    int build_up = 0;
    if (WeaponStatusBuildUp(weapon, build_up) > 0 && GetNowWeaponAttachNum(weapon) == 0 &&
        build_up > 0) {
        status |= 0x10;
    }
    if (IsNotBuildUpWeapon(weapon->item_no) != 0) {
        if (status & 8) {
            status &= ~8;
        }
        if (status & 0x10) {
            status &= ~0x10;
        }
    }
    return status;
}

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

/**
 * Drops a weapon's active element where the attachment no longer supports it.
 *
 * @mangled WeaponMenuCheckElemValue__FP11WEAPON_HAVEP11WEAPON_HAVE
 * @address 0x1FC050
 * @size 0xB8
 */
static void WeaponMenuCheckElemValue(WEAPON_HAVE *weapon, WEAPON_HAVE *attachment) {
    if (0 <= weapon->best_elem && weapon->best_elem < 5 && attachment->elem[weapon->best_elem] <= 0) {
        weapon->best_elem = 5;
    }
    if (weapon->best_elem == 5 && EnableWeaponElemNone(weapon->item_no) != 0) {
        SetWeaponElementStatus(weapon);
    }
    printf("now active elem = %d\n", weapon->best_elem);
    printf("now active vol  = %d\n", weapon->elem[weapon->best_elem]);
}

/**
 * Reports whether an element may be put on a weapon, and complains where it may not.
 *
 * @mangled WeaponMenuCheckEnableSetElem__FP11WEAPON_HAVEP11WEAPON_HAVEi
 * @address 0x1FC110
 * @size 0x10C
 */
static int WeaponMenuCheckEnableSetElem(WEAPON_HAVE *weapon, WEAPON_HAVE *attachment, int elem) {
    int refused = 0;

    if (weapon->best_elem == elem) {
        if (EnableWeaponElemNone(weapon->item_no) != 0) {
            WepMenu.unk_0C = 11;
            WepMenu.unk_08 = 9;
            refused = 1;
        } else {
            weapon->best_elem = 5;
        }
    } else if (attachment->elem[elem] > 0) {
        weapon->best_elem = elem;
    } else {
        WepMenu.unk_0C = 11;
        WepMenu.unk_08 = 0;
        refused = 1;
    }
    if (weapon != NULL) {
        printf("now elem = %d\n", weapon->best_elem);
        if (weapon->best_elem != 5) {
            printf("now elem vol = %d\n", attachment->elem[weapon->best_elem]);
        }
    }
    return refused;
}
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

/**
 * Handles input on the weapon menu's equipped weapon row.
 *
 * @mangled WeaponMenuActWepKey__Fv
 * @address 0x1FFA90
 * @size 0xCC
 */
static void WeaponMenuActWepKey() {
    if (GamePad.Down(0x2000) != 0) {
        WepMenu.unk_02 = 10;
        WepMenu.unk_20 = WepMenu.unk_2C * 5 + 10;
    } else if (GamePad.Down(0x4000) != 0) {
        WepMenu.unk_02 = 11;
        WepMenu.unk_179 = 0;
    } else if (GamePad.Down(0x20) != 0) {
        ComMenuSePlay(2);
        WepAttachHaveCancel();
    }
}
INCLUDE_ASM("asm/nonmatchings/battlemenu", WeaponMenuTagKey__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", WeaponMenuAttachWepKey__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", WeaponMenuAttachKey__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", RepairAndLevelUpDraw__Fiii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawBuildUpWeaponSelect__Fiii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", WeaponMenuDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", ItemTrushKey__FPiPii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawTrushItem__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", ExitItemSelect__Fv);

/**
 * Starts reading the item page's weapon icons in the background.
 *
 * @mangled StartBGReadItemMenuWepIcon__FP1Ri
 * @address 0x2024B0
 * @size 0x54
 */
static void StartBGReadItemMenuWepIcon(u_long128 *buffer, int &size) {
    StartReadBG();
    size = LoadFileBGMenuData("wepchara.img", buffer);
    ItemMenuAlreadyReadWepIconTexFlag = 0;
}
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

/**
 * Moves the item page from one party member to the next.
 *
 * @mangled ChangeMenuChara__Fv
 * @address 0x202D50
 * @size 0x1C0
 */
static void ChangeMenuChara() {
    if (MenuWepLevelUp.operation_kind < 4 || MenuWepLevelUp.operation_kind > 13) {
        int previous = ItemMenuMode.chara;
        int party_size = BtlMenuStatusPt->party_size;

        if (GamePad.Down(5) != 0) {
            ItemMenuMode.chara--;
            if (ItemMenuMode.chara < 0) {
                ItemMenuMode.chara = party_size - 1;
            }
        }
        if (GamePad.Down(10) != 0) {
            ItemMenuMode.chara++;
            if (party_size - 1 < ItemMenuMode.chara) {
                ItemMenuMode.chara = 0;
            }
        }
        if (previous != ItemMenuMode.chara) {
            if (ItemMenuMode.chara <= BtlMenuStatusPt->party_size) {
                if (ReadBGSync() != 0) {
                    BreakReadBG();
                }
                MenuExTextureReadFlag = StartLoadCharaMDS(ItemMenuCharaReadBuf, ItemMenuMode.chara, 0);
                int chara = ItemMenuMode.chara;
                CDngStatusData *status = BtlMenuStatusPt;
                int slot = status->equipped_weapon_slot[chara];
                WEAPON_HAVE *row = status->chara_weapons[chara];
                WEAPON_HAVE *weapon = &row[slot];
                if (weapon != NULL) {
                    SetNowEquipWeaponDataForMsg(weapon->item_no, weapon->unk_02);
                } else {
                    SetNowEquipWeaponDataForMsg(0, 0);
                }
            } else {
                MenuExTextureReadFlag = 1;
            }
        }
    }
}
INCLUDE_ASM("asm/nonmatchings/battlemenu", ItemMenuMainKey__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", ItemMenuModeDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", ItemMenuModeKey__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", ActiveItemDraw__Fiii);

/**
 * Steps and draws the party member's model on the item page.
 *
 * @mangled MenuCharaPolyDraw__Fv
 * @address 0x206AB0
 * @size 0x84
 */
static void MenuCharaPolyDraw() {
    SetNowCharaMotionNo(ItemMenuMode.chara);
    SetItemMenuColor(ItemMenuMode.chara);
    MenuCharaFrame.Step();
    if (ItemMenuMode.chara == 0) {
        MenuCharaFrame.ClothStep(0);
    }
    MenuCharaFrame.Draw();
    SetItemMenuOldAmbient();
}
INCLUDE_ASM("asm/nonmatchings/battlemenu", ItemMenuCharaStatusDraw__Fiiii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", ItemNaviCursor__Fi);
INCLUDE_ASM("asm/nonmatchings/battlemenu", CharaStatusMsgDraw__Fiiiii);

/**
 * Runs the Atla page and returns to the menu bar when it closes.
 *
 * @mangled BattleMenuAtoraKey__Fv
 * @address 0x207DF0
 * @size 0xFC
 */
static int BattleMenuAtoraKey() {
    switch (BtlEffectFlag) {
        case 1:
            if (ToFromSelect(0) != 0) {
                BtlEffectFlag = -1;
                BtlEffectCt = 0.0f;
            }
            break;
        case 0:
            if (ToFromSelect(1) != 0) {
                MenuSelect[0] = 4;
                BattleMenuFlag = 20;
                ForBackMenu();
                BattleMenuFlag = 0;
            }
            break;
        default:
            switch (MenuAtoraSelectKey()) {
                case 100:
                    BtlEffectFlag = 0;
                    BtlEffectCt = 0.0f;
                    break;
                case 0:
                    break;
            }
            break;
    }
    if (BtlEffectFlag != -1) {
        BtlEffectCt += 1.0f;
    } else {
        BtlEffectCt = 0.0f;
    }
    return 1;
}
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

/**
 * Steps and draws the party's marker over the world map.
 *
 * @mangled LocalDrawWorldMap__Fv
 * @address 0x20A370
 * @size 0x6C
 */
static void LocalDrawWorldMap() {
    MenuCharaFrame.SetScale(2.2f, 2.2f, 2.2f);
    MenuCharaFrame.SetPosition(mapo);
    MenuCharaFrame.Step();
    MenuCharaFrame.Draw();
}

/**
 * Draws the world map with the party's marker over it.
 *
 * @mangled DrawWorldMap__Fi
 * @address 0x20A3E0
 * @size 0x48
 */
static void DrawWorldMap(int alpha) {
    MenuTextureReload(MenuMove.unk_14);
    MenuPolygonDraw(alpha, LocalDrawWorldMap);
}

void MenuDataSwap(MAP_JUMP_COMPARE *first, MAP_JUMP_COMPARE *second) {
    MAP_JUMP_COMPARE temp;

    memcpy(&temp, first, sizeof(MAP_JUMP_COMPARE));
    memcpy(first, second, sizeof(MAP_JUMP_COMPARE));
    memcpy(second, &temp, sizeof(MAP_JUMP_COMPARE));
}

INCLUDE_ASM("asm/nonmatchings/battlemenu", GetNearWorldPos__FiPi);

/**
 * Moves the world-map cursor to the place nearest the direction pressed.
 *
 * @mangled WorldMapMoveKey__Fv
 * @address 0x20A860
 * @size 0x148
 */
static int WorldMapMoveKey() {
    int position[2];

    position[0] = SysCur[0];
    position[1] = SysCur[1];
    int direction = 0;
    if (GamePad.Down(0x1000) != 0) {
        direction |= 1;
    }
    if (GamePad.Down(0x4000) != 0) {
        direction |= 2;
    }
    if (GamePad.Down(0x2000) != 0) {
        direction |= 8;
    }
    if (GamePad.Down(0x8000) != 0) {
        direction |= 4;
    }
    if (direction > 0) {
        direction = GetNearWorldPos(direction, position);
        if (direction < 16 && direction >= 0) {
            NextWorldPos = TownOrDngPos[direction];
            MenuMove.unk_04 = direction;
            MapMoveCursor = MenuCharaFrame.frame->SearchFrame(TownOrDngPos[MenuMove.unk_04]);
        }
    }
    return 1;
}
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawMapCheck__Fi);
INCLUDE_ASM("asm/nonmatchings/battlemenu", GetVisitInfo__Fii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", IsLoadMapNo__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", MapNoTransFunc__Fi);

/**
 * Runs the options page and returns to the menu bar when it closes.
 *
 * @mangled BattleMenuOptionKey__Fv
 * @address 0x20AE60
 * @size 0x108
 */
static void BattleMenuOptionKey() {
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

    int closed = MenuOptionKey();
    if (OptionMenuFadeOutStart() != 0) {
        BtlEffectFlag = 0;
        if (transition_done != 0 && closed != 0) {
            MenuSelect[0] = 6;
            BattleMenuFlag = 22;
            ForBackMenu();
            BattleMenuFlag = 0;
        }
    }
}

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
