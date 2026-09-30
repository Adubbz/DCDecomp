#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 221

#include "common.h"

#include <eekernel.h>
#include <libdma.h>
#include <libgraph.h>
#include <libpkt.h>

#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "dataalloc.hpp"
#include "dataread.hpp"
#include "mglib.hpp"
#include "texture.hpp"
#include "tim2.hpp"

/* TEX0 with the block address ahead of the buffer width, which is not the order the SDK's own
   macro puts the two in. The order decides which term the compiler computes first, so the two
   spellings are not interchangeable and this file needs its own. */
#define TEXTURE_TEX0(tbp0, tbw, psm, tw, th, tcc, tfx, cbp, cpsm, csm, csa, cld) ((u_long) (tbp0) | ((u_long) (tbw) << 14) | ((u_long) (psm) << 20) | ((u_long) (tw) << 26) | ((u_long) (th) << 30) | ((u_long) (tcc) << 34) | ((u_long) (tfx) << 35) | ((u_long) (cbp) << 37) | ((u_long) (cpsm) << 51) | ((u_long) (csm) << 55) | ((u_long) (csa) << 56) | ((u_long) (cld) << 61))

/* The IMG archive's directory as the registry walks it: a header at the start of the buffer the
   file was read into and one fixed-size entry per picture behind it. */

static u_long128 texData[100];

static int BlockConv8to32(u_char *source, u_char *destination);
static int Conv8to32(int width, int height, u_char *source, u_char *destination);

CTexture::CTexture() {
    Initialize();
}

void CTexture::Initialize() {
    name[0] = 0;
    block = 0;
    image[3] = 0;
    image[2] = 0;
    image[1] = 0;
    image[0] = 0;
    clut = 0;
    tex1 = 0;
    tex0 = 0;
    bpp = 0;
    height = 0;
    width = 0;
    swizzled = 0;
}

CTextureBlock::CTextureBlock() {
    Initialize();
}

void CTextureBlock::Initialize() {
    name[0] = 0;
    vram_end = 0;
    vram_top = 0;
    vram_dirty = 0;
    buffer_end = 0;
    buffer = 0;
    loaded = 0;
    extend = 0;
}

void CTextureManager::Initialize(int size) {
    int i;
    int limit;

    TextureData.used = 0;
    limit = TextureData.limit;
    SetBuffer((u_long128 *) (TextureData.base + TextureData.used * 16), limit);

    for (i = 0; i < 72; i++) {
        blocks[i].Initialize();
    }
    for (i = 0; i < 196; i++) {
        textures[i].Initialize();
    }

    texture_max = 1;
    vram_work = 8960;
#ifdef PAL
    for (i = 0; i < 72; i++) {
        blocks[i].vram_top = mgTopVRAM;
        blocks[i].vram_end = mgTopVRAM;
    }
#else
    for (i = 0; i < 72; i++) {
        blocks[i].vram_top = 6720;
        blocks[i].vram_end = 6720;
    }
#endif
    vram_size = size;
    vram_max = vram_size;
    vram_fix = size;

    strcpy(textures[0].name, "work");
#ifdef PAL
    textures[0].tex0 = SCE_GS_SET_TEX0(mgTopVRAM, 10, 0, 10, 8, 1, 0, 0, 0, 0, 0, 0);
#else
    textures[0].tex0 = SCE_GS_SET_TEX0(6720, 10, 0, 10, 8, 1, 0, 0, 0, 0, 0, 0);
#endif
    textures[0].block = -1;
    last_block = -1;
}

/* The buffer is taken as it comes and walked forward to the next 128-byte boundary, because every
   transfer out of it is a DMA read; the quadword count has to lose what the alignment ate. */
void CTextureManager::SetBuffer(u_long128 *buffer, int size) {
    int misalignment;
    int skipped_quads;

    this->buffer = buffer;
    buffer_size = size;
    misalignment = (int) this->buffer & 0x7f;
    if (misalignment != 0) {
        skipped_quads = (128 - misalignment) >> 4;
        this->buffer = (u_long128 *) ((int) this->buffer + skipped_quads * 16);
        buffer_size -= skipped_quads;
    }
    buffer_used = 0;
}

int CTextureManager::SearchTextureName(char *name, int block) {
    int       i = texture_max;
    CTexture *tex = &textures[i];

    for (; i >= 0; i--, tex--) {
        char *name_cursor;
        char *entry_cursor;
        char  name_char;
        char  entry_char;

        if (tex->name[0] == 0) {
            continue;
        }
        if (block >= 0 && block != tex->block) {
            continue;
        }

        name_cursor = name;
        entry_cursor = tex->name;
        while ((name_char = *name_cursor) != 0 && (entry_char = *entry_cursor) != 0) {
            if (name_char != entry_char) {
                break;
            }
            name_cursor++;
            entry_cursor++;
        }
        if (name_char == 0 && *entry_cursor == 0) {
            return i;
        }
    }
    return -1;
}

int CTextureManager::GetTextureHandle(char *name, int block) {
    int handle = SearchTextureName(name, block);

    if (handle < 0) {
        return -1;
    }
    return handle;
}

CTexture *CTextureManager::GetTexture(int handle) {
    if (handle < 0 || handle >= texture_max) {
        return &textures[0];
    }
    return &textures[handle];
}

CTexture *CTextureManager::GetTexture(char *name, int block) {
    int handle = GetTextureHandle(name, block);

    if (handle < 0) {
        return 0;
    }
    return GetTexture(handle);
}

CTexture *CTextureManager::SearchTexture(char *name) {
    int       i;
    CTexture *tex = &textures[1];

    for (i = 1; i < 196; i++, tex++) {
        if (i == 196) {
            printf("Texture Over!!\n");
            while (1)
                ;
        }
        if (tex->name[0] == 0) {
            break;
        }
    }
    SearchTextureName(name, -1);
    return tex;
}

