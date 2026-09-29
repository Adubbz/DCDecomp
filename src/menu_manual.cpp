#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000

#include "menu_manual.hpp"

#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "clsmes.hpp"
#include "dataread.hpp"
#include "dngstatusdata.hpp"
#include "eastking.hpp"
#include "gamepad.hpp"
#include "memcard.hpp"
#include "menu_draw.hpp"
#include "mglib.hpp"
#include "savedata.hpp"
#include "snd.hpp"
#include "texture.hpp"

#include "rect.hpp"
s8 ManualTgaNum[24] = {2, 6, 4, 1, 2, 0, 1, 5, 3, 3, 3, 0, 3, 4, 3, 1, 0, 0, 2, 1, 5, 0, 0, 0};

MANUAL_MENU_STATE ManualMenu;

CTexture *ManualMenuTex[6];

/**
 * Returns the texture page for the selected manual category and entry.
 */
int GetNowManualPartTgaNum(void) {
    return *(ManualMenu.entry + (ManualTgaNum + (ManualMenu.category * 6)));
}

/**
 * Reports whether the party has the item that unlocks the manual.
 */
int GetGameFlagForManualMenu() {
    CDngStatusData *status = SaveData->GetDngStatus();
    if (status == NULL) {
        return 1;
    }
    int result = 0;
    if (status->SearchItemIndexNo(0xFD) >= 0) {
        result++;
    }
    return result;
}
/**
 * Begins loading the image resources for the current manual page.
 *
 * @mangled ManualImgLoad__Fv
 * @address 0x002335D0
 * @size 0x1A8
 */
static s16 ManualImgLoad() {
    char path[76];
    int size;

    if (ReadBGSync() != 0 || ManualMenu.images_ready != 0) {
        BreakReadBG();
    }
    GetPathReadDifferntLang(path);
    strcat(path, "manual/m%d.pac");
    int image_no = ManualMenu.entry + (ManualMenu.category + 1) * 10;
    sprintf(path, path, image_no);
    u_long128 *buffer = ManualMenu.load_buffer;
    buffer = MenuCalcBufAlignment(buffer);
    StartReadBG();
    LoadFileBG(path, buffer, &size);
    buffer += size / 16 + 1;
    buffer = MenuCalcBufAlignment(buffer);
    if ((u32) (image_no - 11) <= 1 || (u32) (image_no - 21) <= 1 || image_no == 31 ||
        image_no == 42) {
        GetPathReadDifferntLang(path);
        strcat(path, "manual/m%db.pac");
        sprintf(path, path, image_no);
        LoadFileBG(path, buffer, &size);
    }
    ReadBG();
    ManualMenu.image_offset = 0;
    ManualMenu.unk_20 = 0;
    ManualMenu.images_ready = 0;
    return ManualMenu.images_ready;
}

