#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 3062

#include "menu_save.hpp"

#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "battle_globals.hpp"
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
#include "menu_draw.hpp"
#include "menu_inventory.hpp"
#include "menuitemstep.hpp"
#include "mglib.hpp"
#include "rect.hpp"
#include "savedata.hpp"
#include "snd.hpp"
#include "texture.hpp"
#include "userstatus.hpp"

SAVE_MENU_STATE SaveMenu;
CTexture       *SaveMenuMojiTextbl[4];

/** State of the event item selection menu. */
MINI_MENU_INFO MiniMenu;

/**
 * Closes the save screen's message window and restores the pad, and after a
 * load sets the stereo mode from the loaded configuration.
 */
void ExitSaveSelect();

/**
 * Draws a section of the event item board, clipped to a range.
 *
 * @mangled DrawEventItemBoard__FiiiiiP8CTexture
 * @address 0x225420
 * @size 0x10C
 */
static void DrawEventItemBoard(int x, int y, int top, int bottom, int alpha, CTexture *texture);

/**
 * Handles pad input for the event item selection menu.
 *
 * @mangled EventItemSelectKey__FPi
 * @address 0x224260
 * @size 0x6A4
 */
static int EventItemSelectKey(int *result);

/**
 * Draws the event item selection menu.
 *
 * @mangled EventItemSelectDraw__Fv
 * @address 0x224D50
 * @size 0x6C4
 */
static void EventItemSelectDraw();

/**
 * Checks the memory card before a save and picks the save menu's next step.
 *
 * @mangled SaveMenuKeySaveCheck__Fv
 * @address 0x221730
 * @size 0x168
 */
static int SaveMenuKeySaveCheck() {
    MC_CARD_INFO *card = &McAccess.card[McAccess.port];

    if (McCheckMCPs2(card) == 0) {
        SaveMenu.key_no = 0xE;
        SaveMenu.alert_no = 1;
        return 1;
    }
    if ((card->result < 0) || (card->format_change != 0)) {
        SaveMenu.key_no = 0xE;
        SaveMenu.alert_no = 6;
        return 1;
    }
    if (card->formatted == 0) {
        SaveMenu.key_no = 0x11;
        McAccess.SetFuncNo(0);
        return 1;
    }
    if (card->dir_exists == 0) {
        SaveMenu.key_no = 0x10;
        return 1;
    }
    if (McAccess.CheckFileNo(SaveMenu.file_no) != 0) {
        SaveMenu.key_no = 9;
    } else {
        McAccess.SetFuncNo(0);
        SaveMenu.key_no = 0xA;
    }
    return 1;
}

/**
 * Handles the save menu's prompt to confirm a save.
 *
 * @mangled SaveMenuKeySaveDecide__Fv
 * @address 0x2218A0
 * @size 0xE0
 */
static int SaveMenuKeySaveDecide() {
    if (GamePad.Down(0x40) != 0) {
        McAccess.SetFuncNo(0);
        int file_no = SaveMenu.file_no;
        McAccess.file_no = file_no;
        ((s32 *) SaveData->GetConfigData())[17] = file_no;
        SaveMenu.key_no = 0xA;
        ComMenuSePlay(1);
        return 1;
    }
    if (GamePad.Down(0x20) != 0) {
        SaveMenu.key_no = 7;
        ComMenuSePlay(2);
        SaveMenu.step_time = 0;
        return 1;
    }
    return 1;
}

/**
 * Steps the save menu while the game is written to the memory card.
 *
 * @mangled SaveMenuKeySave__Fv
 * @address 0x221980
 * @size 0x130
 */
static int SaveMenuKeySave() {
    MC_CARD_INFO *card = &McAccess.card[McAccess.port];

    if (McCheckMCPs2(card) == 0) {
        SaveMenu.key_no = 0xE;
        SaveMenu.alert_no = 1;
        return 1;
    }
    if (card->result < 0) {
        SaveMenu.key_no = 0xE;
        SaveMenu.alert_no = 6;
        return 1;
    }
    if ((card->free_size < 0x50) && (McAccess.CheckFileNo(SaveMenu.file_no) == 0)) {
        SaveMenu.key_no = 0xE;
        SaveMenu.alert_no = 0xB;
        return 1;
    }
    McAccess.SetFuncNo(5);
    McAccess.file_no = SaveMenu.file_no;
    SaveMenu.key_no = 0xB;
    return 1;
}

/**
 * Waits for a button press once a save has finished.
 *
 * @mangled SaveMenuKeyEndSave__Fv
 * @address 0x221AB0
 * @size 0x74
 */
static int SaveMenuKeyEndSave() {
    if ((GamePad.Down(0x40) != 0) || (GamePad.Down(0x20) != 0)) {
        McAccess.SetFuncNo(1);
        SaveMenu.key_no = 7;
    }
    return 1;
}

/**
 * Confirms loading the selected save file and advances the menu state.
 *
 * @mangled SaveMenuKeyLoadDecide__Fv
 * @address 0x221B30
 * @size 0x100
 */
static int SaveMenuKeyLoadDecide() {
    if (GamePad.Down(0x40) != 0) {
        int file_no = SaveMenu.file_no;

        SAVEDATA_INFO *file_info = &McAccess.file_info[file_no];

        if (file_info->state != 0) {
            McAccess.SetFuncNo(0);
            McAccess.file_no = SaveMenu.file_no;
            SaveMenu.key_no = 0xD;
            ComMenuSePlay(1);
        } else {
            ComMenuSePlay(2);
        }
        return 1;
    }
    if (GamePad.Down(0x20) != 0) {
        SaveMenu.key_no = 7;
        ComMenuSePlay(2);
        return 1;
    }
    return 1;
}

/**
 * Steps the save menu while a save is read from the memory card.
 *
 * @mangled SaveMenuKeyLoad__Fv
 * @address 0x221C30
 * @size 0xDC
 */
static int SaveMenuKeyLoad() {
    MC_CARD_INFO *card = &McAccess.card[McAccess.port];

    if (McCheckMCPs2(card) == 0) {
        SaveMenu.key_no = 0xE;
        SaveMenu.alert_no = 1;
        return 1;
    }
    if (card->result < 0) {
        SaveMenu.key_no = 0xE;
        SaveMenu.alert_no = 6;
        return 1;
    }
    McAccess.SetFuncNo(6);
    McAccess.file_no = SaveMenu.file_no;
    SaveMenu.key_no = 7;
    return 1;
}

/**
 * Waits for a button press while the save menu shows an alert.
 *
 * @mangled SaveMenuKeyArart__Fv
 * @address 0x221D10
 * @size 0x128
 */
