#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 821

#include "clsmes.hpp"

#include <libpkt.h>

#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "character.hpp"
#include "editpartsinfo.hpp"
#include "gameutil.hpp"
#include "mglib.hpp"
#include "rect.hpp"
#include "savedata.hpp"
#include "snd.hpp"
#include "texture.hpp"

/**
 * One external character, in the table the Georama editor's parts data ends
 * with. The window indexes it with the character's negative code, so the
 * entries sit before the address the code names.
 */
struct EDIT_GAIJI {
    s16 width; /**< How wide the character draws, in font cells. */
    u8 unk_02[0x1E];
};

STATIC_ASSERT(sizeof(EDIT_GAIJI) == 0x20);

/* The Georama editor's parts data; the message window reads the table of
 * external characters that follows it. */
extern "C" u8 EditPartsData[0x6E28];

/* That table of external characters, at EditPartsData + 0x491C. The linker
 * script binds the name; retail's code carries a relocation against it. */
extern "C" EDIT_GAIJI EditGaijiTbl[];

/* The external-character code of every letter of each registered name. */
s16 NameRegistTbl[8][11];

/* Random tables the message window shakes its text with. */
float RandTbl[64];
float RandTbl2[64];

/* Every pass of the outline the message window draws behind its text. The
 * last entry's alpha ends the run. */
MES_FUCHI FuchiTbl_E[] = {
    {0, -2, 0, 0, 0, 128},
    {0, 2, 0, 0, 0, 128},
    {2, 0, 0, 0, 0, 128},
    {-2, 0, 0, 0, 0, 128},
    {0, 0, 0, 0, 0, -1},
};

/* The palette the message window's font draws out of. */
extern "C" u32 MesWinClut[256];

/* The register that names where the message window's depth buffer lives. */
extern "C" sceGsZbuf mgZBuffer;

/* The register that names which pixels the renderer is allowed to write. */
extern "C" sceGsTest mgPixelTest;

/* The register that names how the renderer blends what it draws. */
extern "C" sceGsAlpha mgAlpha;

/** What each of the eight words of a GaijiDataTbl entry says. */
enum {
    GAIJI_CODE,   /**< The external-character code the entry draws. */
    GAIJI_U,      /**< Distance of the character from the left of the texture. */
    GAIJI_V,      /**< Distance of the character from the top of the texture. */
    GAIJI_WIDTH,  /**< How wide the character is in the texture. */
    GAIJI_HEIGHT, /**< How tall the character is in the texture. */
    GAIJI_X_OFF,  /**< Extra distance the character draws to the right. */
    GAIJI_Y_OFF,  /**< Extra distance the character draws down. */
    GAIJI_CELLS,  /**< Font cells the character takes across. */
};

/**
 * The tag that opens a run of GS register writes, as the four words the GIF
 * reads it out of.
 */
struct GIFTAG {
    u32 word[4];
} __attribute__((aligned(16)));

STATIC_ASSERT(sizeof(GIFTAG) == 0x10);

/* Where every external character of the message window's font sits. */
extern "C" s32 GaijiDataTbl[][8];

/* The colour each palette entry of the message window's font draws with. */
extern "C" u32 FontColorTbl[16];

/* The packet every draw call of the game writes into. */
extern "C" sceVif1Packet *Vif1Packet;

/* Whether the message windows skip drawing themselves entirely. */
int MesAbsDrawOff;

s16 ClsMes::GetGaijiW(int code) {
    if (code >= -0x300 && code < -0x263) {
        if (this->narrow_gaiji != 0) {
            if (code == -0x2BD) {
                return 5;
            }
            if (code == -0x2BA) {
                return 5;
            }
            if (code == -0x2AB) {
                return 5;
            }
        }
        EDIT_GAIJI *table = (EDIT_GAIJI *) &EditPartsData[0x491C];
        EDIT_GAIJI *gaiji = &EditGaijiTbl[code];
        s16 width = this->char_width;

        return width * gaiji->width;
    }
    return this->char_width;
}

int ClsMes::GetNameLen(int chara) {
    if (chara < 0) {
        return -1;
    }
    if (chara >= 6) {
        return -1;
    }

    short *name = (short *) SaveData->GetCharaName(chara);

    for (int i = 0; i < 11; i++) {
        if ((u16) name[i] == 0) {
            return i;
        }
    }
    return -1;
}

int ClsMes::GetNameWidth(int chara) {
    if (chara < 0) {
        return -1;
    }
    if (chara >= 6) {
        return -1;
    }

    u16 *name = (u16 *) SaveData->GetCharaName(chara);
    s16 width = 0;

    for (int i = 0; i < 11; i++) {
        if (name[i] == 0) {
            return width;
        }

        int code = NameRegistCodeJtoE(name[i] - 1);

        if (code >= -0x300 && code < -0x262) {
            width += this->GetGaijiW(code);
        } else {
            width += this->char_width;
        }
    }
    return -1;
}

void Myset2DSprite(sceVif1Packet *packet, CTexture *texture, const CRect_i_ &src,
                   const CRect_i_ &dst, u8 r, u8 g, u8 b, u8 a) {
    float one = 1.0f;

    sceVif1PkCnt(packet, 0);
    sceVif1PkOpenDirectCode(packet, 0);
    sceVif1PkOpenGifTag(packet, *(u_long128 *) &GiftagAD);
    sceVif1PkAddGsAD(packet, 0x14, 0x61);
    sceVif1PkAddGsAD(packet, 0, 0x1D6);

    sceGsZbuf depth = mgZBuffer;

    sceVif1PkAddGsAD(packet, 0x4E, *(unsigned long *) &depth);
    sceVif1PkAddGsAD(packet, 1,
                     (unsigned long) r | (unsigned long) g << 8 | (unsigned long) b << 16 |
                         (unsigned long) a << 24 | (unsigned long) *(u32 *) &one << 32);
    sceVif1PkAddGsAD(packet, 6, *(unsigned long *) &texture->tex0);
    sceVif1PkAddGsAD(packet, 3, (unsigned long) (dst.x << 4) | (unsigned long) (dst.y << 4) << 16);
    sceVif1PkAddGsAD(packet, 4,
                     (unsigned long) ((src.x << 4) + 0x6C00) |
                         (unsigned long) ((src.y << 3) + 0x7900) << 16);
    sceVif1PkAddGsAD(packet, 3,
                     (unsigned long) ((dst.x + dst.width) << 4) |
                         (unsigned long) ((dst.y + dst.height) << 4) << 16);
    sceVif1PkAddGsAD(packet, 4,
                     (unsigned long) (((src.x + src.width) << 4) + 0x6BFF) |
                         (unsigned long) (((src.y + src.height) << 3) + 0x7900) << 16);
    sceVif1PkCloseGifTag(packet);
    sceVif1PkCloseDirectCode(packet);
}

void ClsMes::AutoSetSub(CCharacter *first, CCharacter *second, int *out_pos) {
    GetScrPosFromChar(first, out_pos);
    GetScrPosFromChar(second, &out_pos[2]);
}

FUZZY_MATCH("asm/nonmatchings/clsmes", AutoSet__6ClsMesFPi);

void ClsMes::AutoSet(int *pos) {
    RECT cand[3][3];
    int outside[3][3];
    float away[3][3];
    int x;
    int y;
    int x2;
    int y2;
    int width;
    int height;
    int col;
    int row;
    int best_col;
    int best_row;

    x = pos[0];
    y = pos[1];
    x2 = pos[2];
    y2 = pos[3];

    width = 0xCA;
    height = 0x8A;

    if (this->win_width >= 0xCB) {
        width = this->win_width;
    }

    if (this->win_height >= 0x8B) {
        height = this->win_height;
    }

    for (row = 0; row < 3; row++) {
        for (col = 0; col < 3; col++) {
            cand[row][col].height = height;

            if (col == 0) {
                cand[row][col].x = 0;
            } else {
                cand[row][col].x = col * (0x260 - width) >> 1;
                cand[row][col].x += 0x10;
            }

            if (row == 0) {
                cand[row][col].y = 0;
            } else {
                cand[row][col].y = row * (0x1A0 - height) >> 1;
                cand[row][col].y += 0x10;
            }

            if (col == 0 || col == 2) {
                cand[row][col].width = width + 0x10;
            } else {
                cand[row][col].width = width;
            }

            if (row == 0 || row == 2) {
                cand[row][col].height = height + 0x10;
            } else {
                cand[row][col].height = height;
            }
        }
    }

    best_col = 0;
    best_row = 0;

    if (this->auto_pos == 0) {
        for (row = 0; row < 3; row++) {
            for (col = 0; col < 3; col++) {
                RECT *rect = &cand[row][col];

                outside[row][col] = CheckPosInOutForRect(rect, x, y);

                if (outside[row][col] == 0) {
                    outside[row][col] = CheckPosInOutForRect(rect, x2, y2);
                }
            }
        }

        for (row = 0; row < 3; row++) {
            for (col = 0; col < 3; col++) {
                if (outside[row][col] != 0) {
                    away[row][col] = -1.0f;
                }

                RECT *rect = &cand[row][col];

                away[row][col] = GetDisPosToRect(rect, x, y);

                float other = GetDisPosToRect(rect, x2, y2);

                if (other < away[row][col]) {
                    away[row][col] = other;
                }
            }
        }

        float best = 0.0f;

        for (row = 0; row < 3; row++) {
            for (col = 0; col < 3; col++) {
                if (away[row][col] >= 0.0f && best < away[row][col]) {
                    best_col = col;
                    best_row = row;
                    best = away[row][col];
                }
            }
        }
    } else {
        best_col = (this->auto_pos - 1) % 3;
        best_row = (this->auto_pos - 1) / 3;
    }

    this->win_x = cand[best_row][best_col].x;
    this->win_y = cand[best_row][best_col].y;

    if (this->win_width < 0xCA) {
        this->win_x += (0xCA - this->win_width) >> 1;
    }

    if (this->win_height < 0x8A) {
        this->win_y += (0x8A - this->win_height) >> 1;
    }

    if (best_col == 0) {
        this->win_x += 0x10;
    }

    if (best_row == 0) {
        this->win_y += 0x10;
    }

    this->text_x = this->win_x + (int) (5.0f * this->char_width);
    this->text_y = this->win_y + (int) (1.5f * this->char_height);

    if (this->tail_on != 0) {
        this->tail_to_x = x;
        this->tail_to_y = y;
    }

    this->grow_x = this->win_x + (this->win_width >> 1);
    this->grow_y = this->win_y + (this->win_height >> 1);

    if (this->tail_on != 0) {
        if (this->tail_to_x <= this->win_x + (int) (this->win_width >> 2)) {
            this->tail_x = this->win_x + (int) (this->win_width >> 2);
        } else if (this->tail_to_x >= this->win_x + (int) (this->win_width * 3 >> 2)) {
            this->tail_x = this->win_x + (int) (this->win_width * 3 >> 2);
        } else {
            this->tail_x = this->tail_to_x;
        }

        if (this->tail_to_y <= this->win_y + (int) (this->win_height >> 2)) {
            this->tail_y = this->win_y + (int) (this->win_height >> 2);
        } else if (this->tail_to_y >= this->win_y + (int) (this->win_height * 3 >> 2)) {
            this->tail_y = this->win_y + (int) (this->win_height * 3 >> 2);
        } else {
            this->tail_y = this->tail_to_y;
        }
    }
}