s16 ManualImgEnter() {
    if (ManualMenu.images_ready == 0 && ReadBGSync() == 0) {
        LOADTEXTURE_INFO2 image_table[] = {
            {manual_frame_image, 0, 0},
            {NULL, 0, 0},
            {NULL, 0, 0},
        };
        image_table[0].block_no = ManualMenu.image_texture_block;
        image_table[1].block_no = ManualMenu.image_texture_block;
        BG_READ_INFO *primary = GetReadBGFile(0);
        char pack_name[32] = "%d_%d.img";
        sprintf(pack_name, pack_name, ManualMenu.category + 1, ManualMenu.entry + 1);
        image_table[1].name = (char *) GetPackFile((u_int *) primary->buffer, pack_name, NULL);
        TexManager.DeleteTextureBlock(ManualMenu.image_texture_block);
        TexManager.CleanUpTextureList();
        TexManager.LoadTextureBlockEX(-1, image_table);

        BG_READ_INFO *extra = GetReadBGFile(1);
        if (extra != NULL) {
            LOADTEXTURE_INFO2 extra_table[] = {
                {"#frame_image1#640#448#4", 0, 0},
                {NULL, 0, 0},
                {NULL, 0, 0},
            };
            extra_table[0].block_no = ManualMenu.extra_texture_block;
            extra_table[1].block_no = ManualMenu.extra_texture_block;
            char extra_name[32] = "%d_%db.img";
            sprintf(extra_name, extra_name, ManualMenu.category + 1, ManualMenu.entry + 1);
            extra_table[1].name = (char *) GetPackFile((u_int *) extra->buffer, extra_name, NULL);
            TexManager.DeleteTextureBlock(ManualMenu.extra_texture_block);
            TexManager.CleanUpTextureList();
            TexManager.LoadTextureBlockEX(-1, extra_table);
        }

        int image_count = GetNowManualPartTgaNum();
        for (int image = 0; image < image_count; image++) {
            char *prefix[] = {"a_", "b_", "c_", "d_"};
            char texture_name[32];
            strcpy(texture_name, prefix[ManualMenu.category]);
            strcat(texture_name, "%d_%d");
            sprintf(texture_name, texture_name, ManualMenu.entry + 1, image + 1);
            ManualMenuTex[image] = TexManager.GetTexture(texture_name, -1);
        }
        ManualMenu.message_page = 0;
        ManualMenu.image_page = 0;
        ManualMenu.images_ready = 1;
    }
    return ManualMenu.images_ready;
}
void DrawPrevNextCursor() {
    CTexture *texture = TexManager.GetTexture("mncursor", -1);
    if (texture == NULL) {
        return;
    }
    CRect_i_ texel(0x40, 0, 0x20, 0x20);
    int x[] = {0x40, 0x222};
    int image_count = GetNowManualPartTgaNum();
    for (int cursor = 0; cursor < 2; cursor++, texel.y += 0x20) {
        if (cursor == 0 && ManualMenu.image_page == 0) {
            continue;
        }
        if (cursor == 1 && ManualMenu.image_page == image_count - 1) {
            return;
        }
        CRect_i_ screen(x[cursor], 0x106, texel.width, texel.height);
        DrawMenu2DSprite(texture, screen, texel, 0x80);
    }
}
void DrawManualMsg() {
    if (ManualMenu.messages_ready == 0) {
        return;
    }
    MenuTextureReload(CommonMenuMes3.tex_block);
    ManualMsg->text_x = 0x86;
    ManualMsg->text_y = 0x46;
    ClsMes *window = ManualMsg;
    if (ManualMenu.selection_level < 0) {
        if (ManualMenu.selection_level == -1) {
            window->edge_alpha = 0x50;
        } else {
            window->edge_alpha = 0x80;
        }
        ManualMsg->Step();
        ManualMsg->DrawMesWin();
    }
    int message_no = 0;
    if (ManualMenu.selection_level == -1) {
        CommonMenuMes3.auto_pos = -1;
        message_no = ManualMenu.category * 1000 + 1000;
        CommonMenuMes3.stay_frame = 1;
        CommonMenuMes3.text_x = 0x86;
        CommonMenuMes3.text_y = 0xEE;
    }
    if (ManualMenu.mode == 4) {
        CommonMenuMes3.stay_frame = 1;
        CommonMenuMes3.auto_pos = 8;
        message_no = ManualMenu.category * 1000 + 1100 + (ManualMenu.entry + 1) * 10 +
                     ManualMenu.message_page;
        CommonMenuMes3.text_x = 0x78;
        CommonMenuMes3.text_y = 0x158;
    }
    if (CommonMenuMes3.mes_made != message_no) {
        CommonMenuMes3.MakeMesWin(message_no);
    }
    if (message_no <= 0) {
        CommonMenuMes3.stay_frame = 0;
    }
    CommonMenuMes3.Step();
    CommonMenuMes3.DrawMesWin();
}
void InitMenuManual(int *texture_blocks, u_long128 *load_buffer) {
    ManualMenu.load_buffer = load_buffer;
    ManualMenu.load_buffer = MenuCalcBufAlignment(ManualMenu.load_buffer);
    u_long128 *buffer = ManualMenu.load_buffer;
    StartReadBG();
    LoadFileBGMenuData("manual/mndata.pak", buffer);
    ReadBG();
    ManualMenu.messages_ready = 0;
    ManualMenu.images_ready = 0;
    ManualMenu.common_texture_block = texture_blocks[0];
    ManualMenu.image_texture_block = texture_blocks[1];
    ManualMenu.extra_texture_block = texture_blocks[2];
    ManualMenu.mode = 0;
    ManualMenu.category = 0;
    ManualMenu.selection_level = -2;
    ManualMenu.entry = 0;
    ManualMenu.transition_frame = 0;
    ManualMsg = &EastKingMsgCls;
    ManualMsg->edge_alpha = 0;
    ManualMsg->unk_02C = 0x10;
    ManualMsg->unk_030 = 0x10;
    ManualMenu.common_message_buffer = CommonMenuMes3.buff;
    ManualMenu.menu_message_buffer = CommonMenuMes1.buff;
    ManualMenu.char_width = CommonMenuMes3.char_width;
}

