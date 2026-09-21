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

/** Texture block the event item selection menu's textures load into. */
extern s32 MiniEventTextureBlock;

/**
 * Closes the save screen's message window and restores the pad, and after a
 * load sets the stereo mode from the loaded configuration.
 */
void ExitSaveSelect();

int SaveMenuKeySaveCheck(void) {
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

int SaveMenuKeySaveDecide(void) {
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

int SaveMenuKeySave(void) {
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

int SaveMenuKeyEndSave(void) {
    if ((GamePad.Down(0x40) != 0) || (GamePad.Down(0x20) != 0)) {
        McAccess.SetFuncNo(1);
        SaveMenu.key_no = 7;
    }
    return 1;
}
INCLUDE_ASM("asm/nonmatchings/menu_save", SaveMenuKeyLoadDecide__Fv);

int SaveMenuKeyLoad(void) {
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

int SaveMenuKeyArart(void) {
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

int SaveMenuKeyNewDirSelect(void) {
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

int SaveMenuKeyNewDir(void) {
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

int SaveMenuKeyFormat(void) {
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
INCLUDE_ASM("asm/nonmatchings/menu_save", SaveMenuKeyUnFormat__Fv);

int SaveMenuKeyDifVersion(void) {
    if (GamePad.Down(0xF0) != 0) {
        McAccess.SetFuncNo(7);
        int file_no = McAccess.file_no;
        McAccess.file_no = file_no;
    }
    return 1;
}

s32 SaveMenuKeyDelete(void) {
    return 1;
}

s32 SaveMenuKeyCopy(void) {
    return 1;
}

int SaveMenuKeyAfterEnding(void) {
    if (GamePad.Down(0x40) != 0) {
        SaveMenu.key_no = 3;
    } else if (GamePad.Down(0x20) != 0) {
        SaveMenu.key_no = 1;
        ExitSaveSelect();
    }
    return 1;
}

int SaveMenuKeySaveDecideEnding(void) {
    if (GamePad.Down(0x40) != 0) {
        SaveMenu.key_no = 0x17;
    } else if (GamePad.Down(0x20) != 0) {
        SaveMenu.key_no = 1;
        ExitSaveSelect();
    }
    return 1;
}

int SaveMenuKeySaveEnding(void) {
    SaveMenu.key_no = 0x19;
    McAccess.SetFuncNo(0xE);
    return 1;
}

int SaveMenuKeyEndSaveEnding(void) {
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
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3066);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3068);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3069);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3070);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3080);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3081);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3082);
INCLUDE_ASM("asm/nonmatchings/menu_save", SaveMenuTextureEnter__Fv);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3094);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3095);
int SaveMenuEffectFadeOut(void) {
    if (SaveMenu.key_no == 1) {
        return 1;
    }
    return 0;
}

void GetSaveBoardAlphaInfo(int x, int width, int &start_alpha, int &end_alpha, int alpha) {
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
INCLUDE_ASM("asm/nonmatchings/menu_save", DrawSaveBoard__FP13SAVEDATA_INFOPP8CTextureiiii);
INCLUDE_ASM("asm/nonmatchings/menu_save", DrawNewFileTemplete__Fiii);

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
INCLUDE_ASM("asm/nonmatchings/menu_save", InitEventItemSelect__FiPiP9ITEM_PACKiiii);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3427);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3428);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3429);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3430);

void EventItemSelectExit(void) {
    TexManager.DeleteTextureBlock(MiniEventTextureBlock);
    TexManager.CleanUpTextureList();
    GamePad.AutoRepeatOff();
    GamePad.MenuModeOff();
}
INCLUDE_ASM("asm/nonmatchings/menu_save", EventItemSelectLoop__FPi);
INCLUDE_ASM("asm/nonmatchings/menu_save", EventItemSelectKey__FPi);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3548);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3549);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3550);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3551);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3552);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3553);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3554);
INCLUDE_ASM("asm/nonmatchings/menu_save", DrawEventAndFishMenuBoard_Ver__FP8CTexture8CRect_i_iiii);
INCLUDE_ASM("asm/nonmatchings/menu_save", DrawEventAndFishMenuBoard__FP8CTextureiiii);
INCLUDE_ASM("asm/nonmatchings/menu_save", EventItemSelectDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_save", DrawEventItemBoard__FiiiiiP8CTexture);

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