FUZZY_MATCH("asm/nonmatchings/clsmes", AbsFukidashiIn__6ClsMesFv);

void ClsMes::AbsFukidashiIn(void) {
    if (this->win_x < 0x10) {
        this->win_x = 0x10;
        this->text_x = this->win_x + (int) (5.0f * this->char_width);
    } else if (this->win_x + this->win_width >= 0x270) {
        this->win_x = 0x270 - this->win_width;
        this->text_x = this->win_x + (int) (5.0f * this->char_width);
    }

    if (this->win_y < 0x10) {
        this->win_y = 0x10;
        this->text_y = this->win_y + (int) (1.5f * this->char_height);
    } else if (this->win_y + this->win_height >= 0x1B0) {
        this->win_y = 0x1B0 - this->win_height;
        this->text_y = this->win_y + (int) (1.5f * this->char_height);
    }
}

ClsMes::ClsMes(void) {
    this->text_x = 0x64;
    this->text_y = 0x32;
    this->char_width = 0xB;
    this->char_height = 0x14;
    this->columns = 0x46;
    this->rows = 0xA;
    this->text_columns = 0x46;
    this->text_rows = 0xA;
    this->text_len = 0;
    this->text_width = 0;
    this->text_height = 0;
    this->unk_02C = 0x10;
    this->unk_030 = 0x10;
    this->fukidashi = 1;
    this->fukidashi_shape = 0;
    this->grow_x = 0x140;
    this->grow_y = 0xE0;
    this->win_x = this->text_x;
    this->win_y = this->text_y;
    this->win_width = this->char_width * this->columns;
    this->win_height = this->char_height * this->rows;
    this->auto_pos = 0;
    this->tail_on = 1;
    this->tail_x = 0x12C;
    this->tail_y = 0xC8;
    this->tail_to_x = 0x140;
    this->tail_to_y = 0xC8;
    this->tail_half_width = 8;
    this->tail_length = 0x40;
    this->stay_frame = 0;
    this->stay_width = 0;
    this->stay_height = 0;
    this->text_rate = 0.5f;
    this->text_rate_set = 0.5f;
    this->waiting = 0;
    this->auto_page = 0;
    this->fade_speed = 0.01f;
    this->fade = 0.0f;
    this->fade_in = 1;
    this->text_at = 0.0f;
    this->text_no = 0;
    this->text_from = 0;
    this->page_from = 0;
    this->clut_default = 1;
    this->clut_now = this->clut_default;
    this->wait = 0;
    this->blink = 0;
    this->auto_page_wait = 0;
    this->mes_made = -1;
    this->style = 4;
    this->page_arrow = 1;
    this->end_mark = 0;
    this->centre_rows = 1;
    this->unk_16D0 = 1;
    this->edge_alpha = 0x80;
    this->narrow_gaiji_set = 0;
    this->narrow_gaiji = 0;

    for (int i = 0; i < 10; i++) {
        this->mes_no[i] = -1;
    }
    for (int i = 0; i < 8; i++) {
        this->values[i] = 0;
    }

    this->value = 0;
    this->value_signed = 0;
    this->value_show = 1;
    this->value_narrow = 0;
    this->space_width = -1;
    this->space_area = -1;
    this->cursor_row = -1;
    this->cursor_y = 0;
    this->cursor_lit = 0;
    this->tex_block = 0;

    for (int i = 0; i < 10; i++) {
        this->line_pos[i].x = -1;
        this->line_pos[i].y = -1;
    }

    this->buff = NULL;
    this->buff_system = NULL;
    this->text = NULL;
    this->text_system = NULL;
    this->unk_17B0 = NULL;
    this->clut = MesWinClut;
}

void ClsMes::SetBuff(short *buff) {
    this->buff = buff;
    this->text = (char *) this->buff;
    this->text += (u16) this->buff[1];
}

void ClsMes::SetBuff_system(short *buff) {
    this->buff_system = buff;
    this->text_system = (char *) this->buff_system;
    this->text_system += (u16) this->buff_system[1];
}

void ClsMes::Preset(int style) {
    switch (style) {
        case 1:
            this->fukidashi = 0;
            this->text_rate = 0.0f;
            this->text_rate_set = 0.0f;
            this->clut_default = Color2Clut(0x80BFBFBF) & 0xFF;
            this->clut_now = this->clut_default;
            this->style = 2;
            this->page_arrow = 0;
            this->centre_rows = 1;
            this->unk_16D0 = 0;
            break;
        case 0:
            this->fukidashi = 1;
            this->clut_default = Color2Clut(0x80304045) & 0xFF;
            this->clut_now = this->clut_default;
            this->style = 1;
            this->page_arrow = 1;
            this->centre_rows = 1;
            this->unk_16D0 = 1;
            break;
        case 2:
            this->style = 0;
            this->page_arrow = 0;
            this->centre_rows = 1;
            this->auto_page = 1;
            break;
        case 4:
            this->fukidashi = 0;
            this->text_rate = 0.0f;
            this->text_rate_set = 0.0f;
            this->clut_default = Color2Clut(0x8066CEE7) & 0xFF;
            this->clut_now = this->clut_default;
            this->style = 3;
            this->page_arrow = 0;
            this->unk_16D0 = 0;
            break;
        case 3:
            break;
    }
}

void ClsMes::SetMesFukidashi(int style) {
    switch (style) {
        case 5:
            this->char_width = 0xD;
            this->char_height = 0x14;
            this->fukidashi = 0;
            this->stay_frame = 0;
            this->clut_default = 1;
            this->clut_now = this->clut_default;
            this->page_arrow = 1;
            this->style = 2;
            this->unk_16D0 = 1;
            break;
        case 4:
            this->char_width = 0xD;
            this->char_height = 0x14;
            this->fukidashi = 0;
            this->stay_frame = 0;
            this->clut_default = Color2Clut(0x80BFBFBF) & 0xFF;
            this->clut_now = this->clut_default;
            this->page_arrow = 1;
            this->style = 3;
            this->unk_16D0 = 1;
            break;
        case 3:
            this->char_width = 0xB;
            this->char_height = 0x14;
            this->fukidashi = 0;
            this->stay_frame = 1;
            this->clut_default = Color2Clut(0x80BFBFBF) & 0xFF;
            this->clut_now = this->clut_default;
            this->page_arrow = 0;
            this->style = 2;
            this->unk_16D0 = 0;
            break;
        case 2:
            this->char_width = 0xB;
            this->char_height = 0x14;
            this->fukidashi = 0;
            this->stay_frame = 0;
            this->clut_default = Color2Clut(0x80BFBFBF) & 0xFF;
            this->clut_now = this->clut_default;
            this->page_arrow = 1;
            this->style = 4;
            this->unk_16D0 = 1;
            break;
        case 1:
            this->fukidashi = 0;
            this->page_arrow = 0;
            break;
        default:
            this->char_width = 0xB;
            this->char_height = 0x14;
            this->fukidashi = 1;
            this->stay_frame = 0;
            this->clut_default = 1;
            this->clut_now = this->clut_default;
            this->page_arrow = 1;
            this->style = 0;
            this->unk_16D0 = 1;
            break;
    }
}

void ClsMes::Step(void) {
    if (this->fukidashi == 0) {
        this->fade = 1.0f;
        return;
    }

    if (this->fade_in != 0) {
        if (this->fade < 1.0f) {
            this->fade = this->fade + this->fade_speed;
        }
        if (1.0f < this->fade) {
            this->fade = 1.0f;
        }
    } else {
        if (0.0f < this->fade) {
            this->fade = this->fade - this->fade_speed;
        }
        if (this->fade < 0.0f) {
            this->fade = 0.0f;
        }
    }

    if (this->tail_on == 0) {
        return;
    }

    float centre[2];
    float left[2];
    float left_out[2];
    float right[2];
    float right_out[2];

    centre[0] = this->tail_x;
    centre[1] = this->tail_y;

    float angle = atan2((float) (this->tail_to_x - this->tail_x),
                        (float) (this->tail_to_y - this->tail_y));

    left[0] = this->tail_x - this->tail_half_width;
    left[1] = this->tail_y;
    RollPos(centre, left, angle, left_out);
    this->tail_left_x = (int) left_out[0];
    this->tail_left_y = (int) left_out[1];

    right[0] = this->tail_x + this->tail_half_width;
    right[1] = this->tail_y;
    RollPos(centre, right, angle, right_out);
    this->tail_right_x = (int) right_out[0];
    this->tail_right_y = (int) right_out[1];

    float dx = this->tail_to_x - this->tail_x;
    float dy = this->tail_to_y - this->tail_y;
    float length = sqrt(dx * dx + dy * dy);

    float px = this->tail_length * dx / length;
    float py = this->tail_length * dy / length;

    this->tail_tip_x = (int) px + this->tail_x;
    this->tail_tip_y = (int) py + this->tail_y;
}

int ClsMes::State(void) {
    if (this->fade <= 0.0f) {
        return 0;
    }
    if (0.0f < this->fade && this->fade < 1.0f) {
        return this->fade_in != 0 ? 1 : 4;
    }
    if (this->waiting != 0) {
        return 5;
    }
    if (this->text_no >= this->text_len) {
        return 3;
    }
    return 2;
}

void ClsMes::MyTextureMake_InitAll(void) {
    if (this->unk_17B0 != NULL) {
        memset(this->unk_17B0, 0, 0x100);
    }
}

void ClsMes::GoNextPage(void) {
    if (this->waiting != 0) {
        this->waiting = 0;
        MyTextureMake_InitAll();
        this->blink = 0;
        this->text_from = this->page_from;
    }
}

