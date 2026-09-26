#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 3062

#include "menu_save.hpp"

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
#ifdef NON_MATCHING // draft includes
#include "menu_draw.hpp"
#include "battle_globals.hpp"
#include <libvu0.h>
#endif

/** Texture block the event item selection menu's textures load into. */
extern s32 MiniEventTextureBlock;

/** State of the event item selection menu. */
extern MINI_MENU_INFO MiniMenu;

/** Textures of the save menu's three character sets, indexed by input mode. */
extern CTexture *SaveMenuMojiTextbl[4];

/** The texture that the save screen's file boards draw from. */
extern CTexture *SaveBoard;

/** Name of the pack entry that holds the menu messages. */
extern char allmenu_mes[];

/**
 * Closes the save screen's message window and restores the pad, and after a
 * load sets the stereo mode from the loaded configuration.
 */
void ExitSaveSelect();

/**
 * Checks the memory card before a save and picks the save menu's next step.
 *
 * @mangled SaveMenuKeySaveCheck__Fv
 * @address 0x221730
 * @size 0x168
 */
static int SaveMenuKeySaveCheck(void);

/**
 * Handles the save menu's prompt to confirm a save.
 *
 * @mangled SaveMenuKeySaveDecide__Fv
 * @address 0x2218A0
 * @size 0xE0
 */
static int SaveMenuKeySaveDecide(void);

/**
 * Steps the save menu while the game is written to the memory card.
 *
 * @mangled SaveMenuKeySave__Fv
 * @address 0x221980
 * @size 0x130
 */
static int SaveMenuKeySave(void);

/**
 * Waits for a button press once a save has finished.
 *
 * @mangled SaveMenuKeyEndSave__Fv
 * @address 0x221AB0
 * @size 0x74
 */
static int SaveMenuKeyEndSave(void);

/**
 * Steps the save menu while a save is read from the memory card.
 *
 * @mangled SaveMenuKeyLoad__Fv
 * @address 0x221C30
 * @size 0xDC
 */
static int SaveMenuKeyLoad(void);

/**
 * Waits for a button press while the save menu shows an alert.
 *
 * @mangled SaveMenuKeyArart__Fv
 * @address 0x221D10
 * @size 0x128
 */
static int SaveMenuKeyArart(void);

/**
 * Handles the save menu's prompt to create new save data.
 *
 * @mangled SaveMenuKeyNewDirSelect__Fv
 * @address 0x221E40
 * @size 0xC8
 */
static int SaveMenuKeyNewDirSelect(void);

/**
 * Steps the save menu while new save data is created on the memory card.
 *
 * @mangled SaveMenuKeyNewDir__Fv
 * @address 0x221F10
 * @size 0x108
 */
static int SaveMenuKeyNewDir(void);

/**
 * Handles the save menu's memory card format step.
 *
 * @mangled SaveMenuKeyFormat__Fv
 * @address 0x222020
 * @size 0x150
 */
static int SaveMenuKeyFormat(void);

/**
 * Waits for a button press when the save data is of a different version.
 *
 * @mangled SaveMenuKeyDifVersion__Fv
 * @address 0x2221F0
 * @size 0x5C
 */
static int SaveMenuKeyDifVersion(void);

/**
 * Steps the delete choice of the save menu.
 *
 * @mangled SaveMenuKeyDelete__Fv
 * @address 0x222250
 * @size 0xC
 */
static s32 SaveMenuKeyDelete(void);

/**
 * Steps the copy choice of the save menu.
 *
 * @mangled SaveMenuKeyCopy__Fv
 * @address 0x222260
 * @size 0xC
 */
static s32 SaveMenuKeyCopy(void);

/**
 * Handles key input on the save menu offered after the ending.
 *
 * @mangled SaveMenuKeyAfterEnding__Fv
 * @address 0x222270
 * @size 0x7C
 */
static int SaveMenuKeyAfterEnding(void);

/**
 * Handles the prompt to confirm a save after the ending.
 *
 * @mangled SaveMenuKeySaveDecideEnding__Fv
 * @address 0x2222F0
 * @size 0x7C
 */
static int SaveMenuKeySaveDecideEnding(void);

/**
 * Steps the save menu while saving after the ending.
 *
 * @mangled SaveMenuKeySaveEnding__Fv
 * @address 0x222370
 * @size 0x3C
 */
static int SaveMenuKeySaveEnding(void);

/**
 * Waits for a button press once the save after the ending has finished.
 *
 * @mangled SaveMenuKeyEndSaveEnding__Fv
 * @address 0x2223B0
 * @size 0x58
 */
static int SaveMenuKeyEndSaveEnding(void);

/**
 * Computes the save board's alpha ramp at a position and at that position
 * offset by the second argument.
 *
 * @mangled GetSaveBoardAlphaInfo__FiiRiRii
 * @address 0x222940
 * @size 0x154
 */
static void GetSaveBoardAlphaInfo(int x, int width, int &start_alpha, int &end_alpha, int alpha);

