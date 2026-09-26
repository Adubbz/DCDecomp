#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000

#include "battlemenu.hpp"

#include <cmath>
#include <cstdio>
#include <cstring>

#include "character.hpp"
#include "camera.hpp"
#include "clsmes.hpp"
#include "dataread.hpp"
#include "dngstatusdata.hpp"
#include "dun/gameloop.hpp"
#include "eastking.hpp"
#include "gamepad.hpp"
#include "itemdata.hpp"
#include "mainselect.hpp"
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
 * Is nonzero once the battle menu's textures have finished loading.
 */
extern s32 BtlMenuReadEndFlag;

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
extern RECT NumberSprite[2];

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
 * Texture block holding the item menu's weapon icons.
 */
extern s32 ItemMenuWeaponIconReadBlock;

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

/**
 * Map number of each world-map place; dungeons are numbered from 200.
 */
extern s16 MenuGrobalMapNoTbl[16];

/**
 * Save data the travel page reads visits and dungeon progress from.
 */
extern CSaveData *BtlMenuSaveDataPt;

/**
 * Whether the travel page may jump to another map, or -1 while it cannot.
 */
extern s32 MenuMapJumpMode;

/**
 * Texture the travel page draws its map with.
 */
extern CTexture *MenuMoveTex;

/**
 * Camera used to project menu models and world-map markers.
 */
extern CCamera MenuCamera;

static int GetVisitInfo(int place, int menu_mode);

#include <cstdlib>

#include "battle_globals.hpp"
#include "btactstatus.hpp"
#include "dataalloc.hpp"
#include "menuitemstep.hpp"
#include "userstatus.hpp"
#include "shot_effect.hpp"

extern CTexture *BtlAlpha;
extern CTexture *BtlHira;
extern CTexture *BtlKata;
extern s32 BtlMenuExReadBlock;
extern s32 BtlMenuManualReadBlock;
extern s32 MenuExTextureReadFlag;
extern float PosAngle;
extern s16 BtlHelpWinAlpha;
extern float HelpWinHead[2];
extern float BtlHelpWinW;
extern float BtlHelpWinH;
extern s32 BtlMenuBGMvol;
extern CTexture *ItemIcon2;
extern CTexture *AttachIcon;
extern CTexture *CharaStatus;
extern CTexture *NonCharaFace;
extern s32 BtlMDSBuildCnt;
extern u_long128 *BtlMenuCharaChangeBuf;

/* Where one party member's weapon model stands on the weapon page. */
struct MENU_WEP_POLY_OFFSET {
    float position[3];
    float scale;
    float rotation[3];
    float unk_1C[3];
};

extern MENU_WEP_POLY_OFFSET MenuWepPolyOffset[6];
extern "C" CCharacter DngWeaponFrm[12];
extern CRect_i_ MenuDispRc;
extern u_long128 Vu_prog0f;

static void DrawStatusNumberNowAndMax(int *values, int x, int y, int color, int alpha);
static void BattleMenuAppear();
static int BattleMenuExit();
static void InitItemTrushStart();
static int BattleMenuAtoraKey();
static void BattleMenuOptionKey();
static void BattleMenuSaveKey();
static void BattleManualDraw();
static void InitItemMode(int mode, int chara);
static void InitMenuChara(u_long128 *buffer);
static void InitWeaponSelect(int mode, int chara);
static int WeaponSelectKey(void);
static void WeaponMenuActWepKey();
static void WeaponMenuAttachWepKey();
static void WeaponMenuAttachKey();
extern s32 WeaponMenuSelectKeyLockFlag;
extern u_long128 *WepMenuEffectReadBuf;
extern CDataAlloc2<1> MenuExCashBuffer;
extern "C" CCharacter DefaultWeapon;
extern "C" CCharacter MainWeapon;
extern "C" CSHOT_EFFECT *NowMainEffect;
extern "C" CSHOT_EFFECT CharaMainEffectCrash;
extern s32 CharaMainHandViewFlag;
static void MenuCharaPolyDraw();
static int WorldMapMoveKey();
static void DrawWorldMap(int alpha);
extern float mapmovev[4];
extern s16 TrushMoveMax[3];

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
#ifdef NON_MATCHING
void DrawBattleMain() {
    int pos[2];
    int icons[8];

    GetMenuIconPos(MenuSelect[1], pos);
    int x = pos[0] - 0x2C;
    int y = pos[1];
    SysCur[0] += ((float) x - SysCur[0]) / 4.0f;
    SysCur[1] += ((float) y - SysCur[1]) / 4.0f;
    GetMenuModeMax();
    BtlMenuMekeIconInfo(icons, BtlMenuMode);
    MENU_ICON_INFO *info = GetMenuIconInfo(icons[MenuSelect[1]]);
    int mes_no = info->unk_24;
    if (MenuSelect[1] == 4) {
        switch (NowGetGameFlagForBtlMenu(BtlMenuMode)) {
            case 0: {
                s16 escape[3] = {0x1B, 0x1C, 0x0F};
                mes_no = escape[GetEscapeDngFlag()];
                break;
            }
            case 11:
                mes_no = 0x1D;
                break;
            case 10:
                mes_no = 0x12;
                break;
            case 1:
                mes_no = 0x11;
                break;
            case 2:
                mes_no = 0x13;
                break;
        }
    }
    if (CommonMenuMes2.mes_made != mes_no) {
        CommonMenuMes2.MakeMesWin(mes_no);
    }
    if (BtlMenuMode == 0) {
        int limit = GetLimmitMsg();
        if (CommonMenuMes1.mes_made != limit) {
            CommonMenuMes1.MakeMesWin(limit);
        }
        if (limit >= 0) {
            MenuTextureReload(CommonMenuMes1.tex_block);
            if (BtlMenuNowLang > 0) {
                CommonMenuMes1.text_x = 0x44;
                CommonMenuMes1.text_y = 0x156;
            } else {
                CommonMenuMes1.text_x = 0x50;
                CommonMenuMes1.text_y = 0x14A;
            }
            CommonMenuMes1.stay_frame = 1;
            CommonMenuMes1.Step();
            CommonMenuMes1.DrawMesWin();
        }
    }
    int width = info->unk_1C + 0x4A;
    float waku_y = NorMenuIcon[MenuSelect[1]].y - 8.0f;
    DrawMenuWaku(NorMenuIcon[MenuSelect[1]].x - 18.0f, waku_y, width, 0x22, 0, StayTex, 0x80);
    DrawMenuObjectVibe((int) SysCur[0], (int) SysCur[1], 1, 0x40);
}
#else
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawBattleMain__Fv);
#endif
#ifdef NON_MATCHING
void DrawOtherCharaStatus(int x, int y, int chara, int alpha) {
    int bar_x = x - 5;
    int bar_y = y + 3;
    if (bar_y >= 0xDD) {
        bar_y--;
    }
    CUserStatus *status = (CUserStatus *) BtlMenuStatusPt;
    float hp = status->hp[chara];
    float max_hp = status->max_hp[chara];
    if (max_hp < 1.0f) {
        max_hp = 1.0f;
    }
    WEAPON_HAVE *weapon = &status->chara_weapons[chara][status->equipped_weapon_slot[chara]];
    if (weapon == NULL) {
        return;
    }
    float whp = weapon->durability_f;
    float max_whp = weapon->durability;
    if (max_whp < 1.0f) {
        max_whp = 1.0f;
    }
    int water = (int) status->water_now[chara];
    int max_water = (int) status->water_max[chara];
    MGFillBox(CRect_i_((bar_x - 3) * 16, ((bar_y - 2) >> 1) * 16, 0x3A0, 0x30), 0x14, 0x14, 0x14, alpha);
    int hp_len = (s8) (int) (52.0f * hp / max_hp);
    MGFillBox(CRect_i_(bar_x * 16, (bar_y >> 1) * 16, 0x340, 0x20), 0x4F, 0x4F, 0x4F, alpha);
    int r = 0x4D;
    int g = 0xE7;
    int b = 0xA5;
    if (!(15.6f < hp_len)) {
        r = 0xD6;
        g = 0x76;
        b = 0xEA;
    }
    MGFillBox(CRect_i_(bar_x * 16, (bar_y >> 1) * 16, hp_len * 16, 0x20), r, g, b, alpha);
    MGFillBox(CRect_i_((bar_x + 1) * 16, ((bar_y + 4) >> 1) * 16, 0x3A0, 0x30), 0x14, 0x14, 0x14, alpha);
    float whp_len = 52.0f * whp / max_whp;
    MGFillBox(CRect_i_((bar_x + 4) * 16, ((bar_y + 6) >> 1) * 16, 0x340, 0x20), 0x4F, 0x4F, 0x4F, alpha);
    MGFillBox(CRect_i_((bar_x + 4) * 16, ((bar_y + 6) >> 1) * 16, (s8) (int) whp_len * 16, 0x20), 0xFF, 0xB1, 0x49,
              alpha);
    MGFillBox(CRect_i_((bar_x + 5) * 16, ((bar_y + 10) >> 1) * 16, 0x3A0, 0x40), 0x14, 0x14, 0x14, alpha);
    MGFillBox(CRect_i_((bar_x + 8) * 16, ((bar_y + 12) >> 1) * 16, 0x340, 0x20), 0x4F, 0x4F, 0x4F, alpha);
    MGFillBox(CRect_i_((bar_x + 8) * 16, ((bar_y + 12) >> 1) * 16, water * 0x34 / max_water * 16, 0x20), 0xC8, 0xEF,
              0xF2, alpha);
}
#else
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawOtherCharaStatus__Fiiii);
#endif
#ifdef NON_MATCHING
void DngComStatus(int x, int y, int chara, int alpha) {
    CTexture *texture = TexManager.GetTexture("charastb", -1);
    int left = x - 6;
    float scale[2] = {32.0f, 32.0f};
    CUserStatus *status = (CUserStatus *) BtlMenuStatusPt;
    float hp = status->hp[chara];
    float max_hp = status->max_hp[chara];
    if (max_hp < 1.0f) {
        max_hp = 32.0f;
    }
    WEAPON_HAVE *weapon = &status->chara_weapons[chara][status->equipped_weapon_slot[chara]];
    if (weapon == NULL) {
        return;
    }
    float max_whp = weapon->durability;
    if (max_whp < 1.0f) {
        max_whp = 32.0f;
    }
    float values[2][2] = {{hp, max_hp}, {weapon->durability_f, max_whp}};
    float full[2] = {32.0f, 32.0f};
    int colour_no[2] = {0, 3};
    if (y % 2 == 0) {
        y--;
    }
    for (int i = 0; i < 2; i++) {
        int length = (int) (148.0f * values[i][1] / full[i]);
        DrawMenu2DSprite(texture, CRect_i_(left + 0x10, y + 5, 4, 0xF), CRect_i_(0x10, 0xB0, 4, 0x10), alpha);
        DrawMenu2DSprite(texture, CRect_i_(left + 0x14, y + 5, length, 0xF), CRect_i_(0x14, 0xB0, 4, 0x10), alpha);
        DrawMenu2DSprite(texture, CRect_i_(left + 0x13 + length, y + 5, 4, 0xF), CRect_i_(0x18, 0xB0, 4, 0x10), alpha);
        int fill = (int) ((float) length * values[i][0] / values[i][1]);
        if (i == 0) {
            if (hp < 0.3f * max_hp) {
                colour_no[i]++;
            }
            if (hp < 0.15f * max_hp) {
                colour_no[i]++;
            }
        }
        GRADATION_COLOR_INFO2 colours;
        memcpy(&colours, GetGradationColorInfo2(colour_no[i]), sizeof(colours));
        colours.colors[3].a = alpha;
        colours.colors[2].a = alpha;
        colours.colors[1].a = alpha;
        colours.colors[0].a = alpha;
        CRect_i_ bar(left + 0x14, y + 6, fill, 6);
        DrawMenuColorGradation(bar, &colours.colors[0], &colours.colors[1], &colours.colors[2], &colours.colors[3]);
        int number_x = left + 0x4C + length;
        while (x + 0x9A < number_x) {
            number_x--;
        }
        int numbers[2];
        numbers[0] = GetDispVolumeForFloat(values[i][0]);
        numbers[1] = GetDispVolumeForFloat(values[i][1]);
        DrawStatusNumberNowAndMax(numbers, number_x, y + 6, 1, alpha);
        y += 0x10;
    }
    int drops = (int) status->water_max[chara] / 10;
    int drop_x = left + 0x12;
    for (int i = 0; i < drops - 1; i++) {
        DrawMenu2DSprite(texture, CRect_i_(drop_x, y + 5, 0x12, 0x13), CRect_i_(0x22, 0x9C, 0x12, 0x14), alpha);
        drop_x += 0x12;
    }
    DrawMenu2DSprite(texture, CRect_i_(drop_x, y + 5, 0x18, 0x14), CRect_i_(0x34, 0x9C, 0x18, 0x14), alpha);
    int water_alpha = (alpha * 0x50) >> 7;
    int full_drops = (int) status->water_now[chara] / 10;
    for (int i = 0; i < full_drops; i++) {
        DrawMenu2DSprite(texture, CRect_i_(left + 0x13 + i * 0x12, y, 0x10, 0x14), CRect_i_(0, 0x88, 0x10, 0x14),
                         water_alpha);
    }
    int rest = (int) status->water_now[chara] % 10;
    if (rest != 0) {
        DrawMenu2DSprite(texture, CRect_i_(left + 0x13 + full_drops * 0x12, y, 0x10, 0x14),
                         CRect_i_((3 - (int) ((float) rest / 2.5f)) * 16, 0x88, 0x10, 0x14), water_alpha);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/battlemenu", DngComStatus__Fiiii);
#endif
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @885__2);
#ifdef NON_MATCHING
void DrawSelCharaStatus(float x, float y, int chara, int alpha, int, int, int, int) {
    int u;
    int v;
    int px = (int) (x - 144.0f);
    float top = 1.0f + y;
    int py = (int) (top - 24.0f);
    CTexture *texture = TexManager.GetTexture("charastb", -1);

    DrawMenu2DSprite(texture, CRect_i_(px, py - 1, 0x100, 0x88), CRect_i_(0, 0, 0x100, 0x88), alpha);
    RECT digits = {0x40, 0x88, 0xC, 0xE};
    DrawMenuNumber(((CUserStatus *) BtlMenuStatusPt)->unk_4348[chara], px + 0x5E, py + 0x72, texture, digits, 1, alpha);
    px = (int) (x - 132.0f);
    py = (int) (10.0f + y);
    DngComStatus(px, py, chara, alpha);
    px = (int) (x - 110.0f);
    py = (int) (top - 18.0f);
    CTexture *fonts[3] = {BtlAlpha, BtlKata, BtlHira};
    CharaSelectNameDraw2(px, py, (short *) BtlMenuSaveDataPt->GetCharaName(chara), fonts, alpha);
    px = (int) (x - 118.0f - 12.0f);
    py = (int) (70.0f + y);
    WEAPON_HAVE *weapon = &((CUserStatus *) BtlMenuStatusPt)->chara_weapons[chara][((CUserStatus *) BtlMenuStatusPt)->equipped_weapon_slot[chara]];
    if (weapon != NULL) {
        CTexture *icon = RetCTex(weapon->item_no, u, v);
        if (icon != NULL) {
            WEAPON_HAVE total;
            WeaponAllValueSet(weapon, &total, 0);
            DrawMenu2DSprite(icon, CRect_i_(px + 2, py + 2, 0x20, 0x20), CRect_i_(u, v, 0x20, 0x20), alpha);
            DrawMenuNumber(total.attack, px + 0x20, py + 0x14, texture, digits, 1, alpha);
        }
    }
    px = (int) (x - 34.0f);
    py = (int) (64.0f + y);
    px = (int) (x - 40.0f);
    CharaStatusMsgDraw(px, (int) (68.0f + y), chara, 1, alpha);
}
#else
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawSelCharaStatus__Fffiiiiii);
#endif

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
void BattleMenuTexEnter() {
    LOADTEXTURE_INFO2 textures[4] = {
        {"#frame_image#640#448#4", 0, 0}, {"#dbgwork_menu#256#224#3", 0, 0}, {NULL, 0, 0}, {NULL, 0, 0}};

    textures[0].block_no = BtlMenuReadBlock;
    textures[1].block_no = BtlMenuReadBlock;
    textures[2].block_no = BtlMenuReadBlock;
    BG_READ_INFO *file = GetReadBGFile(0);
    textures[2].name = (char *) GetPackFile((u_int *) file->buffer, "btlmenu.img", NULL);
    int blocks[2] = {0, -1};
    blocks[0] = BtlMenuReadBlock;
    MenuTextureDelete(blocks);
    TexManager.CleanUpTextureList();
    TexManager.LoadTextureBlockEX(-1, textures);
    BtlMenuTexBlockEnter();
    GetAtraMsgReadBuf = (short *) GetPackFile((u_int *) file->buffer, "atrames.bin", NULL);
    short *mes = (short *) GetPackFile((u_int *) file->buffer, "allmenu.mes", NULL);
    InitMenuMesSet(0, mes);
    CommonMenuMes2.stay_frame = 0;
    BtlMenuReadEndFlag = 1;
    MenuMes.SetBuffInfo(mes);
}
void ExitBattleMenu(int) {
    int count = 0;
    s16 *item = MenuItemPackPt->item;

    for (int i = 0; i < MenuItemPackPt->num; i++, item++) {
        if (*item >= 0x84) {
            count++;
        } else {
            *item = -1;
        }
    }
    item = MenuItemPackPt->quick_item_slot;
    for (int i = 0; i < 3; i++, item++) {
        if (*item >= 0x84) {
            count += MenuItemPackPt->quick_item_qty[i];
        } else {
            *item = -1;
            MenuItemPackPt->quick_item_qty[i] = 0;
        }
    }
    MenuItemPackPt->item_count = count;
    int blocks[6] = {0, 0, 0, 0, 0, -1};
    blocks[0] = BtlMenuReadBlock;
    blocks[1] = MenuExtendReadBlock;
    blocks[2] = BtlMenuExReadBlock;
    blocks[3] = BtlMenuManualReadBlock;
    blocks[4] = MenuShadowReadBlock;
    MenuTextureDelete(blocks);
    TexManager.CleanUpBuffer();
    TexManager.CleanUpTextureList();
    ItemVolumeStep.Initialize();
    MenuWepLevelUp.CheckSnd();
    switch (BtlMenuMode) {
        case 0: {
            LOADTEXTURE_INFO2 textures[2] = {{"#frame_image0#640#448#4", 0, 0}, {NULL, 0, 0}};
            textures[0].block_no = BtlMenuReadBlock;
            TexManager.LoadTextureBlock(-1, textures);
            break;
        }
    }
    SndSetBgmVol(BtlMenuBGMvol);
    InitReadBG();
    GamePad.AutoRepeatOff();
    GamePad.MenuModeOff();
}
#ifdef NON_MATCHING
void BattleMenuInit(int *texture_blocks, int mode) {
    BtlMenuMode = mode;
    BtlMenuReadBlock = texture_blocks[0];
    MenuExtendReadBlock = texture_blocks[1];
    BtlMenuExReadBlock = texture_blocks[2];
    BtlMenuManualReadBlock = texture_blocks[3];
    ItemMenuWeaponIconReadBlock = texture_blocks[3];
    MenuShadowReadBlock = texture_blocks[4];
    BtlMenuNowLang = GetMenuLangFlag();
    GamePad.SetAutoRepeat(0xF000, 0x1E, 5);
    GamePad.MenuModeOn(0x78);
    if (BtlMenuMode == 0) {
        LOADTEXTURE_INFO2 texture = {0};
        int blocks[5] = {0, 0, 0, 0, 0};
        texture.block_no = BtlMenuReadBlock;
        blocks[0] = BtlMenuReadBlock;
        blocks[1] = MenuExtendReadBlock;
        blocks[2] = BtlMenuExReadBlock;
        blocks[3] = BtlMenuManualReadBlock;
        blocks[4] = MenuShadowReadBlock;
        MenuTextureDelete(blocks);
        TexManager.CleanUpBuffer();
        TexManager.CleanUpTextureList();
        TexManager.LoadTextureBlockEX(-1, &texture);
    }
    BtlMenuReadBuf = BtlMenuBufferSet(BtlMenuMode);
    BtlMenuReadBuf = MenuCalcBufAlignment(BtlMenuReadBuf);
    StartReadBG();
    int size = LoadFileBGMenuData("dungeon/dunmenu5.pak", BtlMenuReadBuf);
    ReadBG();
    BtlMenuReadBuf += (size >> 4) + 1;
    BtlMenuReadBuf = MenuCalcBufAlignment(BtlMenuReadBuf);
    BtlMenuExReadFlag = 1;
    BtlMenuReadEndFlag = 0;
    MenuExTextureReadFlag = 0;
    MenuMes.InitMes();
    MenuMes.unk_18 = BtlMenuReadBuf;
    printf("msg work area\n");
    BtlMenuReadBuf += 0x11;
    BtlMenuReadBuf = MenuCalcBufAlignment(BtlMenuReadBuf);
    StayTex = TexManager.GetTexture("stayframe", -1);
    WepIcon = NULL;
    ItemIcon = NULL;
    ItemIcon2 = NULL;
    AttachIcon = NULL;
    BtlMenuSaveDataPt = SaveData;
    switch (BtlMenuMode) {
        case 0:
            MenuMapJumpMode = 0;
            BtlMenuStatusPt = (CDngStatusData *) UserStatus;
            SetEscapeDngFlag(EscapeDungeonMode());
            break;
        case 1:
            MenuMapJumpMode = -1;
            BtlMenuStatusPt = SaveData->GetDngStatus();
            SetEscapeDngFlag(0);
            break;
    }
    SetInteriorOutFlag(0);
    CUserStatus *status = (CUserStatus *) BtlMenuStatusPt;
    DngWepHavePt = status->chara_weapons[0];
    MenuItemPackPt = &status->item_pack;
    MenuChara.unk_02 = 6;
    PosAngle = 6.2831855f / MenuChara.unk_02;
    ItemVolumeStep.CheckItemVolume();
    CursorVibeCnt = 0;
    BtlHelpWinAlpha = 0;
    GetMainMenuRightHelpWinLangOffset(HelpWinHead[0], HelpWinHead[1], BtlHelpWinW, BtlHelpWinH);
    BtlWakuMake2 = 1;
    MenuSelect[0] = 1;
    MenuSelect[1] = 0;
    for (int i = 0; i < 8; i++) {
        NorMenuIcon[i].x = -150.0f;
        NorMenuIcon[i].y = i * 0x28 + 0x30;
    }
    if (CheckItemThrow(NULL, NULL) != 0) {
        BattleMenuFlag = 25;
        BtlEffectFlag = -1;
        status->unk_431C = 1;
        for (int i = 1; i < 8; i++) {
            NorMenuIcon[i].x = -230.0f;
        }
        NorMenuIcon[0].x = 70.0f;
        NorMenuIcon[0].y = 28.0f;
    } else {
        BattleMenuFlag = -1;
        BtlEffectFlag = -1;
    }
    MenuChara.unk_03 = 1;
    MenuWepLevelUp.Initialize();
    BtlEffectCt = 0;
    MenuWarningMsgFlag = 0;
    BtlMenuBGMvol = SndGetBgmVol();
}
#else
INCLUDE_ASM("asm/nonmatchings/battlemenu", BattleMenuInit__FPii);
#endif
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
#ifdef NON_MATCHING
void BattleMenuDraw() {
    int text_x;
    int text_y;

    setbilinear(0);
    MenuWorldTrans(&MenuCamera);
    sceVif1PkCall(GetVif1Packet(), &Vu_prog0f, 0);
    sceVif1PkTerminate(GetVif1Packet());
    MenuTextureReload(BtlMenuReadBlock);
    CTexture frame = *TexManager.GetTexture("frame_image", -1);
    frame.tex0 &= ~((u_long) 1 << 34);
    int bright = 0x40;
    switch (BattleMenuFlag) {
        case -1:
            bright = (int) (128.0f - 4.0f * BtlEffectCt);
            if (bright < 0x40) {
                bright = 0x40;
            }
            break;
        case 28:
            bright = (int) ((float) 0x40 + 4.0f * BtlEffectCt);
            if (bright > 0x80) {
                bright = 0x80;
            }
            break;
    }
    DrawMenu2DSprite(&frame, MenuDispRc, MenuDispRc, bright, bright, bright, 0x80);
    switch (BattleMenuFlag) {
        case 0:
            DrawBattleMain();
            break;
        case 3:
        case 11:
        case 19:
        case 26:
            DrawCharaSelect();
            break;
        case 2:
        case 10:
        case 18:
            WeaponMenuDraw();
            break;
        case 1:
        case 9:
        case 17:
            ItemMenuModeDraw();
            break;
        case 4:
        case 12:
        case 20:
            DrawBtlAtoraSelect();
            break;
        case 5:
        case 13:
        case 21:
            DrawMenuMove();
            break;
        case 6:
        case 14:
        case 22:
            BtlDrawOption();
            break;
        case 7:
        case 15:
        case 23:
            BtlDrawSave();
            break;
        case 8:
        case 16:
        case 24:
            BattleManualDraw();
            break;
    }
    CursorVibeCnt++;
    if (CursorVibeCnt >= 0x405F7E00) {
        CursorVibeCnt = 0;
    }
    int draw_help = BtlMenuDrawSpecialFlag(BtlWakuMake2);
    if (BtlMenuReadEndFlag != 0) {
        if (BattleMenuFlag != 28) {
            BtlHelpWinAlpha += 9;
            if (BtlHelpWinAlpha > 0x80) {
                BtlHelpWinAlpha = 0x80;
            }
        } else {
            BtlHelpWinAlpha -= 8;
            if (BtlHelpWinAlpha < 0) {
                BtlHelpWinAlpha = 0;
            }
        }
        if (draw_help != 0) {
            int help_x = (int) HelpWinHead[0];
            MenuHelpWinDraw(help_x, (int) HelpWinHead[1], BtlHelpWinW, BtlHelpWinH, BtlHelpWinAlpha);
        }
    }
    MenuTextureReload(CommonMenuMes2.tex_block);
    GetMainMenuRightHelpMsgLangOffset(text_x, text_y);
    CommonMenuMes2.text_x = (int) (HelpWinHead[0] + text_x);
    CommonMenuMes2.text_y = (int) (HelpWinHead[1] + text_y);
    if (BtlMenuReadEndFlag != 0 && draw_help != 0) {
        CommonMenuMes2.stay_frame = 0;
        CommonMenuMes2.edge_alpha = BtlHelpWinAlpha;
        CommonMenuMes2.Step();
        CommonMenuMes2.DrawMesWin();
    }
    setbilinear(0);
    if (BtlMenuDrawSpecialFlag(1) != 0) {
        DrawBtlMenuBar();
    }
    if (WepMenu.unk_02 != 5) {
        MenuWepLevelUp.Step();
        MenuWepLevelUp.Draw();
    }
    if (GetInteriorOutFlag() != 0) {
        BtlEffectCt += 1.0f;
        int fade = (int) (3.0f * BtlEffectCt);
        if (fade > 0x80) {
            fade = 0x80;
        }
        AllFadeForMenu(fade);
    }
    setbilinear(1);
}
#else
INCLUDE_ASM("asm/nonmatchings/battlemenu", BattleMenuDraw__Fv);
#endif
int BattleMenuCursor() {
    int result;

    ReadBG();
    ((CUserStatus *) BtlMenuStatusPt)->Step(1);
    ItemVolumeStep.LoopStep(0x3C);
    ItemVolumeStep.CheckItemVolume();
    result = 1;
    switch (BattleMenuFlag) {
        case -1:
            BattleMenuAppear();
            break;
        case 28:
            result = BattleMenuExit();
            break;
        case 0:
            result = BattleMenuSelect();
            break;
        case 2:
        case 10:
        case 18:
            WeaponMenuSelect();
            break;
        case 25:
            InitItemTrushStart();
            break;
        case 1:
        case 9:
        case 17:
            ItemMenuMainKey();
            break;
        case 3:
        case 11:
        case 19:
        case 26:
            result = BattleMenuCharaKey();
            break;
        case 4:
        case 12:
        case 20:
            BattleMenuAtoraKey();
            break;
        case 5:
        case 13:
        case 21:
            result = MenuMoveKey();
            break;
        case 6:
        case 14:
        case 22:
            BattleMenuOptionKey();
            break;
        case 7:
        case 15:
        case 23:
            BattleMenuSaveKey();
            break;
        case 8:
        case 16:
        case 24:
            BattleManualKey();
            break;
    }
    MenuWepLevelUp.StepSnd();
    switch (BtlMenuMode) {
        case 0:
            SetEscapeDngFlag(EscapeDungeonMode());
            break;
    }
    return result;
}

/**
 * Slides the bar icons into place and opens the menu once they have all arrived.
 *
 * @mangled BattleMenuAppear__Fv
 * @address 0x1F68C0
 * @size 0x17C
 */