FUZZY_MATCH("asm/nonmatchings/clsmes", MyTextureMake_sub__6ClsMesFv);

int ClsMes::MyTextureMake_sub(void) {
    int at = this->text_no;

    this->text_no = at + 1;

    short code = this->win_line[at].code;

    int unused;

    if (code >= 0x1000) {
        unused = code;
    }

    switch (code) {
        case -0x100:
            this->text_at += 1.0f;
            return 0;
        case -0xFD:
            this->waiting = 1;
            if (this->auto_page != 0 && this->blink >= this->auto_page_wait) {
                this->GoNextPage();
                this->auto_page_wait = 0;
            }
            this->page_from = at;
            return 1;
        case -0xFF:
            this->text_at += 1.0f;
            return 2;
        case -0xFE:
            this->text_at += 1.0f;
            return 0;
    }

    if ((code >= -0x700 && code <= -0x601) || (code >= -0x800 && code <= -0x701) ||
        (code >= -0x900 && code < -0x800)) {
        this->text_at += 1.0f;
        return 0;
    }

    this->wait = this->win_line[at].space;
    return 0;
}

void ClsMes::MyTextureMake(void) {
    if (this->waiting != 0) {
        if (this->auto_page != 0 && this->blink >= this->auto_page_wait) {
            this->GoNextPage();
            this->auto_page_wait = 0;
        }
        return;
    }

    if (this->wait > 0) {
        this->wait--;
    } else if (this->text_rate > 0.0f) {
        this->text_at += this->text_rate;
    }

    if (this->text_rate_set == 0.0f && this->text_no >= this->text_len) {
        return;
    }

    if (this->text_at > this->text_len) {
        this->text_at = this->text_len;
    }

    while (this->text_rate == 0.0f || this->text_at - this->text_no >= 1.0f) {
        int made = this->MyTextureMake_sub();

        if (made == 1 || made == 2) {
            if (this->text_rate == 0.0f) {
                this->text_rate = this->text_rate_set;
                this->text_at = this->text_no;
            }
            return;
        }

        if (this->text_no >= this->text_len) {
            this->text_rate = this->text_rate_set;
            this->text_at = this->text_no;
            return;
        }

        if (this->text_rate_set == 0.0f && this->text_no >= this->text_len) {
            return;
        }
    }
}

short *SetAndGetNameRegistTbl(int chara) {
    if (chara < 0) {
        return NULL;
    }
    if (chara >= 6) {
        return NULL;
    }

    for (int i = 0; i < 11; i++) {
        NameRegistTbl[chara][i] = -0x100;
    }

    u16 *name = (u16 *) SaveData->GetCharaName(chara);

    for (int i = 0; i < 11; i++) {
        if (name[i] == 0) {
            NameRegistTbl[chara][i] = -0x100;
        } else {
            NameRegistTbl[chara][i] = NameRegistCodeJtoE(name[i] - 1);
        }
    }
    return NameRegistTbl[chara];
}

void ClsMes::MakeMesWinTbl_value(int *x, int *y) {
    if (this->value_show == 0 && this->value == 0) {
        return;
    }

    char text[128];

    if (this->value_signed != 0 && this->value > 0) {
        sprintf(text, "+%d\n", this->value);
    } else {
        sprintf(text, "%d\n", this->value);
    }

    int len = strlen(text);

    for (int i = 0; i < len; i++) {
        int code = -1;
        char digit = text[i];

        if (digit == '+') {
            code = -0x2A4;
        }
        if (digit == '-') {
            code = -0x2A3;
        }
        if (digit == '1') {
            code = -0x290;
        }
        if (digit == '2') {
            code = -0x28F;
        }
        if (digit == '3') {
            code = -0x28E;
        }
        if (digit == '4') {
            code = -0x28D;
        }
        if (digit == '5') {
            code = -0x28C;
        }
        if (digit == '6') {
            code = -0x28B;
        }
        if (digit == '7') {
            code = -0x28A;
        }
        if (digit == '8') {
            code = -0x289;
        }
        if (digit == '9') {
            code = -0x288;
        }
        if (digit == '0') {
            code = -0x291;
        }

        if (code == -1) {
            continue;
        }

        if (this->value_narrow != 0) {
            this->SetMesWinTbl(code, 0, *x, *y);
            *x = *x + (this->char_width >> 2) * 3;
        } else {
            this->SetMesWinTbl(code, 0, *x, *y);
            *x = *x + this->char_width;
        }
    }
}

void ClsMes::MakeMesWinTbl_value(int which, int *x, int *y) {
    if (this->value_show == 0 && this->values[which] == 0) {
        return;
    }

    char text[128];

    if (this->value_signed != 0 && this->values[which] > 0) {
        sprintf(text, "+%d\n", this->values[which]);
    } else {
        sprintf(text, "%d\n", this->values[which]);
    }

    int len = strlen(text);

    for (int i = 0; i < len; i++) {
        int code = -1;
        char digit = text[i];

        if (digit == '+') {
            code = -0x2A4;
        }
        if (digit == '-') {
            code = -0x2A3;
        }
        if (digit == '1') {
            code = -0x290;
        }
        if (digit == '2') {
            code = -0x28F;
        }
        if (digit == '3') {
            code = -0x28E;
        }
        if (digit == '4') {
            code = -0x28D;
        }
        if (digit == '5') {
            code = -0x28C;
        }
        if (digit == '6') {
            code = -0x28B;
        }
        if (digit == '7') {
            code = -0x28A;
        }
        if (digit == '8') {
            code = -0x289;
        }
        if (digit == '9') {
            code = -0x288;
        }
        if (digit == '0') {
            code = -0x291;
        }

        if (code == -1) {
            continue;
        }

        if (this->value_narrow != 0) {
            this->SetMesWinTbl(code, 0, *x, *y);
            *x = *x + (this->char_width >> 2) * 3;
        } else {
            this->SetMesWinTbl(code, 0, *x, *y);
            *x = *x + this->char_width;
        }
    }
}

int ClsMes::MakeMesWinTbl_system(int code, int *x, int *y) {
    short *at;
    int c;

    if (code >= -0x500 && code < -0x400) {
        code += 0x500;

        if (code == 0xFF) {
            return 0;
        }
        if (code == 0xFA) {
            return 0;
        }
        if (code == 0xF9) {
            return 0;
        }
        if (code == 0xF8) {
            return 0;
        }
        if (code == 0xF7) {
            return 0;
        }
        if (code == 0xF6) {
            return 0;
        }
        if (code == 0xF5) {
            return 0;
        }
        if (code == 0xF4) {
            return 0;
        }
        if (code == 0xF3) {
            return 0;
        }

        if (code == 0xFE) {
            code = this->mes_no[0];
        } else if (code == 0xFD) {
            code = this->mes_no[1];
        } else if (code == 0xFC) {
            code = this->mes_no[2];
        } else if (code == 0xFB) {
            code = this->mes_no[3];
        } else if (code == 0xF2) {
            code = this->mes_no[4];
        } else if (code == 0xF1) {
            code = this->mes_no[5];
        } else if (code == 0xF0) {
            code = this->mes_no[6];
        } else if (code == 0xEF) {
            code = this->mes_no[7];
        } else if (code == 0xEE) {
            code = this->mes_no[8];
        } else if (code == 0xED) {
            code = this->mes_no[9];
        }
    } else {
        return 0;
    }

    if (this->buff_system == 0) {
        return 0;
    }

    at = this->GetTextLineDataTop_system(code);

    if (at == 0) {
        return 0;
    }

    while (1) {
        c = *at;
        at++;

        if (c >= -0x506 && c < -0x500) {
            short *name = SetAndGetNameRegistTbl(c + 0x506);

            if (name != 0) {
                int name_code = *name;

                while (name_code != -0x100 && name_code != -0xFF) {
                    this->SetMesWinTbl(name_code, 0, *x, *y);
                    *x += this->char_width;
                    name++;
                    name_code = *name;
                }
            }
        } else {
            switch (c) {
                case -0xFF:
                    return 1;

                case -0xFE:
                    this->SetMesWinTbl(c, 0, *x, *y);

                    if (this->space_area >= 0 || this->space_width >= 0) {
                        *x += this->space_width;
                    } else {
                        *x += this->char_width;
                    }
                    break;

                case -0x100:
                    this->SetMesWinTbl(c, 1, *x, *y);
                    *x = 0;
                    *y += this->char_height;
                    break;

                default:
                    if (c >= -0x300 && c < -0x262) {
                        this->SetMesWinTbl(c, 0, *x, *y);
                        *x += this->GetGaijiW(c);
                    } else {
                        this->SetMesWinTbl(c, 1, *x, *y);
                        *x += this->char_width;
                    }
                    break;
            }
        }
    }
}

int ClsMes::GetMesLen_system(int mes_no) {
    int no;

    if (mes_no >= -0x500 && mes_no < -0x400) {
        no = mes_no + 0x500;

        if (no == 0xFF) {
            return -1;
        }
        if (no == 0xFA) {
            return -1;
        }
        if (no == 0xF9) {
            return -1;
        }
        if (no == 0xF8) {
            return -1;
        }
        if (no == 0xF7) {
            return -1;
        }
        if (no == 0xF6) {
            return -1;
        }
        if (no == 0xF5) {
            return -1;
        }
        if (no == 0xF4) {
            return -1;
        }
        if (no == 0xF3) {
            return -1;
        }
        if (no == 0xFE) {
            no = this->mes_no[0];
        } else if (no == 0xFD) {
            no = this->mes_no[1];
        } else if (no == 0xFC) {
            no = this->mes_no[2];
        } else if (no == 0xFB) {
            no = this->mes_no[3];
        } else if (no == 0xF2) {
            no = this->mes_no[4];
        } else if (no == 0xF1) {
            no = this->mes_no[5];
        } else if (no == 0xF0) {
            no = this->mes_no[6];
        } else if (no == 0xEF) {
            no = this->mes_no[7];
        } else if (no == 0xEE) {
            no = this->mes_no[8];
        } else if (no == 0xED) {
            no = this->mes_no[9];
        }
    } else {
        return -1;
    }

    if (this->buff_system == NULL) {
        return -1;
    }

    short *at = this->GetTextLineDataTop_system(no);

    if (at == NULL) {
        return -1;
    }

    int len[2] = {0, 0};
    int line = 0;

    while (1) {
        short code = *at++;

        if (code >= -0x506 && code < -0x500) {
            len[line] += this->GetNameLen(code + 0x506);
            continue;
        }

        switch (code) {
            case -0x100:
                line++;
                continue;
            case -0xFF:
                if (len[0] > len[1]) {
                    return len[0];
                }
                return len[1];
        }

        len[line]++;
    }
}

