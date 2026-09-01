#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 221

#include "dataalloc.hpp"
#include <eekernel.h>
#include "common.h"
#include <libdma.h>
#include <libgraph.h>
#include <libpkt.h>
#include "mglib.hpp"
#include <cstdio>
#include <cstring>
#include "texture.hpp"
#include "tim2.hpp"
#include "dataread.hpp"

#include <cstdlib>

/* TEX0 with the block address ahead of the buffer width, which is not the order the SDK's own
   macro puts the two in. The order decides which term the compiler computes first, so the two
   spellings are not interchangeable and this file needs its own. */
#define TEXTURE_TEX0(tbp0, tbw, psm, tw, th, tcc, tfx, cbp, cpsm, csm, csa, cld) \
    ((u_long)(tbp0) | ((u_long)(tbw) << 14) | ((u_long)(psm) << 20) | \
     ((u_long)(tw) << 26) | ((u_long)(th) << 30) | ((u_long)(tcc) << 34) | \
     ((u_long)(tfx) << 35) | ((u_long)(cbp) << 37) | ((u_long)(cpsm) << 51) | \
     ((u_long)(csm) << 55) | ((u_long)(csa) << 56) | ((u_long)(cld) << 61))

/* The IMG archive's directory as the registry walks it: a header at the start of the buffer the
   file was read into and one fixed-size entry per picture behind it. */
void SetTextureInfo(CTexture* texture, char* name, TM2_head* head);
void SetTextureInfo(CTexture* texture, char* name, u_char* buffer);

static u_long128 texData[100];

static int GetStr(char* text, char* out);
static int GetDummyInfo(char* text, char* name, int* width, int* height, int* bpp);
static int PageConv8to32(int width, int height, u_char* source, u_char* destination);
static int BlockConv8to32(u_char* source, u_char* destination);
static int Conv8to32(int width, int height, u_char* source, u_char* destination);

int LoadImage(u_int* packet, int dbp, int dpsm, int dbw, u_long128* source, int qwc, int dsax,
              int dsay, int rrw, int rrh);

CTexture::CTexture()
{
    Initialize();
}

