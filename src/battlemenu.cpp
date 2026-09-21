#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000

#include "battlemenu.hpp"

#include <cmath>
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
#include "menu_dungeon.hpp"
#include "menu_inventory.hpp"
#include "menu_manual.hpp"
#include "menu_misc.hpp"
#include "menu_save.hpp"
#include "menuiconautoget.hpp"
#include "mglib.hpp"
#include "monstorunit.hpp"
#include "savedata.hpp"
#include "shop.hpp"
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
 * Holds each world-map place's frame name and position.
 */
extern WORLD_MAP_POS TownOrDngPos[16];

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

/**
 * Points to the item the weapon menu is holding.
 */
extern IHAVEITEM *BtlHaveItemPt;

/**
 * Points to the weapons of the party member the weapon menu shows.
 */
extern WEAPON_HAVE *DngWepHavePt;

/**
 * Buffer the battle menu reads its files into.
 */
extern u_long128 *BtlMenuReadBuf;

/**
 * Texture block the menu's pages read their extra textures into.
 */
extern s32 MenuExtendReadBlock;

/**
 * Language the battle menu's text is drawn in.
 */
extern s32 BtlMenuNowLang;

/**
 * Draws the selected weapon's option messages.
 */
extern MenuClsMes MenuMes;

/**
 * Horizontal position of the weapon list's model row.
 */
extern float WeaponPos;

/**
 * Horizontal position of the weapon list's polygons.
 */
extern float WepPolyPos;

/**
 * Frame rate the weapon models turn at.
 */
extern float WepFrameRate;

/**
 * Source rectangle of the digits a weapon-status bar prints its value with.
 */
extern RECT WeaponVolumeNumberRect;

/**
 * Icons flying from the field into the item pack.
 */
extern CMenuIconAutoGet IconAutoGet;

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

/**
 * Places one line of a message window, ignoring lines past the window's ten.
 */
static inline void SetLinePos(ClsMes *window, int line, int x, int y) {
    if (line >= 0 && line < 10) {
        window->line_pos[line].x = x;
        window->line_pos[line].y = y;
    }
}

/**
 * Draws the names of the weapons either side of the cursor as they slide past.
 *
 * Weapons off screen, or hidden by the page's current mode, get the blank message. The window
 * is laid out again whenever a name or level changed, and the name frame is drawn under it while
 * the page is at its top level.
 *
 * @mangled WeaponNameDraw__Fiii
 * @address 0x1F96D0
 * @size 0x550
 */
static void WeaponNameDraw(int y, int selected_only, int alpha) {
    int previous_mes[4];
    int previous_level[4];

    MenuTextureReload(AtoraNameMes.tex_block);
    int slot = WepMenu.weapon_slot - 1;
    for (int i = 0; i < 4; i++) {
        previous_mes[i] = AtoraNameMes.mes_no[i];
        previous_level[i] = AtoraNameMes.values[i];
    }
    int x = 22.0f + WeaponPos + slot * 0xD6;
    AtoraNameMes.value_signed = 1;
    for (int i = 0; i < 3; i++) {
        int mes_no;
        int level = 0;
        if (x < -140 || x > 630 || (selected_only == 1 && slot != WepMenu.weapon_slot) || slot < 0 || slot > 9 ||
            ((WepMenu.unk_0C == 8 || WepMenu.unk_0C == 9) && slot == WepMenu.weapon_slot) ||
            (WepMenu.unk_02 > 0 && slot != WepMenu.weapon_slot) || (WepMenu.unk_0C != 10 && WepMenu.unk_0C >= 8 && WepMenu.unk_0C < 11) ||
            (WepMenu.unk_0C == 7 && slot != WepMenu.weapon_slot)) {
            mes_no = 999;
        } else {
            mes_no = GetWeaponMsgNo(&DngWepHavePt[slot]);
            if (mes_no < 0 || slot < 0) {
                mes_no = 999;
            }
            if (mes_no > 100) {
                AtoraNameMes.GetMesWidth_system(mes_no);
                level = DngWepHavePt[slot].unk_02;
            }
        }
        int width = AtoraNameMes.GetMesWidth_system(mes_no);
        AtoraNameMes.mes_no[i] = mes_no;
        AtoraNameMes.values[i] = level;
        int name_x = GetWeaponNamePutX(x + 0x42, width);
        if (level > 0) {
            name_x -= 8;
            if (level / 10 > 0) {
                name_x -= 8;
            }
        }
        SetLinePos(&AtoraNameMes, i, name_x, y);
        x += 0xD6;
        slot++;
    }
    for (int i = 0; i < 4; i++) {
        if (AtoraNameMes.line_pos[i].y > 180) {
            AtoraNameMes.line_pos[i].y = y;
            AtoraNameMes.mes_no[i] = 999;
        }
    }
    for (int i = 0; i < 4; i++) {
        if (AtoraNameMes.mes_no[i] != previous_mes[i] || AtoraNameMes.values[i] != previous_level[i]) {
            AtoraNameMes.mes_made = -1;
            AtoraNameMes.MakeMesWin(150);
            break;
        }
    }
    AtoraNameMes.edge_alpha = alpha;
    AtoraNameMes.Step();
    AtoraNameMes.DrawMesWin();
    if (WepMenu.unk_02 == 0 && WepMenu.unk_0C == 0) {
        CTexture *frame = TexManager.GetTexture("frame_image", -1);
        if (frame != NULL) {
            TexManager.ReloadTexture(GetVif1Packet(), frame->block);
            ((sceGsTex0 *) &frame->tex0)->bits.tcc = 0;
            sceGsTexa texa = mgTexa;
            texa.AEM = 1;
            texa.TA0 = 0x80;
            MGSetGsTEXA(&texa);
            CRect_i_ rect(0, 0x14A, 0x104, 0x76);
            set2DSprite(GetVif1Packet(), frame, rect, rect, 0x40, 0x40, 0x40, alpha);
            MGSetGsTEXA(NULL);
        }
    }
}

