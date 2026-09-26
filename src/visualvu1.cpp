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
#ifdef NON_MATCHING // draft includes
#include <cmath>
#include <libpkt.h>
#include "mathutil.hpp"
#include "renderinfo.hpp"
#endif

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
void CVisual::Initialize(void) {
    unk_00 = 0;
    unk_04 = 0;
}
/**
 * Constructs a visual and clears it.
 *
 * @mangled __ct__7CVisualFv
 * @address 0x134B60
 * @size 0x44
 */
CVisual::CVisual(void) {
    Initialize();
}

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
int CVisualVu1::DrawVu1(sceVif1Packet *packet, float (*matrix)[4], RenderInfo *info,
                        VU1_PROGRAM program, u_long128 *draw_state, int unknown1, int unknown2) {
    sceVif1PkTerminate(packet);
    int size;
    sceVif1PkReserve(packet, size = CVisualVu1::DrawVu1((u_int *) packet->pCurrent, matrix, info,
                                                        program, draw_state, unknown1, unknown2));
    return size;
}

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
void CVisualVu1::Initialize(void) {
    CVisual::Initialize();
    vu_data = NULL;
    vu_size = 0;
    unk_00 = 0;
    unk_04 = 0;
}
/**
 * Constructs a vector-unit visual and clears it.
 *
 * @mangled __ct__10CVisualVu1Fv
 * @address 0x134F00
 * @size 0x50
 */
CVisualVu1::CVisualVu1(void) {
    Initialize();
}
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
void CVisualMDTVu1::Initialize(void) {
    CVisualVu1::Initialize();
    unk_00 = 0;
    data = NULL;
    vu_data_buffer[1] = NULL;
    vu_data_buffer[0] = NULL;
}
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
#ifdef NON_MATCHING
/* One over the length of the first three components of a vector. */
static float InverseLength(float *vector) {
    return 1.0f / sqrtf(vector[0] * vector[0] + vector[1] * vector[1] + vector[2] * vector[2]);
}