static int SaveMenuKeyArart() {
    switch (SaveMenu.alert_no) {
        case 0:
            break;
        case 1:
            if (GamePad.Down(0x60) != 0) {
                SaveMenu.key_no = 3;
                SaveMenu.file_no = McAccess.port;
                ComMenuSePlay(2);
            }
            break;
        case 2:
            if (GamePad.Down(0x60) != 0) {
                SaveMenu.key_no = 3;
                SaveMenu.file_no = McAccess.port;
                ComMenuSePlay(2);
            }
            break;
        default:
            if (GamePad.Down(0x60) != 0) {
                SaveMenu.key_no = 3;
                SaveMenu.file_no = McAccess.port;
                ComMenuSePlay(2);
            }
            break;
    }
    return 1;
}

/**
 * Handles the save menu's prompt to create new save data.
 *
 * @mangled SaveMenuKeyNewDirSelect__Fv
 * @address 0x221E40
 * @size 0xC8
 */
static int SaveMenuKeyNewDirSelect() {
    if (GamePad.Down(0x40) != 0) {
        McAccess.SetFuncNo(0);
        SaveMenu.key_no = 0xF;
        ComMenuSePlay(1);
        return 1;
    }
    if (GamePad.Down(0x20) != 0) {
        SaveMenu.key_no = 3;
        SaveMenu.file_no = McAccess.port;
        SaveMenu.step_time = 0;
        ComMenuSePlay(2);
        return 1;
    }
    return 1;
}

/**
 * Steps the save menu while new save data is created on the memory card.
 *
 * @mangled SaveMenuKeyNewDir__Fv
 * @address 0x221F10
 * @size 0x108
 */
static int SaveMenuKeyNewDir() {
    MC_CARD_INFO *card = &McAccess.card[McAccess.port];

    if (McCheckMCPs2(card) == 0) {
        SaveMenu.key_no = 0xE;
        SaveMenu.alert_no = 1;
        return 1;
    }
    if ((card->result < 0) || (card->formatted == 0)) {
        SaveMenu.key_no = 0xE;
        SaveMenu.alert_no = 6;
        return 1;
    }
    if (card->free_size < 0x190) {
        SaveMenu.key_no = 0xE;
        SaveMenu.alert_no = 0xA;
        return 1;
    }
    McAccess.SetFuncNo(3);
    SaveMenu.key_no = 0xA;
}

/**
 * Handles the save menu's memory card format step.
 *
 * @mangled SaveMenuKeyFormat__Fv
 * @address 0x222020
 * @size 0x150
 */
static int SaveMenuKeyFormat() {
    MC_CARD_INFO *card = &McAccess.card[McAccess.port];

    if (McCheckMCPs2(card) == 0) {
        SaveMenu.key_no = 0xE;
        SaveMenu.alert_no = 1;
        return 1;
    }
    if (card->result < 0) {
        SaveMenu.key_no = 0xE;
        SaveMenu.alert_no = 6;
        return 1;
    }
    if (GamePad.Down(0x40) != 0) {
        McAccess.SetFuncNo(9);
        SaveMenu.key_no = 0xF;
        ComMenuSePlay(1);
        return 1;
    }
    if (GamePad.Down(0x20) != 0) {
        SaveMenu.key_no = 3;
        SaveMenu.file_no = McAccess.port;
        ComMenuSePlay(2);
        return 1;
    }
    return 1;
}

/**
 * Handles the menu response after checking an unformatted memory card.
 *
 * @mangled SaveMenuKeyUnFormat__Fv
 * @address 0x222170
 * @size 0x78
 */
static int SaveMenuKeyUnFormat() {
    MC_CARD_INFO *card = &McAccess.card[McAccess.port];

    if (card->formatted != 0) {
        McAccess.SetFuncNo(0xA);
    } else {
        SaveMenu.key_no = 3;
        SaveMenu.file_no = McAccess.port;
    }
    return 1;
}

/**
 * Waits for a button press when the save data is of a different version.
 *
 * @mangled SaveMenuKeyDifVersion__Fv
 * @address 0x2221F0
 * @size 0x5C
 */
static int SaveMenuKeyDifVersion() {
    if (GamePad.Down(0xF0) != 0) {
        McAccess.SetFuncNo(7);
        int file_no = McAccess.file_no;
        McAccess.file_no = file_no;
    }
    return 1;
}

/**
 * Steps the delete choice of the save menu.
 *
 * @mangled SaveMenuKeyDelete__Fv
 * @address 0x222250
 * @size 0xC
 */
static s32 SaveMenuKeyDelete() {
    return 1;
}

/**
 * Steps the copy choice of the save menu.
 *
 * @mangled SaveMenuKeyCopy__Fv
 * @address 0x222260
 * @size 0xC
 */
static s32 SaveMenuKeyCopy() {
    return 1;
}

/**
 * Handles key input on the save menu offered after the ending.
 *
 * @mangled SaveMenuKeyAfterEnding__Fv
 * @address 0x222270
 * @size 0x7C
 */
static int SaveMenuKeyAfterEnding() {
    if (GamePad.Down(0x40) != 0) {
        SaveMenu.key_no = 3;
    } else if (GamePad.Down(0x20) != 0) {
        SaveMenu.key_no = 1;
        ExitSaveSelect();
    }
    return 1;
}

/**
 * Handles the prompt to confirm a save after the ending.
 *
 * @mangled SaveMenuKeySaveDecideEnding__Fv
 * @address 0x2222F0
 * @size 0x7C
 */
static int SaveMenuKeySaveDecideEnding() {
    if (GamePad.Down(0x40) != 0) {
        SaveMenu.key_no = 0x17;
    } else if (GamePad.Down(0x20) != 0) {
        SaveMenu.key_no = 1;
        ExitSaveSelect();
    }
    return 1;
}

/**
 * Steps the save menu while saving after the ending.
 *
 * @mangled SaveMenuKeySaveEnding__Fv
 * @address 0x222370
 * @size 0x3C
 */
static int SaveMenuKeySaveEnding() {
    SaveMenu.key_no = 0x19;
    McAccess.SetFuncNo(0xE);
    return 1;
}

/**
 * Waits for a button press once the save after the ending has finished.
 *
 * @mangled SaveMenuKeyEndSaveEnding__Fv
 * @address 0x2223B0
 * @size 0x58
 */
static int SaveMenuKeyEndSaveEnding() {
    if (GamePad.Down(0x40) != 0) {
        SaveMenu.key_no = 3;
        McAccess.SetFuncNo(1);
    }
    return 1;
}