/**
 * Draws one weapon-status bar, filled to the value's share of its maximum.
 *
 * @mangled WepStatusVolumeDraw__F4RECTiPiiiii
 * @address 0x1F9C20
 * @size 0x220
 */
static void WepStatusVolumeDraw(RECT rect, int width, int *value, int color, int alpha, int number_style, int show) {
    int y = rect.y;
    int fill = (float) (value[1] * width) / (float) value[0];
    if (fill > width) {
        fill = width;
    }
    GRADATION_COLOR_INFO2 gradation;
    memcpy(&gradation, GetGradationColorInfo2(color), sizeof(gradation));
    gradation.colors[3].a = alpha;
    gradation.colors[2].a = alpha;
    gradation.colors[1].a = alpha;
    gradation.colors[0].a = alpha;
    CRect_i_ bar(rect.x, y, fill, 8);
    DrawMenuColorGradation(bar, &gradation.colors[0], &gradation.colors[1], &gradation.colors[2],
                           &gradation.colors[3]);
    fill = (float) (value[2] * width) / (float) value[0];
    if (fill > width) {
        fill = width;
    }
    int number_alpha = 1.5f * alpha;
    if (number_style == 1 && show > 0) {
        DrawMenuNumber(value[1], rect.x + rect.width, y + rect.height, WeaponVolumeNumberRect, WepStatus, 2,
                       0xDC, 0, 0, alpha);
    } else {
        DrawMenuNumber(value[1], rect.x + rect.width, y + rect.height, WepStatus, WeaponVolumeNumberRect, 2,
                       alpha);
    }
}
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

/**
 * Draws the three tag pages of a weapon and highlights the one the cursor is on.
 *
 * @mangled DrawWeaponTagBoard__FiiP11WEAPON_HAVEiii
 * @address 0x1FAFF0
 * @size 0x210
 */
static void DrawWeaponTagBoard(int x, int y, WEAPON_HAVE *weapon, int value_x, int value_y, int alpha) {
    int page = WepMenu.unk_178;
    int tag = 0;
    int i = 0;
    int step = 1;
    int wrapped = 0;

    for (; i < 3; i++) {
        int brightness = 128;
        if (page == tag) {
            if (wrapped != 0) {
                tag = page;
            } else {
                tag = 2;
                step = -1;
                wrapped = 1;
            }
        }
        if (WepMenu.unk_02 == 2 && tag != 1) {
            brightness = 64;
        }
        int top = tag * 0xAA;
        DrawMenu2DSprite(WepStatus, CRect_i_(x, y, 0xD4, 0xAA), CRect_i_(0, top, 0xD4, 0xAA),
                         brightness, brightness, brightness, alpha);
        tag += step;
    }
    if (weapon != NULL) {
        switch (page) {
            case 0:
                DrawWeaponStatusTag(x, y, weapon, value_x, value_y, alpha);
                break;
            case 1:
                DrawWeaponElemTag(x, y, weapon, value_x, value_y, alpha);
                break;
            case 2:
                DrawWeaponVsMonster(x, y, weapon, value_x, value_y, alpha);
                break;
        }
    }
}
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
/**
 * Opens the weapon page in one of its modes and puts the cursor where it was left.
 *
 * @mangled InitWeaponSelect__Fii
 * @address 0x1FC750
 * @size 0x3CC
 */