/**
 * Empties a message window and puts its layout back to the defaults.
 */
static inline void ResetManualMessage(ClsMes *message) {
    message->text_columns = 0x46;
    message->text_rows = 10;
    message->text_len = 0;
    message->text_width = 0;
    message->text_height = 0;
    message->fade = 0.0f;
    message->fade_in = 1;
    message->text_rate = message->text_rate_set;
    message->waiting = 0;
    message->text_at = 0.0f;
    message->text_no = 0;
    message->text_from = 0;
    message->page_from = 0;
    message->InitMesWinTbl();
    message->clut_now = message->clut_default;
    message->wait = 0;
    message->blink = 0;
    message->auto_page_wait = 0;
    message->mes_made = -1;
    message->edge_alpha = 0x80;
    for (int slot = 0; slot < 10; slot++) {
        message->mes_no[slot] = -1;
    }
    for (int value = 0; value < 8; value++) {
        message->values[value] = 0;
    }
    message->value = 0;
    message->value_signed = 0;
    message->value_show = 1;
    message->value_narrow = 0;
    message->space_width = -1;
    message->space_area = -1;
    message->cursor_row = -1;
    message->cursor_y = 0;
    message->cursor_lit = 0;
    for (int line = 0; line < 10; line++) {
        message->line_pos[line].x = -1;
        message->line_pos[line].y = -1;
    }
}

int SetManualMsgBuffer() {
    if (ManualMenu.messages_ready == 0 && ReadBGSync() == 0) {
        BG_READ_INFO *archive = GetReadBGFile(0);
        LOADTEXTURE_INFO2 font_table[] = {
            {manual_frame_image, 0, 0},
            {NULL, 0, 0},
            {NULL, 0, 0},
        };
        font_table[0].block_no = ManualMenu.common_texture_block;
        font_table[1].block_no = ManualMenu.common_texture_block;
        char font_name[32] = "mncursor.img";
        font_table[1].name = (char *) GetPackFile((u_int *) archive->buffer, font_name, NULL);
        TexManager.DeleteTextureBlock(ManualMenu.common_texture_block);
        TexManager.CleanUpTextureList();
        TexManager.LoadTextureBlockEX(-1, font_table);
        ManualMenu.load_buffer = archive->buffer + (archive->size >> 4) + 1;

        ResetManualMessage(ManualMsg);
        ManualMsg->Preset(4);
        ManualMsg->char_width = GetMenuCommonFontW(GetMenuLangFlag(), -1);
        ManualMsg->char_height = 0x16;
        ManualMsg->tex_block = 0x1A;
        ManualMsg->unk_17B0 = CommonMenuMes1.unk_17B0;
        for (int slot = 0; slot < 10; slot++) {
            ClsMes *window = ManualMsg;
            window->mes_no[slot] = -1;
        }
        s16 *messages = (s16 *) GetPackFile((u_int *) archive->buffer, "manual.bin", NULL);
        ManualMsg->SetBuff(messages);
        ManualMsg->mes_made = -1;
        ManualMsg->stay_frame = 1;
        ManualMsg->MakeMesWin(100);

        ResetManualMessage(&CommonMenuMes3);
        CommonMenuMes3.Preset(4);
        CommonMenuMes3.centre_rows = 0;
        CommonMenuMes3.SetBuff(messages);
        CommonMenuMes3.rows = 3;
        CommonMenuMes3.char_width = ManualMsg->char_width;
        for (int slot = 0; slot < 10; slot++) {
            CommonMenuMes3.mes_no[slot] = -1;
        }
        ManualMenu.messages_ready = 1;
    }
    return ManualMenu.messages_ready;
}
void ExitManualMenu() {
    int texture_blocks[] = {ManualMenu.common_texture_block, ManualMenu.image_texture_block,
                            ManualMenu.extra_texture_block, -1};
    MenuTextureDelete(texture_blocks);
    CommonMenuMes3.centre_rows = 1;
    CommonMenuMes3.cursor_row = -1;
    CommonMenuMes3.stay_frame = 0;
    ClsMes *msg = ManualMsg;
    msg->cursor_row = -1;
    ManualMsg->stay_frame = 0;
}
int GetNowManualMenuMode() {
    return ManualMenu.mode;
}