int GetSaveMenuMsgNo() {
    int msg_no = 0;

    switch (McAccess.GetFuncNo()) {
        case 0:
            switch (SaveMenu.key_no) {
                case 4:
                case 8:
                case 7:
                case 0xA:
                case 0xD:
                case 0xF:
                    msg_no = 0xFF;
                    break;
            }
        case 1:
            switch (SaveMenu.key_no) {
                case 5:
                    msg_no = 0xFF;
                    break;
                case 2:
                    msg_no = 0xFA;
                    break;
                case 3:
                    msg_no = 0xFB;
                    break;
                case 9:
                    msg_no = 0x108;
                    break;
                case 12:
                    msg_no = 0x10E;
                    break;
                case 14:
                    switch (SaveMenu.alert_no) {
                        case 1:
                            msg_no = 0xFD;
                            break;
                        case 2:
                            msg_no = 0x11B;
                            break;
                        case 6:
                            msg_no = 0x101;
                            break;
                        case 7:
                            msg_no = 0x11A;
                            break;
                        case 8:
                            msg_no = 0x10A;
                            break;
                        case 10:
                            msg_no = 0x117;
                            break;
                        case 11:
                            msg_no = 0x100;
                            break;
                        case 12:
                            msg_no = 0x111;
                            break;
                        case 9:
                            msg_no = 0x112;
                            break;
                        case 0:
                        case 3:
                        case 4:
                        case 5:
                            break;
                    }
                    break;
                case 17:
                    msg_no = 0x10B;
                    break;
                case 16:
                    msg_no = 0x118;
                    break;
                case 20:
                    msg_no = 0x122;
                    break;
                case 21:
                    msg_no = 0x124;
                    break;
                case 19:
                    msg_no = 0x12B;
                    break;
                case 23:
                case 24:
                    msg_no = 0;
                    break;
                case 22:
                    msg_no = 0x12A;
                    break;
                case 11:
                case 25:
                    msg_no = 0x106;
                    break;
                case 0:
                case 1:
                case 4:
                case 6:
                case 7:
                case 8:
                case 10:
                case 13:
                case 15:
                case 18:
                    break;
            }
            break;
        default:
            msg_no = McAccess.GetMsgNo(0xFA);
            break;
    }
    return msg_no;
}

int SaveMenuTextureEnter() {
    ReadBG();
    if (ReadBGSync() == 0) {
        LOADTEXTURE_INFO2 tex[3] = {
            {"#frame_image_save#640#" SCREEN_HEIGHT_STR "#4", 0, 0},
            {NULL,                                            0, 0},
            {NULL,                                            0, 0}
        };
        BG_READ_INFO *bg;
        u_int        *pack;
        int           i;

        tex[0].block_no = SaveMenu.block_no;
        tex[1].block_no = SaveMenu.block_no;
        bg = GetReadBGFile(0);
        pack = GetPackFile((u_int *) bg->buffer, "saveimg.img", NULL);
        tex[1].name = (char *) pack;
        TexManager.DeleteTextureBlock(SaveMenu.block_no);
        TexManager.CleanUpTextureList();
        TexManager.LoadTextureBlockEX(-1, tex);
        SaveBoard = TexManager.GetTexture("save", -1);

        char *moji_names[4] = {"alphabet", "kata", "hira", "alphabet"};
        for (i = 0; i < 4; i++) {
            SaveMenuMojiTextbl[i] = TexManager.GetTexture(moji_names[i], -1);
        }
        switch (SaveMenu.mode) {
            case 2:
            case 0:
                InitMenuMesSet(0, (short *) GetPackFile((u_int *) bg->buffer, allmenu_mes, NULL));
                break;
        }
        CommonMenuMes2.stay_frame = 1;
        CommonMenuMes2.value_show = 1;
        CommonMenuMes2.value_signed = 0;
        CommonMenuMes2.cursor_lit = 1;

        char        *save_buffer = (char *) pack + bg->size;
        MC_ICON_DATA icon = {
            {"dkicon.ico",   NULL, 0},
            {"dkicon_c.ico", NULL, 0},
            {"dkicon_d.ico", NULL, 0}
        };
        for (i = 0; i < 3; i++) {
            (&icon.view)[i].data = (char *) GetPackFile((u_int *) bg->buffer, (&icon.view)[i].name, &(&icon.view)[i].size);
        }
        McAccess.SetBuff(save_buffer);
        McAccess.SetIconData(&icon);
        McAccess.MakeMcIconSysInfo();
        return 1;
    }
    return 0;
}

int SaveMenuEffectFadeOut() {
    if (SaveMenu.key_no == 1) {
        return 1;
    }
    return 0;
}

/**
 * Computes the save board's alpha ramp at a position and at that position
 * offset by the second argument.
 *
 * @mangled GetSaveBoardAlphaInfo__FiiRiRii
 * @address 0x222940
 * @size 0x154
 */
static void GetSaveBoardAlphaInfo(int x, int width, int &start_alpha, int &end_alpha, int alpha) {
    if (x < 0) {
        start_alpha = 0;
    } else if ((0 <= x) && (x < 0x81)) {
        start_alpha = (x * alpha) >> 7;
    } else if ((x > 0x80) && (x < SCREEN_HEIGHT - 0x7F)) {
        start_alpha = (alpha * 0x80) >> 7;
    } else if ((x > SCREEN_HEIGHT - 0x80) && (x < SCREEN_HEIGHT + 1)) {
        start_alpha = ((SCREEN_HEIGHT - x) * alpha) >> 7;
    } else {
        start_alpha = 0;
    }

    x += width;
    if (x < 0) {
        end_alpha = 0;
    } else if ((0 <= x) && (x < 0x81)) {
        end_alpha = (x * alpha) >> 7;
    } else if ((x > 0x80) && (x < SCREEN_HEIGHT - 0x7F)) {
        end_alpha = (alpha * 0x80) >> 7;
    } else if ((x > SCREEN_HEIGHT - 0x80) && (x < SCREEN_HEIGHT + 1)) {
        end_alpha = ((SCREEN_HEIGHT - x) * alpha) >> 7;
    } else {
        end_alpha = 0;
    }
}