int ClsMes::GetMesWidth_system(int mes_no) {
    if (this->buff_system == NULL) {
        return -1;
    }

    short *at = this->GetTextLineDataTop_system(mes_no);

    if (at == NULL) {
        return -1;
    }

    int width[2] = {0, 0};
    int line = 0;

    while (1) {
        short code = *at++;

        if (code >= -0x506 && code < -0x500) {
            width[line] += this->GetNameWidth(code + 0x506);
            continue;
        }

        switch (code) {
            case -0x100:
                line++;
                continue;
            case -0xFF:
                if (width[0] > width[1]) {
                    return width[0];
                }
                return width[1];
        }

        if (code >= -0x300 && code < -0x262) {
            width[line] += this->GetGaijiW(code);
        } else {
            width[line] += this->char_width;
        }
    }
}

short *ClsMes::GetTextLineDataTop(int line) {
    int count = this->buff[0];
    short *body = &this->buff[1];

    for (int i = 0; i < count; i++) {
        if (line == body[i * 2 + 1]) {
            return &body[count] + body[i * 2 + 2];
        }
    }
    return NULL;
}

short *ClsMes::GetTextLineDataTop_system(int line) {
    int count = this->buff_system[0];
    short *body = &this->buff_system[1];

    for (int i = 0; i < count; i++) {
        if (line == body[i * 2 + 1]) {
            return &body[count] + body[i * 2 + 2];
        }
    }
    return NULL;
}

void ClsMes::InitMesWinTbl(void) {
    for (int i = 0; i < MES_WIN_LINE_MAX; i++) {
        this->win_line[i].code = 0;
        this->win_line[i].x = 0;
        this->win_line[i].y = 0;
        this->win_line[i].clut = 0;
        this->win_line[i].space = 0;
    }
    this->win_line_num = 0;
}

int ClsMes::SetMesWinTbl(int code, int mode, short x, short y) {
    if (code >= -0x200 && code <= -0x101) {
        if (this->win_line_num > 0) {
            this->win_line[this->win_line_num - 1].space += code + 0x200;
        }
        return 0;
    }

    if (code >= -0x400 && code <= -0x301) {
        if (code + 0x400 == 0) {
            this->clut_now = this->clut_default;
        } else if (code == -0x301) {
            this->clut_now = 0xFF;
        } else {
            this->clut_now = code + 0x401;
        }
        return 0;
    }

    if (code >= -0xA00 && code <= -0x901) {
        this->fukidashi_shape = code + 0xA00;
        return 0;
    }

    if (mode == 1) {
        this->win_line[this->win_line_num].code = code + 0x1000;
        this->win_line[this->win_line_num].x = x;
        this->win_line[this->win_line_num].y = y;
        this->win_line[this->win_line_num].clut = this->clut_now;
        this->win_line_num++;
    } else {
        this->win_line[this->win_line_num].code = code;
        this->win_line[this->win_line_num].x = x;
        this->win_line[this->win_line_num].y = y;
        this->win_line[this->win_line_num].clut = this->clut_now;
        this->win_line_num++;
    }
    return 1;
}

int ClsMes::CalcSpaceW(int width, int glyph_width, short *text) {
    short *at = text;
    int used = 0;
    int spaces = 0;

    while (1) {
        short code = *at++;

        switch (code) {
            case -0x100:
            case -0xFD:
            case -0xFF:
                if (spaces > 0) {
                    return (width - used) / spaces;
                }
                return -1;
            case -0xFE:
                spaces++;
                continue;
        }

        if (code >= -0x300 && code < -0x262) {
            used += this->GetGaijiW(code);
        } else if (code >= -0x700 && code < -0x600) {
            used += code + 0x700;
        } else {
            used += glyph_width;
        }
    }
}

int ClsMes::MakeMesWinTbl(int mes_no) {
    short *at;
    int x;
    int y;
    int code;

    if (this->buff == 0) {
        return 0;
    }

    at = this->GetTextLineDataTop(mes_no);

    if (at == 0) {
        return 0;
    }

    this->InitMesWinTbl();

    x = 0;
    y = 0;

    while (1) {
        code = *at;
        at++;

        if (code == -0xFD || code == -0x100 || code == -0xFF) {
            this->space_width = -1;
            this->space_area = -1;
        }

        switch (code) {
            case -0xFF:
                this->SetMesWinTbl(code, 0, x, y);
                return 1;

            case -0x100:
                this->SetMesWinTbl(code, 0, x, y);
                x = 0;
                y += this->char_height;
                break;

            case -0xFD:
                this->SetMesWinTbl(code, 0, x, y);
                x = 0;
                y = 0;
                break;

            case -0xFE:
                this->SetMesWinTbl(code, 0, x, y);

                if (this->space_area >= 0 || this->space_width >= 0) {
                    x += this->space_width;
                } else {
                    x += this->char_width;
                }
                break;

            default:
                if (code >= -0x300 && code < -0x262) {
                    this->SetMesWinTbl(code, 0, x, y);
                    x += this->GetGaijiW(code);
                } else if (code >= -0x900 && code < -0x800) {
                    this->space_area = (code + 0x900) * 4;
                    this->space_width = this->CalcSpaceW(this->space_area, this->char_width, at - 1);
                } else if (code >= -0x800 && code < -0x700) {
                    this->space_width = code + 0x800;
                } else if (code >= -0x700 && code < -0x600) {
                    x += code + 0x700;
                } else if (code >= -0x506 && code < -0x500) {
                    short *name = SetAndGetNameRegistTbl(code + 0x506);

                    if (name != 0) {
                        int name_code = *name;

                        while (name_code != -0x100 && name_code != -0xFF) {
                            this->SetMesWinTbl(name_code, 0, x, y);
                            x += this->char_width;
                            name++;
                            name_code = *name;
                        }
                    }
                } else if (code == -0x401) {
                    this->MakeMesWinTbl_value(&x, &y);
                } else if (code >= -0x40D && code < -0x405) {
                    this->MakeMesWinTbl_value(-0x406 - code, &x, &y);
                } else if (this->MakeMesWinTbl_system(code, &x, &y) == 0) {
                    if (this->SetMesWinTbl(code, 0, x, y) != 0) {
                        x += this->char_width;
                    }
                }
                break;
        }
    }
}

void NeedMesWinWH_sub(int *len, int *max_len, int *width, int *max_width, int char_width,
                      int count) {
    if (count <= 0) {
        return;
    }

    *len += count;
    if (*max_len < *len) {
        *max_len = *len;
    }

    *width += count * char_width;
    if (*max_width < *width) {
        *max_width = *width;
    }
}

FUZZY_MATCH("asm/nonmatchings/clsmes", NeedMesWinWH__6ClsMesFiPi);

void ClsMes::NeedMesWinWH(int mes_no, int *out) {
    short *at;
    int *max_len;
    int *max_lines;
    int *max_width;
    int *max_height;
    int code;
    int len;
    int width;
    int lines;
    int height;
    int count;

    if (this->buff == 0) {
        return;
    }

    at = this->GetTextLineDataTop(mes_no);

    if (at == 0) {
        return;
    }

    max_len = &out[0];
    max_lines = &out[1];
    max_width = &out[2];
    max_height = &out[3];

    *max_len = 0;
    *max_lines = 0;
    *max_width = 0;
    *max_height = 0;
    len = 0;
    lines = 0;
    width = 0;
    height = 0;
    count = 0;

    while (1) {
        count++;
        code = *at;
        at++;

        if (code == -0xFD || code == -0x100 || code == -0xFF) {
            this->space_width = -1;
            this->space_area = -1;
        }

        switch (code) {
            case -0xFF:
                return;

            case -0xFE:
                len++;

                if (*max_len < len) {
                    *max_len = len;
                }

                if (this->space_area >= 0 || this->space_width >= 0) {
                    width += this->space_width;
                } else {
                    width += this->char_width;
                }

                if (*max_width < width) {
                    *max_width = width;
                }
                break;

            case -0x100:
                len = 0;
                lines++;

                if (*max_lines < lines) {
                    *max_lines = lines;
                }

                width = 0;
                height += this->char_height;

                if (*max_height < height) {
                    *max_height = height;
                }
                break;

            case -0xFD:
                len = 0;
                lines = 0;
                width = 0;
                height = 0;
                break;

            default:
                if (code >= -0x200 && code <= -0x101) {
                    continue;
                } else if (code >= -0x400 && code <= -0x301) {
                    continue;
                } else if (code >= -0xA00 && code <= -0x901) {
                    continue;
                } else if (code >= -0x900 && code < -0x800) {
                    this->space_area = (code + 0x900) * 4;
                    this->space_width = this->CalcSpaceW(this->space_area, this->char_width, at - 1);
                } else if (code >= -0x800 && code < -0x700) {
                    this->space_width = code + 0x800;
                } else if (code >= -0x700 && code < -0x600) {
                    len++;

                    if (*max_len < len) {
                        *max_len = len;
                    }

                    width += code + 0x700;

                    if (*max_width < width) {
                        *max_width = width;
                    }
                } else if (code == -0x401) {
                    if (this->value_show != 0 || this->value != 0) {
                        char text[128];

                        if (this->value_signed != 0 && this->value > 0) {
                            sprintf(text, "+%d\n", this->value);
                        } else {
                            sprintf(text, "%d\n", this->value);
                        }

                        if (this->value_narrow != 0) {
                            NeedMesWinWH_sub(&len, max_len, &width, max_width,
                                             (this->char_width >> 2) * 3, strlen(text) - 1);
                        } else {
                            NeedMesWinWH_sub(&len, max_len, &width, max_width, this->char_width,
                                             strlen(text) - 1);
                        }
                    }
                } else if (code >= -0x40D && code < -0x405) {
                    if (this->value_show != 0 || this->values[-0x406 - code] != 0) {
                        char text[128];

                        if (this->value_signed != 0 && this->values[-0x406 - code] > 0) {
                            sprintf(text, "+%d\n", this->values[-0x406 - code]);
                        } else {
                            sprintf(text, "%d\n", this->values[-0x406 - code]);
                        }

                        if (this->value_narrow != 0) {
                            NeedMesWinWH_sub(&len, max_len, &width, max_width,
                                             (this->char_width >> 2) * 3, strlen(text) - 1);
                        } else {
                            NeedMesWinWH_sub(&len, max_len, &width, max_width, this->char_width,
                                             strlen(text) - 1);
                        }
                    }
                } else if (code == -0x405 || code == -0x404 || code == -0x403 ||
                           code == -0x402 || code == -0x411 || code == -0x410 ||
                           code == -0x40F || code == -0x40E) {
                    NeedMesWinWH_sub(&len, max_len, &width, max_width, this->char_width,
                                     this->GetMesLen_system(code));
                } else if (code >= -0x506 && code < -0x500) {
                    NeedMesWinWH_sub(&len, max_len, &width, max_width, this->char_width,
                                     this->GetNameLen(code + 0x506));
                } else if (code >= -0x300 && code < -0x263) {
                    len += *(int *) &EditGaijiTbl[code];
                    width += this->GetGaijiW(code);

                    if (*max_len < len) {
                        *max_len = len;
                    }

                    if (*max_width < width) {
                        *max_width = width;
                    }
                } else {
                    NeedMesWinWH_sub(&len, max_len, &width, max_width, this->char_width, 1);
                }
                break;
        }
    }
}