void CTextureManager::EnterTexture(int block, char *name, u_char *image, int width, int height, int bpp, u_char *clut, int clut_colors, int mipmap, u_char *mip1, u_char *mip2, u_char *mip3, u_long tex1, int swizzled) {
    CTexture *tex;
    int       psm;
    int       tw;
    int       th;
    int       tbw;
    int       power;
    int       bit;
    int       tbp;
    int       cbp;
    int       image_blocks;
    int       half_width;
    int       half_height;
    int       image_size;
    int       mip_blocks;
    int       vram_top;
    int       vram_end;
    int       misalignment;
    u_int    *destination;

    if (name[0] == 0) {
        return;
    }

    tex = SearchTexture(name);
    if (image == 0 || mip1 == 0) {
        mipmap = 0;
    }

    switch (bpp) {
        case 1:
            psm = 19;
            break;
        case 3:
            psm = 1;
            break;
        case 4:
            psm = 0;
            break;
        default:
            return;
    }

    tw = 0;
    th = 0;
    power = width;
    while (power >= 2) {
        power >>= 1;
        tw++;
    }
    for (power = 1, bit = 0; bit < tw; bit++) {
        power <<= 1;
    }
    if (width != power) {
        tw++;
    }
    power = height;
    while (power >= 2) {
        power >>= 1;
        th++;
    }
    for (power = 1, bit = 0; bit < th; bit++) {
        power <<= 1;
    }
    if (height != power) {
        th++;
    }

    half_width = width >> 1;
    half_height = height >> 1;
    tbw = width >> 6;
    if (tbw <= 0) {
        tbw = 1;
    }
    tbp = 0;
    cbp = 0;

    static int clut_adr = 16000;

    image_size = width * height * bpp;
    image_blocks = image_size >> 8;
    destination = (u_int *) (this->buffer + buffer_used);
    vram_top = blocks[block].vram_top;
    vram_end = blocks[block].vram_end;

    switch (psm) {
        case 1:
        case 0:
        case 19:
            tbp = vram_end;
            if (image == 0) {
                vram_top += image_blocks;
                vram_end = vram_top;
                if (psm == 19) {
                    cbp = vram_top;
                    vram_top += 4;
                    vram_end = vram_top;
                } else {
                    cbp = 0;
                }
            } else {
                tex->image[0] = destination;
                if (psm == 19 && swizzled == 0) {
                    Conv8to32(width, height, image, (u_char *) destination);
                } else {
                    memcpy(destination, image, image_size);
                }
                vram_end += image_blocks;
                buffer_used += image_blocks * 16;

                if (mipmap != 0) {
                    destination = (u_int *) (this->buffer + buffer_used);
                    tex->image[1] = destination;
                    if (psm == 19 && swizzled == 0) {
                        Conv8to32(half_width, half_height, mip1, (u_char *) destination);
                    } else {
                        memcpy(destination, mip1, image_size >> 2);
                    }
                    mip_blocks = image_blocks >> 2;
                    vram_end += mip_blocks;
                    buffer_used += mip_blocks * 16;

                    destination = (u_int *) (this->buffer + buffer_used);
                    tex->image[2] = destination;
                    if (psm == 19 && swizzled == 0) {
                        Conv8to32(width >> 2, height >> 2, mip2, (u_char *) destination);
                    } else {
                        memcpy(destination, mip2, image_size >> 4);
                    }
                    vram_end += mip_blocks >> 2;
                    buffer_used += (mip_blocks >> 2) * 16;
                }

                if (psm == 19) {
                    tex->swizzled = 1;
                    cbp = vram_end;
                    u_int *clut_buffer = (u_int *) (this->buffer + buffer_used);
                    tex->clut = clut_buffer;
                    memcpy(clut_buffer, clut, 1024);
                    vram_end += 4;
                    buffer_used += 64;
                    tex->tex0 = TEXTURE_TEX0(tbp, tbw, psm, tw, th, 1, 0, cbp, 0, 0, 0, 1);
                } else {
                    tex->clut = 0;
                    tex->tex0 = TEXTURE_TEX0(tbp, tbw, psm, tw, th, 1, 0, 0, 0, 0, 0, 0);
                }
            }
            break;
    }

    if (image == 0) {
        if (psm != 19) {
            tex->tex0 = TEXTURE_TEX0(tbp, tbw, psm, tw, th, 1, 0, 0, 0, 0, 0, 0);
        } else {
            tex->tex0 = TEXTURE_TEX0(tbp, tbw, psm, tw, th, 1, 0, cbp, 0, 0, 0, 1);
        }
    }

    misalignment = vram_end % 32;
    if (misalignment != 0) {
        vram_end += 32 - misalignment;
        buffer_used += (32 - misalignment) * 16;
    }

    blocks[block].vram_top = vram_top;
    blocks[block].vram_end = vram_end;

    if (buffer_used >= buffer_size) {
        printf("texture buffer over!!\n");
        while (1)
            ;
    }
    if (blocks[block].vram_end > vram_max) {
        printf("VRAM is not enough\n");
        printf("%s %d\n", name, blocks[block].vram_end);
        while (1)
            ;
    }

    strcpy(tex->name, name);
    tex->width = width;
    tex->height = height;
    tex->bpp = bpp;
    tex->block = block;

    if (bpp > 0 && mipmap != 0) {
        tex->tex1 = SCE_GS_SET_TEX1(0, 2, 1, 5, 1, 0, -120);
        if (tex1 != 0) {
            sceGsTex1 *lod = (sceGsTex1 *) &tex1;
            tex->tex1 = SCE_GS_SET_TEX1(0, 2, 1, 5, 1, lod->L, lod->K);
        }
    }

    texture_max = 195;
}

/* The extended entry point keeps the caller's own pixels rather than copying them into the block
   buffer, which is what lets a character carry textures the block was not built with. */
