#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000

#include "menu_manual.hpp"

#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "clsmes.hpp"
#include "dataread.hpp"
#include "eastking.hpp"
#include "gamepad.hpp"
#include "memcard.hpp"
#include "menu_draw.hpp"
#include "mglib.hpp"
#include "savedata.hpp"
#include "snd.hpp"
#include "texture.hpp"

#ifdef NON_MATCHING
s8 GetNowManualPartTgaNum() {
    return ManualTgaNum[ManualMenu.category * 6 + ManualMenu.entry];
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_manual", GetNowManualPartTgaNum__Fv);
#endif
#ifdef NON_MATCHING
int GetGameFlagForManualMenu() {
    CDngStatusData *status = SaveData->GetDngStatus();
    return status == NULL || status->SearchItemIndexNo(0xFD) >= 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_manual", GetGameFlagForManualMenu__Fv);
#endif
#ifdef NON_MATCHING
s16 ManualImgLoad() {
    char path[76];
    int size;

    if (ReadBGSync() != 0 || ManualMenu.images_ready != 0) {
        BreakReadBG();
    }
    GetPathReadDifferntLang(path);
    strcat(path, "manual/m%d.pac");
    int image_no = ManualMenu.entry + (ManualMenu.category + 1) * 10;
    sprintf(path, path, image_no);
    u_long128 *buffer = MenuCalcBufAlignment(ManualMenu.load_buffer);
    StartReadBG();
    LoadFileBG(path, buffer, &size);
    buffer = MenuCalcBufAlignment(buffer + (size / 16) + 1);
    if ((u32)(image_no - 11) < 2 || (u32)(image_no - 21) < 2 || image_no == 31 ||
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
#else
INCLUDE_ASM("asm/nonmatchings/menu_manual", ManualImgLoad__Fv);
#endif
INCLUDE_RODATA("asm/nonmatchings/menu_manual", @479__2);
INCLUDE_RODATA("asm/nonmatchings/menu_manual", @480__2);
INCLUDE_RODATA("asm/nonmatchings/menu_manual", @489__2);
INCLUDE_RODATA("asm/nonmatchings/menu_manual", @496__5);
INCLUDE_RODATA("asm/nonmatchings/menu_manual", @497__5);
INCLUDE_RODATA("asm/nonmatchings/menu_manual", @498__5);
INCLUDE_RODATA("asm/nonmatchings/menu_manual", @499__4);
#ifdef NON_MATCHING
s16 ManualImgEnter() {
    if (ManualMenu.images_ready == 0 && ReadBGSync() == 0) {
        BG_READ_INFO *primary = GetReadBGFile(0);
        char pack_name[32];
        sprintf(pack_name, "%d_%d.img", ManualMenu.category + 1, ManualMenu.entry + 1);
        LOADTEXTURE_INFO2 image_table[] = {
            {(char *)"#frame_image#640#448#4", ManualMenu.image_texture_block, 0},
            {(char *)GetPackFile((u_int *)primary->buffer, pack_name, NULL), ManualMenu.image_texture_block, 0},
            {NULL, 0, 0},
        };
        TexManager.DeleteTextureBlock(ManualMenu.image_texture_block);
        TexManager.CleanUpTextureList();
        TexManager.LoadTextureBlockEX(-1, image_table);

        BG_READ_INFO *extra = GetReadBGFile(1);
        if (extra != NULL) {
            sprintf(pack_name, "%d_%db.img", ManualMenu.category + 1, ManualMenu.entry + 1);
            LOADTEXTURE_INFO2 extra_table[] = {
                {(char *)"#frame_image1#640#448#4", ManualMenu.extra_texture_block, 0},
                {(char *)GetPackFile((u_int *)extra->buffer, pack_name, NULL), ManualMenu.extra_texture_block, 0},
                {NULL, 0, 0},
            };
            TexManager.DeleteTextureBlock(ManualMenu.extra_texture_block);
            TexManager.CleanUpTextureList();
            TexManager.LoadTextureBlockEX(-1, extra_table);
        }

        static char *prefix[] = {(char *)"a_", (char *)"b_", (char *)"c_", (char *)"d_"};
        int image_count = GetNowManualPartTgaNum();
        for (int image = 0; image < image_count; image++) {
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
#else
INCLUDE_ASM("asm/nonmatchings/menu_manual", ManualImgEnter__Fv);
#endif
INCLUDE_RODATA("asm/nonmatchings/menu_manual", @505__3);
#ifdef NON_MATCHING
void DrawPrevNextCursor() {
    CTexture *texture = TexManager.GetTexture((char *)"mncursor", -1);
    if (texture == NULL) {
        return;
    }
    CRect_i_ texel(0x40, 0, 0x20, 0x20);
    int image_count = GetNowManualPartTgaNum();
    int x[] = {0x10, 0x250};
    for (int cursor = 0; cursor < 2; cursor++) {
        if ((cursor == 0 && ManualMenu.image_page == 0) ||
            (cursor == 1 && ManualMenu.image_page == image_count - 1)) {
            texel.y += 0x20;
            continue;
        }
        CRect_i_ screen(x[cursor], 0x106, texel.width, texel.height);
        DrawMenu2DSprite(texture, screen, texel, 0x80);
        texel.y += 0x20;
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_manual", DrawPrevNextCursor__Fv);
#endif
INCLUDE_RODATA("asm/nonmatchings/menu_manual", @535);
#ifdef NON_MATCHING
void DrawManualMsg() {
    if (ManualMenu.messages_ready == 0) {
        return;
    }
    MenuTextureReload(CommonMenuMes3.tex_block);
    ManualMsg->text_x = 0x86;
    ManualMsg->text_y = 0x46;
    if (ManualMenu.selection_level < 0) {
        ManualMsg->edge_alpha = ManualMenu.selection_level == -1 ? 0x50 : 0x80;
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
        message_no = ManualMenu.message_page + ManualMenu.category * 1000 + 1100 +
                     (ManualMenu.entry + 1) * 10;
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
#else
INCLUDE_ASM("asm/nonmatchings/menu_manual", DrawManualMsg__Fv);
#endif
#ifdef NON_MATCHING
void InitMenuManual(int *texture_blocks, u_long128 *load_buffer) {
    ManualMenu.load_buffer = MenuCalcBufAlignment(load_buffer);
    StartReadBG();
    LoadFileBGMenuData((char *)"manual/mndata.pak", ManualMenu.load_buffer);
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
#else
INCLUDE_ASM("asm/nonmatchings/menu_manual", InitMenuManual__FPiP1);
#endif
INCLUDE_RODATA("asm/nonmatchings/menu_manual", @559__2);
#ifdef NON_MATCHING
static void ResetManualMessage(ClsMes *message) {
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
        message->line_pos[slot].x = -1;
        message->line_pos[slot].y = -1;
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
}

s16 SetManualMsgBuffer() {
    if (ManualMenu.messages_ready == 0 && ReadBGSync() == 0) {
        BG_READ_INFO *archive = GetReadBGFile(0);
        u_int *font = GetPackFile((u_int *)archive->buffer, (char *)"mncursor.img", NULL);
        LOADTEXTURE_INFO2 font_table[] = {
            {(char *)"#frame_image#640#448#4", ManualMenu.common_texture_block, 0},
            {(char *)font, ManualMenu.common_texture_block, 0},
            {NULL, 0, 0},
        };
        TexManager.DeleteTextureBlock(ManualMenu.common_texture_block);
        TexManager.CleanUpTextureList();
        TexManager.LoadTextureBlockEX(-1, font_table);
        ManualMenu.load_buffer = MenuCalcBufAlignment(archive->buffer + archive->size / 16 + 1);

        ResetManualMessage(ManualMsg);
        ManualMsg->Preset(4);
        ManualMsg->char_width = GetMenuCommonFontW(GetMenuLangFlag(), -1);
        ManualMsg->char_height = 0x16;
        ManualMsg->tex_block = 0x1A;
        ManualMsg->unk_17B0 = CommonMenuMes1.unk_17B0;
        s16 *messages = (s16 *)GetPackFile((u_int *)archive->buffer, (char *)"manual.bin", NULL);
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
        ManualMenu.messages_ready = 1;
    }
    return ManualMenu.messages_ready;
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_manual", SetManualMsgBuffer__Fv);
#endif
INCLUDE_RODATA("asm/nonmatchings/menu_manual", @606__5);
#ifdef NON_MATCHING
void ExitManualMenu() {
    int texture_blocks[] = {ManualMenu.common_texture_block, ManualMenu.image_texture_block,
                            ManualMenu.extra_texture_block, -1};
    MenuTextureDelete(texture_blocks);
    CommonMenuMes3.centre_rows = 1;
    CommonMenuMes3.cursor_row = -1;
    CommonMenuMes3.stay_frame = 0;
    ManualMsg->tex_block = -1;
    ManualMsg->fade = 0.0f;
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_manual", ExitManualMenu__Fv);
#endif
#ifdef NON_MATCHING
int GetNowManualMenuMode() {
    return ManualMenu.mode;
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_manual", GetNowManualMenuMode__Fv);
#endif
#ifdef NON_MATCHING
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
            if (++ManualMenu.transition_frame >= 33) {
                ExitManualMenu();
                closed = 1;
            }
            break;
        case 2: {
            int minimum = 0;
            int maximum = 0;
            int *selection = NULL;
            if (ManualMenu.selection_level == -2) {
                maximum = 3;
                selection = &ManualMenu.category;
            } else if (ManualMenu.selection_level == -1) {
                static int entry_max[] = {4, 4, 3, 2};
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
                if (*selection < minimum) *selection = maximum;
                if (*selection > maximum) *selection = minimum;
                if (ManualMenu.selection_level == -2) {
                    ManualMsg->cursor_row = *selection;
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
                    ManualMenu.selection_level = 0;
                    ManualMenu.mode = 3;
                    ManualMenu.message_page = 0;
                    ManualImgLoad();
                } else if (ManualMenu.selection_level == -2) {
                    ManualMenu.selection_level = -1;
                    CommonMenuMes3.cursor_row = 0;
                }
                ComMenuSePlay(1);
            } else if (GamePad.Down(0x20)) {
                if (ManualMenu.selection_level < -1) {
                    ManualMenu.mode = 1;
                    ManualMsg->Preset(1);
                    CommonMenuMes3.SetBuff(ManualMenu.common_message_buffer);
                    for (int slot = 0; slot < 10; slot++) CommonMenuMes3.mes_no[slot] = -1;
                    CommonMenuMes3.Preset(4);
                    CommonMenuMes3.char_width = ManualMenu.char_width;
                    ManualMsg->SetBuff(ManualMenu.menu_message_buffer);
                    ManualMsg->Preset(1);
                } else {
                    ManualMenu.selection_level = -2;
                    ManualMenu.entry = 0;
                }
                ComMenuSePlay(2);
            }
            break;
        }
        case 3:
            CommonMenuMes3.cursor_row = -1;
            ManualMsg->cursor_row = -1;
            ManualMenu.transition_frame++;
            ManualImgEnter();
            if (ManualMenu.images_ready && ManualMenu.transition_frame >= 33) {
                ManualMenu.mode = 5;
                ManualMenu.transition_frame = 0;
            }
            break;
        case 4:
            CommonMenuMes3.cursor_row = -1;
            ManualMsg->cursor_row = -1;
            if (GamePad.Down(0x204A)) {
                if (CommonMenuMes3.State() == 5) {
                    CommonMenuMes3.GoNextPage();
                } else if (CommonMenuMes3.State() == 3) {
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
                    if (ManualMenu.image_page >= GetNowManualPartTgaNum()) {
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
                } else if (ManualMenu.image_page > 0) {
                    ManualMenu.image_page--;
                    ManualMenu.message_page--;
                }
                ComMenuSePlay(2);
            } else if (GamePad.Down(0x20)) {
                ManualMenu.selection_level = -1;
                ManualMenu.mode = 2;
                ComMenuSePlay(2);
            }
            break;
        case 5:
            CommonMenuMes3.cursor_row = -1;
            ManualMsg->cursor_row = -1;
            if (++ManualMenu.transition_frame >= 33) ManualMenu.mode = 4;
            break;
    }
    return closed;
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_manual", MenuManualKey__Fv);
#endif
#ifdef NON_MATCHING
void MenuManualDraw() {
    if (ManualMenu.mode >= 3 && ManualMenu.mode < 6 && ManualMenu.images_ready != 0) {
        MenuTextureReload(ManualMenu.image_texture_block);
        int image_count = GetNowManualPartTgaNum();
        int target = -ManualMenu.image_page * 0x280;
        float distance = (float)(target - ManualMenu.image_offset);
        ManualMenu.image_offset += (int)(distance / 4.0f);
        int distance_int = (int) distance;
        if (distance_int >= -3 && distance_int <= 3) ManualMenu.image_offset = target;
        int x = ManualMenu.image_offset;
        for (int image = 0; image < image_count; image++, x += 0x280) {
            if (image == 3) MenuTextureReload(ManualMenu.extra_texture_block);
            if (x >= 0x281) continue;
            int source_x = 0;
            int width = 0x280;
            int screen_x = x;
            MenuTextureClip(screen_x, source_x, width, 0, 0x280);
            if (width > 0x280) width = 0x280;
            if (width < 0) width = 0;
            CRect_i_ screen(screen_x, 0, width, 0x1C0);
            CRect_i_ texel(source_x, 0, width, 0x1C0);
            CTexture *texture = ManualMenuTex[image];
            if (texture != NULL) {
                set2DSprite(GetVif1Packet(), texture, screen, texel, 0x64, 0x64, 0x64, 0x80);
            }
        }
        MenuTextureReload(ManualMenu.common_texture_block);
        DrawPrevNextCursor();
    }
    if (ManualMenu.messages_ready != 0 && ManualMenu.mode != 1) {
        DrawManualMsg();
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_manual", MenuManualDraw__Fv);
#endif