void MakeRandTbl(float lo, float hi) {
    for (int i = 0; i < 64; i++) {
        RandTbl[i] = ((hi - lo) * (float) rand()) / 2147483648.0f;
        RandTbl[i] += lo;
    }
}

void MakeRandTbl2(float lo, float hi) {
    for (int i = 0; i < 64; i++) {
        RandTbl2[i] = ((hi - lo) * (float) rand()) / 2147483648.0f;
        RandTbl2[i] += lo;
    }
}

int ClsMes::MakeMesWin(int mes_no) {
    if (this->mes_made == mes_no) {
        if (this->auto_page == 0) {
            this->fade = 1.0f;
            this->fade_in = 1;
            GoNextPage();
        }
        return 0;
    }

    this->fukidashi_shape = 0;
    this->text_no = 0;
    this->text_from = 0;
    this->page_from = 0;
    this->text_at = 0.0f;
    MakeMesTexture(mes_no);

    if (this->fukidashi_shape == 0) {
        MakeRandTbl(0.0f, 4.0f);
    } else if (this->fukidashi_shape == 1) {
        MakeRandTbl(2.0f, 6.0f);
    } else if (this->fukidashi_shape == 4) {
        MakeRandTbl(6.8f, 15.2f);
        MakeRandTbl2(0.42f, 0.58f);
    }
    return 0;
}

FUZZY_MATCH("asm/nonmatchings/clsmes", MakeMesTexture__6ClsMesFi);

void ClsMes::MakeMesTexture(int mes_no) {
    int wh[4];

    this->mes_made = mes_no;
    if (this->fukidashi != 0) {
        this->fade = 0.0f;
        this->fade_in = 1;
    }
    this->waiting = 0;
    this->blink = 0;
    MyTextureMake_InitAll();
    NeedMesWinWH(mes_no, wh);

    wh[1] += 1;
    wh[3] += this->char_height;
    this->text_columns = wh[0];
    this->text_rows = wh[1];
    this->text_width = wh[2];
    this->text_height = wh[3];

    if (this->text_columns < 4) {
        this->win_width = this->char_width * 14;
    } else {
        this->win_width = this->char_width * (int) (5.0f + (5.0f + (float) this->text_columns));
    }
    this->win_height = this->char_height * (int) (1.5f + (1.5f + (float) this->text_rows));
    this->win_x = this->text_x - (int) (5.0f * (float) this->char_width);
    this->win_y = this->text_y - (int) (1.5f * (float) this->char_height);

    if (MakeMesWinTbl(mes_no) != 0) {
        this->text_len = this->win_line_num;
    }
}

void ClsMes::Myset2DSprite_Fuchi(sceVif1Packet *packet, CTexture *texture, int x, int y,
                                 int width, int height, int u, int v, int u_width,
                                 int v_height) {
    switch (this->style) {
        case 1:
            set2DSprite_Core(packet, texture, CRect_i_(x + 1, y + 1, width, height),
                             CRect_i_(u, v, u_width, v_height), 0xFF, 0xFF, 0xFF,
                             this->edge_alpha < 0x40 ? this->edge_alpha : 0x40);
            break;
        case 2:
            set2DSprite_Core(packet, texture, CRect_i_(x + 1, y + 1, width, height),
                             CRect_i_(u, v, u_width, v_height), 0, 0, 0,
                             this->edge_alpha < 0x40 ? this->edge_alpha : 0x40);
            break;
        case 3:
            for (int i = 0; FuchiTbl_E[i].alpha > 0; i++) {
                set2DSprite_Core(packet, texture,
                                 CRect_i_(x + FuchiTbl_E[i].x, y + FuchiTbl_E[i].y, width, height),
                                 CRect_i_(u, v, u_width, v_height), FuchiTbl_E[i].r,
                                 FuchiTbl_E[i].g, FuchiTbl_E[i].b,
                                 this->edge_alpha < FuchiTbl_E[i].alpha ? this->edge_alpha
                                                                        : FuchiTbl_E[i].alpha);
            }
            break;
        case 4:
            set2DSprite_Core(packet, texture, CRect_i_(x + 1, y + 1, width, height),
                             CRect_i_(u, v, u_width, v_height), 0x40, 0x40, 0x40,
                             this->edge_alpha < 0x80 ? this->edge_alpha : 0x80);
            set2DSprite_Core(packet, texture, CRect_i_(x + 2, y + 2, width, height),
                             CRect_i_(u, v, u_width, v_height), 0, 0, 0,
                             this->edge_alpha < 0x80 ? this->edge_alpha : 0x80);
            break;
    }
}

void DrawMaru(sceVif1Packet *packet, int x, int y, int width, int height, int lift,
              int unused, int rough, int prim) {
    float across;
    float down;
    float turn;
    int px;
    int py;
    int step;

    sceVif1PkAddGsAD(packet, 0, ((unsigned long) prim << 7) | 0x145);
    sceVif1PkAddGsAD(packet, 1, 0x80BFBFBF | ((unsigned long) 1 << 32));

    px = x + (width >> 1);
    py = y + (height >> 1) - lift;

    sceVif1PkAddGsAD(packet, 4,
                     (unsigned long) ((px << 4) + 0x6C00) |
                         (unsigned long) ((py << 4) + 0x7900) << 16);

    turn = 0.0f;
    step = 0;

    while (turn < 128.0f) {
        float angle = 6.2831855f * turn / 128.0f;

        across = cosf(angle);
        down = sinf(angle);

        if (rough == 1 && step % 2 == 1) {
            across *= 0.9f;
            down *= 0.85f;
        }

        across += 1.0f;
        down += 1.0f;
        across *= width;
        down *= height;
        across /= 2.0f;
        down /= 2.0f;

        px = (int) across;
        py = (int) down;
        px += x;
        py += y - lift;

        sceVif1PkAddGsAD(packet, 4,
                         (unsigned long) ((px << 4) + 0x6C00) |
                             (unsigned long) ((py << 4) + 0x7900) << 16);

        if (rough == 1) {
            turn += RandTbl[step];
        } else {
            turn += 4.0f;
        }
        step++;
    }

    across = 1.0f;
    down = 0.0f;

    if (rough == 1 && step % 2 == 1) {
        across *= 0.9f;
        down *= 0.85f;
    }

    across += 1.0f;
    down += 1.0f;
    across *= width;
    down *= height;
    across /= 2.0f;
    down /= 2.0f;

    px = (int) across;
    py = (int) down;
    px += x;
    py += y - lift;

    sceVif1PkAddGsAD(packet, 4,
                     (unsigned long) ((px << 4) + 0x6C00) |
                         (unsigned long) ((py << 4) + 0x7900) << 16);
}