/**
 * Puts a message window's choice cursor on a line, or takes it away for a negative line.
 */
static inline void SetCursorRow(ClsMes *message, int row) {
    message->cursor_row = row;
}

int MenuManualKey() {
    ReadBG();
    int closed = 0;
    switch (ManualMenu.mode) {
        case 0:
            if (SetManualMsgBuffer() != 0) {
                ManualMenu.mode = 2;
            }
            break;
        case 1:
            ManualMenu.transition_frame++;
            if (ManualMenu.transition_frame > 32) {
                ExitManualMenu();
                closed = 1;
            }
            break;
        case 2: {
            int minimum;
            int maximum;
            int *selection;
            if (ManualMenu.selection_level == -2) {
                minimum = 0;
                maximum = 3;
                selection = &ManualMenu.category;
            }
            if (ManualMenu.selection_level == -1) {
                int entry_max[] = {4, 4, 3, 2};
                minimum = 0;
                maximum = entry_max[ManualMenu.category];
                selection = &ManualMenu.entry;
            }
            if (selection != NULL) {
                if (GamePad.Down(0x1000)) {
                    (*selection)--;
                    ComMenuSePlay(0);
                }
                if (GamePad.Down(0x4000)) {
                    (*selection)++;
                    ComMenuSePlay(0);
                }
                if (*selection < minimum) {
                    *selection = maximum;
                }
                if (*selection > maximum) {
                    *selection = minimum;
                }
                if (ManualMenu.selection_level == -2) {
                    SetCursorRow(ManualMsg, *selection);
                    CommonMenuMes3.cursor_row = -1;
                } else {
                    CommonMenuMes3.cursor_row = *selection;
                }
            } else {
                ManualMenu.selection_level = -2;
                ManualMenu.entry = 0;
            }
            if (GamePad.Down(0x40)) {
                if (ManualMenu.selection_level == -1) {
                    ManualMenu.selection_level++;
                    ManualMenu.mode = 3;
                    ManualMenu.message_page = 0;
                    ManualImgLoad();
                } else if (ManualMenu.selection_level == -2) {
                    ManualMenu.selection_level++;
                    CommonMenuMes3.cursor_row = 0;
                }
                ComMenuSePlay(1);
            } else if (GamePad.Down(0x20)) {
                if (ManualMenu.selection_level < -1) {
                    ManualMenu.mode = 1;
                    ManualMsg->Preset(1);
                    CommonMenuMes3.SetBuff(ManualMenu.common_message_buffer);
                    for (int slot = 0; slot < 10; slot++) {
                        CommonMenuMes3.mes_no[slot] = -1;
                    }
                    CommonMenuMes3.Preset(4);
                    CommonMenuMes3.char_width = ManualMenu.char_width;
                    ManualMsg->SetBuff(ManualMenu.menu_message_buffer);
                    ManualMsg->Preset(1);
                } else if (ManualMenu.selection_level == -1) {
                    ManualMenu.selection_level--;
                    *selection = 0;
                }
                ComMenuSePlay(2);
            }
            break;
        }
        case 4:
            CommonMenuMes3.cursor_row = -1;
            SetCursorRow(ManualMsg, -1);
            if (GamePad.Down(0x204A)) {
                if (CommonMenuMes3.State() == 5) {
                    CommonMenuMes3.GoNextPage();
                } else if (CommonMenuMes3.State() == 3) {
                    int image_count = GetNowManualPartTgaNum();
                    ManualMenu.image_page++;
                    ManualMenu.message_page++;
                    if ((ManualMenu.category == 0 && ManualMenu.entry == 4 &&
                         ManualMenu.message_page == 1) ||
                        (ManualMenu.category == 1 && ManualMenu.entry == 1 &&
                         ManualMenu.message_page == 5) ||
                        (ManualMenu.category == 2 && ManualMenu.entry == 3 &&
                         ManualMenu.message_page == 1)) {
                        ManualMenu.image_page--;
                    }
                    if (ManualMenu.image_page >= image_count) {
                        ManualMenu.mode = 2;
                        ManualMenu.selection_level = -1;
                    }
                }
                ComMenuSePlay(1);
            } else if (GamePad.Down(0x8085)) {
                if ((ManualMenu.category == 0 && ManualMenu.entry == 4 &&
                     ManualMenu.message_page == 1) ||
                    (ManualMenu.category == 1 && ManualMenu.entry == 1 &&
                     ManualMenu.message_page == 5) ||
                    (ManualMenu.category == 2 && ManualMenu.entry == 3 &&
                     ManualMenu.message_page == 1)) {
                    ManualMenu.message_page--;
                } else if (0 < ManualMenu.image_page) {
                    ManualMenu.message_page--;
                    ManualMenu.image_page--;
                }
                ComMenuSePlay(2);
            } else if (GamePad.Down(0x20)) {
                ManualMenu.selection_level = -1;
                ManualMenu.mode = 2;
                ComMenuSePlay(2);
            }
            break;
        case 3:
            CommonMenuMes3.cursor_row = -1;
            SetCursorRow(ManualMsg, -1);
            ManualMenu.transition_frame++;
            ManualImgEnter();
            if (ManualMenu.images_ready != 0 && ManualMenu.transition_frame > 32) {
                ManualMenu.mode = 5;
                ManualMenu.transition_frame = 0;
            }
            break;
        case 5:
            CommonMenuMes3.cursor_row = -1;
            SetCursorRow(ManualMsg, -1);
            ManualMenu.transition_frame++;
            if (ManualMenu.transition_frame > 32) {
                ManualMenu.mode = 4;
            }
            break;
    }
    return closed;
}