static void BattleMenuAppear() {
    int arrived = 0;
    int i;
    int position[2];

    for (i = 0; i < GetMenuModeMax(); i++) {
        GetMenuIconPos(i, position);
        float x = NorMenuIcon[i].x;
        float dx = position[0] - x;
        NorMenuIcon[i].x = x + dx / 4.0f;
        NorMenuIcon[i].y += (position[1] - NorMenuIcon[i].y) / 4.2f;
        if (dx < 3.4f) {
            NorMenuIcon[i].x = position[0];
            arrived++;
        }
    }
    BtlEffectCt += 1.0f;
    if (!(BtlEffectCt < 19.0f)) {
        BtlEffectCt = 19.0f;
    }
    int reading = ReadBGSync();
    if (arrived >= 6 && reading == 0) {
        BattleMenuTexEnter();
        BtlMenuReadEndFlag = 1;
        BtlEffectCt = 0.0f;
        BtlEffectFlag = -1;
        BattleMenuFlag = 0;
        MenuSelect[0] = 1;
        MenuSelect[1] = 0;
        SysCur[0] = 64.0f;
        SysCur[1] = 54.0f;
    }
}

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
int BattleMenuSelect() {
    if (MenuWarningMsgFlag != 0) {
        if (GamePad.Down(0x60) != 0) {
            MenuWarningMsgFlag = 0;
        }
        return 1;
    }
    int old = MenuSelect[1];
    int max = GetMenuModeMax();
    if (GamePad.Down(0x9000) != 0) {
        MenuSelect[1]--;
        if (MenuSelect[1] < 0) {
            MenuSelect[1] = max - 1;
        }
    }
    if (GamePad.Down(0x6000) != 0) {
        MenuSelect[1]++;
        if (MenuSelect[1] > max - 1) {
            MenuSelect[1] = 0;
        }
    }
    if (old != MenuSelect[1]) {
        ComMenuSePlay(0);
    }
    if (GamePad.Down(0x40) != 0) {
        int pages[2][8] = {{1, 2, 3, 4, 5, 6, 8, 0}, {1, 2, 3, 4, 5, 7, 6, 8}};
        MenuSelect[0] = pages[BtlMenuMode][MenuSelect[1]];
        CommonMenuMes1.stay_frame = 0;
        CUserStatus *status = (CUserStatus *) BtlMenuStatusPt;
        int chara = status->cur_chara;
        u_long128 *buffer = BtlMenuReadBuf;
        switch (MenuSelect[0]) {
            case 3:
                if (BtlMenuMode == 0) {
                    int zone = status->res_limit_zone_current;
                    if (zone < 6 && zone >= 0) {
                        ComMenuSePlay(2);
                        return 1;
                    }
                }
                InitMenuChara(buffer);
                break;
            case 2:
                InitWeaponSelect(0, chara);
                break;
            case 1:
                InitItemMode(0, chara);
                break;
            case 4: {
                int blocks[2] = {0, 0};
                blocks[0] = BtlMenuReadBlock;
                blocks[1] = MenuExtendReadBlock;
                int map = 0;
                switch (BtlMenuMode) {
                    case 0:
                        map = status->cur_georama;
                        if (map < 0) {
                            map = 0;
                        }
                        if (map >= 6) {
                            map = 0;
                        }
                        break;
                    case 1:
                        map = GetNowMapTransAtraMap(MapNo);
                        if (map < 0 || map > 5) {
                            map = 0;
                        }
                        break;
                }
                InitMenuAtora1(BtlMenuMode, map, blocks, buffer);
                InitMenuAtoraSelect(map);
                break;
            }
            case 5: {
                int flag = NowGetGameFlagForBtlMenu(BtlMenuMode);
                switch (flag) {
                    case 11:
                        ComMenuSePlay(2);
                        return 1;
                    default:
                    case 1:
                    case 10:
                    case 2:
                    case 0:
                        InitMenuMove(flag, MenuExtendReadBlock, buffer);
                        BtlWakuMake2 = 0;
                        break;
                }
                break;
            }
            case 6:
                InitMenuOption(1, MenuExtendReadBlock, buffer);
                break;
            case 7:
                BtlWakuMake2 = 0;
                InitMenuSave(1, MenuExtendReadBlock, buffer);
                break;
            case 8: {
                BtlWakuMake2 = 0;
                int blocks[3] = {0, 0, 0};
                blocks[0] = MenuExtendReadBlock;
                blocks[1] = BtlMenuExReadBlock;
                blocks[2] = BtlMenuManualReadBlock;
                BattleManualInit(blocks, buffer);
                break;
            }
        }
        BattleMenuFlag = MenuSelect[0] + 8;
        BtlEffectFlag = 1;
        BtlEffectCt = 0;
        ComMenuSePlay(1);
    } else if (GamePad.Down(0x20) != 0) {
        ComMenuSePlay(2);
        BattleMenuFlag = 28;
    }
    return 1;
}
int ToFromSelect(int out) {
    if (out < 0 || out > 1) {
        return -1;
    }
    int home[8][2] = {{70, 28}, {100, 48}, {86, 38}, {50, 40}, {90, 40}, {94, 30}, {80, 40}, {70, 28}};
    int pos[2];
    float hide_x = -224.0f;
    if (BtlMenuNowLang > 0) {
        hide_x = -258.0f;
    }
    int done = 0;
    int arrived = 0;
    for (int i = 0; i < GetMenuModeMax(); i++) {
        int axes = 0;
        if (out != 0) {
            GetMenuIconPos(i, pos);
        } else if (i != MenuSelect[1]) {
            pos[0] = (int) hide_x;
            pos[1] = i * 0x28 + 0x48;
        } else {
            pos[0] = home[i][0];
            pos[1] = home[i][1];
        }
        float dx = (float) pos[0] - NorMenuIcon[i].x;
        float dy = (float) pos[1] - NorMenuIcon[i].y;
        NorMenuIcon[i].x += dx / 4.0f;
        NorMenuIcon[i].y += dy / 4.0f;
        if ((float) abs((int) dx) < 2.0f) {
            NorMenuIcon[i].x = pos[0];
            axes++;
        }
        if ((float) abs((int) dy) < 2.0f) {
            NorMenuIcon[i].y = pos[1];
            axes++;
        }
        if (axes >= 2) {
            arrived++;
        }
    }
    if (arrived >= 6) {
        done = 1;
    }
    return done;
}

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
#ifdef NON_MATCHING
int BattleMenuCharaKey() {
    CUserStatus *status = (CUserStatus *) BtlMenuStatusPt;

    switch (MenuChara.unk_03) {
        case 4:
            MenuChara.unk_08 += 1.0f;
            if (ReadBGSync() == 0 && MenuChara.unk_08 > 20.0f) {
                BtMenuLoadChara();
                BreakReadBG();
                StartReadBG();
                CharaChangeInitToGL2(1);
                MenuChara.unk_03 = 5;
            }
            break;
        case 5:
            MenuChara.unk_08 += 1.0f;
            if (ReadBGSync() == 0 && MenuChara.unk_08 > 20.0f) {
                BtMenuLoad2(1);
                LockOffTargte();
                ExitBattleMenu(1);
                return 0;
            }
            break;
        case 1: {
            if (BtlMenuExReadFlag == 0) {
                if (ReadBGSync() != 0) {
                    return 1;
                }
                LOADTEXTURE_INFO2 texture = {0};
                int blocks[2] = {0, 0};
                texture.block_no = BtlMenuExReadBlock;
                BG_READ_INFO *file = GetReadBGFile(0);
                texture.name = (char *) file->buffer;
                BtlMenuCharaChangeBuf = file->buffer + (file->size >> 4) + 1;
                BtlMenuCharaChangeBuf = MenuCalcBufAlignment(BtlMenuCharaChangeBuf);
                blocks[0] = BtlMenuExReadBlock;
                MenuTextureDelete(blocks);
                TexManager.CleanUpTextureList();
                TexManager.LoadTextureBlockEX(-1, &texture);
                BtlMenuTexBlockEnter();
                MenuCharaFace = TexManager.GetTexture("charaface", BtlMenuExReadBlock);
                BtStatus = TexManager.GetTexture("btstatus2", BtlMenuExReadBlock);
                NonCharaFace = TexManager.GetTexture("nonchara", BtlMenuExReadBlock);
                BtlAlpha = TexManager.GetTexture("alphabet", BtlMenuExReadBlock);
                BtlHira = TexManager.GetTexture("hira", BtlMenuExReadBlock);
                BtlKata = TexManager.GetTexture("kata", BtlMenuExReadBlock);
                BtlMenuExReadFlag = 1;
            }
            int done = ToFromSelect(0);
            if (BtlMenuExReadFlag != 0) {
                MenuChara.unk_04 += 1.0f;
            }
            if (!(MenuChara.unk_04 < 20.0f)) {
                MenuChara.unk_04 = 20.0f;
            }
            if (!(MenuChara.unk_04 < 20.0f) && done == 1 && BtlMenuExReadFlag != 0) {
                MenuCharaMove = 0.0f;
                MenuChara.unk_03 = 0;
                MenuChara.unk_04 = 0.0f;
                BattleMenuFlag = 3;
            }
            break;
        }
        case 2: {
            int done = ToFromSelect(1);
            MenuChara.unk_04 += 1.0f;
            if (!(MenuChara.unk_04 <= 20.0f) && done == 1) {
                int blocks[2] = {0, 0};
                ForBackMenu();
                blocks[0] = BtlMenuExReadBlock;
                MenuTextureDelete(blocks);
                TexManager.CleanUpTextureList();
                BtlMenuTexBlockEnter();
                MenuCharaFace = TexManager.GetTexture("charaface", BtlMenuReadBlock);
                BtStatus = TexManager.GetTexture("btstatus2", BtlMenuReadBlock);
                BattleMenuFlag = 0;
            }
            break;
        }
        case 3:
            MenuChara.unk_04 += 1.0f;
            if (!(MenuChara.unk_04 < 21.0f)) {
                if (!(MenuCharaMove <= 0.0f)) {
                    for (int i = 0; i < MenuChara.unk_02; i++) {
                        SysChara[i].unk_01++;
                        if (MenuChara.unk_02 == SysChara[i].unk_01) {
                            SysChara[i].unk_01 = 0;
                        }
                    }
                } else {
                    for (int i = 0; i < MenuChara.unk_02; i++) {
                        SysChara[i].unk_01--;
                        if (SysChara[i].unk_01 == -1) {
                            SysChara[i].unk_01 = MenuChara.unk_02 - 1;
                        }
                    }
                }
                for (int i = 0; i < 6; i++) {
                    if (SysChara[i].unk_01 == 0) {
                        int chara = SysChara[i].unk_00;
                        int mes_no = chara + 0x1E;
                        if (status->party_size - 1 < chara) {
                            mes_no = 0x27;
                        }
                        if (CommonMenuMes2.mes_made != mes_no) {
                            CommonMenuMes2.MakeMesWin(mes_no);
                        }
                    }
                }
                MenuChara.unk_03 = 0;
                MenuChara.unk_04 = 0.0f;
                MenuCharaMove = 0.0f;
            }
            break;
        case 6:
            if (GamePad.Down(0x60) != 0) {
                MenuChara.unk_03 = 0;
                ComMenuSePlay(1);
            }
            break;
        case 0: {
            int old = MenuChara.unk_00;
            if (GamePad.On(0x3000) != 0) {
                MenuCharaMove = PosAngle / 20.0f;
                MenuChara.unk_03 = 3;
                MenuChara.unk_04 = 0.0f;
                MenuChara.unk_00--;
                if (MenuChara.unk_00 < 0) {
                    MenuChara.unk_00 = 5;
                }
                ComMenuSePlay(0);
            } else if (GamePad.On(0xC000) != 0) {
                MenuCharaMove = -PosAngle / 20.0f;
                MenuChara.unk_03 = 3;
                MenuChara.unk_04 = 0.0f;
                MenuChara.unk_00++;
                if (MenuChara.unk_00 >= 6) {
                    MenuChara.unk_00 = 0;
                }
                ComMenuSePlay(0);
            } else if (GamePad.Down(0x20) != 0) {
                BattleMenuFlag = 19;
                MenuChara.unk_03 = 2;
                MenuChara.unk_04 = 0.0f;
                BtlEffectFlag = 0;
                BtlEffectCt = 0;
                ComMenuSePlay(2);
            } else if (GamePad.Down(0x40) != 0) {
                if (BtlMenuMode != 0) {
                    ComMenuSePlay(2);
                } else {
                    s8 cur = status->cur_chara;
                    if (cur == 5 && BtActStatus.unk_092 == 10) {
                        CommonMenuMes1.MakeMesWin(0x1A1);
                        ComMenuSePlay(2);
                    } else {
                        for (int i = 0; i < MenuChara.unk_02; i++) {
                            if (SysChara[i].unk_01 != 0) {
                                continue;
                            }
                            int chara = SysChara[i].unk_00;
                            if (status->party_size - 1 < chara) {
                                ComMenuSePlay(2);
                                return 1;
                            }
                            if (status->hp[chara] <= 0 || (status->unk_42C8[chara] & 2)) {
                                ComMenuSePlay(2);
                                return 1;
                            }
                            if (chara != cur) {
                                status->cur_chara = chara;
                                ComMenuSePlay(1);
                                MenuChara.unk_03 = 4;
                                MenuChara.unk_08 = 0.0f;
                                return 1;
                            }
                        }
                    }
                }
            }
            if (old != MenuChara.unk_00 && MenuChara.unk_00 < status->party_size && BtlMenuCharaChangeBuf != NULL &&
                BtlMenuMode == 0) {
                BreakReadBG();
                CharaChangeInitToGL(BtlMenuCharaChangeBuf, MenuChara.unk_00);
            }
            break;
        }
    }
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/battlemenu", BattleMenuCharaKey__Fv);
#endif
#ifdef NON_MATCHING
void DrawCharaSelect() {
    CUserStatus *status = (CUserStatus *) BtlMenuStatusPt;

    if (BtlMenuExReadFlag == 0) {
        return;
    }
    int bright = 0x80;
    int ring_alpha = 0x80;
    switch (MenuChara.unk_03) {
        case 1:
            bright = (int) (10.0f * MenuChara.unk_04);
            ring_alpha = bright;
            break;
        case 2:
            bright = (int) (128.0f - 12.0f * MenuChara.unk_04);
            ring_alpha = bright;
            break;
        case 5:
        case 4:
            bright = 0x80 - (int) MenuChara.unk_08 * 3;
            ring_alpha = 0x80 - (int) MenuChara.unk_08 * 10;
            break;
    }
    if (ring_alpha > 0x80) {
        ring_alpha = 0x80;
    }
    if (ring_alpha < 0) {
        ring_alpha = 0;
    }
    if (bright < 0) {
        bright = 0;
    }
    MenuTextureReload(BtlMenuExReadBlock);
    sceGsAlpha blend = mgAlpha;
    blend.bits.a = 0;
    blend.bits.b = 2;
    blend.bits.c = 0;
    blend.bits.d = 1;
    MGSetGsALPHA(&blend);
    DrawMenu2DSprite(TexManager.GetTexture("dgring", -1), CRect_i_(0x12A, 0x32, 0x118, 0x118), CRect_i_(0, 0, 0x80, 0x80),
                     (ring_alpha * 0x8C) >> 7);
    MGSetGsALPHA(NULL);
    switch (MenuChara.unk_03) {
        case 1:
            for (int i = 0; i < MenuChara.unk_02; i++) {
                float radius = chara_r_long / 20.0f * MenuChara.unk_04;
                float angle = 3.1415927f + PosAngle * SysChara[i].unk_01;
                SysChara[i].unk_04 = radius * cosf(angle);
                SysChara[i].unk_08 = radius * sinf(angle);
            }
            break;
        case 3:
            for (int i = 0; i < MenuChara.unk_02; i++) {
                float radius = chara_r_long;
                float angle = 3.1415927f + (PosAngle * SysChara[i].unk_01 + MenuCharaMove * MenuChara.unk_04);
                SysChara[i].unk_04 = radius * cos(angle);
                SysChara[i].unk_08 = radius * sin(angle);
            }
            break;
        case 4:
        case 5:
            chara_r_long += MenuChara.unk_08;
            for (int i = 0; i < MenuChara.unk_02; i++) {
                float radius = chara_r_long;
                float angle = 3.1415927f + PosAngle * SysChara[i].unk_01;
                SysChara[i].unk_04 = radius * cos(angle);
                SysChara[i].unk_08 = radius * sin(angle);
            }
            break;
    }
    for (int i = 0; i < MenuChara.unk_02; i++) {
        SYS_CHARA_INFO *chara = &SysChara[i];
        float face_x = 394.0f + chara->unk_04;
        float draw_x = face_x;
        float face_y = 120.0f + chara->unk_08;
        float size = 90.0f;
        int face_alpha = bright;
        int status_alpha = bright;
        int panel_alpha = 0;
        float move = MenuCharaMove;
        if ((!(move <= 0.0f) && MenuChara.unk_02 - 1 == chara->unk_01) || (move < 0.0f && chara->unk_01 == 1)) {
            float step = 0.6666667f * MenuChara.unk_04;
            draw_x = face_x - step;
            size = 90.0f + step;
            panel_alpha = (int) (128.0f * MenuChara.unk_04 / 21.0f);
            status_alpha = 0x80 - panel_alpha;
        }
        if (chara->unk_01 == 0) {
            float time = MenuChara.unk_04;
            float scale = 0.6666667f;
            draw_x = face_x + scale * (time - 20.0f - 1.0f);
            float grow = scale * time;
            size = 106.0f - grow;
            status_alpha = (int) ((float) bright * time / 21.0f);
            if (move == 0.0f) {
                face_alpha = 0x80;
                panel_alpha = 0x80;
            } else if (MenuChara.unk_03 == 3) {
                panel_alpha = (int) (128.0f - 10.0f * time);
            }
            if (MenuChara.unk_03 == 2 || MenuChara.unk_03 == 1 || MenuChara.unk_03 == 4 || MenuChara.unk_03 == 5) {
                size += grow;
                draw_x -= grow;
                status_alpha = 0;
                face_alpha = bright;
                panel_alpha = bright;
            }
        }
        int draw_face = 1;
        if (i < status->party_size) {
            if (status_alpha > 0x80) {
                status_alpha = 0x80;
            }
            if (status_alpha < 0) {
                status_alpha = 0;
            }
            DrawOtherCharaStatus((int) (23.0f + face_x), (int) (86.0f + face_y), i, status_alpha);
            float panel_x = 394.0f + chara->unk_04 - 29.0f;
            float panel_y = 120.0f + chara->unk_08 - 3.0f;
            if (panel_alpha > 0x80) {
                panel_alpha = 0x80;
            }
            if (panel_alpha < 0) {
                panel_alpha = 0;
            }
            if (!(panel_x < -300.0f) && !((float) 0x28A < panel_x) && !(face_y < -130.0f) && !(face_y > 448.0f)) {
                MenuTextureReload(BtlMenuExReadBlock);
                DrawSelCharaStatus(panel_x, panel_y, i, panel_alpha, (int) size, face_alpha, (int) draw_x, (int) face_y);
            } else {
                draw_face = 0;
            }
        }
        if (draw_face == 0) {
            continue;
        }
        MenuTextureReload(BtlMenuExReadBlock);
        CTexture *face = MenuCharaFace;
        int u = 0;
        int width = 0x6A;
        int v = i * 0x6A;
        if (i >= 3) {
            u = 0x6A;
            v = (i - 3) * 0x6A;
        }
        int shade = 0x80;
        if (status->hp[i] <= 0 || (status->unk_42C8[i] & 2)) {
            shade = 0x50;
        }
        if (i >= status->party_size) {
            face = NonCharaFace;
            if (chara->unk_01 == 0) {
                face = TexManager.GetTexture("nonchara2", -1);
                v = 0xC;
                u = 0xC;
                width = 0x6A;
            } else {
                v = 0x13;
                u = 0x13;
                width = 0x5A;
                size -= 1.0f;
            }
            shade = 0x80;
        }
        if (face_alpha > 0x80) {
            face_alpha = 0x80;
        }
        if (face_alpha < 0) {
            face_alpha = 0;
        }
        if (MenuChara.unk_03 == 5 || MenuChara.unk_03 == 4) {
            face_alpha = 0x80 - (int) MenuChara.unk_08 * 2;
            if (face_alpha < 0) {
                face_alpha = 0;
            }
        }
        if (draw_x > 0.0f && draw_x < 640.0f && face_y > 0.0f && face_y < 448.0f) {
            DrawMenu2DSprite(face, CRect_i_((int) draw_x, (int) face_y, (int) size, (int) size), CRect_i_(u, v, width, width),
                             shade, shade, shade, face_alpha);
        }
    }
    CommonMenuMes1.auto_pos = -1;
    CommonMenuMes1.stay_frame = 0;
    switch (MenuChara.unk_03) {
        case 6:
            AllFadeForMenu(0x40);
            CommonMenuMes1.auto_pos = 5;
            CommonMenuMes1.stay_frame = 1;
            CommonMenuMes1.Step();
            CommonMenuMes1.DrawMesWin();
            return;
        case 5:
        case 4:
        case 2:
        case 1:
            return;
        default: {
            float waku_x = 394.0f + chara_r_long * cosf(3.1415927f) - 184.0f;
            float waku_y = 120.0f + chara_r_long * sinf(3.1415927f) - 26.0f;
            int width = 0x102;
            int cursor_x = 0x3C;
            int i;
            for (i = 0; i < 6; i++) {
                if (SysChara[i].unk_01 == 0) {
                    break;
                }
            }
            if (SysChara[i].unk_00 >= status->party_size) {
                cursor_x = 0xA0;
                waku_x = (float) (0x18A + chara_r_long * cos(3.1415927f) - 30.0);
                width = 0x6E;
            }
            SysCur[0] += ((float) cursor_x - SysCur[0]) / 4.0f;
            int draw_x = (int) SysCur[0];
            DrawMenuWaku(waku_x, waku_y, width, 0x82, 1, StayTex, 0x80);
            DrawMenuObjectVibe(draw_x, (int) SysCur[1], 1, 0x40);
            break;
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawCharaSelect__Fv);
#endif
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @1665);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @1668);
#ifdef NON_MATCHING
void DrawWepDamageDraw(RECT rect, WEAPON_HAVE *weapon, int alpha) {
    static int warningcnt = 0;
    RECT pos = rect;
    int y = pos.y;
    int durability = weapon->durability;
    int now = GetDispVolumeForFloat(weapon->durability_f);
    int max_exp = GetWeaponMaxExp(weapon);
    int exp = weapon->unk_14;

    if (max_exp < exp) {
        exp = max_exp;
    }
    if (exp < 0) {
        exp = 0;
    }
    if (max_exp <= 0) {
        max_exp = 99;
    }
    int exp_len = exp * 99 / max_exp;
    DrawMenu2DSprite(WepStatus, CRect_i_(pos.x, y, durability, 8), CRect_i_(0x100, 0x70, 8, 8), alpha);
    warningcnt++;
    if (weapon->durability_f <= 0.1f * weapon->durability || max_exp == exp) {
        abs((int) (60.0f * sinf((float) warningcnt / 18.0f)));
        warningcnt++;
        if (warningcnt > 1000000) {
            warningcnt = 0;
        }
    }
    MGFillBox(CRect_i_(pos.x * 16, ((y - 1) >> 1) * 16, (durability + 1) * 16, 0x50), 0x4F, 0x4F, 0x4F, alpha);
    GRADATION_COLOR_INFO2 colours;
    memcpy(&colours, GetGradationColorInfo2(25), sizeof(colours));
    colours.colors[3].a = alpha;
    colours.colors[2].a = alpha;
    colours.colors[1].a = alpha;
    colours.colors[0].a = alpha;
    CRect_i_ bar(pos.x, y, now, 8);
    DrawMenuColorGradation(bar, &colours.colors[0], &colours.colors[1], &colours.colors[2], &colours.colors[3]);
    int number_y = y + pos.height;
    RECT digits = {0xD4, 0x1F4, 0xC, 0xD};
    int number_x = pos.x + pos.width;
    DrawMenuNumber(durability, number_x, number_y, WepStatus, digits, 1, alpha);
    DrawMenu2DSprite(WepStatus, CRect_i_(number_x - 0x20, number_y, 0xC, 0xB), CRect_i_(digits.x + 0x78, digits.y, 0xC, 0xC),
                     alpha);
    DrawMenuNumber(now, number_x - 0x20, number_y, WepStatus, digits, 1, alpha);
    pos.y += 0x14;
    y = pos.y;
    DrawMenu2DSprite(WepStatus, CRect_i_(pos.x, y, exp_len, 8), CRect_i_(0x100, 0x78, 8, 8), alpha);
    int digits_count = GetNumberKeta(max_exp);
    number_y = y + pos.height;
    number_x = pos.x + digits_count * 0x18;
    DrawMenuNumber(max_exp, number_x, number_y, WepStatus, digits, 1, alpha);
    number_x -= digits_count * 0x10;
    DrawMenu2DSprite(WepStatus, CRect_i_(number_x, number_y, 0xC, 0xB), CRect_i_(digits.x + 0x78, digits.y, 0xC, 0xC),
                     alpha);
    DrawMenuNumber(exp, number_x, number_y, WepStatus, digits, 1, alpha);
}
#else
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawWepDamageDraw__F4RECTP11WEAPON_HAVEi);
#endif
void DrawWepStatus(int x, int y, WEAPON_HAVE *weapon, int selected, int alpha) {
    int v = 0;

    if (selected != 0) {
        v += 0x34;
    }
    DrawMenu2DSprite(WepStatus, CRect_i_(x, y + 1, 0xAC, 0x33), CRect_i_(0xD4, v, 0xAC, 0x34), alpha);
    RECT rect = {0, 0, 0x30, -7};
    rect.x = x + 0x3E;
    rect.y = y + 0xF;
    DrawWepDamageDraw(rect, weapon, alpha);
}
void DrawWepVolumeDisplay(int x, int y, WEAPON_HAVE *weapon, int alpha) {
    WEAPON_DATA *data = GetWeaponData(weapon->item_no);
    if (data == NULL) {
        return;
    }
    WEAPON_HAVE total;
    WeaponAllValueSet(weapon, &total, 0);
    CRect_i_ source(0x110, 0xCC, 0x10, 0x10);
    CRect_i_ dest(x, y, source.width, source.height);
    RECT digits = {0xD4, 0x1F4, 0xC, 0xD};
    if (weapon->best_elem < 5) {
        DrawMenu2DSprite(MenuCharaFace, CRect_i_(x, y - 0x10, 0x20, 0x10), CRect_i_(0xE0, weapon->best_elem * 16, 0x20, 0x10), alpha);
    }
    int values[4] = {0, 0, 0, 0};
    values[0] = total.attack;
    values[1] = total.endurance;
    values[2] = total.speed;
    values[3] = total.magic;
    float rate = GetNowWeaponRate(&total);
    int limit[4] = {data->attack_max, 99, 99, data->magic_max};
    limit[0] = (int) ((float) limit[0] * rate);
    limit[3] = (int) ((float) limit[3] * rate);
    for (int i = 0; i < 4; i++, dest.y += source.height, source.y += source.height) {
        if (limit[i] < values[i]) {
            values[i] = limit[i];
        }
        DrawMenu2DSprite(WepStatus, dest, source, alpha);
        DrawMenuNumber(values[i], dest.x + source.width + digits.width * 3 - 2, dest.y + 2, WepStatus, digits, 1, alpha);
    }
}

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

void DrawWeaponStatusWaku(int x, int y, int width, int limit) {
    spRGBA colours[2][2] = {{{0x3B, 0x68, 0x56, 0x80}, {0x3B, 0x68, 0x56, 0x80}}, {{0x00, 0x00, 0xE6, 0x80}, {0x00, 0x00, 0xE6, 0x80}}};
    CRect_i_ rect(x - 1, y - 1, width + 2, 10);
    DrawMenuSideGradation(rect, &colours[limit][0], &colours[limit][1]);
}

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

