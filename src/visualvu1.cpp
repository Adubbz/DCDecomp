#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 185

#include <cstring>

#include "mdt.hpp"
#include "texture.hpp"
#include "tim2.hpp"
#include "visual.hpp"

void SetTextureInfo(CTexture *tex, char *name, TM2_head *head) {
    TM2_picture *pic = (TM2_picture *) ((u_char *) head + 16);
    int width = head->image_width;
    int height = head->image_height;
    int bpp;
    int psm = 0;
    u_char *clut;
    u_char *image;
    int tw;
    int th;
    int t;
    int k;
    int tbw;

    switch (head->image_type) {
        case 1:
            psm = 2;
            bpp = 2;
            break;
        case 2:
            psm = 1;
            bpp = 3;
            break;
        case 3:
            bpp = 4;
            break;
        case 4:
            psm = 20;
            bpp = 0;
            break;
        case 5:
            psm = 19;
            bpp = 1;
            break;
    }

    clut = 0;
    image = (u_char *) pic + pic->header_size;
    if (bpp < 2)
        clut = image + pic->image_size;

    u_char *mip[4] = {0, 0, 0, 0};

    if (pic->mipmap_count > 1) {
        u_char *next = image + pic->mipmap_size[0];
        for (int m = 1; m < pic->mipmap_count; m++) {
            mip[m] = next;
            next += pic->mipmap_size[m];
        }
    }

    strcpy(tex->name, name);
    tex->width = width;
    tex->height = height;
    tex->bpp = bpp;
    tex->image[0] = (u_int *) image;
    for (int m = 1; m < 4; m++) {
        tex->image[m] = (u_int *) mip[m];
    }
    tex->clut = (u_int *) clut;

    tw = 0;
    th = 0;
    t = width;
    while (t >= 2) {
        t >>= 1;
        tw++;
    }
    for (t = 1, k = 0; k < tw; k++)
        t <<= 1;
    if (width != t)
        tw++;
    t = height;
    while (t >= 2) {
        t >>= 1;
        th++;
    }
    for (t = 1, k = 0; k < th; k++)
        t <<= 1;
    if (height != t)
        th++;

    tbw = width >> 6;
    if (tbw <= 0)
        tbw = 1;

    if (tex->bpp > 1) {
        tex->tex0 = SCE_GS_SET_TEX0(0, tbw, psm, tw, th, 1, 0, 0, 0, 0, 0, 0);
    } else {
        tex->tex0 = SCE_GS_SET_TEX0(0, tbw, psm, tw, th, 1, 0, 0, 0, 0, 0, 1);
    }
}

void SetTextureInfo(CTexture *tex, char *name, u_char *buffer) {
    u_int i;
    IMG_head *head = (IMG_head *) buffer;
    IMG_entry *entry = (IMG_entry *) (head + 1);

    for (i = 0; i < head->pictures; i++, entry++) {
        if (name != 0 && name[0] != 0) {
            if (strcmp(entry->name, name) != 0)
                continue;
        }
        SetTextureInfo(tex, entry->name, (TM2_head *) ((u_char *) head + entry->offset));
    }
}

/**
 * Clears the visual's draw flags.
 *
 * @mangled Initialize__7CVisualFv
 * @address 0x134B50
 * @size 0x10
 */
INCLUDE_ASM("asm/nonmatchings/visualvu1", Initialize__7CVisualFv);
/**
 * Constructs a visual and clears it.
 *
 * @mangled __ct__7CVisualFv
 * @address 0x134B60
 * @size 0x44
 */
INCLUDE_ASM("asm/nonmatchings/visualvu1", __ct__7CVisualFv);

int CVisualVu1::RemakeData(unsigned int *data) {
    return 0;
}

/**
 * Draws the visual into a VIF packet.
 *
 * @mangled DrawVu1__10CVisualVu1FP13sceVif1PacketPA4_fP10RenderInfo11VU1_PROGRAMP1ii
 * @address 0x134BC0
 * @size 0xC4
 */
INCLUDE_ASM("asm/nonmatchings/visualvu1", DrawVu1__10CVisualVu1FP13sceVif1PacketPA4_fP10RenderInfo11VU1_PROGRAMP1ii);

/**
 * Writes the shadow draw packet and its transform matrix.
 */
static int SetShadowData(u_int *packet, float (*matrix)[4]) {
    packet[0] = 0;
    packet[1] = 0;
    packet[2] = 0;
    packet[3] = 0x6C080029;
    packet[4] = 0x8001;
    packet[5] = 0x102E8000;
    packet[6] = 0xE;
    packet[7] = 0;
    packet[8] = 0x68;
    packet[9] = 0x80;
    packet[10] = 0x42;
    packet[11] = 0;
    packet[12] = 0x8001;
    packet[13] = 0x102E8000;
    packet[14] = 0xE;
    packet[15] = 0;
    packet[16] = 0x62;
    packet[17] = 0x80;
    packet[18] = 0x42;
    packet[19] = 0;
    ((u_long128 *) packet)[5] = ((u_long128 *) matrix)[0];
    ((u_long128 *) packet)[6] = ((u_long128 *) matrix)[1];
    ((u_long128 *) packet)[7] = ((u_long128 *) matrix)[2];
    ((u_long128 *) packet)[8] = ((u_long128 *) matrix)[3];
    return 0x24;
}

