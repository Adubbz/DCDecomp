#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000

#include "eastking.hpp"

#include <cstdio>
#include <cstring>

#include "clsmes.hpp"
#include "dataread.hpp"
#include "gamepad.hpp"
#include "menu_draw.hpp"
#include "menu_inventory.hpp"
#include "savedata.hpp"
#include "snd.hpp"
#include "texture.hpp"

/**
 * Holds the East King event's loaded resources and transition state.
 */
struct EAST_KING_EVENT_STATE {
    s32 texture_block;       /**< Texture block used by the event picture. */
    char unk_04[6];
    s16 event_no;            /**< Selects the event picture, messages and unlock flag. */
    s16 resources_ready;     /**< Whether the picture and message resources are installed. */
    char unk_0E[2];
    u_long128 *load_buffer;  /**< Aligned buffer containing the event archive. */
    s16 mode;                /**< Current loading, message, or closing state. */
    char unk_16[2];
    s32 transition_frame;    /**< Frames elapsed in the current transition. */
};

STATIC_ASSERT(sizeof(EAST_KING_EVENT_STATE) == 0x1C);

/**
 * Holds the current East King message and its fade state.
 */
struct EAST_KING_MESSAGE_STATE {
    s16 message_no;     /**< Message currently selected for the event. */
    s16 unk_02;
    s16 draw_message;   /**< Whether the selected message may be laid out. */
    s16 unk_06;
    s16 unk_08;
    s16 alpha;          /**< Opacity of the current message window. */
};

STATIC_ASSERT(sizeof(EAST_KING_MESSAGE_STATE) == 0xC);

/** Stages of the East King event's opening, dialogue, and closing sequence. */
enum EAST_KING_EVENT_MODE {
    EAST_KING_LOADING,
    EAST_KING_CLOSING,
    EAST_KING_DIALOGUE,
    EAST_KING_MESSAGE_FADE_OUT,
    EAST_KING_MESSAGE_FADE_IN,
};

/** State of the active East King event. */
extern EAST_KING_EVENT_STATE EastKing;

/** Message selection and opacity state of the active East King event. */
extern EAST_KING_MESSAGE_STATE EastKingMsg;

/** Number of additional messages in each East King event. */
extern s8 EastKingMsgMax[12];

/** Background music number saved before the event. */
extern s16 PrevEastKingSndNo;

/** Buffer used to reload the background music that preceded the event. */
extern u_int *EastKingSndReadBuf;

INCLUDE_RODATA("asm/nonmatchings/eastking", @354__3);
#ifdef NON_MATCHING
/**
 * Restores the East King message window to its initial empty state.
 */
static void ResetEastKingMessage() {
    EastKingMsgCls.text_columns = 0x46;
    EastKingMsgCls.text_rows = 10;
    EastKingMsgCls.text_len = 0;
    EastKingMsgCls.text_width = 0;
    EastKingMsgCls.text_height = 0;
    EastKingMsgCls.fade = 0.0f;
    EastKingMsgCls.fade_in = 1;
    EastKingMsgCls.text_rate = EastKingMsgCls.text_rate_set;
    EastKingMsgCls.waiting = 0;
    EastKingMsgCls.text_at = 0.0f;
    EastKingMsgCls.text_no = 0;
    EastKingMsgCls.text_from = 0;
    EastKingMsgCls.page_from = 0;
    EastKingMsgCls.InitMesWinTbl();
    EastKingMsgCls.clut_now = EastKingMsgCls.clut_default;
    EastKingMsgCls.wait = 0;
    EastKingMsgCls.blink = 0;
    EastKingMsgCls.auto_page_wait = 0;
    EastKingMsgCls.mes_made = -1;
    EastKingMsgCls.edge_alpha = 0x80;
    for (int slot = 0; slot < 10; slot++) {
        EastKingMsgCls.mes_no[slot] = -1;
        EastKingMsgCls.line_pos[slot].x = -1;
        EastKingMsgCls.line_pos[slot].y = -1;
    }
    for (int value = 0; value < 8; value++) {
        EastKingMsgCls.values[value] = 0;
    }
    EastKingMsgCls.value = 0;
    EastKingMsgCls.value_signed = 0;
    EastKingMsgCls.value_show = 1;
    EastKingMsgCls.value_narrow = 0;
    EastKingMsgCls.space_width = -1;
    EastKingMsgCls.space_area = -1;
    EastKingMsgCls.cursor_row = -1;
    EastKingMsgCls.cursor_y = 0;
    EastKingMsgCls.cursor_lit = 0;
}