void CTextureManager::EnterTextureEX(int block, char *name, u_char *image, int width, int height, int bpp, u_char *clut, int clut_colors, int mipmap, u_char *mip1, u_char *mip2, u_char *mip3, u_long tex1, int swizzled) {
    CTexture *tex;
    int       psm;
    int       tw;
    int       th;
    int       tbw;
    int       power;
    int       bit;
    int       tbp;
    int       cbp;
    int       image_blocks;
    int       mip_blocks;
    int       vram_top;
    int       vram_end;
    int       misalignment;

    if (name[0] == 0) {
        return;
    }

    tex = SearchTexture(name);
    if (image == 0 || mip1 == 0) {
        mipmap = 0;
    }

    switch (bpp) {
        case 1:
            psm = 19;
            break;
        case 3:
            psm = 1;
            break;
        case 4:
            psm = 0;
            break;
        default:
            return;
    }

    tw = 0;
    th = 0;
    power = width;
    while (power >= 2) {
        power >>= 1;
        tw++;
    }
    for (power = 1, bit = 0; bit < tw; bit++) {
        power <<= 1;
    }
    if (width != power) {
        tw++;
    }
    power = height;
    while (power >= 2) {
        power >>= 1;
        th++;
    }
    for (power = 1, bit = 0; bit < th; bit++) {
        power <<= 1;
    }
    if (height != power) {
        th++;
    }

    tbw = width >> 6;
    if (tbw <= 0) {
        tbw = 1;
    }
    tbp = 0;
    cbp = 0;
    image_blocks = (width * height * bpp) >> 8;
    vram_top = blocks[block].vram_top;
    vram_end = blocks[block].vram_end;
    blocks[block].extend = 1;

    switch (psm) {
        case 1:
        case 0:
        case 19:
            tbp = vram_end;
            if (image == 0) {
                vram_top += image_blocks;
                vram_end = vram_top;
                if (psm == 19) {
                    cbp = vram_top;
                    vram_top += 4;
                    vram_end = vram_top;
                } else {
                    cbp = 0;
                }
            } else {
                tex->image[0] = (u_int *) image;
                vram_end += image_blocks;
                if (mipmap != 0) {
                    tex->image[1] = (u_int *) mip1;
                    mip_blocks = image_blocks >> 2;
                    vram_end += mip_blocks;
                    tex->image[2] = (u_int *) mip2;
                    vram_end += mip_blocks >> 2;
                }
                if (psm == 19) {
                    cbp = vram_end;
                    tex->clut = (u_int *) clut;
                    vram_end += 4;
                    tex->tex0 = TEXTURE_TEX0(tbp, tbw, psm, tw, th, 1, 0, cbp, 0, 0, 0, 1);
                } else {
                    tex->clut = 0;
                    tex->tex0 = TEXTURE_TEX0(tbp, tbw, psm, tw, th, 1, 0, 0, 0, 0, 0, 0);
                }
            }
            break;
    }

    if (image == 0) {
        if (psm != 19) {
            tex->tex0 = TEXTURE_TEX0(tbp, tbw, psm, tw, th, 1, 0, 0, 0, 0, 0, 0);
        } else {
            tex->tex0 = TEXTURE_TEX0(tbp, tbw, psm, tw, th, 1, 0, cbp, 0, 0, 0, 1);
        }
    }

    misalignment = vram_end % 32;
    if (misalignment != 0) {
        vram_end += 32 - misalignment;
    }

    blocks[block].vram_top = vram_top;
    blocks[block].vram_end = vram_end;

    if (blocks[block].vram_end > vram_max) {
        printf("VRAM is not enough\n");
        printf("%s %d\n", name, blocks[block].vram_end);
        while (1)
            ;
    }

    strcpy(tex->name, name);
    tex->width = width;
    tex->height = height;
    tex->bpp = bpp;
    tex->block = block;
    tex->swizzled = swizzled;

    if (bpp > 0 && mipmap != 0) {
        tex->tex1 = SCE_GS_SET_TEX1(0, 2, 1, 5, 1, 0, -120);
        if (tex1 != 0) {
            sceGsTex1 *lod = (sceGsTex1 *) &tex1;
            tex->tex1 = SCE_GS_SET_TEX1(0, 2, 1, 5, 1, lod->L, lod->K);
        }
    }

    texture_max = 195;
}

/* A fixed texture is uploaded on the spot down the GIF channel rather than kept in the block
   buffer for the frame packet to send, and its video memory is taken off the top of the region
   the blocks grow into from below. */