static void InitWeaponSelect(int mode, int chara) {
    InitPersonalBoardMode((CUserStatus *) BtlMenuStatusPt, &WepMenu.board, 1, 2);
    WepMenu.unk_00 = mode;
    WepMenu.unk_02 = 0;
    WepMenu.chara = chara;
    switch (mode) {
        case 0:
            WepMenu.unk_0C = 1;
            BtlHaveItemPt = (IHAVEITEM *) WepMenu.board.unk_30;
            break;
        case 1:
            WepMenu.unk_0C = 0;
            break;
        case 2:
            break;
    }
    WepMenu.unk_10 = 0;
    StartReadWepMDS(BtlMenuReadBuf, chara);
    MenuExTextureReadFlag = 0;
    CDngStatusData *status = BtlMenuStatusPt;
    DngWepHavePt = status->chara_weapons[chara];
    for (int i = 0; i < 10; i++) {
        if (DngWepHavePt[i].item_no < 257) {
            memset(&DngWepHavePt[i], 0, sizeof(WEAPON_HAVE));
            DngWepHavePt[i].item_no = -1;
        }
    }
    WepMenu.weapon_slot = BtlMenuStatusPt->equipped_weapon_slot[chara];
    if (WepMenu.weapon_slot < 0 || WepMenu.weapon_slot >= 10) {
        WepMenu.weapon_slot = 0;
    }
    SysCur[0] = 235.0f;
    SysCur[1] = 165.0f;
    WepMenu.chara = chara;
    for (int i = 0; i < 6; i++) {
        SysChara[i].unk_04 = (SysChara[i].unk_00 - WepMenu.chara) * 110 + 270;
        SysChara[i].unk_08 = 14.0f;
    }
    WeaponPos = 0xE8 - WepMenu.weapon_slot * 0xD6;
    WepPolyPos = 2.0f + 16.0f * -WepMenu.weapon_slot;
    WepFrameRate = 3.1415927f;
    WepMenu.unk_08 = -1;
    MenuWepLevelUp.buildup_complete = 0;
    CommonMenuMes3.Preset(1);
    CommonMenuMes3.char_width = GetMenuCommonFontW(BtlMenuNowLang, -1);
    CommonMenuMes3.style = 0;
    AtoraNameMes.value_show = 0;
    AtoraNameMes.value_narrow = 0;
    AtoraNameMes.char_width = GetMenuCommonFontW(BtlMenuNowLang, -1);
    AtoraNameMes.style = 0;
    AtoraNameMes.narrow_gaiji = 1;
    memset(AtoraNameMes.unk_17B0, 0, 0x100);
    for (int i = 0; i < 10; i++) {
        AtoraNameMes.mes_no[i] = -1;
        AtoraNameMes.values[i] = 0;
    }
    AtoraNameMes.columns = 16;
    AtoraNameMes.Preset(4);
    AtoraNameMes.mes_made = -1;
    MenuMes.InitData();
    MenuMes.message->unk_02C = 0x10;
    MenuMes.message->unk_030 = 0x10;
}

/**
 * Rebuilds the player's equipped weapon model and gives the menu's textures back.
 *
 * @mangled ExitWeaponMenuSelect__Fv
 * @address 0x1FCB20
 * @size 0x2CC
 */
