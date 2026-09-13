#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 230

#include "dispctrl.hpp"

#include <cstring>

#include "bound.hpp"
#include "debugfont.hpp"
#include "mglib.hpp"
#include "rect.hpp"
#include "snd.hpp"
#include "texture.hpp"

/** Stores the fixed header at the front of a PTS archive. */
struct PTS_HEADER {
    int unk_00;
    int count; /**< Number of file records in the archive. */
    int unk_08[2];
};

/** Stores one named file record in a PTS archive. */
struct PTS_ENTRY {
    char name[16]; /**< Null-terminated file name. */
    int offset;    /**< Byte offset of the file from the archive start. */
    int unk_14[7];
};

int CBound::Sizeof() {
    return sizeof(CBound);
}

void openGiftag(sceVif1Packet *packet) {
    sceVif1PkCnt(packet, 0);
    sceVif1PkOpenDirectCode(packet, 0);
    sceVif1PkOpenGifTag(packet, *reinterpret_cast<u_long128 *>(&GiftagAD));
}

/**
 * Closes the GIF tag and the direct code that openGiftag began.
 *
 * @mangled closeGiftag__FP13sceVif1Packet
 * @address 0x13DF00
 * @size 0x38
 */
void closeGiftag(sceVif1Packet *packet) {
    sceVif1PkCloseGifTag(packet);
    sceVif1PkCloseDirectCode(packet);
}

void CDebugFont::Draw() {
    CTexture *tex;
    int draw_x;
    int draw_y;
    int draw_width;
    int draw_height;
    char *text_pos;
    unsigned int font_tbp;
    unsigned int font_tbw;
    unsigned int dest_tbp;
    unsigned int dest_tbw;
    sceGsTex0 font;
    sceGsTex0 dest;
    sceGsTest test;
    sceGsZbuf zbuf;
    sceGsTex0 frame;
    float q;
    int pen_x;
    int pen_y;
    CRect_i_ dst;
    CRect_i_ src;
    u_long y1;
    u_long x1;
    int character;
    int index;
    int column;
    int row;

    draw_x = this->x;
    draw_y = this->y;
    draw_width = this->w;
    draw_height = this->h;
    text_pos = this->text;

    tex = TexManager.GetTexture("ankfnt24", -1);
    font = *reinterpret_cast<sceGsTex0 *>(&tex->tex0);
    font_tbp = font.TBP0;
    font_tbw = font.TBW;

    tex = TexManager.GetTexture(this->texture, -1);
    dest = *reinterpret_cast<sceGsTex0 *>(&tex->tex0);
    dest_tbp = dest.TBP0;
    dest_tbw = dest.TBW;

    openGiftag(Vif1Packet);

    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEXFLUSH, 0);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEX0_1, *reinterpret_cast<u_long *>(&dest));
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_FRAME_1,
                     SCE_GS_SET_FRAME(dest_tbp >> 5, dest_tbw, dest.PSM, 0));

    mgTexa.AEM = 1;
    mgTexa.TA0 = static_cast<u_char>(this->alpha);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEXA, *reinterpret_cast<u_long *>(&mgTexa));

    test = mgPixelTest;
    test.bits.ate = 0;
    test.bits.zte = 1;
    test.bits.ztst = SCE_GS_ALWAYS;
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEST_1, *reinterpret_cast<u_long *>(&test));

    zbuf = mgZBuffer;
    zbuf.bits.zmsk = 1;
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_ZBUF_1, *reinterpret_cast<u_long *>(&zbuf));

    q = 1.0f;
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_PRIM, 4);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_RGBAQ,
                     SCE_GS_SET_RGBAQ(1, 1, 1, 0x80, *reinterpret_cast<u_int *>(&q)));

    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_XYZ2, 0x79006C00);
    x1 = (draw_width << 4) + 0x6C00;
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_XYZ2, x1 | 0x79000000);
    y1 = static_cast<u_long>((draw_height << 4) + 0x7900) << 16;
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_XYZ2, y1 | 0x6C00);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_XYZ2, x1 | y1);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEXFLUSH, 0);

    MGGetFBuffTex(&frame);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_FRAME_1,
                     SCE_GS_SET_FRAME(frame.TBP0 >> 5, frame.TBW, frame.PSM, 0));
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEST_1, *reinterpret_cast<u_long *>(&mgPixelTest));
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_ZBUF_1, *reinterpret_cast<u_long *>(&mgZBuffer));

    pen_x = 0;
    pen_y = 0;
    while ((character = *text_pos) != 0) {
        if (character == 0x20) {
            pen_x += 8;
            text_pos++;
            continue;
        }
        if (character == 0x0A) {
            pen_y += 16;
            pen_x = 0;
            text_pos++;
            continue;
        }

        index = static_cast<u_char>(*reinterpret_cast<u_char *>(text_pos) - 0x21);
        column = index % 16;
        row = index >> 4;

        sceVif1PkAddGsAD(Vif1Packet, SCE_GS_BITBLTBUF,
                         SCE_GS_SET_BITBLTBUF(font_tbp, font_tbw, SCE_GS_PSMCT24, dest_tbp,
                                              dest_tbw, SCE_GS_PSMCT24));
        sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TRXPOS,
                         SCE_GS_SET_TRXPOS(column * 8, row * 16, pen_x, pen_y, 0));
        sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TRXREG, SCE_GS_SET_TRXREG(8, 16));
        sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TRXDIR, SCE_GS_SET_TRXDIR(SCE_GS_LOCAL_LOCAL));

        pen_x += 8;
        text_pos++;
    }

    this->len = 0;
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEXFLUSH, 0);
    closeGiftag(Vif1Packet);

    src.x = 0;
    src.y = 0;
    src.width = draw_width;
    src.height = draw_height;
    dst.x = draw_x;
    dst.y = draw_y;
    dst.width = draw_width - 1;
    dst.height = draw_height - 1;
    tex = TexManager.GetTexture(this->texture, -1);
    set2DSprite(Vif1Packet, tex, dst, src, 0x40);
}