void CTextureManager::EnterFixTexture(char *name, u_char *image, int width, int height, int bpp, u_char *clut, int clut_colors, int mipmap, u_char *mip1, u_char *mip2, u_char *mip3, u_long tex1, int swizzled) {
    CTexture    *tex;
    sceGifPacket packet;
    int          psm;
    int          tw;
    int          th;
    int          tbw;
    int          power;
    int          bit;
    int          quarter_width;
    int          quarter_height;
    int          mip1_tbw;
    int          mip2_tbw;
    int          tbp;
    int          cbp;
    sceDmaChan  *channel;
    int          half_height;
    int          half_width;
    int          image_size;
    int          swizzled_tbw;
    int          image_blocks;
    int          mip_blocks;
    int          misalignment;
    int          upload_address;

    if (name[0] == 0) {
        return;
    }

    tex = SearchTexture(name);
    if (image == 0 || mip1 == 0) {
        mipmap = 0;
    }

    switch (bpp) {
        case 1:
            psm = 19;
            break;
        case 3:
            psm = 1;
            break;
        case 4:
            psm = 0;
            break;
        default:
            return;
    }

    tw = 0;
    th = 0;
    power = width;
    while (power >= 2) {
        power >>= 1;
        tw++;
    }
    for (power = 1, bit = 0; bit < tw; bit++) {
        power <<= 1;
    }
    if (width != power) {
        tw++;
    }
    power = height;
    while (power >= 2) {
        power >>= 1;
        th++;
    }
    for (power = 1, bit = 0; bit < th; bit++) {
        power <<= 1;
    }
    if (height != power) {
        th++;
    }

    half_width = width >> 1;
    half_height = height >> 1;
    quarter_width = half_width >> 1;
    quarter_height = half_height >> 1;
    tbw = width >> 6;
    if (tbw <= 0) {
        tbw = 1;
    }
    swizzled_tbw = tbw >> 1;
    mip1_tbw = swizzled_tbw;
    if (mip1_tbw <= 0) {
        mip1_tbw = 1;
    }
    mip2_tbw = mip1_tbw >> 1;
    if (mip2_tbw <= 0) {
        mip2_tbw = 1;
    }
    tbp = 0;
    cbp = 0;

    image_size = width * height * bpp;
    image_blocks = image_size >> 8;
    if (mipmap != 0) {
        mip_blocks = image_blocks >> 2;
        image_blocks = image_blocks + mip_blocks + (mip_blocks >> 2);
    }
    misalignment = image_blocks % 32;
    if (misalignment != 0) {
        image_blocks += 32 - misalignment;
    }
    vram_fix -= image_blocks;
    upload_address = vram_fix;

    sceGifPkInit(&packet, texData);
    channel = sceDmaGetChan(2);
    channel->chcr.TTE = 1;
    sceGifPkReset(&packet);

    switch (psm) {
        case 1:
        case 0:
        case 19:
            tbp = upload_address;
            if (image == 0) {
                if (psm != 0) {
                    cbp = vram_fix;
                    vram_fix = cbp - 32;
                } else {
                    cbp = 0;
                }
            } else {
                if (psm == 19 && swizzled != 0) {
                    sceGifPkRefLoadImage(&packet, upload_address, 0, swizzled_tbw, (u_long128 *) image, image_size >> 4, 0, 0, half_width, half_height);
                } else {
                    sceGifPkRefLoadImage(&packet, upload_address, psm, tbw, (u_long128 *) image, image_size >> 4, 0, 0, width, height);
                }
                upload_address += image_blocks;
                if (mipmap != 0) {
                    if (mip1 != 0) {
                        sceGifPkRefLoadImage(&packet, upload_address, psm, mip1_tbw, (u_long128 *) mip1, (half_width * half_height * bpp) >> 4, 0, 0, half_width, half_height);
                    }
                    upload_address += image_blocks >> 2;
                    if (mip2 != 0) {
                        sceGifPkRefLoadImage(&packet, upload_address, psm, mip2_tbw, (u_long128 *) mip2, (quarter_width * quarter_height * bpp) >> 4, 0, 0, quarter_width, quarter_height);
                    }
                }
                if (psm == 19) {
                    vram_fix -= 32;
                    cbp = vram_fix;
                    sceGifPkRefLoadImage(&packet, cbp, 0, 1, (u_long128 *) clut, 64, 0, 0, 16, 16);
                    tex->tex0 = TEXTURE_TEX0(tbp, tbw, psm, tw, th, 1, 0, cbp, 0, 0, 0, 1);
                } else {
                    tex->clut = 0;
                    tex->tex0 = TEXTURE_TEX0(tbp, tbw, psm, tw, th, 1, 0, 0, 0, 0, 0, 0);
                }
            }
            break;
    }

    if (image == 0) {
        if (psm != 19) {
            tex->tex0 = TEXTURE_TEX0(tbp, tbw, psm, tw, th, 1, 0, 0, 0, 0, 0, 0);
        } else {
            tex->tex0 = TEXTURE_TEX0(tbp, tbw, psm, tw, th, 1, 0, cbp, 0, 0, 0, 1);
        }
    }

    sceGifPkCnt(&packet, 0, 0, 0);
    sceGifPkOpenGifTag(&packet, *(u_long128 *) &GiftagAD);
    sceGifPkAddGsAD(&packet, 63, 0);
    sceGifPkCloseGifTag(&packet);
    sceGifPkEnd(&packet, 0, 0, 0);
    sceGifPkTerminate(&packet);
    FlushCache(0);
    channel->chcr.TTE = 1;
    if (image != 0) {
        sceDmaSend(channel, (void *) packet.pBase);
    }
    sceGsSyncPath(0, 0);

    strcpy(tex->name, name);
    tex->width = width;
    tex->height = height;
    tex->bpp = bpp;
    tex->block = -1;

    if (bpp > 0 && mipmap != 0) {
        tex->tex1 = SCE_GS_SET_TEX1(0, 2, 1, 5, 1, 0, -120);
        if (tex1 != 0) {
            sceGsTex1 *lod = (sceGsTex1 *) &tex1;
            tex->tex1 = SCE_GS_SET_TEX1(0, 2, 1, 5, 1, lod->L, lod->K);
        }
    }

    texture_max = 195;
}

/* The Z-buffer scratch texture, which is the one fixed texture whose size and format the loader
   insists on rather than reads. */
void CTextureManager::EnterFixTextureZ(u_char *buffer) {
    char        *name;
    int          width;
    int          height;
    int          bpp;
    u_char      *clut;
    u_char      *image;
    CTexture    *tex;
    sceGifPacket packet;
    sceDmaChan  *channel;
    TM2_head    *head;
    TM2_picture *picture;
#ifdef PAL
    int zbuffer;
#endif

    name = (char *) (buffer + 16);
    head = (TM2_head *) (buffer + *(int *) (buffer + 48));
    picture = (TM2_picture *) ((u_char *) head + 16);
    width = head->image_width;
    height = head->image_height;
    if (width != 640) {
        return;
    }
#ifdef PAL
    if (height > 240) {
        return;
    }
#else
    if (height != 224) {
        return;
    }
#endif
    bpp = 1;
    if (picture->image_type != 5) {
        return;
    }

    image = (u_char *) picture + picture->header_size;
    clut = image + picture->image_size;

    tex = SearchTexture(name);
    strcpy(tex->name, name);
    tex->width = width;
    tex->height = height;
    tex->bpp = bpp;
    tex->block = 73;
#ifdef PAL
    zbuffer = mgZBufferAdr;
    tex->tex0 = SCE_GS_SET_TEX0(zbuffer, 10, 27, 10, 8, 1, 0, 16352, 0, 0, 0, 1);
#else
    tex->tex0 = SCE_GS_SET_TEX0(4480, 10, 27, 10, 8, 1, 0, 16352, 0, 0, 0, 1);
#endif

    sceGifPkInit(&packet, texData);
    channel = sceDmaGetChan(2);
    channel->chcr.TTE = 1;
    sceGifPkReset(&packet);
#ifdef PAL
    sceGifPkRefLoadImage(&packet, zbuffer, 27, 10, (u_long128 *) image, (width * height) >> 4, 0, 0, width, height);
#else
    sceGifPkRefLoadImage(&packet, 4480, 27, 10, (u_long128 *) image, (width * height) >> 4, 0, 0, width, height);
#endif
    sceGifPkRefLoadImage(&packet, 16352, 0, bpp, (u_long128 *) clut, 64, 0, 0, 16, 16);
    sceGifPkCnt(&packet, 0, 0, 0);
    sceGifPkOpenGifTag(&packet, *(u_long128 *) &GiftagAD);
    sceGifPkAddGsAD(&packet, 63, 0);
    sceGifPkCloseGifTag(&packet);
    sceGifPkEnd(&packet, 0, 0, 0);
    sceGifPkTerminate(&packet);
    FlushCache(0);
    channel->chcr.TTE = 1;
    if (image != 0) {
        sceDmaSend(channel, (void *) packet.pBase);
    }
    sceGsSyncPath(0, 0);
}

