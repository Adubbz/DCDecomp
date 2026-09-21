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
INCLUDE_ASM("asm/nonmatchings/menu_save", SaveMenuKeySaveEnding__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_save", SaveMenuKeyEndSaveEnding__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_save", GetSaveMenuMsgNo__Fv);
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
INCLUDE_ASM("asm/nonmatchings/menu_save", GetSaveBoardAlphaInfo__FiiRiRii);
INCLUDE_ASM("asm/nonmatchings/menu_save", DrawSaveBoard__FP13SAVEDATA_INFOPP8CTextureiiii);
INCLUDE_ASM("asm/nonmatchings/menu_save", DrawNewFileTemplete__Fiii);
INCLUDE_ASM("asm/nonmatchings/menu_save", InitExistData__Fv);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3336);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3413);
INCLUDE_ASM("asm/nonmatchings/menu_save", SaveEnableCheck__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_save", InitEventItemSelect__FiPiP9ITEM_PACKiiii);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3427);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3428);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3429);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3430);
INCLUDE_ASM("asm/nonmatchings/menu_save", EventItemSelectExit__Fv);
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
INCLUDE_ASM("asm/nonmatchings/menu_save", TransWepNoNewToOld__Fi);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3735);
INCLUDE_RODATA("asm/nonmatchings/menu_save", @3736);
