#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 185

#include <cstring>

#include "dataalloc.hpp"
#include "mdt.hpp"
#include "mglib.hpp"
#include "texture.hpp"
#include "tim2.hpp"
#include "visual.hpp"

extern CDataAlloc2<1> *ActiveData;

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
#ifdef NON_MATCHING
void CVisual::Initialize(void) {
    unk_00 = 0;
    unk_04 = 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/visualvu1", Initialize__7CVisualFv);
#endif
/**
 * Constructs a visual and clears it.
 *
 * @mangled __ct__7CVisualFv
 * @address 0x134B60
 * @size 0x44
 */
#ifdef NON_MATCHING
CVisual::CVisual(void) {
    Initialize();
}
#else
INCLUDE_ASM("asm/nonmatchings/visualvu1", __ct__7CVisualFv);
#endif

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

int SetMaterial(u_int *packet, MDT_MATERIAL *material) {
    if (material == NULL) {
        return 0x14;
    }

    packet[0] = 0;
    packet[1] = 0;
    packet[2] = 0;
    packet[3] = 0x6C040025;
    u_int last_row[4] = {3, 0, 0, 0};
    ((u_long128 *) packet)[1] = *(u_long128 *) material->unk_00;
    ((u_long128 *) packet)[2] = *(u_long128 *) material->unk_10;
    ((u_long128 *) packet)[3] = *(u_long128 *) material->unk_20;
    ((u_long128 *) packet)[4] = *(u_long128 *) last_row;
    return 0x14;
}

int SetTEX0(u_int *packet, u_long tex0, u_long tex1) {
    packet[0] = 0;
    packet[1] = 0;
    packet[2] = 0;

    if (tex1 == 0) {
        tex1 = *(u_long *) &mgTEX1Env;
    }

    if (tex1 != 0) {
        packet[3] = 0x50000003;
        packet[4] = 0x8002;
        packet[5] = 0x10000000;
        packet[6] = 0xE;
        packet[7] = 0;
        packet += 8;
    } else {
        packet[3] = 0x50000002;
        packet[4] = 0x8001;
        packet[5] = 0x10000000;
        packet[6] = 0xE;
        packet[7] = 0;
        packet += 8;
    }

    packet[0] = (u_int) tex0;
    packet[1] = (u_int) ((tex0 >> 32) & 0xFFFFFFFF);
    packet[2] = SCE_GS_TEX0_1;
    packet[3] = 0;

    if (tex1 != 0) {
        packet[4] = (u_int) tex1;
        packet[5] = (u_int) ((tex1 >> 32) & 0xFFFFFFFF);
        packet[6] = SCE_GS_TEX1_1;
        packet[7] = 0;
        return 0x10;
    }

    return 0xC;
}
/**
 * Clears the vector-unit visual's packet pointers and sizes.
 *
 * @mangled Initialize__10CVisualVu1Fv
 * @address 0x134EC0
 * @size 0x3C
 */
#ifdef NON_MATCHING
void CVisualVu1::Initialize(void) {
    CVisual::Initialize();
    unk_04 = 0;
    vu_size = 0;
    unk_00 = 0;
    vu_data = NULL;
}
#else
INCLUDE_ASM("asm/nonmatchings/visualvu1", Initialize__10CVisualVu1Fv);
#endif
/**
 * Constructs a vector-unit visual and clears it.
 *
 * @mangled __ct__10CVisualVu1Fv
 * @address 0x134F00
 * @size 0x50
 */
#ifdef NON_MATCHING
CVisualVu1::CVisualVu1(void) {
    Initialize();
}
#else
INCLUDE_ASM("asm/nonmatchings/visualvu1", __ct__10CVisualVu1Fv);
#endif
/**
 * Points the visual at the model data it draws from.
 *
 * @mangled SetMDTDataAddress__13CVisualMDTVu1FPUi
 * @address 0x134F50
 * @size 0xC
 */
void CVisualMDTVu1::SetMDTDataAddress(u_int *data) {
    this->data = data;
}
/**
 * Gives the model data the visual draws from.
 *
 * @mangled GetMDTDataAddress__13CVisualMDTVu1Fv
 * @address 0x134F60
 * @size 0xC
 */
u_int *CVisualMDTVu1::GetMDTDataAddress(void) {
    return data;
}
/**
 * Clears the model visual's data pointer and packet.
 *
 * @mangled Initialize__13CVisualMDTVu1Fv
 * @address 0x134F70
 * @size 0x3C
 */
#ifdef NON_MATCHING
void CVisualMDTVu1::Initialize(void) {
    CVisualVu1::Initialize();
    unk_00 = 0;
    data = NULL;
    vu_data_buffer[1] = NULL;
    vu_data_buffer[0] = NULL;
}
#else
INCLUDE_ASM("asm/nonmatchings/visualvu1", Initialize__13CVisualMDTVu1Fv);
#endif
/**
 * Constructs a model visual and clears it.
 *
 * @mangled __ct__13CVisualMDTVu1Fv
 * @address 0x134FB0
 * @size 0x48
 */
CVisualMDTVu1::CVisualMDTVu1(void) {
    CVisualMDTVu1::Initialize();
}
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
 * Draws the model, from a copy of this frame's block when the visual asks for one.
 *
 * @mangled DrawVu1__13CVisualMDTVu1FPUiPA4_fP10RenderInfo11VU1_PROGRAMP1ii
 * @address 0x1360E0
 * @size 0x120
 */
int CVisualMDTVu1::DrawVu1(u_int *packet, float (*matrix)[4], RenderInfo *info,
                           VU1_PROGRAM program, u_long128 *draw_state, int unknown1, int unknown2) {
    int result;

    result = 0;
    vu_data = vu_data_buffer[DBuffID];
    if (unk_00 != 0) {
        vu_data = (u_int *) ActiveData->Alloc64(vu_size);
        memcpy(vu_data, vu_data_buffer[DBuffID], vu_size * 16);
    }
    result += CVisualVu1::DrawVu1(packet, matrix, info, program, draw_state, unknown1, unknown2);
    vu_data = vu_data_buffer[DBuffID];
    return result;
}
/**
 * Draws the model into a VIF packet, choosing the buffer the frame is using.
 *
 * @mangled DrawVu1__13CVisualMDTVu1FP13sceVif1PacketPA4_fP10RenderInfo11VU1_PROGRAMP1ii
 * @address 0x136200
 * @size 0x34
 */
int CVisualMDTVu1::DrawVu1(sceVif1Packet *packet, float (*matrix)[4], RenderInfo *info,
                           VU1_PROGRAM program, u_long128 *draw_state, int unknown1, int unknown2) {
    vu_data = vu_data_buffer[DBuffID];
    return CVisualVu1::DrawVu1(packet, matrix, info, program, draw_state, unknown1, unknown2);
}

int CVisualMDTVu1::RemakeData(u_int *data) {
    if (this->data == NULL) {
        return 0;
    }
    return CreateVUdataFromMDTRemake(vu_data_buffer[DBuffID], this->data, 1);
}