void CTextureManager::EnterIMGFile(u_char *buffer, int block, int mipmap, int extend) {
    u_int   i;
    int     swizzled;
    u_char *entry;

    if (buffer == 0) {
        return;
    }

    swizzled = 0;
    if (memcmp(buffer, "IM2", 3) == 0) {
        swizzled = 1;
    }

    entry = buffer + 16;
    for (i = 0; i < *(u_int *) (buffer + 4); i++) {
        TM2_head    *head;
        TM2_picture *picture;
        u_char      *image;
        u_char      *clut;
        int          width;
        int          height;
        int          bpp;

        head = (TM2_head *) (buffer + *(int *) (entry + 32));
        picture = (TM2_picture *) ((u_char *) head + 16);
        width = head->image_width;
        height = head->image_height;
        switch (head->image_type) {
            case 1:
                bpp = 2;
                break;
            case 2:
                bpp = 3;
                break;
            case 3:
                bpp = 4;
                break;
            case 4:
                bpp = 0;
                break;
            case 5:
                bpp = 1;
                break;
            default:
                entry += 48;
                continue;
        }

        clut = 0;
        image = (u_char *) picture + picture->header_size;
        if (bpp < 2) {
            clut = image + picture->image_size;
        }

        u_char *mip[4] = {0, 0, 0, 0};

        if (picture->mipmap_count > 1) {
            u_char *mip_image = image + picture->mipmap_size[0];
            for (int level = 1; level < picture->mipmap_count; level++) {
                mip[level] = mip_image;
                mip_image += picture->mipmap_size[level];
            }
        }

        if (extend == 0) {
            if (block >= 0) {
                EnterTexture(block, (char *) entry, image, width, height, bpp, clut, picture->clut_colors, mipmap, mip[1], mip[2], mip[3], picture->tex1, swizzled);
            } else {
                EnterFixTexture((char *) entry, image, width, height, bpp, clut, picture->clut_colors, mipmap, mip[1], mip[2], mip[3], picture->tex1, swizzled);
            }
        } else if (block >= 0) {
            EnterTextureEX(block, (char *) entry, image, width, height, bpp, clut, picture->clut_colors, mipmap, mip[1], mip[2], mip[3], picture->tex1, swizzled);
        }
        entry += 48;
    }
}

/* The same region load the SDK writes into a GIF packet, written into a VIF1 chain instead so
   that a frame's own packet can carry it. */
int LoadImage(u_int *packet, int dbp, int dpsm, int dbw, u_long128 *source, int qwc, int dsax, int dsay, int rrw, int rrh) {
    u_int *start = packet;
    u_long bitbltbuf;
    u_long trxpos;
    u_long trxreg;

    packet[0] = 0x10000005;
    packet[1] = 0;
    packet[2] = 0;
    packet[3] = 0x50000005;
    packet[4] = 4;
    packet[5] = 0x10000000;
    packet[6] = 14;
    packet[7] = 0;

    bitbltbuf = SCE_GS_SET_BITBLTBUF(0, 0, 0, dbp, dbw, dpsm);
    packet[8] = (u_int) (bitbltbuf & 0xffffffff);
    packet[9] = (u_int) ((bitbltbuf >> 32) & 0xffffffff);
    packet[10] = 80;
    packet[11] = 0;

    trxpos = SCE_GS_SET_TRXPOS(0, 0, dsax, dsay, 0);
    packet[12] = (u_int) (trxpos & 0xffffffff);
    packet[13] = (u_int) ((trxpos >> 32) & 0xffffffff);
    packet[14] = 81;
    packet[15] = 0;

    trxreg = SCE_GS_SET_TRXREG(rrw, rrh);
    packet[16] = (u_int) (trxreg & 0xffffffff);
    packet[17] = (u_int) ((trxreg >> 32) & 0xffffffff);
    packet[18] = 82;
    packet[19] = 0;

    packet[20] = 0;
    packet[21] = 0;
    packet[22] = 83;
    packet[23] = 0;
    packet += 24;

    while (qwc > 0) {
        int count = 16384;

        if (qwc < 16384) {
            count = qwc;
        }

        packet[0] = 0x10000001;
        packet[1] = 0;
        packet[2] = 0;
        packet[3] = 0x50000001;
        packet[4] = count | 0x8000;
        packet[5] = 0x08000000;
        packet[6] = 0;
        packet[7] = 0;
        packet[8] = count | 0x30000000;
        packet[9] = (u_int) source;
        packet[10] = 0;
        packet[11] = count | 0x50000000;
        packet += 12;
        source += count;
        qwc -= 16384;
    }

    return packet - start;
}