void DrawSaveBoard(SAVEDATA_INFO *info, CTexture **name_texture, int x, int y, int unused, int alpha) {
    int i;
    int draw_x;
    int draw_y;
#ifndef PAL
    int time[3];
#endif

    if (info == NULL) {
        return;
    }
    spRGBA top = {0x80, 0x80, 0x80, 0};
    top.a = alpha;
    spRGBA bottom = {0x80, 0x80, 0x80, 0};
    bottom.a = alpha;
    int start_alpha;
    int end_alpha;
    GetSaveBoardAlphaInfo(y, 0x88, start_alpha, end_alpha, alpha);
    top.a = start_alpha;
    bottom.a = end_alpha;
    DrawMenu2DSprite(SaveBoard, CRect_i_(x, y, 0x180, 0x87), CRect_i_(0, 0, 0x180, 0x88), &top, &top, &bottom, &bottom);

    draw_x = x + 0x54;
#ifdef PAL
    s8 number_shift[] = {0, 0, 0, 10, 0, 4, 13};
    draw_x += number_shift[GetMenuLangFlag()];
    int time[3];
#endif
    draw_y = y + 8;
    RECT number_rect = {0x88, 0xCA, 0xC, 0x10};
    GetSaveBoardAlphaInfo(y, 0x10, start_alpha, end_alpha, alpha);
    top.a = start_alpha;
    bottom.a = end_alpha;
    if (info != NULL) {
        int digits;
        int number = info->file_no;
        int clip_y;
        int src_y;
        int height;
        int digit;
        int width;
        int src_x;

        for (digits = GetNumberKeta(number); 0 < digits; digits--) {
            clip_y = draw_y;
            digit = number % 10;
            width = number_rect.width;
            draw_x -= width - 1;
            src_x = number_rect.x + width * digit;
            src_y = number_rect.y;
            height = number_rect.height;
            MenuTextureClip(clip_y, src_y, height, 0, SCREEN_HEIGHT);
            DrawMenu2DSprite(SaveBoard, CRect_i_(draw_x, clip_y, width, height - 1), CRect_i_(src_x, src_y, width, height), &top, &top, &bottom, &bottom);
            number /= 10;
        }
    }

    draw_x = x + 0x1A;
    draw_y = y + 0x1C;
    GetSaveBoardAlphaInfo(y, 0x16, start_alpha, end_alpha, alpha);
    top.a = start_alpha;
    bottom.a = end_alpha;
    int name_x = draw_x + 8;
    if (info->name != NULL) {
        DrawSaveBoardCharaName2(name_x, draw_y, (short *) info->name, name_texture, top, bottom);
    }

    // Play time, as hours, minutes and seconds.
    RECT time_rect = {0x88, 0xB8, 0xC, 0x12};
    int  column = x + 0x92;
    draw_x = column + 0xA;
    draw_y = y + 0x36;
    GetSaveBoardAlphaInfo(draw_y, 0x12, start_alpha, end_alpha, alpha);
    top.a = start_alpha;
    bottom.a = end_alpha;
    int frames = info->play_time;
    if (frames >= 0x1499700) {
        frames = 0x14996C4;
    }
    frames /= 60;
    time[0] = frames / 3600;
    time[1] = (frames / 60 - time[0] * 60) % 60;
    time[2] = frames % 60;
    for (int part = 2; part >= 0; part--) {
        int value = time[part];
        DrawMenu2DSprite(SaveBoard, CRect_i_(draw_x, draw_y, time_rect.width, time_rect.height), CRect_i_(time_rect.x + time_rect.width * (value / 10), time_rect.y, time_rect.width, time_rect.height), &top, &top, &bottom, &bottom);
        DrawMenu2DSprite(SaveBoard, CRect_i_(draw_x + time_rect.width, draw_y, time_rect.width, time_rect.height), CRect_i_(time_rect.x + time_rect.width * (value % 10), time_rect.y, time_rect.width, time_rect.height), &top, &top, &bottom, &bottom);
        draw_x -= 0x1E;
    }
    CRect_i_ colon(0x100, 0xB8, 0xC, 0x12);
    GetSaveBoardAlphaInfo(draw_y, 0x12, start_alpha, end_alpha, alpha);
    top.a = start_alpha;
    bottom.a = end_alpha;
    draw_x = column + 2;
    DrawMenu2DSprite(SaveBoard, CRect_i_(draw_x, draw_y, 0xC, 0x12), colon, &top, &top, &bottom, &bottom);
    DrawMenu2DSprite(SaveBoard, CRect_i_(draw_x - 0x1E, draw_y, 0xC, 0x12), colon, &top, &top, &bottom, &bottom);

    draw_x = x + 0x88;
    draw_y = y + 0x52;
    GetSaveBoardAlphaInfo(draw_y, 0x12, start_alpha, end_alpha, alpha);
    top.a = start_alpha;
    bottom.a = end_alpha;
    {
        int digits;
        int number = info->quest_total;
        int clip_y;
        int src_y;
        int height;
        int digit;
        int width;
        int src_x;

        for (digits = GetNumberKeta(number); 0 < digits; digits--) {
            clip_y = draw_y;
            digit = number % 10;
            width = number_rect.width;
            draw_x -= width - 1;
            src_x = number_rect.x + width * digit;
            src_y = number_rect.y;
            height = number_rect.height;
            MenuTextureClip(clip_y, src_y, height, 0, SCREEN_HEIGHT);
            DrawMenu2DSprite(SaveBoard, CRect_i_(draw_x, clip_y, width, height - 1), CRect_i_(src_x, src_y, width, height), &top, &top, &bottom, &bottom);
            number /= 10;
        }
    }

    // Row of each map's name on the board texture; a map from 14 on is in the second block.
    int map = info->map_no;
    s16 map_name[62] = {0, 1, 2, 3, 6, 0, 0, 0, 0, 0, 0, 1, 1, 1, 9, 9, 9, 9, 9, 2, 2,
                        4, 10, 4, 13, 13, 13, 10, 9, 4, 4, 4, 4, 1, 10, 12, 10, 5, 13, 12, 13, 4,
                        10, 2, 2, 2, 13, 4, 13, 13, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 14};
    int name_u;
    int name_v;
    if (map_name[map] < 0xE) {
        name_u = (map_name[map] / 7) * 0x88;
        name_v = (map_name[map] % 7) * 0x14 + 0xB8;
    } else {
        map_name[map] -= 0xE;
        name_u = (map_name[map] / 7) * 0x88;
        name_v = (map_name[map] % 7) * 0x14 + 0x144;
    }
    draw_x = x + 0x23;
    draw_y = y + 0x63;
    GetSaveBoardAlphaInfo(draw_y, 0x14, start_alpha, end_alpha, alpha);
    top.a = start_alpha;
    bottom.a = end_alpha;
    DrawMenu2DSprite(SaveBoard, CRect_i_(draw_x, draw_y, 0x88, 0x15), CRect_i_(name_u, name_v, 0x88, 0x14), &top, &top, &bottom, &bottom);

    // A face for each member of the party, three to a row.
    int face_x = x + 0xCF;
    draw_x = face_x;
    draw_y = y + 0x1A;
    GetSaveBoardAlphaInfo(draw_y, 0x30, start_alpha, end_alpha, alpha);
    top.a = start_alpha;
    bottom.a = end_alpha;
    for (i = 0; i < info->party_size; i++) {
        DrawMenu2DSprite(SaveBoard, CRect_i_(draw_x, draw_y, 0x30, 0x31), CRect_i_(i * 0x30, 0x88, 0x30, 0x30), &top, &top, &bottom, &bottom);
        draw_x += 0x38;
        if (i == 2) {
            draw_x = face_x;
            draw_y += 0x34;
            GetSaveBoardAlphaInfo(draw_y, 0x30, start_alpha, end_alpha, alpha);
            top.a = start_alpha;
            bottom.a = end_alpha;
        }
    }
}