void ClsMes::MakeFukidashi_sub(sceVif1Packet *packet, int prim) {
    float w;
    float h;
    int x;
    int y;
    int top;
    int i;
    int n;

    top = this->win_y;

    if (this->grow_y < top) {
        top = this->grow_y;
    }

    if (this->tail_on != 0) {
        if (this->tail_left_y < top) {
            top = this->tail_left_y;
        }
        if (this->tail_right_y < top) {
            top = this->tail_right_y;
        }
        if (this->tail_tip_y < top) {
            top = this->tail_tip_y;
        }

        if (this->fukidashi_shape == 2) {
            if (this->tail_tip_y - 5 < top) {
                top = this->tail_tip_y - 5;
            }
        }
    }

    w = this->win_width * this->fade;
    h = this->win_height * this->fade;

    float shape[15][2] = {
        {0.5f, 0.5f},
        {0.02f, 0.29f},
        {0.22f, 0.03f},
        {0.51f, 0.06f},
        {0.73f, 0.0f},
        {0.92f, 0.1f},
        {0.98f, 0.36f},
        {0.98f, 0.74f},
        {0.9f, 0.91f},
        {0.7f, 0.99f},
        {0.43f, 0.91f},
        {0.2f, 0.97f},
        {0.03f, 0.8f},
        {0.0f, 0.52f},
        {0.02f, 0.29f},
    };

    if (this->fukidashi_shape == 0) {
        sceVif1PkAddGsAD(packet, 0, ((unsigned long) prim << 7) | 0x145);
        sceVif1PkAddGsAD(packet, 1, 0x80BFBFBF | ((unsigned long) 1 << 32));

        int bx = (int) LinerInterpolation(this->grow_x, this->win_x, this->fade);
        int by = (int) LinerInterpolation(this->grow_y, this->win_y, this->fade);

        n = (int) RandTbl[0];

        for (i = 0; i < 15; i++) {
            if (n % 2 != 0) {
                x = (int) (w * (1.0f - shape[i][0]));
            } else {
                x = (int) (w * shape[i][0]);
            }

            if (n >= 2) {
                y = (int) (h * (1.0f - shape[i][1]));
            } else {
                y = (int) (h * shape[i][1]);
            }

            x += bx;
            y += by;
            y -= top;

            sceVif1PkAddGsAD(packet, 4,
                             (unsigned long) ((x << 4) + 0x6C00) |
                                 (unsigned long) ((y << 4) + 0x7900) << 16);
        }
    } else if (this->fukidashi_shape == 1 || this->fukidashi_shape == 2) {
        x = (int) LinerInterpolation(this->grow_x, this->win_x, this->fade);
        y = (int) LinerInterpolation(this->grow_y, this->win_y, this->fade);

        int style = this->fukidashi_shape;

        if (style == 1) {
            DrawMaru(packet, x, y, (int) w, (int) h, top, 0x20, style, prim);
        } else {
            int ww = (int) w - this->char_width;
            int half = (int) h >> 1;
            float half_float = (float) half;

            DrawMaru(packet, x, y, ww, (int) (half_float + 1.5f * this->char_height), top, 0x20, 0,
                     prim);

            float pad = 1.5f * this->char_height;
            int cw = this->char_width;

            y = (int) (y + half - pad);
            ww = (int) w - cw;

            DrawMaru(packet, x + cw, y, ww, (int) (half + pad), top, 0x20, 0, prim);
        }
    } else {
        x = (int) LinerInterpolation(this->grow_x, this->win_x, this->fade);
        y = (int) LinerInterpolation(this->grow_y, this->win_y, this->fade);

        sceVif1PkAddGsAD(packet, 0, ((unsigned long) prim << 7) | 0x145);
        sceVif1PkAddGsAD(packet, 1, 0x80BFBFBF | ((unsigned long) 1 << 32));

        int iw = (int) w;
        int ih = (int) h;
        int px;
        int py;

        px = x + (iw >> 1);
        py = y + (ih >> 1) - top;

        sceVif1PkAddGsAD(packet, 4,
                         (unsigned long) ((px << 4) + 0x6C00) |
                             (unsigned long) ((py << 4) + 0x7900) << 16);

        float across;
        float down;
        float turn = 0.0f;
        int step = 0;

        while (turn < 128.0f) {
            float angle = 6.2831855f * turn / 128.0f;

            across = cosf(angle);
            down = sinf(angle);

            across = across * RandTbl2[step];
            down = down * RandTbl2[step];
            across += 0.5f;
            down += 0.5f;
            across = across * iw;
            down = down * ih;

            px = (int) across;
            py = (int) down;

            px += x;
            py += y - top;

            sceVif1PkAddGsAD(packet, 4,
                             (unsigned long) ((px << 4) + 0x6C00) |
                                 (unsigned long) ((py << 4) + 0x7900) << 16);

            turn += RandTbl[step];
            step++;
        }

        across = 1.0f;
        down = 0.0f;

        across = across * RandTbl2[0];
        down = down * RandTbl2[0];
        across += 0.5f;
        down += 0.5f;
        across = across * iw;
        down = down * ih;

        px = (int) across;
        py = (int) down;

        px += x;
        py += y - top;

        sceVif1PkAddGsAD(packet, 4,
                         (unsigned long) ((px << 4) + 0x6C00) |
                             (unsigned long) ((py << 4) + 0x7900) << 16);
    }

    if (this->tail_on != 0) {
        if (this->fukidashi_shape == 2) {
            x = (int) LinerInterpolation(this->grow_x,
                                         (this->tail_x + this->tail_tip_x) >> 1, this->fade);
            y = (int) LinerInterpolation(this->grow_y,
                                         (this->tail_y + this->tail_tip_y) >> 1, this->fade);
            DrawMaru(packet, x - 10, y - 10, 20, 20, top, 0x20, 0, prim);

            x = (int) LinerInterpolation(this->grow_x, this->tail_tip_x, this->fade);
            y = (int) LinerInterpolation(this->grow_y, this->tail_tip_y, this->fade);
            DrawMaru(packet, x - 5, y - 5, 10, 10, top, 0x20, 0, prim);
        } else {
            sceVif1PkAddGsAD(packet, 0, ((unsigned long) prim << 7) | 0x143);
            sceVif1PkAddGsAD(packet, 1, 0x80BFBFBF | ((unsigned long) 1 << 32));

            x = (int) LinerInterpolation(this->grow_x, this->tail_tip_x, this->fade);
            y = (int) LinerInterpolation(this->grow_y, this->tail_tip_y, this->fade);
            y -= top;
            sceVif1PkAddGsAD(packet, 4,
                             (unsigned long) ((x << 4) + 0x6C00) |
                                 (unsigned long) ((y << 4) + 0x7900) << 16);

            x = (int) LinerInterpolation(this->grow_x, this->tail_left_x, this->fade);
            y = (int) LinerInterpolation(this->grow_y, this->tail_left_y, this->fade);
            y -= top;
            sceVif1PkAddGsAD(packet, 4,
                             (unsigned long) ((x << 4) + 0x6C00) |
                                 (unsigned long) ((y << 4) + 0x7900) << 16);

            x = (int) LinerInterpolation(this->grow_x, this->tail_right_x, this->fade);
            y = (int) LinerInterpolation(this->grow_y, this->tail_right_y, this->fade);
            y -= top;
            sceVif1PkAddGsAD(packet, 4,
                             (unsigned long) ((x << 4) + 0x6C00) |
                                 (unsigned long) ((y << 4) + 0x7900) << 16);
        }
    }
}

void ClsMes::MakeFukidashi(sceVif1Packet *packet) {
    sceGsTex0 frame;
    sceGsTex0 tex0;
    sceGsZbuf zbuf;
    sceGsTest test;
    CTexture *texture;
    int row;
    int col;

    MGGetFBuffTex(&frame);

    sceVif1PkCnt(packet, 0);
    sceVif1PkOpenDirectCode(packet, 0);
    sceVif1PkOpenGifTag(packet, *(u_long128 *) &GiftagAD);
    sceVif1PkAddGsAD(packet, 0x3F, 0);

    tex0 = *(sceGsTex0 *) &TexManager.GetTexture("fukidashibase", -1)->tex0;

    unsigned int tbp = tex0.bits.tbp0;
    int tbw = tex0.bits.tbw;
    unsigned int psm = tex0.bits.psm;

    sceVif1PkAddGsAD(packet, 0x4C,
                     (unsigned long) (tbp >> 5) | (unsigned long) (u32) tbw << 16 |
                         (unsigned long) psm << 24);

    sceVif1PkCloseGifTag(packet);
    sceVif1PkCloseDirectCode(packet);
    sceVif1PkTerminate(packet);

    zbuf = mgZBuffer;
    test = mgPixelTest;

    zbuf.bits.zmsk = 1;
    MGSetGsZBUF(&zbuf);

    test.bits.ate = 0;
    test.bits.date = 0;
    test.bits.zte = 1;
    test.bits.ztst = 1;
    MGSetGsTEST(&test);

    MGFillBox(CRect_i_(0, 0, 0x2800, 0xE00), 0, 0, 0, 0);

    MGSetGsZBUF(&zbuf);
    MGSetGsTEST(&test);

    sceVif1PkCnt(packet, 0);
    sceVif1PkOpenDirectCode(packet, 0);
    sceVif1PkOpenGifTag(packet, *(u_long128 *) &GiftagAD);
    this->MakeFukidashi_sub(packet, 1);
    this->MakeFukidashi_sub(packet, 0);
    sceVif1PkAddGsAD(packet, 0x3F, 0);
    sceVif1PkCloseGifTag(packet);
    sceVif1PkCloseDirectCode(packet);
    sceVif1PkTerminate(packet);

    zbuf.bits.zmsk = 1;
    MGSetGsZBUF(&zbuf);

    test.bits.ate = 0;
    test.bits.date = 1;
    test.bits.zte = 1;
    test.bits.ztst = 1;
    test.bits.datm = 1;
    MGSetGsTEST(&test);

    texture = TexManager.GetTexture("fuki256", -1);

    for (row = 0; row < 4; row++) {
        for (col = 0; col < 5; col++) {
            Myset2DSprite(Vif1Packet, texture, CRect_i_(col * 0x80, row * 0x80, 0x80, 0x80),
                          CRect_i_(0, 0, 0x80, 0x80), 0x80, 0x80, 0x80,
                          this->edge_alpha < 0x80 ? this->edge_alpha : 0x80);
        }
    }

    sceVif1PkCnt(packet, 0);
    sceVif1PkOpenDirectCode(packet, 0);
    sceVif1PkOpenGifTag(packet, *(u_long128 *) &GiftagAD);
    sceVif1PkAddGsAD(packet, 0x3F, 0);
    sceVif1PkAddGsAD(packet, 0x4C,
                     (unsigned long) (frame.bits.tbp0 >> 5) |
                         (unsigned long) frame.bits.tbw << 16 |
                         (unsigned long) frame.bits.psm << 24);
    sceVif1PkAddGsAD(packet, 0x47, *(unsigned long *) &mgPixelTest);
    sceVif1PkAddGsAD(packet, 0x4E, *(unsigned long *) &mgZBuffer);
    sceVif1PkAddGsAD(packet, 0x42, *(unsigned long *) &mgAlpha);
    sceVif1PkCloseGifTag(packet);
    sceVif1PkCloseDirectCode(packet);
}

void SetspRGBA(spRGBA *colour, int r, int g, int b, int a) {
    colour->r = r;
    colour->g = g;
    colour->b = b;
    colour->a = a;
}