void CTextureManager::ReloadTexture(sceVif1Packet *packet, int block) {
    u_int    *cursor;
    u_int    *start;
    int       i;
    int       level;
    CTexture *tex;
    sceGsTex0 tex0;
    int       width;
    int       height;
    int       bpp;
    int       reload_from;
    int       reload_all;

    if (block < 0 || block >= 72) {
        last_block = -1;
        return;
    }
    if (last_block == block && blocks[block].loaded != 0) {
        return;
    }

    sceVif1PkCnt(packet, 0);
    sceVif1PkOpenDirectCode(packet, 0);
    sceVif1PkOpenGifTag(packet, *(u_long128 *) &GiftagAD);
    sceVif1PkAddGsAD(packet, 63, 0);
    sceVif1PkCloseGifTag(packet);
    sceVif1PkCloseDirectCode(packet);
    sceVif1PkTerminate(packet);

    cursor = packet->pCurrent;
    start = cursor;
    last_block = block;

    for (i = 0; i < 72; i++) {
        if (i == block) {
            continue;
        }
        if (blocks[i].vram_dirty < blocks[block].vram_end) {
            blocks[i].vram_dirty = blocks[block].vram_end;
        }
    }

    reload_from = blocks[block].vram_dirty;
    if (blocks[block].vram_end < reload_from || reload_from <= 0) {
        reload_from = blocks[block].vram_end;
    } else {
        reload_from = blocks[block].vram_top < reload_from ? reload_from : blocks[block].vram_end;
    }
    blocks[block].vram_dirty = 0;

    if (blocks[block].loaded == 0) {
        reload_all = 1;
    } else {
        reload_all = 0;
    }

    tex = &textures[1];
    for (i = 1; i < texture_max; i++, tex++) {
        if (tex->block != block) {
            continue;
        }
        tex0 = *(sceGsTex0 *) &tex->tex0;
        if (reload_from < (int) tex0.TBP0 && blocks[block].loaded != 0) {
            continue;
        }

        width = tex->width;
        height = tex->height;
        bpp = tex->bpp;
        if (bpp == 1) {
            if (tex->swizzled != 0) {
                width >>= 1;
                height >>= 1;
                bpp = 4;
                tex0.PSM = 0;
                tex0.TBW = tex0.TBW >> 1;
            }
            if (tex->clut != 0) {
                cursor += LoadImage(cursor, tex0.CBP, tex0.CPSM, 1, (u_long128 *) tex->clut, 64, 0, 0, 16, 16);
            }
        }

        for (level = 0; level < 4; level++) {
            if (tex->image[level] == 0) {
                break;
            }
            if (tex0.TBW == 0) {
                tex0.TBW = 1;
            }
            cursor += LoadImage(cursor, tex0.TBP0, tex0.PSM, tex0.TBW, (u_long128 *) tex->image[level], (bpp * (width * height)) >> 4, 0, 0, width, height);
            tex0.TBP0 += (width * height) >> 6;
            tex0.TBW = tex0.TBW >> 1;
            width >>= 1;
            height >>= 1;
        }
    }

    sceVif1PkReserve(packet, cursor - start);
    blocks[block].loaded = 1;

    sceVif1PkCnt(packet, 0);
    sceVif1PkOpenDirectCode(packet, 0);
    sceVif1PkOpenGifTag(packet, *(u_long128 *) &GiftagAD);
    sceVif1PkAddGsAD(packet, 63, 0);
    sceVif1PkCloseGifTag(packet);
    sceVif1PkCloseDirectCode(packet);
}

void CTextureManager::BeginEnterTextureBlock(int block) {
    if (block < 0 || block >= 72) {
        return;
    }

#ifdef PAL
    if (blocks[block].vram_top == 0) {
        blocks[block].vram_top = mgTopVRAM;
    }
    if (blocks[block].vram_end == 0) {
        blocks[block].vram_end = mgTopVRAM;
    }
#else
    if (blocks[block].vram_top == 0) {
        blocks[block].vram_top = 6720;
    }
    if (blocks[block].vram_end == 0) {
        blocks[block].vram_end = 6720;
    }
#endif
    blocks[block].buffer = buffer + buffer_used;
    blocks[block].buffer_end = buffer + buffer_used;
    blocks[block].loaded = 0;
}

void CTextureManager::EndEnterTextureBlock(int block) {
    if (block < 0 || block >= 72) {
        return;
    }

    blocks[block].buffer_end = buffer + buffer_used;
    if (blocks[block].buffer_end == blocks[block].buffer) {
        blocks[block].buffer = 0;
        blocks[block].buffer_end = 0;
    }
    if (buffer_used > buffer_size) {
        printf("texture buffer over!!\n");
        while (1)
            ;
    }
    if (vram_fix < blocks[block].vram_end) {
        printf("fix texture over!!\n");
        while (1)
            ;
    }
}

int CTextureManager::DeleteTextureBlock(int block) {
    int i;

    if (block >= 72) {
        return 0;
    }
    if (block >= 0 && block < 72) {
        blocks[block].Initialize();
    }
    if (block < 0) {
        block = -1;
    }
    for (i = 0; i < 196; i++) {
        if (block < 0 || textures[i].block == block) {
            textures[i].Initialize();
        }
    }
    return 1;
}

/* The blocks are packed back down to the front of the buffer in address order, and every texture
   that points into one is moved by the same distance its block was: the pointers are what the
   frame packet transfers from, so they cannot be left behind. */
int CTextureManager::CleanUpBuffer() {
    u_long128 *block_start[72];
    int        block_order[72];
    int        i;
    int        j;

    for (i = 0; i < 72; i++) {
        block_start[i] = blocks[i].buffer;
        block_order[i] = i;
    }
    for (i = 0; i < 71; i++) {
        for (j = i + 1; j < 72; j++) {
            u_long128 **lower = &block_start[i];
            u_long128 **upper = &block_start[j];
            int        *lower_block = &block_order[i];
            int        *upper_block = &block_order[j];

            if (*lower > *upper) {
                u_long128 *swap_start = *lower;
                int        swap_block = *lower_block;
                *lower = *upper;
                *lower_block = *upper_block;
                *upper = swap_start;
                *upper_block = swap_block;
            }
        }
    }

    buffer_used = 0;
    for (i = 0; i < 72; i++) {
        int        block_no = block_order[i];
        u_long128 *destination;
        u_long128 *source;
        int        block_quads;
        int        k;
        int        misalignment;
        int        shift;

        if (block_no <= 0) {
            continue;
        }
        source = block_start[i];
        if (source == 0) {
            continue;
        }

        block_quads = blocks[block_no].buffer_end - blocks[block_no].buffer;
        destination = buffer + buffer_used;
        shift = (source - destination) * 16;
        blocks[block_no].buffer = destination;
        blocks[block_no].buffer_end = destination + block_quads;
        for (k = 0; k < block_quads; k++) {
            *destination = *source;
            source++;
            destination++;
        }

        for (j = 0; j < 196 && shift != 0; j++) {
            CTexture *tex = &textures[j];
            int       level;

            if (tex->block != block_no) {
                continue;
            }
            for (level = 0; level < 4; level++) {
                u_int **images = tex->image;
                u_int **slot = &images[level];
                if (tex->image[level] == 0) {
                    continue;
                }
                *slot = (u_int *) ((int) *slot - shift);
            }
            if (tex->clut != 0) {
                tex->clut = (u_int *) ((int) tex->clut - shift);
            }
        }

        buffer_used += block_quads;
        misalignment = block_quads % 8;
        if (misalignment != 0) {
            buffer_used += 8 - misalignment;
        }
    }
    return 1;
}