void DrawNewFileTemplete(int x, int y, int alpha) {
    int start_alpha;
    int end_alpha;

    if (y % 2 != 0) {
        y++;
    }
    spRGBA top = {0x80, 0x80, 0x80, 0};
    top.a = alpha;
    spRGBA bottom = {0x80, 0x80, 0x80, 0};
    bottom.a = alpha;

    // Top edge: two corners and the run between them.
    GetSaveBoardAlphaInfo(y, 0x10, start_alpha, end_alpha, 0x80);
    top.a = start_alpha;
    bottom.a = end_alpha;
    set2DSprite(Vif1Packet, SaveBoard, CRect_i_(x, y, 0x10, 0xF), CRect_i_(0x120, 0x88, 0x10, 0x10), &top, &top, &bottom, &bottom, 1);
    set2DSprite(Vif1Packet, SaveBoard, CRect_i_(x + 0x170, y, 0x10, 0xF), CRect_i_(0x140, 0x88, 0x10, 0x10), &top, &top, &bottom, &bottom, 1);
    set2DSprite(Vif1Packet, SaveBoard, CRect_i_(x + 0x10, y, 0x160, 0xF), CRect_i_(0x130, 0x88, 0x10, 0x10), &top, &top, &bottom, &bottom, 1);

    // Bottom edge.
    GetSaveBoardAlphaInfo(y + 0x78, 0x10, start_alpha, end_alpha, 0x80);
    top.a = start_alpha;
    bottom.a = end_alpha;
    set2DSprite(Vif1Packet, SaveBoard, CRect_i_(x, y + 0x78, 0x10, 0xF), CRect_i_(0x120, 0xA8, 0x10, 0x10), &top, &top, &bottom, &bottom, 1);
    set2DSprite(Vif1Packet, SaveBoard, CRect_i_(x + 0x170, y + 0x78, 0x10, 0xF), CRect_i_(0x140, 0xA8, 0x10, 0x10), &top, &top, &bottom, &bottom, 1);
    set2DSprite(Vif1Packet, SaveBoard, CRect_i_(x + 0x10, y + 0x78, 0x160, 0xF), CRect_i_(0x130, 0xA8, 0x10, 0x10), &top, &top, &bottom, &bottom, 1);

    // Sides.
    GetSaveBoardAlphaInfo(y + 0x10, 0x68, start_alpha, end_alpha, 0x80);
    top.a = start_alpha;
    bottom.a = end_alpha;
    set2DSprite(Vif1Packet, SaveBoard, CRect_i_(x, y + 0xF, 0x10, 0x69), CRect_i_(0x120, 0x98, 0x10, 0x10), &top, &top, &bottom, &bottom, 1);
    set2DSprite(Vif1Packet, SaveBoard, CRect_i_(x + 0x170, y + 0xF, 0x10, 0x69), CRect_i_(0x140, 0x98, 0x10, 0x10), &top, &top, &bottom, &bottom, 1);

    // "New file".
    GetSaveBoardAlphaInfo(y + 0x35, 0x1E, start_alpha, end_alpha, 0x80);
    top.a = start_alpha;
    bottom.a = end_alpha;
#ifdef PAL
    s8  label_inset[] = {64, 64, 64, 64, 38, 64, 64};
    int label_x = 0xC0 - label_inset[GetMenuLangFlag()];
    set2DSprite(GetVif1Packet(), SaveBoard, CRect_i_(x + label_x, y + 0x35, 0x74, 0x1E), CRect_i_(0x10C, 0xB8, 0x74, 0x1E), &top, &top, &bottom, &bottom, 1);
#else
    set2DSprite(GetVif1Packet(), SaveBoard, CRect_i_(x + 0x86, y + 0x35, 0x74, 0x1E), CRect_i_(0x10C, 0xB8, 0x74, 0x1E), &top, &top, &bottom, &bottom, 1);
#endif
}

int InitExistData() {
    int port;
    int result;

    if (McAccess.InitForMC() != 0) {
        printf("Memory Card Initialized Failed\n");
        return 0;
    }
    for (port = 0; port < 2; port++) {
        McAccess.port = port;
        McAccess.SetFuncNo(0);
        do {
            result = McAccess.Step();
        } while (result == 0);
        if (result < 0) {
            continue;
        }
        MC_CARD_INFO *card = &McAccess.card[McAccess.port];
        if ((McCheckMCPs2(card) == 0) || (card->formatted == 0)) {
            continue;
        }
        McAccess.SetFuncNo(2);
        while (McAccess.Step() == 0) {
        }
        McAccess.SetFuncNo(0xD);
        do {
            result = McAccess.Step();
        } while (result == 0);
        if ((result >= 0) && (card->dir_exists != 0)) {
            return 1;
        }
    }
    return 0;
}

int SaveEnableCheck() {
    int found;
    int free_size;
    int port;
    int result;

    if (McAccess.InitForMC() != 0) {
        return 0;
    }
    found = 0;
    free_size = 0;
    for (port = 0; port < 2; port++) {
        McAccess.port = port;
        McAccess.SetFuncNo(0);
        do {
            result = McAccess.Step();
        } while (result == 0);
        if (result < 0) {
            continue;
        }
        MC_CARD_INFO *card = &McAccess.card[McAccess.port];
        if (McCheckMCPs2(card) == 0) {
            continue;
        }
        found = 1;
        if (card->formatted == 0) {
            return found;
        }
        McAccess.SetFuncNo(2);
        do {
            result = McAccess.Step();
        } while (result == 0);
        if (result < 0) {
            continue;
        }
        if (card->dir_exists != 0) {
            return 1;
        }
        if (free_size < card->free_size) {
            free_size = card->free_size;
        }
    }
    if (found == 0) {
        return 0;
    }
    if (free_size < 0x190) {
        return -1;
    }
    return 1;
}

/**
 * Screen position of the event item selection board's top left corner.
 */
float EventBoardPos[2];

/**
 * Screen y of the event item board's first row, eased toward the scroll row.
 */
int EventItemMoveY;

/**
 * Screen y of the event item board's scroll bar, eased toward its target.
 */
float EventBarY;

/**
 * Board texture of the event item selection menu.
 */
CTexture *MiniEventBoard;

/**
 * Board texture of the fish food selection menu.
 */
CTexture *FishFoodBoard;

/**
 * The item pack the event item selection menu lists.
 */
ITEM_PACK *EventItemPackPt;

s32 MiniEventTextureBlock;

/**
 * Nonzero once the event item selection menu's textures have loaded.
 */
int MiniEventTexReadFlag;

/**
 * Screen position of the event item cursor's highlight, eased toward the cursor.
 */
float MiniCur[2];