void ClsMes::DrawMesWin_sub(CTexture *texture, int dx, int dy, int frame) {
    int area[4];
    int pos[2];
    int x0;
    int y0;
    int w0;
    int h0;
    int sx0;
    int sy0;
    int top;

    area[0] = this->win_x;
    area[1] = this->win_y;
    area[2] = this->win_x + this->win_width;
    area[3] = this->win_y + this->win_height;
    pos[0] = this->grow_x;
    pos[1] = this->grow_y;
    AreaAddPos(area, pos, area);

    if (this->tail_on != 0) {
        pos[0] = this->tail_tip_x;
        pos[1] = this->tail_tip_y;
        AreaAddPos(area, pos, area);
        pos[0] = this->tail_left_x;
        pos[1] = this->tail_left_y;
        AreaAddPos(area, pos, area);
        pos[0] = this->tail_right_x;
        pos[1] = this->tail_right_y;
        AreaAddPos(area, pos, area);

        if (this->fukidashi_shape == 2) {
            pos[0] = this->tail_tip_x - 5;
            pos[1] = this->tail_tip_y - 5;
            AreaAddPos(area, pos, area);
            pos[0] = this->tail_tip_x + 5;
            pos[1] = this->tail_tip_y + 5;
            AreaAddPos(area, pos, area);
        }
    }

    w0 = area[2] - area[0];
    top = area[1];
    h0 = area[3] - top;
    x0 = (int) LinerInterpolation(this->grow_x, area[0], this->fade);
    y0 = (int) LinerInterpolation(this->grow_y, top, this->fade);
    w0 = (int) (w0 * this->fade);
    h0 = (int) (h0 * this->fade);
    sy0 = y0;
    y0 -= top;
    sx0 = x0 + dx;
    sy0 += dy;

    if (frame != 0) {
        spRGBA bright;
        spRGBA dim;
        int x1;
        int y1;
        int w;
        int h;
        int x2;
        int y2;
        int w2;
        int h2;
        int x3;
        int w1;
        int w3;
        int sy1;
        int sy2;
        int sy3;
        int h1;
        int h3;
        int ty3;
        int th1;
        int th3;

        SetspRGBA(&bright, 0x80, 0x80, 0x80, 0x80);
        SetspRGBA(&dim, 0x60, 0x60, 0x60, 0x80);

        if (MesAbsDrawOff == 0) {
            set2DSprite(Vif1Packet, texture, CRect_i_(sx0, sy0, w0, h0),
                        CRect_i_(x0, y0, w0, h0), &dim, &dim, &dim, &dim, 1);
        }

        float fx = this->win_x;
        float fy = this->win_y;
        float fw = this->win_width;
        float fh = this->win_height;

        x1 = (int) LinerInterpolation(this->grow_x, fx, this->fade);
        y1 = (int) LinerInterpolation(this->grow_y, fy, this->fade);
        w = (int) (fw * this->fade);
        h = (int) (fh * this->fade);

        float bx = this->win_x + this->win_width / 6.0f;
        float by = this->win_y + this->win_height / 6.0f;
        float bw = 2.0f * this->win_width / 3.0f;
        float bh = 2.0f * this->win_height / 3.0f;

        x2 = (int) LinerInterpolation(this->grow_x, bx, this->fade);
        y2 = (int) LinerInterpolation(this->grow_y, by, this->fade);
        w2 = (int) (bw * this->fade);
        h2 = (int) (bh * this->fade);

        x3 = x2 + w2;
        sy1 = y1;
        sy2 = y2;
        sy3 = y2 + h2;
        w1 = x2 - x1;
        w3 = x1 + w - x2 - w2;
        h1 = y2 - y1;
        h3 = y1 + h - y2 - h2;
        y1 -= top;
        y2 -= top;
        ty3 = y2 + h2;
        th1 = y2 - y1;
        th3 = y1 + h - y2 - h2;

        if (MesAbsDrawOff == 0) {
            set2DSprite(Vif1Packet, texture, CRect_i_(x1, sy1, w1, h1),
                        CRect_i_(x1, y1, w1, th1), &dim, &dim, &dim, &bright, 1);
            set2DSprite(Vif1Packet, texture, CRect_i_(x2, sy1, w2, h1),
                        CRect_i_(x2, y1, w2, th1), &dim, &dim, &bright, &bright, 1);
            set2DSprite(Vif1Packet, texture, CRect_i_(x3, sy1, w3, h1),
                        CRect_i_(x3, y1, w3, th1), &dim, &dim, &bright, &dim, 0);
            set2DSprite(Vif1Packet, texture, CRect_i_(x1, sy2, w1, h2),
                        CRect_i_(x1, y2, w1, h2), &dim, &bright, &dim, &bright, 1);
            set2DSprite(Vif1Packet, texture, CRect_i_(x2, sy2, w2, h2),
                        CRect_i_(x2, y2, w2, h2), &bright, &bright, &bright, &bright, 1);
            set2DSprite(Vif1Packet, texture, CRect_i_(x3, sy2, w3, h2),
                        CRect_i_(x3, y2, w3, h2), &bright, &dim, &bright, &dim, 1);
            set2DSprite(Vif1Packet, texture, CRect_i_(x1, sy3, w1, h3),
                        CRect_i_(x1, ty3, w1, th3), &dim, &bright, &dim, &dim, 0);
            set2DSprite(Vif1Packet, texture, CRect_i_(x2, sy3, w2, h3),
                        CRect_i_(x2, ty3, w2, th3), &bright, &bright, &dim, &dim, 1);
            set2DSprite(Vif1Packet, texture, CRect_i_(x3, sy3, w3, h3),
                        CRect_i_(x3, ty3, w3, th3), &bright, &dim, &dim, &dim, 1);
        }
    } else if (MesAbsDrawOff == 0) {
        set2DSprite(Vif1Packet, texture, CRect_i_(sx0, sy0, w0, h0), CRect_i_(x0, y0, w0, h0),
                    0, 0, 0, this->edge_alpha < 0x80 ? this->edge_alpha : 0x80);
    }
}

FUZZY_MATCH("asm/nonmatchings/clsmes", MyMenuHelpWinDraw__FiiiiiiiP8CTexture);

void MyMenuHelpWinDraw(int x, int y, int width, int height, int shade, int u, int v,
                       CTexture *texture) {
    int bar_width = width < 0x20 ? 0 : width - 0x20;
    int bar_height = height < 0x1C ? 0 : height - 0x1C;

    setbilinear(0);

    set2DSprite(Vif1Packet, texture, CRect_i_(x, y, 0x10, 0xE),
                CRect_i_(u, v, 0x10, 0xE), shade = (shade * 100) >> 7);
    set2DSprite(Vif1Packet, texture, CRect_i_(x, y + 0xE, 0x10, bar_height),
                CRect_i_(u, v + 0xE, 0x10, 0x24), shade);
    set2DSprite(Vif1Packet, texture, CRect_i_(x, bar_height + (y + 0xE), 0x10, 0xE),
                CRect_i_(u, v + 0x32, 0x10, 0xE), shade);
    set2DSprite(Vif1Packet, texture, CRect_i_(x + 0x10, y, bar_width, 0xE),
                CRect_i_(u + 0x10, v, 0x20, 0xE), shade);
    set2DSprite(Vif1Packet, texture, CRect_i_(x + 0x10, y + 0xE, bar_width, bar_height),
                CRect_i_(u + 0x10, v + 0xE, 0x20, 0x24), shade);
    set2DSprite(Vif1Packet, texture, CRect_i_(x + 0x10, bar_height + (y + 0xE), bar_width, 0xE),
                CRect_i_(u + 0x10, v + 0x32, 0x20, 0xE), shade);
    set2DSprite(Vif1Packet, texture, CRect_i_(bar_width + (x + 0x10), y, 0x10, 0xE),
                CRect_i_(u + 0x30, v, 0x10, 0xE), shade);
    set2DSprite(Vif1Packet, texture, CRect_i_(bar_width + (x + 0x10), y + 0xE, 0x10, bar_height),
                CRect_i_(u + 0x30, v + 0xE, 0x10, 0x24), shade);
    set2DSprite(Vif1Packet, texture, CRect_i_(bar_width + (x + 0x10), bar_height + (y + 0xE), 0x10, 0xE),
                CRect_i_(u + 0x30, v + 0x32, 0x10, 0xE), shade);
}

void GetPos_AbsPosSet(int x, int y, int width, int height, int win_width, int win_height,
                      int align, int *out_x, int *out_y) {
    switch (align) {
        case 1:
        case 4:
        case 7:
            if (win_width < width / 3) {
                *out_x = x + width / 6 - (win_width >> 1);
            } else {
                *out_x = x;
            }
            break;
        case 2:
        case 5:
        case 8:
            *out_x = x + (width >> 1) - (win_width >> 1);
            break;
        case 3:
        case 6:
        case 9:
            if (win_width < width / 3) {
                *out_x = x + width * 5 / 6 - (win_width >> 1);
            } else {
                *out_x = x + width - win_width;
            }
            break;
    }

    switch (align) {
        case 1:
        case 2:
        case 3:
            if (win_height < height / 3) {
                *out_y = y + height / 6 - (win_height >> 1);
            } else {
                *out_y = y;
            }
            break;
        case 4:
        case 5:
        case 6:
            *out_y = y + (height >> 1) - (win_height >> 1);
            break;
        case 7:
        case 8:
        case 9:
            if (win_height < height / 3) {
                *out_y = y + height * 5 / 6 - (win_height >> 1);
            } else {
                *out_y = y + height - win_height;
            }
            break;
    }
}

void ClsMes::DrawGaijiFont(CTexture *texture, int no, const CRect_i_ &texel,
                           const CRect_i_ &screen, int wide, int dark) {
    u8 r;
    u8 g;
    u8 b;
    u8 alpha;
    u8 clut;
    int code;
    int u;
    int v;

    code = this->win_line[no].code;

    if (code >= -0x300 && code < -0x2DF) {
        set2DSprite_Core(Vif1Packet, texture, screen, texel, 0x80, 0x80, 0x80,
                         this->edge_alpha < 0x80 ? this->edge_alpha : 0x80);
        return;
    }

    clut = this->win_line[no].clut;

    switch (FontColorTbl[clut]) {
        case 0x80BFBFBF:
            r = 0x5F;
            g = 0x5F;
            b = 0x5F;
            alpha = 0x80;
            break;

        case 0x80304045:
            r = 0x22;
            g = 0x20;
            b = 0x18;
            alpha = 0x80;
            break;

        case 0x8040BDBD:
            r = 0x5E;
            g = 0x5E;
            b = 0x20;
            alpha = 0x80;
            break;

        case 0x80BDBD40:
            r = 0x20;
            g = 0x5E;
            b = 0x5E;
            alpha = 0x80;
            break;

        case 0x8040BD40:
            r = 0x20;
            g = 0x5E;
            b = 0x20;
            alpha = 0x80;
            break;

        case 0xFF304045:
            r = 0x22;
            g = 0x20;
            b = 0x18;
            alpha = 0x80;
            break;

        case 0x8066CEE7:
            r = 0x73;
            g = 0x67;
            b = 0x33;
            alpha = 0x80;
            break;

        case 0x808F8F8F:
            r = 0x47;
            g = 0x47;
            b = 0x47;
            alpha = 0x80;
            break;

        case 0x80BF3FBF:
            r = 0x5F;
            g = 0x1F;
            b = 0x5F;
            alpha = 0x80;
            break;

        default:
            r = 0x28;
            g = 0x28;
            b = 0x20;
            alpha = 0x80;
            break;
    }

    if (clut == 0xFF) {
        if (dark != 0) {
            alpha = 0x80;
            b = 0x22;
            g = 0x22;
            r = 0x7F;
        } else {
            alpha = 0x80;
            b = 0x11;
            g = 0x11;
            r = 0x40;
        }
    }

    if (wide == 1) {
        r = r * 2;
        g = g * 2;
        b = b * 2;
    }

    set2DSprite_Core(Vif1Packet, texture, screen, texel, r, g, b,
                     this->edge_alpha < alpha ? this->edge_alpha : alpha);

    switch (this->win_line[no].code) {
        case -0x284:
        case -0x280:
        case -0x27F:
        case -0x27A:
        case -0x275:
        case -0x271:
        case -0x26C:
        case -0x268:
            u = 0xE2;
            v = 0xB4;
            break;

        case -0x283:
        case -0x279:
            u = 0xAA;
            v = 0xC8;
            break;

        case -0x27D:
        case -0x278:
        case -0x274:
        case -0x26F:
        case -0x26B:
            u = 0xF0;
            v = 0xB4;
            break;

        case -0x281:
        case -0x27C:
        case -0x277:
        case -0x273:
        case -0x26E:
        case -0x26A:
        case -0x267:
        case -0x266:
        case -0x264:
            u = 0x80;
            v = 0xC8;
            break;

        case -0x27B:
        case -0x276:
        case -0x272:
        case -0x26D:
        case -0x269:
            u = 0x9C;
            v = 0xC8;
            break;

        case -0x270:
            u = 0x8E;
            v = 0xC8;
            break;

        default:
            return;
    }

    if (this->narrow_gaiji_set != 1) {
        if (this->narrow_gaiji_set == 2) {
            u += 0x80;
        } else if (this->char_width < 0xB) {
            u += 0x80;
        }
    }

    set2DSprite_Core(Vif1Packet, texture, screen, CRect_i_(u, v, 14, 20), r, g, b,
                     this->edge_alpha < alpha ? this->edge_alpha : alpha);
}