/**
 * Frees the event item selection menu's textures and releases the pad.
 *
 * @mangled EventItemSelectExit__Fv
 * @address 0x2240E0
 * @size 0x5C
 */
static void EventItemSelectExit(void);

/**
 * Draws one vertical section of the board the event and fishing menus share.
 *
 * @mangled DrawEventAndFishMenuBoard_Ver__FP8CTexture8CRect_i_iiii
 * @address 0x224910
 * @size 0x148
 */
static void DrawEventAndFishMenuBoard_Ver(CTexture *, CRect_i_, int, int, int, int);

/**
 * Draws a section of the event item board, clipped to a range.
 *
 * @mangled DrawEventItemBoard__FiiiiiP8CTexture
 * @address 0x225420
 * @size 0x10C
 */
static void DrawEventItemBoard(int, int, int, int, int, CTexture *);

/**
 * Handles the save menu's prompt to confirm a load.
 *
 * @mangled SaveMenuKeyLoadDecide__Fv
 * @address 0x221B30
 * @size 0x100
 */
static int SaveMenuKeyLoadDecide(void);

/**
 * Steps the save menu when the memory card is not formatted.
 *
 * @mangled SaveMenuKeyUnFormat__Fv
 * @address 0x222170
 * @size 0x78
 */
static int SaveMenuKeyUnFormat(void);

/**
 * Handles pad input for the event item selection menu.
 *
 * @mangled EventItemSelectKey__FPi
 * @address 0x224260
 * @size 0x6A4
 */
static int EventItemSelectKey(int *);

/**
 * Draws the event item selection menu.
 *
 * @mangled EventItemSelectDraw__Fv
 * @address 0x224D50
 * @size 0x6C4
 */
static void EventItemSelectDraw(void);

/**
 * Draws the board the event and fishing menus share.
 *
 * @mangled DrawEventAndFishMenuBoard__FP8CTextureiiii
 * @address 0x224A60
 * @size 0x2E8
 */
static void DrawEventAndFishMenuBoard(CTexture *, int, int, int, int);