void InitEventItemSelect(int block, int *usable, ITEM_PACK *pack, int x, int y, int vanish, int fish_mode) {
    int i;

    GamePad.SetAutoRepeat(0xF000, 0x1E, 5);
    GamePad.MenuModeOn(0x78);
    StayTex = TexManager.GetTexture(AtoraVibeTextureName, -1);
    MiniMenu.fish_mode = fish_mode;
    MiniEventTextureBlock = block;
    MiniMenu.lang = GetMenuLangFlag();
    s8 lang_y[7] = {0, -0x10, -0x10, -0x10, -0x10, -0x10, -0x10};
    EventBoardPos[0] = x;
#ifdef PAL
    EventBoardPos[1] = (float) y + (float) lang_y[MiniMenu.lang] + 20.0f;
#else
    EventBoardPos[1] = (float) y + (float) lang_y[MiniMenu.lang];
#endif
    EventItemPackPt = pack;
    MiniMenu.event_item_num = 0;
    for (i = 0; i < pack->num; i++) {
        if (pack->item[i] >= ITEM_DUNGEON_START) {
            MiniMenu.event_item_num++;
        }
    }
    for (MiniMenu.usable_num = 0; MiniMenu.usable_num < 13; MiniMenu.usable_num++) {
        MiniMenu.usable[MiniMenu.usable_num] = usable[MiniMenu.usable_num];
        printf("itemno = %d\n", usable[MiniMenu.usable_num]);
        if (usable[MiniMenu.usable_num] < 0) {
            break;
        }
    }
    MiniMenu.selected = -1;
    MiniMenu.vanish = vanish;
    if (MiniMenu.vanish != 0) {
        printf("vanish after use !\n");
    } else {
        printf("exist after use \n");
    }
    LOADTEXTURE_INFO2 texture[2] = {
        {"#frame_image#640#" SCREEN_HEIGHT_STR "#4", 0, 0},
        {NULL,                                       0, 0}
    };
    texture[0].block_no = MiniEventTextureBlock;
    TexManager.DeleteTextureBlock(MiniEventTextureBlock);
    TexManager.CleanUpTextureList();
    TexManager.LoadTextureBlockEX(-1, texture);
    StartReadBG();
    u_long128 *buffer = (u_long128 *) read_buffer;
    buffer = MenuCalcBufAlignment(buffer);
    LoadFileBGMenuData("eventmnu2.pak", buffer);
    ReadBG();
    MiniMenu.cursor = 0;
    MiniMenu.scroll_row = 0;
    EventItemMoveY = 56.0f + EventBoardPos[1] - MiniMenu.scroll_row * 0x28;
    int rows = EventItemPackPt->num / 5;
    if (rows <= 0) {
        rows = 1;
    }
    EventBarY = 60.0f + EventBoardPos[1] + (int) (68.0f * MiniMenu.scroll_row) / rows;
    MiniCur[0] = 6.0f + EventBoardPos[0] + ((MiniMenu.cursor + 5) % 5) * 0x2A;
    MiniCur[1] = 60.0f + EventBoardPos[1] + ((MiniMenu.cursor - MiniMenu.scroll_row * 5) / 5) * 0x28;
    MiniMenu.state = 2;
    MiniEventTexReadFlag = 0;
}

/**
 * Frees the event item selection menu's textures and releases the pad.
 *
 * @mangled EventItemSelectExit__Fv
 * @address 0x2240E0
 * @size 0x5C
 */
static void EventItemSelectExit() {
    TexManager.DeleteTextureBlock(MiniEventTextureBlock);
    TexManager.CleanUpTextureList();
    GamePad.AutoRepeatOff();
    GamePad.MenuModeOff();
}

int EventItemSelectLoop(int *result) {
    int done;
    int alpha;

    ReadBG();
    alpha = 0x40;
    switch (MiniMenu.state) {
        case 0:
            alpha = 0x40;
            break;
        case 2:
            alpha = 0x80 - MiniMenu.state_time * 4;
            if (alpha < 0x40) {
                alpha = 0x40;
            }
            break;
        case 3:
            alpha = MiniMenu.state_time * 4 + 0x40;
            if (alpha > 0x80) {
                alpha = 0x80;
            }
            break;
    }
    setbilinear(0);
    FrameImageDraw(alpha, 0x80);
    MenuTextureReload(MiniEventTextureBlock);
    done = EventItemSelectKey(result);
    EventItemSelectDraw();
    setbilinear(1);
    if (done != 0) {
        EventItemSelectExit();
    }
    return done;
}

static int EventItemSelectKey(int *result) {
    int  done;
    int  old_cursor;
    int  slot_num;
    int  pack_index;
    int  accepted;
    int  i;
    s16 *slot;

    if (MiniEventTexReadFlag == 0) {
        if (ReadBGSync() == 0) {
            LOADTEXTURE_INFO2 texture[4] = {
                {"#frame_image#640#" SCREEN_HEIGHT_STR "#4", 0, 0},
                {NULL,                                       0, 0},
                {NULL,                                       0, 0},
                {NULL,                                       0, 0}
            };
            texture[0].block_no = MiniEventTextureBlock;
            texture[1].block_no = MiniEventTextureBlock;
            texture[2].block_no = MiniEventTextureBlock;
            BG_READ_INFO *file = GetReadBGFile(0);
            texture[1].name = (char *) GetPackFile((u_int *) file->buffer, "eventmnu.img", NULL);
            texture[2].name = (char *) GetPackFile((u_int *) file->buffer, "fishmnu.img", NULL);
            TexManager.DeleteTextureBlock(MiniEventTextureBlock);
            TexManager.LoadTextureBlockEX(-1, texture);
            MiniEventBoard = TexManager.GetTexture("eventmnu", -1);
            FishFoodBoard = TexManager.GetTexture("fishmnu", -1);
            ItemIcon = TexManager.GetTexture("itemicon", -1);
            InitMenuMesSet(1, (short *) GetPackFile((u_int *) file->buffer, "eventuse.bin", NULL));
            CommonMenuMes2.MakeMesWin(0);
            CommonMenuMes2.Step();
            MiniEventTexReadFlag = 1;
        } else {
            return 0;
        }
    }
    done = 0;
    old_cursor = MiniMenu.cursor;
    slot_num = EventItemPackPt->num;
    switch (MiniMenu.state) {
        case 1:
            if (GamePad.Down(0x60) != 0) {
                MiniMenu.state = 0;
            }
            break;
        case 0:
            if (GamePad.Down(0x1000) != 0 && MiniMenu.cursor > 4) {
                MiniMenu.cursor -= 5;
            }
            if (GamePad.Down(0x4000) != 0 && MiniMenu.cursor < slot_num - 5) {
                MiniMenu.cursor += 5;
            }
            if (GamePad.Down(0x8000) != 0 && 0 < MiniMenu.cursor) {
                MiniMenu.cursor--;
            }
            if (GamePad.Down(0x2000) != 0 && MiniMenu.cursor < slot_num - 1) {
                MiniMenu.cursor++;
            }
            if (MiniMenu.cursor < MiniMenu.scroll_row * 5) {
                MiniMenu.scroll_row--;
            }
            if ((MiniMenu.scroll_row + 2) * 5 - 1 < MiniMenu.cursor) {
                MiniMenu.scroll_row++;
            }
            if (old_cursor != MiniMenu.cursor) {
                ComMenuSePlay(0);
            }
            if (GamePad.Down(0x80) != 0) {
                SeitonItemBoard(EventItemPackPt);
                ComMenuSePlay(1);
                break;
            }
            if (GamePad.Down(0x40) != 0) {
                pack_index = -1;
                if (MiniMenu.cursor < MiniMenu.event_item_num) {
                    int event_no = 0;
                    slot = EventItemPackPt->item;
                    for (pack_index = 0; pack_index < EventItemPackPt->num; pack_index++) {
                        if (*slot >= ITEM_DUNGEON_START) {
                            if (MiniMenu.cursor == event_no) {
                                *result = *slot;
                                break;
                            }
                            event_no++;
                        }
                        slot++;
                        if (pack_index == EventItemPackPt->num - 1) {
                            pack_index = EventItemPackPt->num;
                        }
                    }
                }
                accepted = 0;
                for (i = 0; slot != NULL && MiniMenu.usable[i] >= ITEM_DUNGEON_START && i < 13; i++) {
                    if (MiniMenu.usable[i] == *result) {
                        accepted = 1;
                        if (MiniMenu.vanish != 0 && 0 <= pack_index && pack_index < EventItemPackPt->num) {
                            EventItemPackPt->item[pack_index] = 0;
                        }
                        break;
                    }
                }
                if (slot == NULL) {
                    ComMenuSePlay(2);
                } else if (accepted != 0) {
                    done = 1;
                    ComMenuSePlay(1);
                } else {
                    printf("Miss\tselected itemNo = %d\n", *result);
                    ComMenuSePlay(1);
                    done = 1;
                    if (MiniMenu.fish_mode != 0) {
                        done = 0;
                        MiniMenu.state = 1;
                    }
                }
            } else if (GamePad.Down(0x20) != 0) {
                ComMenuSePlay(2);
                *result = -1;
                done = 1;
            }
            break;
    }
    s16 *item = NULL;
    if (MiniMenu.cursor < MiniMenu.event_item_num) {
        int event_no = 0;
        item = EventItemPackPt->item;
        for (int j = 0; j < EventItemPackPt->num; j++) {
            if (*item >= ITEM_DUNGEON_START) {
                if (MiniMenu.cursor == event_no) {
                    break;
                }
                event_no++;
            }
            item++;
        }
    }
    int message;
    if (item != NULL) {
        if (0 < *item) {
            message = *item + 500;
        } else {
            message = 0;
        }
    } else {
        message = 0;
    }
    if (CommonMenuMes2.mes_made != message) {
        CommonMenuMes2.MakeMesWin(message);
    }
    return done;
}