int CVisualVu1::DrawVu1(u_int *packet, float (*matrix)[4], RenderInfo *info, VU1_PROGRAM program,
                        u_long128 *draw_state, int unknown1, int unknown2) {
    sceVu0FVECTOR shadow_point;
    sceVu0FVECTOR shadow_normal;
    sceVu0FMATRIX shadow_matrix;
    sceVu0FMATRIX screen_matrix;
    sceVu0FMATRIX normal_matrix;
    sceVu0FVECTOR eye;
    sceVu0FMATRIX inverse;
    sceVu0FMATRIX clip_matrix;
    u_int *start;
    u_int *header;
    u_int *p;
    int lighting;
    int shadow_fog;

    if (vu_data == NULL || vu_size == 0) {
        return 0;
    }
    sceVu0CopyVector(shadow_point, info->shadow_point);
    sceVu0CopyVector(shadow_normal, info->shadow_normal);
    if (program == 6 || program == 4 || program == 0) {
        MulMatrix(screen_matrix, info->view_screen, matrix);
    } else {
        MulMatrix(screen_matrix, info->view_scaled, matrix);
    }
    start = packet;
    p = packet;
    *p++ = 0x10000000;
    *p++ = 0;
    *p++ = 0;
    *p++ = 0;
    header = p;
    *p++ = 0;
    *p++ = 0;
    *p++ = 0;
    *p++ = 0x50000004;
    *p++ = 0x8003;
    *p++ = 0x10000000;
    *p++ = 0xE;
    *p++ = 0;
    *p++ = 0;
    *p++ = 0;
    *p++ = 0x1A;
    *p++ = 0;
    lighting = 0;
    if (info->unk_320 == 0 && info->unk_340 == 0) {
        lighting = 1;
    }
    shadow_fog = info->unk_324 != 0;
    if (shadow_fog) {
        shadow_fog = info->unk_320 == 0;
    }
    *p++ = ((program == 15) << 8) | ((info->unk_320 == 0) << 3) | (shadow_fog << 5) | 0x40 |
           (lighting << 4);
    *p++ = 0;
    *p++ = 0x1B;
    *p++ = 0;
    *p++ = info->fog_red | (info->fog_green << 8) | (info->fog_blue << 16);
    *p++ = 0;
    *p++ = 0x3D;
    *p++ = 0;
    *p++ = 0;
    *p++ = 0x0300003C;
    *p++ = 0x020000AA;
    u_int *unpack = p;
    *p++ = 0;
    *p++ = program * 2;
    *p++ = info->unk_33C;
    *p++ = info->unk_310;
    *p++ = 0;
    ((u_long128 *) p)[0] = ((u_long128 *) screen_matrix)[0];
    ((u_long128 *) p)[1] = ((u_long128 *) screen_matrix)[1];
    ((u_long128 *) p)[2] = ((u_long128 *) screen_matrix)[2];
    ((u_long128 *) p)[3] = ((u_long128 *) screen_matrix)[3];
    p += 16;

    // The normal matrix is the model matrix with its axes rescaled to unit length.
    float x = InverseLength(matrix[0]);
    float y = InverseLength(matrix[1]);
    float z = InverseLength(matrix[2]);
    if (info->unk_320 != 0) {
        sceVu0ScaleVector(normal_matrix[0], matrix[0], x * x);
        sceVu0ScaleVector(normal_matrix[1], matrix[1], y * y);
        sceVu0ScaleVector(normal_matrix[2], matrix[2], z * z);
    } else {
        sceVu0ScaleVector(normal_matrix[0], matrix[0], x);
        sceVu0ScaleVector(normal_matrix[1], matrix[1], y);
        sceVu0ScaleVector(normal_matrix[2], matrix[2], z);
    }
    normal_matrix[0][3] = 0.0f;
    normal_matrix[1][3] = 0.0f;
    normal_matrix[2][3] = 0.0f;
    sceVu0CopyVector(normal_matrix[3], matrix[3]);
    ((u_long128 *) p)[0] = ((u_long128 *) normal_matrix)[0];
    ((u_long128 *) p)[1] = ((u_long128 *) normal_matrix)[1];
    ((u_long128 *) p)[2] = ((u_long128 *) normal_matrix)[2];
    ((u_long128 *) p)[3] = ((u_long128 *) normal_matrix)[3];
    p += 16;

    if (unknown2 == 0) {
        ((u_long128 *) p)[0] = ((u_long128 *) info->light_direction)[0];
        ((u_long128 *) p)[1] = ((u_long128 *) info->light_direction)[1];
        ((u_long128 *) p)[2] = ((u_long128 *) info->light_direction)[2];
        ((u_long128 *) p)[3] = ((u_long128 *) info->light_direction)[3];
        ((u_long128 *) p)[4] = ((u_long128 *) info->light_color)[0];
        ((u_long128 *) p)[5] = ((u_long128 *) info->light_color)[1];
        ((u_long128 *) p)[6] = ((u_long128 *) info->light_color)[2];
        ((u_long128 *) p)[7] = ((u_long128 *) info->light_color)[3];
        ((u_long128 *) p)[8] = *(u_long128 *) info->ambient;
        ((u_long128 *) p)[9] = *(u_long128 *) info->scale;
        ((u_long128 *) p)[10] = *(u_long128 *) info->offset;
        ((u_long128 *) p)[11] = *(u_long128 *) info->clip_max;
        ((u_long128 *) p)[12] = *(u_long128 *) info->clip_min;
        p += 52;
        ((float *) p)[0] = info->fog_a;
        ((float *) p)[1] = info->fog_near;
        ((float *) p)[2] = info->fog_far;
        ((float *) p)[3] = info->fog_b;
        p += 4;
        if (info->unk_33C != 0) {
            eye[0] = info->position[0];
            eye[1] = info->position[1];
            eye[2] = info->position[2];
            eye[3] = 1.0f;
            sceVu0CopyMatrix(inverse, matrix);
            sceVu0InversMatrix(inverse, inverse);
            sceVu0ApplyMatrix(eye, inverse, eye);
            *(u_long128 *) p = *(u_long128 *) eye;
        }
        p += 4;
        MulMatrix(clip_matrix, info->perspective, info->view_scaled);
        MulMatrix(clip_matrix, clip_matrix, matrix);
        ((u_long128 *) p)[0] = ((u_long128 *) clip_matrix)[0];
        ((u_long128 *) p)[1] = ((u_long128 *) clip_matrix)[1];
        ((u_long128 *) p)[2] = ((u_long128 *) clip_matrix)[2];
        ((u_long128 *) p)[3] = ((u_long128 *) clip_matrix)[3];
        ((u_long128 *) p)[4] = ((u_long128 *) info->viewport)[0];
        ((u_long128 *) p)[5] = ((u_long128 *) info->viewport)[1];
        ((u_long128 *) p)[6] = ((u_long128 *) info->viewport)[2];
        ((u_long128 *) p)[7] = ((u_long128 *) info->viewport)[3];
        p += 32;
        if (info->unk_320 != 0) {
            MulMatrix(shadow_matrix, info->shadow, matrix);
            MulMatrix(shadow_matrix, info->view_scaled, shadow_matrix);
            MulMatrix(shadow_matrix, info->perspective, shadow_matrix);
        }
        *p++ = 0x8000;
        *p++ = info->unk_320 == 0 ? 0x302EC000 : 0x3022C000;
        *p++ = 0x412;
        *p++ = 0;
        *p++ = 0x8001;
        *p++ = 0x102E8000;
        *p++ = 0xE;
        *p++ = 0;
        *p++ = 0;
        *p++ = 0;
        *p++ = 0x3F;
        *p++ = 0;
    }
    *unpack = (((p - unpack - 1) >> 2) << 16) | 0x6C000000;
    if (info->unk_320 != 0) {
        p += SetShadowData(p, shadow_matrix);
    }
    *header |= (p - header) >> 2;
    *p++ = vu_size | 0x30000000;
    *p++ = (u_int) vu_data;
    *p++ = 0;
    *p++ = 0;
    *p++ = 0x10000003;
    *p++ = 0;
    *p++ = 0;
    *p++ = 0;
    *p++ = 0;
    *p++ = 0;
    *p++ = 0;
    *p++ = 0x50000002;
    *p++ = 0x8001;
    *p++ = 0x10000000;
    *p++ = 0xE;
    *p++ = 0;
    *p++ = 1;
    *p++ = 0;
    *p++ = 0x1A;
    *p++ = 0;
    return (p - start) >> 2;
}
#else
INCLUDE_ASM("asm/nonmatchings/visualvu1", DrawVu1__10CVisualVu1FPUiPA4_fP10RenderInfo11VU1_PROGRAMP1ii);
#endif
/**
 * Writes one vector-unit upload header and gives back its length in words.
 *
 * @mangled SetVuData__FiP1PUiP1P1P1P1i
 * @address 0x135970
 * @size 0x130
 */