static int SaveMenuKeySaveCheck(void) {
    MC_CARD_INFO *card = &McAccess.card[McAccess.port];

    if (McCheckMCPs2(card) == 0) {
        SaveMenu.key_no = 0xE;
        SaveMenu.unk_20 = 1;
        return 1;
    }
    if ((card->result < 0) || (card->format_change != 0)) {
        SaveMenu.key_no = 0xE;
        SaveMenu.unk_20 = 6;
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

static int SaveMenuKeySaveDecide(void) {
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
        SaveMenu.unk_28 = 0;
        return 1;
    }
    return 1;
}

static int SaveMenuKeySave(void) {
    MC_CARD_INFO *card = &McAccess.card[McAccess.port];

    if (McCheckMCPs2(card) == 0) {
        SaveMenu.key_no = 0xE;
        SaveMenu.unk_20 = 1;
        return 1;
    }
    if (card->result < 0) {
        SaveMenu.key_no = 0xE;
        SaveMenu.unk_20 = 6;
        return 1;
    }
    if ((card->free_size < 0x50) && (McAccess.CheckFileNo(SaveMenu.file_no) == 0)) {
        SaveMenu.key_no = 0xE;
        SaveMenu.unk_20 = 0xB;
        return 1;
    }
    McAccess.SetFuncNo(5);
    McAccess.file_no = SaveMenu.file_no;
    SaveMenu.key_no = 0xB;
    return 1;
}

static int SaveMenuKeyEndSave(void) {
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
static int SaveMenuKeyLoadDecide(void) {
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

static int SaveMenuKeyLoad(void) {
    MC_CARD_INFO *card = &McAccess.card[McAccess.port];

    if (McCheckMCPs2(card) == 0) {
        SaveMenu.key_no = 0xE;
        SaveMenu.unk_20 = 1;
        return 1;
    }
    if (card->result < 0) {
        SaveMenu.key_no = 0xE;
        SaveMenu.unk_20 = 6;
        return 1;
    }
    McAccess.SetFuncNo(6);
    McAccess.file_no = SaveMenu.file_no;
    SaveMenu.key_no = 7;
    return 1;
}

static int SaveMenuKeyArart(void) {
    switch (SaveMenu.unk_20) {
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

static int SaveMenuKeyNewDirSelect(void) {
    if (GamePad.Down(0x40) != 0) {
        McAccess.SetFuncNo(0);
        SaveMenu.key_no = 0xF;
        ComMenuSePlay(1);
        return 1;
    }
    if (GamePad.Down(0x20) != 0) {
        SaveMenu.key_no = 3;
        SaveMenu.file_no = McAccess.port;
        SaveMenu.unk_28 = 0;
        ComMenuSePlay(2);
        return 1;
    }
    return 1;
}

static int SaveMenuKeyNewDir(void) {
    MC_CARD_INFO *card = &McAccess.card[McAccess.port];

    if (McCheckMCPs2(card) == 0) {
        SaveMenu.key_no = 0xE;
        SaveMenu.unk_20 = 1;
        return 1;
    }
    if ((card->result < 0) || (card->formatted == 0)) {
        SaveMenu.key_no = 0xE;
        SaveMenu.unk_20 = 6;
        return 1;
    }
    if (card->free_size < 0x190) {
        SaveMenu.key_no = 0xE;
        SaveMenu.unk_20 = 0xA;
        return 1;
    }
    McAccess.SetFuncNo(3);
    SaveMenu.key_no = 0xA;
}

static int SaveMenuKeyFormat(void) {
    MC_CARD_INFO *card = &McAccess.card[McAccess.port];

    if (McCheckMCPs2(card) == 0) {
        SaveMenu.key_no = 0xE;
        SaveMenu.unk_20 = 1;
        return 1;
    }
    if (card->result < 0) {
        SaveMenu.key_no = 0xE;
        SaveMenu.unk_20 = 6;
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
static int SaveMenuKeyUnFormat(void) {
    MC_CARD_INFO *card = &McAccess.card[McAccess.port];

    if (card->formatted != 0) {
        McAccess.SetFuncNo(0xA);
    } else {
        SaveMenu.key_no = 3;
        SaveMenu.file_no = McAccess.port;
    }
    return 1;
}

static int SaveMenuKeyDifVersion(void) {
    if (GamePad.Down(0xF0) != 0) {
        McAccess.SetFuncNo(7);
        int file_no = McAccess.file_no;
        McAccess.file_no = file_no;
    }
    return 1;
}

static s32 SaveMenuKeyDelete(void) {
    return 1;
}

static s32 SaveMenuKeyCopy(void) {
    return 1;
}

static int SaveMenuKeyAfterEnding(void) {
    if (GamePad.Down(0x40) != 0) {
        SaveMenu.key_no = 3;
    } else if (GamePad.Down(0x20) != 0) {
        SaveMenu.key_no = 1;
        ExitSaveSelect();
    }
    return 1;
}

static int SaveMenuKeySaveDecideEnding(void) {
    if (GamePad.Down(0x40) != 0) {
        SaveMenu.key_no = 0x17;
    } else if (GamePad.Down(0x20) != 0) {
        SaveMenu.key_no = 1;
        ExitSaveSelect();
    }
    return 1;
}

static int SaveMenuKeySaveEnding(void) {
    SaveMenu.key_no = 0x19;
    McAccess.SetFuncNo(0xE);
    return 1;
}

static int SaveMenuKeyEndSaveEnding(void) {
    if (GamePad.Down(0x40) != 0) {
        SaveMenu.key_no = 3;
        McAccess.SetFuncNo(1);
    }
    return 1;
}

int GetSaveMenuMsgNo(void) {
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
                    switch (SaveMenu.unk_20) {
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

int SaveMenuTextureEnter(void) {
    ReadBG();
    if (ReadBGSync() == 0) {
        LOADTEXTURE_INFO2 tex[3] = {{"#frame_image_save#640#448#4", 0, 0}, {NULL, 0, 0}, {NULL, 0, 0}};
        BG_READ_INFO *bg;
        u_int *pack;
        int i;

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
        switch (SaveMenu.unk_0) {
            case 2:
            case 0:
                InitMenuMesSet(0, (short *) GetPackFile((u_int *) bg->buffer, allmenu_mes, NULL));
                break;
        }
        CommonMenuMes2.stay_frame = 1;
        CommonMenuMes2.value_show = 1;
        CommonMenuMes2.value_signed = 0;
        CommonMenuMes2.cursor_lit = 1;

        char *save_buffer = (char *) pack + bg->size;
        MC_ICON_DATA icon = {{"dkicon.ico", NULL, 0}, {"dkicon_c.ico", NULL, 0}, {"dkicon_d.ico", NULL, 0}};
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

int SaveMenuEffectFadeOut(void) {
    if (SaveMenu.key_no == 1) {
        return 1;
    }
    return 0;
}

static void GetSaveBoardAlphaInfo(int x, int width, int &start_alpha, int &end_alpha, int alpha) {
    if (x < 0) {
        start_alpha = 0;
    } else if ((0 <= x) && (x < 0x81)) {
        start_alpha = (x * alpha) >> 7;
    } else if ((x > 0x80) && (x < 0x141)) {
        start_alpha = (alpha * 0x80) >> 7;
    } else if ((x > 0x140) && (x < 0x1C1)) {
        start_alpha = ((0x1C0 - x) * alpha) >> 7;
    } else {
        start_alpha = 0;
    }

    x += width;
    if (x < 0) {
        end_alpha = 0;
    } else if ((0 <= x) && (x < 0x81)) {
        end_alpha = (x * alpha) >> 7;
    } else if ((x > 0x80) && (x < 0x141)) {
        end_alpha = (alpha * 0x80) >> 7;
    } else if ((x > 0x140) && (x < 0x1C1)) {
        end_alpha = ((0x1C0 - x) * alpha) >> 7;
    } else {
        end_alpha = 0;
    }
}
#ifdef NON_MATCHING
static void DrawSaveBoardDigits(int number, int right, int y, int alpha_x, spRGBA *start, spRGBA *end,
                                CRect_i_ &digit) {
    int x = right;
    for (int count = GetNumberKeta(number); count > 0; count--) {
        int clip_y = y;
        int clip_v = digit.y;
        int clip_height = digit.height;
        x -= digit.width - 1;
        MenuTextureClip(clip_y, clip_v, clip_height, 0, 0x1C0);
        DrawMenu2DSprite(SaveBoard, CRect_i_(x, clip_y, digit.width, clip_height - 1),
                         CRect_i_(digit.x + digit.width * (number % 10), clip_v, digit.width, clip_height),
                         start, start, end, end);
        number /= 10;
    }
}

void DrawSaveBoard(SAVEDATA_INFO *info, CTexture **name_texture, int x, int y, int unused, int alpha) {
    // Row of each map's name on the board texture; a map from 14 on is in the second block.
    s16 map_name[62] = {0,  1,  2,  3,  6,  0,  0,  0,  0,  0,  0,  1,  1,  1,  9,  9,
                        9,  9,  9,  2,  2,  4,  10, 4,  13, 13, 13, 10, 9,  4,  4,  4,
                        4,  1,  10, 12, 10, 5,  13, 12, 13, 4,  10, 2,  2,  2,  13, 4,
                        13, 13, 13, 0,  0,  0,  0,  0,  0,  0,  0,  0,  14, 14};
    spRGBA start = {0x80, 0x80, 0x80, 0};
    spRGBA end = {0x80, 0x80, 0x80, 0};
    int start_alpha;
    int end_alpha;
    int time[3];
    int i;

    if (info == NULL) {
        return;
    }
    start.a = alpha;
    end.a = alpha;
    GetSaveBoardAlphaInfo(y, 0x88, start_alpha, end_alpha, alpha);
    start.a = start_alpha;
    end.a = end_alpha;
    DrawMenu2DSprite(SaveBoard, CRect_i_(x, y, 0x180, 0x87), CRect_i_(0, 0, 0x180, 0x87), &start, &start,
                     &end, &end);

    CRect_i_ digit(0x88, 0xCA, 0xC, 0x10);
    GetSaveBoardAlphaInfo(y, 0x10, start_alpha, end_alpha, alpha);
    start.a = start_alpha;
    end.a = end_alpha;
    DrawSaveBoardDigits(info->file_no, x + 0x54, y + 8, y, &start, &end, digit);

    GetSaveBoardAlphaInfo(y, 0x16, start_alpha, end_alpha, alpha);
    start.a = start_alpha;
    end.a = end_alpha;
    if (info->name != NULL) {
        DrawSaveBoardCharaName2(x + 0x22, y + 0x1C, (short *) info->name, name_texture, start, end);
    }

    // Play time, as hours, minutes and seconds.
    CRect_i_ time_digit(0x88, 0xB8, 0xC, 0x12);
    int column = x + 0x92;
    int time_x = column + 0xA;
    int time_y = y + 0x36;
    GetSaveBoardAlphaInfo(time_y, 0x12, start_alpha, end_alpha, alpha);
    start.a = start_alpha;
    end.a = end_alpha;
    int frames = (int) info->play_time;
    if (frames >= 0x01499700) {
        frames = 0x014996C4;
    }
    int seconds = frames / 60;
    time[0] = seconds / 3600;
    time[1] = (seconds / 60 - time[0] * 60) % 60;
    time[2] = seconds % 60;
    for (i = 2; i >= 0; i--) {
        int value = time[i];
        DrawMenu2DSprite(SaveBoard, CRect_i_(time_x, time_y, time_digit.width, time_digit.height),
                         CRect_i_(time_digit.x + time_digit.width * (value / 10), time_digit.y,
                                  time_digit.width, time_digit.height),
                         &start, &start, &end, &end);
        DrawMenu2DSprite(SaveBoard,
                         CRect_i_(time_x + time_digit.width, time_y, time_digit.width, time_digit.height),
                         CRect_i_(time_digit.x + time_digit.width * (value % 10), time_digit.y,
                                  time_digit.width, time_digit.height),
                         &start, &start, &end, &end);
        time_x -= 0x1E;
    }
    CRect_i_ colon(0x100, 0xB8, 0xC, 0x12);
    GetSaveBoardAlphaInfo(time_y, 0x12, start_alpha, end_alpha, alpha);
    start.a = start_alpha;
    end.a = end_alpha;
    DrawMenu2DSprite(SaveBoard, CRect_i_(column + 2, time_y, 0xC, 0x12), colon, &start, &start, &end, &end);
    DrawMenu2DSprite(SaveBoard, CRect_i_(column + 2 - 0x1E, time_y, 0xC, 0x12), colon, &start, &start, &end,
                     &end);

    GetSaveBoardAlphaInfo(y + 0x52, 0x12, start_alpha, end_alpha, alpha);
    start.a = start_alpha;
    end.a = end_alpha;
    DrawSaveBoardDigits(info->quest_total, x + 0x88, y + 0x52, y, &start, &end, digit);

    // Name of the map the save was made on.
    int map = map_name[info->map_no];
    int name_v;
    if (map < 14) {
        name_v = (map % 7) * 0x14 + 0xB8;
    } else {
        map -= 14;
        name_v = (map % 7) * 0x14 + 0x144;
    }
    int name_u = (map / 7) * 0x88;
    GetSaveBoardAlphaInfo(y + 0x63, 0x14, start_alpha, end_alpha, alpha);
    start.a = start_alpha;
    end.a = end_alpha;
    DrawMenu2DSprite(SaveBoard, CRect_i_(x + 0x23, y + 0x63, 0x88, 0x15), CRect_i_(name_u, name_v, 0x88, 0x14),
                     &start, &start, &end, &end);

    // A face for each member of the party, three to a row.
    int face_x = x + 0xCF;
    int face_y = y + 0x1A;
    GetSaveBoardAlphaInfo(face_y, 0x30, start_alpha, end_alpha, alpha);
    start.a = start_alpha;
    end.a = end_alpha;
    for (i = 0; i < info->party_size; i++) {
        DrawMenu2DSprite(SaveBoard, CRect_i_(face_x, face_y, 0x30, 0x31), CRect_i_(i * 0x30, 0x88, 0x30, 0x30),
                         &start, &start, &end, &end);
        face_x += 0x38;
        if (i == 2) {
            face_x = x + 0xCF;
            face_y += 0x34;
            GetSaveBoardAlphaInfo(face_y, 0x30, start_alpha, end_alpha, alpha);
            start.a = start_alpha;
            end.a = end_alpha;
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_save", DrawSaveBoard__FP13SAVEDATA_INFOPP8CTextureiiii);
#endif
void DrawNewFileTemplete(int x, int y, int alpha) {
    int start_alpha;
    int end_alpha;

    if (y % 2 != 0) {
        y++;
    }
    spRGBA start = {0x80, 0x80, 0x80, 0};
    start.a = alpha;
    spRGBA end = {0x80, 0x80, 0x80, 0};
    end.a = alpha;

    // Top edge: two corners and the run between them.
    GetSaveBoardAlphaInfo(y, 0x10, start_alpha, end_alpha, 0x80);
    start.a = start_alpha;
    end.a = end_alpha;
    set2DSprite(Vif1Packet, SaveBoard, CRect_i_(x, y, 0x10, 0xF), CRect_i_(0x120, 0x88, 0x10, 0x10), &start,
                &start, &end, &end, 1);
    set2DSprite(Vif1Packet, SaveBoard, CRect_i_(x + 0x170, y, 0x10, 0xF), CRect_i_(0x140, 0x88, 0x10, 0x10),
                &start, &start, &end, &end, 1);
    set2DSprite(Vif1Packet, SaveBoard, CRect_i_(x + 0x10, y, 0x160, 0xF), CRect_i_(0x130, 0x88, 0x10, 0x10),
                &start, &start, &end, &end, 1);

    // Bottom edge.
    GetSaveBoardAlphaInfo(y + 0x78, 0x10, start_alpha, end_alpha, 0x80);
    start.a = start_alpha;
    end.a = end_alpha;
    set2DSprite(Vif1Packet, SaveBoard, CRect_i_(x, y + 0x78, 0x10, 0xF), CRect_i_(0x120, 0xA8, 0x10, 0x10),
                &start, &start, &end, &end, 1);
    set2DSprite(Vif1Packet, SaveBoard, CRect_i_(x + 0x170, y + 0x78, 0x10, 0xF),
                CRect_i_(0x140, 0xA8, 0x10, 0x10), &start, &start, &end, &end, 1);
    set2DSprite(Vif1Packet, SaveBoard, CRect_i_(x + 0x10, y + 0x78, 0x160, 0xF),
                CRect_i_(0x130, 0xA8, 0x10, 0x10), &start, &start, &end, &end, 1);

    // Sides.
    GetSaveBoardAlphaInfo(y + 0x10, 0x68, start_alpha, end_alpha, 0x80);
    start.a = start_alpha;
    end.a = end_alpha;
    set2DSprite(Vif1Packet, SaveBoard, CRect_i_(x, y + 0xF, 0x10, 0x69), CRect_i_(0x120, 0x98, 0x10, 0x10),
                &start, &start, &end, &end, 1);
    set2DSprite(Vif1Packet, SaveBoard, CRect_i_(x + 0x170, y + 0xF, 0x10, 0x69),
                CRect_i_(0x140, 0x98, 0x10, 0x10), &start, &start, &end, &end, 1);

    // "New file".
    GetSaveBoardAlphaInfo(y + 0x35, 0x1E, start_alpha, end_alpha, 0x80);
    start.a = start_alpha;
    end.a = end_alpha;
    set2DSprite(GetVif1Packet(), SaveBoard, CRect_i_(x + 0x86, y + 0x35, 0x74, 0x1E),
                CRect_i_(0x10C, 0xB8, 0x74, 0x1E), &start, &start, &end, &end, 1);
}

int InitExistData(void) {
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
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3413);

int SaveEnableCheck(void) {
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
#ifdef NON_MATCHING
extern float EventBoardPos[2];
extern float EventBarY;
extern float MiniCur[2];
extern int EventItemMoveY;
extern ITEM_PACK *EventItemPackPt;
extern int MiniEventTexReadFlag;
extern CTexture *StayTex;
extern CTexture *MiniEventBoard;
extern CTexture *FishFoodBoard;
extern CTexture *ItemIcon;

void InitEventItemSelect(int block, int *usable, ITEM_PACK *pack, int x, int y, int vanish, int fish_mode) {
    s8 lang_y[8] = {0, 0, 0, 0, 0, 0, 0, 0};
    LOADTEXTURE_INFO2 texture[2] = {{"stayframe.img", 0, 0}, {NULL, 0, 0}};
    int i;

    GamePad.SetAutoRepeat(0xF000, 0x1E, 5);
    GamePad.MenuModeOn(0x78);
    StayTex = TexManager.GetTexture("stayframe", -1);
    MiniMenu.fish_mode = fish_mode;
    MiniEventTextureBlock = block;
    MiniMenu.lang = GetMenuLangFlag();
    EventBoardPos[0] = (float) x;
    EventBoardPos[1] = (float) y + (float) lang_y[MiniMenu.lang];
    EventItemPackPt = pack;
    MiniMenu.event_item_num = 0;
    for (i = 0; i < pack->num; i++) {
        if (pack->item[i] >= 0x84) {
            MiniMenu.event_item_num++;
        }
    }
    for (MiniMenu.usable_num = 0; MiniMenu.usable_num < 13;) {
        MiniMenu.usable[MiniMenu.usable_num] = usable[MiniMenu.usable_num];
        printf("itemno = %d\n", usable[MiniMenu.usable_num]);
        if (usable[MiniMenu.usable_num] < 0) {
            break;
        }
        MiniMenu.usable_num++;
    }
    MiniMenu.selected = -1;
    MiniMenu.vanish = vanish;
    if (MiniMenu.vanish != 0) {
        printf("vanish after use !\n");
    } else {
        printf("exist after use \n");
    }
    texture[0].block_no = MiniEventTextureBlock;
    TexManager.DeleteTextureBlock(MiniEventTextureBlock);
    TexManager.CleanUpTextureList();
    TexManager.LoadTextureBlockEX(-1, texture);
    StartReadBG();
    LoadFileBGMenuData("eventmnu2.pak", MenuCalcBufAlignment((u_long128 *) read_buffer));
    ReadBG();
    MiniMenu.cursor = 0;
    MiniMenu.scroll_row = 0;
    int row = MiniMenu.scroll_row;
    float top = EventBoardPos[1];
    EventItemMoveY = (int) ((56.0f + top) - (float) (row * 0x28));
    int rows = EventItemPackPt->num / 5;
    if (rows <= 0) {
        rows = 1;
    }
    EventBarY = 60.0f + top + (float) ((int) (68.0f * (float) row) / rows);
    MiniCur[0] = 6.0f + EventBoardPos[0] + (float) (((MiniMenu.cursor + 5) % 5) * 0x2A);
    MiniCur[1] = 60.0f + top + (float) (((MiniMenu.cursor - row * 5) / 5) * 0x28);
    MiniMenu.state = 2;
    MiniEventTexReadFlag = 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_save", InitEventItemSelect__FiPiP9ITEM_PACKiiii);
#endif
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3427);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3428);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3429);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3430);

static void EventItemSelectExit(void) {
    TexManager.DeleteTextureBlock(MiniEventTextureBlock);
    TexManager.CleanUpTextureList();
    GamePad.AutoRepeatOff();
    GamePad.MenuModeOff();
}

int EventItemSelectLoop(int *result) {
    int ret;
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
    ret = EventItemSelectKey(result);
    EventItemSelectDraw();
    setbilinear(1);
    if (ret != 0) {
        EventItemSelectExit();
    }
    return ret;
}
#ifdef NON_MATCHING
static int EventItemSelectKey(int *result) {
    LOADTEXTURE_INFO2 texture[4] = {};
    int done = 0;
    int i;
    s16 *slot;

    if (MiniEventTexReadFlag == 0) {
        if (ReadBGSync() != 0) {
            return 0;
        }
        BG_READ_INFO *file = GetReadBGFile(0);
        texture[0].block_no = MiniEventTextureBlock;
        texture[1].block_no = MiniEventTextureBlock;
        texture[2].block_no = MiniEventTextureBlock;
        texture[0].name = (char *) GetPackFile((u_int *) file->buffer, "eventmnu.img", NULL);
        texture[1].name = (char *) GetPackFile((u_int *) file->buffer, "fishmnu.img", NULL);
        TexManager.DeleteTextureBlock(MiniEventTextureBlock);
        TexManager.LoadTextureBlockEX(-1, texture);
        MiniEventBoard = TexManager.GetTexture("eventmnu", -1);
        FishFoodBoard = TexManager.GetTexture("fishmnu", -1);
        ItemIcon = TexManager.GetTexture("itemicon", -1);
        InitMenuMesSet(1, (short *) GetPackFile((u_int *) file->buffer, "eventuse.bin", NULL));
        CommonMenuMes2.MakeMesWin(0);
        CommonMenuMes2.Step();
        MiniEventTexReadFlag = 1;
    }
    int last = MiniMenu.cursor;
    int num = EventItemPackPt->num;
    switch (MiniMenu.state) {
        case 1:
            if (GamePad.Down(0x60) != 0) {
                MiniMenu.state = 0;
            }
            break;
        case 0: {
            if (GamePad.Down(0x1000) != 0 && MiniMenu.cursor >= 5) {
                MiniMenu.cursor -= 5;
            }
            if (GamePad.Down(0x4000) != 0 && MiniMenu.cursor < num - 5) {
                MiniMenu.cursor += 5;
            }
            if (GamePad.Down(0x8000) != 0 && MiniMenu.cursor > 0) {
                MiniMenu.cursor--;
            }
            if (GamePad.Down(0x2000) != 0 && MiniMenu.cursor < num - 1) {
                MiniMenu.cursor++;
            }
            if (MiniMenu.cursor < MiniMenu.scroll_row * 5) {
                MiniMenu.scroll_row--;
            }
            if ((MiniMenu.scroll_row + 2) * 5 - 1 < MiniMenu.cursor) {
                MiniMenu.scroll_row++;
            }
            if (last != MiniMenu.cursor) {
                ComMenuSePlay(0);
            }
            if (GamePad.Down(0x80) != 0) {
                SeitonItemBoard(EventItemPackPt);
                ComMenuSePlay(1);
                break;
            }
            if (GamePad.Down(0x40) != 0) {
                int index = -1;
                slot = NULL;
                if (MiniMenu.cursor < MiniMenu.event_item_num) {
                    int n = 0;
                    slot = EventItemPackPt->item;
                    for (index = 0; index < EventItemPackPt->num; index++, slot++) {
                        if (*slot >= 0x84) {
                            if (MiniMenu.cursor == n) {
                                *result = *slot;
                                break;
                            }
                            n++;
                        }
                    }
                }
                int accepted = 0;
                if (slot != NULL) {
                    for (i = 0; MiniMenu.usable[i] >= 0x84 && i < 13; i++) {
                        if (MiniMenu.usable[i] == *result) {
                            accepted = 1;
                            if (MiniMenu.vanish != 0 && index >= 0 && index < EventItemPackPt->num) {
                                EventItemPackPt->item[index] = 0;
                            }
                            break;
                        }
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
    }
    slot = NULL;
    if (MiniMenu.cursor < MiniMenu.event_item_num) {
        int n = 0;
        s16 *item = EventItemPackPt->item;
        for (i = 0; i < EventItemPackPt->num; i++, item++) {
            if (*item >= 0x84) {
                if (MiniMenu.cursor == n) {
                    slot = item;
                    break;
                }
                n++;
            }
        }
    }
    int message = 0;
    if (slot != NULL) {
        message = *slot <= 0 ? 0 : *slot + 500;
    }
    if (CommonMenuMes2.mes_made != message) {
        CommonMenuMes2.MakeMesWin(message);
    }
    return done;
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_save", EventItemSelectKey__FPi);
#endif
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3548);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3549);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3550);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3551);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3552);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3553);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3554);

static void DrawEventAndFishMenuBoard_Ver(CTexture *texture, CRect_i_ rect, int u, int width, int unused, int alpha) {
    int y = rect.y;

    DrawMenu2DSprite(texture, CRect_i_(rect.x, y, rect.width, 0x94), CRect_i_(u, 0, width, 0x94), alpha);
    y += 0x94;
    DrawMenu2DSprite(texture, CRect_i_(rect.x, y, rect.width, rect.height + 0x32), CRect_i_(u, 0x94, width, 0x14), alpha);
    y += rect.height + 0x32;
    DrawMenu2DSprite(texture, CRect_i_(rect.x, y, rect.width, 0x1E), CRect_i_(u, 0xC6, width, 0x1E), alpha);
}
#ifdef NON_MATCHING
extern s16 EventBoardHeight[2];
extern s16 EventBoardEdge[2];

static void DrawEventAndFishMenuBoard(CTexture *texture, int x, int y, int alpha, int lang) {
    int height = EventBoardHeight[lang];
    int edge = EventBoardEdge[lang] + 6;

    DrawEventAndFishMenuBoard_Ver(texture, CRect_i_(x + 0x1C, y, 0xD2, height), 0x1C, 0xD2, lang, alpha);
    DrawEventAndFishMenuBoard_Ver(texture, CRect_i_(x + 0x1C - edge, y, edge, height), 0x14, 6, lang, alpha);
    DrawEventAndFishMenuBoard_Ver(texture, CRect_i_(x + 8 - edge, y, 0x14, height), 0, 0x14, lang, alpha);
    DrawEventAndFishMenuBoard_Ver(texture, CRect_i_(x + 0xEE, y, edge, height), 0xEC, 6, lang, alpha);
    DrawEventAndFishMenuBoard_Ver(texture, CRect_i_(x + 0xEE + edge, y, 0x20, height), 0xF4, 0x20, lang, alpha);
    int rows = EventItemPackPt->num / 5;
    if (rows <= 0) {
        rows = 1;
    }
    float bar = 136.0f / (float) rows;
    if (bar > 68.0f) {
        bar = 68.0f;
    }
    EventBarY += ((float) (int) ((float) (y + 0x3C) + (68.0f * (float) MiniMenu.scroll_row) / (float) rows) -
                  EventBarY) / 4.0f;
    DrawMenu2DSprite(texture, CRect_i_(x + 0xF6 + edge, (int) EventBarY, 8, (int) bar), CRect_i_(0, 0xE4, 8, 0xC),
                     alpha);
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_save", DrawEventAndFishMenuBoard__FP8CTextureiiii);
#endif
#ifdef NON_MATCHING
static void EventItemSelectDraw(void) {
    s16 items[100];
    s8 message_pos[2][2] = {{0, 0}, {0, 0}};
    int alpha;
    int i;

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
    float left = EventBoardPos[0];
    float top = EventBoardPos[1];
    int clip_bottom_y = (int) top;
    CTexture *board = MiniMenu.fish_mode != 0 ? FishFoodBoard : MiniEventBoard;
    int clip_top = (int) (56.0f + top);
    int clip_bottom = (int) (136.0f + top);
    int icon_x = (int) (32.0f + left);
    int board_x = (int) (28.0f + left);
    int target = (int) ((56.0f + top) - (float) (MiniMenu.scroll_row * 0x28));
    EventItemMoveY += (target - EventItemMoveY) >> 2;
    if (abs(EventItemMoveY - target) < 4) {
        EventItemMoveY = target;
    }
    int row_y = EventItemMoveY;
    for (i = 0; i < EventItemPackPt->num / 5; i++) {
        DrawEventItemBoard(board_x, row_y, clip_top, clip_bottom, alpha, board);
        row_y += 0x28;
    }
    memset(items, 0, sizeof(items));
    int count = 0;
    for (i = 0; i < EventItemPackPt->num; i++) {
        if (EventItemPackPt->item[i] >= 0x84) {
            items[count++] = EventItemPackPt->item[i];
        }
    }
    row_y = EventItemMoveY;
    for (i = 0; i < 100 && clip_bottom >= clip_bottom_y; i++) {
        clip_bottom_y = row_y + 4;
        DrawIconParts(items[i], icon_x, clip_bottom_y, clip_top, clip_bottom, alpha, 0);
        icon_x += 0x2A;
        if (i % 5 == 4) {
            icon_x = (int) (32.0f + left);
            row_y += 0x28;
        }
    }
    DrawEventAndFishMenuBoard(board, (int) left, (int) top, alpha, MiniMenu.lang);
    int cursor = MiniMenu.cursor;
    int cursor_x = (int) (6.0f + left + (float) (((cursor + 5) % 5) * 0x2A));
    int cursor_y = (int) (60.0f + top + (float) (((cursor - MiniMenu.scroll_row * 5) / 5) * 0x28));
    DrawMenuWaku((float) (cursor_x + 0x10), (float) (cursor_y - 9), 0x24, 0x24, 0, StayTex, alpha);
    MiniCur[0] += ((float) cursor_x - MiniCur[0]) / 4.0f;
    MiniCur[1] += ((float) cursor_y - MiniCur[1]) / 4.0f;
    DrawMenuObjectVibe((int) MiniCur[0], (int) MiniCur[1], 1, 0x40);
    CursorVibeCnt++;
    if (CursorVibeCnt >= 0x405F7E00) {
        CursorVibeCnt = 0;
    }
    CommonMenuMes2.edge_alpha = alpha;
    DrawMenuClsMes(&CommonMenuMes2, (int) (20.0f + left + (float) message_pos[MiniMenu.lang][0]),
                   (int) (146.0f + top + (float) message_pos[MiniMenu.lang][1]));
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
#else
INCLUDE_ASM("asm/nonmatchings/menu_save", EventItemSelectDraw__Fv);
#endif

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
        DrawMenu2DSprite(texture, CRect_i_(pos_x, clip_y + 1, 0x28, clip_height), CRect_i_(0x116, clip_v, 0x28, clip_height),
                         alpha);
        pos_x += 0x2A;
    }
}

int PlayerAllItemCheck(int item) {
    CDngStatusData *dungeon_status = SaveData->GetDngStatus();
    CStockItem *stock = SaveData->GetStockItem();
    int has_item = 0;

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