/**
 * Draws one vertical section of the board the event and fishing menus share.
 *
 * @mangled DrawEventAndFishMenuBoard_Ver__FP8CTexture8CRect_i_iiii
 * @address 0x224910
 * @size 0x148
 */
static void DrawEventAndFishMenuBoard_Ver(CTexture *texture, CRect_i_ rect, int src_u, int src_width, int unused, int alpha) {
    int y = rect.y;

    DrawMenu2DSprite(texture, CRect_i_(rect.x, y, rect.width, 0x94), CRect_i_(src_u, 0, src_width, 0x94), alpha);
    y += 0x94;
    DrawMenu2DSprite(texture, CRect_i_(rect.x, y, rect.width, rect.height + 0x32), CRect_i_(src_u, 0x94, src_width, 0x14), alpha);
    y += rect.height + 0x32;
    DrawMenu2DSprite(texture, CRect_i_(rect.x, y, rect.width, 0x1E), CRect_i_(src_u, 0xC6, src_width, 0x1E), alpha);
}

#ifndef PAL
/**
 * Extra height of the event item board in each menu language.
 */
s8 kakudai_tate_lang[7] = {0, 16, 16, 16, 16, 16, 16};

/**
 * Extra width of the event item board's side pieces in each menu language.
 */
s8 kakudai_yoko_lang[7] = {0, 10, 10, 10, 10, 10, 10};
#endif

/**
 * Draws the board the event and fishing menus share.
 *
 * @mangled DrawEventAndFishMenuBoard__FP8CTextureiiii
 * @address 0x224A60
 * @size 0x2E8
 */
static void DrawEventAndFishMenuBoard(CTexture *texture, int x, int y, int alpha, int lang) {
#ifdef PAL
    s8 kakudai_tate_lang[7] = {0, 16, 16, 16, 16, 16, 16};
    s8 kakudai_yoko_lang[7] = {0, 10, 10, 20, 10, 16, 14};
#endif
    int   extra_height = kakudai_tate_lang[lang];
    int   extra_width = kakudai_yoko_lang[lang];
    int   rows;
    float bar_height;

    CRect_i_ center(x + 0x1C, y, 0xD2, extra_height);
    DrawEventAndFishMenuBoard_Ver(texture, center, 0x1C, 0xD2, lang, alpha);
    int      edge = extra_width + 6;
    CRect_i_ left_inner(x + 0x1C - edge, y, edge, extra_height);
    CRect_i_ left_outer(x + 8 - edge, y, 0x14, extra_height);
    DrawEventAndFishMenuBoard_Ver(texture, left_inner, 0x14, 6, lang, alpha);
    DrawEventAndFishMenuBoard_Ver(texture, left_outer, 0, 0x14, lang, alpha);
    CRect_i_ right_inner(x + 0xEE, y, edge, extra_height);
    CRect_i_ right_outer(x + 0xEE + edge, y, 0x20, extra_height);
    DrawEventAndFishMenuBoard_Ver(texture, right_inner, 0xEC, 6, lang, alpha);
    DrawEventAndFishMenuBoard_Ver(texture, right_outer, 0xF4, 0x20, lang, alpha);

    rows = EventItemPackPt->num / 5;
    if (rows <= 0) {
        rows = 1;
    }
    bar_height = 136.0f / rows;
    if (68.0f < bar_height) {
        bar_height = 68.0f;
    }
    int bar_x = x + 0xF6 + edge;
    EventBarY += ((int) ((y + 0x3C) + (68.0f * MiniMenu.scroll_row) / rows) - EventBarY) / 4.0f;
    int bar_y = EventBarY;
    DrawMenu2DSprite(texture, CRect_i_(bar_x, bar_y, 8, (int) bar_height), CRect_i_(0, 0xE4, 8, 0xC), alpha);
}