void ClsMes::DrawMesWin(void) {
    CTexture *texture;
    int ox;
    int oy;
    int dark;
    int no;

    if (this->mes_made < 0) {
        return;
    }

    TexManager.ReloadTexture(Vif1Packet, this->tex_block);

    ox = 0;

    if (this->fukidashi != 0 && this->text_columns < 4) {
        ox = (4 - this->text_columns) * this->char_width >> 1;
    }

    oy = 0;

    if (this->fukidashi == 0 && this->centre_rows != 0) {
        oy = this->char_height * (this->rows - this->text_rows) >> 1;
    }

    if (this->fukidashi != 0) {
        this->MakeFukidashi(Vif1Packet);

        texture = TexManager.GetTexture("fukidashibase", -1);
        setbilinear(1);
        this->DrawMesWin_sub(texture, -1, -1, 0);
        this->DrawMesWin_sub(texture, 1, -1, 0);
        this->DrawMesWin_sub(texture, -1, 1, 0);
        this->DrawMesWin_sub(texture, 1, 1, 0);
        this->DrawMesWin_sub(texture, 5, 5, 0);
        this->DrawMesWin_sub(texture, 0, 0, 1);

        if (this->fade_in != 0 && this->fade < 1.0f) {
            return;
        }
    } else {
        this->fade = 1.0f;

        if (this->stay_frame != 0) {
            int px;
            int py;
            int width = this->char_width * this->text_columns + 0x20;
            int height = this->char_height * this->text_rows + 0x1C;

            if (0 < this->stay_width) {
                width = this->stay_width;
            }
            if (0 < this->stay_height) {
                height = this->stay_height;
            }

            px = this->text_x + ox - 0x10;
            py = this->text_y + oy - 0xE;

            if (0 < this->auto_pos) {
                GetPos_AbsPosSet(0x10, 0x10, 0x260, 0x1A0, width, height, this->auto_pos, &px,
                                 &py);
                this->text_x = px - ox + 0x10;
                this->text_y = py - oy + 0xE;
            }

            if (MesAbsDrawOff == 0) {
                MyMenuHelpWinDraw(px, py, width, height, 0x80, 0, 0,
                                  TexManager.GetTexture("stayframe", -1));
            }
        }
    }

    this->MyTextureMake();

    GIFTAG tag = {{0x8000, 0x10000000, 0xE, 0}};

    sceVif1PkCnt(Vif1Packet, 0);
    sceVif1PkOpenDirectCode(Vif1Packet, 0);
    sceVif1PkOpenGifTag(Vif1Packet, *(u_long128 *) &tag);
    sceVif1PkAddGsAD(Vif1Packet, 0x3F, 0);
    sceVif1PkCloseGifTag(Vif1Packet);
    sceVif1PkCloseDirectCode(Vif1Packet);

    texture = TexManager.GetTexture("fontbase", -1);

    if (this->clut == 0) {
        return;
    }

    if ((this->blink / 0x1C) % 2 != 0) {
        this->clut[100] = 0x80222280;
        dark = 0;
    } else {
        this->clut[100] = 0x804444FF;
        dark = 1;
    }

    SetClut(Vif1Packet, texture, (i *) this->clut);
    this->blink++;

    texture = TexManager.GetTexture("gaiji", -1);
    setbilinear(0);
    set2DSprite_Start(Vif1Packet, texture);

    for (no = this->text_from; no < this->text_no; no++) {
        if (MesAbsDrawOff != 0) {
            continue;
        }

        int code = this->win_line[no].code;

        if (code < -0x300 || code >= -0x263) {
            continue;
        }

        int k = code + 0x300;
        int u = GaijiDataTbl[k][GAIJI_U];

        if (code >= -0x2DF && code < -0x263) {
            if (this->narrow_gaiji_set != 1) {
                if (this->narrow_gaiji_set == 2) {
                    u += 0x80;
                } else if (this->char_width < 0xB) {
                    u += 0x80;
                }
            }
        }

        int v = GaijiDataTbl[k][GAIJI_V];
        int gw = GaijiDataTbl[k][GAIJI_WIDTH];
        int gh = GaijiDataTbl[k][GAIJI_HEIGHT];
        int dx = (this->char_width * GaijiDataTbl[k][GAIJI_CELLS] - gw) / 2;
        int dy = (this->char_height - gh) / 2;

        dx += GaijiDataTbl[k][GAIJI_X_OFF];

        if (this->narrow_gaiji != 0) {
            if (GaijiDataTbl[k][GAIJI_CODE] == -0x2BD || GaijiDataTbl[k][GAIJI_CODE] == -0x2BA) {
                dx -= 3;
            }
        }

        dy += GaijiDataTbl[k][GAIJI_Y_OFF];

        if (this->char_height == 0x14) {
            dy += 1;
        }

        int row = this->win_line[no].y / this->char_height;

        if (this->line_pos[row].x < 0 || this->line_pos[row].y < 0) {
            int sx = ox + (this->win_line[no].x + this->text_x + dx);
            int sy = oy + (this->win_line[no].y + this->text_y + dy) - 3;
            CRect_i_ screen(sx, sy, gw, gh);
            CRect_i_ texel(u, v, gw, gh);

            if (this->win_line[no].code >= -0x2DF) {
                this->Myset2DSprite_Fuchi(Vif1Packet, texture, sx, sy, gw, gh, u, v, gw, gh);
            }

            if (this->cursor_row < 0) {
                this->DrawGaijiFont(texture, no, texel, screen, 0, dark);
            } else if (this->cursor_lit == 1) {
                if (row == this->cursor_row) {
                    this->DrawGaijiFont(texture, no, texel, screen, 1, dark);
                } else {
                    this->DrawGaijiFont(texture, no, texel, screen, 0, dark);
                }
            } else {
                if (row == this->cursor_row) {
                    this->DrawGaijiFont(texture, no, texel, screen, 0, dark);
                } else {
                    this->DrawGaijiFont(texture, no, texel, screen, 1, dark);
                }
            }
        } else {
            int sx = this->win_line[no].x + this->line_pos[row].x + dx;
            int sy = this->win_line[no].y + this->line_pos[row].y + dy;
            CRect_i_ screen(sx, sy - row * this->char_height, gw, gh);
            CRect_i_ texel(u, v, gw, gh);

            if (this->win_line[no].code >= -0x2DF) {
                this->Myset2DSprite_Fuchi(Vif1Packet, texture, sx,
                                          sy - row * this->char_height, gw, gh, u, v, gw, gh);
            }

            if (this->cursor_row < 0) {
                this->DrawGaijiFont(texture, no, texel, screen, 0, dark);
            } else if (this->cursor_lit == 1) {
                if (row == this->cursor_row) {
                    this->DrawGaijiFont(texture, no, texel, screen, 1, dark);
                } else {
                    this->DrawGaijiFont(texture, no, texel, screen, 0, dark);
                }
            } else {
                if (row == this->cursor_row) {
                    this->DrawGaijiFont(texture, no, texel, screen, 0, dark);
                } else {
                    this->DrawGaijiFont(texture, no, texel, screen, 1, dark);
                }
            }
        }
    }

    set2DSprite_End(Vif1Packet, texture);

    if (this->page_arrow != 0) {
        if (this->text_no >= this->text_len && this->cursor_row < 0 || this->waiting != 0) {
            if ((this->blink >> 4) % 2 != 0) {
                texture = TexManager.GetTexture("syst04", -1);

                int sx = this->text_x + (this->char_width * this->text_columns >> 1) - 8;
                int sy = this->text_y + this->char_height * this->text_rows;

                CRect_i_ screen(sx + ox, sy + oy, 0x10, 0x10);
                CRect_i_ texel(0, 0, 0x10, 0x10);

                if (MesAbsDrawOff == 0) {
                    set2DSprite(Vif1Packet, texture, screen, texel,
                                this->edge_alpha < 0x80 ? this->edge_alpha : 0x80);
                }
            }
        }
    }

    if (this->end_mark != 0) {
        texture = TexManager.GetTexture("syst04", -1);

        int sx = this->text_x + (this->char_width * this->text_columns >> 1) - 8;
        int sy = this->text_y + this->char_height * this->text_rows;

        CRect_i_ screen(sx + ox, sy + oy, 0x10, 0x10);
        CRect_i_ texel(0, 0, 0x10, 0x10);

        if (MesAbsDrawOff == 0) {
            set2DSprite(Vif1Packet, texture, screen, texel,
                        this->edge_alpha < 0x80 ? this->edge_alpha : 0x80);
        }
    }

    if (this->cursor_row >= 0) {
        texture = TexManager.GetTexture("gaiji", -1);

        int sx = this->text_x;

        this->cursor_y = (this->cursor_y + this->char_height * this->cursor_row) / 2;

        int sy = this->cursor_y + this->text_y;

        CRect_i_ screen(sx - 0xC + ox, sy - 4 + oy, 0x20, 0x20);
        CRect_i_ texel(0x60, 0x60, 0x20, 0x20);

        if (MesAbsDrawOff == 0) {
            set2DSprite(Vif1Packet, texture, screen, texel,
                        this->edge_alpha < 0x80 ? this->edge_alpha : 0x80);
        }
    } else {
        this->cursor_y = 0;
    }
}