static void ExitWeaponMenuSelect() {
    int chara = BtlMenuStatusPt->unk_04;

    if (BtlMenuMode == 0 && chara == WepMenu.chara) {
        DngWeaponEquipModelBuild(chara, MenuExtendReadBlock, BtlMenuReadBuf);
    }
    TexManager.DeleteTextureBlock(MenuExtendReadBlock);
    TexManager.CleanUpTextureList();
    BtlMenuTexBlockEnter();
    BattleMenuFlag = 18;
    CommonMenuMes3.text_columns = 70;
    CommonMenuMes3.text_rows = 10;
    CommonMenuMes3.text_len = 0;
    CommonMenuMes3.text_width = 0;
    CommonMenuMes3.text_height = 0;
    CommonMenuMes3.fade = 0.0f;
    CommonMenuMes3.fade_in = 1;
    CommonMenuMes3.text_rate = CommonMenuMes3.text_rate_set;
    CommonMenuMes3.waiting = 0;
    CommonMenuMes3.text_at = 0.0f;
    CommonMenuMes3.text_no = 0;
    CommonMenuMes3.text_from = 0;
    CommonMenuMes3.page_from = 0;
    CommonMenuMes3.InitMesWinTbl();
    CommonMenuMes3.clut_now = CommonMenuMes3.clut_default;
    CommonMenuMes3.wait = 0;
    CommonMenuMes3.blink = 0;
    CommonMenuMes3.auto_page_wait = 0;
    CommonMenuMes3.mes_made = -1;
    CommonMenuMes3.edge_alpha = 128;
    for (int slot = 0; slot < 10; slot++) {
        CommonMenuMes3.mes_no[slot] = -1;
    }
    for (int slot = 0; slot < 8; slot++) {
        CommonMenuMes3.values[slot] = 0;
    }
    CommonMenuMes3.value = 0;
    CommonMenuMes3.value_signed = 0;
    CommonMenuMes3.value_show = 1;
    CommonMenuMes3.value_narrow = 0;
    CommonMenuMes3.space_width = -1;
    CommonMenuMes3.space_area = -1;
    CommonMenuMes3.cursor_row = -1;
    CommonMenuMes3.cursor_y = 0;
    CommonMenuMes3.cursor_lit = 0;
    for (int line = 0; line < 10; line++) {
        CommonMenuMes3.line_pos[line].x = -1;
        CommonMenuMes3.line_pos[line].y = -1;
    }
    CommonMenuMes3.Preset(1);
    CommonMenuMes3.char_width = GetMenuCommonFontW(BtlMenuNowLang, -1);
    CommonMenuMes3.char_height = 22;
    CommonMenuMes3.value_narrow = 0;
    AtoraNameMes.value_show = 1;
    AtoraNameMes.value_narrow = 0;
    AtoraNameMes.narrow_gaiji = 0;
    AtoraNameMes.char_width = GetMenuCommonFontW(BtlMenuNowLang, -1);
    CommonMenuMes1.value_narrow = 0;
    ForBackMenu();
    BattleMenuFlag = 0;
}
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

/**
 * Stores a menu's cursor position in the saved menu cursors.
 */
static inline void SetCursorPos(CMenuCursor *cursor, int menu, int pos) {
    cursor->pos[menu] = pos;
}

/**
 * Stores the party member the item menu shows in the saved menu cursors.
 */
static inline void SetCursorChara(CMenuCursor *cursor, int chara) {
    cursor->chara_no = chara;
}

/**
 * Puts the attachment the weapon menu is holding back where it came from.
 *
 * @mangled WepAttachHaveCancel__Fv
 * @address 0x1FF6B0
 * @size 0x198
 */
static void WepAttachHaveCancel() {
    ATTACH_LIST *slot;
    s16 held = BtlHaveItemPt->item_no;

    if (held >= 81) {
        switch (BtlHaveItemPt->unk_04) {
            case 10: {
                ATTACH_LIST *items = (ATTACH_LIST *) BtlMenuStatusPt->consumable_items;
                slot = &items[BtlHaveItemPt->unk_0C];
                break;
            }
            case 9:
                slot = &DngWepHavePt[WepMenu.weapon_slot].attach[BtlHaveItemPt->unk_0C];
                break;
        }
        if (slot != NULL) {
            s16 item_no = slot->item_no;
            MenuDataSwap(slot, &WepMenu.board.unk_13C);
            BtlHaveItemPt->item_no = item_no;
            slot->item_no = held;
        }
        if (BtlHaveItemPt->item_no < 81) {
            InitHaveData(BtlHaveItemPt);
        }
    } else {
        CMenuCursor *cursor = SaveData->GetMenuCursor();
        if (cursor->reset_pos == 0) {
            cursor->mode[2] = WepMenu.unk_02;
            SetCursorPos(cursor, 2, WepMenu.board.unk_0C);
        }
        WepMenu.unk_02 = 1;
        WepMenu.board.unk_0C = 1;
        WepMenu.unk_06 = 0;
        GetNowSelectWeapon();
        if (BtlMenuMode == 0 && BtlMenuStatusPt->unk_04 == 3 && WepMenu.chara == 3) {
            StartReadBG();
            DngWepEffectReadStart();
        }
    }
}
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
        WepMenu.board.unk_0C = WepMenu.board.unk_18 * 5 + 10;
    } else if (GamePad.Down(0x4000) != 0) {
        WepMenu.unk_02 = 11;
        WepMenu.unk_179 = 0;
    } else if (GamePad.Down(0x20) != 0) {
        ComMenuSePlay(2);
        WepAttachHaveCancel();
    }
}
INCLUDE_ASM("asm/nonmatchings/battlemenu", WeaponMenuTagKey__Fv);