static int SetVuData(int count, u_long128 *block, u_int *index, u_long128 *vertex,
                     u_long128 *normal, u_long128 *uv, u_long128 *colour, int prim) {
    u_int *header = (u_int *) block;
    u_int *cursor = (u_int *) block;
    u_long128 *vertex_out;
    u_long128 *normal_out;
    u_long128 *uv_out;
    u_long128 *colour_out;

    header[0] = count | 0x8000;
    if (prim != 4) {
        cursor[1] = 0x302DC000;
        cursor += 2;
    } else {
        cursor[1] = 0x302E4000;
        cursor += 2;
    }
    cursor[0] = 0x412;
    cursor[1] = 0;
    cursor[2] = count;
    cursor[3] = prim;
    if (colour != NULL) {
        cursor[4] = 0x100;
    } else {
        cursor[4] = 0;
    }
    vertex_out = &block[2];
    normal_out = &vertex_out[count];
    uv_out = &normal_out[count];
    colour_out = &uv_out[count];
    for (int i = count; i > 0; i--) {
        *vertex_out++ = vertex[index[0]];
        *normal_out++ = normal[index[1]];
        *uv_out++ = uv[index[2]];
        index += 3;
        if (colour != NULL) {
            *colour_out++ = colour[*index];
            index++;
        }
    }
    int size = count * 3 + 2;
    if (colour != NULL) {
        size = count * 4 + 2;
    }
    return size;
}
#ifdef NON_MATCHING
static u_long128 VuDataEnd;

