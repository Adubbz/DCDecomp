#include "spritetable.hpp"

#include <libpkt.h>

#include "mglib.hpp"
#include "rect.hpp"

void CSpriteTable::DrawTable() {
    int packet_entries;
    sceVif1Packet *packet;
    int layer;
    SPRITE_TABLE *node;
    int drawn;
    sceGsAlpha alpha;
    sceGsTest test;
    sceGsZbuf zbuf;
    int x0;
    int y0;
    int x1;
    int y1;
    float q;

    packet_entries = 0;
    packet = GetVif1Packet();

    alpha = mgAlpha;

    test = mgPixelTest;
    test.bits.ate = 0;
    test.bits.date = 0;
    test.bits.zte = 1;
    test.bits.ztst = SCE_GS_ALWAYS;

    zbuf = mgZBuffer;
    zbuf.bits.zmsk = 1;

    sceVif1PkCnt(packet, 0);
    sceVif1PkOpenDirectCode(packet, 0);
    sceVif1PkOpenGifTag(packet, *(u_long128 *) &GiftagAD);
    sceVif1PkAddGsAD(packet, SCE_GS_TEXFLUSH, 0);
    sceVif1PkAddGsAD(packet, SCE_GS_ALPHA_1, *(u_long *) &alpha);
    sceVif1PkAddGsAD(packet, SCE_GS_TEST_1, *(u_long *) &test);
    sceVif1PkAddGsAD(packet, SCE_GS_ZBUF_1, *(u_long *) &zbuf);
    sceVif1PkAddGsAD(packet, SCE_GS_TEX1_1, 1);
    sceVif1PkAddGsAD(packet, SCE_GS_PRIM,
                     SCE_GS_SET_PRIM(SCE_GS_PRIM_SPRITE, 0, 1, 0, 1, 0, 1, 0, 0));

    drawn = 0;
    for (layer = list_count - 1; layer >= 0; layer--) {
        node = heads[layer];
        while (node != tails[layer]) {
            q = 1.0f;
            sceVif1PkAddGsAD(packet, SCE_GS_RGBAQ,
                             SCE_GS_SET_RGBAQ(node->red, node->green, node->blue, node->alpha,
                                              *(u_int *) &q));
            sceVif1PkAddGsAD(packet, SCE_GS_TEX0_1, node->tex0);

            x0 = (node->x << 4) + 27648;
            y0 = ((node->y << 4) >> 1) + GS_Y_OFFSET;
            x1 = ((node->x + node->width) << 4) + 27647;
            y1 = (((node->y + node->height) << 4) >> 1) + (GS_Y_OFFSET - 1);

            sceVif1PkAddGsAD(packet, SCE_GS_UV, SCE_GS_SET_UV(node->u << 4, node->v << 4));
            sceVif1PkAddGsAD(packet, SCE_GS_XYZF3, SCE_GS_SET_XYZF2(x0, y0, 0, 0));
            sceVif1PkAddGsAD(packet, SCE_GS_UV,
                             SCE_GS_SET_UV((node->u + node->u_width) << 4,
                                           (node->v + node->v_height) << 4));
            sceVif1PkAddGsAD(packet, SCE_GS_XYZF2, SCE_GS_SET_XYZF2(x1, y1, 0, 0));
            sceVif1PkAddGsAD(packet, SCE_GS_TEXFLUSH, 0);

            node = node->next;
            packet_entries++;
            drawn++;
            if (packet_entries > 128) {
                packet_entries = 0;
                sceVif1PkCloseGifTag(packet);
                sceVif1PkCloseDirectCode(packet);
                sceVif1PkCnt(packet, 0);
                sceVif1PkOpenDirectCode(packet, 0);
                sceVif1PkOpenGifTag(packet, *(u_long128 *) &GiftagAD);
                sceVif1PkAddGsAD(packet, SCE_GS_PRIM,
                                 SCE_GS_SET_PRIM(SCE_GS_PRIM_SPRITE, 0, 1, 0, 1, 0, 1, 0, 0));
            }
        }
    }

    sceVif1PkAddGsAD(packet, SCE_GS_TEXFLUSH, 0);
    sceVif1PkAddGsAD(packet, SCE_GS_ALPHA_1, *(u_long *) &mgAlpha);
    sceVif1PkAddGsAD(packet, SCE_GS_TEST_1, *(u_long *) &mgPixelTest);
    sceVif1PkAddGsAD(packet, SCE_GS_ZBUF_1, *(u_long *) &mgZBuffer);
    sceVif1PkCloseGifTag(packet);
    sceVif1PkCloseDirectCode(packet);
}

void CSpriteTable::AddTable(int x, int y, MG_SPRITE *sprite, int layer, int align_flags) {
    if (layer < 0) {
        layer = 0;
    }
    if (layer >= list_count) {
        layer = list_count - 1;
    }

    SPRITE_TABLE *node;
    SPRITE_TABLE *(&tail_entries)[16] = tails;
    SPRITE_TABLE **tail = &tail_entries[layer];
    node = *tail;
    if (node == NULL) {
        return;
    }

    node->tex0 = sprite->tex0;
    node->x = x;
    node->y = y;
    node->width = sprite->source.width;
    node->height = sprite->source.height;
#ifdef PAL
    if (node->height == 448) {
        node->height = 480;
    }
#endif
    node->u = sprite->source.x;
    node->v = sprite->source.y;
    node->u_width = sprite->source.width;
    node->v_height = sprite->source.height;
    node->red = sprite->red;
    node->green = sprite->green;
    node->blue = sprite->blue;
    node->alpha = sprite->alpha;

    if (align_flags & 1) {
        s16 width = node->width;
        node->x -= width;
    }
    if (align_flags & 2) {
        s16 height = node->height;
        node->y -= height;
    }
    if (align_flags & 4) {
        node->x -= (s16) (node->width >> 1);
    }
    if (align_flags & 8) {
        node->y -= (s16) (node->height >> 1);
    }

    node->next = GetNext();
    *tail = node->next;
}

void CSpriteTable::AddTable(int x, int y, sceGsTex0 *tex0, RECT *source, int layer, int align_flags) {
    union {
        MG_SPRITE sprite;     /**< Sprite handed to the other AddTable. */
        u_long128 padding[3]; /**< Pads the sprite's stack slot to 48 bytes. */
    } sprite_buffer;

    *(sceGsTex0 *) &sprite_buffer.sprite.tex0 = *tex0;
    sprite_buffer.sprite.source = *source;
    sprite_buffer.sprite.red = 128;
    sprite_buffer.sprite.green = 128;
    sprite_buffer.sprite.blue = 128;
    sprite_buffer.sprite.alpha = 128;
    AddTable(x, y, &sprite_buffer.sprite, layer, align_flags);
}

void CSpriteTable::Initialize(SPRITE_TABLE *new_pool, int entry_count, int layer_count) {
    list_count = layer_count;
    if (list_count > 16) {
        list_count = 16;
    }
    pool = new_pool;
    pool_count = entry_count;
    end = new_pool + entry_count;
    ClearPointer();
}

SPRITE_TABLE *CSpriteTable::GetNext() {
    SPRITE_TABLE *next = NULL;

    if ((u_int) current < (u_int) end) {
        next = current;
        current++;
    }
    return next;
}

void CSpriteTable::ClearPointer() {
    current = pool;
    for (int layer = 0; layer < list_count; layer++) {
        heads[layer] = GetNext();
        heads[layer]->next = NULL;
        tails[layer] = heads[layer];
    }
}