/**
 * Moves the cursor across the sockets of the selected weapon and fits or takes off the attachment held.
 *
 * @mangled WeaponMenuAttachWepKey__Fv
 * @address 0x200120
 * @size 0x414
 */
static void WeaponMenuAttachWepKey() {
    int moved = 0;
    WEAPON_HAVE *weapon = GetNowSelectWeapon();

    if (GamePad.Down(0x8000)) {
        moved = 1;
        if (0 < WepMenu.board.unk_0C) {
            WepMenu.board.unk_0C--;
        }
    }
    int holes = GetWeaponHoleNum(weapon->item_no);
    if (WepMenu.board.unk_0C > holes - 1) {
        WepMenu.board.unk_0C = holes - 1;
        if (WepMenu.board.unk_0C < 0) {
            WepMenu.board.unk_0C = 0;
            WepMenu.unk_02 = 8;
            return;
        }
    }
    if (holes <= 0) {
        WepMenu.board.unk_0C = 0;
        WepMenu.unk_02 = 8;
        return;
    }
    if (moved) {
        return;
    }
    if (GamePad.Down(0x40)) {
        if (holes <= 0) {
            ComMenuSePlay(2);
            return;
        }
        int hole = WepMenu.board.unk_0C;
        if (BtlHaveItemPt->item_no < 81) {
            if (weapon->attach[hole].item_no <= 0) {
                ComMenuSePlay(2);
                return;
            }
            ComMenuSePlay(6);
            s16 held = BtlHaveItemPt->item_no;
            s16 item_no = weapon->attach[hole].item_no;
            MenuDataSwap(&WepMenu.board.unk_13C, &weapon->attach[hole]);
            BtlHaveItemPt->item_no = item_no;
            weapon->attach[hole].item_no = held;
            BtlHaveItemPt->unk_0C = WepMenu.board.unk_0C;
            BtlHaveItemPt->unk_04 = 9;
            WEAPON_HAVE value;
            WeaponAllValueSet(weapon, &value, 0);
            WeaponMenuCheckElemValue(weapon, &value);
            return;
        }
        WEAPON_DATA *data = GetWeaponData(weapon->item_no);
        int socket = data->hole[hole];
        if (BtlHaveItemPt->item_no == 90 && socket != 2) {
            ComMenuSePlay(2);
            return;
        }
        ComMenuSePlay(5);
        s16 item_no = weapon->attach[hole].item_no;
        s16 held = BtlHaveItemPt->item_no;
        MenuDataSwap(&weapon->attach[hole], &WepMenu.board.unk_13C);
        weapon->attach[hole].item_no = held;
        BtlHaveItemPt->item_no = item_no;
        BtlHaveItemPt->unk_0C = WepMenu.board.unk_0C;
        BtlHaveItemPt->unk_04 = WepMenu.unk_02;
        WEAPON_HAVE value;
        WeaponAllValueSet(weapon, &value, 0);
        WeaponMenuCheckElemValue(weapon, &value);
        return;
    }
    if (GamePad.Down(0x20)) {
        ComMenuSePlay(2);
        WepAttachHaveCancel();
        return;
    }
    if (GamePad.Down(0x2000)) {
        if (WepMenu.board.unk_0C < holes - 1) {
            WepMenu.board.unk_0C++;
            if (WepMenu.board.unk_0C <= 0) {
                WepMenu.board.unk_0C = 0;
            }
        } else {
            WepMenu.unk_02 = 10;
            WepMenu.board.unk_0C = WepMenu.board.unk_18 * 5;
        }
    } else if (GamePad.Down(0x80)) {
        ComMenuSePlay(2);
    } else if (GamePad.Down(0x4000)) {
        WepMenu.unk_02 = 11;
        WepMenu.unk_179 = 0;
    }
}
INCLUDE_ASM("asm/nonmatchings/battlemenu", WeaponMenuAttachKey__Fv);
INCLUDE_ASM("asm/nonmatchings/battlemenu", RepairAndLevelUpDraw__Fiii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawBuildUpWeaponSelect__Fiii);
INCLUDE_ASM("asm/nonmatchings/battlemenu", WeaponMenuDraw__Fv);

/**
 * Swaps the item the menu is holding with the one in the given slot of the page it is on.
 *
 * Weapons are only taken when they are not a party member's default weapon and belong to the
 * party member holding the menu's slot.
 *
 * @mangled ItemTrushKey__FPiPii
 * @address 0x201E30
 * @size 0x2F0
 */