int CTextureManager::CleanUpTextureList() {
    int i;
    int j;

    for (i = 1; i < 195; i++) {
        CTexture *hole = &textures[i];

        if (hole->name[0] != 0) {
            continue;
        }
        for (j = i + 1; j < 196; j++) {
            CTexture *tex = &textures[j];

            if (tex->name[0] == 0) {
                continue;
            }
            *hole = *tex;
            tex->Initialize();
            break;
        }
    }
    return 1;
}

/* A texture table entry may spell a placeholder rather than name a file, and the fields of one
   are separated by hashes. */
static int GetStr(char *text, char *out) {
    int length = 0;

    if (*text == 0) {
        return 0;
    }
    while (*text != '#') {
        out[length] = *text;
        length++;
        if (*text == 0) {
            break;
        }
        text++;
    }
    out[length] = 0;
    return length + 1;
}

static int GetDummyInfo(char *text, char *name, int *width, int *height, int *bpp) {
    char width_text[8];
    char height_text[8];
    char bpp_text[8];
    int  length;

    if (*text != '#') {
        return 0;
    }
    text++;

    int  parsed_width = 32;
    int  parsed_height = 32;
    int  parsed_bpp = 4;
    char parsed_name[32] = "";

    length = GetStr(text, parsed_name);
    if (length < 2) {
        parsed_name[0] = 0;
    }
    text += length;

    length = GetStr(text, width_text);
    text += length;
    if (length > 1) {
        parsed_width = atoi(width_text);
    }

    length = GetStr(text, height_text);
    text += length;
    if (length > 1) {
        parsed_height = atoi(height_text);
    }

    length = GetStr(text, bpp_text);
    if (length > 1) {
        parsed_bpp = atoi(bpp_text);
    }

    strcpy(name, parsed_name);
    *width = parsed_width;
    *height = parsed_height;
    *bpp = parsed_bpp;
    return 1;
}

int CTextureManager::LoadTextureBlock(int block, u_int *buffer) {
    return LoadTextureBlock(block, file, buffer);
}

int CTextureManager::LoadTextureBlock(int block, LOADTEXTURE_INFO *table, u_int *buffer) {
    LOADTEXTURE_INFO *info;
    int               i;
    int               begun;

    for (i = 0; i < 72; i++) {
        if (block >= 0 && block != i) {
            continue;
        }
        info = table;
        begun = 0;
        while (1) {
            char name[32];
            int  width;
            int  height;
            int  bpp;

            if (info->name == 0) {
                break;
            }
            if (info->name[0] == 0) {
                break;
            }
            if (info->block_no == i) {
                if (begun == 0) {
                    BeginEnterTextureBlock(i);
                }
                begun = 1;

                width = 32;
                height = 32;
                bpp = 4;
                if (GetDummyInfo(info->name, name, &width, &height, &bpp) != 0) {
                    TexManager.EnterTexture(info->block_no, name, 0, width, height, bpp, 0, 0, 0, 0, 0, 0, 0, 0);
                } else if (LoadFile2(info->name, buffer, 0, 0) != 0) {
                    EnterIMGFile((u_char *) buffer, info->block_no, info->mipmap, 0);
                }
            }
            info++;
        }
        if (begun != 0) {
            EndEnterTextureBlock(i);
        }
    }
    return 0;
}

int CTextureManager::LoadTextureBlock(int block, LOADTEXTURE_INFO2 *table) {
    LOADTEXTURE_INFO2 *info;
    int                i;
    int                begun;

    for (i = 0; i < 72; i++) {
        if (block >= 0 && block != i) {
            continue;
        }
        info = table;
        begun = 0;
        while (1) {
            char name[32];
            int  width;
            int  height;
            int  bpp;

            if (info->name == 0) {
                break;
            }
            if (info->name[0] == 0) {
                break;
            }
            if (info->block_no == i) {
                if (begun == 0) {
                    BeginEnterTextureBlock(i);
                }
                begun = 1;

                width = 32;
                height = 32;
                bpp = 4;
                if (GetDummyInfo(info->name, name, &width, &height, &bpp) != 0) {
                    TexManager.EnterTexture(info->block_no, name, 0, width, height, bpp, 0, 0, 0, 0, 0, 0, 0, 0);
                } else {
                    EnterIMGFile((u_char *) info->name, info->block_no, info->mipmap, 0);
                }
            }
            info++;
        }
        if (begun != 0) {
            EndEnterTextureBlock(i);
        }
    }
    return 0;
}

int CTextureManager::LoadTextureBlockEX(int block, LOADTEXTURE_INFO2 *table) {
    LOADTEXTURE_INFO2 *info;
    int                i;
    int                begun;

    for (i = 0; i < 72; i++) {
        if (block >= 0 && block != i) {
            continue;
        }
        info = table;
        begun = 0;
        while (1) {
            char name[32];
            int  width;
            int  height;
            int  bpp;

            if (info->name == 0) {
                break;
            }
            if (info->name[0] == 0) {
                break;
            }
            if (info->block_no == i) {
                if (begun == 0) {
                    BeginEnterTextureBlock(i);
                }
                begun = 1;

                width = 32;
                height = 32;
                bpp = 4;
                if (GetDummyInfo(info->name, name, &width, &height, &bpp) != 0) {
                    TexManager.EnterTextureEX(info->block_no, name, 0, width, height, bpp, 0, 0, 0, 0, 0, 0, 0, 0);
                } else {
                    int mipmap = info->mipmap;
                    int entry_block = info->block_no;

                    EnterIMGFile((u_char *) info->name, entry_block, mipmap, begun);
                }
            }
            info++;
        }
        if (begun != 0) {
            EndEnterTextureBlock(i);
        }
    }
    return 0;
}