void CTexture::Initialize()
{
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

CTextureBlock::CTextureBlock()
{
    Initialize();
}

void CTextureBlock::Initialize()
{
    name[0] = 0;
    vram_end = 0;
    vram_top = 0;
    vram_dirty = 0;
    buffer_end = 0;
    buffer = 0;
    loaded = 0;
    extend = 0;
}

void CTextureManager::Initialize(int size)
{
    int i;
    int limit;

    TextureData.used = 0;
    limit = TextureData.limit;
    SetBuffer((u_long128*)(TextureData.base + TextureData.used * 16), limit);

    for (i = 0; i < 72; i++) {
        blocks[i].Initialize();
    }
    for (i = 0; i < 196; i++) {
        textures[i].Initialize();
    }

    texture_max = 1;
    vram_work = 8960;
    for (i = 0; i < 72; i++) {
        blocks[i].vram_top = 6720;
        blocks[i].vram_end = 6720;
    }
    vram_size = size;
    vram_max = vram_size;
    vram_fix = size;

    strcpy(textures[0].name, "work");
    textures[0].tex0 = SCE_GS_SET_TEX0(6720, 10, 0, 10, 8, 1, 0, 0, 0, 0, 0, 0);
    textures[0].block = -1;
    last_block = -1;
}

/* The buffer is taken as it comes and walked forward to the next 128-byte boundary, because every
   transfer out of it is a DMA read; the quadword count has to lose what the alignment ate. */
void CTextureManager::SetBuffer(u_long128* buffer, int size)
{
    int rest;
    int quads;

    this->buffer = buffer;
    buffer_size = size;
    rest = (int)this->buffer & 0x7f;
    if (rest != 0) {
        quads = (128 - rest) >> 4;
        this->buffer = (u_long128*)((int)this->buffer + quads * 16);
        buffer_size -= quads;
    }
    buffer_used = 0;
}

int CTextureManager::SearchTextureName(char* name, int block)
{
    int i = texture_max;
    CTexture* tex = &textures[i];

    for (; i >= 0; i--, tex--) {
        char* left;
        char* right;
        char c;
        char d;

        if (tex->name[0] == 0) continue;
        if (block >= 0 && block != tex->block) continue;

        left = name;
        right = tex->name;
        while ((c = *left) != 0 && (d = *right) != 0) {
            if (c != d) break;
            left++;
            right++;
        }
        if (c == 0 && *right == 0) return i;
    }
    return -1;
}

int CTextureManager::GetTextureHandle(char* name, int block)
{
    int handle = SearchTextureName(name, block);

    if (handle < 0) return -1;
    return handle;
}

CTexture* CTextureManager::GetTexture(int handle)
{
    if (handle < 0 || handle >= texture_max) return &textures[0];
    return &textures[handle];
}

CTexture* CTextureManager::GetTexture(char* name, int block)
{
    int handle = GetTextureHandle(name, block);

    if (handle < 0) return 0;
    return GetTexture(handle);
}

CTexture* CTextureManager::SearchTexture(char* name)
{
    int i;
    CTexture* tex = &textures[1];

    for (i = 1; i < 196; i++, tex++) {
        if (i == 196) {
            printf("Texture Over!!\n");
            while (1) ;
        }
        if (tex->name[0] == 0) break;
    }
    SearchTextureName(name, -1);
    return tex;
}

void CTextureManager::EnterTexture(int block, char* name, u_char* image, int width, int height,
                                   int bpp, u_char* clut, int clut_colors, int mipmap,
                                   u_char* mip1, u_char* mip2, u_char* mip3, u_long tex1,
                                   int swizzled)
{
    CTexture* tex;
    int psm;
    int tw;
    int th;
    int tbw;
    int t;
    int k;
    int tbp;
    int cbp;
    int pages;
    int w2;
    int h2;
    int size;
    int mip_pages;
    int vram_top;
    int vram_end;
    int rest;
    u_int* buffer;

    if (name[0] == 0) return;

    tex = SearchTexture(name);
    if (image == 0 || mip1 == 0) mipmap = 0;

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
    t = width;
    while (t >= 2) {
        t >>= 1;
        tw++;
    }
    for (t = 1, k = 0; k < tw; k++) t <<= 1;
    if (width != t) tw++;
    t = height;
    while (t >= 2) {
        t >>= 1;
        th++;
    }
    for (t = 1, k = 0; k < th; k++) t <<= 1;
    if (height != t) th++;

    w2 = width >> 1;
    h2 = height >> 1;
    tbw = width >> 6;
    if (tbw <= 0) tbw = 1;
    tbp = 0;
    cbp = 0;

    static int clut_adr = 16000;

    size = width * height * bpp;
    pages = size >> 8;
    buffer = (u_int*)(this->buffer + buffer_used);
    vram_top = blocks[block].vram_top;
    vram_end = blocks[block].vram_end;

    switch (psm) {
    case 1:
    case 0:
    case 19:
        tbp = vram_end;
        if (image == 0) {
            vram_top += pages;
            vram_end = vram_top;
            if (psm == 19) {
                cbp = vram_top;
                vram_top += 4;
                vram_end = vram_top;
            } else {
                cbp = 0;
            }
        } else {
            tex->image[0] = buffer;
            if (psm == 19 && swizzled == 0) {
                Conv8to32(width, height, image, (u_char*)buffer);
            } else {
                memcpy(buffer, image, size);
            }
            vram_end += pages;
            buffer_used += pages * 16;

            if (mipmap != 0) {
                buffer = (u_int*)(this->buffer + buffer_used);
                tex->image[1] = buffer;
                if (psm == 19 && swizzled == 0) {
                    Conv8to32(w2, h2, mip1, (u_char*)buffer);
                } else {
                    memcpy(buffer, mip1, size >> 2);
                }
                mip_pages = pages >> 2;
                vram_end += mip_pages;
                buffer_used += mip_pages * 16;

                buffer = (u_int*)(this->buffer + buffer_used);
                tex->image[2] = buffer;
                if (psm == 19 && swizzled == 0) {
                    Conv8to32(width >> 2, height >> 2, mip2, (u_char*)buffer);
                } else {
                    memcpy(buffer, mip2, size >> 4);
                }
                vram_end += mip_pages >> 2;
                buffer_used += (mip_pages >> 2) * 16;
            }

            if (psm == 19) {
                tex->swizzled = 1;
                cbp = vram_end;
                u_int* clut_buffer = (u_int*)(this->buffer + buffer_used);
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

    rest = vram_end % 32;
    if (rest != 0) {
        vram_end += 32 - rest;
        buffer_used += (32 - rest) * 16;
    }

    blocks[block].vram_top = vram_top;
    blocks[block].vram_end = vram_end;

    if (buffer_used >= buffer_size) {
        printf("texture buffer over!!\n");
        while (1) ;
    }
    if (blocks[block].vram_end > vram_max) {
        printf("VRAM is not enough\n");
        printf("%s %d\n", name, blocks[block].vram_end);
        while (1) ;
    }

    strcpy(tex->name, name);
    tex->width = width;
    tex->height = height;
    tex->bpp = bpp;
    tex->block = block;

    if (bpp > 0 && mipmap != 0) {
        tex->tex1 = SCE_GS_SET_TEX1(0, 2, 1, 5, 1, 0, -120);
        if (tex1 != 0) {
            sceGsTex1* level = (sceGsTex1*)&tex1;
            tex->tex1 = SCE_GS_SET_TEX1(0, 2, 1, 5, 1, level->L, level->K);
        }
    }

    texture_max = 195;
}

/* The extended entry point keeps the caller's own pixels rather than copying them into the block
   buffer, which is what lets a character carry textures the block was not built with. */
void CTextureManager::EnterTextureEX(int block, char* name, u_char* image, int width, int height,
                                     int bpp, u_char* clut, int clut_colors, int mipmap,
                                     u_char* mip1, u_char* mip2, u_char* mip3, u_long tex1,
                                     int swizzled)
{
    CTexture* tex;
    int psm;
    int tw;
    int th;
    int tbw;
    int t;
    int k;
    int tbp;
    int cbp;
    int pages;
    int mip_pages;
    int vram_top;
    int vram_end;
    int rest;

    if (name[0] == 0) return;

    tex = SearchTexture(name);
    if (image == 0 || mip1 == 0) mipmap = 0;

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
    t = width;
    while (t >= 2) {
        t >>= 1;
        tw++;
    }
    for (t = 1, k = 0; k < tw; k++) t <<= 1;
    if (width != t) tw++;
    t = height;
    while (t >= 2) {
        t >>= 1;
        th++;
    }
    for (t = 1, k = 0; k < th; k++) t <<= 1;
    if (height != t) th++;

    tbw = width >> 6;
    if (tbw <= 0) tbw = 1;
    tbp = 0;
    cbp = 0;
    pages = (width * height * bpp) >> 8;
    vram_top = blocks[block].vram_top;
    vram_end = blocks[block].vram_end;
    blocks[block].extend = 1;

    switch (psm) {
    case 1:
    case 0:
    case 19:
        tbp = vram_end;
        if (image == 0) {
            vram_top += pages;
            vram_end = vram_top;
            if (psm == 19) {
                cbp = vram_top;
                vram_top += 4;
                vram_end = vram_top;
            } else {
                cbp = 0;
            }
        } else {
            tex->image[0] = (u_int*)image;
            vram_end += pages;
            if (mipmap != 0) {
                tex->image[1] = (u_int*)mip1;
                mip_pages = pages >> 2;
                vram_end += mip_pages;
                tex->image[2] = (u_int*)mip2;
                vram_end += mip_pages >> 2;
            }
            if (psm == 19) {
                cbp = vram_end;
                tex->clut = (u_int*)clut;
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

    rest = vram_end % 32;
    if (rest != 0) vram_end += 32 - rest;

    blocks[block].vram_top = vram_top;
    blocks[block].vram_end = vram_end;

    if (blocks[block].vram_end > vram_max) {
        printf("VRAM is not enough\n");
        printf("%s %d\n", name, blocks[block].vram_end);
        while (1) ;
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
            sceGsTex1* level = (sceGsTex1*)&tex1;
            tex->tex1 = SCE_GS_SET_TEX1(0, 2, 1, 5, 1, level->L, level->K);
        }
    }

    texture_max = 195;
}

/* A fixed texture is uploaded on the spot down the GIF channel rather than kept in the block
   buffer for the frame packet to send, and its video memory is taken off the top of the region
   the blocks grow into from below. */
void CTextureManager::EnterFixTexture(char* name, u_char* image, int width, int height, int bpp,
                                      u_char* clut, int clut_colors, int mipmap, u_char* mip1,
                                      u_char* mip2, u_char* mip3, u_long tex1, int swizzled)
{
    CTexture* tex;
    sceGifPacket packet;
    int psm;
    int tw;
    int th;
    int tbw;
    int t;
    int k;
    int w4;
    int h4;
    int tbw2;
    int tbw3;
    int tbp;
    int cbp;
    sceDmaChan* chan;
    int h2;
    int w2;
    int size;
    int tbw1;
    int pages;
    int mip_pages;
    int rest;
    int vram;

    if (name[0] == 0) return;

    tex = SearchTexture(name);
    if (image == 0 || mip1 == 0) mipmap = 0;

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
    t = width;
    while (t >= 2) {
        t >>= 1;
        tw++;
    }
    for (t = 1, k = 0; k < tw; k++) t <<= 1;
    if (width != t) tw++;
    t = height;
    while (t >= 2) {
        t >>= 1;
        th++;
    }
    for (t = 1, k = 0; k < th; k++) t <<= 1;
    if (height != t) th++;

    w2 = width >> 1;
    h2 = height >> 1;
    w4 = w2 >> 1;
    h4 = h2 >> 1;
    tbw = width >> 6;
    if (tbw <= 0) tbw = 1;
    tbw1 = tbw >> 1;
    tbw2 = tbw1;
    if (tbw2 <= 0) tbw2 = 1;
    tbw3 = tbw2 >> 1;
    if (tbw3 <= 0) tbw3 = 1;
    tbp = 0;
    cbp = 0;

    size = width * height * bpp;
    pages = size >> 8;
    if (mipmap != 0) {
        mip_pages = pages >> 2;
        pages = pages + mip_pages + (mip_pages >> 2);
    }
    rest = pages % 32;
    if (rest != 0) pages += 32 - rest;
    vram_fix -= pages;
    vram = vram_fix;

    sceGifPkInit(&packet, texData);
    chan = sceDmaGetChan(2);
    chan->chcr.TTE = 1;
    sceGifPkReset(&packet);

    switch (psm) {
    case 1:
    case 0:
    case 19:
        tbp = vram;
        if (image == 0) {
            if (psm != 0) {
                cbp = vram_fix;
                vram_fix = cbp - 32;
            } else {
                cbp = 0;
            }
        } else {
            if (psm == 19 && swizzled != 0) {
                sceGifPkRefLoadImage(&packet, vram, 0, tbw1, (u_long128*)image, size >> 4, 0, 0,
                                     w2, h2);
            } else {
                sceGifPkRefLoadImage(&packet, vram, psm, tbw, (u_long128*)image, size >> 4, 0, 0,
                                     width, height);
            }
            vram += pages;
            if (mipmap != 0) {
                if (mip1 != 0) {
                    sceGifPkRefLoadImage(&packet, vram, psm, tbw2, (u_long128*)mip1,
                                         (w2 * h2 * bpp) >> 4, 0, 0, w2, h2);
                }
                vram += pages >> 2;
                if (mip2 != 0) {
                    sceGifPkRefLoadImage(&packet, vram, psm, tbw3, (u_long128*)mip2,
                                         (w4 * h4 * bpp) >> 4, 0, 0, w4, h4);
                }
            }
            if (psm == 19) {
                vram_fix -= 32;
                cbp = vram_fix;
                sceGifPkRefLoadImage(&packet, cbp, 0, 1, (u_long128*)clut, 64, 0, 0, 16, 16);
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
    sceGifPkOpenGifTag(&packet, *(u_long128*)&GiftagAD);
    sceGifPkAddGsAD(&packet, 63, 0);
    sceGifPkCloseGifTag(&packet);
    sceGifPkEnd(&packet, 0, 0, 0);
    sceGifPkTerminate(&packet);
    FlushCache(0);
    chan->chcr.TTE = 1;
    if (image != 0) sceDmaSend(chan, (void*)packet.pBase);
    sceGsSyncPath(0, 0);

    strcpy(tex->name, name);
    tex->width = width;
    tex->height = height;
    tex->bpp = bpp;
    tex->block = -1;

    if (bpp > 0 && mipmap != 0) {
        tex->tex1 = SCE_GS_SET_TEX1(0, 2, 1, 5, 1, 0, -120);
        if (tex1 != 0) {
            sceGsTex1* level = (sceGsTex1*)&tex1;
            tex->tex1 = SCE_GS_SET_TEX1(0, 2, 1, 5, 1, level->L, level->K);
        }
    }

    texture_max = 195;
}

/* The Z-buffer scratch texture, which is the one fixed texture whose size and format the loader
   insists on rather than reads. */
void CTextureManager::EnterFixTextureZ(u_char* buffer)
{
    char* name;
    int width;
    int height;
    int bpp;
    u_char* clut;
    u_char* image;
    CTexture* tex;
    sceGifPacket packet;
    sceDmaChan* chan;
    TM2_head* head;
    TM2_picture* pic;

    name = (char*)(buffer + 16);
    head = (TM2_head*)(buffer + *(int*)(buffer + 48));
    pic = (TM2_picture*)((u_char*)head + 16);
    width = head->image_width;
    height = head->image_height;
    if (width != 640) return;
    if (height != 224) return;
    bpp = 1;
    if (pic->image_type != 5) return;

    image = (u_char*)pic + pic->header_size;
    clut = image + pic->image_size;

    tex = SearchTexture(name);
    strcpy(tex->name, name);
    tex->width = width;
    tex->height = height;
    tex->bpp = bpp;
    tex->block = 73;
    tex->tex0 = SCE_GS_SET_TEX0(4480, 10, 27, 10, 8, 1, 0, 16352, 0, 0, 0, 1);

    sceGifPkInit(&packet, texData);
    chan = sceDmaGetChan(2);
    chan->chcr.TTE = 1;
    sceGifPkReset(&packet);
    sceGifPkRefLoadImage(&packet, 4480, 27, 10, (u_long128*)image, (width * height) >> 4, 0, 0,
                         width, height);
    sceGifPkRefLoadImage(&packet, 16352, 0, bpp, (u_long128*)clut, 64, 0, 0, 16, 16);
    sceGifPkCnt(&packet, 0, 0, 0);
    sceGifPkOpenGifTag(&packet, *(u_long128*)&GiftagAD);
    sceGifPkAddGsAD(&packet, 63, 0);
    sceGifPkCloseGifTag(&packet);
    sceGifPkEnd(&packet, 0, 0, 0);
    sceGifPkTerminate(&packet);
    FlushCache(0);
    chan->chcr.TTE = 1;
    if (image != 0) sceDmaSend(chan, (void*)packet.pBase);
    sceGsSyncPath(0, 0);
}

void CTextureManager::EnterIMGFile(u_char* buffer, int block, int mipmap, int extend)
{
    u_int i;
    int im2;
    u_char* entry;

    if (buffer == 0) return;

    im2 = 0;
    if (memcmp(buffer, "IM2", 3) == 0) im2 = 1;

    entry = buffer + 16;
    for (i = 0; i < *(u_int*)(buffer + 4); i++) {
        TM2_head* head;
        TM2_picture* pic;
        u_char* image;
        u_char* clut;
        int width;
        int height;
        int bpp;

        head = (TM2_head*)(buffer + *(int*)(entry + 32));
        pic = (TM2_picture*)((u_char*)head + 16);
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
        image = (u_char*)pic + pic->header_size;
        if (bpp < 2) clut = image + pic->image_size;

        u_char* mip[4] = { 0, 0, 0, 0 };

        if (pic->mipmap_count > 1) {
            u_char* next = image + pic->mipmap_size[0];
            for (int m = 1; m < pic->mipmap_count; m++) {
                mip[m] = next;
                next += pic->mipmap_size[m];
            }
        }

        if (extend == 0) {
            if (block >= 0) {
                EnterTexture(block, (char*)entry, image, width, height, bpp, clut,
                             pic->clut_colors, mipmap, mip[1], mip[2], mip[3], pic->tex1, im2);
            } else {
                EnterFixTexture((char*)entry, image, width, height, bpp, clut, pic->clut_colors,
                                mipmap, mip[1], mip[2], mip[3], pic->tex1, im2);
            }
        } else if (block >= 0) {
            EnterTextureEX(block, (char*)entry, image, width, height, bpp, clut,
                           pic->clut_colors, mipmap, mip[1], mip[2], mip[3], pic->tex1, im2);
        }
        entry += 48;
    }
}

/* The same region load the SDK writes into a GIF packet, written into a VIF1 chain instead so
   that a frame's own packet can carry it. */
int LoadImage(u_int* packet, int dbp, int dpsm, int dbw, u_long128* source, int qwc, int dsax,
              int dsay, int rrw, int rrh)
{
    u_int* start = packet;
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
    packet[8] = (u_int)(bitbltbuf & 0xffffffff);
    packet[9] = (u_int)((bitbltbuf >> 32) & 0xffffffff);
    packet[10] = 80;
    packet[11] = 0;

    trxpos = SCE_GS_SET_TRXPOS(0, 0, dsax, dsay, 0);
    packet[12] = (u_int)(trxpos & 0xffffffff);
    packet[13] = (u_int)((trxpos >> 32) & 0xffffffff);
    packet[14] = 81;
    packet[15] = 0;

    trxreg = SCE_GS_SET_TRXREG(rrw, rrh);
    packet[16] = (u_int)(trxreg & 0xffffffff);
    packet[17] = (u_int)((trxreg >> 32) & 0xffffffff);
    packet[18] = 82;
    packet[19] = 0;

    packet[20] = 0;
    packet[21] = 0;
    packet[22] = 83;
    packet[23] = 0;
    packet += 24;

    while (qwc > 0) {
        int count = 16384;

        if (qwc < 16384) count = qwc;

        packet[0] = 0x10000001;
        packet[1] = 0;
        packet[2] = 0;
        packet[3] = 0x50000001;
        packet[4] = count | 0x8000;
        packet[5] = 0x08000000;
        packet[6] = 0;
        packet[7] = 0;
        packet[8] = count | 0x30000000;
        packet[9] = (u_int)source;
        packet[10] = 0;
        packet[11] = count | 0x50000000;
        packet += 12;
        source += count;
        qwc -= 16384;
    }

    return packet - start;
}

void CTextureManager::ReloadTexture(sceVif1Packet* packet, int block)
{
    u_int* p;
    u_int* start;
    int i;
    int j;
    CTexture* tex;
    sceGsTex0 tex0;
    int width;
    int height;
    int bpp;
    int top;
    int reload;

    if (block < 0 || block >= 72) {
        last_block = -1;
        return;
    }
    if (last_block == block && blocks[block].loaded != 0) return;

    sceVif1PkCnt(packet, 0);
    sceVif1PkOpenDirectCode(packet, 0);
    sceVif1PkOpenGifTag(packet, *(u_long128*)&GiftagAD);
    sceVif1PkAddGsAD(packet, 63, 0);
    sceVif1PkCloseGifTag(packet);
    sceVif1PkCloseDirectCode(packet);
    sceVif1PkTerminate(packet);

    p = packet->pCurrent;
    start = p;
    last_block = block;

    for (i = 0; i < 72; i++) {
        if (i == block) continue;
        if (blocks[i].vram_dirty < blocks[block].vram_end) {
            blocks[i].vram_dirty = blocks[block].vram_end;
        }
    }

    top = blocks[block].vram_dirty;
    if (blocks[block].vram_end < top || top <= 0) {
        top = blocks[block].vram_end;
    } else {
        top = blocks[block].vram_top < top ? top : blocks[block].vram_end;
    }
    blocks[block].vram_dirty = 0;

    if (blocks[block].loaded == 0) {
        reload = 1;
    } else {
        reload = 0;
    }

    tex = &textures[1];
    for (i = 1; i < texture_max; i++, tex++) {
        if (tex->block != block) continue;
        tex0 = *(sceGsTex0*)&tex->tex0;
        if (top < (int)tex0.TBP0 && blocks[block].loaded != 0) continue;

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
                p += LoadImage(p, tex0.CBP, tex0.CPSM, 1, (u_long128*)tex->clut, 64, 0, 0, 16,
                               16);
            }
        }

        for (j = 0; j < 4; j++) {
            if (tex->image[j] == 0) break;
            if (tex0.TBW == 0) tex0.TBW = 1;
            p += LoadImage(p, tex0.TBP0, tex0.PSM, tex0.TBW, (u_long128*)tex->image[j],
                           (bpp * (width * height)) >> 4, 0, 0, width, height);
            tex0.TBP0 += (width * height) >> 6;
            tex0.TBW = tex0.TBW >> 1;
            width >>= 1;
            height >>= 1;
        }
    }

    sceVif1PkReserve(packet, p - start);
    blocks[block].loaded = 1;

    sceVif1PkCnt(packet, 0);
    sceVif1PkOpenDirectCode(packet, 0);
    sceVif1PkOpenGifTag(packet, *(u_long128*)&GiftagAD);
    sceVif1PkAddGsAD(packet, 63, 0);
    sceVif1PkCloseGifTag(packet);
    sceVif1PkCloseDirectCode(packet);
}

void CTextureManager::BeginEnterTextureBlock(int block)
{
    if (block < 0 || block >= 72) return;

    if (blocks[block].vram_top == 0) blocks[block].vram_top = 6720;
    if (blocks[block].vram_end == 0) blocks[block].vram_end = 6720;
    blocks[block].buffer = buffer + buffer_used;
    blocks[block].buffer_end = buffer + buffer_used;
    blocks[block].loaded = 0;
}

void CTextureManager::EndEnterTextureBlock(int block)
{
    if (block < 0 || block >= 72) return;

    blocks[block].buffer_end = buffer + buffer_used;
    if (blocks[block].buffer_end == blocks[block].buffer) {
        blocks[block].buffer = 0;
        blocks[block].buffer_end = 0;
    }
    if (buffer_used > buffer_size) {
        printf("texture buffer over!!\n");
        while (1) ;
    }
    if (vram_fix < blocks[block].vram_end) {
        printf("fix texture over!!\n");
        while (1) ;
    }
}

int CTextureManager::DeleteTextureBlock(int block)
{
    int i;

    if (block >= 72) return 0;
    if (block >= 0 && block < 72) blocks[block].Initialize();
    if (block < 0) block = -1;
    for (i = 0; i < 196; i++) {
        if (block < 0 || textures[i].block == block) textures[i].Initialize();
    }
    return 1;
}

/* The blocks are packed back down to the front of the buffer in address order, and every texture
   that points into one is moved by the same distance its block was: the pointers are what the
   frame packet transfers from, so they cannot be left behind. */
int CTextureManager::CleanUpBuffer()
{
    u_long128* top[72];
    int index[72];
    int i;
    int j;

    for (i = 0; i < 72; i++) {
        top[i] = blocks[i].buffer;
        index[i] = i;
    }
    for (i = 0; i < 71; i++) {
        for (j = i + 1; j < 72; j++) {
            u_long128** a = &top[i];
            u_long128** b = &top[j];
            int* ia = &index[i];
            int* ib = &index[j];

            if (*a > *b) {
                u_long128* t = *a;
                int n = *ia;
                *a = *b;
                *ia = *ib;
                *b = t;
                *ib = n;
            }
        }
    }

    buffer_used = 0;
    for (i = 0; i < 72; i++) {
        int b = index[i];
        u_long128* destination;
        u_long128* source;
        int quads;
        int k;
        int rest;
        int moved;

        if (b <= 0) continue;
        source = top[i];
        if (source == 0) continue;

        quads = blocks[b].buffer_end - blocks[b].buffer;
        destination = buffer + buffer_used;
        moved = (source - destination) * 16;
        blocks[b].buffer = destination;
        blocks[b].buffer_end = destination + quads;
        for (k = 0; k < quads; k++) {
            *destination = *source;
            source++;
            destination++;
        }

        for (j = 0; j < 196 && moved != 0; j++) {
            CTexture* tex = &textures[j];
            int m;

            if (tex->block != b) continue;
            for (m = 0; m < 4; m++) {
                u_int** image = tex->image;
                u_int** slot = &image[m];
                if (tex->image[m] == 0) continue;
                *slot = (u_int*)((int)*slot - moved);
            }
            if (tex->clut != 0) {
                tex->clut = (u_int*)((int)tex->clut - moved);
            }
        }

        buffer_used += quads;
        rest = quads % 8;
        if (rest != 0) buffer_used += 8 - rest;
    }
    return 1;
}

int CTextureManager::CleanUpTextureList()
{
    int i;
    int j;

    for (i = 1; i < 195; i++) {
        CTexture* hole = &textures[i];

        if (hole->name[0] != 0) continue;
        for (j = i + 1; j < 196; j++) {
            CTexture* tex = &textures[j];

            if (tex->name[0] == 0) continue;
            *hole = *tex;
            tex->Initialize();
            break;
        }
    }
    return 1;
}

/* A texture table entry may spell a placeholder rather than name a file, and the fields of one
   are separated by hashes. */
static int GetStr(char* text, char* out)
{
    int n = 0;

    if (*text == 0) return 0;
    while (*text != '#') {
        out[n] = *text;
        n++;
        if (*text == 0) break;
        text++;
    }
    out[n] = 0;
    return n + 1;
}

static int GetDummyInfo(char* text, char* name, int* width, int* height, int* bpp)
{
    char field[8];
    char field2[8];
    char field3[8];
    int n;

    if (*text != '#') return 0;
    text++;

    int w = 32;
    int h = 32;
    int b = 4;
    char work[32] = "";

    n = GetStr(text, work);
    if (n < 2) work[0] = 0;
    text += n;

    n = GetStr(text, field);
    text += n;
    if (n > 1) w = atoi(field);

    n = GetStr(text, field2);
    text += n;
    if (n > 1) h = atoi(field2);

    n = GetStr(text, field3);
    if (n > 1) b = atoi(field3);

    strcpy(name, work);
    *width = w;
    *height = h;
    *bpp = b;
    return 1;
}

int CTextureManager::LoadTextureBlock(int block, u_int* buffer)
{
    return LoadTextureBlock(block, file, buffer);
}

int CTextureManager::LoadTextureBlock(int block, LOADTEXTURE_INFO* table, u_int* buffer)
{
    LOADTEXTURE_INFO* info;
    int i;
    int begun;

    for (i = 0; i < 72; i++) {
        if (block >= 0 && block != i) continue;
        info = table;
        begun = 0;
        while (1) {
            char name[32];
            int width;
            int height;
            int bpp;

            if (info->name == 0) break;
            if (info->name[0] == 0) break;
            if (info->block_no == i) {
                if (begun == 0) BeginEnterTextureBlock(i);
                begun = 1;

                width = 32;
                height = 32;
                bpp = 4;
                if (GetDummyInfo(info->name, name, &width, &height, &bpp) != 0) {
                    TexManager.EnterTexture(info->block_no, name, 0, width, height, bpp, 0, 0, 0, 0,
                                            0, 0, 0, 0);
                } else if (LoadFile2(info->name, buffer, 0, 0) != 0) {
                    EnterIMGFile((u_char*)buffer, info->block_no, info->unk_08, 0);
                }
            }
            info++;
        }
        if (begun != 0) EndEnterTextureBlock(i);
    }
    return 0;
}

int CTextureManager::LoadTextureBlock(int block, LOADTEXTURE_INFO2* table)
{
    LOADTEXTURE_INFO2* info;
    int i;
    int begun;

    for (i = 0; i < 72; i++) {
        if (block >= 0 && block != i) continue;
        info = table;
        begun = 0;
        while (1) {
            char name[32];
            int width;
            int height;
            int bpp;

            if (info->name == 0) break;
            if (info->name[0] == 0) break;
            if (info->block_no == i) {
                if (begun == 0) BeginEnterTextureBlock(i);
                begun = 1;

                width = 32;
                height = 32;
                bpp = 4;
                if (GetDummyInfo(info->name, name, &width, &height, &bpp) != 0) {
                    TexManager.EnterTexture(info->block_no, name, 0, width, height, bpp, 0, 0, 0, 0,
                                            0, 0, 0, 0);
                } else {
                    EnterIMGFile((u_char*)info->name, info->block_no, info->unk_08, 0);
                }
            }
            info++;
        }
        if (begun != 0) EndEnterTextureBlock(i);
    }
    return 0;
}

int CTextureManager::LoadTextureBlockEX(int block, LOADTEXTURE_INFO2* table)
{
    LOADTEXTURE_INFO2* info;
    int i;
    int begun;

    for (i = 0; i < 72; i++) {
        if (block >= 0 && block != i) continue;
        info = table;
        begun = 0;
        while (1) {
            char name[32];
            int width;
            int height;
            int bpp;

            if (info->name == 0) break;
            if (info->name[0] == 0) break;
            if (info->block_no == i) {
                if (begun == 0) BeginEnterTextureBlock(i);
                begun = 1;

                width = 32;
                height = 32;
                bpp = 4;
                if (GetDummyInfo(info->name, name, &width, &height, &bpp) != 0) {
                    TexManager.EnterTextureEX(info->block_no, name, 0, width, height, bpp, 0, 0, 0,
                                              0, 0, 0, 0, 0);
                } else {
                    int mipmap = info->unk_08;
                    int entry_block = info->block_no;

                    EnterIMGFile((u_char*)info->name, entry_block, mipmap, begun);
                }
            }
            info++;
        }
        if (begun != 0) EndEnterTextureBlock(i);
    }
    return 0;
}

int CTextureManager::EnterTextureFile(LOADTEXTURE_INFO* table)
{
    file = table;
    return 1;
}

/* Eight-bit pixels reach the GS as a 32-bit image half as wide and half as tall, so the page the
   hardware would read has to be assembled here: one page of blocks, each block reordered by the
   table below, and the whole page written back in the order the GS stores it. */
static int PageConv8to32(int width, int height, u_char* source, u_char* destination)
{
    static int block_table8[32] = {
         0,  1,  4,  5, 16, 17, 20, 21,
         2,  3,  6,  7, 18, 19, 22, 23,
         8,  9, 12, 13, 24, 25, 28, 29,
        10, 11, 14, 15, 26, 27, 30, 31
    };
    static int block_table32[32] = {
         0,  1,  4,  5, 16, 17, 20, 21,
         2,  3,  6,  7, 18, 19, 22, 23,
         8,  9, 12, 13, 24, 25, 28, 29,
        10, 11, 14, 15, 26, 27, 30, 31
    };
    int column[32];
    int row[32];
    u_char work8[256];
    u_char work32[256];
    u_char* d;
    u_char* s;
    u_char* o;
    int columns;
    int i;
    int j;
    int k;
    int n;
    int rows;
    int b;

    n = 0;
    for (i = 0; i < 4; i++) {
        for (j = 0; j < 8; j++) {
            column[block_table32[n]] = j;
            row[block_table32[n]] = i;
            n++;
        }
    }

    rows = width >> 4;
    columns = height >> 4;

    memset(work8, 0, 256);
    memset(work32, 0, 256);

    for (i = 0; i < columns; i++) {
        for (j = 0; j < rows; j++) {
            d = work8;
            s = source + i * 2048 + j * 16;
            b = block_table8[i * rows + j];

            for (k = 0; k < 16; k++) {
                memcpy(d, s, 16);
                d += 16;
                s += 128;
            }
            BlockConv8to32(work8, work32);

            d = work32;
            o = destination + row[b] * 2048 + column[b] * 32;
            for (k = 0; k < 8; k++) {
                memcpy(o, d, 32);
                d += 32;
                o += 256;
            }
        }
    }
    return 0;
}

/* One block of an 8-bit image reordered into the order the GS stores its bytes in. A block is four
   columns of sixty-four bytes and a column's arrangement depends on whether its index is odd, so
   the table is two permutations rather than one: the second half is the first with bit 2 of every
   entry inverted, and the caller picks the half from the low bit of the column it is on. */
static int BlockConv8to32(u_char* source, u_char* destination)
{
    static int lut[128] = {
         0, 36,  8, 44,  1, 37,  9, 45,
         2, 38, 10, 46,  3, 39, 11, 47,
         4, 32, 12, 40,  5, 33, 13, 41,
         6, 34, 14, 42,  7, 35, 15, 43,
        16, 52, 24, 60, 17, 53, 25, 61,
        18, 54, 26, 62, 19, 55, 27, 63,
        20, 48, 28, 56, 21, 49, 29, 57,
        22, 50, 30, 58, 23, 51, 31, 59,
         4, 32, 12, 40,  5, 33, 13, 41,
         6, 34, 14, 42,  7, 35, 15, 43,
         0, 36,  8, 44,  1, 37,  9, 45,
         2, 38, 10, 46,  3, 39, 11, 47,
        20, 48, 28, 56, 21, 49, 29, 57,
        22, 50, 30, 58, 23, 51, 31, 59,
        16, 52, 24, 60, 17, 53, 25, 61,
        18, 54, 26, 62, 19, 55, 27, 63
    };
    u_int j;
    u_int k;
    u_int i;
    int m;
    int n;
    int t;

    n = 0;
    for (i = 0; i < 4; i++) {
        m = (i & 1) * 64;
        for (j = 0; j < 16; j++) {
            for (k = 0; k < 4; k++) {
                t = lut[m];
                m++;
                destination[n] = source[t];
                n++;
            }
        }
        source += 64;
    }
    return 0;
}

static int Conv8to32(int width, int height, u_char* source, u_char* destination)
{
    u_char work8[8192];
    u_char work32[8192];
    int i;
    int j;
    int k;
    int pages_x;
    int pages_y;
    int span;
    int lines;

    memset(work8, 0, 8192);
    memset(work32, 0, 8192);
    pages_x = ((width - 1) >> 7) + 1;
    pages_y = ((height - 1) >> 6) + 1;

    if (pages_x == 1) {
        span = width * 2;
    } else {
        width = 128;
        span = 256;
    }
    if (pages_y == 1) {
        lines = height >> 1;
    } else {
        height = 64;
        lines = 32;
    }

    for (i = 0; i < pages_y; i++) {
        for (j = 0; j < pages_x; j++) {
            u_char* s = source + i * (pages_x * (width << 6)) + width * j;
            u_char* d = work8;
            u_char* o;
            u_char* p;

            for (k = 0; k < height; k++) {
                memcpy(d, s, width);
                s += width * pages_x;
                d += 128;
            }
            PageConv8to32(128, 64, work8, work32);

            o = destination + i * (pages_x * (span * lines)) + span * j;
            p = work32;
            for (k = 0; k < lines; k++) {
                memcpy(o, p, span);
                o += span * pages_x;
                p += 256;
            }
        }
    }
    return 0;
}

void CTextureManager::print_buff_info()
{
}