static int ItemTrushKey(int *, int *, int slot) {
    int swapped = 0;
    int page = ItemMenuMode.board.unk_04;
    int kind = WhatIsKindofItem(BtlHaveItemPt->item_no);
    s16 held = BtlHaveItemPt->item_no;
    s16 item_no;

    switch (page) {
        case 0:
            if (!kind || kind == -1) {
                MenuDataSwap(&MenuItemPackPt->item[MenuItemPackPt->num + slot], &ItemMenuMode.board.unk_40);
                MenuDataSwap(&ItemMenuMode.board.unk_42, &MenuItemPackPt->item_vol[MenuItemPackPt->num + slot]);
                swapped = 1;
            }
            break;
        case 1:
            if (kind == 1 || kind == -1) {
                int owner = -1;
                WEAPON_HAVE *weapon;
                int equip = WhoIsWeaponEquip(held);
                if (equip < 0) {
                    for (int i = 0; i < 6; i++) {
                        CDngStatusData *status = BtlMenuStatusPt;
                        WEAPON_HAVE *row = status->chara_weapons[i];
                        weapon = &row[10];
                        if (weapon != NULL && weapon->item_no >= 257) {
                            owner = (s8) GetWeaponData(weapon->item_no)->owner;
                            break;
                        }
                    }
                } else {
                    CDngStatusData *status = BtlMenuStatusPt;
                    WEAPON_HAVE *row = status->chara_weapons[equip];
                    weapon = &row[10];
                    if (weapon != NULL) {
                        owner = equip;
                    }
                }
                int is_default = 0;
                for (int chara = 0; chara < 6; chara++) {
                    int default_no = GetDefaultWeaponNo(chara);
                    if (ItemMenuMode.board.weapon.item_no == default_no ||
                        ItemMenuMode.board.weapon.item_no == default_no + 1) {
                        is_default = 1;
                    }
                }
                int allowed = 1;
                if (ItemMenuMode.board.unk_15C >= 0) {
                    allowed = 0;
                }
                if (is_default) {
                    allowed = 0;
                }
                if (equip >= 0 && owner != equip && owner >= 0) {
                    allowed = 0;
                }
                if (allowed) {
                    item_no = weapon->item_no;
                    MenuDataSwap(weapon, &ItemMenuMode.board.weapon);
                    BtlHaveItemPt->item_no = item_no;
                    weapon->item_no = held;
                    swapped = 1;
                } else {
                    swapped = 0;
                }
            }
            break;
        case 2:
            if (kind == 2 || kind == -1) {
                DNG_CONSUMABLE *items = BtlMenuStatusPt->consumable_items;
                ATTACH_LIST *attach = (ATTACH_LIST *) &items[slot] + 40;
                item_no = attach->item_no;
                MenuDataSwap(attach, &ItemMenuMode.board.unk_13C);
                BtlHaveItemPt->item_no = item_no;
                attach->item_no = held;
                swapped = 1;
            }
            break;
    }
    return swapped;
}
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawTrushItem__Fv);

/**
 * Remembers where the item page's cursor stood and closes it.
 *
 * @mangled ExitItemSelect__Fv
 * @address 0x202420
 * @size 0x88
 */
static void ExitItemSelect() {
    CommonMenuMes3.rows = 3;
    CommonMenuMes3.narrow_gaiji = 0;
    CommonMenuMes3.char_width = 11;
    AtoraNameMes.stay_frame = 0;
    AtoraNameMes.auto_pos = -1;
    CMenuCursor *cursor = SaveData->GetMenuCursor();
    if (cursor->reset_pos == 0) {
        SetCursorPos(cursor, 0, ItemMenuMode.board.unk_0C);
        cursor->mode[0] = ItemMenuMode.unk_00;
        SetCursorChara(cursor, ItemMenuMode.board.unk_04);
    }
}

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

/**
 * Opens the item page on one party member, restoring the mode it was left in.
 *
 * When the pack holds more than it can carry, the page opens on the first list that overflows
 * so the player throws something away.
 *
 * @mangled InitItemMode__Fii
 * @address 0x2025E0
 * @size 0x624
 */