static void EventItemSelectDraw() {
    s16       items[100];
    float     left;
    float     top;
    float     icon_x;
    float     row_top;
    int       alpha;
    int       x;
    int       y;
    CTexture *board;
    int       clip_bottom;
    int       row_y;
    int       i;
    int       clip_top;
    int       count;
    int       board_x;

    if (MiniEventTexReadFlag == 0) {
        return;
    }
    alpha = 0x80;
    switch (MiniMenu.state) {
        case 2:
            alpha = MiniMenu.state_time * 8;
            if (alpha > 0x80) {
                alpha = 0x80;
                MiniMenu.state = 0;
            }
            break;
        case 3:
            alpha = 0x80 - MiniMenu.state_time * 8;
            if (alpha < 0) {
                alpha = 0;
            }
            break;
    }
    left = EventBoardPos[0];
    top = EventBoardPos[1];
    x = left;
    y = top;
    if (MiniMenu.fish_mode != 0) {
        board = FishFoodBoard;
    } else {
        board = MiniEventBoard;
    }
    row_top = 56.0f + top;
    clip_top = row_top;
    clip_bottom = 136.0f + top;
    icon_x = 32.0f + left;
    x = icon_x;
    count = 0;
    board_x = 28.0f + left;
    row_y = row_top - MiniMenu.scroll_row * 0x28;
    EventItemMoveY += (row_y - EventItemMoveY) >> 2;
    if (abs(EventItemMoveY - row_y) < 4) {
        EventItemMoveY = row_y;
    }
    row_y = EventItemMoveY;
    for (i = 0; i < EventItemPackPt->num / 5; i++) {
        DrawEventItemBoard(board_x, row_y, clip_top, clip_bottom, alpha, board);
        row_y += 0x28;
    }
    memset(items, 0, sizeof(items));
    i = 0;
    for (int j = 0; j < EventItemPackPt->num; j++) {
        if (EventItemPackPt->item[j] >= ITEM_DUNGEON_START) {
            items[i++] = EventItemPackPt->item[j];
        }
    }
    row_y = EventItemMoveY;
    for (i = 0; i < 100; i++) {
        if (clip_bottom < y) {
            break;
        }
        y = row_y + 4;
        DrawIconParts(items[i], x, y, clip_top, clip_bottom, alpha, 0);
        x += 0x2A;
        count++;
        if (i % 5 == 4) {
            x = icon_x;
            row_y += 0x28;
        }
    }
    DrawEventAndFishMenuBoard(board, left, top, alpha, MiniMenu.lang);
    y = MiniMenu.cursor;
    x = 6.0f + left + ((y + 5) % 5) * 0x2A;
    y = 60.0f + top + ((y - MiniMenu.scroll_row * 5) / 5) * 0x28;
    DrawMenuWaku(x + 0x10, y - 9, 0x24, 0x24, 0, StayTex, alpha);
    MiniCur[0] += (x - MiniCur[0]) / 4.0f;
    MiniCur[1] += (y - MiniCur[1]) / 4.0f;
    DrawMenuObjectVibe(MiniCur[0], MiniCur[1], 1, 0x40);
    CursorVibeCnt++;
    if (CursorVibeCnt >= 0x405F7E00) {
        CursorVibeCnt = 0;
    }
    CommonMenuMes2.edge_alpha = alpha;
#ifdef PAL
    s8 message_pos[7][2] = {
        {0,  0},
        {-4, 0},
        {-4, 0},
        {-9, 0},
        {-4, 0},
        {-7, 0},
        {-6, 0}
    };
#else
    s8 message_pos[7][2] = {
        {0,  0},
        {-4, 0},
        {-4, 0},
        {-4, 0},
        {-4, 0},
        {-4, 0},
        {-4, 0}
    };
#endif
    DrawMenuClsMes(&CommonMenuMes2, 20.0f + left + message_pos[MiniMenu.lang][0], 146.0f + top + message_pos[MiniMenu.lang][1]);
    if (MiniMenu.state == 1) {
        if (CommonMenuMes1.mes_made != 1) {
            CommonMenuMes1.MakeMesWin(1);
        }
        AllFadeForMenu(0);
        CommonMenuMes1.stay_frame = 1;
        DrawMenuClsMes(&CommonMenuMes1, 0xDC, 0xA0);
    }
    if (MiniMenu.state != 0) {
        MiniMenu.state_time++;
    } else {
        MiniMenu.state_time = 0;
    }
    setbilinear(1);
}

static void DrawEventItemBoard(int x, int y, int top, int bottom, int alpha, CTexture *texture) {
    int clip_y;
    int clip_v;
    int clip_height;

    if ((y < top - 0x27) || (bottom <= y)) {
        return;
    }
    int pos_x = x;
    clip_y = y;
    clip_v = 0;
    clip_height = 0x28;
    MenuTextureClip(clip_y, clip_v, clip_height, top, bottom);
    for (int i = 0; i < 5; i++) {
        DrawMenu2DSprite(texture, CRect_i_(pos_x, clip_y + 1, 0x28, clip_height), CRect_i_(0x116, clip_v, 0x28, clip_height), alpha);
        pos_x += 0x2A;
    }
}

int PlayerAllItemCheck(int item) {
    CDngStatusData *dungeon_status = SaveData->GetDngStatus();
    CStockItem     *stock = SaveData->GetStockItem();
    int             has_item = 0;

    if (dungeon_status->SearchItemIndexNo(item) >= 0) {
        has_item = 1;
    }
    if (stock->SearchItem(item) != 0) {
        has_item = 1;
    }
    return has_item;
}

s32 GetAddAttachItem(s32 item_no) {
    s32 result;

    result = 0;
    if ((item_no >= 0x5B) && (item_no < 0x5F)) {
        result = 1;
    }
    return result;
}

int TransWepNo(int weapon_no) {
    s32 item_no;

    item_no = weapon_no;
    if (item_no > 0) {
        if ((item_no > 0) && (item_no < 0x15)) {
            item_no += 0x100;
        } else if ((item_no >= 0x15) && (item_no < 0x21)) {
            item_no += 0x116;
        } else if ((item_no >= 0x21) && (item_no < 0x2E)) {
            item_no += 0x119;
        } else if ((item_no >= 0x2E) && (item_no < 0x3A)) {
            item_no += 0x11D;
        } else if ((item_no >= 0x3A) && (item_no < 0x46)) {
            item_no += 0x121;
        } else if ((item_no >= 0x46) && (item_no < 0x51)) {
            item_no += 0x125;
        }
    }
    return item_no;
}

int TransWepNoNewToOld(int weapon_no) {
    s32 item_no;

    item_no = weapon_no;
    printf("newitemno is %d\n", item_no);
    if (item_no >= 0x101) {
        if ((item_no >= 0x101) && (item_no < 0x116)) {
            item_no -= 0x100;
        } else if ((item_no >= 0x12B) && (item_no < 0x137)) {
            item_no -= 0x116;
        } else if ((item_no >= 0x13A) && (item_no < 0x147)) {
            item_no -= 0x119;
        } else if ((item_no >= 0x14B) && (item_no < 0x157)) {
            item_no -= 0x11D;
        } else if ((item_no >= 0x15B) && (item_no < 0x167)) {
            item_no -= 0x121;
        } else if ((item_no >= 0x16B) && (item_no < 0x176)) {
            item_no -= 0x125;
        }
    }
    printf("olditemno is %d\n", item_no);
    return item_no;
}