INCLUDE_ASM("asm/nonmatchings/visualvu1", SetMaterial__FPUiP12MDT_MATERIAL);
INCLUDE_ASM("asm/nonmatchings/visualvu1", SetTEX0__FPUiUlUl);
/**
 * Clears the vector-unit visual's packet pointers and sizes.
 *
 * @mangled Initialize__10CVisualVu1Fv
 * @address 0x134EC0
 * @size 0x3C
 */
INCLUDE_ASM("asm/nonmatchings/visualvu1", Initialize__10CVisualVu1Fv);
/**
 * Constructs a vector-unit visual and clears it.
 *
 * @mangled __ct__10CVisualVu1Fv
 * @address 0x134F00
 * @size 0x50
 */
INCLUDE_ASM("asm/nonmatchings/visualvu1", __ct__10CVisualVu1Fv);
/**
 * Points the visual at the model data it draws from.
 *
 * @mangled SetMDTDataAddress__13CVisualMDTVu1FPUi
 * @address 0x134F50
 * @size 0xC
 */
INCLUDE_ASM("asm/nonmatchings/visualvu1", SetMDTDataAddress__13CVisualMDTVu1FPUi);
/**
 * Gives the model data the visual draws from.
 *
 * @mangled GetMDTDataAddress__13CVisualMDTVu1Fv
 * @address 0x134F60
 * @size 0xC
 */
INCLUDE_ASM("asm/nonmatchings/visualvu1", GetMDTDataAddress__13CVisualMDTVu1Fv);
/**
 * Clears the model visual's data pointer and packet.
 *
 * @mangled Initialize__13CVisualMDTVu1Fv
 * @address 0x134F70
 * @size 0x3C
 */
INCLUDE_ASM("asm/nonmatchings/visualvu1", Initialize__13CVisualMDTVu1Fv);
/**
 * Constructs a model visual and clears it.
 *
 * @mangled __ct__13CVisualMDTVu1Fv
 * @address 0x134FB0
 * @size 0x48
 */
INCLUDE_ASM("asm/nonmatchings/visualvu1", __ct__13CVisualMDTVu1Fv);
/**
 * Draws the visual into a packet through the vector unit.
 *
 * @mangled DrawVu1__10CVisualVu1FPUiPA4_fP10RenderInfo11VU1_PROGRAMP1ii
 * @address 0x135000
 * @size 0x964
 */
INCLUDE_ASM("asm/nonmatchings/visualvu1", DrawVu1__10CVisualVu1FPUiPA4_fP10RenderInfo11VU1_PROGRAMP1ii);
/**
 * Writes one vector-unit upload header and gives back its length in words.
 *
 * @mangled SetVuData__FiP1PUiP1P1P1P1i
 * @address 0x135970
 * @size 0x130
 */
INCLUDE_ASM("asm/nonmatchings/visualvu1", SetVuData__FiP1PUiP1P1P1P1i);
INCLUDE_ASM("asm/nonmatchings/visualvu1", CreateVUdataFromMDT__10CVisualVu1FPUiPUiii);
INCLUDE_ASM("asm/nonmatchings/visualvu1", CreateVUdataFromMDTRemake__10CVisualVu1FPUiPUii);
/**
 * Draws the model, rebuilding its packet where the data has changed.
 *
 * @mangled DrawVu1__13CVisualMDTVu1FPUiPA4_fP10RenderInfo11VU1_PROGRAMP1ii
 * @address 0x1360E0
 * @size 0x120
 */
INCLUDE_ASM("asm/nonmatchings/visualvu1", DrawVu1__13CVisualMDTVu1FPUiPA4_fP10RenderInfo11VU1_PROGRAMP1ii);
/**
 * Draws the model into a VIF packet, choosing the buffer the frame is using.
 *
 * @mangled DrawVu1__13CVisualMDTVu1FP13sceVif1PacketPA4_fP10RenderInfo11VU1_PROGRAMP1ii
 * @address 0x136200
 * @size 0x34
 */
INCLUDE_ASM("asm/nonmatchings/visualvu1", DrawVu1__13CVisualMDTVu1FP13sceVif1PacketPA4_fP10RenderInfo11VU1_PROGRAMP1ii);
INCLUDE_ASM("asm/nonmatchings/visualvu1", RemakeData__13CVisualMDTVu1FPUi);