static void InitItemMode(int, int chara) {
    CMenuCursor *cursor;
    int max;
    int thrown[7];

    InitPersonalBoardMode((CUserStatus *) BtlMenuStatusPt, &ItemMenuMode.board, 0, 0);
    ItemMenuMode.unk_00 = 4;
    ItemMenuMode.chara = chara;
    cursor = SaveData->GetMenuCursor();
    if (cursor->reset_pos == 0) {
        ItemMenuMode.unk_00 = cursor->mode[0];
        if (ItemMenuMode.unk_00 < 0 || ItemMenuMode.unk_00 > 4) {
            ItemMenuMode.unk_00 = 4;
        }
        max = PersonalRetMax(cursor->chara_no);
        ItemMenuMode.board.unk_0C = cursor->pos[0];
        ItemMenuMode.board.unk_18 = ItemMenuMode.board.unk_0C / 5 - 3;
        if (ItemMenuMode.board.unk_18 < 0) {
            ItemMenuMode.board.unk_18 = 0;
        }
    } else {
        ItemMenuMode.unk_00 = 4;
        ItemMenuMode.board.unk_0C = 0;
        ItemMenuMode.board.unk_18 = 0;
        max = PersonalRetMax(0);
    }
    memset(thrown, 0, sizeof(thrown));
    for (int i = 0; i < 3; i++) {
        ItemMenuMode.unk_0E[i] = 0;
    }
    ItemMenuMode.unk_0A = 0;
    ItemMenuMode.unk_0C = 0;
    if (CheckItemThrow(thrown, NULL)) {
        for (int i = 0; i < 3; i++) {
            if (thrown[i] >= 0x84) {
                ItemMenuMode.unk_0E[0]++;
            }
        }
        if (thrown[3] >= 0x101) {
            ItemMenuMode.unk_0E[1]++;
        }
        for (int i = 0; i < 3; i++) {
            if (thrown[i + 4] < 0x51) {
                break;
            }
            ItemMenuMode.unk_0E[2]++;
        }
        for (int i = 0; i < 3; i++) {
            if (ItemMenuMode.unk_0E[i] > 0) {
                ItemMenuMode.unk_0A |= 1 << (i + 1);
            }
        }
        for (int i = 2; i >= 0; i--) {
            if (ItemMenuMode.unk_0A & (1 << (i + 1))) {
                ItemMenuMode.board.unk_04 = i;
            }
        }
        if (ItemMenuMode.board.unk_04 == 1) {
            ItemMenuMode.board.unk_0C = WhoIsWeaponEquip(thrown[3]) * 10;
            ItemMenuMode.board.unk_18 = ItemMenuMode.board.unk_0C / 5;
            if (ItemMenuMode.board.unk_18 < 0) {
                ItemMenuMode.board.unk_18 = 0;
            }
            if (ItemMenuMode.board.unk_18 > 9) {
                ItemMenuMode.board.unk_18 = 9;
            }
        }
        ItemMenuMode.unk_0C = 1;
        BtlMenuStatusPt->overflow_flag = 1;
    }
    ItemMenuMode.board.unk_10 = 127 - ItemMenuMode.board.unk_18 * 40;
    int pages = max / 5;
    ItemMenuMode.board.scroll = 140.0f + 114.0f * ItemMenuMode.board.unk_18 / pages;
    ItemMenuMode.board.unk_08 = 1;
    ItemMenuMode.unk_18 = 1;
    ItemMenuMode.unk_1C = 0;
    u_long128 *buffer = BtlMenuReadBuf;
    int size;
    StartBGReadItemMenuWepIcon(buffer, size);
    buffer += (size >> 4) + 1;
    ItemMenuCharaReadBuf = MenuCalcBufAlignment(buffer);
    BtlHaveItemPt = (IHAVEITEM *) ItemMenuMode.board.unk_30;
    StartLoadCharaMDS(ItemMenuCharaReadBuf, chara, 1);
    MenuExTextureReadFlag = 0;
    memset(&IconAutoGet, -1, sizeof(IconAutoGet));
    CommonMenuMes3.Preset(4);
    CommonMenuMes3.mes_made = -1;
    CommonMenuMes3.rows = 1;
    CommonMenuMes3.char_width = 12;
    CommonMenuMes1.mes_made = -1;
    AtoraNameMes.value_signed = 0;
    AtoraNameMes.Preset(1);
    AtoraNameMes.mes_made = -1;
    AtoraNameMes.rows = 3;
    for (int i = 0; i < 10; i++) {
        AtoraNameMes.mes_no[i] = 0;
        AtoraNameMes.values[i] = 0;
        SetLinePos(&AtoraNameMes, i, -1, -1);
    }
    AtoraNameMes.char_width = GetMenuCommonFontW(BtlMenuNowLang, -1);
    int member = ItemMenuMode.chara;
    CDngStatusData *status = BtlMenuStatusPt;
    int slot = status->equipped_weapon_slot[member];
    WEAPON_HAVE *row = status->chara_weapons[member];
    WEAPON_HAVE *weapon = &row[slot];
    if (weapon != NULL) {
        SetNowEquipWeaponDataForMsg(weapon->item_no, weapon->unk_02);
    } else {
        SetNowEquipWeaponDataForMsg(0, 0);
    }
}

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