u_int *SearchPTS(u_int *archive, char *name) {
    int i;
    PTS_HEADER *header;
    PTS_ENTRY *entry;
    char *base;
    char c;

    header = reinterpret_cast<PTS_HEADER *>(archive);
    if (header == 0) {
        return 0;
    }
    entry = reinterpret_cast<PTS_ENTRY *>(header + 1);
    base = name;
    while ((c = *name) != 0) {
        if (c == '/') {
            base = name + 1;
        }
        name++;
    }
    for (i = 0; i < header->count; i++, entry++) {
        if (strcmp(base, entry->name) == 0) {
            return reinterpret_cast<u_int *>(reinterpret_cast<char *>(header) + entry->offset);
        }
    }
    return 0;
}

u_int *SearchPTS(u_int *archive, int index) {
    PTS_HEADER *header = reinterpret_cast<PTS_HEADER *>(archive);
    if (header == 0) {
        return 0;
    }
    if (index >= header->count) {
        return 0;
    }
    int offset = *reinterpret_cast<int *>(reinterpret_cast<char *>(archive) + index * 0x30 + 0x20);
    return reinterpret_cast<u_int *>(reinterpret_cast<char *>(archive) + offset);
}

void CDispCtrl::FadeOutStart(float speed) {
    this->speed = speed;
    rate = 0.0f;
    mode = 1;
}

void CDispCtrl::FadeInStart(float speed) {
    this->speed = speed;
    rate = 128.0f;
    mode = 2;
}

void CDispCtrl::FadeInit(float rate) {
    this->rate = rate;
    mode = -1;
}

float CDispCtrl::GetRate(void) {
    return rate;
}

float CDispCtrl::FadeOut(sceVif1Packet *packet) {
    if (mode != 1) {
        return rate;
    }
    if (rate == 0.0f && speed == 0.0f) {
        return rate;
    }

    rate += speed;
    if (rate > 128.0f) {
        rate = 128.0f;
    }

    for (s32 x = 0; x < 640; x += 64) {
        for (s32 y = 0; y < 224; y += 32) {
            CRect_i_ rect;
            rect.x = x * 16;
            rect.y = y * 16;
            rect.width = 1024;
            rect.height = 512;
            MGFillBox(rect, 0, 0, 0, static_cast<u8>(rate));
        }
    }

    if (rate >= 128.0f) {
        rate = 128.0f;
        speed = 0.0f;
    }
    return rate;
}

float CDispCtrl::FadeIn(sceVif1Packet *packet) {
    if (mode != 2) {
        return rate;
    }
    if (rate == 0.0f && speed == 0.0f) {
        return rate;
    }

    rate -= speed;
    if (rate < 0.0f) {
        rate = 0.0f;
    }

    for (s32 x = 0; x < 640; x += 64) {
        for (s32 y = 0; y < 224; y += 32) {
            CRect_i_ rect;
            rect.x = x * 16;
            rect.y = y * 16;
            rect.width = 1024;
            rect.height = 512;
            MGFillBox(rect, 0, 0, 0, static_cast<u8>(rate));
        }
    }

    if (rate <= 0.0f) {
        rate = 0.0f;
        speed = 0.0f;
    }
    return rate;
}