void EastKingTextureEnter() {
    if (EastKing.resources_ready != 0 || ReadBGSync() != 0 || SndBgmSyncBG() != 0) {
        return;
    }

    BG_READ_INFO *archive = GetReadBGFile(0);
    char image_name[64] = "st.img";
    sprintf(image_name, image_name, EastKing.event_no);
    LOADTEXTURE_INFO2 textures[] = {
        {(char *)"#frame_image#640#448#4", EastKing.texture_block, 0},
        {(char *)GetPackFile((u_int *)archive->buffer, image_name, NULL), EastKing.texture_block, 0},
        {NULL, 0, 0},
    };
    TexManager.DeleteTextureBlock(EastKing.texture_block);
    TexManager.CleanUpTextureList();
    TexManager.LoadTextureBlockEX(-1, textures);

    EastKingMsgCls.unk_17B0 = EastKing.load_buffer + archive->size / 16 + 1;
    s16 *messages = (s16 *)GetPackFile((u_int *)archive->buffer, (char *)"eastking.bin", NULL);
    ResetEastKingMessage();
    EastKingMsgCls.SetMesFukidashi(4);
    static s8 font_width[] = {16, 14, 14, 14, 14, 14, 14};
    EastKingMsgCls.char_width = font_width[GetMenuLangFlag()];
    EastKingMsgCls.char_height = 0x16;
    EastKingMsgCls.columns = 0x1E;
    EastKingMsgCls.text_rate = 0.0f;
    EastKingMsgCls.text_rate_set = 0.0f;
    EastKingMsgCls.centre_rows = 1;
    EastKingMsgCls.tex_block = 0x1A;
    EastKingMsgCls.SetBuff(messages);
    EastKingMsgCls.mes_made = -1;
    EastKingMsgCls.unk_02C = 0x10;
    EastKingMsgCls.unk_030 = 0x10;
    EastKingMsgCls.page_arrow = 1;
    EastKing.resources_ready = 1;
    EastKingMsg.draw_message = 1;
    SndBgmPlay(0);
}
#else
INCLUDE_ASM("asm/nonmatchings/eastking", EastKingTextureEnter__Fv);
#endif
INCLUDE_RODATA("asm/nonmatchings/eastking", @371__4);

/**
 * Draws the current East King event message.
 *
 * @mangled EastKingMsgDraw__Fv
 * @address 0x00232C60
 * @size 0x1A0
 */
static void EastKingMsgDraw() {
    if (EastKing.resources_ready != 0 && EastKingMsgCls.mes_made != EastKingMsg.message_no &&
        EastKingMsg.draw_message != 0) {
        EastKingMsgCls.MakeMesWin(EastKingMsg.message_no);
    }
    MenuTextureReload(EastKingMsgCls.tex_block);
    switch (EastKing.mode) {
        case EAST_KING_LOADING:
            if (EastKing.resources_ready == 0) {
                break;
            }
            // The window fades in once the loading has finished.
        case EAST_KING_DIALOGUE:
        case EAST_KING_MESSAGE_FADE_IN:
            EastKingMsg.alpha += 2;
            break;
        case EAST_KING_CLOSING:
        case EAST_KING_MESSAGE_FADE_OUT:
            EastKingMsg.alpha -= 2;
            break;
    }
    if (EastKingMsg.alpha < 0) {
        EastKingMsg.alpha = 0;
    }
    if (EastKingMsg.alpha > 0x80) {
        EastKingMsg.alpha = 0x80;
    }
    if (EastKing.resources_ready != 0) {
        int half_width = EastKingMsgCls.char_width >> 1;
        GetMenuCommonPutXY(&EastKingMsgCls, 0x14C - half_width);
        EastKingMsgCls.text_y = 0x132;
        EastKingMsgCls.edge_alpha = EastKingMsg.alpha;
        EastKingMsgCls.Step();
        EastKingMsgCls.DrawMesWin();
    }
}