int GetNearWorldPos(int direction, int *) {
    if (direction == 0) {
        return -1;
    }
    int up;
    int down;
    int right;
    int left;
    WORLD_MAP_POS *from = &TownOrDngPos[MenuMove.unk_04];
    float dx = 0.0f;
    float dy = dx;
    up = direction & 1;
    if (up) {
        dy -= 1.0f;
    }
    down = direction & 2;
    if (down) {
        dy += 1.0f;
    }
    right = direction & 8;
    if (right) {
        dx += 1.0f;
    }
    left = direction & 4;
    if (left) {
        dx -= 1.0f;
    }
    float length = sqrt(dx * dx + dy * dy);
    if (length != 0.0f) {
        dx /= length;
    }
    if (length != 0.0f) {
        dy /= length;
    }
    MAP_JUMP_COMPARE places[16];
    for (int i = 0; i < 16; i++) {
        MAP_JUMP_COMPARE *place = &places[i];
        place->index = i;
        WORLD_MAP_POS *pos = &TownOrDngPos[i];
        if (pos->unk_06 <= 0 || i == MenuMove.unk_04) {
            place->reachable = 0;
        } else {
            place->reachable = 1;
        }
        place->dx = pos->x - from->x;
        place->dy = pos->y - from->y;
        place->distance_sq = place->dx * place->dx + place->dy * place->dy;
        float distance = sqrt(place->distance_sq);
        float nx = place->dx;
        float ny = place->dy;
        if (distance != 0.0f) {
            nx /= distance;
            ny /= distance;
        }
        place->distance = nx * dx + ny * dy;
    }
    for (int i = 0; i < 16;) {
        int swapped = 0;
        MAP_JUMP_COMPARE *place = &places[i];
        for (int j = i + 1; j < 16; j++) {
            MAP_JUMP_COMPARE *other = &places[j];
            if (place->distance < other->distance) {
                MenuDataSwap(place, other);
                swapped = 1;
                break;
            }
        }
        if (!swapped) {
            i++;
        }
    }
    int nearest = -1;
    int nearest_sq = 600000;
    for (int i = 0; i < 16; i++) {
        MAP_JUMP_COMPARE *place = &places[i];
        if (place->reachable > 0 && (!up || place->dy < 0) && (!down || place->dy > 0) && (!right || place->dx > 0) &&
            (!left || place->dx < 0) && place->distance_sq < nearest_sq) {
            nearest = place->index;
            nearest_sq = place->distance_sq;
        }
    }
    return nearest;
}

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
            NextWorldPos = TownOrDngPos[direction].frame;
            MenuMove.unk_04 = direction;
            MapMoveCursor = MenuCharaFrame.frame->SearchFrame(TownOrDngPos[MenuMove.unk_04].frame);
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

/**
 * Runs the save page and returns to the menu bar when it closes.
 *
 * @mangled BattleMenuSaveKey__Fv
 * @address 0x20AF70
 * @size 0xF4
 */
static void BattleMenuSaveKey() {
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

    MenuSaveKey();
    if (SaveMenuEffectFadeOut() != 0) {
        BtlEffectFlag = 0;
        if (transition_done != 0) {
            MenuSelect[0] = 7;
            BattleMenuFlag = 22;
            ForBackMenu();
            BattleMenuFlag = 0;
        }
    }
}

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

/**
 * Draws a current-over-maximum pair, reddening it as the value runs low.
 *
 * @mangled DrawStatusNumberNowAndMax__FPiiiii
 * @address 0x20B1B0
 * @size 0x128
 */
static void DrawStatusNumberNowAndMax(int *values, int x, int y, int color, int alpha) {
    RECT digits = NumberSprite;

    if (values[0] < 0.3f * values[1]) {
        digits.y += 12;
    }
    int end = DrawMenuNumber(values[1], x, y, StayTex, digits, color, alpha);
    DrawMenu2DSprite(StayTex, CRect_i_(end - 11, y, 12, 12), CRect_i_(0x78, digits.y, 12, 12), alpha);
    DrawMenuNumber(values[0], end - 11, y, StayTex, digits, color, alpha);
}
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