int CVisualVu1::CreateVUdataFromMDT(u_int *block, u_int *data, int unknown0, int prim_hint) {
    MDT_HEADER *header = (MDT_HEADER *) data;
    int first = 1;
    int word = 0;
    u_long128 end = VuDataEnd;

    vu_data = block;
    u_int *mesh = (u_int *) ((u_char *) data + header->mesh_ofs);
    u_long128 *vertex = (u_long128 *) ((u_char *) data + header->vertex_ofs);
    u_long128 *normal = (u_long128 *) ((u_char *) data + header->unk_14[1]);
    u_long128 *uv = (u_long128 *) ((u_char *) data + header->unk_2c[1]);
    if (header->unk_2c[1] <= 0) {
        uv = vertex;
    }
    u_long128 *colour = (u_long128 *) ((u_char *) data + header->colour_ofs);
    int stride;
    if (header->colour_ofs <= 0) {
        stride = 3;
        colour = NULL;
    } else {
        stride = 4;
    }
    MDT_MATERIAL *materials = (MDT_MATERIAL *) ((u_char *) data + header->info_ofs);
    u_int *index = mesh + 4;
    int strips = mesh[2];
    for (int strip = 0; strip < strips; strip++) {
        int remaining = index[1];
        int prim = index[0];
        int material = index[2];
        MDT_MATERIAL *info = &materials[material];
        index += 3;
        if (material != -1) {
            int handle = TexManager.GetTextureHandle(info->texture, -1);
            CTexture *texture = TexManager.GetTexture(handle);
            word += SetTEX0(&block[word], texture->tex0, TexManager.GetTexture(handle)->tex1);
            word += SetMaterial(&block[word], info);
        }
        int limit = 0x36;
        if (colour != NULL) {
            limit = 0x21;
        }
        while (remaining > 0) {
            int count = limit;
            if (remaining < limit) {
                count = remaining;
            }
            block[word] = 0;
            block[word + 1] = 0;
            block[word + 2] = 0;
            int unpack = word + 3;
            block[unpack] = 0x6C008000;
            word += 4;
            int size = SetVuData(count, (u_long128 *) &block[word], index, vertex, normal, uv,
                                 colour, prim);
            // A strip that carries on in the next chunk repeats its last two vertices.
            if (prim == 4 && limit < remaining) {
                index -= stride * 2;
                remaining += 2;
            }
            index += count * stride;
            word += size * 4;
            block[unpack] |= size << 16;
            block[word] = 0;
            block[word + 1] = 0;
            block[word + 2] = 0;
            if (prim_hint == 0) {
                if (first) {
                    block[word + 3] = 0x14000000;
                    first = 0;
                } else {
                    block[word + 3] = 0x14000001;
                }
            } else {
                block[word + 3] = 0x17000000;
            }
            word += 4;
            remaining -= limit;
        }
        *(u_long128 *) &block[word] = end;
        word += 4;
    }
    vu_size = word >> 2;
    return vu_size;
}
#else
INCLUDE_ASM("asm/nonmatchings/visualvu1", CreateVUdataFromMDT__10CVisualVu1FPUiPUiii);
#endif
int CVisualVu1::CreateVUdataFromMDTRemake(u_int *block, u_int *data, int unknown0) {
    int strip;
    MDT_HEADER *header = (MDT_HEADER *) data;
    int word = 0;
    int quads = 0;

    vu_data = block;
    u_int *mesh = (u_int *) ((u_char *) data + header->mesh_ofs);
    int stride;
    u_long128 *vertex = (u_long128 *) ((u_char *) data + header->vertex_ofs);
    u_long128 *colour = (u_long128 *) ((u_char *) data + header->colour_ofs);
    if (header->colour_ofs <= 0) {
        stride = 3;
        colour = NULL;
    } else {
        stride = 4;
    }
    MDT_MATERIAL *materials = (MDT_MATERIAL *) ((u_char *) data + header->info_ofs);
    u_int *index = mesh + 4;
    int strips = mesh[2];
    for (strip = 0; strip < strips; strip++) {
        int remaining = index[1];
        int prim = index[0];
        int material = index[2];
        MDT_MATERIAL *info = &materials[material];
        index += 3;
        if (material != -1) {
            word += 16;
            word += SetMaterial(&block[word], info);
        }
        int count;
        int limit = 0x36;
        if (colour != NULL) {
            limit = 0x21;
        }
        count = 0;
        while (remaining > 0) {
            count = limit;
            if (remaining < limit) {
                count = remaining;
            }
            word += 4;
            int i;
            u_long128 *out;
            u_int *source = index;
            index += count * stride;
            out = (u_long128 *) &block[word] + 2;
            u_long128 *colour_out = out + count * 3;
            int size;
            if (colour == NULL) {
                for (i = count; i > 0; i--) {
                    *out++ = vertex[source[0]];
                    source += 3;
                }
                size = count * 3 + 2;
            } else {
                for (i = count; i > 0; i--) {
                    *out++ = vertex[source[0]];
                    *colour_out++ = colour[source[3]];
                    source += 4;
                }
                size = count * 4 + 2;
            }
            if (prim == 4 && limit < remaining) {
                index -= stride * 2;
                remaining += 2;
            }
            quads += size;
            word += size * 4;
            word += 4;
            remaining -= limit;
        }
        word += 4;
    }
    vu_size = word >> 2;
    return vu_size;
}
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