int CTextureManager::EnterTextureFile(LOADTEXTURE_INFO *table) {
    file = table;
    return 1;
}

/* Eight-bit pixels reach the GS as a 32-bit image half as wide and half as tall, so the page the
   hardware would read has to be assembled here: one page of blocks, each block reordered by the
   table below, and the whole page written back in the order the GS stores it. */
static int PageConv8to32(int width, int height, u_char *source, u_char *destination) {
    static int block_table8[32] = {
        0, 1, 4, 5, 16, 17, 20, 21,
        2, 3, 6, 7, 18, 19, 22, 23,
        8, 9, 12, 13, 24, 25, 28, 29,
        10, 11, 14, 15, 26, 27, 30, 31};
    static int block_table32[32] = {
        0, 1, 4, 5, 16, 17, 20, 21,
        2, 3, 6, 7, 18, 19, 22, 23,
        8, 9, 12, 13, 24, 25, 28, 29,
        10, 11, 14, 15, 26, 27, 30, 31};
    int     block_column[32];
    int     block_row[32];
    u_char  work8[256];
    u_char  work32[256];
    u_char *work_cursor;
    u_char *source_cursor;
    u_char *destination_cursor;
    int     blocks_down;
    int     i;
    int     j;
    int     k;
    int     entry;
    int     blocks_across;
    int     block_index;

    entry = 0;
    for (i = 0; i < 4; i++) {
        for (j = 0; j < 8; j++) {
            block_column[block_table32[entry]] = j;
            block_row[block_table32[entry]] = i;
            entry++;
        }
    }

    blocks_across = width >> 4;
    blocks_down = height >> 4;

    memset(work8, 0, 256);
    memset(work32, 0, 256);

    for (i = 0; i < blocks_down; i++) {
        for (j = 0; j < blocks_across; j++) {
            work_cursor = work8;
            source_cursor = source + i * 2048 + j * 16;
            block_index = block_table8[i * blocks_across + j];

            for (k = 0; k < 16; k++) {
                memcpy(work_cursor, source_cursor, 16);
                work_cursor += 16;
                source_cursor += 128;
            }
            BlockConv8to32(work8, work32);

            work_cursor = work32;
            destination_cursor = destination + block_row[block_index] * 2048 + block_column[block_index] * 32;
            for (k = 0; k < 8; k++) {
                memcpy(destination_cursor, work_cursor, 32);
                work_cursor += 32;
                destination_cursor += 256;
            }
        }
    }
    return 0;
}

/* One block of an 8-bit image reordered into the order the GS stores its bytes in. A block is four
   columns of sixty-four bytes and a column's arrangement depends on whether its index is odd, so
   the table is two permutations rather than one: the second half is the first with bit 2 of every
   entry inverted, and the caller picks the half from the low bit of the column it is on. */
static int BlockConv8to32(u_char *source, u_char *destination) {
    static int lut[128] = {
        0, 36, 8, 44, 1, 37, 9, 45,
        2, 38, 10, 46, 3, 39, 11, 47,
        4, 32, 12, 40, 5, 33, 13, 41,
        6, 34, 14, 42, 7, 35, 15, 43,
        16, 52, 24, 60, 17, 53, 25, 61,
        18, 54, 26, 62, 19, 55, 27, 63,
        20, 48, 28, 56, 21, 49, 29, 57,
        22, 50, 30, 58, 23, 51, 31, 59,
        4, 32, 12, 40, 5, 33, 13, 41,
        6, 34, 14, 42, 7, 35, 15, 43,
        0, 36, 8, 44, 1, 37, 9, 45,
        2, 38, 10, 46, 3, 39, 11, 47,
        20, 48, 28, 56, 21, 49, 29, 57,
        22, 50, 30, 58, 23, 51, 31, 59,
        16, 52, 24, 60, 17, 53, 25, 61,
        18, 54, 26, 62, 19, 55, 27, 63};
    u_int j;
    u_int k;
    u_int i;
    int   lut_index;
    int   out_index;
    int   source_index;

    out_index = 0;
    for (i = 0; i < 4; i++) {
        lut_index = (i & 1) * 64;
        for (j = 0; j < 16; j++) {
            for (k = 0; k < 4; k++) {
                source_index = lut[lut_index];
                lut_index++;
                destination[out_index] = source[source_index];
                out_index++;
            }
        }
        source += 64;
    }
    return 0;
}

static int Conv8to32(int width, int height, u_char *source, u_char *destination) {
    u_char work8[8192];
    u_char work32[8192];
    int    i;
    int    j;
    int    k;
    int    pages_x;
    int    pages_y;
    int    row_bytes;
    int    row_count;

    memset(work8, 0, 8192);
    memset(work32, 0, 8192);
    pages_x = ((width - 1) >> 7) + 1;
    pages_y = ((height - 1) >> 6) + 1;

    if (pages_x == 1) {
        row_bytes = width * 2;
    } else {
        width = 128;
        row_bytes = 256;
    }
    if (pages_y == 1) {
        row_count = height >> 1;
    } else {
        height = 64;
        row_count = 32;
    }

    for (i = 0; i < pages_y; i++) {
        for (j = 0; j < pages_x; j++) {
            u_char *source_cursor = source + i * (pages_x * (width << 6)) + width * j;
            u_char *work_cursor = work8;
            u_char *destination_cursor;
            u_char *work_out_cursor;

            for (k = 0; k < height; k++) {
                memcpy(work_cursor, source_cursor, width);
                source_cursor += width * pages_x;
                work_cursor += 128;
            }
            PageConv8to32(128, 64, work8, work32);

            destination_cursor = destination + i * (pages_x * (row_bytes * row_count)) + row_bytes * j;
            work_out_cursor = work32;
            for (k = 0; k < row_count; k++) {
                memcpy(destination_cursor, work_out_cursor, row_bytes);
                destination_cursor += row_bytes * pages_x;
                work_out_cursor += 256;
            }
        }
    }
    return 0;
}

void CTextureManager::print_buff_info() {
}