void GetPrevEastKingSndVol() {
    PrevEastKingSndVol = SndGetBgmVol();
}
#ifdef NON_MATCHING
void InitEastKingEvent(int event_no, int *texture_block, void *load_buffer) {
    char path[76];
    int size;

    GetPathReadDifferntLang(path);
    strcat(path, "eastk/st%d.pak");
    sprintf(path, path, event_no + 1);
    EastKing.load_buffer = MenuCalcBufAlignment((u_long128 *)load_buffer);
    StartReadBG();
    LoadFileBG(path, EastKing.load_buffer, &size);
    ReadBG();
    EastKingSndReadBuf = (u_int *)MenuCalcBufAlignment(EastKing.load_buffer + size / 16 + 0x10);
    PrevEastKingSndNo = SndGetBgmNo();
    SndBgmLoadBG(0x16, EastKingSndReadBuf, &size);
    EastKing.resources_ready = 0;
    EastKing.texture_block = *texture_block;
    EastKing.event_no = event_no;
    EastKing.mode = EAST_KING_LOADING;
    EastKing.transition_frame = 0;
    EastKingMsg.message_no = EastKing.event_no * 100 + 100;
    EastKingMsg.unk_02 = 0;
    EastKingMsg.alpha = 0;
    EastKingMsg.draw_message = 0;
    if (SaveData->GetGameFlag(EastKing.event_no + 0xE6) == 0) {
        SaveData->SetGameFlag(EastKing.event_no + 0xE6, 1);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/eastking", InitEastKingEvent__FiPiP1);
#endif
INCLUDE_RODATA("asm/nonmatchings/eastking", @398__2);
int EastKingEventKey() {
    int finished = 0;
    int size;

    ReadBG();
    switch (EastKing.mode) {
        case EAST_KING_LOADING:
            EastKing.transition_frame++;
            EastKingTextureEnter();
            if (EastKing.transition_frame > 0x40 && EastKingMsg.alpha >= 0x80 &&
                EastKing.resources_ready != 0) {
                EastKing.mode = EAST_KING_DIALOGUE;
                EastKing.transition_frame = 0;
                EastKingMsg.draw_message = 1;
            }
            break;
        case EAST_KING_CLOSING:
            if (EastKing.transition_frame == 0x32) {
                SndBgmStop();
            }
            if (EastKing.transition_frame == 0x3A) {
                StartReadBG();
                SndBgmLoadBG(PrevEastKingSndNo, EastKingSndReadBuf, &size);
            }
            EastKing.transition_frame++;
            if (EastKing.transition_frame > 0x40 && SndBgmSyncBG() == 0) {
                finished = 1;
                SndBgmFadeIn(0x3C, PrevEastKingSndVol, 0);
                SndBgmPlay(0);
            }
            break;
        case EAST_KING_DIALOGUE:
            if (GamePad.Down(0x40) != 0 && EastKingMsgCls.State() == 3) {
                if (EastKingMsg.message_no + 1 >
                    EastKing.event_no * 100 + 100 + EastKingMsgMax[EastKing.event_no]) {
                    EastKing.mode = EAST_KING_CLOSING;
                    EastKing.transition_frame = 0;
                    SndBgmFadeOut(0x5A, 0);
                } else {
                    EastKing.mode = EAST_KING_MESSAGE_FADE_OUT;
                    EastKing.transition_frame = 0;
                    EastKingMsg.draw_message = 0;
                }
            } else if (GamePad.Down(0x20) != 0) {
                EastKing.transition_frame = 0;
                EastKing.mode = EAST_KING_CLOSING;
            }
            break;
        case EAST_KING_MESSAGE_FADE_OUT:
            EastKing.transition_frame++;
            if (EastKingMsg.alpha <= 0) {
                EastKing.mode = EAST_KING_MESSAGE_FADE_IN;
                EastKingMsg.alpha = 0;
                EastKingMsg.message_no++;
                EastKing.transition_frame = 0;
                EastKingMsg.draw_message = 1;
            }
            break;
        case EAST_KING_MESSAGE_FADE_IN:
            EastKing.transition_frame++;
            if (EastKingMsg.alpha >= 0x80) {
                EastKing.mode = EAST_KING_DIALOGUE;
                EastKing.transition_frame = 0;
            }
            break;
    }
    SndStep();
    return finished;
}
void EastKingEventDraw() {
    AllFadeForMenu(0x80);
    if (EastKing.resources_ready != 0) {
        MenuTextureReload(EastKing.texture_block);
        CTexture *picture = TexManager.GetTexture("st", EastKing.texture_block);
        if (EastKing.event_no == 2 && EastKingMsg.message_no == 0x12F) {
            picture = TexManager.GetTexture("st1", EastKing.texture_block);
        }
        DrawFullSizePicture(picture, 0, 0, 0x80);
        EastKingMsgDraw();
    }

    int fade = 0;
    switch (EastKing.mode) {
        case EAST_KING_LOADING:
            fade = 0x80 - EastKing.transition_frame * 2;
            break;
        case EAST_KING_CLOSING:
            fade = EastKing.transition_frame * 2;
            break;
        case EAST_KING_MESSAGE_FADE_OUT:
            if (EastKing.event_no == 2 && EastKingMsg.message_no == 0x12E) {
                fade = EastKing.transition_frame * 3;
            }
            break;
        case EAST_KING_MESSAGE_FADE_IN:
            if (EastKing.event_no == 2 && EastKingMsg.message_no == 0x12F) {
                fade = 0x80 - EastKing.transition_frame * 3;
            }
            break;
    }
    if (fade < 0) {
        fade = 0;
    }
    if (fade > 0x80) {
        fade = 0x80;
    }
    AllFadeForMenu(fade);
}