void DrawBtlMenuLRCursor(int x, int y, int width, int alpha) {
    int count = CursorVibeCnt % 79;
    double pi = 3.1415927f;
    int draw_y = (int) ((float) y + 4.0f * sinf((float) (pi * ((double) count - 40.0) / 40.0)));
    CRect_i_ source(0x62, 0x14, 0x1A, 0x18);
    DrawMenu2DSprite(PerBoardTex, CRect_i_(x, draw_y, source.width, source.height), source, alpha);
    source.x += source.width;
    DrawMenu2DSprite(PerBoardTex, CRect_i_(x + width, draw_y, source.width, source.height), source, alpha);
}
#ifdef NON_MATCHING
void DrawWeaponStatusTag(int x, int y, WEAPON_HAVE *weapon, int build, int weapon_no, int alpha) {
    WEAPON_DATA *built = NULL;
    if (build == 1) {
        built = GetWeaponData(weapon_no);
    }
    RECT pos = {0, 0, 0x1E, -8};
    pos.x = x + 0x4B;
    pos.y = y + 0x30;
    float now = weapon->durability_f;
    int durability = weapon->durability;
    int number_x = pos.x;
    int bar_y = pos.y;
    int shown = (int) now;
    if ((float) shown < now) {
        shown = (int) (1.0f + now);
    }
    int full = durability * 0x7E / 99;
    int fill = shown * full / durability;
    if (fill >= 0x7E) {
        fill = 0x7E;
    }
    MGFillBox(CRect_i_(pos.x * 16, (bar_y >> 1) * 16, full * 16, 0x40), 0x4F, 0x4F, 0x4F, alpha);
    GRADATION_COLOR_INFO2 colours;
    memcpy(&colours, GetGradationColorInfo2(25), sizeof(colours));
    colours.colors[3].a = alpha;
    colours.colors[2].a = alpha;
    colours.colors[1].a = alpha;
    colours.colors[0].a = alpha;
    CRect_i_ bar(pos.x, bar_y, fill, 8);
    DrawMenuColorGradation(bar, &colours.colors[0], &colours.colors[1], &colours.colors[2], &colours.colors[3]);
    int number_y = bar_y + pos.height;
    for (int digits = GetNumberKeta(durability) - 1; digits > 0; digits--) {
        number_x += pos.width;
    }
    DrawMenuNumber(weapon->durability, number_x, number_y, WepStatus, WeaponVolumeNumberRect, 1, alpha);
    DrawMenu2DSprite(WepStatus, CRect_i_(number_x - 0x20, number_y, 0xC, 0xB),
                     CRect_i_(WeaponVolumeNumberRect.x + 0x78, WeaponVolumeNumberRect.y, 0xC, 0xC), alpha);
    DrawMenuNumber(shown, number_x - 0x20, number_y, WepStatus, WeaponVolumeNumberRect, 1, alpha);
    pos.y += 0x18;
    number_x = pos.x;
    bar_y = pos.y;
    int max_exp = GetWeaponMaxExp(weapon);
    int exp_len = (weapon->unk_14 << 7) / max_exp;
    if (exp_len >= 0x7F) {
        exp_len = 0x7E;
    }
    DrawMenu2DSprite(WepStatus, CRect_i_(pos.x, bar_y, exp_len, 8), CRect_i_(0x100, 0x78, 8, 8), alpha);
    number_y = bar_y + pos.height;
    for (int digits = GetNumberKeta(max_exp); digits >= 2; digits--) {
        number_x += WeaponVolumeNumberRect.width * 2;
    }
    int left = DrawMenuNumber(max_exp, number_x, number_y, WepStatus, WeaponVolumeNumberRect, 1, alpha);
    DrawMenu2DSprite(WepStatus, CRect_i_(left - 0xB, number_y, 0xC, 0xB),
                     CRect_i_(WeaponVolumeNumberRect.x + 0x78, WeaponVolumeNumberRect.y, 0xC, 0xC), alpha);
    DrawMenuNumber(weapon->unk_14, left - 0xB, number_y, WepStatus, WeaponVolumeNumberRect, 2, alpha);
    int values[4] = {0, 0, 0, 0};
    values[0] = weapon->attack;
    values[1] = weapon->endurance;
    values[2] = weapon->speed;
    values[3] = weapon->magic;
    int bonus[4] = {0, 0, 0, 0};
    int target[4] = {0, 0, 0, 0};
    if (build == 1 && built != NULL) {
        target[0] = built->attack;
        target[1] = built->endurance;
        target[2] = built->speed;
        target[3] = built->magic;
    }
    WEAPON_DATA *data = GetWeaponData(weapon->item_no);
    int limit[4] = {0, 99, 99, 0};
    limit[0] = data->attack_max;
    limit[3] = data->magic_max;
    if (build == 0) {
        for (int i = 0; i < 4; i++) {
            bonus[i] = GetWeaponAttachStatusUp(weapon, i + 1);
            if (bonus[i] < 0) {
                bonus[i] = 0;
            }
        }
    }
    float rate = GetNowWeaponRate(weapon);
    if (build == 1) {
        rate = 1.0f;
    }
    if (!(rate <= 1.0f)) {
        limit[0] = (int) ((float) limit[0] * rate);
        limit[3] = (int) ((float) limit[3] * rate);
    }
    RECT row = {0, 0, 0, 0};
    row.x = x + 0x4A;
    row.y = y + 0x60;
    int volume[3] = {100, 0, 0};
    for (int i = 0; i < 4; i++) {
        int limited = 0;
        int base = values[i];
        volume[1] = base + bonus[i];
        volume[1] = (int) ((float) volume[1] * rate);
        if (volume[1] >= limit[i]) {
            volume[1] = limit[i];
            limited = 1;
        }
        volume[2] = base;
        if (volume[2] >= limit[i]) {
            volume[2] = limit[i];
        }
        int length = (int) ((float) (volume[1] << 7) / (float) volume[0]);
        if (length > 0x80) {
            length = 0x80;
        }
        DrawWeaponStatusWaku(row.x, row.y, length, limited);
        WepStatusVolumeDraw(row, 0x80, volume, i + 3, alpha, build, target[i] - base);
        if (limited != 0) {
            DrawLimmitMax(row.x + 4, row.y + 3, 0x80);
        }
        row.y += 0x10;
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawWeaponStatusTag__FiiP11WEAPON_HAVEiii);
#endif
#ifdef NON_MATCHING
void DrawWeaponElemTag(int x, int y, WEAPON_HAVE *weapon, int build, int weapon_no, int alpha) {
    WEAPON_DATA *built = NULL;
    if (build == 1) {
        built = GetWeaponData(weapon_no);
    }
    int best = weapon->best_elem;
    if (best < 5) {
        int offset = best * 0x18;
        DrawMenu2DSprite(WepStatus, CRect_i_(x + 6, y + 0x24 + offset + 1, 0x2C, 0x18), CRect_i_(0xD4, offset + 0x68, 0x2C, 0x18),
                         alpha);
    }
    RECT row = {0, 0, 0, 0};
    row.x = x + 0x4A;
    row.y = y + 0x30;
    float rate = GetNowWeaponRate(weapon);
    int bonus[5] = {0, 0, 0, 0, 0};
    int target[5] = {0, 0, 0, 0, 0};
    if (build == 0) {
        for (int i = 0; i < 5; i++) {
            bonus[i] = GetWeaponAttachStatusUp(weapon, i + 8);
        }
    }
    if (build == 1 && built != NULL) {
        for (int i = 0; i < 5; i++) {
            target[i] = built->elem[i];
        }
    }
    int volume[3] = {100, 0, 0};
    for (int i = 0; i < 5; i++) {
        int limited = 0;
        s8 *elem = &weapon->elem[i];
        volume[1] = weapon->elem[i] + bonus[i];
        volume[1] = (int) ((float) volume[1] * rate);
        if (volume[1] >= 99) {
            volume[1] = 99;
            limited = 1;
        }
        volume[2] = *elem;
        if (volume[2] >= 99) {
            volume[2] = 99;
        }
        float length = (float) (volume[1] << 7) / (float) volume[0];
        DrawWeaponStatusWaku(row.x, row.y, (int) length, limited);
        WepStatusVolumeDraw(row, 0x80, volume, i + 7, alpha, build, target[i] - *elem);
        if (limited != 0) {
            DrawLimmitMax(row.x + 2, row.y + 4, 0x80);
        }
        row.y += 0x18;
    }
    if (best < 5) {
        DrawMenu2DSprite(WepStatus, CRect_i_(x + 0x8A, y + 0x30 + best * 0x18, 0x42, 0x15), CRect_i_(0xD4, 0x190, 0x42, 0x16),
                         (alpha * 0x6E) >> 7);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawWeaponElemTag__FiiP11WEAPON_HAVEiii);
#endif
void DrawWeaponVsMonster(int x, int y, WEAPON_HAVE *weapon, int build, int weapon_no, int alpha) {
    WEAPON_DATA *built = NULL;
    if (build == 1) {
        built = GetWeaponData(weapon_no);
    }
    int top = y + 0x30;
    RECT row = {0, 0, 0x10, -8};
    row.x = x + 0x22;
    row.y = top;
    int volume[3] = {100, 0, 0};
    int bonus[10] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    int target[10] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    if (build == 0) {
        for (int i = 0; i < 10; i++) {
            bonus[i] = GetWeaponAttachStatusUp(weapon, i + 14);
        }
    }
    if (build == 1) {
        for (int i = 0; i < 10; i++) {
            target[i] = built->vs_monster[i];
        }
    }
    float rate = GetNowWeaponRate(weapon);
    for (int i = 0; i < 10; i++) {
        int limited = 0;
        volume[1] = weapon->vs_monster[i] + bonus[i];
        volume[1] = (int) ((float) volume[1] * rate);
        if (volume[1] >= 99) {
            limited = 1;
            volume[1] = 99;
        }
        volume[2] = weapon->vs_monster[i];
        if (volume[2] >= 99) {
            volume[2] = 99;
        }
        float length = (float) (volume[1] << 6) / (float) volume[0];
        int width = (int) length;
        DrawWeaponStatusWaku(row.x, row.y, (int) length, limited);
        int diff = target[i] - weapon->vs_monster[i];
        WepStatusVolumeDraw(row, 0x40, volume, i + 12, alpha, build, diff);
        if (limited != 0) {
            DrawLimmitMax(row.x + 0x1E, row.y + 4, 0x80);
        }
        row.y += 0x18;
        if (i == 4) {
            row.x = x + 0x8A;
            row.y = top;
        }
    }
}

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

#ifdef NON_MATCHING
void DrawAallWeapon(int x, int y, float depth, CCharacter *model, WEAPON_HAVE *weapon, int equipped, int selected,
                    int alpha) {
    if (weapon == NULL) {
        return;
    }
    MenuTextureReload(MenuExtendReadBlock);
    float spin = 0.0f;
    sceVu0FVECTOR position = {0.0f, 0.0f, 0.0f, 0.0f};
    position[0] = depth;
    if (model != NULL) {
        if (equipped != 0) {
            position[1] = -1.3f + sinf(WepFrameRate);
            WepFrameRate += 0.3490659f;
            float limit = 3.1415927f;
            if (limit <= WepFrameRate) {
                WepFrameRate = limit;
            }
            if (3.1415927f != WepFrameRate) {
                spin = 0.0f;
            }
        }
        MENU_WEP_POLY_OFFSET *offset = &MenuWepPolyOffset[WepMenu.chara];
        position[0] += offset->position[0];
        position[1] += offset->position[1];
        model->SetPosition(position);
        float scale = offset->scale;
        model->SetScale(scale, scale, scale);
        if (selected != 0) {
            spin = (float) (3.141592653589793 * (CursorVibeCnt % 219 - 110) / 110);
        }
        if (MenuWepLevelUp.operation_kind == -1 || MenuWepLevelUp.operation_kind == 3 ||
            MenuWepLevelUp.operation_kind == 2) {
            float rot_x = -1.5707964f;
            if (rot_x > 3.141592653589793) {
                rot_x -= 3.1415927f;
            }
            float rot_y = 0.0f + spin;
            if (rot_y > 3.141592653589793) {
                rot_y -= 3.1415927f;
            }
            float rot_z = 0.6283185f;
            if (rot_z > 3.141592653589793) {
                rot_z -= 3.1415927f;
            }
            model->SetRotation(rot_x, rot_y, rot_z);
        }
        model->Draw();
    }
    MenuTextureReload(BtlMenuReadBlock);
    switch (WepMenu.unk_02) {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
            DrawWepStatus(x + 2, y + 0x66, weapon, equipped, alpha);
            DrawWepVolumeDisplay(x, y + 0x14, weapon, alpha);
            break;
    }
    DrawWeaponNameBoard(x - 0x11, y - 0x32, equipped, alpha, 0x80);
    if (equipped != 0) {
        DrawMenu2DSprite(WepStatus, CRect_i_(x + 10, y - 0x15, 0x40, 0x17), CRect_i_(0xD4, 0x141, 0x40, 0x17), alpha);
    }
    WeaponStarDraw(x + 4, y + 0x3C, weapon, alpha);
    if (selected != 0) {
        MenuMes.unk_08 = x + 0xBE;
        MenuMes.unk_0C = y + 0xE;
    } else {
        MenuMes.unk_08 = 0x280;
        MenuMes.unk_0C = 0;
        WeaponOptionStatusDraw(weapon, x + 0x50, y - 0x12, alpha);
    }
    if (selected != 0) {
        MenuMes.unk_08 = x + 0xA0;
        MenuMes.unk_0C = y + 0xE;
    } else {
        WeaponOptionStatusDraw(weapon, x + 0x50, y - 0x12, alpha);
    }
    float centre[2] = {0.5f, 0.5f};
    int hole_x = (int) ((float) (x + 0x52) - (float) (GetWeaponHoleNum(weapon->item_no) * 0x12 + 10) * centre[selected]);
    if (WepMenu.unk_02 >= 8) {
        DrawWepHole(hole_x, 0xB8, weapon, selected, alpha);
        MenuTextureReload(MenuShadowReadBlock);
        DrawWepAttach(hole_x + 0xE, 0xBE, weapon, selected, alpha);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawAallWeapon__FiifP10CCharacterP11WEAPON_HAVEiii);
#endif
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @2244);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @2245);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @2246__2);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @2247);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @2248);
INCLUDE_RODATA("asm/nonmatchings/battlemenu", @2249);
#ifdef NON_MATCHING
void BtlWeaponDraw(int x, float depth, int chara, int alpha) {
    sceVu0FMATRIX light_dir;
    sceVu0FMATRIX light_col;
    sceVu0FVECTOR ambient;
    CUserStatus *status = (CUserStatus *) BtlMenuStatusPt;
    int equipped_slot = status->equipped_weapon_slot[chara];
    int cursor = WepMenu.weapon_slot;
    sceVu0FVECTOR ref = {0.0f, 0.0f, 0.0f, 0.0f};
    sceVu0FVECTOR pos = {0.0f, 0.0f, 0.0f, 0.0f};

    MenuCamera.SetRef(ref);
    MenuCamera.SetPos(pos);
    MGGetPLight(light_dir, light_col);
    MGGetAmbient(ambient);
    sceVu0FVECTOR bright = {80.0f, 80.0f, 80.0f, 0.0f};
    sceVu0FVECTOR direction = {0.0f, 0.0f, 1.0f, 0.0f};
    sceVu0FVECTOR normal;
    sceVu0Normalize(normal, direction);
    sceVu0FMATRIX dir = {{0.0f, 0.0f, 0.0f, 0.0f}, {0.0f, 0.0f, 0.0f, 0.0f}, {0.0f, 0.0f, 0.0f, 0.0f}, {0.0f, 0.0f, 0.0f, 0.0f}};
    sceVu0FMATRIX col = {{128.0f, 128.0f, 128.0f, 0.0f}, {0.0f, 0.0f, 0.0f, 0.0f}, {0.0f, 0.0f, 0.0f, 0.0f}, {0.0f, 0.0f, 0.0f, 0.0f}};
    dir[0][0] = normal[0];
    dir[1][0] = normal[1];
    dir[2][0] = normal[2];
    MGSetPLight(dir, col);
    for (int i = 0; i < 10; i++, x += 0xD6, depth += 16.0f) {
        int draw_alpha = alpha;
        if (x < -0x60 || (WepMenu.unk_02 >= 8 && i != cursor)) {
            continue;
        }
        if (x >= 0x277) {
            continue;
        }
        WEAPON_HAVE *weapon = &DngWepHavePt[i];
        int is_equipped = 0;
        if (i == equipped_slot) {
            is_equipped = 1;
        }
        int is_selected = 0;
        if (i == cursor) {
            is_selected = 1;
        }
        if (is_selected != 0) {
            if (WepMenu.unk_0C == 8) {
                switch (MenuWepLevelUp.effect_state) {
                    case 5:
                        draw_alpha = (int) (128.0f - 4.0f * MenuWepLevelUp.effect_timer);
                        if (draw_alpha < 0) {
                            draw_alpha = 0;
                        }
                        break;
                    case 6:
                        if (MenuWepLevelUp.lost_default_weapon != 0) {
                            draw_alpha = 0;
                        } else {
                            draw_alpha = (int) MenuWepLevelUp.effect_timer;
                        }
                        if (draw_alpha > 0x80) {
                            draw_alpha = 0x80;
                        }
                        break;
                }
            }
            MenuMes.alpha = draw_alpha;
        } else if (WepMenu.unk_02 <= 0 && WepMenu.unk_0C >= 7) {
            continue;
        }
        bright[3] = draw_alpha;
        MGSetAmbient(bright);
        if (MenuExTextureReadFlag != 2) {
            continue;
        }
        if (weapon->item_no >= 0x101) {
            CCharacter *frame = NULL;
            if (GetNowTestNo() == 1) {
                if (is_equipped != 0) {
                    char *shadows[6] = {"kgetoan", "kgesyao", "kgegoro", "kgeruby", "kgeunga", "kgeozu"};
                    MenuTextureReload(MenuShadowReadBlock);
                    DrawMenu2DSprite(TexManager.GetTexture(shadows[WepMenu.chara], -1), CRect_i_(x + 0x24, 0x96, 0x64, 0x63),
                                     CRect_i_(0, 0, 0x64, 0x64), draw_alpha * 9 / 40);
                    MenuTextureReload(MenuExtendReadBlock);
                }
                int frame_no = GetMenuWeaponModelFrameNo(i);
                if (frame_no >= 0) {
                    frame = &DngWeaponFrm[frame_no];
                    MenuWeaponSpSet(frame, weapon);
                }
            }
            if (frame != NULL) {
                DrawAallWeapon(x, 0xA0, depth, frame, weapon, is_equipped, is_selected, draw_alpha);
            }
        } else {
            MenuTextureReload(BtlMenuReadBlock);
            if (is_selected == 0 || WepMenu.unk_0C != 8) {
                DrawMenuNothing(x - 4, 0x82, 0xB4, 0x96, "wepstatus", 0, draw_alpha);
            }
        }
        MenuMes.mode = 0;
        switch (WepMenu.unk_02) {
            case 8:
            case 10:
            case 9:
            case 11:
                MenuTextureReload(BtlMenuReadBlock);
                DrawBtlMenuLRCursor(x - 0x1C, 0xE6, 0xD4, draw_alpha);
                DrawWeaponTagBoard(x - 0xC, 0xF0, weapon, 0, 0, draw_alpha);
            case 0:
                WeaponOptionStatusDraw(weapon, x + 0x50, 0x8E, draw_alpha);
                break;
            default:
                MenuMes.mode = 1;
                break;
        }
    }
    MGSetPLight(light_dir, light_col);
    MGSetAmbient(ambient);
    if (MenuExTextureReadFlag == 2) {
        int tags = 0;
        if (WepMenu.unk_02 == 10 || WepMenu.unk_02 == 9 || WepMenu.unk_02 == 8 || WepMenu.unk_02 == 11) {
            tags = 1;
        }
        WeaponNameDraw(0x72, tags, alpha);
    }
    if (WepMenu.unk_02 != 8 && WepMenu.unk_02 != 10 && WepMenu.unk_02 != 9 && WepMenu.unk_02 != 11) {
        int dim = 0;
        if (WepMenu.unk_02 != 0) {
            dim = 1;
        }
        FadeTexX(0, 0xCC, 0x1AE, 0xD2, "frame_image", dim);
    }
    if (WepMenu.unk_0C != 8) {
        MenuMes.Step();
        MenuMes.Draw1(MenuMes.unk_08, MenuMes.unk_0C, MenuMes.alpha);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/battlemenu", BtlWeaponDraw__Fifii);
#endif

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

#ifdef NON_MATCHING
void DrawWeaponSelectDialog(int x, int y, int alpha) {
    static int warmcnt = 0;
    static int levelbrinkcnt = 0;
    s8 shift = 0;

    if (BtlMenuNowLang > 0) {
        shift = 2;
    }
    int left = x + shift;
    int top = y + shift;
    WEAPON_HAVE *weapon = GetNowSelectWeapon();
    int repair_items = GetNowItemNum(0xB1, MenuItemPackPt);
    int options = NowWeaponStatusValue(weapon);
    int title_v = 0x68;
    if (WepMenu.unk_0C == 5) {
        title_v = 0x108;
    }
    DrawMenu2DSprite(WepStatus, CRect_i_(left, top + 1, 0x60, 0x1F), CRect_i_(0x120, title_v, 0x60, 0x20), alpha);
    CRect_i_ source(0x120, 0x88, 0x60, 0x20);
    DrawMenu2DSprite(WepStatus, CRect_i_(left, top + 0x1B, 0x60, 0x1F), source, alpha);
    source.y += 0x20;
    int build_x = left;
    if (WepMenu.unk_02 == 2) {
        build_x = left + 0x28;
    }
    DrawMenu2DSprite(WepStatus, CRect_i_(build_x, top + 0x35, 0x60, 0x1F), CRect_i_(0x120, 0x148, 0x60, 0x20), alpha);
    int bright = 0x80;
    if (repair_items <= 0 || weapon->durability_f == (float) weapon->durability) {
        bright = 0x40;
    }
    int default_no = GetDefaultWeaponNo(WepMenu.chara);
    if ((weapon->durability_f <= 0.1f * weapon->durability || weapon->item_no == default_no) && repair_items > 0) {
        bright = abs((int) (50.0f * sinf((float) warmcnt / 12.0f))) + 0x78;
        warmcnt++;
        if (warmcnt > 1000000) {
            warmcnt = 0;
        }
    }
    DrawMenu2DSprite(WepStatus, CRect_i_(left, top + 0x4F, 0x60, 0x1F), source, bright, bright, bright, alpha);
    source.y += 0x20;
    int level_bright = 0x80;
    levelbrinkcnt++;
    if (levelbrinkcnt > 1000000) {
        levelbrinkcnt = 0;
    }
    CRect_i_ dest(left, top + 0x69, 0x60, 0x1F);
    for (int i = 1; i < 4; i++) {
        if (options & (1 << i)) {
            DrawMenu2DSprite(WepStatus, dest, source, level_bright, level_bright, level_bright, alpha);
            dest.y += 0x1A;
        }
        source.y += 0x20;
        if (i == 2) {
            int build = 0;
            source.y += 0x20;
            WeaponStatusBuildUp(weapon, build);
            int attached = GetNowWeaponAttachNum(weapon);
            if (build > 0 && attached == 0) {
                level_bright += abs((int) (40.0f * sinf((float) levelbrinkcnt / 12.0f)));
            }
        }
    }
    if (WepMenu.unk_0C != 13 && WepMenu.unk_0C != 12) {
        return;
    }
    DrawMenu2DSprite(BtStatus, CRect_i_(x + 0x64, y + 0x33, 0x60, 0x1F), CRect_i_(0, 0x80, 0x60, 0x20), 0x80);
}
#else
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawWeaponSelectDialog__Fiii);
#endif

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
            BtlHaveItemPt = &WepMenu.board.held_item;
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

#ifdef NON_MATCHING
void WeaponMenuSelect() {
    int direction = -1;

    switch (WepMenu.unk_0C) {
        case 1:
            direction = 0;
            break;
        case 2:
            direction = 1;
            break;
    }
    int done = ToFromSelect(direction);
    switch (MenuExTextureReadFlag) {
        case 0:
            if (MenuWepLevelUp.buildup_complete == 0) {
                if (ReadBGSync() != 0) {
                    return;
                }
                if (MenuExTextureReadFlag == 0) {
                    MenuExTextureReadFlag = EnterWeaponModel(WepMenu.chara, MenuExtendReadBlock, WepMenu.weapon_slot);
                    BtlMenuTexBlockEnter();
                    BtlMDSBuildCnt = 0;
                    WepMenu.unk_10 = 0;
                }
            }
            if (MenuWepLevelUp.buildup_complete == 1) {
                WeaponModelBuildFunc(WepMenu.chara, MenuExtendReadBlock);
                BtlMDSBuildCnt = 0;
                MenuWepLevelUp.buildup_complete = 0;
                MenuExTextureReadFlag++;
            }
            break;
        case 1:
            BtlMDSBuildCnt++;
            if (BtlMDSBuildCnt >= 4) {
                MenuExTextureReadFlag = 2;
            }
            break;
    }
    if (WepMenu.unk_0C != 0) {
        WepMenu.unk_10++;
    } else {
        WepMenu.unk_10 = 0;
    }
    switch (WepMenu.unk_0C) {
        case 1:
            if (!((float) WepMenu.unk_10 <= 18.0f) && done != 0 && MenuExTextureReadFlag != 0) {
                BattleMenuFlag = 2;
                WepMenu.unk_0C = 0;
                WepMenu.unk_10 = 0;
            }
            break;
        case 2:
            if (WepMenu.unk_10 > 20 && done != 0) {
                ExitWeaponMenuSelect();
            }
            break;
        case 7:
        case 8:
        case 9:
        case 10:
            if (MenuWepLevelUp.effect_active == 0 && GamePad.Down(0x60) != 0 &&
                (MenuWepLevelUp.effect_state == 6 || MenuWepLevelUp.effect_state == 3 || MenuWepLevelUp.effect_state == 9 ||
                 MenuWepLevelUp.effect_state == 11)) {
                WEAPON_HAVE *weapon = MenuWepLevelUp.weapon;
                switch (WepMenu.unk_0C) {
                    case 10:
                    case 9:
                        break;
                    case 7:
                        MenuWepLevelUp.SetLevelUpWeaponData();
                        weapon->unk_02++;
                        weapon->unk_F0 += MenuWepLevelUp.synthesis_count;
                        for (int i = 0; i < 6; i++) {
                            memset(&weapon->attach[i], 0, sizeof(weapon->attach[i]));
                        }
                        break;
                    case 8: {
                        CUserStatus *status = (CUserStatus *) BtlMenuStatusPt;
                        int equipped = status->equipped_weapon_slot[WepMenu.chara];
                        if (WepMenu.weapon_slot == equipped || DngWepHavePt[equipped].item_no < 0x101) {
                            EquipDefaultWeapon(WepMenu.chara);
                        }
                        MenuWepLevelUp.lost_default_weapon = 0;
                        break;
                    }
                }
                if (WepMenu.unk_0C != 10) {
                    MenuWepLevelUp.SetSnd(MenuWepLevelUp.snd_volume, MenuWepLevelUp.snd_from, 7);
                }
                MenuWepLevelUp.Initialize();
                WepMenu.unk_0C = 0;
            }
            break;
        case 11:
            if (GamePad.Down(0x60) != 0) {
                WepMenu.unk_0C = 0;
                WepMenu.unk_08 = -1;
            }
            break;
        case 14:
            if (GamePad.Down(0x60) != 0) {
                WepMenu.unk_0C = 0;
            }
            break;
        case 12:
            if (GamePad.Down(0x40) != 0) {
                WEAPON_HAVE *weapon = GetNowSelectWeapon();
                if (IsDefaultWeapon(weapon->item_no) >= 0) {
                    ComMenuSePlay(2);
                    WepMenu.unk_0C = 14;
                } else if (weapon->item_no == 0x10C && GetMenuHebikiriFlag() == 0) {
                    WepMenu.unk_0C = 14;
                    ComMenuSePlay(2);
                } else {
                    WepMenu.unk_0C = 13;
                    ComMenuSePlay(1);
                }
            } else if (GamePad.Down(0x8020) != 0) {
                WepMenu.unk_0C = 0;
                ComMenuSePlay(0);
            }
            if (WepMenu.unk_0C == 0) {
                WepMenu.board.cursor = 0;
            }
            break;
        case 13:
            if (GamePad.Down(0x5000) != 0) {
                if (WepMenu.unk_09[0] != 0) {
                    WepMenu.unk_09[0] = 0;
                } else {
                    WepMenu.unk_09[0] = 1;
                }
                ComMenuSePlay(0);
            }
            if (GamePad.Down(0x40) != 0) {
                if (WepMenu.unk_09[0] == 0) {
                    WEAPON_HAVE *weapon = GetNowSelectWeapon();
                    if (IsDefaultWeapon(weapon->item_no) >= 0) {
                        ComMenuSePlay(2);
                    } else {
                        InitHaveWep(weapon);
                        ComMenuSePlay(1);
                        WepMenu.unk_0C = 0;
                        if (WepMenu.weapon_slot == ((CUserStatus *) BtlMenuStatusPt)->equipped_weapon_slot[WepMenu.chara]) {
                            EquipDefaultWeapon(WepMenu.chara);
                        }
                        ComMenuSePlay(1);
                    }
                } else {
                    WepMenu.unk_0C = 0;
                    ComMenuSePlay(2);
                }
            } else if (GamePad.Down(0x8020) != 0) {
                WepMenu.unk_0C = 0;
                ComMenuSePlay(0);
            }
            if (WepMenu.unk_0C == 0) {
                WepMenu.board.cursor = 0;
                WepMenu.unk_02 = 0;
            }
            break;
        case 5:
            if (!(WepFrameRate < 3.1415927f)) {
                WepMenu.unk_0C = 0;
            }
        case 4:
            if (WepMenu.unk_10 > 25) {
                WepMenu.unk_0C = 0;
            }
        case 0: {
            int slot = WepMenu.weapon_slot;
            int cursor = WepMenu.board.cursor;
            int page = WepMenu.unk_02;
            int chara = WepMenu.chara;
            int elem = WepMenu.unk_07;
            switch (page) {
                case 0:
                case 1:
                case 2:
                case 3:
                case 4:
                case 5:
                case 6:
                case 7:
                    if (GetMenuCharaEffectReadFlag() != 0) {
                        if (ReadBGSync() == 0) {
                            SetMenuCharaEffectReadFlag(0);
                        }
                    } else {
                        WeaponSelectKey();
                    }
                    break;
                case 8:
                case 9:
                case 10:
                case 11:
                    WeaponMenuAttachModeKey();
                    break;
            }
            if (slot != WepMenu.weapon_slot || (page == WepMenu.unk_02 && cursor != WepMenu.board.cursor) ||
                chara != WepMenu.chara || elem != WepMenu.unk_07) {
                ComMenuSePlay(0);
            }
            break;
        }
    }
    int help_no = 0;
    int name_mes = -1;
    int name_no = -0x1F3;
    int value = 0;
    ATTACH_LIST *attachments = (ATTACH_LIST *) ((CUserStatus *) BtlMenuStatusPt)->consumable_items;
    WEAPON_HAVE *weapon = &DngWepHavePt[WepMenu.weapon_slot];
    if (weapon != NULL) {
        name_no = GetWeaponMsgNo2(weapon->item_no);
    }
    s16 page_mes[12] = {0, 0, 0, 0, 0, 0, 0, 0xAC, 0x73, 0, 0, 0};
    page_mes[1] = WepMenu.board.cursor + 0x68;
    page_mes[2] = WepMenu.unk_07 + 0x82;
    int name_msg = name_no + 500;
    page_mes[3] = name_msg;
    page_mes[4] = name_msg;
    page_mes[5] = name_msg;
    page_mes[6] = name_msg;
    page_mes[11] = WepMenu.unk_179 + ((WepMenu.unk_178 + 2) * 10 + 100);
    int mes_no = page_mes[WepMenu.unk_02];
    if (WepMenu.unk_02 >= 3 && WepMenu.unk_02 < 8) {
        s16 dialog[5] = {0x74, 0x76, 0x75, 0x77, 0x75};
        help_no = dialog[WepMenu.unk_02 - 3];
        if (MenuWepLevelUp.operation_kind != -1) {
            help_no = (s16) CommonMenuMes1.mes_made;
        }
    }
    WEP_BUILDUP_INFO builds[5];
    switch (WepMenu.unk_02) {
        case 1:
            if (WepMenu.unk_0C == 14 || WepMenu.unk_0C == 13 || WepMenu.unk_0C == 12) {
                mes_no = 0xA4;
            }
            break;
        case 5:
        case 7:
            EnableBuildUpModel(builds, weapon);
            for (int i = 0; i < 5 && builds[i].weapon_no != -1; i++) {
                COM_ITEM_INFO *info = GetCommonItemInfo(builds[i].weapon_no);
                if (info != NULL) {
                    builds[i].weapon_no = info->msg;
                    if (builds[i].enabled == 0) {
                        builds[i].weapon_no = 2;
                    }
                }
            }
            if (WepMenu.unk_02 == 5) {
                WEP_BUILDUP_INFO *build = &builds[WepMenu.board.cursor];
                s16 enabled = build->enabled;
                if (enabled != 0) {
                    mes_no = 0xAE;
                    name_mes = build->weapon_no;
                }
                if (enabled == 0) {
                    mes_no = 0xAD;
                }
            }
            break;
        case 0: {
            int item_no = weapon->item_no;
            if (item_no >= 0x101) {
                mes_no = GetWeaponMsgNo2(item_no) + 500;
                value = weapon->unk_02;
            }
            break;
        }
        case 9: {
            ATTACH_LIST *attach = (ATTACH_LIST *) &weapon->attach[WepMenu.board.cursor];
            int item_no = attach->item_no;
            if (item_no >= 0x51) {
                mes_no = item_no + 500;
                value = GetAttachVolumeForMsg(attach);
                if (item_no == 0x5A) {
                    name_mes = GetWeaponMsgNo2(attach->unk_02);
                }
            } else if (GetWeaponData(weapon->item_no)->hole[WepMenu.board.cursor] == 2) {
                mes_no = 0x70;
            } else {
                mes_no = 0x71;
            }
            break;
        }
        case 2:
            if (weapon->best_elem == WepMenu.unk_07) {
                mes_no += 0x15;
            }
            break;
        case 11:
            if (WepMenu.unk_178 == 1 && weapon->best_elem == WepMenu.unk_179) {
                mes_no += 0x15;
            }
            break;
        case 10:
            switch (WepMenu.board.cursor_area) {
                case 1: {
                    int held = BtlHaveItemPt->item_no;
                    if (held >= 0x51) {
                        mes_no = held + 500;
                        value = GetAttachVolumeForMsg(&WepMenu.board.held_attach);
                        if (BtlHaveItemPt->item_no == 0x5A) {
                            name_mes = GetWeaponMsgNo2(WepMenu.board.held_attach.unk_02);
                        }
                    } else {
                        ATTACH_LIST *attach = &attachments[WepMenu.board.cursor];
                        int item_no = attach->item_no;
                        if (item_no >= 0x51) {
                            mes_no = item_no + 500;
                            value = GetAttachVolumeForMsg(attach);
                            if (attachments[WepMenu.board.cursor].item_no == 0x5A) {
                                name_mes = GetWeaponMsgNo2(attachments[WepMenu.board.cursor].unk_02);
                            }
                        }
                    }
                    break;
                }
                case 2:
                    mes_no = 0xBE;
                    break;
            }
            break;
    }
    if (WepMenu.unk_0C == 11) {
        s16 warnings[10] = {0xA1, 0xA2, 0xA3, 0x19B, 0x19C, 0x19D, 0xA8, 0xAA, 0xA9, 0xAB};
        help_no = warnings[WepMenu.unk_08];
    }
    if (WepMenu.unk_0C == 13) {
        help_no = 0xA5;
    }
    if (WepMenu.unk_0C == 14) {
        help_no = 0xA6;
        if (weapon->item_no == 0x10C && GetMenuHebikiriFlag() == 0) {
            help_no = 0xA7;
        }
    }
    if (CommonMenuMes2.mes_made != mes_no || CommonMenuMes2.value != value ||
        (CommonMenuMes2.mes_made == 0x24E && (CommonMenuMes2.mes_no[0] != name_mes + 100 || CommonMenuMes2.value != value))) {
        CommonMenuMes2.value_signed = 1;
        CommonMenuMes2.value_show = 0;
        if (name_mes > 0) {
            CommonMenuMes2.mes_no[0] = name_mes + 100;
        }
        CommonMenuMes2.value = value;
        CommonMenuMes2.mes_made = -1;
        CommonMenuMes2.MakeMesWin(mes_no);
    }
    int changed = 0;
    if (WepMenu.unk_02 == 5 || WepMenu.unk_02 == 7) {
        s16 previous[3];
        for (int i = 0; i < 3; i++) {
            s32 *slot = &CommonMenuMes1.mes_no[i];
            previous[i] = *slot;
            int wanted = builds[i].weapon_no + 100;
            if (previous[i] != wanted && previous[i] > 100) {
                changed = 1;
            }
            if (builds[i].enabled == 1) {
                *slot = wanted;
            } else if (builds[i].enabled == 0) {
                *slot = 2;
            }
            if (builds[i].weapon_no <= 0) {
                *slot = -1;
            }
        }
    } else if (MenuWepLevelUp.operation_kind == -1) {
        for (int i = 0; i < 4; i++) {
            CommonMenuMes1.mes_no[i] = -1;
            if (i >= 0 && i < 10) {
                CommonMenuMes1.line_pos[i].x = -1;
                CommonMenuMes1.line_pos[i].y = -1;
            }
        }
    }
    if ((CommonMenuMes1.mes_made != help_no && MenuWepLevelUp.operation_kind == -1) ||
        ((WepMenu.unk_02 == 5 || WepMenu.unk_02 == 7) && changed != 0) ||
        (CommonMenuMes1.mes_made != help_no && WepMenu.unk_0C == 11) ||
        (CommonMenuMes1.mes_made != help_no && WepMenu.unk_0C == 13) ||
        (CommonMenuMes1.mes_made != help_no && WepMenu.unk_0C == 14)) {
        if (WepMenu.unk_0C == 14 || WepMenu.unk_0C == 13 || WepMenu.unk_0C == 11) {
            CommonMenuMes1.stay_frame = 1;
        }
        CommonMenuMes1.mes_made = -1;
        CommonMenuMes1.MakeMesWin(help_no);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/battlemenu", WeaponMenuSelect__Fv);
#endif

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

/**
 * Moves the cursor across the weapon list and opens what it settles on.
 */
static int WeaponSelectKey(void);

#ifdef NON_MATCHING
static int WeaponSelectKey() {
    CUserStatus *status = (CUserStatus *) BtlMenuStatusPt;
    int old_chara = WepMenu.chara;

    switch (WepMenu.unk_02) {
        case 0: {
            int handled = 0;
            if (GamePad.Down(0x8000) != 0 && WepMenu.weapon_slot > 0) {
                WepMenu.weapon_slot--;
            }
            if (GamePad.Down(0x2000) != 0 && WepMenu.weapon_slot < 9) {
                WepMenu.weapon_slot++;
            }
            if (GamePad.Down(0x20) != 0) {
                ComMenuSePlay(2);
                switch (WepMenu.unk_00) {
                    case 2:
                        break;
                    case 0:
                        if (BtlMenuMode == 0) {
                            MenuTextureReload(MenuShadowReadBlock);
                            DngActiveWeaponTextureCopy();
                        }
                        BattleMenuFlag = 18;
                        WepMenu.unk_0C = 2;
                        WepMenu.unk_10 = 0;
                        break;
                }
                handled = 1;
            } else if (GamePad.Down(0x40) != 0) {
                if (WepMenu.unk_00 == 0) {
                    if (DngWepHavePt[WepMenu.weapon_slot].item_no < GetDefaultWeaponNo(WepMenu.chara)) {
                        ComMenuSePlay(2);
                    } else {
                        WepMenu.unk_02 = 1;
                        WepMenu.board.cursor = 0;
                        ComMenuSePlay(1);
                    }
                }
                handled = 1;
            }
            if (handled == 0) {
                if (GamePad.Down(0xA) != 0) {
                    WepMenu.chara++;
                    if (WepMenu.chara >= 6) {
                        WepMenu.chara = 0;
                    }
                }
                if (GamePad.Down(5) != 0) {
                    WepMenu.chara--;
                    if (WepMenu.chara < 0) {
                        WepMenu.chara = 5;
                    }
                }
            }
            break;
        }
        case 1: {
            WEAPON_HAVE *weapon = GetNowSelectWeapon();
            int options = NowWeaponStatusValue(weapon);
            if (GamePad.Down(0x1000) != 0) {
                if (WepMenu.board.cursor > 0 && WepMenu.board.cursor < 5) {
                    WepMenu.board.cursor--;
                } else {
                    WepMenu.board.cursor = WeaponMenuKastumSelectUp(WepMenu.board.cursor, options);
                }
            }
            if (GamePad.Down(0x4000) != 0) {
                if (WepMenu.board.cursor >= 3) {
                    WepMenu.board.cursor = WeaponMenuKastumSelectDown(WepMenu.board.cursor + 1, options);
                } else {
                    WepMenu.board.cursor++;
                }
            }
            if (GamePad.Down(0x2000) != 0 && WepMenu.board.cursor == 0) {
                WepMenu.unk_0C = 12;
                WepMenu.unk_09[0] = 1;
                ComMenuSePlay(0);
            } else if (GamePad.Down(0x40) != 0) {
                s8 slot = WepMenu.weapon_slot;
                NowWeaponStatusValue(weapon);
                switch (WepMenu.board.cursor) {
                    case 0:
                        if (status->unk_42C8[WepMenu.chara] & 0x20) {
                            ComMenuSePlay(2);
                            WepMenu.unk_0C = 11;
                            WepMenu.unk_08 = 3;
                        } else if (status->res_limit_zone_current == 10) {
                            WepMenu.unk_0C = 11;
                            WepMenu.unk_08 = 4;
                            ComMenuSePlay(2);
                        } else if (WepMenu.chara >= status->party_size) {
                            WepMenu.unk_0C = 11;
                            WepMenu.unk_08 = 2;
                            ComMenuSePlay(2);
                        } else {
                            status->equipped_weapon_slot[WepMenu.chara] = slot;
                            WepFrameRate = 0;
                            WepMenu.unk_0C = 5;
                            int cur = status->cur_chara;
                            if (BtlMenuMode == 0 && ((cur == 5 && WepMenu.chara == 5) || (cur == 3 && WepMenu.chara == 3))) {
                                StartReadBG();
                                DngWepEffectReadStart();
                            }
                            ComMenuSePlay(0x17);
                        }
                        break;
                    case 1: {
                        WepMenu.unk_02 = 10;
                        WepMenu.board.cursor = 0;
                        WepMenu.unk_178 = 0;
                        SetOldEffectKind(weapon->best_elem);
                        int holes = GetWeaponHoleNum(weapon->item_no);
                        CMenuCursor *cursor = SaveData->GetMenuCursor();
                        int max = PersonalRetMax(2);
                        if (cursor->reset_pos == 0) {
                            WepMenu.unk_02 = cursor->mode[2];
                            if (WepMenu.unk_02 < 8 || WepMenu.unk_02 >= 12) {
                                WepMenu.unk_02 = 10;
                            }
                            WepMenu.board.cursor = cursor->pos[2];
                            switch (WepMenu.unk_02) {
                                case 11:
                                    break;
                                case 9:
                                    if (holes - 1 < WepMenu.board.cursor) {
                                        WepMenu.board.cursor = holes - 1;
                                    }
                                    break;
                                case 10: {
                                    WepMenu.board.top_row = WepMenu.board.cursor / 5;
                                    int last = max / 5 - 4;
                                    if (last < WepMenu.board.top_row) {
                                        WepMenu.board.top_row = last;
                                        while (max < WepMenu.board.cursor) {
                                            WepMenu.board.cursor -= 5;
                                        }
                                        while (WepMenu.board.cursor < 0) {
                                            WepMenu.board.cursor += 5;
                                        }
                                    }
                                    break;
                                }
                                case 8:
                                    WepMenu.board.cursor = 0;
                                    break;
                            }
                        } else {
                            WepMenu.board.top_row = WepMenu.board.cursor / 5;
                            int last = max / 5 - 4;
                            if (last < WepMenu.board.top_row) {
                                WepMenu.board.top_row = last;
                                while (max < WepMenu.board.cursor) {
                                    WepMenu.board.cursor -= 5;
                                }
                                while (WepMenu.board.cursor < 0) {
                                    WepMenu.board.cursor += 5;
                                }
                            }
                        }
                        if (holes <= 0) {
                            WepMenu.unk_06 = 0;
                        } else {
                            WepMenu.unk_06 = 1;
                        }
                        if (WepMenu.board.cursor < 0) {
                            WepMenu.board.cursor = 0;
                        }
                        WepMenu.board.y = 0x7F - WepMenu.board.top_row * 0x28;
                        WepMenu.board.scroll = 140.0f + 114.0f * WepMenu.board.top_row / (max / 5);
                        ComMenuSePlay(1);
                        break;
                    }
                    case 2:
                        WepMenu.unk_02 = 2;
                        WepMenu.unk_178 = 1;
                        WepMenu.unk_07 = weapon->best_elem;
                        if (WepMenu.unk_07 < 0 || WepMenu.unk_07 >= 5) {
                            WepMenu.unk_07 = 0;
                        }
                        ComMenuSePlay(1);
                        break;
                    case 3:
                        if (GetNowItemNum(0xB1, MenuItemPackPt) <= 0) {
                            ComMenuSePlay(2);
                        } else if (ItemUseFunc(status, 0xB1, WepMenu.chara, 4, weapon) == 2) {
                            DeleteItemAfterUseItem(0xB1, MenuItemPackPt);
                            ComMenuSePlay(0x18);
                            if (IsDefaultWeapon(weapon->item_no) >= 0) {
                                SetMenuWeaponModelReference(slot, 1, 1);
                            }
                            MenuWepLevelUp.WepRecover(weapon, &DngWeaponFrm[slot], (CWeaponLevelUp *) WepMenuEffectReadBuf, 0);
                            WepMenu.unk_0C = 10;
                        } else {
                            ComMenuSePlay(2);
                        }
                        break;
                    case 4: {
                        int item_no = weapon->item_no;
                        if (item_no == GetDefaultWeaponNo(WepMenu.chara)) {
                            WepMenu.unk_0C = 11;
                            WepMenu.unk_08 = 7;
                            ComMenuSePlay(2);
                        } else if (item_no == 0x10C && GetMenuHebikiriFlag() == 0) {
                            WepMenu.unk_0C = 11;
                            WepMenu.unk_08 = 5;
                            ComMenuSePlay(2);
                        } else if (weapon->unk_02 >= 99) {
                            WepMenu.unk_0C = 11;
                            WepMenu.unk_08 = 8;
                            ComMenuSePlay(2);
                        } else {
                            WepMenu.unk_02 = 3;
                            WepMenu.board.cursor = 1;
                            ComMenuSePlay(1);
                        }
                        break;
                    }
                    case 5: {
                        int count = 0;
                        for (int i = 0; i < 40; i++) {
                            if (status->consumable_items[i].id >= 0x51) {
                                count++;
                            }
                        }
                        if (count >= 40) {
                            WepMenu.unk_0C = 11;
                            WepMenu.unk_08 = 1;
                            ComMenuSePlay(2);
                        } else {
                            WepMenu.unk_02 = 4;
                            WepMenu.board.cursor = 1;
                            ComMenuSePlay(1);
                        }
                        break;
                    }
                    case 6:
                        WepMenu.unk_02 = 5;
                        WepMenu.board.cursor = 0;
                        ComMenuSePlay(1);
                        break;
                }
            } else if (GamePad.Down(0x20) != 0) {
                WepMenu.unk_02 = 0;
                ComMenuSePlay(2);
            }
            break;
        }
        case 2:
            WepMenu.unk_178 = 1;
            if (GamePad.Down(0xF) != 0) {
                ComMenuSePlay(2);
            }
            if (GamePad.Down(0x1000) != 0 && WepMenu.unk_07 > 0) {
                WepMenu.unk_07--;
            }
            if (GamePad.Down(0x4000) != 0 && WepMenu.unk_07 < 4) {
                WepMenu.unk_07++;
            }
            if (GamePad.Down(0x40) != 0) {
                WEAPON_HAVE total;
                WEAPON_HAVE *weapon = GetNowSelectWeapon();
                WeaponAllValueSet(weapon, &total, 0);
                if (WeaponMenuCheckEnableSetElem(weapon, &total, WepMenu.unk_07) != 0) {
                    ComMenuSePlay(2);
                } else {
                    ComMenuSePlay(1);
                }
            } else if (GamePad.Down(0x20) != 0) {
                WepMenu.unk_02 = 1;
                if (BtlMenuMode == 0 && status->cur_chara == 3 && WepMenu.chara == 3) {
                    StartReadBG();
                    DngWepEffectReadStart();
                }
                ComMenuSePlay(2);
            }
            break;
        case 3:
            if (GamePad.Down(0x5000) != 0) {
                if (WepMenu.board.cursor != 0) {
                    WepMenu.board.cursor = 0;
                } else {
                    WepMenu.board.cursor = 1;
                }
            }
            if (WepMenu.board.cursor == 0 && GamePad.Down(0x40) != 0) {
                int slot = WepMenu.weapon_slot;
                if (DngWepHavePt[slot].unk_14 < GetWeaponMaxExp(&DngWepHavePt[slot])) {
                    DeleteItemAfterUseItem(0xB2, MenuItemPackPt);
                }
                MenuWepLevelUp.SetLevelUpValue(&DngWepHavePt[slot], &DngWeaponFrm[slot], (CWeaponLevelUp *) WepMenuEffectReadBuf,
                                               0);
                WepMenu.unk_0C = 7;
                WepMenu.unk_02 = 0;
                WepMenu.board.cursor = 0;
                ComMenuSePlay(1);
            } else if ((WepMenu.board.cursor == 1 && GamePad.Down(0x40) != 0) || GamePad.Down(0x20) != 0) {
                WepMenu.unk_02 = 1;
                WepMenu.board.cursor = 4;
                ComMenuSePlay(2);
            }
            break;
        case 4:
            if (GamePad.Down(0x5000) != 0) {
                if (WepMenu.board.cursor != 0) {
                    WepMenu.board.cursor = 0;
                } else {
                    WepMenu.board.cursor = 1;
                }
            }
            if ((WepMenu.board.cursor == 1 && GamePad.Down(0x40) != 0) || GamePad.Down(0x20) != 0) {
                WepMenu.unk_02 = 1;
                WepMenu.board.cursor = 5;
                ComMenuSePlay(2);
            } else if (WepMenu.board.cursor == 0 && GamePad.Down(0x40) != 0) {
                MenuWepLevelUp.SetStatusBreak(&DngWepHavePt[WepMenu.weapon_slot], &DngWeaponFrm[WepMenu.weapon_slot],
                                              (CWeaponLevelUp *) (MenuExCashBuffer.base + MenuExCashBuffer.used * 16), 0);
                WepMenu.unk_0C = 8;
                WepMenu.unk_02 = 0;
                WepMenu.board.cursor = 0;
                ComMenuSePlay(1);
            }
            break;
        case 5: {
            WEP_BUILDUP_INFO builds[7];
            int build;
            WEAPON_HAVE *weapon = GetNowSelectWeapon();
            EnableBuildUpModel(builds, weapon);
            int count = WeaponStatusBuildUp(weapon, build);
            if (GamePad.Down(0x1000) != 0) {
                WepMenu.board.cursor--;
            }
            if (GamePad.Down(0x4000) != 0) {
                WepMenu.board.cursor++;
            }
            if (WepMenu.board.cursor < 0) {
                WepMenu.board.cursor = count - 1;
            }
            if (count - 1 < WepMenu.board.cursor) {
                WepMenu.board.cursor = 0;
            }
            if (GamePad.Down(0x20) != 0) {
                WepMenu.board.cursor = 6;
                WepMenu.unk_02 = 1;
            } else if (GamePad.Down(0x40) != 0) {
                int attached = 0;
                for (int i = 0; i < GetWeaponHoleNum(weapon->item_no); i++) {
                    if (((ATTACH_LIST *) &weapon->attach[i])->item_no >= 0x51) {
                        attached++;
                    }
                }
                WEP_BUILDUP_INFO *choice = &builds[WepMenu.board.cursor];
                s16 enabled = choice->enabled;
                if (enabled == 1 && attached == 0) {
                    MenuWepLevelUp.buildup_weapon_no = choice->weapon_no;
                    WepMenu.unk_02 = 6;
                    WepMenu.board.cursor = 1;
                } else if (enabled == 0) {
                    WepMenu.unk_02 = 7;
                    WepMenu.unk_178 = 0;
                } else {
                    WepMenu.unk_0C = 11;
                    WepMenu.unk_08 = 6;
                }
            }
            break;
        }
        case 6:
            if (GamePad.Down(0x5000) != 0) {
                if (WepMenu.board.cursor != 0) {
                    WepMenu.board.cursor = 0;
                } else {
                    WepMenu.board.cursor = 1;
                }
            }
            if ((WepMenu.board.cursor == 1 && GamePad.Down(0x40) != 0) || GamePad.Down(0x20) != 0) {
                WepMenu.unk_02 = 1;
                WepMenu.board.cursor = 6;
                ComMenuSePlay(2);
            } else if (WepMenu.board.cursor == 0 && GamePad.Down(0x40) != 0) {
                MenuWepLevelUp.SetBuildUp(&DngWepHavePt[WepMenu.weapon_slot], &DngWeaponFrm[WepMenu.weapon_slot],
                                          (CWeaponLevelUp *) WepMenuEffectReadBuf, 0);
                WepMenu.unk_0C = 9;
                WepMenu.unk_02 = 0;
                WepMenu.board.cursor = 0;
                ComMenuSePlay(1);
            }
            break;
        case 7:
            if (GamePad.Down(5) != 0) {
                WepMenu.unk_178--;
                if (WepMenu.unk_178 < 0) {
                    WepMenu.unk_178 = 2;
                }
                ComMenuSePlay(0);
            }
            if (GamePad.Down(0xA) != 0) {
                WepMenu.unk_178++;
                if (WepMenu.unk_178 >= 3) {
                    WepMenu.unk_178 = 0;
                }
                ComMenuSePlay(0);
            }
            if (GamePad.Down(0x20) != 0) {
                WepMenu.unk_02 = 5;
                ComMenuSePlay(2);
            }
            break;
    }
    if (old_chara != WepMenu.chara) {
        int cur = status->cur_chara;
        if (BtlMenuMode == 0 && cur == old_chara) {
            DngWeaponEquipModelBuild(cur, MenuExtendReadBlock, BtlMenuReadBuf);
        }
        DngWepHavePt = status->chara_weapons[WepMenu.chara];
        if (StartReadWepMDS(BtlMenuReadBuf, WepMenu.chara) != 0) {
            MenuExTextureReadFlag = 0;
            WepMenu.unk_0C = 4;
            WepMenu.unk_10 = 0;
            if (abs(old_chara - WepMenu.chara) >= 2) {
                for (int i = 0; i < 6; i++) {
                    SysChara[i].unk_04 = (SysChara[i].unk_00 - WepMenu.chara) * 0x6E + 0x10E;
                }
            }
            DngWepHavePt = status->chara_weapons[WepMenu.chara];
            WepMenu.weapon_slot = status->equipped_weapon_slot[WepMenu.chara];
            if (WepMenu.weapon_slot < 0 || WepMenu.weapon_slot >= 10) {
                WepMenu.weapon_slot = 0;
            }
            WeaponPos = 0xE8 - WepMenu.weapon_slot * 0xD6;
            WepPolyPos = 2.0f + 16.0f * -WepMenu.weapon_slot;
            WepMenu.unk_0C = 0;
            WepMenu.unk_10 = 0;
        } else {
            ComMenuSePlay(2);
        }
    }
    return 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/battlemenu", WeaponSelectKey__Fv);
#endif

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
            MenuDataSwap(slot, &WepMenu.board.held_attach);
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
            SetCursorPos(cursor, 2, WepMenu.board.cursor);
        }
        WepMenu.unk_02 = 1;
        WepMenu.board.cursor = 1;
        WepMenu.unk_06 = 0;
        GetNowSelectWeapon();
        if (BtlMenuMode == 0 && BtlMenuStatusPt->unk_04 == 3 && WepMenu.chara == 3) {
            StartReadBG();
            DngWepEffectReadStart();
        }
    }
}
void WeaponMenuAttachModeKey() {
    switch (WepMenu.unk_02) {
        case 11:
        case 9:
        case 10:
        case 8: {
            int page = WepMenu.unk_178;
            if (GamePad.Down(0xA) != 0) {
                WepMenu.unk_178++;
                if (WepMenu.unk_178 > 2) {
                    WepMenu.unk_178 = 0;
                }
            }
            if (GamePad.Down(5) != 0) {
                WepMenu.unk_178--;
                if (WepMenu.unk_178 < 0) {
                    WepMenu.unk_178 = 2;
                }
            }
            if (page != WepMenu.unk_178) {
                int rows[3] = {5, 4, 9};
                if (rows[WepMenu.unk_178] < WepMenu.unk_179) {
                    WepMenu.unk_179 = rows[WepMenu.unk_178];
                }
                ComMenuSePlay(0);
            }
            break;
        }
    }
    int row = WepMenu.unk_179;
    s16 mode = WepMenu.unk_02;
    WeaponMenuSelectKeyLockFlag = 0;
    switch (mode) {
        case 8:
            WeaponMenuActWepKey();
            break;
        case 11:
            WeaponMenuTagKey();
            break;
        case 9:
            WeaponMenuAttachWepKey();
            break;
        case 10:
            WeaponMenuAttachKey();
            break;
    }
    if ((row != WepMenu.unk_179 || mode != WepMenu.unk_02) && GamePad.Down(0x20) == 0) {
        ComMenuSePlay(0);
    }
}

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
        WepMenu.board.cursor = WepMenu.board.top_row * 5 + 10;
    } else if (GamePad.Down(0x4000) != 0) {
        WepMenu.unk_02 = 11;
        WepMenu.unk_179 = 0;
    } else if (GamePad.Down(0x20) != 0) {
        ComMenuSePlay(2);
        WepAttachHaveCancel();
    }
}
#ifdef NON_MATCHING
void WeaponMenuTagKey() {
    s16 rows[3] = {5, 4, 10};
    int moved = 0;

    if (WepMenu.unk_179 < 0) {
        WepMenu.unk_179 = 0;
    }
    if (rows[WepMenu.unk_178] < WepMenu.unk_179) {
        WepMenu.unk_179 = rows[WepMenu.unk_178];
    }
    GetWeaponHoleNum(GetNowSelectWeapon()->item_no);
    switch (WepMenu.unk_178) {
        case 0:
            if (GamePad.Down(0x1000) != 0) {
                moved = 1;
                if (WepMenu.unk_179 > 0) {
                    WepMenu.unk_179--;
                } else if (WepMenu.unk_06 != 0) {
                    WepMenu.unk_02 = 9;
                } else {
                    WepMenu.unk_02 = 8;
                }
            } else if (GamePad.Down(0x4000) != 0) {
                moved = 1;
                if (WepMenu.unk_179 < rows[WepMenu.unk_178]) {
                    WepMenu.unk_179++;
                }
            } else if (GamePad.Down(0x40) != 0) {
                moved = 1;
                ComMenuSePlay(2);
            }
            break;
        case 1:
            if (GamePad.Down(0x1000) != 0) {
                moved = 1;
                if (WepMenu.unk_179 > 0) {
                    WepMenu.unk_179--;
                } else if (WepMenu.unk_06 != 0) {
                    WepMenu.unk_02 = 9;
                } else {
                    WepMenu.unk_02 = 8;
                }
            } else if (GamePad.Down(0x4000) != 0) {
                moved = 1;
                if (WepMenu.unk_179 < rows[WepMenu.unk_178]) {
                    WepMenu.unk_179++;
                }
            } else if (GamePad.Down(0x40) != 0) {
                WEAPON_HAVE total;
                moved = 1;
                WEAPON_HAVE *weapon = GetNowSelectWeapon();
                WeaponAllValueSet(weapon, &total, 0);
                if (WeaponMenuCheckEnableSetElem(weapon, &total, WepMenu.unk_179) != 0) {
                    ComMenuSePlay(2);
                } else {
                    ComMenuSePlay(1);
                }
            }
            break;
        case 2:
            if (GamePad.Down(0x1000) != 0) {
                moved = 1;
                if (WepMenu.unk_179 % 5 != 0) {
                    WepMenu.unk_179--;
                } else if (WepMenu.unk_06 != 0) {
                    WepMenu.unk_02 = 9;
                } else {
                    WepMenu.unk_02 = 8;
                }
            } else if (GamePad.Down(0x4000) != 0) {
                moved = 1;
                if (WepMenu.unk_179 % 5 != 4) {
                    WepMenu.unk_179++;
                }
            } else if (GamePad.Down(0x8000) != 0) {
                moved = 1;
                if (WepMenu.unk_179 >= 5) {
                    WepMenu.unk_179 -= 5;
                }
            } else if (GamePad.Down(0x40) != 0) {
                moved = 1;
                ComMenuSePlay(2);
            }
            break;
    }
    if (moved != 0) {
        return;
    }
    if (GamePad.Down(0x20) != 0) {
        ComMenuSePlay(2);
        WepAttachHaveCancel();
        return;
    }
    if (GamePad.Down(0x2000) != 0) {
        switch (WepMenu.unk_178) {
            case 2:
                if (WepMenu.unk_179 < 5) {
                    WepMenu.unk_179 += 5;
                    return;
                }
                WepMenu.unk_02 = 10;
                WepMenu.board.cursor = (WepMenu.board.top_row + 2) * 5;
                return;
            case 1:
            case 0:
                WepMenu.unk_02 = 10;
                WepMenu.board.cursor = (WepMenu.board.top_row + 2) * 5;
                break;
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/battlemenu", WeaponMenuTagKey__Fv);
#endif

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
        if (0 < WepMenu.board.cursor) {
            WepMenu.board.cursor--;
        }
    }
    int holes = GetWeaponHoleNum(weapon->item_no);
    if (WepMenu.board.cursor > holes - 1) {
        WepMenu.board.cursor = holes - 1;
        if (WepMenu.board.cursor < 0) {
            WepMenu.board.cursor = 0;
            WepMenu.unk_02 = 8;
            return;
        }
    }
    if (holes <= 0) {
        WepMenu.board.cursor = 0;
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
        int hole = WepMenu.board.cursor;
        if (BtlHaveItemPt->item_no < 81) {
            if (weapon->attach[hole].item_no <= 0) {
                ComMenuSePlay(2);
                return;
            }
            ComMenuSePlay(6);
            s16 held = BtlHaveItemPt->item_no;
            s16 item_no = weapon->attach[hole].item_no;
            MenuDataSwap(&WepMenu.board.held_attach, &weapon->attach[hole]);
            BtlHaveItemPt->item_no = item_no;
            weapon->attach[hole].item_no = held;
            BtlHaveItemPt->unk_0C = WepMenu.board.cursor;
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
        MenuDataSwap(&weapon->attach[hole], &WepMenu.board.held_attach);
        weapon->attach[hole].item_no = held;
        BtlHaveItemPt->item_no = item_no;
        BtlHaveItemPt->unk_0C = WepMenu.board.cursor;
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
        if (WepMenu.board.cursor < holes - 1) {
            WepMenu.board.cursor++;
            if (WepMenu.board.cursor <= 0) {
                WepMenu.board.cursor = 0;
            }
        } else {
            WepMenu.unk_02 = 10;
            WepMenu.board.cursor = WepMenu.board.top_row * 5;
        }
    } else if (GamePad.Down(0x80)) {
        ComMenuSePlay(2);
    } else if (GamePad.Down(0x4000)) {
        WepMenu.unk_02 = 11;
        WepMenu.unk_179 = 0;
    }
}

/**
 * Handles input while an attachment is being moved on the weapon menu.
 *
 * @mangled WeaponMenuAttachKey__Fv
 * @address 0x200540
 * @size 0x270
 */
static void WeaponMenuAttachKey() {
    if (PersonalBoardKey()) {
        if (WepMenu.unk_06) {
            WepMenu.unk_02 = 9;
            WepMenu.board.cursor = GetWeaponHoleNum(GetNowSelectWeapon()->item_no) - 1;
        } else {
            WepMenu.unk_02 = 8;
        }
    } else if (GamePad.Down(0x40)) {
        switch (WepMenu.board.cursor_area) {
            case 2:
                InitHaveData(BtlHaveItemPt);
                InitHaveAttach(&WepMenu.board.held_attach);
                ComMenuSePlay(2);
                break;
            case 1: {
                DNG_CONSUMABLE *items = BtlMenuStatusPt->consumable_items;
                ATTACH_LIST *slot = (ATTACH_LIST *) &items[WepMenu.board.cursor];
                if (slot->item_no >= 81 || BtlHaveItemPt->item_no >= 81) {
                    ComMenuSePlay(1);
                    s16 held = BtlHaveItemPt->item_no;
                    s16 item_no = slot->item_no;
                    MenuDataSwap(slot, &WepMenu.board.held_attach);
                    BtlHaveItemPt->item_no = item_no;
                    slot->item_no = held;
                    BtlHaveItemPt->unk_0C = WepMenu.board.cursor;
                    BtlHaveItemPt->unk_04 = 10;
                    if (BtlHaveItemPt->item_no >= 81) {
                        WepMenu.unk_06 = 1;
                    } else {
                        InitHaveData(BtlHaveItemPt);
                        InitHaveAttach(&WepMenu.board.held_attach);
                    }
                } else {
                    ComMenuSePlay(2);
                }
                break;
            }
        }
    } else if (GamePad.Down(0x20)) {
        ComMenuSePlay(2);
        WepAttachHaveCancel();
    } else if (GamePad.Down(0x80)) {
        SeitonAttachBoard((ATTACH_LIST *) BtlMenuStatusPt->consumable_items);
        ComMenuSePlay(1);
    }
}
void RepairAndLevelUpDraw(int x, int y, int alpha) {
    int u;
    int v;

    MenuHelpWinDraw(x - 10, y, 10.7f, 2.2f, alpha);
    int row_y = y + 0xE;
    MenuTextureReload(BtlMenuReadBlock);
    int items[2] = {0xB1, 0xB2};
    for (int i = 0; i < 2; i++) {
        int count;
        int item_no = items[i];
        count = GetNowItemNum(item_no, MenuItemPackPt);
        CTexture *icon = RetCTex(item_no, u, v);
        DrawMenu2DSprite(icon, CRect_i_(x + 0x10, row_y, 0x20, 0x20), CRect_i_(u, v, 0x20, 0x20), alpha);
        DrawMenu2DSprite(BtStatus, CRect_i_(x + 0x9A, row_y + 8, 0x10, 0x10), CRect_i_(0x60, 0x58, 0x10, 0x10), alpha);
        int number_x = x + 0xC0;
        if (count / 10 > 0) {
            number_x += NumberSprite[1].width >> 1;
        }
        DrawMenuNumber(count, number_x, row_y + 8, StayTex, NumberSprite[1], 2, alpha);
        row_y += 0x22;
    }
    MenuTextureReload(CommonMenuMes3.tex_block);
    int count_x;
    int name_x = x + 0x36;
    CommonMenuMes3.line_pos[0].x = name_x;
    CommonMenuMes3.line_pos[0].y = y + 0xC;
    count_x = x + 0x4A;
    CommonMenuMes3.line_pos[1].x = count_x;
    CommonMenuMes3.line_pos[1].y = y + 0x1C;
    CommonMenuMes3.line_pos[2].x = name_x;
    CommonMenuMes3.line_pos[2].y = y + 0x2E;
    CommonMenuMes3.line_pos[3].x = count_x;
    CommonMenuMes3.line_pos[3].y = y + 0x3E;
    CommonMenuMes3.stay_frame = 0;
    if (CommonMenuMes3.mes_made != 0x1A7) {
        CommonMenuMes3.MakeMesWin(0x1A7);
    }
    CommonMenuMes3.edge_alpha = alpha;
    CommonMenuMes3.Step();
    CommonMenuMes3.DrawMesWin();
}
void DrawBuildUpWeaponSelect(int x, int y, int cursor) {
    MenuTextureReload(BtlMenuReadBlock);
    float size[7][2] = {{14.2f, 0.0f}, {13.4f, 1.0f}, {13.4f, 1.0f}, {13.4f, 1.0f}, {13.4f, 1.0f}, {13.4f, 1.0f}, {13.4f, 1.0f}};
    s8 offset[7][2] = {{-8, 0}, {-6, -6}, {-6, -6}, {-6, -6}, {-6, -6}, {-6, -6}, {-6, -6}};
    int build;

    MenuHelpWinDraw(x - 0xE + offset[BtlMenuNowLang][0], y - 0xC + offset[BtlMenuNowLang][1], size[BtlMenuNowLang][0],
                    size[BtlMenuNowLang][1], 0x80);
    CommonMenuMes1.stay_frame = 0;
    CommonMenuMes1.line_pos[0].x = x;
    CommonMenuMes1.line_pos[0].y = y - 6;
    y += CommonMenuMes1.char_height;
    CommonMenuMes1.line_pos[1].x = x;
    CommonMenuMes1.line_pos[1].y = y - 6;
    y += 0x1E;
    int count = WeaponStatusBuildUp(GetNowSelectWeapon(), build);
    for (int i = 0; i < count; i++) {
        int selected = 0;
        if (i == cursor) {
            selected = 1;
        }
        DrawWeaponNameBoard(x + 0x10, y, selected, 0x80, 0x6E);
        int name_x = GetWeaponNamePutX(x + 0x76, CommonMenuMes1.GetMesWidth_system(CommonMenuMes1.mes_no[i]));
        if (i + 2 >= 0 && i + 2 < 10) {
            CommonMenuMes1.line_pos[i + 2].x = name_x;
            CommonMenuMes1.line_pos[i + 2].y = y + 5;
        }
        y += 0x26;
    }
    MenuTextureReload(CommonMenuMes1.tex_block);
    CommonMenuMes1.Step();
    CommonMenuMes1.DrawMesWin();
}
#ifdef NON_MATCHING
void WeaponMenuDraw() {
    static int ct = 0;
    CUserStatus *status = (CUserStatus *) BtlMenuStatusPt;
    int alpha;
    int target_x;
    float target_depth;

    BtlMenuTexBlockEnter();
    alpha = 0x80;
    switch (WepMenu.unk_0C) {
        case 1:
            alpha = WepMenu.unk_10 * 9;
            if (alpha > 0x80) {
                alpha = 0x80;
            }
            break;
        case 2:
            alpha = 0x80 - WepMenu.unk_10 * 9;
            if (alpha < 0) {
                alpha = 0;
            }
            break;
    }
    int attach_mode = 0;
    switch (WepMenu.unk_02) {
        case 8:
        case 9:
        case 10:
        case 11:
            attach_mode = 1;
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
            for (int i = 0; i < 6; i++) {
                SYS_CHARA_INFO *chara = &SysChara[i];
                chara->unk_04 += ((float) ((chara->unk_00 - WepMenu.chara) * 0x6E + 0x10E) - chara->unk_04) / 4.0f;
                if (attach_mode == 0 || i == WepMenu.chara) {
                    CTexture *face = MenuCharaFace;
                    int u = 0;
                    int no = chara->unk_00;
                    int v = no * 0x6A;
                    if (no >= 3) {
                        u = 0x6A;
                        v = (no - 3) * 0x6A;
                    }
                    if (i >= status->party_size) {
                        face = BtStatus;
                        u = 0x8C;
                        v = 0x8C;
                    }
                    int face_x = (int) chara->unk_04;
                    DrawMenu2DSprite(face, CRect_i_(face_x, 0xE, 0x64, 0x64), CRect_i_(u, v, 0x6A, 0x6A), alpha, alpha, alpha,
                                     alpha);
                }
            }
            FadeTexX(0xDC, 0x32, 0x172, 0x32, "frame_image", 0);
            if (attach_mode == 0) {
                int arrow_alpha = alpha;
                if (WepMenu.unk_02 == 0) {
                    ct++;
                    if (ct > 1000000) {
                        ct = 0;
                    }
                } else {
                    arrow_alpha = 0;
                }
                if (ct % 50 < 30) {
                    int shift = ct % 30 / 10 * 2;
                    CRect_i_ arrow(0x60, 0x68, 10, 0x18);
                    DrawMenu2DSprite(BtStatus, CRect_i_(0x102 - shift, 0x48, arrow.width, arrow.height), arrow, arrow_alpha);
                    arrow.x += arrow.width;
                    DrawMenu2DSprite(BtStatus, CRect_i_(shift + 0x174, 0x48, arrow.width, arrow.height), arrow, arrow_alpha);
                }
            }
            break;
    }
    switch (WepMenu.unk_02) {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
            target_x = 0xE8 - WepMenu.weapon_slot * 0xD6;
            target_depth = 2.0f + 16.0f * -WepMenu.weapon_slot;
            break;
        case 8:
        case 9:
        case 10:
        case 11: {
            int slot = WepMenu.weapon_slot;
            target_x = (int) (80.0f - (float) (slot * 0xD6));
            target_depth = 2.0f + (-11.0f + 16.0f * -slot);
            break;
        }
    }
    WeaponPos += ((float) target_x - WeaponPos) / 4.0f;
    WepPolyPos += (target_depth - WepPolyPos) / 4.0f;
    int weapon_alpha = alpha;
    switch (WepMenu.unk_0C) {
        case 3:
            weapon_alpha = alpha - 9;
            break;
        case 4:
            weapon_alpha = WepMenu.unk_10 * 5;
            break;
        case 2:
        case 1:
            weapon_alpha = alpha;
            break;
    }
    if (weapon_alpha < 0) {
        weapon_alpha = 0;
    }
    if (weapon_alpha > 0x80) {
        weapon_alpha = 0x80;
    }
    BtlWeaponDraw((int) WeaponPos, WepPolyPos, WepMenu.chara, weapon_alpha);
    if (attach_mode == 0) {
        RepairAndLevelUpDraw(0x4E, 0x144, alpha);
    }
    MenuTextureReload(BtlMenuReadBlock);
    WEP_BUILDUP_INFO builds[5];
    switch (WepMenu.unk_02) {
        case 3:
        case 6:
            DrawDngYesNoDialog(0x88, 0xDD, 0x80);
            MenuHelpWinDraw(0x46, 0x8C, 10.0f, 1.4f, 100);
            CommonMenuMes1.stay_frame = 0;
            CommonMenuMes1.edge_alpha = 0x80;
            MenuTextureReload(CommonMenuMes1.tex_block);
            DrawMenuClsMes(&CommonMenuMes1, 0x58, 0x92);
            break;
        case 4:
            DrawDngYesNoDialog(0x88, 0xF3, 0x80);
            CommonMenuMes1.auto_pos = -1;
            CommonMenuMes1.stay_frame = 1;
            CommonMenuMes1.edge_alpha = 0x80;
            DrawMenuClsMes(&CommonMenuMes1, 0x50, 0x98);
            break;
        case 7:
            AllFadeForMenu(0x40);
            DrawBtlMenuLRCursor(0x158, 0x6E, 0xD4, alpha);
            EnableBuildUpModel(builds, GetNowSelectWeapon());
            DrawWeaponTagBoard(0x16C, 0x78, GetNowSelectWeapon(), 1, builds[WepMenu.board.cursor].weapon_no, 0x80);
        case 5:
            DrawBuildUpWeaponSelect(0x58, 0x9C, WepMenu.board.cursor);
            break;
        case 2:
            DrawWeaponTagBoard(0x18A, 0x64, GetNowSelectWeapon(), 0, 0, 0x80);
        case 1:
            if (GetNowSelectWeapon() != NULL) {
                DrawWeaponSelectDialog(0x70, 0x70, weapon_alpha);
            }
            break;
        case 0:
            if (status->party_size >= 2) {
                DrawBtlMenuLRCursor(0xE6, 0x12, 0x96, alpha);
            }
            break;
        case 8:
        case 9:
        case 10:
        case 11:
            MenuTextureReload(BtlMenuReadBlock);
            DrawPersonalBoard(0x154, 0x78, WepMenu.board.page, alpha, 0);
            CommonTrushDraw(0x232, 0x10C, alpha);
            if (BtlHaveItemPt->item_no >= 0x51) {
                MenuTextureReload(MenuShadowReadBlock);
                int vibe_x = (int) SysCur[0];
                DrawMenuVibeItem(vibe_x, (int) SysCur[1], 2, -0xC, 0x80);
            }
            break;
    }
    if (WepMenu.weapon_slot < 0) {
        WepMenu.weapon_slot = 0;
    }
    if (WepMenu.weapon_slot >= 10) {
        WepMenu.weapon_slot = 9;
    }
    WEAPON_HAVE *weapon = &DngWepHavePt[WepMenu.weapon_slot];
    int holes = GetWeaponHoleNum(weapon->item_no);
    s16 cursor_pos[12][2] = {{0xC0, 0xA5}, {0x50, 0}, {0x16E, 0}, {0x68, 0}, {0x68, 0}, {0x4E, 0},
                             {0x68, 0},    {0x4E, 0}, {0x58, 0xAA}, {0, 0xB8}, {0, 0},  {0, 0}};
    s16 row = (s16) WepMenu.board.cursor * 0x1A;
    cursor_pos[1][1] = row + 0x70;
    cursor_pos[2][1] = WepMenu.unk_07 * 0x18 + 0x86;
    s16 dialog_y = row + 0xDC;
    cursor_pos[3][1] = dialog_y;
    cursor_pos[4][1] = row + 0xF2;
    s16 build_y = CommonMenuMes1.char_height + ((s16) WepMenu.board.cursor * 0x26 + 0xBA);
    cursor_pos[5][1] = build_y;
    cursor_pos[6][1] = dialog_y;
    cursor_pos[7][1] = build_y;
    cursor_pos[9][0] = (0x90 - holes * 0x12) + (s16) WepMenu.board.cursor * 0x2A;
    int cursor_x = cursor_pos[WepMenu.unk_02][0];
    int cursor_y = cursor_pos[WepMenu.unk_02][1];
    if (WepMenu.unk_0C == 12) {
        cursor_x = 0xB4;
        cursor_y = 0x9E;
    }
    if (WepMenu.unk_0C == 13) {
        cursor_x = 0x171;
        cursor_y = WepMenu.unk_09[0] * 0x1A + 0xBE;
    }
    RECT frames[12] = {{0xCD, 0x64, 0xCC, 0xC9}, {0, 0, 0x60, 0x18}, {0, 0, 0xC4, 0x18}, {0, 0, 0x60, 0x18},
                       {0, 0, 0x60, 0x18},       {0, 0, 0xC0, 0x20}, {0, 0, 0x60, 0x18}, {0, 0, 0xC0, 0x20},
                       {0, 0, 0x60, 0x18},       {0, 0, 0x26, 0x26}, {0, 0, 0x26, 0x26}, {0, 0, 0x60, 0x18}};
    frames[1].x = cursor_x + 0x19;
    frames[1].y = cursor_y - 6;
    frames[2].x = cursor_x + 0x1A;
    frames[2].y = cursor_y - 6;
    frames[3].x = cursor_x + 0x18;
    frames[3].y = cursor_y - 6;
    frames[4].x = cursor_x + 0x18;
    frames[4].y = cursor_y - 6;
    frames[5].x = cursor_x + 0x18;
    frames[5].y = cursor_y - 8;
    frames[6].x = cursor_x + 0x18;
    frames[6].y = cursor_y - 6;
    frames[7].x = cursor_x + 0x18;
    frames[7].y = cursor_y - 8;
    frames[8].x = cursor_x + 0x12;
    frames[8].y = cursor_y - 0x18;
    frames[9].x = cursor_x + 0xC;
    frames[9].y = cursor_y - 8;
    frames[10].x = cursor_x + 0xC;
    frames[10].y = cursor_y - 8;
    RECT frame = frames[WepMenu.unk_02];
    WEAPON_HAVE *selected = GetNowSelectWeapon();
    if (selected != NULL && selected->item_no < 0x101) {
        frame = frames[11];
    }
    if (WepMenu.unk_0C == 12) {
        frame.x = cursor_x + 0x19;
        frame.y = cursor_y - 4;
        frame.width = 0x60;
        frame.height = 0x18;
    }
    switch (WepMenu.unk_02) {
        case 9:
        case 5:
            break;
        case 1:
            if (WepMenu.board.cursor >= 4) {
                int shift = 0;
                int options = NowWeaponStatusValue(&DngWepHavePt[WepMenu.weapon_slot]);
                for (int i = 4; WepMenu.board.cursor >= i; i++) {
                    if (options & (1 << (i - 3))) {
                        shift += 0x1A;
                    }
                }
                frame.y = shift + 0xBE - 6;
            }
            break;
        case 10:
            switch (WepMenu.board.cursor_area) {
                case 1:
                    cursor_x = WepMenu.board.cursor % 5 * 0x28 + 0x154;
                    break;
                case 2:
                    cursor_x = 0x220;
                    break;
            }
            frame.x = cursor_x + 0xC;
            frame.y = cursor_y - 8;
            frame.height = 0x26;
            frame.width = 0x26;
            break;
        case 11:
            switch (WepMenu.unk_178) {
                case 0:
                    if (WepMenu.unk_179 < 2) {
                        cursor_x = 0x24;
                        frame.width = 0xCA;
                    } else {
                        cursor_x = 0x2A;
                        frame.width = 0xC4;
                    }
                    break;
                case 1:
                    cursor_x = 0x2A;
                    frame.width = 0xC4;
                    break;
                case 2:
                    cursor_x = WepMenu.unk_179 / 5 * 0x68 + 0x28;
                    frame.width = 0x66;
                    break;
            }
            frame.x = cursor_x + 0x1C;
            frame.y = cursor_y - 6;
            frame.height = 0x18;
            break;
    }
    int vibe;
    if (WepMenu.unk_02 <= 0) {
        vibe = 0x40;
    } else if (BtlHaveItemPt->item_no >= 0x51) {
        cursor_x += 0x12;
        vibe = 0x80;
    } else if ((WepMenu.unk_02 == 9 && ((ATTACH_LIST *) &weapon->attach[WepMenu.board.cursor])->item_no >= 0x51) ||
               (WepMenu.unk_02 == 10 && status->consumable_items[WepMenu.board.cursor].id >= 0x51)) {
        cursor_x += 10;
        vibe = 0x60;
    } else {
        vibe = 0x40;
    }
    SysCur[0] += ((float) cursor_x - SysCur[0]) / 4.0f;
    SysCur[1] += ((float) cursor_y - SysCur[1]) / 4.0f;
    switch (WepMenu.unk_0C) {
        case 10:
        case 9:
        case 8:
        case 7:
        case 4:
        case 2:
        case 1:
            CommonMenuMes1.auto_pos = -1;
            return;
        case 14:
        case 11:
            CommonMenuMes1.auto_pos = 5;
            MenuTextureReload(CommonMenuMes1.tex_block);
            CommonMenuMes1.Step();
            CommonMenuMes1.DrawMesWin();
            return;
        default: {
            int shadow = 0;
            if (WepMenu.unk_02 == 0) {
                shadow = 1;
            }
            if (WepMenu.unk_0C == 13) {
                s8 offset[7][2] = {{-20, -60}, {-24, -68}, {-24, -68}, {-24, -68}, {-24, -68}, {-24, -68}, {-24, -68}};
                DrawDngYesNoDialog(0x190, 0xBE, 0x80);
                CommonMenuMes1.auto_pos = -1;
                CommonMenuMes1.text_x = offset[BtlMenuNowLang][0] + 0x190;
                CommonMenuMes1.text_y = offset[BtlMenuNowLang][1] + 0xBE;
                MenuTextureReload(CommonMenuMes1.tex_block);
                CommonMenuMes1.Step();
                CommonMenuMes1.DrawMesWin();
            }
            DrawMenuWaku(frame.x, frame.y, frame.width, frame.height, shadow, StayTex, 0x80);
            int big = 1;
            if (vibe >= 0x80) {
                big = 0;
            }
            int vibe_x = (int) SysCur[0];
            DrawMenuObjectVibe(vibe_x, (int) SysCur[1], big, vibe);
            return;
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/battlemenu", WeaponMenuDraw__Fv);
#endif

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
    int page = ItemMenuMode.board.page;
    int kind = WhatIsKindofItem(BtlHaveItemPt->item_no);
    s16 held = BtlHaveItemPt->item_no;
    s16 item_no;

    switch (page) {
        case 0:
            if (!kind || kind == -1) {
                MenuDataSwap(&MenuItemPackPt->item[MenuItemPackPt->num + slot], &ItemMenuMode.board.held_item.item_no);
                MenuDataSwap(&ItemMenuMode.board.held_item.volume, &MenuItemPackPt->item_vol[MenuItemPackPt->num + slot]);
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
                MenuDataSwap(attach, &ItemMenuMode.board.held_attach);
                BtlHaveItemPt->item_no = item_no;
                attach->item_no = held;
                swapped = 1;
            }
            break;
    }
    return swapped;
}
void DrawTrushItem() {
    int items[7];
    int values[7];

    for (int i = 0; i < 7; i++) {
        items[i] = 0;
        values[i] = 0;
    }
    if (CheckItemThrow(items, values) == 0 && ItemMenuMode.overflow == 0) {
        return;
    }
    int page = ItemMenuMode.board.page;
    int count[3] = {3, 1, 3};
    int first[3] = {0, 3, 4};
    int entry = first[page];
    int y = 0x7E;
    MenuTextureReload(ItemMenuWeaponIconReadBlock);
    static int ncnt = 0;
    int bright = (int) (112.0f + 48.0f * sinf(3.1415927f * (float) (ncnt - 0x3C) / 60.0f));
    for (int i = 0; i < 3; i++) {
        if ((ItemMenuMode.overflow_pages & (1 << (i + 1))) && page == i) {
            for (int j = 0; j < ItemMenuMode.overflow_count[i]; j++, entry++) {
                DrawMenu2DSprite(CharaStatus, CRect_i_(0x138, y, 0x2A, 0x29), CRect_i_(0xC2, 0xD6, 0x2A, 0x2A), bright, bright,
                                 bright, 0x80);
                DrawIconParts(items[entry], 0x13C, y + 6, 0, 0x280, 0x80, values[entry]);
                y += 0x2E;
            }
            break;
        }
    }
    (void) count;
    ncnt++;
    if (ncnt > 0x3B) {
        ncnt = 0;
    }
    MenuTextureReload(AtoraNameMes.tex_block);
    if (AtoraNameMes.mes_made != 0xBB) {
        AtoraNameMes.MakeMesWin(0xBB);
    }
    AtoraNameMes.stay_frame = 1;
    AtoraNameMes.edge_alpha = 0x80;
    DrawMenuClsMes(&AtoraNameMes, 0x34, 0x152);
}

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
        SetCursorPos(cursor, 0, ItemMenuMode.board.cursor);
        cursor->mode[0] = ItemMenuMode.mode;
        SetCursorChara(cursor, ItemMenuMode.board.page);
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
void ReadSyncItemMenuWepIcon() {
    BG_READ_INFO *file = GetReadBGFile(0);
    LOADTEXTURE_INFO2 textures[3] = {{"#frame_image#640#448#4", 0, 0}, {NULL, 0, 0}, {NULL, 0, 0}};

    textures[0].block_no = ItemMenuWeaponIconReadBlock;
    textures[1].name = (char *) file->buffer;
    textures[1].block_no = ItemMenuWeaponIconReadBlock;
    CharaStatus = TexManager.GetTexture("status", -1);
    TexManager.DeleteTextureBlock(ItemMenuWeaponIconReadBlock);
    TexManager.CleanUpTextureList();
    TexManager.LoadTextureBlockEX(-1, textures);
}

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
    ItemMenuMode.mode = 4;
    ItemMenuMode.chara = chara;
    cursor = SaveData->GetMenuCursor();
    if (cursor->reset_pos == 0) {
        ItemMenuMode.mode = cursor->mode[0];
        if (ItemMenuMode.mode < 0 || ItemMenuMode.mode > 4) {
            ItemMenuMode.mode = 4;
        }
        max = PersonalRetMax(cursor->chara_no);
        ItemMenuMode.board.cursor = cursor->pos[0];
        ItemMenuMode.board.top_row = ItemMenuMode.board.cursor / 5 - 3;
        if (ItemMenuMode.board.top_row < 0) {
            ItemMenuMode.board.top_row = 0;
        }
    } else {
        ItemMenuMode.mode = 4;
        ItemMenuMode.board.cursor = 0;
        ItemMenuMode.board.top_row = 0;
        max = PersonalRetMax(0);
    }
    memset(thrown, 0, sizeof(thrown));
    for (int i = 0; i < 3; i++) {
        ItemMenuMode.overflow_count[i] = 0;
    }
    ItemMenuMode.overflow_pages = 0;
    ItemMenuMode.overflow = 0;
    if (CheckItemThrow(thrown, NULL)) {
        for (int i = 0; i < 3; i++) {
            if (thrown[i] >= 0x84) {
                ItemMenuMode.overflow_count[0]++;
            }
        }
        if (thrown[3] >= 0x101) {
            ItemMenuMode.overflow_count[1]++;
        }
        for (int i = 0; i < 3; i++) {
            if (thrown[i + 4] < 0x51) {
                break;
            }
            ItemMenuMode.overflow_count[2]++;
        }
        for (int i = 0; i < 3; i++) {
            if (ItemMenuMode.overflow_count[i] > 0) {
                ItemMenuMode.overflow_pages |= 1 << (i + 1);
            }
        }
        for (int i = 2; i >= 0; i--) {
            if (ItemMenuMode.overflow_pages & (1 << (i + 1))) {
                ItemMenuMode.board.page = i;
            }
        }
        if (ItemMenuMode.board.page == 1) {
            ItemMenuMode.board.cursor = WhoIsWeaponEquip(thrown[3]) * 10;
            ItemMenuMode.board.top_row = ItemMenuMode.board.cursor / 5;
            if (ItemMenuMode.board.top_row < 0) {
                ItemMenuMode.board.top_row = 0;
            }
            if (ItemMenuMode.board.top_row > 9) {
                ItemMenuMode.board.top_row = 9;
            }
        }
        ItemMenuMode.overflow = 1;
        BtlMenuStatusPt->overflow_flag = 1;
    }
    ItemMenuMode.board.y = 127 - ItemMenuMode.board.top_row * 40;
    int pages = max / 5;
    ItemMenuMode.board.scroll = 140.0f + 114.0f * ItemMenuMode.board.top_row / pages;
    ItemMenuMode.board.cursor_area = 1;
    ItemMenuMode.state = 1;
    ItemMenuMode.counter = 0;
    u_long128 *buffer = BtlMenuReadBuf;
    int size;
    StartBGReadItemMenuWepIcon(buffer, size);
    buffer += (size >> 4) + 1;
    ItemMenuCharaReadBuf = MenuCalcBufAlignment(buffer);
    BtlHaveItemPt = &ItemMenuMode.board.held_item;
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

void ExistItemMenu() {
    int blocks[3] = {0, 0, -1};

    blocks[0] = MenuExtendReadBlock;
    blocks[1] = ItemMenuWeaponIconReadBlock;
    MenuTextureDelete(blocks);
    TexManager.CleanUpTextureList();
    BtlMenuTexBlockEnter();
    for (int i = 0; i < 6; i++) {
        int slot = BtlMenuStatusPt->equipped_weapon_slot[i];
        if (0 > slot || slot >= 10) {
            EquipDefaultWeapon(i);
        }
    }
    ForBackMenu();
}

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
#ifdef NON_MATCHING
int ItemMenuMainKey() {
    CUserStatus *status = (CUserStatus *) BtlMenuStatusPt;
    float effect_x;
    float effect_y;

    switch (MenuExTextureReadFlag) {
        case 0:
            if (ReadBGSync() == 0) {
                if (ItemMenuAlreadyReadWepIconTexFlag == 0) {
                    ReadSyncItemMenuWepIcon();
                    ItemMenuAlreadyReadWepIconTexFlag = 1;
                    ItemMenuMode.state = 2;
                }
                MenuCharaMDSBuild2(ItemMenuMode.chara, MenuExtendReadBlock);
                MenuExTextureReadFlag = 1;
                BtlMDSBuildCnt = 0;
            }
            break;
        case 1:
            BtlMDSBuildCnt++;
            MenuCharaFrame.Step();
            if (ItemMenuMode.chara == 0) {
                MenuCharaFrame.ClothStep(0);
            }
            if (BtlMDSBuildCnt >= 4) {
                MenuExTextureReadFlag = 2;
            }
            break;
    }
    int old_mode = ItemMenuMode.mode;
    int old_cursor = ItemMenuMode.board.cursor;
    int old_chara = ItemMenuMode.chara;
    int old_page = ItemMenuMode.board.page;
    int thrown[18];
    int thrown_vol[18];
    for (int i = 0; i < 18; i++) {
        thrown[i] = 0;
        thrown_vol[i] = 0;
    }
    int throwing = CheckItemThrow(thrown, thrown_vol);
    int over = 0;
    for (int i = 0; i < 3; i++) {
        int maximum = 0;
        GetNowModeMaxNum(i, &maximum);
        if (maximum != 0) {
            over = 1;
        }
    }
    if (IconAutoGet.IsMoveIcon() == 0 && throwing == 0 && over == 0 && BtlHaveItemPt->item_no < 0x51) {
        ItemMenuMode.overflow = 0;
        status->unk_431C = 0;
        DeleteMenuTrushMark();
    }
    switch (ItemMenuMode.state) {
        case 1:
            ToFromSelect(0);
            break;
        case 2: {
            int done = ToFromSelect(0);
            ItemMenuMode.counter++;
            if (ItemMenuMode.counter >= 0x11 && done != 0) {
                BtlEffectFlag = -1;
                ItemMenuMode.state = 0;
                ItemMenuMode.counter = 0;
                BattleMenuFlag = 1;
            }
            break;
        }
        case 3: {
            int done = ToFromSelect(1);
            if (BtlMenuExReadFlag == 0) {
                BtlMenuExReadFlag = DngActItemModelBuild(0);
            }
            ItemMenuMode.counter++;
            if (ItemMenuMode.counter >= 0x12 && done != 0 && BtlMenuExReadFlag != 0) {
                ExistItemMenu();
                BattleMenuFlag = 0;
            }
            break;
        }
        case 4: {
            int state = MenuWepLevelUp.effect_state;
            if (state == 0x15 || state == 0x1D || state == 0x1B || state == 0x1F || state == 0x19 ||
                (state == 0x17 && MenuWepLevelUp.message_no >= 0x191)) {
                if (MenuWepLevelUp.effect.motion_state == 3 && GamePad.Down(0x60) != 0) {
                    ItemMenuMode.state = 0;
                    MenuWepLevelUp.SetSnd(MenuWepLevelUp.snd_volume, MenuWepLevelUp.snd_from, 7);
                    MenuWepLevelUp.Initialize();
                }
            } else if (state == 13 || state == 15 || state == 17 || (state == 23 && MenuWepLevelUp.message_no < 0x190)) {
                if (MenuWepLevelUp.effect.motion_state == 3) {
                    ItemMenuMode.state = 0;
                    MenuWepLevelUp.Initialize();
                }
            }
            break;
        }
        case 6:
            if (GamePad.Down(0x5000) != 0) {
                if (ItemMenuMode.confirm != 0) {
                    ItemMenuMode.confirm = 0;
                } else {
                    ItemMenuMode.confirm = 1;
                }
                ComMenuSePlay(0);
            }
            if (GamePad.Down(0x40) != 0) {
                if (ItemMenuMode.confirm == 0) {
                    int result = ItemUseFunc(status, BtlHaveItemPt->item_no, ItemMenuMode.chara, 2, ItemMenuMode.target_weapon);
                    if ((u32) (result - 1) < 2) {
                        int sounds[2] = {1, 0x18};
                        ComMenuSePlay(sounds[result - 1]);
                    }
                    if (ItemMenuMode.use_target == 2) {
                        effect_x = -16.95f;
                        effect_y = 1.0f;
                    }
                    if (ItemMenuMode.use_target == 4) {
                        effect_x = 4.3f + 3.2f * (float) (ItemMenuMode.board.cursor % 5);
                        effect_y = 6.7f - 3.2f * (float) (ItemMenuMode.board.cursor / 5 - ItemMenuMode.board.top_row);
                    }
                    MenuWepLevelUp.CureEffect((int) effect_x, (int) effect_y,
                                              (CWeaponLevelUp *) (MenuExCashBuffer.base + MenuExCashBuffer.used * 16),
                                              BtlMenuExReadBlock, 0);
                    InitHaveData(BtlHaveItemPt);
                    ItemMenuMode.state = 0;
                    ComMenuSePlay(0x18);
                } else {
                    ItemMenuMode.state = 0;
                    ComMenuSePlay(2);
                }
            } else if (GamePad.Down(0x20) != 0) {
                ItemMenuMode.state = 0;
                ComMenuSePlay(2);
            }
            break;
        case 0:
            switch (ItemMenuMode.mode) {
                case 0:
                case 1:
                case 2:
                case 3:
                    ChangeMenuChara();
                case 5:
                    ItemMenuModeKey();
                    break;
                case 4: {
                    int row = ItemMenuMode.board.cursor / 5 - ItemMenuMode.board.top_row;
                    if (PersonalBoardKey() != 0) {
                        if (row < 2) {
                            ItemMenuMode.mode = 0;
                            ItemMenuMode.board.cursor = 2;
                        } else {
                            ItemMenuMode.mode = 1;
                        }
                        if ((ItemMenuMode.overflow_pages & (1 << (ItemMenuMode.board.page + 1))) && ItemMenuMode.overflow != 0) {
                            ItemMenuMode.mode = 5;
                            ItemMenuMode.board.cursor = row;
                            int last = ItemMenuMode.overflow_count[ItemMenuMode.board.page] - 1;
                            if (last < ItemMenuMode.board.cursor) {
                                ItemMenuMode.board.cursor = last;
                            }
                            if (ItemMenuMode.board.cursor <= 0) {
                                ItemMenuMode.board.cursor = 0;
                            }
                        }
                    }
                    break;
                }
            }
            if (MenuExTextureReadFlag < 2 || MenuWepLevelUp.operation_kind != -1) {
                break;
            }
            if (GamePad.Down(0x40) != 0) {
                int cursor = ItemMenuMode.board.cursor;
                COM_ITEM_INFO *info = GetCommonItemInfo(BtlHaveItemPt->item_no);
                switch (ItemMenuMode.mode) {
                    case 0: {
                        int held = BtlHaveItemPt->item_no;
                        if ((held >= 0x51 && held < 0x84) || held >= 0x101) {
                            ComMenuSePlay(2);
                        } else if (IconAutoGet.IsMoveIcon() != 0) {
                            ComMenuSePlay(2);
                        } else {
                            ITEM_DATA *slot_data = NULL;
                            if (MenuItemPackPt->quick_item_slot[cursor] >= 0x84) {
                                slot_data = GetItemData(MenuItemPackPt->quick_item_slot[cursor]);
                            }
                            int held_kind = 0;
                            ITEM_DATA *held_data = NULL;
                            if (BtlHaveItemPt->item_no >= 0x84) {
                                held_data = GetItemData(BtlHaveItemPt->item_no);
                                held_kind = held_data->stack_kind;
                            }
                            int stack = 0;
                            int ok = 0;
                            int take = 0;
                            switch (held_kind) {
                                case 2:
                                    break;
                                case 1:
                                    if (slot_data == NULL) {
                                        ok = 1;
                                    } else {
                                        switch (slot_data->stack_kind) {
                                            case 1:
                                                ok = 1;
                                                break;
                                            case 0:
                                                ok = 1;
                                                if (MenuItemPackPt->quick_item_qty[cursor] >= 2) {
                                                    ok = 0;
                                                }
                                                break;
                                        }
                                    }
                                    break;
                                case 0:
                                    if (slot_data == NULL) {
                                        ok = 1;
                                    } else {
                                        ok = 1;
                                        if (slot_data->stack_kind == 0) {
                                            if (MenuItemPackPt->quick_item_slot[cursor] == BtlHaveItemPt->item_no) {
                                                if (MenuItemPackPt->quick_item_qty[cursor] < 9) {
                                                    stack = 1;
                                                } else {
                                                    ok = 0;
                                                }
                                            } else if (held_data == NULL) {
                                                take = 1;
                                            } else if (MenuItemPackPt->quick_item_qty[cursor] >= 2) {
                                                ok = 0;
                                            }
                                        }
                                    }
                                    break;
                            }
                            if (ok == 0) {
                                ComMenuSePlay(2);
                            } else {
                                if (stack != 0) {
                                    if (MenuItemPackPt->quick_item_qty[cursor] == 0) {
                                        MenuItemPackPt->quick_item_qty[cursor] = 1;
                                    } else {
                                        MenuItemPackPt->quick_item_qty[cursor]++;
                                    }
                                    InitHaveData(BtlHaveItemPt);
                                } else if (take != 0) {
                                    BtlHaveItemPt->item_no = MenuItemPackPt->quick_item_slot[cursor];
                                    BtlHaveItemPt->unk_00 = 0;
                                    BtlHaveItemPt->unk_0C = cursor;
                                    MenuItemPackPt->quick_item_qty[cursor]--;
                                    if (MenuItemPackPt->quick_item_qty[cursor] <= 0) {
                                        MenuItemPackPt->quick_item_slot[cursor] = -1;
                                        MenuItemPackPt->quick_item_qty[cursor] = 0;
                                    }
                                } else if (ok != 0) {
                                    MenuDataSwap(&MenuItemPackPt->quick_item_slot[cursor], &BtlHaveItemPt->item_no);
                                    int vol = status->active_item_vol[cursor];
                                    status->active_item_vol[cursor] = BtlHaveItemPt->volume;
                                    BtlHaveItemPt->volume = vol;
                                    if (MenuItemPackPt->quick_item_slot[cursor] >= 0x84) {
                                        MenuItemPackPt->quick_item_qty[cursor] = 1;
                                    } else {
                                        MenuItemPackPt->quick_item_qty[cursor] = 0;
                                    }
                                    if (BtlHaveItemPt->item_no >= 0x84) {
                                        BtlHaveItemPt->unk_00 = 0;
                                        BtlHaveItemPt->unk_0C = cursor;
                                    }
                                }
                                ComMenuSePlay(1);
                            }
                        }
                        break;
                    }
                    case 1:
                        if (info == NULL) {
                            ComMenuSePlay(2);
                        } else if (info->kind != 1) {
                            ComMenuSePlay(2);
                        } else {
                            int result = ItemUseFunc(status, BtlHaveItemPt->item_no, ItemMenuMode.chara, 1, NULL);
                            int sounds[4] = {2, 1, 0x18, -1};
                            int sound;
                            if (result < 4) {
                                sound = sounds[result];
                            } else {
                                sound = 2;
                            }
                            if (sound == 2) {
                                ComMenuSePlay(2);
                            } else {
                                ITEM_DATA *data = GetItemData(BtlHaveItemPt->item_no);
                                int effect = -1;
                                if (sound > 0) {
                                    u32 use = data->use_flags;
                                    if ((use & 0x80) && (data->kind_flags & 4)) {
                                        effect = 5;
                                        effect_x = -5.0f;
                                        effect_y = -3.0f;
                                    }
                                    if ((use & 0x40) && (data->kind_flags & 4)) {
                                        effect = 4;
                                        effect_x = -5.5f;
                                        effect_y = -6.0f;
                                        ComMenuSePlay(0x13);
                                    }
                                    if ((data->use_flags & 0x20) && (data->kind_flags & 0x20)) {
                                        effect = 8;
                                        effect_x = -5.5f;
                                        effect_y = -6.0f;
                                        int volume = GetMenuItemUseVolume();
                                        MenuWepLevelUp.message_no = ItemMenuMode.chara;
                                        MenuWepLevelUp.message_value = volume;
                                    }
                                    if ((data->kind_flags & 1) && ((data->use_flags & 0x4000) || (data->use_flags & 0x8000) ||
                                                                   (data->use_flags & 0x10000) || (data->use_flags & 0x20000) ||
                                                                   (data->use_flags & 0x3C000))) {
                                        int message;
                                        switch (BtlHaveItemPt->item_no) {
                                            case 0x97:
                                                message = 0x1A2;
                                                break;
                                            case 0x98:
                                                message = 0x1A3;
                                                break;
                                            case 0x99:
                                                message = 0x1A4;
                                                break;
                                            case 0x9A:
                                                message = 0x1A5;
                                                break;
                                            default:
                                                message = -1;
                                                break;
                                        }
                                        MenuWepLevelUp.message_no = message;
                                        MenuWepLevelUp.message_value = 0;
                                        effect = 9;
                                        effect_x = -6.0f;
                                        effect_y = -2.0f;
                                        ComMenuSePlay(0x13);
                                    }
                                    if ((data->kind_flags & 1) && (data->use_flags & 0x1000)) {
                                        effect = 9;
                                        if (BtlMenuMode == 0) {
                                            ComMenuSePlay(0x6F);
                                        }
                                        effect_x = -6.0f;
                                        effect_y = -2.0f;
                                    }
                                    if (BtlHaveItemPt->item_no == 0xB3) {
                                        effect = 13;
                                        effect_x = 19.03f;
                                        effect_y = 9.1f;
                                        int volume = GetMenuItemUseVolume();
                                        MenuWepLevelUp.message_no = ItemMenuMode.chara;
                                        MenuWepLevelUp.message_value = volume;
                                    }
                                    if (BtlHaveItemPt->item_no == 0xB4) {
                                        effect = 12;
                                        effect_x = -5.5f;
                                        effect_y = -6.0f;
                                        int volume = GetMenuItemUseVolume();
                                        MenuWepLevelUp.message_no = ItemMenuMode.chara;
                                        MenuWepLevelUp.message_value = volume;
                                    }
                                    if (BtlHaveItemPt->item_no == 0xB6) {
                                        effect = 11;
                                        effect_x = -5.5f;
                                        effect_y = -6.0f;
                                        int volume = GetMenuItemUseVolume();
                                        MenuWepLevelUp.message_no = ItemMenuMode.chara;
                                        MenuWepLevelUp.message_value = volume;
                                    }
                                    if (BtlHaveItemPt->item_no == 0xB0) {
                                        effect = 10;
                                        effect_x = -5.5f;
                                        effect_y = -2.0f;
                                        int volume = GetMenuItemUseVolume();
                                        MenuWepLevelUp.message_no = ItemMenuMode.chara;
                                        MenuWepLevelUp.message_value = volume;
                                    }
                                    if (effect > 0) {
                                        ItemMenuMode.state = 4;
                                        MenuWepLevelUp.CureEffect((int) effect_x, (int) effect_y,
                                                                  (CWeaponLevelUp *) (MenuExCashBuffer.base + MenuExCashBuffer.used * 16),
                                                                  BtlMenuExReadBlock, effect);
                                    }
                                    InitHaveData(BtlHaveItemPt);
                                }
                            }
                        }
                        break;
                    case 2: {
                        ItemMenuMode.target_weapon =
                            &status->chara_weapons[ItemMenuMode.chara][status->equipped_weapon_slot[ItemMenuMode.chara]];
                        int is_default = 0;
                        WEAPON_HAVE *weapon = ItemMenuMode.target_weapon;
                        int before = weapon->item_no;
                        if (before == GetDefaultWeaponNo(ItemMenuMode.chara)) {
                            is_default = 1;
                        }
                        int held = BtlHaveItemPt->item_no;
                        if (held == 0xB2 && is_default == 0) {
                            WEAPON_HAVE *target = ItemMenuMode.target_weapon;
                            if (target->unk_14 >= GetWeaponMaxExp(weapon)) {
                                ComMenuSePlay(2);
                            } else if (target->unk_02 >= 99) {
                                ComMenuSePlay(2);
                            } else if (target->item_no == 0x10C && GetMenuHebikiriFlag() == 0) {
                                ComMenuSePlay(2);
                            } else {
                                ItemMenuMode.state = 6;
                                ItemMenuMode.use_target = 2;
                                ItemMenuMode.confirm = 1;
                                ComMenuSePlay(1);
                            }
                        } else if (held != 0xB2 && held != 0xB1) {
                            ComMenuSePlay(2);
                        } else {
                            int result = ItemUseFunc(status, held, ItemMenuMode.chara, 4, weapon);
                            int after = ItemMenuMode.target_weapon->item_no;
                            if ((u32) (result - 1) < 2) {
                                s16 sounds[2] = {1, 0x18};
                                ComMenuSePlay(sounds[result - 1]);
                                MenuWepLevelUp.CureEffect(-0x10, 1, (CWeaponLevelUp *) (MenuExCashBuffer.base + MenuExCashBuffer.used * 16),
                                                          BtlMenuExReadBlock, 0);
                                if (BtlMenuMode == 0) {
                                    if (before != after && ItemMenuMode.chara == status->cur_chara) {
                                        EquipWeaponFrame(&DefaultWeapon, ItemMenuMode.chara, CharaMainHandViewFlag);
                                        if (status->cur_chara == 5) {
                                            NowMainEffect = &CharaMainEffectCrash;
                                        }
                                    }
                                    MenuWeaponSpSet(&MainWeapon, ItemMenuMode.target_weapon);
                                }
                                SetNowEquipWeaponDataForMsg(ItemMenuMode.target_weapon->item_no, ItemMenuMode.target_weapon->unk_02);
                                InitHaveData(BtlHaveItemPt);
                            } else {
                                ComMenuSePlay(2);
                            }
                        }
                        break;
                    }
                    case 3:
                        ComMenuSePlay(2);
                        break;
                    case 4: {
                        s16 held = BtlHaveItemPt->item_no;
                        PERSONAL_BOARD *board = &ItemMenuMode.board;
                        if (board->cursor_area == 2) {
                            if (held < 0x51) {
                                ComMenuSePlay(2);
                            } else if (IsEnableTrushThrow(held) != 0) {
                                board->trash_anim = 1;
                                board->trash_frame = 0;
                                InitHaveData(BtlHaveItemPt);
                                ComMenuSePlay(1);
                            } else {
                                ComMenuSePlay(2);
                            }
                        } else {
                            int before = -1;
                            if (ItemMenuMode.board.page == 1) {
                                ItemMenuMode.target_weapon =
                                    &status->chara_weapons[ItemMenuMode.board.cursor / 10][ItemMenuMode.board.cursor % 10];
                                before = ItemMenuMode.target_weapon->item_no;
                            }
                            int result = PersonalBoardItemGetorSwap(ItemMenuMode.board.cursor);
                            if (result == 0) {
                                ComMenuSePlay(2);
                            } else if (result == 1) {
                                if (BtlHaveItemPt->item_no >= 0x51) {
                                    BtlHaveItemPt->unk_00 = 4;
                                } else {
                                    InitHaveData(BtlHaveItemPt);
                                    InitHaveWep(&ItemMenuMode.board.weapon);
                                    InitHaveAttach(&ItemMenuMode.board.held_attach);
                                }
                                ComMenuSePlay(1);
                            } else if (result == 2) {
                                float y = 6.7f - 3.2f * (float) (ItemMenuMode.board.cursor / 5 - ItemMenuMode.board.top_row);
                                if (held == 0xB1) {
                                    MenuWepLevelUp.CureEffect((int) (4.3f + 3.2f * (float) (ItemMenuMode.board.cursor % 5)), (int) y,
                                                              (CWeaponLevelUp *) (MenuExCashBuffer.base + MenuExCashBuffer.used * 16),
                                                              BtlMenuExReadBlock, 0);
                                }
                                if (ItemMenuMode.board.page == 1) {
                                    if (held == 0xB1) {
                                        if (BtlMenuMode == 0) {
                                            if (ItemMenuMode.target_weapon->item_no != before) {
                                                EquipWeaponFrame(&DefaultWeapon, ItemMenuMode.chara, CharaMainHandViewFlag);
                                            }
                                            MenuWeaponSpSet(&MainWeapon, ItemMenuMode.target_weapon);
                                        }
                                        ComMenuSePlay(0x18);
                                    }
                                    if (held == 0xB2 && before != GetDefaultWeaponNo(ItemMenuMode.board.cursor / 10)) {
                                        ItemMenuMode.state = 6;
                                        ItemMenuMode.use_target = 4;
                                        ItemMenuMode.confirm = 1;
                                        ComMenuSePlay(1);
                                    }
                                }
                            } else {
                                ComMenuSePlay(2);
                            }
                        }
                        break;
                    }
                    case 5:
                        if (ItemTrushKey(thrown, thrown_vol, ItemMenuMode.board.cursor) != 0) {
                            BtlHaveItemPt->unk_00 = 5;
                            BtlHaveItemPt->unk_0C = ItemMenuMode.board.cursor;
                            ComMenuSePlay(1);
                        } else {
                            ComMenuSePlay(2);
                        }
                        break;
                }
            } else if (GamePad.Down(0x20) != 0) {
                ComMenuSePlay(2);
                if (BtlHaveItemPt->item_no < 0x51 && IconAutoGet.IsMoveIcon() == 0 && ItemMenuMode.overflow == 0) {
                    BattleMenuFlag = 0x11;
                    if (BtlMenuMode == 0) {
                        BtlMenuExReadFlag = DngActItemModelReadStart(BtlMenuReadBuf);
                    }
                    ExitItemSelect();
                    ItemMenuMode.state = 3;
                    ItemMenuMode.counter = 0;
                } else if (IconAutoGet.IsMoveIcon() != 0) {
                    ComMenuSePlay(2);
                } else {
                    s16 held = BtlHaveItemPt->item_no;
                    switch (BtlHaveItemPt->unk_00) {
                        case 5:
                            switch (WhatIsKindofItem(held)) {
                                case 0:
                                    MenuDataSwap(&BtlHaveItemPt->item_no, &MenuItemPackPt->item[MenuItemPackPt->num + BtlHaveItemPt->unk_0C]);
                                    MenuDataSwap(&BtlHaveItemPt->volume, &MenuItemPackPt->item_vol[MenuItemPackPt->num + BtlHaveItemPt->unk_0C]);
                                    break;
                                case 1: {
                                    WEAPON_HAVE *weapons = status->chara_weapons[WhoIsWeaponEquip(held)];
                                    s16 item_no = weapons[10].item_no;
                                    MenuDataSwap(&weapons[10], &ItemMenuMode.board.weapon);
                                    BtlHaveItemPt->item_no = item_no;
                                    weapons[10].item_no = held;
                                    if (BtlHaveItemPt->item_no < 0x101) {
                                        InitHaveData(BtlHaveItemPt);
                                        InitHaveWep(&ItemMenuMode.board.weapon);
                                    }
                                    break;
                                }
                                case 2: {
                                    ATTACH_LIST *attach = (ATTACH_LIST *) &status->consumable_items[BtlHaveItemPt->unk_0C];
                                    s16 item_no = attach->item_no;
                                    MenuDataSwap(attach, &ItemMenuMode.board.held_attach);
                                    BtlHaveItemPt->item_no = item_no;
                                    attach->item_no = held;
                                    break;
                                }
                            }
                            break;
                        case 4:
                            PersonalBoardItemCancel();
                            break;
                        case 0: {
                            int slot = BtlHaveItemPt->unk_0C;
                            s16 *slot_item = &MenuItemPackPt->quick_item_slot[slot];
                            int vol = status->active_item_vol[slot];
                            int qty = MenuItemPackPt->quick_item_qty[slot];
                            if (qty < 2 && *slot_item != held && held >= 0x84) {
                                MenuDataSwap(slot_item, &BtlHaveItemPt->item_no);
                                int held_vol = BtlHaveItemPt->volume;
                                if (held_vol <= 0) {
                                    held_vol = 0;
                                }
                                status->active_item_vol[slot] = held_vol;
                                BtlHaveItemPt->volume = vol;
                                MenuItemPackPt->quick_item_qty[slot] = 1;
                            } else if (*slot_item == held && held >= 0x84 && qty < 9) {
                                switch (GetItemData(held)->stack_kind) {
                                    case 1: {
                                        MenuDataSwap(slot_item, &BtlHaveItemPt->item_no);
                                        int held_vol = BtlHaveItemPt->volume;
                                        if (held_vol <= 0) {
                                            held_vol = 0;
                                        }
                                        status->active_item_vol[slot] = held_vol;
                                        BtlHaveItemPt->volume = vol;
                                        MenuItemPackPt->quick_item_qty[slot] = 1;
                                        break;
                                    }
                                    case 0:
                                        MenuItemPackPt->quick_item_qty[slot]++;
                                        InitHaveData(BtlHaveItemPt);
                                        break;
                                }
                                if (BtlHaveItemPt->item_no < 0x51) {
                                    InitHaveData(BtlHaveItemPt);
                                }
                            }
                            break;
                        }
                    }
                }
            } else if (GamePad.Down(0x80) != 0) {
                switch (ItemMenuMode.mode) {
                    case 0: {
                        int cursor = ItemMenuMode.board.cursor;
                        if (MenuItemPackPt->quick_item_slot[cursor] > 0) {
                            for (int i = 0; MenuItemPackPt->quick_item_qty[cursor] > 0 || i < MenuItemPackPt->num; i++) {
                                if (MenuItemPackPt->item[i] < 0) {
                                    MenuItemPackPt->item[i] = MenuItemPackPt->quick_item_slot[cursor];
                                    MenuItemPackPt->item_vol[i] = status->active_item_vol[cursor];
                                    status->active_item_vol[cursor] = 0;
                                    MenuItemPackPt->quick_item_qty[cursor]--;
                                    if (MenuItemPackPt->quick_item_qty[cursor] <= 0) {
                                        MenuItemPackPt->quick_item_slot[cursor] = -1;
                                        break;
                                    }
                                }
                            }
                        }
                        if (status->unk_431C != 0) {
                            DeleteMenuTrushMark();
                            SetMenuTrushMark((ITEM_PACK *) status->active_item);
                        }
                        ComMenuSePlay(2);
                        break;
                    }
                    case 1:
                    case 3:
                    case 4:
                        switch (ItemMenuMode.board.page) {
                            case 0:
                                SeitonItemBoard(MenuItemPackPt);
                                if (status->unk_431C != 0) {
                                    SetMenuTrushMark((ITEM_PACK *) status->active_item);
                                }
                                ComMenuSePlay(1);
                                break;
                            case 2:
                                SeitonAttachBoard((ATTACH_LIST *) status->consumable_items);
                                ComMenuSePlay(1);
                                break;
                        }
                        break;
                }
            } else if (GamePad.Down(0x10) != 0) {
                int cursor = ItemMenuMode.board.cursor;
                s16 *items = MenuItemPackPt->item;
                switch (ItemMenuMode.mode) {
                    case 0: {
                        s16 slot_item = MenuItemPackPt->quick_item_slot[cursor];
                        if (slot_item < 0x84) {
                            ComMenuSePlay(2);
                            break;
                        }
                        ITEM_DATA *data = GetItemData(slot_item);
                        if (data->stack_kind == 2) {
                            ComMenuSePlay(2);
                            break;
                        }
                        int moving = IconAutoGet.IsSameItem(MenuItemPackPt->quick_item_slot[cursor]);
                        if (moving > 0) {
                            ComMenuSePlay(1);
                        } else if (data->stack_kind == 1) {
                            ComMenuSePlay(2);
                        } else {
                            int space = IconAutoGet.GetSpace();
                            int qty = MenuItemPackPt->quick_item_qty[cursor];
                            int total = qty + moving;
                            if (total >= 9 || space < 0) {
                                ComMenuSePlay(2);
                            } else {
                                s16 held = BtlHaveItemPt->item_no;
                                if (held >= 0x84 && held == MenuItemPackPt->quick_item_slot[cursor] && total == 8) {
                                    MenuItemPackPt->quick_item_qty[cursor] = qty + 1;
                                    BtlHaveItemPt->item_no = 0;
                                    ComMenuSePlay(1);
                                } else {
                                    int found = 0;
                                    for (int i = 0; i < MenuItemPackPt->num; i++) {
                                        int want = MenuItemPackPt->quick_item_slot[cursor];
                                        if ((want < 0x84 || want == items[i]) && (want >= 0x84 || held == items[i])) {
                                            int y = (int) (ItemMenuMode.board.y + (float) (i / 5 * 0x28));
                                            if (y >= 0x78 && y < 0x119) {
                                                if (want < 0) {
                                                    want = held;
                                                }
                                                IconAutoGet.IconMoveTarSet(space, cursor, want, MenuItemPackPt->item_vol[i],
                                                                           (float) (i % 5 * 0x28 + 0x168), (float) y);
                                            } else {
                                                if (want <= 0) {
                                                    MenuItemPackPt->quick_item_slot[cursor] = held;
                                                }
                                                MenuItemPackPt->quick_item_qty[cursor]++;
                                            }
                                            items[i] = -1;
                                            found = 1;
                                            break;
                                        }
                                    }
                                    if (found == 0) {
                                        if (BtlHaveItemPt->item_no > 0 &&
                                            BtlHaveItemPt->item_no == MenuItemPackPt->quick_item_slot[cursor]) {
                                            MenuItemPackPt->quick_item_qty[cursor]++;
                                            BtlHaveItemPt->item_no = 0;
                                            found = 1;
                                        }
                                    }
                                    if (found != 0) {
                                        ComMenuSePlay(1);
                                    } else {
                                        ComMenuSePlay(2);
                                    }
                                }
                            }
                        }
                        break;
                    }
                    case 4:
                        if (ItemMenuMode.board.cursor_area == 2) {
                            ComMenuSePlay(2);
                        } else if (ItemMenuMode.board.page == 1 || ItemMenuMode.board.page == 2) {
                            ComMenuSePlay(2);
                        } else {
                            int space = IconAutoGet.GetSpace();
                            if (space < 0) {
                                break;
                            }
                            if (IconAutoGet.IsMoveIcon() != 0) {
                                ComMenuSePlay(2);
                                break;
                            }
                            int pos = ItemMenuMode.board.cursor;
                            int item_no = SearchBoardNowPosItemExist(ItemMenuMode.board.page, pos);
                            if (item_no < 0x84) {
                                ComMenuSePlay(2);
                                break;
                            }
                            ITEM_DATA *data = GetItemData(item_no);
                            if (data->stack_kind == 2) {
                                ComMenuSePlay(2);
                                break;
                            }
                            int vol = MenuItemPackPt->item_vol[ItemMenuMode.board.cursor];
                            int same = 0;
                            int empty = -1;
                            int slot;
                            for (slot = 0; slot < 3; slot++) {
                                s16 slot_item = MenuItemPackPt->quick_item_slot[slot];
                                int moving = IconAutoGet.GetMoveIconGole(slot, slot_item);
                                if ((data->stack_kind == 0 && slot_item == item_no &&
                                     MenuItemPackPt->quick_item_qty[slot] + moving < 9) ||
                                    (data->stack_kind == 1 && slot_item < 0x84)) {
                                    same = 1;
                                    break;
                                }
                                if (slot_item < 0x84) {
                                    empty = slot;
                                    break;
                                }
                            }
                            if (same == 0 && empty < 0) {
                                ComMenuSePlay(2);
                                break;
                            }
                            int target = 0;
                            if (same != 0) {
                                target = slot;
                                if (GetItemData(item_no)->stack_kind == 1 && MenuItemPackPt->quick_item_qty[slot] == 1) {
                                    ComMenuSePlay(2);
                                    break;
                                }
                            } else if (empty >= 0) {
                                target = empty;
                            }
                            int y = (int) (ItemMenuMode.board.y + (float) (pos / 5 * 0x28));
                            if (y >= 0x78 && y < 0x119) {
                                IconAutoGet.IconMoveTarSet(space, target, item_no, vol, (float) (pos % 5 * 0x28 + 0x176), (float) y);
                            } else {
                                MenuItemPackPt->quick_item_qty[target]++;
                            }
                            items[pos] = -1;
                            ComMenuSePlay(1);
                        }
                        break;
                }
            }
            break;
        case 5:
            if (DebugItemGetKey() == -1) {
                ItemMenuMode.state = 0;
            }
            break;
    }
    if (old_mode != ItemMenuMode.mode || old_cursor != ItemMenuMode.board.cursor || old_chara != ItemMenuMode.chara ||
        old_page != ItemMenuMode.board.page) {
        ComMenuSePlay(0);
    }
    if (GamePad.Down(0xF) != 0 && ItemMenuMode.mode == 1 && old_chara == ItemMenuMode.chara) {
        ComMenuSePlay(2);
    }
    PERSONAL_BOARD *board = &ItemMenuMode.board;
    int cursor = board->cursor;
    int chara_mes = -1;
    int value = -1;
    int name_mes = -1;
    GetCommonItemInfo(BtlHaveItemPt->item_no);
    s16 held = BtlHaveItemPt->item_no;
    if (held >= 0x51) {
        if (held == 0x5A) {
            name_mes = GetWeaponMsgNo2(ItemMenuMode.board.held_attach.unk_02);
        }
        value = GetAttachVolumeForMsg(&ItemMenuMode.board.held_attach);
    }
    int messages[7] = {-1, 0xC1, 0xBF, 0xBD, -1, -1, -1};
    int message = messages[ItemMenuMode.mode];
    switch (ItemMenuMode.mode) {
        case 0:
            if (MenuItemPackPt->quick_item_slot[cursor] >= 0x84) {
                message = MenuItemPackPt->quick_item_slot[cursor] + 0x1F4;
            }
            break;
        case 1:
            chara_mes = ItemMenuMode.chara;
            break;
        case 2:
            GetNowEquipWeaponDataForMsg(name_mes, value);
            break;
        case 5:
            switch (ItemMenuMode.board.page) {
                case 0: {
                    s16 item_no = MenuItemPackPt->item[MenuItemPackPt->num + ItemMenuMode.board.cursor];
                    if (item_no >= 0x84) {
                        message = item_no + 0x1F4;
                    }
                    break;
                }
                case 1:
                    for (int i = 0; i < 6; i++) {
                        WEAPON_HAVE *weapon = &status->chara_weapons[i][10];
                        if (weapon->item_no >= 0x101) {
                            message = GetWeaponMsgNo2(weapon->item_no) + 0x1F4;
                            value = weapon->unk_02;
                            break;
                        }
                    }
                    break;
                case 2: {
                    ATTACH_LIST *attach = (ATTACH_LIST *) &status->consumable_items[40 + cursor];
                    if (attach->item_no >= 0x51) {
                        message = attach->item_no + 0x1F4;
                        if (attach->item_no == 0x5A) {
                            name_mes = GetWeaponMsgNo2(attach->unk_02);
                        }
                        value = GetAttachVolumeForMsg(attach);
                    }
                    break;
                }
            }
            break;
        case 4:
            switch (board->cursor_area) {
                case 1:
                    switch (board->page) {
                        case 0:
                            if (MenuItemPackPt->item[cursor] >= 0x84) {
                                message = MenuItemPackPt->item[cursor] + 0x1F4;
                            }
                            break;
                        case 1: {
                            WEAPON_HAVE *weapon = &status->chara_weapons[board->cursor / 10][board->cursor % 10];
                            if (weapon->item_no >= 0x101) {
                                message = GetWeaponMsgNo2(weapon->item_no) + 0x1F4;
                                value = weapon->unk_02;
                            }
                            break;
                        }
                        case 2: {
                            ATTACH_LIST *attach = (ATTACH_LIST *) &board->consumables[ItemMenuMode.board.cursor];
                            if (attach->item_no >= 0x51) {
                                message = attach->item_no + 0x1F4;
                                value = GetAttachVolumeForMsg(attach);
                                if (attach->item_no == 0x5A) {
                                    name_mes = GetWeaponMsgNo2(attach->unk_02);
                                }
                            }
                            break;
                        }
                    }
                    break;
                case 2:
                    if (BtlHaveItemPt->item_no < 0x51) {
                        message = 0xBE;
                    }
                    break;
            }
            break;
    }
    if (message < 0) {
        message = 0;
    }
    if (ItemMenuMode.state != 5) {
        int remake = 0;
        if (CommonMenuMes2.mes_made != message) {
            remake = 1;
        }
        if ((name_mes > 0 && CommonMenuMes2.mes_no[0] != name_mes + 0x64) || (value >= 0 && CommonMenuMes2.value != value) ||
            (chara_mes >= 0 && CommonMenuMes2.mes_no[0] != chara_mes + 0x32)) {
            remake = 1;
        }
        if (remake != 0) {
            CommonMenuMes2.value_signed = 1;
            CommonMenuMes2.value_show = 0;
            CommonMenuMes2.value = value;
            if (name_mes > 0) {
                CommonMenuMes2.mes_no[0] = name_mes + 0x64;
            }
            if (chara_mes >= 0) {
                CommonMenuMes2.mes_no[0] = chara_mes + 0x32;
            }
            CommonMenuMes2.mes_made = -1;
            CommonMenuMes2.MakeMesWin(message);
        }
    }
    if (ItemMenuMode.overflow == 0) {
        switch (ItemMenuMode.mode) {
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
            case 5: {
                s16 names[6] = {0xB4, 0xB6, 0xB6, 0xB6, 0xB5, 0xB6};
                s16 name = names[ItemMenuMode.mode];
                if (AtoraNameMes.mes_made != name) {
                    AtoraNameMes.MakeMesWin(name);
                }
                break;
            }
        }
    }
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/battlemenu", ItemMenuMainKey__Fv);
#endif
#ifdef NON_MATCHING
void ItemMenuModeDraw() {
    CUserStatus *status = (CUserStatus *) BtlMenuStatusPt;

    BtlMenuTexBlockEnter();
    CharaStatus = TexManager.GetTexture("status", -1);
    switch (ItemMenuMode.mode) {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5: {
            ActiveItemDraw(0x3A, 0x4A, 0x80);
            DrawPersonalBoard(0x154, 0x78, ItemMenuMode.board.page, 0x80, 0);
            CommonTrushDraw(0x232, 0x10C, 0x80);
            CommonMoneyBoardDraw(0x163, 0x120, status->money, 0x80);
            DrawTrushItem();
            IconAutoGet.IconAutoMove();
            IconAutoGet.IconAutoMoveDraw();
            ItemMenuCharaStatusDraw(0x3A, 0xB4, ItemMenuMode.chara, 0x80);
            MenuTextureReload(BtlMenuReadBlock);
            int arrow_x = -1;
            int arrow_y = -1;
            int arrow_w = -1;
            switch (ItemMenuMode.mode) {
                case 0:
                case 1:
                case 2:
                case 3:
                    if (status->party_size >= 2) {
                        arrow_x = 0x32;
                        arrow_y = 0x9C;
                        arrow_w = 0xE8;
                    }
                    break;
                case 4:
                case 5:
                    arrow_x = 0x146;
                    arrow_y = 0x2A;
                    arrow_w = 0xE6;
                    break;
            }
            if (arrow_x > 0) {
                DrawBtlMenuLRCursor(arrow_x, arrow_y, arrow_w, 0x80);
            }
            break;
        }
    }
    if (ItemMenuMode.overflow == 0) {
        MenuTextureReload(AtoraNameMes.tex_block);
        float widths[7] = {11.4f, 12.7f, 12.7f, 12.7f, 12.7f, 12.7f, 12.7f};
        MenuHelpWinDraw(0x36, 0x154, widths[BtlMenuNowLang], 1.2f, 0x80);
        AtoraNameMes.stay_frame = 0;
        AtoraNameMes.text_x = 0x4A;
        AtoraNameMes.text_y = 0x158;
        AtoraNameMes.edge_alpha = 0x80;
        AtoraNameMes.Step();
        AtoraNameMes.DrawMesWin();
    }
    MenuTextureReload(BtlMenuReadBlock);
    if (ItemMenuMode.state == 5) {
        DebugItemGetDraw();
    }
    s16 cursor_pos[7][2] = {{0, 0x68}, {0xB2, 0xE2}, {0x2D, 0xBF}, {0x59, 0xBF}, {0, 0}, {0x11A, 0}, {0, 0}};
    cursor_pos[0][0] = (ItemMenuMode.board.cursor << 6) + 0x3E;
    cursor_pos[5][1] = ItemMenuMode.board.cursor * 0x2C + 0x7E;
    int x = cursor_pos[ItemMenuMode.mode][0];
    int y = cursor_pos[ItemMenuMode.mode][1];
    PERSONAL_BOARD *board = &ItemMenuMode.board;
    if (ItemMenuMode.mode == 4) {
        switch (board->cursor_area) {
            case 1:
                x = board->cursor % 5 * 0x28 + 0x148;
                y = (board->cursor - board->top_row * 5) / 5 * 0x28 + 0x7C;
                break;
            case 2:
                x = 0x216;
                y = 0x110;
                break;
        }
    }
    int frame_w = 0x2A;
    int frame_h = 0x22;
    int frame_x = x + 0x17;
    int frame_y = y - 2;
    if (ItemMenuMode.mode == 1) {
        frame_h = 0x68;
        frame_w = 0x68;
        frame_x = x + 0xE;
        frame_y = y - 0x26;
    }
    int vibe = 0;
    if (board->held_item.item_no >= 0x51) {
        vibe = 2;
    } else {
        switch (ItemMenuMode.mode) {
            case 0:
                if (ItemMenuMode.board.cursor >= 0 && MenuItemPackPt->quick_item_slot[ItemMenuMode.board.cursor] >= 0x84) {
                    vibe = 1;
                }
                break;
            case 4:
            case 5:
                if (SearchBoardNowPosItemExist(ItemMenuMode.board.page, ItemMenuMode.board.cursor) >= 0x51) {
                    vibe = 1;
                }
                if (ItemMenuMode.board.cursor_area == 2 && board->held_item.item_no < 0x51) {
                    vibe = 0;
                }
                break;
        }
    }
    s16 vibe_offset[3][2] = {{0, 0}, {0x18, 0x18}, {0x1C, 0x0D}};
    int strength = (vibe << 5) + 0x40;
    SysCur[0] += ((float) (x + vibe_offset[vibe][0]) - SysCur[0]) / 4.0f;
    SysCur[1] += ((float) (y + vibe_offset[vibe][1]) - SysCur[1]) / 4.0f;
    int big = 1;
    if (strength >= 0x80) {
        big = 0;
    }
    s16 held = board->held_item.item_no;
    if (held >= 0x51 && ItemMenuMode.state != 6) {
        ItemNaviCursor(held);
        COM_ITEM_INFO *info = GetCommonItemInfo(board->held_item.item_no);
        if (info != NULL && (info->kind == 2 || info->kind == 0)) {
            MenuTextureReload(ItemMenuWeaponIconReadBlock);
        }
        int vibe_x = (int) SysCur[0];
        DrawMenuVibeItem(vibe_x, (int) SysCur[1], 2, -0xC, 0x80);
    }
    switch (ItemMenuMode.state) {
        case 3:
        case 2:
        case 1: {
            int alpha = 0;
            switch (ItemMenuMode.state) {
                case 1:
                    alpha = 0x80;
                    break;
                case 2:
                    alpha = 0x80 - ItemMenuMode.counter * 8;
                    break;
                case 3:
                    alpha = ItemMenuMode.counter * 5 + 0x40;
                    break;
            }
            if (alpha < 0) {
                alpha = 0;
            }
            if (alpha > 0x80) {
                alpha = 0x80;
            }
            FrameImageDraw(0x40, alpha);
            return;
        }
        case 6: {
            WEAPON_HAVE *weapon = ItemMenuMode.target_weapon;
            int filled = 0;
            int holes = GetWeaponHoleNum(weapon->item_no);
            for (int i = 0; i < holes; i++) {
                if (weapon->attach[i].item_no >= 0x51) {
                    filled++;
                }
            }
            CommonMenuMes1.value_show = 1;
            if (CommonMenuMes1.mes_made != 0xBC || CommonMenuMes1.values[0] != filled || CommonMenuMes1.values[1] != holes) {
                for (int i = 0; i < 10; i++) {
                    CommonMenuMes1.mes_no[i] = -1;
                    CommonMenuMes1.values[i] = 0;
                }
                CommonMenuMes1.value_signed = 0;
                CommonMenuMes1.mes_made = -1;
                CommonMenuMes1.values[0] = filled;
                CommonMenuMes1.values[1] = holes;
                CommonMenuMes1.MakeMesWin(0xBC);
            }
            if (ItemMenuMode.use_target != 4 && ItemMenuMode.use_target != 2) {
                return;
            }
            CommonMenuMes1.stay_frame = 1;
            MenuTextureReload(CommonMenuMes1.tex_block);
            CommonMenuMes1.auto_pos = 0;
            CommonMenuMes1.text_x = 0xE2;
            CommonMenuMes1.text_y = 0x92;
            CommonMenuMes1.Step();
            CommonMenuMes1.DrawMesWin();
            setbilinear(0);
            MenuTextureReload(BtlMenuReadBlock);
            int hole_x = 0x13C - (holes * 0x12 + 0xA);
            DrawWepHole(hole_x, 0x5A, weapon, 1, 0x80);
            MenuTextureReload(ItemMenuWeaponIconReadBlock);
            DrawWepAttach(hole_x + 0xE, 0x60, weapon, 1, 0x80);
            MenuTextureReload(BtlMenuReadBlock);
            DrawDngYesNoDialog(0x114, 0xE6, 0x80);
            int yes_y = ItemMenuMode.confirm * 0x1C + 0xE0;
            DrawMenuWaku(268.0f, (float) (yes_y - 2), 0x60, 0x18, 0, StayTex, 0x80);
            DrawMenuObjectVibe(0xF2, yes_y, 0, 0x40);
            return;
        }
        default: {
            DrawMenuWaku((float) frame_x, (float) frame_y, frame_w, frame_h, 0, StayTex, 0x80);
            int vibe_x = (int) SysCur[0];
            DrawMenuObjectVibe(vibe_x, (int) SysCur[1], big, strength);
            return;
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/battlemenu", ItemMenuModeDraw__Fv);
#endif
int ItemMenuModeKey() {
    if (ItemMenuMode.mode == 5) {
        int count = TrushMoveMax[ItemMenuMode.board.page];
        if (count <= ItemMenuMode.board.cursor) {
            ItemMenuMode.board.cursor = count - 1;
        }
    }
    if (GamePad.Down(0x1000) != 0) {
        switch (ItemMenuMode.mode) {
            case 2:
            case 3:
                ItemMenuMode.board.cursor = 0;
                ItemMenuMode.mode = 0;
                break;
            case 5:
                if (0 < ItemMenuMode.board.cursor) {
                    ItemMenuMode.board.cursor--;
                }
                if (ItemMenuMode.board.cursor < 0) {
                    ItemMenuMode.board.cursor = 0;
                }
                break;
            default:
                ItemMenuMode.board.cursor = 1;
                ItemMenuMode.mode = 0;
                break;
        }
    }
    if (GamePad.Down(0x4000) != 0) {
        switch (ItemMenuMode.mode) {
            case 5: {
                ItemMenuMode.board.cursor++;
                int count = ItemMenuMode.overflow_count[ItemMenuMode.board.page];
                if (count <= ItemMenuMode.board.cursor) {
                    ItemMenuMode.board.cursor = count - 1;
                }
                if (ItemMenuMode.board.cursor < 0) {
                    ItemMenuMode.board.cursor = 0;
                }
                break;
            }
            case 0:
                if (ItemMenuMode.board.cursor == 0) {
                    ItemMenuMode.mode = 2;
                    break;
                }
            default:
                ItemMenuMode.mode = 1;
                break;
        }
    }
    if (GamePad.Down(0x8000) != 0) {
        switch (ItemMenuMode.mode) {
            case 0:
                if (0 < ItemMenuMode.board.cursor) {
                    ItemMenuMode.board.cursor--;
                }
                break;
            case 3:
                ItemMenuMode.mode = 2;
                break;
            case 1:
                ItemMenuMode.mode = 3;
                break;
            case 5:
                ItemMenuMode.mode = 1;
                ItemMenuMode.board.cursor = 0;
                break;
        }
    }
    if (GamePad.Down(0x2000) != 0) {
        int old_mode = ItemMenuMode.mode;
        switch (ItemMenuMode.mode) {
            case 5:
                ItemMenuMode.mode = 4;
                ItemMenuMode.board.cursor_area = 1;
                ItemMenuMode.board.cursor = (ItemMenuMode.board.top_row + ItemMenuMode.board.cursor) * 5;
                break;
            case 0:
                if (ItemMenuMode.board.cursor < 2) {
                    ItemMenuMode.board.cursor++;
                } else {
                    ItemMenuMode.mode = 4;
                    ItemMenuMode.board.cursor_area = 1;
                    ItemMenuMode.board.cursor = ItemMenuMode.board.top_row * 5;
                }
                break;
            case 2:
                ItemMenuMode.mode = 3;
                break;
            case 3:
                ItemMenuMode.mode = 1;
                break;
            case 1:
                ItemMenuMode.mode = 4;
                ItemMenuMode.board.cursor_area = 1;
                ItemMenuMode.board.cursor = ItemMenuMode.board.top_row * 5 + 5;
                break;
        }
        if (old_mode != 5 && ItemMenuMode.mode == 4) {
            int rows[4] = {0, 2, 0, 0};
            if ((ItemMenuMode.overflow_pages & (1 << (ItemMenuMode.board.page + 1))) && ItemMenuMode.overflow != 0) {
                ItemMenuMode.board.cursor = rows[old_mode];
                if (ItemMenuMode.board.cursor > ItemMenuMode.overflow_count[ItemMenuMode.board.page] - 1) {
                    ItemMenuMode.board.cursor = ItemMenuMode.overflow_count[ItemMenuMode.board.page] - 1;
                }
                ItemMenuMode.mode = 5;
            }
        }
    }
    return 0;
}
void ActiveItemDraw(int x, int y, int alpha) {
    RECT digits = {0x90, 0xDC, 0xC, 0xC};

    MenuTextureReload(ItemMenuWeaponIconReadBlock);
    int slot_x = x + 0xE;
    int slot_y;
    DrawMenu2DSprite(CharaStatus, CRect_i_(slot_x, y + 1, 0xE0, 0x4F), CRect_i_(0, 0, 0xE0, 0x50), alpha);
    s16 *items = MenuItemPackPt->quick_item_slot;
    s16 *counts = MenuItemPackPt->quick_item_qty;
    for (int i = 0; i < 3; i++) {
        s16 item_no = items[i];
        if (item_no >= 0x84) {
            if (item_no >= 0x84) {
                slot_x = x + 0x22 + (i << 6);
            }
            slot_y = y + 0x1F;
            DrawMenu2DSprite(CharaStatus, CRect_i_(slot_x, slot_y, 0x2C, 0x2C), CRect_i_(0x128, 0, 0x2C, 0x2C), alpha);
            DrawIconParts(item_no, slot_x + 6, slot_y + 6, 0, 0x280, alpha, 0);
            s16 count = counts[i];
            if (count >= 2) {
                DrawMenuNumber(count, slot_x + 0x26, slot_y + 0x1E, PerBoardTex, digits, 0, alpha);
            }
        }
    }
    switch (BtlMenuMode) {
        case 0:
            DngActiveItemTextureCopy();
            break;
    }
}

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
#ifdef NON_MATCHING
void ItemMenuCharaStatusDraw(int x, int y, int chara, int alpha) {
    CUserStatus *status = (CUserStatus *) BtlMenuStatusPt;

    if (CharaStatus == NULL) {
        return;
    }
    MenuTextureReload(ItemMenuWeaponIconReadBlock);
    DrawMenu2DSprite(CharaStatus, CRect_i_(x, y + 1, 0xFC, 0x85), CRect_i_(0, 0x50, 0xFC, 0x86), alpha);
    RECT digits = {0x100, 0x60, 0xC, 0xE};
    DrawMenuNumber(status->unk_4348[chara], x + 0x64, y + 0x24, CharaStatus, digits, 1, alpha);
    if (MenuExTextureReadFlag == 2 && chara < status->party_size) {
        MenuTextureReload(MenuExtendReadBlock);
        MGSetWindowRect(CRect_i_(x + 0x82, 0x5D, 0x76, 0x3F));
        MenuPolygonDraw(alpha, MenuCharaPolyDraw);
        MGSetWindowRect();
        spRGBA top = {0x80, 0x80, 0x80, 0};
        spRGBA bottom = {0x80, 0x80, 0x80, (u8) alpha};
        MenuTextureReload(ItemMenuWeaponIconReadBlock);
        CRect_i_ screen(x + 0x7E, y + 0x6F, 0x7E, 0x17);
        CRect_i_ texel(0x7E, 0xBE, 0x7E, 0x18);
        set2DSprite(GetVif1Packet(), CharaStatus, screen, texel, &top, &top, &bottom, &bottom, 1);
    }
    MenuTextureReload(BtlMenuReadBlock);
    CharaStatusMsgDraw(x + 0x6E, y + 0x14, chara, 0, alpha);
    int hp = status->hp[chara];
    int max_hp = status->max_hp[chara];
    if (max_hp <= 0) {
        max_hp = 1;
    }
    WEAPON_HAVE *weapon;
    int slot = status->equipped_weapon_slot[chara];
    if (slot < 0) {
        weapon = &ItemMenuMode.board.weapon;
    } else {
        weapon = &status->chara_weapons[chara][slot];
    }
    float durability = 0.0f;
    float max_durability = 0.0f;
    if (weapon != NULL) {
        durability = weapon->durability_f;
        max_durability = (float) weapon->durability;
    }
    if (max_durability < 0.0f) {
        max_durability = 1.0f;
    }
    MenuTextureReload(ItemMenuWeaponIconReadBlock);
    int hp_w = max_hp * 0x99 / 200;
    int wep_w = (int) (153.0f * max_durability / 99.0f);
    CRect_i_ bar(0x154, 0, 4, 0x10);
    int hp_y = y + 0x41;
    DrawMenu2DSprite(CharaStatus, CRect_i_(x + 0x22, hp_y, hp_w, 0x10), bar, alpha);
    DrawMenu2DSprite(CharaStatus, CRect_i_(x + 0x1A + hp_w, hp_y, 0xA, 0x10), CRect_i_(0x154, 0, 0xA, 0x10), alpha);
    int wep_y = y + 0x51;
    DrawMenu2DSprite(CharaStatus, CRect_i_(x + 0x22, wep_y, wep_w, 0x10), bar, alpha);
    DrawMenu2DSprite(CharaStatus, CRect_i_(x + 0x1A + wep_w, wep_y, 0xA, 0x10), CRect_i_(0x158, 0, 0xA, 0x10), alpha);
    int water_cells = (int) (status->water_max[chara] / 10.0f);
    int cell_x = x + 0x1E;
    int water_y = y + 0x62;
    for (int i = 0; i < water_cells - 1; i++) {
        DrawMenu2DSprite(CharaStatus, CRect_i_(cell_x, water_y + 2, 0x12, 0x15), CRect_i_(0x154, 0x10, 0x12, 0x14), alpha);
        cell_x += 0x12;
    }
    DrawMenu2DSprite(CharaStatus, CRect_i_(cell_x, water_y + 2, 0x18, 0x15), CRect_i_(0x166, 0x10, 0x18, 0x14), alpha);
    float hp_fill = (float) (hp_w * hp) / (float) max_hp;
    int danger = 0;
    float low = 0.3f * (float) max_hp;
    if ((float) hp < low) {
        danger = 1;
    }
    if ((float) hp < 0.15f * (float) max_hp) {
        danger++;
    }
    GRADATION_COLOR_INFO2 colors;
    GRADATION_COLOR_INFO2 *gradation = GetGradationColorInfo2(danger + 0x16);
    memcpy(&colors, gradation, sizeof(colors));
    colors.colors[3].a = alpha;
    colors.colors[2].a = alpha;
    colors.colors[1].a = alpha;
    colors.colors[0].a = alpha;
    CRect_i_ hp_bar(x + 0x1F, y + 0x46, (int) hp_fill, 6);
    DrawMenuColorGradation(hp_bar, &gradation->colors[0], &gradation->colors[1], &gradation->colors[2], &gradation->colors[3]);
    int values[2];
    values[0] = hp;
    values[1] = max_hp;
    DrawStatusNumberNowAndMax(values, x + 0x3C + hp_w, y + 0x47, 1, alpha);
    int flash = hp_fill < low ? 1 : 0;
    if (flash != MenuCharaFrame.motion_no) {
        MenuCharaFrame.motion_no = flash;
        MenuCharaFrame.flags = 0;
        MenuCharaFrame.motion_speed = -1.0f;
    }
    memcpy(&colors, GetGradationColorInfo2(0x19), sizeof(colors));
    colors.colors[3].a = alpha;
    colors.colors[2].a = alpha;
    colors.colors[1].a = alpha;
    colors.colors[0].a = alpha;
    CRect_i_ wep_bar(x + 0x1F, y + 0x56, (int) ((float) wep_w * durability / max_durability), 6);
    DrawMenuColorGradation(wep_bar, &colors.colors[0], &colors.colors[1], &colors.colors[2], &colors.colors[3]);
    values[0] = GetDispVolumeForFloat(durability);
    values[1] = (int) max_durability;
    DrawStatusNumberNowAndMax(values, x + 0x3C + wep_w, y + 0x57, 1, alpha);
    int drop_x = x + 0x20;
    int drop_y = y + 0x60;
    int drops = (int) status->water_now[chara] / 10;
    for (int i = 0; i < drops; i++) {
        DrawMenu2DSprite(CharaStatus, CRect_i_(drop_x, drop_y, 0x10, 0x14), CRect_i_(0x128, 0x2C, 0x10, 0x14), alpha);
        drop_x += 0x12;
    }
    int rest = (int) status->water_now[chara] % 10;
    if (rest != 0) {
        DrawMenu2DSprite(CharaStatus, CRect_i_(drop_x, drop_y, 0x10, 0x14),
                         CRect_i_((3 - (int) ((float) rest / 2.5f)) * 0x10 + 0x128, 0x2C, 0x10, 0x14), alpha);
    }
    int tab_y = y - 0x14;
    int party = status->party_size;
    int tab = 0;
    int right = 0;
    for (int i = 0; i <= party; i++) {
        if (tab == chara) {
            if (right != 0) {
                int tab_x = x + 0x10 + chara * 0xC;
                DrawMenu2DSprite(CharaStatus, CRect_i_(tab_x, tab_y - 1, 0x20, 0x1B), CRect_i_(0, 0xD8, 0x20, 0x1C), alpha);
                DrawMenu2DSprite(CharaStatus, CRect_i_(tab_x + 0x20, tab_y - 1, 0x5E, 0x1B), CRect_i_(0x20, 0xD8, 0x4A, 0x1C), alpha);
                DrawMenu2DSprite(CharaStatus, CRect_i_(tab_x + 0x7E, tab_y - 1, 0x20, 0x1B), CRect_i_(0x6A, 0xD8, 0x20, 0x1C), alpha);
            } else {
                right = 1;
                tab = party - 1;
            }
        } else {
            int tab_x = tab * 0xC + (x + 0x10 + right * 0x69);
            int u;
            if (right == 0) {
                u = 0xA6;
                tab++;
            } else {
                u = 0x8A;
                tab--;
                if (GetMenuLangFlag() > 0) {
                    tab_x += 0x14;
                }
            }
            DrawMenu2DSprite(CharaStatus, CRect_i_(tab_x, tab_y + 2, 0x1C, 0x13), CRect_i_(u, 0xD8, 0x1C, 0x14), alpha);
        }
    }
    s16 item_no = weapon->item_no;
    int icon_x = x + 0x16;
    int icon_y = y + 0x10;
    int u;
    int v;
    RetCTex(item_no, u, v);
    CTexture *icons = TexManager.GetTexture("wepicon", -1);
    if (icons != NULL && item_no >= 0x101) {
        WEAPON_HAVE total;
        MenuTextureReload(ItemMenuWeaponIconReadBlock);
        WeaponAllValueSet(weapon, &total, 0);
        DrawMenu2DSprite(icons, CRect_i_(icon_x, icon_y, 0x20, 0x20), CRect_i_(u, v, 0x20, 0x20), alpha);
        DrawMenuNumber(total.attack, icon_x + 0x20, icon_y + 0x14, CharaStatus, digits, 1, alpha);
    }
    MenuTextureReload(CommonMenuMes3.tex_block);
    int name = chara + 0xC2;
    if (CommonMenuMes3.mes_made != name) {
        CommonMenuMes3.MakeMesWin(name);
    }
    int length = GetMsgLengthCharaName(chara);
    CommonMenuMes3.edge_alpha = alpha;
    CommonMenuMes3.stay_frame = 0;
    s8 char_w[7] = {8, 6, 6, 6, 6, 6, 6};
    s8 offset[7] = {0, 6, 6, 6, 6, 6, 6};
    DrawMenuClsMes(&CommonMenuMes3, offset[BtlMenuNowLang] + ((x + 0x5A + chara * 0xC) - length * char_w[BtlMenuNowLang]), y - 0x12);
}
#else
INCLUDE_ASM("asm/nonmatchings/battlemenu", ItemMenuCharaStatusDraw__Fiiii);
#endif
void ItemNaviCursor(int item_no) {
    s8 shown[3] = {0, 0, 0};
    ITEM_DATA *data = GetItemData(item_no);

    if (data == NULL) {
        return;
    }
    switch (data->sort_key) {
        case 1:
            shown[0] = 1;
            if (item_no >= 0x91 && item_no < 0x9C) {
                shown[1] = 1;
            }
            if (item_no == 0xAA) {
                shown[1] = 1;
            }
            break;
        case 3:
            if ((u32) (item_no - 0xB1) < 2) {
                shown[2] = 1;
            }
            if (item_no == 0xB0) {
                shown[1] = 1;
                int chara = ItemMenuMode.chara;
                CDngStatusData *status = BtlMenuStatusPt;
                if ((float) status->hp[chara] <= 0.0f) {
                    shown[0] = 1;
                }
            }
            break;
        case 2:
            shown[1] = 1;
            if (BtlMenuMode == 0 && item_no >= 0xA6 && item_no < 0xAB && item_no != 0xA8) {
                shown[0] = 1;
            }
            break;
        default:
            if (item_no == 0xEB) {
                shown[1] = 1;
            }
            break;
    }
    static int ct = 0;
    s16 pos[3][2] = {{0x104, 0xAC}, {0x10C, 0x46}, {0x64, 0xAA}};
    ct++;
    for (int i = 0; i < 3; i++) {
        if (shown[i] != 0 && ct % 60 < 30) {
            int px = pos[i][0];
            int py = pos[i][1];
            CRect_i_ texel(0xD8, 0, 0x28, 0x14);
            for (int j = 0; j < 2; j++, py -= 0x14, texel.x -= 0x28) {
                DrawMenu2DSprite(BtStatus, CRect_i_(px, py, texel.width, texel.height), texel, 0x80);
            }
        }
    }
    if (ct >= 0x3C) {
        ct = 0;
    }
}
void CharaStatusMsgDraw(int x, int y, int chara, int shared, int alpha) {
    static float statusCnt = -3.1415927f;

    int bob_y = (int) ((float) y + 4.0f * sinf(statusCnt));
    int condition;
    int icon = -1;
    condition = BtlMenuStatusPt->GetActiveCharaStatus(chara);
    if (condition & 0x40) {
        icon = 5;
    }
    if (condition & 0x20) {
        icon = 2;
    }
    if (condition & 0x10) {
        icon = 4;
    }
    if (condition & 8) {
        icon = 1;
    }
    if (condition & 4) {
        icon = 3;
    }
    if (BtlMenuStatusPt->hp[chara] <= 0 || (condition & 2)) {
        icon = 0;
    }
    if (icon >= 0) {
        int u = icon / 3 * 0x44 + 0x78;
        int v = icon % 3 * 0x24 + 0x14;
        DrawMenu2DSprite(BtStatus, CRect_i_(x, bob_y, 0x44, 0x23), CRect_i_(u, v, 0x44, 0x24), alpha);
    }
    float period;
    if (shared != 0) {
        float count = BtlMenuStatusPt->GetPartySize();
        period = 50.0f * count;
    } else {
        period = 50.0f;
    }
    statusCnt += 3.1415927f / period;
    if (!(statusCnt < 3.1415927f)) {
        statusCnt = -3.1415927f;
    }
}

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

static int IsLoadMapNo();

static int MapNoTransFunc(int map_no);

/**
 * Starts reading one region's world map in the background.
 *
 * @mangled StartLoadWorldMap__FiP1
 * @address 0x209F80
 * @size 0xBC
 */
static void StartLoadWorldMap(int region, u_long128 *buffer);

void InitMenuMove(int mode, int texture_block, u_long128 *buffer) {
    BtlMenuSaveDataPt = SaveData;
    MenuMove.mode = mode;
    switch (mode) {
        case 0:
        case 2:
            MenuMapJumpMode = 0;
            MenuMove.cursor = 1;
            MenuMove.ready = 1;
            CommonMenuMes3.Preset(1);
            CommonMenuMes3.rows = 3;
            CommonMenuMes3.auto_pos = -1;
            SysCur[1] = MenuMove.cursor * 26 + 174;
            MapMoveCursor = NULL;
            MenuMoveTex = NULL;
            break;
        case 5:
            BtlMenuStatusPt = BtlMenuSaveDataPt->GetDngStatus();
            StayTex = TexManager.GetTexture("stayfram", -1);
            GamePad.MenuModeOn(0x78);
            GamePad.SetAutoRepeat(0xF000, 30, 5);
        case 1:
            if (((s32 *) SaveData->GetConfigData())[14] != 0 && SaveData->VisitMap(MenuGrobalMapNoTbl[13], 0) > 0) {
                printf("clear!!!!\n");
                if (SaveData->VisitMap(MenuGrobalMapNoTbl[15] <= 0, 0) != 0) {
                    SaveData->VisitMap(MenuGrobalMapNoTbl[15], 1);
                    printf("demon shaft On!!!!!\n");
                }
            } else {
                if (((s32 *) SaveData->GetConfigData())[14] == 0) {
                    printf("not clear \n");
                }
                if (SaveData->QuestDungeon(5, 0) <= 0) {
                    printf("not toki no kairou\n");
                }
            }
            printf("MapNo = %d\n", MapNo);
            MenuMapJumpMode = -1;
            MenuMove.cursor = MapNoTransFunc(MapNo);
            MenuMove.start_place = MenuMove.cursor;
            MenuMove.load_map = IsLoadMapNo();
            printf("Now select map = %d\n", MenuMove.cursor);
            printf("Now Load MapNo = %d\n", MenuMove.load_map);
            NextWorldPos = TownOrDngPos[MenuMove.cursor].frame;
            MenuMove.tex_block = texture_block;
            buffer = MenuCalcBufAlignment(buffer);
            MenuMove.unk_0A = 15;
            StartLoadWorldMap(MenuMove.load_map, buffer);
            if (mode == 5) {
                do {
                } while (ReadBGSync() != 0);
            }
            MenuMove.ready = 0;
            CommonMenuMes3.Preset(4);
            CommonMenuMes3.rows = 1;
            MapMoveCursor = NULL;
            break;
        case 10:
            MenuMove.cursor = 1;
            MenuMapJumpMode = -1;
            CommonMenuMes3.Preset(1);
            CommonMenuMes3.rows = 3;
            SysCur[1] = MenuMove.cursor * 26 + 174;
            break;
    }
    MenuMove.state = 1;
    MenuMove.counter = 1;
    CommonMenuMes2.mes_made = -1;
    CommonMenuMes3.mes_made = -1;
}
void GetTownOrDngPos() {
    MenuWorldTrans(&MenuCamera);
    float scale = 2.2f;
    MenuCharaFrame.SetScale(scale, scale, scale);
    MenuCharaFrame.SetPosition(mapo);
    float ref[4] = {0.0f, 0.0f, -45.0f, 1.0f};
    float pos[4] = {0.0f, 0.0f, 60.0f, 1.0f};
    MenuCamera.SetRef(ref);
    MenuCamera.SetPos(pos);
    for (int i = 0; i < 16; i++) {
        WORLD_MAP_POS *place = &TownOrDngPos[i];
        if (place != NULL) {
            if (GetVisitInfo(i, MenuMove.mode) == 0) {
                place->visited = -1;
            } else {
                place->visited = 1;
            }
            CFrame *frame = MenuCharaFrame.frame->SearchFrame(place->frame);
            if (frame == NULL) {
                printf("%d is NULL nothing\n", i);
            } else {
                int screen[2];
                Get3DPosTo2DPos(frame, screen);
                place->x = screen[0] - 4;
                place->y = screen[1] - 0x2A;
            }
        }
    }
}
#ifdef NON_MATCHING
int MenuMoveKey() {
    int stay = 1;
    int decided = 0;
    int message = CommonMenuMes3.mes_made;
    int help = 0;

    switch (MenuMove.state) {
        case 1: {
            int done = ToFromSelect(0);
            int ready = 1;
            switch (MenuMove.mode) {
                case 2:
                case 10:
                case 0:
                    MenuMove.ready = 1;
                    break;
                case 5:
                case 1:
                    if (MenuMove.ready == 0) {
                        MenuMove.ready = LoadWorldMap();
                        if (MenuMove.ready != 0) {
                            ComMenuSePlay(0x9B);
                        }
                        ready = 0;
                    } else {
                        ready = 0;
                        if (MenuCharaFrame.motion_state == 3) {
                            ready = 1;
                            SysCur[0] = 328.0f;
                            SysCur[1] = 164.0f;
                            GetTownOrDngPos();
                        }
                    }
                    break;
            }
            if (done != 0 && MenuMove.counter >= 0x15 && MenuMove.ready != 0 && ready != 0) {
                if (MenuMove.mode != 5) {
                    BattleMenuFlag = 5;
                }
                MenuMove.state = 0;
                switch (MenuMove.mode) {
                    case 2:
                    case 10:
                    case 0:
                        break;
                    case 1:
                    case 5:
                        SysCur[0] = 328.0f;
                        SysCur[1] = 164.0f;
                        break;
                }
            }
            break;
        }
        case 2: {
            int done = ToFromSelect(1);
            if (MenuMove.mode == 5) {
                done = 1;
            }
            if (done != 0 && MenuMove.counter >= 0x15) {
                MenuMove.ready = 0;
                ForBackMenu();
                if (MenuMove.mode != 5) {
                    BattleMenuFlag = 0;
                } else {
                    GamePad.AutoRepeatOff();
                    GamePad.MenuModeOff();
                    TexManager.DeleteTextureBlock(MenuMove.tex_block);
                }
                for (int i = 0; i < 10; i++) {
                    CommonMenuMes3.mes_no[i] = -1;
                }
            }
            break;
        }
        case 3:
            mapo[0] += mapmovev[0];
            mapo[1] += mapmovev[1];
            mapo[2] += mapmovev[2];
            if (MenuMove.counter >= 0x10) {
                MenuMove.state = 4;
            }
            break;
        case 6:
            mapo[0] += mapmovev[0];
            mapo[1] += mapmovev[1];
            mapo[2] += mapmovev[2];
            if (MenuMove.counter >= 0x10) {
                mapo[0] = 0.0f;
                mapo[1] = 0.0f;
                mapo[2] = 0.0f;
                MenuMove.state = 0;
            }
            break;
        case 4:
            switch (MenuMove.cursor) {
                case 3:
                case 4:
                case 7:
                case 8:
                case 9:
                case 10:
                case 11:
                case 13:
                    help = 0x13A;
                    break;
                default:
                    help = 0x139;
                    break;
            }
            if (GamePad.Down(0x40) != 0) {
                MenuMapJumpMode = MenuGrobalMapNoTbl[MenuMove.cursor];
                if (MapNo != MenuMapJumpMode) {
                    stay = 0;
                    ComMenuSePlay(1);
                } else if (MenuMove.mode == 5) {
                    stay = 0;
                    MenuMapJumpMode = MapNo;
                } else {
                    stay = 1;
                    ComMenuSePlay(2);
                }
            } else if (GamePad.Down(0x20) != 0) {
                MenuMove.state = 6;
                MenuMove.counter = 0;
                mapmovev[0] = -mapmovev[0];
                mapmovev[1] = -mapmovev[1];
                mapmovev[2] = -mapmovev[2];
            }
            break;
        case 0: {
            int old_cursor = MenuMove.cursor;
            switch (MenuMove.mode) {
                case 2:
                case 10:
                case 0:
                    if (GamePad.Down(0x5000) != 0) {
                        if (MenuMove.cursor != 0) {
                            MenuMove.cursor = 0;
                        } else {
                            MenuMove.cursor = 1;
                        }
                    }
                    if (GamePad.Down(0x40) != 0) {
                        decided = 1;
                        if (MenuMove.cursor == 0) {
                            stay = 0;
                            switch (MenuMove.mode) {
                                case 0:
                                    NowMonstorUnit->GetMonstorNum();
                                    switch (EscapeDungeonMode()) {
                                        case 1:
                                            BtlMenuStatusPt->LostItem(0xAF);
                                            break;
                                        case 0: {
                                            CUserStatus *status = (CUserStatus *) BtlMenuStatusPt;
                                            u16 money = status->money;
                                            int half = money >> 1;
                                            if (money - half >= 0xFFFF) {
                                                status->money = 0xFFFF;
                                            } else {
                                                status->money = money - half;
                                            }
                                            break;
                                        }
                                    }
                                    MenuMapJumpMode = 1;
                                    break;
                                case 10:
                                    MenuMapJumpMode = 0xC8;
                                    break;
                                case 2:
                                    SetInteriorOutFlag(1);
                                    BtlEffectCt = 0.0f;
                                    MenuMove.state = 7;
                                    MenuMove.counter = 0;
                                    stay = 1;
                                    break;
                            }
                            ComMenuSePlay(1);
                        } else {
                            MenuMove.state = 2;
                            BattleMenuFlag = 0x15;
                            ComMenuSePlay(2);
                        }
                    }
                    switch (MenuMove.mode) {
                        case 0: {
                            s16 messages[3] = {0x131, 0x130, 0x12F};
                            message = messages[EscapeDungeonMode()];
                            break;
                        }
                        case 10:
                            message = 0x136;
                            break;
                        case 2:
                            message = 0x137;
                            break;
                    }
                    break;
                case 5:
                case 1:
                    WorldMapMoveKey();
                    if (MenuMove.cursor < 0) {
                        MenuMove.cursor = 4;
                    }
                    if (GamePad.Down(0x40) != 0) {
                        decided = 1;
                        MenuMapJumpMode = MenuGrobalMapNoTbl[MenuMove.cursor];
                        if (MenuMove.mode != 5 && MapNo == MenuMapJumpMode) {
                            stay = 1;
                            ComMenuSePlay(2);
                        } else {
                            ComMenuSePlay(1);
                            MenuMove.state = 3;
                            float world[4];
                            float local[4] = {0.0f, 0.0f, 0.0f, 1.0f};
                            MapMoveCursor->GetWorldPosition(world, local);
                            mapmovev[0] = -world[0] / 15.0f;
                            mapmovev[1] = -world[1] / 15.0f;
                            mapmovev[2] = 2.4f;
                        }
                    }
                    message = 0x138;
                    break;
            }
            if (old_cursor != MenuMove.cursor) {
                ComMenuSePlay(0);
            }
            if (decided == 0 && GamePad.Down(0x20) != 0) {
                switch (MenuMove.mode) {
                    case 5:
                        break;
                    case 0:
                        MenuMapJumpMode = 0;
                        break;
                    case 10:
                    case 1:
                        MenuMapJumpMode = -1;
                        break;
                    case 2:
                        SetInteriorOutFlag(0);
                        break;
                }
                if (MenuMove.mode != 5) {
                    MenuMove.state = 2;
                    if (MenuMove.mode != 5) {
                        BattleMenuFlag = 0x15;
                    }
                }
                ComMenuSePlay(2);
            }
            break;
        }
        case 7:
            if (!(BtlEffectCt <= 44.0f)) {
                ExitBattleMenu(1);
                stay = 0;
            }
            break;
    }
    int names[16] = {0, 1, 2, 3, 4, 5, 6, 7, 13, 8, 9, 10, 11, 14, 12, 15};
    int name = names[MenuMove.cursor] + 0xA;
    if (message == 0x138 && CommonMenuMes3.mes_no[0] != name) {
        CommonMenuMes3.mes_no[0] = name;
        CommonMenuMes3.mes_made = -1;
    }
    if ((u32) (help - 0x139) < 2 && CommonMenuMes2.mes_no[0] != name) {
        CommonMenuMes2.mes_no[0] = name;
        GetMsgLengthMenu(&CommonMenuMes2, name);
        help = 0x13A;
        CommonMenuMes2.mes_no[0] = name;
        CommonMenuMes2.mes_made = -1;
    }
    if (CommonMenuMes3.mes_made != message) {
        CommonMenuMes3.MakeMesWin(message);
    }
    if (CommonMenuMes2.mes_made != help) {
        CommonMenuMes2.MakeMesWin(help);
    }
    return stay;
}
#else
INCLUDE_ASM("asm/nonmatchings/battlemenu", MenuMoveKey__Fv);
#endif
#ifdef NON_MATCHING
void DrawMenuMove() {
    int x;
    int y;
    int size[4];

    if (MenuMove.mode == 5) {
        MenuWorldTrans(&MenuCamera);
        FrameImageDraw(0x40, 0x80);
    }
    BtlMenuTexBlockEnter();
    int alpha = 0x80;
    switch (MenuMove.state) {
        case 1:
            alpha = MenuMove.counter * 6;
            break;
        case 2:
            alpha = 0x80 - MenuMove.counter * 8;
            break;
    }
    if (alpha > 0x80) {
        alpha = 0x80;
    }
    if (alpha < 0) {
        alpha = 0;
    }
    float ease = 4.0f;
    switch (MenuMove.mode) {
        case 0: {
            DrawEscapeItem(0x32, 0x140, alpha);
            int center = 0x140 - (CommonMenuMes3.char_width >> 1);
            CommonMenuMes3.NeedMesWinWH(CommonMenuMes3.mes_made, size);
            CommonMenuMes3.text_x = center - (size[2] >> 1) + 0xA;
            CommonMenuMes3.text_y = 0x7E;
            CommonMenuMes3.stay_frame = 1;
            if (MenuMove.state == 2) {
                CommonMenuMes3.stay_frame = 0;
            }
            CommonMenuMes3.edge_alpha = alpha;
            MenuTextureReload(BtlMenuReadBlock);
            DrawDngYesNoDialog(0x118, 0xDC, alpha);
            x = 0xF6;
            y = MenuMove.cursor * 0x1C + 0xD2;
            break;
        }
        case 10:
        case 2: {
            int center = 0x140 - (CommonMenuMes3.char_width >> 1);
            CommonMenuMes3.NeedMesWinWH(CommonMenuMes3.mes_made, size);
            int width = size[2];
            CommonMenuMes3.text_x = center - (width >> 1) + 0xA;
            if (MenuMove.mode == 10 && CommonMenuMes3.mes_made > 0 && width >= 0x28 && size[3] < 0xC9) {
                CommonMenuMes3.text_y = 0x94;
                MenuHelpWinDraw2(CommonMenuMes3.text_x - 0x1A, CommonMenuMes3.text_y - 4, 8.0f + (float) width, 2.0f + (float) size[3],
                                 alpha, 0, 0, StayTex);
            }
            if (MenuMove.mode == 2 && CommonMenuMes3.mes_made > 0) {
                int width2 = size[2];
                if (width2 >= 0x28 && size[3] < 0xC9) {
                    CommonMenuMes3.text_y = 0x92;
                    MenuHelpWinDraw2(CommonMenuMes3.text_x - 0x1A, CommonMenuMes3.text_y - 4, 8.0f + (float) width2,
                                     2.0f + (float) size[3], alpha, 0, 0, StayTex);
                }
            }
            CommonMenuMes3.stay_frame = 0;
            CommonMenuMes3.edge_alpha = alpha;
            MenuTextureReload(BtlMenuReadBlock);
            DrawDngYesNoDialog(0x118, 0xD8, alpha);
            x = 0xF6;
            y = MenuMove.cursor * 0x1C + 0xD2;
            break;
        }
        case 1:
        case 5: {
            WORLD_MAP_POS *next = (WORLD_MAP_POS *) NextWorldPos;
            if (next != NULL) {
                x = next->x;
                y = next->y;
            } else {
                int place = MapNoTransFunc(MapNo);
                s16 pos[15][2] = {{0x150, 0xB2}, {0, 0},       {0x12A, 0xDC}, {0, 0},       {0x104, 0xB4},
                                  {0xC4, 0xCE},  {0x90, 0xD6},  {0xF0, 0x114}, {0x13A, 0x148}, {0x147, 0x13C},
                                  {0x1D2, 0x90}, {0x1D6, 0xAB}, {0x1B4, 0x90}, {0x1BB, 0x126}, {0x1C3, 0x112}};
                x = pos[place][0];
                y = pos[place][1];
                SysCur[0] = (float) x;
                SysCur[1] = (float) y;
            }
            ease = 3.0f;
            int map_alpha = 0x80;
            if (MenuMove.state == 2) {
                map_alpha = alpha;
            }
            if (MenuMove.ready != 0 && MenuCharaFrame.frame != NULL) {
                DrawWorldMap(map_alpha);
            }
            break;
        }
    }
    SysCur[0] += ((float) x - SysCur[0]) / ease;
    SysCur[1] += ((float) y - SysCur[1]) / ease;
    int arrived = 1;
    if (MenuMove.mode == 5 || MenuMove.mode == 1) {
        if (!((float) abs((int) (SysCur[0] - (float) x)) <= 4.0f) && !((float) abs((int) (SysCur[1] - (float) y)) <= 4.0f)) {
            arrived = 0;
        }
        if (MenuMove.state != 4 || MenuMove.state != 2) {
            CommonMenuMes3.stay_frame = 0;
        }
    }
    float width = 1.0f;
    switch (MenuMove.mode) {
        case 2:
        case 10:
        case 0:
            if (MenuMove.cursor != 0) {
                width = 98.0f;
            } else {
                width = 98.0f;
            }
            break;
        case 5:
        case 1:
            GetMenuLangFlag();
            width = (float) CommonMenuMes3.GetMesWidth_system(CommonMenuMes3.mes_no[0]);
            CommonMenuMes3.text_x = (int) ((double) (s16) x - (double) width / 2.0);
            CommonMenuMes3.text_y = y - 0x22;
            break;
    }
    int cur_x = (int) SysCur[0];
    int cur_y = (int) SysCur[1];
    switch (MenuMove.state) {
        case 2:
        case 1:
            break;
        case 0:
            switch (MenuMove.mode) {
                case 2:
                case 10:
                case 0:
                    DrawMenuWaku((float) (x + 0x1A), (float) (y - 2), (int) width, 0x1A, 0, StayTex, 0x80);
                    DrawMenuObjectVibe(cur_x, cur_y, 1, 0x40);
                    break;
                case 5:
                case 1: {
                    MenuTextureReload(MenuMove.tex_block);
                    DrawMapCheck(0x80);
                    CRect_i_ texel(0xE0, 0, 0x20, 0x20);
                    DrawObjectVibe(cur_x + 2, cur_y + 2, MenuMoveTex, texel, 0xA, 0x50);
                    DrawObjectVibe(cur_x, cur_y, MenuMoveTex, texel, 0x80, 0x80);
                    CommonMenuMes3.stay_frame = 0;
                    MenuHelpWinDraw2(CommonMenuMes3.text_x - 0x18, CommonMenuMes3.text_y - 0xE, 1.0f + width, 0.0f, 0x80, 0, 0, StayTex);
                    break;
                }
            }
            break;
        case 4:
            MenuHelpWinDraw2(CommonMenuMes3.text_x - 0x18, CommonMenuMes3.text_y - 0xE, 1.0f + width, 0.0f, 0x80, 0, 0, StayTex);
            break;
    }
    MenuTextureReload(CommonMenuMes3.tex_block);
    if (arrived != 0 && (MenuMove.state != 4 || MenuMove.state != 2)) {
        switch (MenuMove.state) {
            case 3:
                alpha = 0x80 - MenuMove.counter * 0xA;
                break;
            case 6:
                alpha = MenuMove.counter * 6;
                break;
        }
        if (alpha < 0) {
            alpha = 0;
        }
        if (alpha > 0x80) {
            alpha = 0x80;
        }
        CommonMenuMes3.edge_alpha = alpha;
        CommonMenuMes3.Step();
        CommonMenuMes3.DrawMesWin();
    }
    if (MenuMove.state == 4) {
        float win_x;
        float win_y;
        float win_w;
        float win_h;
        GetMainMenuRightHelpWinLangOffset(win_x, win_y, win_w, win_h);
        if (GetMenuLangFlag() > 0) {
            win_x -= 12.0f;
            win_w += 1.2f;
        }
        MenuHelpWinDraw((int) win_x, (int) win_y, win_w, win_h, 0x80);
        int text_x;
        int text_y;
        GetMainMenuRightHelpMsgLangOffset(text_x, text_y);
        CommonMenuMes2.text_x = (int) (win_x + (float) text_x);
        CommonMenuMes2.text_y = (int) (win_y + (float) text_y);
        CommonMenuMes2.Step();
        CommonMenuMes2.DrawMesWin();
    }
    if (MenuMove.mode == 5) {
        MenuTextureReload(MenuMove.tex_block);
        int title_w = 0xD8;
        if (GetMenuLangFlag() > 0) {
            title_w = 0xDE;
        }
        DrawMenu2DSprite(MenuMoveTex, CRect_i_(0x3C, 0x28, title_w, 0x28), CRect_i_(0, 0, title_w, 0x28), 0x80);
    }
    if (MenuMove.state == 7 && GetInteriorOutFlag() != 0) {
        int fade = MenuMove.counter * 3;
        if (fade > 0x80) {
            fade = 0x80;
        }
        AllFadeForMenu(fade);
    }
    if (MenuMove.state != 4 && MenuMove.state != 0) {
        MenuMove.counter++;
        return;
    }
    MenuMove.counter = 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/battlemenu", DrawMenuMove__Fv);
#endif
void DrawEscapeItem(int x, int y, int alpha) {
    float widths[7] = {8.6f, 9.0f, 9.0f, 9.0f, 9.0f, 9.0f, 9.0f};
    int u;
    int v;

    float height = 1.0f;
    MenuHelpWinDraw(x, y, widths[BtlMenuNowLang], height, alpha);
    int row_y = y + 0x10;
    MenuTextureReload(BtlMenuReadBlock);
    if (PerBoardTex == NULL) {
        PerBoardTex = TexManager.GetTexture("perbrd", -1);
    }
    int money = ((CUserStatus *) BtlMenuStatusPt)->money;
    CommonMoneyBoardDraw(x, y - 0x1E, money, alpha);
    int count = GetNowItemNum(0xAF, MenuItemPackPt);
    CTexture *icon = RetCTex(0xAF, u, v);
    DrawMenu2DSprite(icon, CRect_i_(x + 0x14, row_y, 0x20, 0x20), CRect_i_(u, v, 0x20, 0x20), alpha);
    DrawMenu2DSprite(BtStatus, CRect_i_(x + 0x86, row_y + 8, 0x10, 0x10), CRect_i_(0x60, 0x58, 0x10, 0x10), alpha);
    int number_x = x + 0xA2;
    number_x += GetNumberKeta(count) * 6;
    DrawMenuNumber(count, number_x, row_y + 8, StayTex, NumberSprite[1], 2, alpha);
    s16 messages[7] = {0x138, 0x1A8, 0x1A8, 0x1A8, 0x1A8, 0x1A8, 0x1A8};
    if (CommonMenuMes1.mes_made != messages[BtlMenuNowLang]) {
        CommonMenuMes1.mes_no[0] = 0x113;
        CommonMenuMes1.MakeMesWin(messages[BtlMenuNowLang]);
    }
    if (BtlMenuNowLang > 0) {
        row_y += 0x10;
        CommonMenuMes1.line_pos[0].x = x + 0x38;
        CommonMenuMes1.line_pos[0].y = row_y - 0x14;
        CommonMenuMes1.line_pos[1].x = x + 0x3C;
        CommonMenuMes1.line_pos[1].y = row_y;
    }
    MenuTextureReload(CommonMenuMes1.tex_block);
    CommonMenuMes1.edge_alpha = alpha;
    CommonMenuMes1.stay_frame = 0;
    DrawMenuClsMes(&CommonMenuMes1, x + 0x38, row_y - 0x10);
}
/**
 * Appends the world map archive name of a region to a path.
 */
inline void AddWorldMapFileName(char *path, int region) {
    char *files[6] = {"matatagi.pac", "queen.pac", "musuka.pac", "moon.pac", "dark.pac", "lastdng.pac"};

    strcat(path, files[region]);
}

static void StartLoadWorldMap(int region, u_long128 *buffer) {
    char path[64];
    int size;

    if (region < 0 || region > 5) {
        return;
    }
    GetPathReadDifferntLang(path);
    strcat(path, "map/");
    AddWorldMapFileName(path, region);
    StartReadBG();
    LoadFileBG(path, buffer, &size);
}
int LoadWorldMap() {
    if (ReadBGSync() == 0) {
    BG_READ_INFO *file = GetReadBGFile(0);
    char img_format[32] = "w_map_1%d.img";
    char cfg_format[32] = "w_map1%d.cfg";
    char img[32];
    char cfg[32];
    sprintf(img, img_format, MenuMove.load_map + 1);
    sprintf(cfg, cfg_format, MenuMove.load_map + 1);
    LOADTEXTURE_INFO2 textures[5] = {{"#frame_imagemove#640#448#4", 0, 0}, {NULL, 0, 0}, {NULL, 0, 0}, {NULL, 0, 0}, {NULL, 0, 0}};
    textures[0].block_no = MenuMove.tex_block;
    textures[1].block_no = MenuMove.tex_block;
    textures[2].block_no = MenuMove.tex_block;
    textures[3].block_no = MenuMove.tex_block;
    textures[1].name = (char *) GetPackFile((u_int *) file->buffer, "w_map_02.img", NULL);
    textures[2].name = (char *) GetPackFile((u_int *) file->buffer, img, NULL);
    textures[3].name = (char *) GetPackFile((u_int *) file->buffer, "menumove.img", NULL);
    TexManager.DeleteTextureBlock(MenuMove.tex_block);
    int blocks[2] = {0, -1};
    blocks[0] = MenuMove.tex_block;
    MenuTextureDelete(blocks);
    TexManager.CleanUpTextureList();
    BtlMenuTexBlockEnter();
    TexManager.LoadTextureBlockEX(-1, textures);
    MenuMoveTex = TexManager.GetTexture("menumove", -1);
    if (MenuMove.mode == 5) {
        InitMenuMesSet(5, (short *) GetPackFile((u_int *) file->buffer, "allmenu.mes", NULL));
    }
    u_long128 *model = file->buffer + ((((file->size >> 6) + 1) << 6) >> 4);
    MenuCharaFrame.Initialize();
    MenuExCashBuffer.base = (u_char *) model;
    MenuExCashBuffer.limit = 0xCF80;
    MenuExCashBuffer.used = 0;
    MenuCharaFrame.LoadPackData((u_int *) file->buffer, cfg, &MenuExCashBuffer, &MenuExCashBuffer, NULL);
    mapo[2] = 0.0f;
    mapo[1] = 0.0f;
    mapo[0] = 0.0f;
    mapo[3] = 1.0f;
    MenuCharaFrame.SetPosition(mapo);
    MenuCharaFrame.motion_no = 0;
    MenuCharaFrame.flags = 2;
    MenuCharaFrame.motion_speed = -1.0f;
    MapMoveCursor = MenuCharaFrame.frame->SearchFrame(TownOrDngPos[MenuMove.cursor].frame);
    return 1;
    }
    return 0;
}

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
    MenuTextureReload(MenuMove.tex_block);
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
    WORLD_MAP_POS *from = &TownOrDngPos[MenuMove.cursor];
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
        if (pos->visited <= 0 || i == MenuMove.cursor) {
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
            MenuMove.cursor = direction;
            MapMoveCursor = MenuCharaFrame.frame->SearchFrame(TownOrDngPos[MenuMove.cursor].frame);
        }
    }
    return 1;
}

/**
 * Marks every world-map place the party has already reached.
 *
 * @mangled DrawMapCheck__Fi
 * @address 0x20A9B0
 * @size 0x150
 */
void DrawMapCheck(int) {
    s16 offset[16][2] = {0};
    CRect_i_ dst(0, 0, 0x10, 0xF);
    CRect_i_ src(0, 0x68, 0x15, 0x15);

    for (int i = 0; i < 16; i++) {
        WORLD_MAP_POS *place = &TownOrDngPos[i];
        if (place->frame != NULL && place->visited > 0) {
            CFrame *frame = MenuCharaFrame.frame->SearchFrame(place->frame);
            if (frame != NULL) {
                int pos[2];

                Get3DPosTo2DPos(frame, pos);
                dst.x = pos[0] + offset[i][0];
                dst.y = pos[1] + offset[i][1];
                src.x = 0;
                if (MenuMove.start_place == i) {
                    src.x += 0x14;
                }
                DrawMenu2DSprite(MenuMoveTex, dst, src, 0x80);
            }
        }
    }
}

/**
 * Gives how often a world-map place has been visited, or how far its dungeon has been cleared.
 *
 * @mangled GetVisitInfo__Fii
 * @address 0x20AB00
 * @size 0x164
 */
static int GetVisitInfo(int place, int menu_mode) {
    int visits;
    int dungeon;
    int map_no = MenuGrobalMapNoTbl[place];

    if (map_no >= 200) {
        map_no -= 200;
    }
    switch (place) {
        case 0:
        case 2:
        case 4:
        case 5:
        case 7:
        case 8:
        case 10:
        case 11:
        case 13:
        case 15:
            dungeon = 0;
            break;
        default:
            dungeon = 1;
            break;
    }
    if (!dungeon) {
        visits = BtlMenuSaveDataPt->VisitMap(map_no, 0);
        switch (NowGetGameFlagForBtlMenu(menu_mode)) {
            case 1:
            case 5:
                if (map_no == 1) {
                    visits = 1;
                }
                break;
        }
    } else {
        visits = BtlMenuSaveDataPt->QuestDungeon(map_no, 0);
    }
    return visits;
}

/**
 * Gives the region whose world map should be read for the party's position.
 *
 * @mangled IsLoadMapNo__Fv
 * @address 0x20AC70
 * @size 0x110
 */
static int IsLoadMapNo() {
    int region = -1;
    s8 map_region[80] = {
        0,
        0,
        1,
        2,
        3,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        1,
        1,
        3,
        2,
        3,
        0,
        0,
        0,
        2,
        0,
        3,
        3,
        3,
        3,
        0,
        2,
        1,
        2,
        3,
        0,
        1,
        4,
        3,
        2,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        5,
        5,
    };

    for (int map_no = 0; map_no < 80; map_no++) {
        if (BtlMenuSaveDataPt->VisitMap(map_no, 0) && map_region[map_no] > region) {
            region = map_region[map_no];
        }
    }
    s8 dungeon_region[6] = {0, 1, 2, 3, 4, 5};
    for (int dungeon = 1; dungeon <= 5; dungeon++) {
        if (BtlMenuSaveDataPt->QuestDungeon(dungeon, 0) && dungeon_region[dungeon - 1] > region) {
            region = dungeon_region[dungeon - 1];
        }
    }
    return region;
}

/**
 * Turns a map number into the world-map place that stands for it.
 *
 * @mangled MapNoTransFunc__Fi
 * @address 0x20AD80
 * @size 0xD8
 */
static int MapNoTransFunc(int map_no) {
    int place;

    if (map_no < 10) {
        s16 towns[5] = {0, 2, 5, 7, 11};
        place = towns[map_no];
    }
    if (map_no >= 11 && map_no < 200) {
        char fields[69] = {
            2,
            2,
            2,
            4,
            4,
            4,
            4,
            4,
            5,
            5,
            10,
            8,
            10,
            13,
            13,
            14,
            8,
            4,
            10,
            10,
            10,
            10,
            2,
            9,
            6,
            8,
            12,
            13,
            6,
            13,
            13,
            8,
            5,
            5,
            5,
            0,
            13,
            13,
            13,
            13,
            13,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            15,
            15,
        };
        place = fields[map_no - 11];
    }
    if (map_no >= 200) {
        s8 dungeons[6] = {1, 3, 6, 9, 12, 14};
        map_no -= 200;
        place = dungeons[map_no];
    }
    return place;
}

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
    RECT digits = NumberSprite[0];

    if (values[0] < 0.3f * values[1]) {
        digits.y += 12;
    }
    int end = DrawMenuNumber(values[1], x, y, StayTex, digits, color, alpha);
    DrawMenu2DSprite(StayTex, CRect_i_(end - 11, y, 12, 12), CRect_i_(0x78, digits.y, 12, 12), alpha);
    DrawMenuNumber(values[0], end - 11, y, StayTex, digits, color, alpha);
}

void DrawWepHole(int x, int y, WEAPON_HAVE *weapon, int, int alpha) {
    if (x < 10 || x > 620) {
        return;
    }
    if (weapon == NULL) {
        return;
    }
    WEAPON_DATA *data = GetWeaponData(weapon->item_no);
    u8 colors[3][3] = {
        {0x80, 0x80, 0x80},
        {0x28, 0x28, 0xA0},
        {0xFF, 0xE8, 0x02},
    };
    x += 10.0f;
    for (int i = 0; i < 6; i++) {
        if (data->hole[i] - 1 < 0) {
            return;
        }
        if (weapon->attach_kind[i] == 3) {
            float width = 26.0f;
            float height = 12.0f;
            DrawMenu2DSprite(WepStatus, CRect_i_(x + 8, y + 16, width, height), CRect_i_(0xD4, 0x134, 0x1A, 0xD),
                             alpha);
        }
        int src_y = 0xE0;
        int filled = 0;
        if (weapon->attach[i].item_no > 0) {
            src_y += 0x2A;
            filled = 1;
        }
        CRect_i_ src(0xD4, src_y, 0x2A, 0x2A);
        DrawMenu2DSprite(WepStatus, CRect_i_(x + 1, y + 2, 0x2A, 0x29), src, 0, 0, 0, alpha * 80 >> 7);
        u8 *color;
        if (data->hole[i] == 2) {
            color = colors[1];
            if (filled) {
                color = colors[2];
            }
        } else {
            color = colors[0];
        }
        DrawMenu2DSprite(WepStatus, CRect_i_(x, y + 1, 0x2A, 0x29), src, color[0], color[1], color[2], alpha);
        x += 0x2A;
    }
}

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

void MenuClsMes::SetBuffInfo(short *buffer) {
    ClsMes *mes = message;

    mes->text_columns = 0x46;
    mes->text_rows = 10;
    mes->text_len = 0;
    mes->text_width = 0;
    mes->text_height = 0;
    mes->fade = 0.0f;
    mes->fade_in = 1;
    mes->text_rate = mes->text_rate_set;
    mes->waiting = 0;
    mes->text_at = 0.0f;
    mes->text_no = 0;
    mes->text_from = 0;
    mes->page_from = 0;
    mes->InitMesWinTbl();
    mes->clut_now = mes->clut_default;
    mes->wait = 0;
    mes->blink = 0;
    mes->auto_page_wait = 0;
    mes->mes_made = -1;
    mes->edge_alpha = 0x80;
    for (int i = 0; i < 10; i++) {
        mes->mes_no[i] = -1;
    }
    for (int i = 0; i < 8; i++) {
        mes->values[i] = 0;
    }
    mes->value = 0;
    mes->value_signed = 0;
    mes->value_show = 1;
    mes->value_narrow = 0;
    mes->space_width = -1;
    mes->space_area = -1;
    mes->cursor_row = -1;
    mes->cursor_y = 0;
    mes->cursor_lit = 0;
    for (int i = 0; i < 10; i++) {
        mes->line_pos[i].x = -1;
        mes->line_pos[i].y = -1;
    }
    message->unk_17B0 = unk_18;
    message->SetBuff_system(SystemMes);
    message->SetBuff(buffer);
    message->tex_block = 0x1A;
    ClsMes *window = message;
    window->auto_pos = -1;
    message->Preset(1);
    message->narrow_gaiji_set = 2;
    message->style = 2;
    message->rows = 9;
    message->stay_frame = 0;
    message->char_width = GetMenuCommonFontW(BtlMenuNowLang, -1);
    message->value_show = 0;
    message->unk_02C = 0x100;
    message->unk_030 = 0x100;
    InitData();
}

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

#ifdef NON_MATCHING
void MenuClsMes::Draw1(int x, int y, int) {
    if (message == NULL || weapon == NULL) {
        return;
    }
    switch (mode) {
        case 2:
        case 1: {
            if (option_flags == 0 || option_flags == 1) {
                return;
            }
            int row_y = y - option_count * 0xA;
            DrawMenu2DSprite(PerBoardTex, CRect_i_(x + 0x1E, row_y - 0x17, 0x52, 0x17), CRect_i_(0x80, 0x68, 0x52, 0x18), alpha);
            DrawMenu2DSprite(PerBoardTex, CRect_i_(x - 0x24, y - 0xA, 0x20, 0x20), CRect_i_(0x80, 0x80, 0x20, 0x20), alpha);
            CRect_i_ left(0x20, 0x80, 0x20, 0x18);
            CRect_i_ middle(0x40, 0x80, 0x14, 0x18);
            CRect_i_ right(0x78, 0x80, 8, 0x18);
            CRect_i_ icon(0xEC, 0x50, 0x14, 0x14);
            CTexture *faces = TexManager.GetTexture("charaface", -1);
            for (int i = 1; i < 14; i++) {
                if (i == 8) {
                    icon.x -= icon.width;
                }
                if (option_flags & (1 << i)) {
                    if (IsWeaponOptionGoodOrBad(i) != 0) {
                        right.y = 0x80;
                        middle.y = 0x80;
                        left.y = 0x80;
                    } else {
                        right.y = 0x68;
                        middle.y = 0x68;
                        left.y = 0x68;
                    }
                    int row = i;
                    if (i >= 8) {
                        row = i - 7;
                    }
                    if (i == 8 && row == 1) {
                        row++;
                    }
                    if (i == 9 && row == 2) {
                        row--;
                    }
                    icon.y = icon.height * (row - 1) + 0x50;
                    DrawMenu2DSprite(PerBoardTex, CRect_i_(x, row_y, left.width, left.height), left, alpha);
                    DrawMenu2DSprite(PerBoardTex, CRect_i_(x + left.width, row_y, 0x64, middle.height), middle, alpha);
                    DrawMenu2DSprite(PerBoardTex, CRect_i_(x + left.width + 0x64, row_y, right.width, right.height), right, alpha);
                    DrawMenu2DSprite(faces, CRect_i_(x + 2, row_y + 2, 0x14, 0x15), icon, alpha);
                    row_y += left.height;
                }
            }
            MenuTextureReload(message->tex_block);
            int text_y = y - option_count * 0xA;
            for (int i = 0; i < option_count; i++) {
                int text_x = x + 0xB + 0x11 - message->GetMesLen_system(message->mes_no[i]) * 5;
                ClsMes *mes = message;
                if (i >= 0 && i < 10) {
                    mes->line_pos[i].x = text_x;
                    mes->line_pos[i].y = text_y;
                }
                text_y += left.height;
            }
            message->edge_alpha = alpha;
            message->DrawMesWin();
            break;
        }
        case 0:
            break;
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/battlemenu", Draw1__10MenuClsMesFiii);
#endif