void MenuManualDraw() {
    if (ManualMenu.mode >= 3 && ManualMenu.mode < 6 && ManualMenu.images_ready != 0) {
        MenuTextureReload(ManualMenu.image_texture_block);
        int image_count = GetNowManualPartTgaNum();
        int target = -(ManualMenu.image_page * 0x280);
        float distance = target - ManualMenu.image_offset;
        ManualMenu.image_offset += (int) (distance / 4.0f);
        if (abs((int) distance) <= 3.0) {
            ManualMenu.image_offset = target;
        }
        int x = ManualMenu.image_offset;
        for (int image = 0; image < image_count; image++, x += 0x280) {
            if (image == 3) {
                MenuTextureReload(ManualMenu.extra_texture_block);
            }
            int source_x = 0;
            int screen_x = x;
            if (x > 0x280) {
                break;
            }
            int width = 0x280;
            MenuTextureClip(screen_x, source_x, width, 0, 0x280);
            if (width > 0x280) {
                width = 0x280;
            }
            if (width < 0) {
                width = 0;
            }
            CRect_i_ screen(screen_x, 0, width, 0x1C0);
            CRect_i_ texel(source_x, 0, width, 0x1C0);
            CTexture *texture = ManualMenuTex[image];
            if (texture != NULL) {
                set2DSprite(GetVif1Packet(), texture, screen, texel, 100, 100, 100, 0x80);
            } else {
                int previous = image - 1;
                while (ManualMenuTex[previous] == NULL) {
                    if (--previous <= 0) {
                        break;
                    }
                }
                if (previous >= 0) {
                    set2DSprite(GetVif1Packet(), texture, screen, texel, 0x50, 0x50, 0x50, 0x80);
                }
            }
        }
        MenuTextureReload(ManualMenu.common_texture_block);
        DrawPrevNextCursor();
    }
    if (ManualMenu.messages_ready != 0 && ManualMenu.mode != 1) {
        DrawManualMsg();
    }
}
