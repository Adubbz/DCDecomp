#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 250

#include "mglib.hpp"
#include "types.h"

#include <eekernel.h>
#include <libdma.h>
#include <libpkt.h>
#include <sifdev.h>

#include <cmath>
#include <cstdio>
#include <cstring>

#include "collision.hpp"
#include "dataalloc.hpp"
#include "frame.hpp"
#include "mathutil.hpp"
#include "rect.hpp"
#include "texture.hpp"

extern CDataAlloc2<1> *WorkBuffer;
extern CDataAlloc2<1> *ActiveData;
extern CDataAlloc2<1> ActiveData0;
extern CDataAlloc2<1> ActiveData1;

int DBuffID;
int mgWaitVSync;
sceDmaChan *DmaCH1;
sceDmaChan *DmaCH2;
sceDmaChan *DmaCH8;
sceVif1Packet *Vif1Packet;
int VSyncField__2;
int mgClearBackFlag;
sceGsTex1 mgTEX1Env;
sceGsTest mgPixelTest;
sceGsZbuf mgZBuffer;
sceGsAlpha mgAlpha;
sceGsTexa mgTexa;

MG_PICKZ mgPickZBuff[16];
sceGifTag GiftagAD;
sceGsDBuff mgDBuff;
sceVu0FVECTOR mgBackColor;
/* The window rectangle. Its four words are written back to front at static-initialisation time,
   which CRect_i_'s own constructor does not do -- every rectangle handed to a drawing call has
   them written front to back -- so the storage is declared through a type that writes them in
   that order, and postprocess_object.py gives it the name the rest of the game reaches it by. */
class CWindowRect {
public:
    CWindowRect() {
        height = 0;
        width = 0;
        y = 0;
        x = 0;
    }

    s32 x;
    s32 y;
    s32 width;
    s32 height;
} __attribute__((aligned(16)));

CWindowRect mgWindowRectStore;
RenderInfo mgRenderInfo;

sceVu0FVECTOR mgZeroVector;
sceVu0FVECTOR mgUnitVector;
sceVu0FVECTOR mgUnitVector2;
sceVu0FVECTOR mgZeroVector2;
sceVu0FMATRIX mgUnitMatrix;
sceVu0FMATRIX mgZeroMatrix;
static sceVif1Packet vifpacket[2];
sceGsStoreImage gs_simage;
static int packetbuf[2];

static int vcount;
static int over_vsync;
static int (*VSyncCallBack2)(int);
static int call_back_active;

static int VSyncCallBack(int id) {
    iFlushCache(0);
    call_back_active = 1;
    /* Bit 13 of the GS status register is the field being displayed, and what everything downstream
       offsets by is the other one. */
    VSyncField__2 = !(bool) ((*(volatile unsigned long *) 0x12001000 >> 13) & 1);
    if (VSyncCallBack2)
        VSyncCallBack2(id);
    vcount++;
    call_back_active = 0;
    /* Ordering the stores and re-enabling interrupts are both things the compiler has no way to
       spell, and a handler that returned without the second would be a handler that runs once. */
    asm {
        sync
        ei
    }
    iFlushCache(0);
    return 0;
}

int MGGetVSyncCount() {
    return vcount;
}

void MGInit() {
    DBuffID = 0;
    mgWaitVSync = 0;
    Vif1Packet = &vifpacket[0];

    DmaCH1 = sceDmaGetChan(1);
    DmaCH2 = sceDmaGetChan(2);
    DmaCH8 = sceDmaGetChan(8);
    /* The frame is a source chain rather than a flat transfer, so channel 1 has to read the tags
       it is handed instead of treating them as data. */
    DmaCH1->chcr.TTE = 1;

    *(u_long128 *) &GiftagAD = 0;
    GiftagAD.EOP = 1;
    GiftagAD.NREG = 1;
    GiftagAD.REGS0 = SCE_GIF_PACKED_AD;

    sceGsResetGraph(0, SCE_GS_INTERLACE, SCE_GS_NTSC, SCE_GS_FIELD);
    sceGsSetDefDBuff(&mgDBuff, SCE_GS_PSMCT32, 640, 224, SCE_GS_ZGEQUAL, SCE_GS_PSMZ24, 0);

    mgWindowRect.x = 0;
    mgWindowRect.y = 0;
    mgWindowRect.width = 640;
    mgWindowRect.height = 224;

    mgBackColor[0] = 0.0f;
    mgBackColor[1] = 0.0f;
    mgBackColor[2] = 0.0f;
    mgBackColor[3] = 128.0f;
    mgClearBackFlag = 1;

    mgDBuff.clear0.rgbaq.R = (int) mgBackColor[0];
    mgDBuff.clear0.rgbaq.G = (int) mgBackColor[1];
    mgDBuff.clear0.rgbaq.B = (int) mgBackColor[2];
    mgDBuff.clear0.rgbaq.A = (int) mgBackColor[3];
    mgDBuff.clear1.rgbaq.R = (int) mgBackColor[0];
    mgDBuff.clear1.rgbaq.G = (int) mgBackColor[1];
    mgDBuff.clear1.rgbaq.B = (int) mgBackColor[2];
    mgDBuff.clear1.rgbaq.A = (int) mgBackColor[3];

    mgTEX1Env.LCM = 1;
    mgTEX1Env.MXL = 0;
    mgTEX1Env.MMAG = 1;
    mgTEX1Env.MMIN = 1;
    mgTEX1Env.MTBA = 1;
    mgTEX1Env.L = 0;
    mgTEX1Env.K = 0;

    /* The two registers the game edits per draw start from whatever the SDK's own drawing
       environment put in them, so they are copied out of it rather than built from nothing. */
    mgPixelTest = mgDBuff.draw0.test1;
    mgPixelTest.bits.ate = 1;
    mgPixelTest.bits.atst = 5;
    mgPixelTest.bits.aref = 0;
    mgPixelTest.bits.afail = 0;

    mgZBuffer = mgDBuff.draw0.zbuf1;

    mgAlpha.bits.a = 0;
    mgAlpha.bits.b = 1;
    mgAlpha.bits.c = 0;
    mgAlpha.bits.d = 1;
    mgAlpha.bits.fix = 0;

    mgTexa.TA0 = 0;
    mgTexa.TA1 = 0;
    mgTexa.AEM = 1;

    mgZeroVector[0] = 0.0f;
    mgZeroVector[1] = 0.0f;
    mgZeroVector[2] = 0.0f;
    mgZeroVector[3] = 0.0f;
    mgUnitVector[0] = 1.0f;
    mgUnitVector[1] = 1.0f;
    mgUnitVector[2] = 1.0f;
    mgUnitVector[3] = 1.0f;
    sceVu0CopyVector(mgZeroVector2, mgZeroVector);
    sceVu0CopyVector(mgUnitVector2, mgUnitVector);
    /* The second pair are the same vectors as points rather than directions, which is the whole of
       the difference between them. */
    mgZeroVector2[3] = 1.0f;
    mgUnitVector2[3] = 0.0f;

    sceVu0UnitMatrix(mgUnitMatrix);
    sceVu0UnitMatrix(mgZeroMatrix);
    mgZeroMatrix[0][0] = 0.0f;
    mgZeroMatrix[1][1] = 0.0f;
    mgZeroMatrix[2][2] = 0.0f;
    mgZeroMatrix[3][3] = 0.0f;

    CreateSinTable();

    sceGsSyncVCallback(VSyncCallBack);
    VSyncCallBack2 = 0;
    vcount = 0;
}

/* Waiting out a handler that is already running is what keeps the pointer from changing under it. */
void MGInitVSyncCallBack(int (*callback)(int)) {
    while (call_back_active)
        ;
    VSyncCallBack2 = callback;
}

/* Meant to lift each buffer to a quadword boundary and unable to: the remainder is taken over four
   bytes rather than sixteen, so it is zero for every address the caller can pass and the step never
   runs. */
void MGInitVif1Packet(u_long128 *buf0, u_long128 *buf1) {
    packetbuf[0] = (int) buf0;
    packetbuf[1] = (int) buf1;

    if (packetbuf[0] % 4)
        packetbuf[0] += (4 - packetbuf[0] % 4) * 4;
    if (packetbuf[1] % 4)
        packetbuf[1] += (4 - packetbuf[1] % 4) * 4;

    sceVif1PkInit(&vifpacket[0], (u_int *) packetbuf[0]);
    sceVif1PkInit(&vifpacket[1], (u_int *) packetbuf[1]);
    sceVif1PkReset(&vifpacket[0]);
    sceVif1PkReset(&vifpacket[1]);
}

/* The frame the capture is part-way through: it decides which of the two read-back buffers a field
   lands in, and whether this call is the one that opens and closes the file. */
static int movie_count;

/* One screenshot, written where the host filesystem can take it: the two fields are read back out
   of the frame buffer separately, packed from 32-bit colour down to the 24 a TGA holds, and
   written row by row from the bottom up, which is the order that format stores. */
void StoreImage() {
    int fd;
    int i;
    int j;
    int k;
    char *mark;
    sceVif1Packet *packet;
    u_char *field0;
    u_char *field1;
    static int image_num = 0;
    static u_char tga_head[18] = {0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 2, 192, 1, 24, 0};
    char name[128];
    char directory[128];

    movie_count = 1;

    packet = &vifpacket[DBuffID];

    printf("%d %d %d\n", image_num, DBuffID, VSyncField__2);

    if (movie_count % 2) {
        strcpy(directory, "host0:y:/ps2/capture/");
        sprintf(name, "%si%5d.tga", directory, image_num++);
        /* The width the number is padded to is what makes the names sort, and a space is not a
           character a file name can carry. */
        for (mark = name; *mark; mark++) {
            if (*mark == ' ')
                *mark = '0';
        }
        fd = sceOpen(name, SCE_WRONLY | SCE_CREAT | SCE_TRUNC);
    }

    sceGsSetHalfOffset(&mgDBuff.draw0, 2048, 2048, 0);
    sceGsSetHalfOffset(&mgDBuff.draw1, 2048, 2048, 0);
    FlushCache(0);
    sceGsSwapDBuff(&mgDBuff, DBuffID);
    FlushCache(0);
    sceGsSyncPath(0, 0);
    DmaCH1->chcr.TTE = 1;
    sceDmaSend(DmaCH1, packet->pBase);
    sceGsSyncPath(0, 0);

    sceGsSetDefStoreImage(&gs_simage, !DBuffID * 2240, 10, 0, 0, 0, 640, 224);
    FlushCache(0);
    if (movie_count % 2) {
        sceGsExecStoreImage(&gs_simage, (u_long128 *) 0x02100000);
    } else {
        sceGsExecStoreImage(&gs_simage, (u_long128 *) 0x02300000);
    }
    sceGsSyncPath(0, 0);

    sceGsSetHalfOffset(&mgDBuff.draw0, 2048, 2048, 1);
    sceGsSetHalfOffset(&mgDBuff.draw1, 2048, 2048, 1);
    FlushCache(0);
    sceGsSyncPath(0, 0);
    sceGsSwapDBuff(&mgDBuff, DBuffID);
    FlushCache(0);
    sceGsSyncPath(0, 0);
    DmaCH1->chcr.TTE = 1;
    sceDmaSend(DmaCH1, packet->pBase);
    sceGsSyncPath(0, 0);

    sceGsSetDefStoreImage(&gs_simage, !DBuffID * 2240, 10, 0, 0, 0, 640, 224);
    FlushCache(0);
    if (movie_count % 2) {
        sceGsExecStoreImage(&gs_simage, (u_long128 *) 0x02200000);
    } else {
        sceGsExecStoreImage(&gs_simage, (u_long128 *) 0x02400000);
    }
    sceGsSyncPath(0, 0);

    if (movie_count % 2) {
        sceWrite(fd, tga_head, 18);
        for (i = 0; i < 224; i++) {
            field0 = (u_char *) 0x02100000 + (((223 - i) * 640 >> 2) << 4);
            field1 = (u_char *) 0x02200000 + (((223 - i) * 640 >> 2) << 4);
            /* Packed down in place and over the row it came from: three bytes out for every four
               in, and the two colour ends swapped, which is the order a TGA stores. */
            for (j = 0, k = 0; k < 2560; j += 3, k += 4) {
                u_char red = field0[k];
                field0[k] = field0[k + 2];
                field0[k + 2] = red;
                red = field1[k];
                field1[k] = field1[k + 2];
                field1[k + 2] = red;

                field0[j] = field0[k];
                field0[j + 1] = field0[k + 1];
                field0[j + 2] = field0[k + 2];
                field1[j] = field1[k];
                field1[j + 1] = field1[k + 1];
                field1[j + 2] = field1[k + 2];
            }
            sceWrite(fd, field1, 1920);
            sceWrite(fd, field0, 1920);
        }
    }

    if (movie_count % 2) {
        sceClose(fd);
    }
    movie_count++;
}

static int h_count;

void MGBeginFrame() {
    /* Timer 0's count at the top of the frame, which MGEndFrame subtracts from the count at the
       bottom to say how long the frame took. */
    h_count = *(volatile u_int *) 0x10000000;

    mgDBuff.clear0.rgbaq.R = (int) mgBackColor[0];
    mgDBuff.clear0.rgbaq.G = (int) mgBackColor[1];
    mgDBuff.clear0.rgbaq.B = (int) mgBackColor[2];
    mgDBuff.clear0.rgbaq.A = (int) mgBackColor[3];
    mgDBuff.clear1.rgbaq.R = (int) mgBackColor[0];
    mgDBuff.clear1.rgbaq.G = (int) mgBackColor[1];
    mgDBuff.clear1.rgbaq.B = (int) mgBackColor[2];
    mgDBuff.clear1.rgbaq.A = (int) mgBackColor[3];

    Vif1Packet = &vifpacket[DBuffID];
    sceVif1PkReset(Vif1Packet);

    if (DBuffID) {
        ActiveData = &ActiveData0;
    } else {
        ActiveData = &ActiveData1;
    }
    ActiveData->used = 0;
    WorkBuffer->used = 0;

    *(u_long128 *) &GiftagAD = 0;
    GiftagAD.EOP = 1;
    GiftagAD.NREG = 1;
    GiftagAD.REGS0 = SCE_GIF_PACKED_AD;

    mgZeroVector[0] = 0.0f;
    mgZeroVector[1] = 0.0f;
    mgZeroVector[2] = 0.0f;
    mgZeroVector[3] = 0.0f;
    mgUnitVector[0] = 1.0f;
    mgUnitVector[1] = 1.0f;
    mgUnitVector[2] = 1.0f;
    mgUnitVector[3] = 1.0f;
    sceVu0CopyVector(mgZeroVector2, mgZeroVector);
    sceVu0CopyVector(mgUnitVector2, mgUnitVector);
    mgZeroVector2[3] = 1.0f;
    mgUnitVector2[3] = 0.0f;

    sceVu0UnitMatrix(mgUnitMatrix);
    sceVu0UnitMatrix(mgZeroMatrix);
    mgZeroMatrix[0][0] = 0.0f;
    mgZeroMatrix[1][1] = 0.0f;
    mgZeroMatrix[2][2] = 0.0f;
    mgZeroMatrix[3][3] = 0.0f;

    if (mgClearBackFlag) {
        MGClearScreen(mgDBuff.clear0.rgbaq.R, mgDBuff.clear0.rgbaq.G, mgDBuff.clear0.rgbaq.B,
                      mgDBuff.clear0.rgbaq.A);
    } else {
        MGClearZBuffer(0);
    }
}

static void WaitVSync(int count) {
    int i, j;

    while (1) {
        int now = MGGetVSyncCount();
        /* The gap between polls has to cost something and do nothing, which is what a body that
           negates its own counter twice is: the count is the whole of the effect. */
        for (i = 0; i < 10; i++) {
            i = -i;
            i = -i;
        }
        if (count != now)
            return;
        for (j = 0; j < 10; j++) {
            j = -j;
            j = -j;
        }
    }
}

void MGEndFrame() {
    int i;
    int nearest;
    int j;
    static int count = 1;
    static long old_vcount = 0;

    if (count == 0) {
        printf("CPU %4.1f%%,", 100.0f * ((u_int) (*(volatile u_int *) 0x10000000 - h_count) / 262.0f));
    }

    sceVif1PkEnd(Vif1Packet, 0);
    sceVif1PkTerminate(Vif1Packet);
    if (sceGsSyncPath(0, 0) < 0) {
        printf("******\n");
        printf("base = %x,cuur = %x\n", Vif1Packet->pBase, Vif1Packet->pCurrent);
        printf("abuff = %d\n", ActiveData->limit - ActiveData->used);
        Exit(-1);
    }

    /* Every picking request the frame collected, answered by reading the depth the frame just
       drew: an eight-by-eight block of the Z buffer around the point, and the nearest sample in
       it. A point too close to an edge for that block has no answer and gets -1. */
    for (i = 0; i < 16; i++) {
        if (mgPickZBuff[i].enable) {
            if (mgPickZBuff[i].x < 4 || mgPickZBuff[i].x > 636) {
                mgPickZBuff[i].z = -1;
            } else if (mgPickZBuff[i].y < 4 || mgPickZBuff[i].y > 444) {
                mgPickZBuff[i].z = -1;
            } else {
                WorkBuffer->used = 0;
                int *block = (int *) WorkBuffer->Alloc(2048);

                FlushCache(0);
                sceGsSetDefStoreImage(&gs_simage, (mgZBuffer.bits.zbp << 11) >> 6, 10, 48,
                                      mgPickZBuff[i].x - 4, (mgPickZBuff[i].y >> 1) - 4, 8, 8);
                FlushCache(0);
                sceGsExecStoreImage(&gs_simage, (u_long128 *) block);
                sceGsSyncPath(0, 0);

                nearest = block[0];
                nearest &= 0xffffff;
                for (j = 0; j < 64; j++) {
                    int depth = block[j] & 0xffffff;
                    if (depth < nearest)
                        nearest = depth;
                }
                mgPickZBuff[i].z = nearest;
            }
        }
    }

    DmaCH1->chcr.TTE = 1;

    u_int flip = *(volatile u_int *) 0x10000000;

    /* A sync passed between the last flip and this one, so the field parity the handler recorded
       describes a field this frame is no longer in and everything keyed on it drops out. */
    over_vsync = 0;
    if (old_vcount != vcount) {
        over_vsync = 1;
    }
    if (mgWaitVSync) {
        old_vcount = vcount;
    }
    WaitVSync(old_vcount);
    old_vcount = vcount;

    static int capture = 0;
    static int capture_start = 0;

    if (capture && VSyncField__2) {
        StoreImage();
        capture = 0;
    }

    if (count == 0) {
        printf("FREE %4.1f%%\n", 100.0f * ((u_int) (*(volatile u_int *) 0x10000000 - flip) / 262.0f));
    }
    count++;
    if (count > 60) {
        count = 0;
    }

    sceGsSetHalfOffset(DBuffID ? &mgDBuff.draw1 : &mgDBuff.draw0, 2048, 2048,
                       (short) VSyncField__2 * !over_vsync);
    FlushCache(0);
    sceGsSwapDBuff(&mgDBuff, DBuffID);
    sceDmaSync(DmaCH2, 0, 0);

    static int f = 0;
    f++;

    DmaCH1 = sceDmaGetChan(1);
    DmaCH1->chcr.TTE = 1;
    FlushCache(0);
    sceDmaSend(DmaCH1, Vif1Packet->pBase);
    DBuffID = !DBuffID;
}

void MGFlipWaitVSync(int wait) {
    mgWaitVSync = wait;
}

/* Everything a frame is drawn against, recomputed from the projection scale and the two clip planes.
   The depth it sets up runs from 16700000 at the near plane down to 1 at the far one, which is what
   both z solves below are for. */
void MGSetRenderInfo(float scale, float near_z, float far_z) {
    float two_near;
    sceVu0FMATRIX perspective;
    float w = 1.0f;

    float z_range = 16699999;

    float nf = near_z * far_z;
    float z_scale = nf * z_range / (far_z - near_z);
    float z_offset = -(16700000 * near_z - w * far_z) / (far_z - near_z);

    mgRenderInfo.projection = scale;
    mgRenderInfo.scale[0] = scale;
    mgRenderInfo.scale[1] = scale;
    mgRenderInfo.scale[2] = z_scale;
    mgRenderInfo.offset[0] = 2048.0f;
    mgRenderInfo.offset[1] = 2048.0f;
    mgRenderInfo.offset[2] = z_offset;
    mgRenderInfo.near[0] = 0.0f;
    mgRenderInfo.near[1] = 0.0f;
    mgRenderInfo.near[2] = near_z;
    mgRenderInfo.far[0] = 4095.9f;
    mgRenderInfo.far[1] = 4095.9f;
    mgRenderInfo.far[2] = far_z;

    mgRenderInfo.clip_min[0] = 0.0f;
    mgRenderInfo.clip_min[1] = 0.0f;
    mgRenderInfo.clip_min[2] = 0.0f;
    mgRenderInfo.clip_min[3] = mgRenderInfo.near[2];
    mgRenderInfo.clip_max[0] = 4095.9f;
    mgRenderInfo.clip_max[1] = 4095.9f;
    mgRenderInfo.clip_max[2] = 0.0f;
    mgRenderInfo.clip_max[3] = mgRenderInfo.far[2];

    sceVu0UnitMatrix(perspective);

    float near_clip = mgRenderInfo.near[2];
    float far_clip = mgRenderInfo.far[2];
    float projection = mgRenderInfo.scale[0];
    float half_height = 2047 * near_clip / projection;

    two_near = 2.0f * near_clip;
    perspective[0][0] = two_near / (half_height + half_height);
    perspective[1][1] = perspective[0][0];
    perspective[2][2] = (far_clip + near_clip) / (far_clip - near_clip);
    perspective[3][2] = -2.0f * (far_clip * near_clip) / (far_clip - near_clip);
    perspective[2][3] = 1.0f;
    perspective[3][3] = 0.0f;
    sceVu0CopyMatrix(mgRenderInfo.perspective, perspective);

    float z_max = 16700000;

    sceVu0UnitMatrix(mgRenderInfo.viewport);
    mgRenderInfo.viewport[0][0] = half_height * (projection * w) / near_clip;
    mgRenderInfo.viewport[1][1] = mgRenderInfo.viewport[0][0];
    mgRenderInfo.viewport[2][2] = (-z_max + w) / 2.0f;
    mgRenderInfo.viewport[3][2] = 8350000.5f;
    mgRenderInfo.viewport[3][0] = 2048.0f;
    mgRenderInfo.viewport[3][1] = 2048.0f;
    mgRenderInfo.viewport[3][3] = w;
}

void MGSetProjection(float scale) {
    MGSetRenderInfo(scale, mgRenderInfo.near[2], mgRenderInfo.far[2]);
}

float MGGetProjection() {
    return mgRenderInfo.projection;
}

/* The scissor the whole frame is drawn inside, sent down the frame's own packet rather than kept
   in the draw environment: the rectangle is an origin and an extent, so the far edges are the near
   ones plus the width and the height. */
void MGSetWindowRect() {
    sceGsScissor scissor;
    sceVif1Packet *packet;

    mgWindowRect.x = 0;
    mgWindowRect.y = 0;
    mgWindowRect.width = 640;
    mgWindowRect.height = 224;

    scissor.SCAX0 = mgWindowRect.x >> 1;
    scissor.SCAX1 = mgWindowRect.x + mgWindowRect.width;
    scissor.SCAY0 = mgWindowRect.y;
    scissor.SCAY1 = mgWindowRect.y + mgWindowRect.height;

    packet = GetVif1Packet();
    sceVif1PkCnt(packet, 0);
    sceVif1PkOpenDirectCode(packet, 0);
    sceVif1PkOpenGifTag(packet, *(u_long128 *) &GiftagAD);
    sceVif1PkAddGsAD(packet, SCE_GS_SCISSOR_1, *(u_long *) &scissor);
    sceVif1PkCloseGifTag(packet);
    sceVif1PkCloseDirectCode(packet);
}

void MGSetWindowRect(CRect_i_ rect) {
    sceGsScissor scissor;
    sceVif1Packet *packet;

    mgWindowRect = rect;

    scissor.SCAX0 = mgWindowRect.x >> 1;
    scissor.SCAX1 = mgWindowRect.x + mgWindowRect.width;
    scissor.SCAY0 = mgWindowRect.y;
    scissor.SCAY1 = mgWindowRect.y + mgWindowRect.height;

    packet = GetVif1Packet();
    sceVif1PkCnt(packet, 0);
    sceVif1PkOpenDirectCode(packet, 0);
    sceVif1PkOpenGifTag(packet, *(u_long128 *) &GiftagAD);
    sceVif1PkAddGsAD(packet, SCE_GS_SCISSOR_1, *(u_long *) &scissor);
    sceVif1PkCloseGifTag(packet);
    sceVif1PkCloseDirectCode(packet);
}

void MGSetPLight(sceVu0FMATRIX light, sceVu0FMATRIX color) {
    sceVu0CopyMatrix(mgRenderInfo.light_direction, light);
    sceVu0CopyMatrix(mgRenderInfo.light_color, color);
    mgRenderInfo.light_color[0][3] = 0.0f;
    mgRenderInfo.light_color[1][3] = 0.0f;
    mgRenderInfo.light_color[2][3] = 0.0f;
    mgRenderInfo.light_color[3][3] = 0.0f;
    mgRenderInfo.light_direction[3][0] = 0.0f;
    mgRenderInfo.light_direction[3][1] = 0.0f;
    mgRenderInfo.light_direction[3][2] = 0.0f;
    mgRenderInfo.light_direction[3][3] = 0.0f;
}

void MGGetPLight(sceVu0FMATRIX light, sceVu0FMATRIX color) {
    sceVu0CopyMatrix(light, mgRenderInfo.light_direction);
    sceVu0CopyMatrix(color, mgRenderInfo.light_color);
}

void MGSetAmbient(float *color) {
    sceVu0CopyVector(mgRenderInfo.ambient, color);
}

void MGGetAmbient(float *color) {
    sceVu0CopyVector(color, mgRenderInfo.ambient);
}

/* The two overloads below are the only callers and both pass the same two scales, so the vertical
   squeeze is the engine's rather than any caller's. */
static void MGSetViewMatrix_sub(sceVu0FMATRIX view, float x_scale, float y_scale) {
    sceVu0FMATRIX scale;
    sceVu0FMATRIX screen;
    sceVu0FVECTOR direction;
    sceVu0FVECTOR flat;

    sceVu0CopyMatrix(mgRenderInfo.view, view);
    mgRenderInfo.position[0] = view[3][0];
    mgRenderInfo.position[1] = view[3][1];
    mgRenderInfo.position[2] = view[3][2];
    mgRenderInfo.position[3] = 0.0f;

    sceVu0UnitMatrix(scale);
    scale[0][0] = x_scale;
    scale[1][1] = y_scale;
    MulMatrix(mgRenderInfo.view_scaled, scale, view);

    sceVu0UnitMatrix(screen);
    screen[1][1] = mgRenderInfo.scale[0];
    screen[0][0] = mgRenderInfo.scale[0];
    screen[2][2] = mgRenderInfo.offset[2];
    screen[3][3] = 0.0f;
    screen[2][1] = 2048.0f;
    screen[2][0] = 2048.0f;
    screen[2][3] = 1.0f;
    screen[3][2] = mgRenderInfo.scale[2];
    MulMatrix(mgRenderInfo.view_screen, screen, mgRenderInfo.view_scaled);
    sceVu0CopyMatrix(mgRenderInfo.screen, screen);

    direction[0] = -mgRenderInfo.view[0][2];
    direction[1] = -mgRenderInfo.view[1][2];
    direction[2] = -mgRenderInfo.view[2][2];
    direction[3] = 0.0f;
    flat[0] = direction[0];
    flat[1] = 0.0f;
    flat[2] = direction[2];
    flat[3] = 0.0f;
    sceVu0Normalize(flat, flat);
    mgRenderInfo.yaw = atan2f(flat[0], flat[2]);
    mgRenderInfo.pitch =
        -atan2f(direction[1], sqrtf(direction[0] * direction[0] + direction[2] * direction[2]));
    /* Both angles are already stored by here, so the direction is normalised into a local that
       goes out of scope with the call and nothing ever reads. */
    direction[3] = 0.0f;
    sceVu0Normalize(direction, direction);
}

void MGSetViewMatrix(sceVu0FMATRIX view) {
    MGSetViewMatrix_sub(view, 1.0f, 0.47f);
}

void MGSetViewMatrix(sceVu0FMATRIX view, float *position) {
    MGSetViewMatrix(view);
    sceVu0CopyVector(mgRenderInfo.view_position, position);
    mgRenderInfo.position[0] = position[0];
    mgRenderInfo.position[1] = position[1];
    mgRenderInfo.position[2] = position[2];
    mgRenderInfo.position[3] = 0.0f;
}

void MGSetFogParm(float near_z, float far_z, u_char r, u_char g, u_char b, float far_fog,
                  float near_fog) {
    mgRenderInfo.fog_far = far_fog;
    mgRenderInfo.fog_near = near_fog;
    mgRenderInfo.fog_a =
        ((far_fog + near_fog) + (far_fog - near_fog) * (far_z + near_z) / (far_z - near_z)) / 2.0f;
    mgRenderInfo.fog_b = -far_z * near_z * (far_fog - near_fog) / (far_z - near_z);
    mgRenderInfo.fog_red = r;
    mgRenderInfo.fog_green = g;
    mgRenderInfo.fog_blue = b;
}

/* A colour every component of which is negative is the request not to clear at all; anything else
   clears, and each component is clamped into the eight bits the clear is written through. */
void MGSetBGColor(float r, float g, float b, float a) {
    if (r < 0.0f && g < 0.0f && b < 0.0f && a < 0.0f) {
        mgClearBackFlag = 0;
    } else {
        mgClearBackFlag = 1;
    }

    if (r < 0.0f)
        r = 0.0f;
    if (g < 0.0f)
        g = 0.0f;
    if (b < 0.0f)
        b = 0.0f;
    if (a < 0.0f)
        a = 0.0f;
    if (r > 255.0f)
        r = 255.0f;
    if (g > 255.0f)
        g = 255.0f;
    if (b > 255.0f)
        b = 255.0f;
    if (a > 255.0f)
        a = 255.0f;

    mgBackColor[0] = r;
    mgBackColor[1] = g;
    mgBackColor[2] = b;
    mgBackColor[3] = a;
}

void MGSetBGColor(float *color) {
    MGSetBGColor(color[0], color[1], color[2], color[3]);
}

void MGGetBGColor(float *color) {
    sceVu0CopyVector(color, mgBackColor);
}

void MGScisioringForce(int force) {
    mgRenderInfo.scissoring = force;
}

sceVif1Packet *GetVif1Packet() {
    return Vif1Packet;
}

/* A point through the camera and onto the screen, in floats rather than on the Vector Unit: the
   view is applied, the perspective divide is done by hand, and the screen scale and offset the
   render info carries turn the result into the 12.4 fixed point the GS takes. The answer says
   whether the point is on screen, and a point behind the near plane is answered no and clamped to
   the plane rather than divided by. */
int MGRotTransPers(int *screen, float *position, int fog) {
    sceVu0FVECTOR point;
    int visible = 1;
    float w;

    sceVu0ApplyMatrix(point, mgRenderInfo.view_scaled, position);

    if (point[2] < 1.0f) {
        visible = 0;
        point[2] = 1.0f;
    }
    w = 1.0f / point[2];

    point[0] *= w;
    point[1] *= w;
    point[0] *= mgRenderInfo.scale[0];
    point[1] *= mgRenderInfo.scale[1];
    point[2] = w * mgRenderInfo.scale[2];
    point[0] += mgRenderInfo.offset[0];
    point[1] += mgRenderInfo.offset[1];
    point[2] += mgRenderInfo.offset[2];

    screen[0] = (int) (16.0f * point[0]);
    screen[1] = (int) (16.0f * point[1]);
    screen[2] = (int) point[2];

    if (fog) {
        float density = mgRenderInfo.fog_a + mgRenderInfo.fog_b * w;
        if (mgRenderInfo.fog_far > density)
            density = mgRenderInfo.fog_far;
        if (mgRenderInfo.fog_near < density)
            density = mgRenderInfo.fog_near;
        screen[3] = (int) density;
    }

    if (point[0] < 0.0f || point[1] < 0.0f || point[0] > 4095 || point[1] > 4095) {
        visible = 0;
    }
    return visible;
}

/* The same transform for something drawn flat against the screen: the vertical squeeze
   MGSetViewMatrix_sub bakes into the view is undone, the result is left in whole pixels rather than
   scaled into 12.4, and the pair is moved off the screen centre the offset put it at. */
int MGRotTransPers2D(int *screen, float *position, int fog) {
    sceVu0FVECTOR point;
    int visible = 1;
    float w;

    sceVu0ApplyMatrix(point, mgRenderInfo.view_scaled, position);

    if (point[2] < 1.0f) {
        visible = 0;
        point[2] = 1.0f;
    }
    w = 1.0f / point[2];

    point[0] *= w;
    point[1] *= 2.0f * w;
    point[0] *= mgRenderInfo.scale[0];
    point[1] *= mgRenderInfo.scale[1];
    point[2] = w * mgRenderInfo.scale[2];
    point[0] += mgRenderInfo.offset[0];
    point[1] += mgRenderInfo.offset[1];
    point[2] += mgRenderInfo.offset[2];

    screen[0] = (int) point[0];
    screen[1] = (int) point[1];
    screen[2] = (int) point[2];

    if (fog) {
        float density = mgRenderInfo.fog_a + mgRenderInfo.fog_b * w;
        if (mgRenderInfo.fog_far > density)
            density = mgRenderInfo.fog_far;
        if (mgRenderInfo.fog_near < density)
            density = mgRenderInfo.fog_near;
        screen[3] = (int) density;
    }

    if (point[0] < 0.0f || point[1] < 0.0f || point[0] > 4095 || point[1] > 4095) {
        visible = 0;
    }

    screen[0] -= 1728;
    screen[1] -= 1824;
    return visible;
}

/* Both of a screen-facing sprite's opposite corners out of a single transform: the half-width and
   half-height are scaled by the render info once and then by the same Q the perspective divide
   produced, so the second corner costs an add rather than a second pass through the matrix. The
   matrix is the one that already carries the screen scale and offset, which is what leaves the
   result ready for vftoi4 without the arithmetic MGRotTransPers does by hand. Whether the sprite is
   on screen is read off the Vector Unit's sticky status flags rather than compared as floats: four
   subtractions leave a bit set for any field that came out zero or negative, testing both corners
   against 0 and against 4096.0 and, through w, against the eye. */
int MGRotTransPers3DSprite(register int *corner0, register int *corner1, register float *position,
                           float width, float height, int fog) {
    sceVu0FVECTOR half;
    register float *half_size;
    register float *view;
    register int visible = 0;

    half[0] = 0.5f * width * mgRenderInfo.scale[0];
    half[1] = 0.5f * height * mgRenderInfo.scale[1];

    if (!fog) {
        view = &mgRenderInfo.view_screen[0][0];
        half_size = half;

        asm {
            lqc2    vf1, 0(view)
            lqc2    vf2, 16(view)
            lqc2    vf3, 32(view)
            lqc2    vf4, 48(view)
            lqc2    vf5, 0(position)
            lqc2    vf6, 0(half_size)
            vmulax  ACC, vf1, vf5
            vmadday ACC, vf2, vf5
            vmaddaz ACC, vf3, vf5
            vmaddw  vf10, vf4, vf5
            vdiv    Q, vf0w, vf10w
            vwaitq
            vmulq.xyz vf10, vf10, Q
            vmulq.xy  vf6, vf6, Q
            vmove   vf11, vf10
            vmove   vf12, vf10
            vsub.xy vf11, vf11, vf6
            vadd.xy vf12, vf12, vf6
            vsub    vf20, vf0, vf0
            ori     visible, $0, 0x4580
            dsll    visible, visible, 16
            dsll    visible, visible, 16
            ori     visible, visible, 0x4580
            dsll    visible, visible, 16
            qmtc2   visible, vf21
            ctc2    $0, $16
            vsub.xyw vf25, vf11, vf20
            vsub.xy  vf25, vf21, vf11
            vsub.xyw vf25, vf12, vf20
            vsub.xy  vf25, vf21, vf12
            vnop
            vnop
            vnop
            vnop
            vnop
            cfc2    visible, $16
            andi    visible, visible, 0xc0
            vftoi4.xy vf11, vf11
            vftoi0.z  vf11, vf11
            vftoi4.xy vf12, vf12
            vftoi0.z  vf12, vf12
            sqc2    vf11, 0(corner0)
            sqc2    vf12, 0(corner1)
            sltu    visible, $0, visible
            xori    visible, visible, 0x1
            andi    visible, visible, 0xff
        }
    } else {
        sceVu0FVECTOR fog_parm = {0.0f, 0.0f, 0.0f, 0.0f};
        register float *fog_range;
        register float *fog_view;

        fog_parm[0] = mgRenderInfo.fog_a;
        fog_parm[1] = mgRenderInfo.fog_near;
        fog_parm[2] = mgRenderInfo.fog_far;
        fog_parm[3] = mgRenderInfo.fog_b;

        fog_view = &mgRenderInfo.view_screen[0][0];
        half_size = half;
        fog_range = fog_parm;

        asm {
            lqc2    vf1, 0(fog_view)
            lqc2    vf2, 16(fog_view)
            lqc2    vf3, 32(fog_view)
            lqc2    vf4, 48(fog_view)
            lqc2    vf5, 0(position)
            lqc2    vf6, 0(half_size)
            lqc2    vf7, 0(fog_range)
            vmulax  ACC, vf1, vf5
            vmadday ACC, vf2, vf5
            vmaddaz ACC, vf3, vf5
            vmaddw  vf10, vf4, vf5
            vdiv    Q, vf0w, vf10w
            vwaitq
            vmulq.xyz vf10, vf10, Q
            vmulq.xy  vf6, vf6, Q
            vmulax.w  ACC, vf0, vf7
            vmaddq.w  vf31, vf7, Q
            vminiy.w  vf31, vf31, vf7
            vmaxz.w   vf31, vf31, vf7
            vmove   vf11, vf10
            vmove   vf12, vf10
            vsub.xy vf11, vf11, vf6
            vadd.xy vf12, vf12, vf6
            vsub    vf20, vf0, vf0
            ori     visible, $0, 0x4580
            dsll    visible, visible, 16
            dsll    visible, visible, 16
            ori     visible, visible, 0x4580
            dsll    visible, visible, 16
            qmtc2   visible, vf21
            ctc2    $0, $16
            vsub.xyw vf25, vf11, vf20
            vsub.xy  vf25, vf21, vf11
            vsub.xyw vf25, vf12, vf20
            vsub.xy  vf25, vf21, vf12
            vnop
            vnop
            vnop
            vnop
            vnop
            cfc2    visible, $16
            andi    visible, visible, 0xc0
            vftoi4.xy vf11, vf11
            vftoi0.z  vf11, vf11
            vftoi0.w  vf11, vf31
            vftoi4.xy vf12, vf12
            vftoi0.z  vf12, vf12
            vftoi0.w  vf12, vf31
            sqc2    vf11, 0(corner0)
            sqc2    vf12, 0(corner1)
            sltu    visible, $0, visible
            xori    visible, visible, 0x1
            andi    visible, visible, 0xff
        }
    }

    if (visible == 0) {
        return 0;
    }
    return visible;
}

/* One vertex colour from one normal, on the Vector Unit in macro mode: the normal through the three
   light directions, clamped up at zero so a light behind the surface contributes nothing, then the
   four light colours accumulated onto the ambient and clamped down at 255. The caller's own buffer
   is where the ceiling comes from — 255 is written into it first and read straight back as a
   quadword, so the clamp costs no constant of its own. */
void MGCalcColor(register float *color, register float *normal) {
    register float *intensity;
    register float *direction;
    register float *ambient;

    color[0] = 255.0f;

    direction = &mgRenderInfo.light_direction[0][0];
    intensity = &mgRenderInfo.light_color[0][0];
    ambient = mgRenderInfo.ambient;

    asm {
        lqc2    vf20, 0(color)
        lqc2    vf10, 0(normal)
        lqc2    vf1, 0(direction)
        lqc2    vf2, 16(direction)
        lqc2    vf3, 32(direction)
        lqc2    vf5, 0(intensity)
        lqc2    vf6, 16(intensity)
        lqc2    vf7, 32(intensity)
        lqc2    vf8, 48(intensity)
        lqc2    vf9, 0(ambient)
        vmulax  ACC, vf1, vf10
        vmadday ACC, vf2, vf10
        vmaddz  vf11, vf3, vf10
        vnop
        vnop
        vnop
        vmaxx   vf12, vf11, vf0
        vnop
        vnop
        vmulaw  ACC, vf9, vf0
        vmaddax ACC, vf5, vf12
        vmadday ACC, vf6, vf12
        vmaddaz ACC, vf7, vf12
        vmaddw  vf13, vf8, vf12
        vnop
        vnop
        vnop
        vminix  vf14, vf13, vf20
        vnop
        vnop
        vnop
        sqc2    vf14, 0(color)
    }
}

/* Where one point falls outside the screen, as six bits rather than a yes or no: near, far, and one
   per side. The half-widths are the guard band's and not the window's, so a point off the edge is
   still inside until it is off by half a screen. A point at or behind the eye keeps its bits and
   has every side test reversed, which is what makes the caller's running AND mean the same thing
   for a corner in front and a corner behind. */
int MGClipVertex(float *position) {
    sceVu0FVECTOR point;
    int outside = 0;
    float w;
    float offset;
    float half_width = 320.0f;
    float half_height = 112.0f;

    sceVu0ApplyMatrix(point, mgRenderInfo.view_screen, position);

    if (0.0f == point[3]) {
        point[3] = 1.0f;
    }
    w = 1.0f / point[3];
    point[0] *= w;
    point[1] *= w;

    if (point[3] < mgRenderInfo.near[2])
        outside |= 0x20;
    if (point[3] > mgRenderInfo.far[2])
        outside |= 0x10;

    if (point[3] > 0.0f) {
        offset = point[1] - mgRenderInfo.offset[1];
        if (offset < -half_height)
            outside |= 0x8;
        if (offset > half_height)
            outside |= 0x4;
        offset = point[0] - mgRenderInfo.offset[0];
        if (offset < -half_width)
            outside |= 0x2;
        if (offset > half_width)
            outside |= 0x1;
    } else {
        offset = point[1] - mgRenderInfo.offset[1];
        if (offset > -half_height)
            outside |= 0x8;
        if (offset < half_height)
            outside |= 0x4;
        offset = point[0] - mgRenderInfo.offset[0];
        if (offset > -half_width)
            outside |= 0x2;
        if (offset < half_width)
            outside |= 0x1;
    }
    return outside;
}

/* A bound rejected only when every one of its eight corners is outside the same side, which is what
   the running AND of the six bits says. Answering zero is answering "keep it": a corner that is
   inside everything has no bits at all and ends the walk on the spot. */
int MGClipBox(CBoxVu0 *box) {
    sceVu0FVECTOR corner[8];
    /* Only two of these are ever filled. The frame leaves twelve to sixteen bytes for the array,
       which is what rules two out; three and four are the same bytes and this is the tidier. */
    float *extreme[4];
    int i;
    int outside;

    extreme[0] = box->min;
    extreme[1] = box->max;
    outside = 63;

    for (i = 0; i < 8; i++) {
        corner[i][3] = 1.0f;
        corner[i][0] = extreme[(i & 1) != 0][0];
        corner[i][1] = extreme[(i & 2) != 0][1];
        corner[i][2] = extreme[(i & 4) != 0][2];

        int bits = MGClipVertex(corner[i]);
        if (!bits)
            return 0;
        outside &= bits;
        if (!outside)
            return 0;
    }
    return 1;
}

void MGDraw(CFrame *frame) {
    if (frame) {
        sceVif1PkTerminate(Vif1Packet);
        sceVif1PkReserve(Vif1Packet, frame->DrawVu1(Vif1Packet->pCurrent, &mgRenderInfo));
    }
}

/* Each of the four takes the register it names down the frame's packet, and a null argument means
   the module's own copy of that register rather than nothing to send. */
void MGSetGsTEST(sceGsTest *test) {
    sceVif1Packet *packet;

    packet = GetVif1Packet();
    sceVif1PkCnt(packet, 0);
    sceVif1PkOpenDirectCode(packet, 0);
    sceVif1PkOpenGifTag(packet, *(u_long128 *) &GiftagAD);
    if (test) {
        sceVif1PkAddGsAD(packet, SCE_GS_TEST_1, *(u_long *) test);
    } else {
        sceVif1PkAddGsAD(packet, SCE_GS_TEST_1, *(u_long *) &mgPixelTest);
    }
    sceVif1PkCloseGifTag(packet);
    sceVif1PkCloseDirectCode(packet);
}

void MGSetGsZBUF(sceGsZbuf *zbuf) {
    sceVif1Packet *packet;

    packet = GetVif1Packet();
    sceVif1PkCnt(packet, 0);
    sceVif1PkOpenDirectCode(packet, 0);
    sceVif1PkOpenGifTag(packet, *(u_long128 *) &GiftagAD);
    if (zbuf) {
        sceVif1PkAddGsAD(packet, SCE_GS_ZBUF_1, *(u_long *) zbuf);
    } else {
        sceVif1PkAddGsAD(packet, SCE_GS_ZBUF_1, *(u_long *) &mgZBuffer);
    }
    sceVif1PkCloseGifTag(packet);
    sceVif1PkCloseDirectCode(packet);
}

void MGSetGsALPHA(sceGsAlpha *alpha) {
    sceVif1Packet *packet;

    packet = GetVif1Packet();
    sceVif1PkCnt(packet, 0);
    sceVif1PkOpenDirectCode(packet, 0);
    sceVif1PkOpenGifTag(packet, *(u_long128 *) &GiftagAD);
    if (alpha) {
        sceVif1PkAddGsAD(packet, SCE_GS_ALPHA_1, *(u_long *) alpha);
    } else {
        sceVif1PkAddGsAD(packet, SCE_GS_ALPHA_1, *(u_long *) &mgAlpha);
    }
    sceVif1PkCloseGifTag(packet);
    sceVif1PkCloseDirectCode(packet);
}

void MGSetGsTEXA(sceGsTexa *texa) {
    sceVif1Packet *packet;

    packet = GetVif1Packet();
    sceVif1PkCnt(packet, 0);
    sceVif1PkOpenDirectCode(packet, 0);
    sceVif1PkOpenGifTag(packet, *(u_long128 *) &GiftagAD);
    if (texa) {
        sceVif1PkAddGsAD(packet, SCE_GS_TEXA, *(u_long *) texa);
    } else {
        sceVif1PkAddGsAD(packet, SCE_GS_TEXA, *(u_long *) &mgTexa);
    }
    sceVif1PkCloseGifTag(packet);
    sceVif1PkCloseDirectCode(packet);
}

/* The frame buffer read back as a texture, which is what every effect that samples the picture it
   is drawing over needs: a frame buffer page is 32 texture blocks, and the size is the largest the
   register can name rather than the buffer's own. */
void MGGetFBuffTex(sceGsTex0 *tex) {
    sceGsFrame *frame = DBuffID ? &mgDBuff.draw1.frame1 : &mgDBuff.draw0.frame1;

    *(u_long *) tex = SCE_GS_SET_TEX0(frame->FBP << 5, frame->FBW, frame->PSM, 10, 8, 0, 0, 0, 0, 0,
                                      0, 0);
}

void MGGetFBuffBackTex(sceGsTex0 *tex) {
    sceGsFrame *frame = DBuffID ? &mgDBuff.draw0.frame1 : &mgDBuff.draw1.frame1;

    *(u_long *) tex = SCE_GS_SET_TEX0(frame->FBP << 5, frame->FBW, frame->PSM, 10, 8, 0, 0, 0, 0, 0,
                                      0, 0);
}

/* A rectangle moved from one place in GS local memory to another, which is the transfer the GS
   does entirely on its own side: four registers down the frame's packet and no pixels through the
   bus. The second packet is a TEXFLUSH on its own, because the destination may be a texture the
   cache still holds the old contents of. */
void MGMoveImage(sceGsTex0 *src, const CRect_i_ &rect, sceGsTex0 *dst, int dsax, int dsay,
                 int dir) {
    sceVif1Packet *packet;

    packet = Vif1Packet;
    sceVif1PkCnt(packet, 0);
    sceVif1PkOpenDirectCode(packet, 0);
    sceVif1PkOpenGifTag(packet, *(u_long128 *) &GiftagAD);
    sceVif1PkAddGsAD(packet, SCE_GS_BITBLTBUF,
                     SCE_GS_SET_BITBLTBUF(src->TBP0, src->TBW, src->PSM, dst->TBP0, dst->TBW,
                                          dst->PSM));
    sceVif1PkAddGsAD(packet, SCE_GS_TRXPOS, SCE_GS_SET_TRXPOS(rect.x, rect.y, dsax, dsay, dir));
    sceVif1PkAddGsAD(packet, SCE_GS_TRXREG, SCE_GS_SET_TRXREG(rect.width, rect.height));
    sceVif1PkAddGsAD(packet, SCE_GS_TRXDIR, SCE_GS_SET_TRXDIR(SCE_GS_LOCAL_LOCAL));
    sceVif1PkCloseGifTag(packet);
    sceVif1PkCloseDirectCode(packet);

    sceVif1PkCnt(packet, 0);
    sceVif1PkOpenDirectCode(packet, 0);
    sceVif1PkOpenGifTag(packet, *(u_long128 *) &GiftagAD);
    sceVif1PkAddGsAD(packet, SCE_GS_TEXFLUSH, 0);
    sceVif1PkCloseGifTag(packet);
    sceVif1PkCloseDirectCode(packet);
}

/* The same move as MGMoveImage where the two rectangles are not the same size, which the GS has no
   transfer for: this draws instead. One textured sprite carries the source rectangle onto the
   destination, so the scale is the sampler's, and every register it needs is set and put back
   inside the one packet. The destination is reached by pointing FRAME_1 at it, which is why the
   frame buffer's own texture is read before anything is written and FRAME_1 restored from it at
   the end. The two offsets stay statics rather than becoming literals because they were meant to
   be adjusted, and dyy carries the interlace correction on top of its own value. */
void MGStretchMoveImage(sceGsTex0 *src, const CRect_i_ &src_rect, sceGsTex0 *dst,
                        const CRect_i_ &dst_rect) {
    sceVif1Packet *packet;
    sceGsTex0 frame_tex;
    sceGsTest test;
    sceGsTexa texa;
    sceGsTex1 tex1;
    sceGsAlpha alpha;
    sceGsZbuf zbuf;
    int dy;

    packet = GetVif1Packet();
    MGGetFBuffTex(&frame_tex);

    sceVif1PkCnt(packet, 0);
    sceVif1PkOpenDirectCode(packet, 0);
    sceVif1PkOpenGifTag(packet, *(u_long128 *) &GiftagAD);

    test = mgPixelTest;
    test.bits.ate = 0;
    test.bits.date = 0;
    test.bits.zte = 1;
    test.bits.ztst = SCE_GS_ALWAYS;

    texa = mgTexa;
    texa.AEM = 1;
    texa.TA0 = 128;

    tex1 = mgTEX1Env;
    tex1.MMIN = 1;

    alpha = mgAlpha;
    alpha.bits.a = 2;
    alpha.bits.b = 2;
    alpha.bits.c = 2;
    alpha.bits.d = 0;

    zbuf = mgZBuffer;
    zbuf.bits.zmsk = 1;

    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEXFLUSH, 0);
    sceVif1PkAddGsAD(packet, SCE_GS_TEST_1, *(u_long *) &test);
    sceVif1PkAddGsAD(packet, SCE_GS_TEX0_1, *(u_long *) src);
    sceVif1PkAddGsAD(packet, SCE_GS_TEX1_1, *(u_long *) &tex1);
    sceVif1PkAddGsAD(packet, SCE_GS_TEXA, *(u_long *) &texa);
    sceVif1PkAddGsAD(packet, SCE_GS_ALPHA_1, *(u_long *) &alpha);
    sceVif1PkAddGsAD(packet, SCE_GS_ZBUF_1, *(u_long *) &zbuf);

    static int dyy = -10;
    static int dx = -8;

    if (VSyncField__2) {
        dy = dyy;
    } else {
        dy = dyy + 16;
    }
    if (over_vsync) {
        dy = 0;
    }

    sceVif1PkAddGsAD(packet, SCE_GS_FRAME_1,
                     SCE_GS_SET_FRAME(dst->TBP0 >> 5, dst->TBW, dst->PSM, 0));
    sceVif1PkAddGsAD(packet, SCE_GS_PRIM,
                     SCE_GS_SET_PRIM(SCE_GS_PRIM_SPRITE, 0, 1, 0, 1, 0, 1, 0, 0));
    sceVif1PkAddGsAD(packet, SCE_GS_RGBAQ, SCE_GS_SET_RGBAQ(128, 128, 128, 128, 0));

    sceVif1PkAddGsAD(packet, SCE_GS_UV, SCE_GS_SET_UV(src_rect.x, src_rect.y));
    sceVif1PkAddGsAD(packet, SCE_GS_XYZF2,
                     SCE_GS_SET_XYZF2(dst_rect.x + 27648 + dx, dst_rect.y + 30976 + dy, 0, 0));
    sceVif1PkAddGsAD(packet, SCE_GS_UV,
                     SCE_GS_SET_UV(src_rect.x + src_rect.width, src_rect.y + src_rect.height));
    sceVif1PkAddGsAD(packet, SCE_GS_XYZF2,
                     SCE_GS_SET_XYZF2(dst_rect.x + 27648 + dst_rect.width + dx,
                                      dst_rect.y + dst_rect.height + 30976 + dy, 0, 0));

    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEXFLUSH, 0);
    sceVif1PkAddGsAD(packet, SCE_GS_FRAME_1,
                     SCE_GS_SET_FRAME(frame_tex.TBP0 >> 5, frame_tex.TBW, frame_tex.PSM, 0));
    sceVif1PkAddGsAD(packet, SCE_GS_TEST_1, *(u_long *) &mgPixelTest);
    sceVif1PkAddGsAD(packet, SCE_GS_TEST_1, *(u_long *) &mgPixelTest);
    sceVif1PkAddGsAD(packet, SCE_GS_ALPHA_1, *(u_long *) &mgAlpha);
    sceVif1PkAddGsAD(packet, SCE_GS_ZBUF_1, *(u_long *) &mgZBuffer);
    sceVif1PkCloseGifTag(packet);
    sceVif1PkCloseDirectCode(packet);
}

INCLUDE_ASM("asm/nonmatchings/mglib", MGMoveFrameBuffImage__FP9sceGsTex0iii);
INCLUDE_ASM("asm/nonmatchings/mglib", MGFillBox__FRC8CRect_i_UcUcUcUc);
INCLUDE_ASM("asm/nonmatchings/mglib", MGClearZBuffer__Fi);
INCLUDE_ASM("asm/nonmatchings/mglib", MGClearScreen__FUcUcUcUc);
INCLUDE_ASM("asm/nonmatchings/mglib", MGDrawShadowFast__FP6CFramePfPf);
INCLUDE_ASM("asm/nonmatchings/mglib", MGDrawShadowFast2__FP6CFramePfPf);
INCLUDE_ASM("asm/nonmatchings/mglib", MGDrawShadow__FP6CFramePfPf);
INCLUDE_ASM("asm/nonmatchings/mglib", MGDrawShade__FP6CFrame);

static sceGsTex0 Shadow_SaveFrameBuff;
static sceGsTex0 Shadow_WorkTex;

void MGBeginDrawShadow(sceGsTex0 tex) {
    sceVif1Packet *packet;
    sceGsTest test;
    sceGsZbuf zbuf;

    test = mgPixelTest;
    test.bits.ate = 1;
    test.bits.aref = 0;
    test.bits.atst = SCE_GS_ALWAYS;
    test.bits.zte = 1;
    test.bits.ztst = SCE_GS_ALWAYS;

    zbuf = mgZBuffer;
    zbuf.bits.zmsk = 1;

    tex.PSM = SCE_GS_PSMCT24;

    packet = GetVif1Packet();
    MGGetFBuffTex(&Shadow_SaveFrameBuff);

    sceVif1PkCnt(packet, 0);
    sceVif1PkOpenDirectCode(packet, 0);
    sceVif1PkOpenGifTag(packet, *(u_long128 *) &GiftagAD);

    sceVif1PkAddGsAD(packet, SCE_GS_TEXFLUSH, 0);
    sceVif1PkAddGsAD(packet, SCE_GS_FRAME_1,
                     SCE_GS_SET_FRAME(tex.TBP0 >> 5, tex.TBW, tex.PSM, 0));
    sceVif1PkAddGsAD(packet, SCE_GS_ALPHA_1, *(u_long *) &mgAlpha);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEST_1, *(u_long *) &test);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_ZBUF_1, *(u_long *) &zbuf);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEX1_1, 1);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_PRIM,
                     SCE_GS_SET_PRIM(SCE_GS_PRIM_SPRITE, 0, 0, 0, 1, 0, 1, 0, 0));
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_RGBAQ, SCE_GS_SET_RGBAQ(0, 0, 0, 128, 0));
    sceVif1PkAddGsAD(packet, SCE_GS_XYZF2, SCE_GS_SET_XYZF2(27648, 30976, 0, 0));
    sceVif1PkAddGsAD(packet, SCE_GS_XYZF2,
                     SCE_GS_SET_XYZF2(27648 + 640 * 16 - 1, 30976 + 224 * 16 - 1, 0, 0));
    sceVif1PkAddGsAD(packet, SCE_GS_TEXFLUSH, 0);

    sceVif1PkCloseGifTag(packet);
    sceVif1PkCloseDirectCode(packet);

    Shadow_WorkTex = tex;
}

void MGEndDrawShadow(u_char alpha) {
    sceVif1Packet *packet;
    sceGsAlpha blend;
    sceGsTest test;
    sceGsZbuf zbuf;
    sceGsTexa texa;
    float q;

    packet = GetVif1Packet();

    blend = mgAlpha;
    blend.bits.a = 2;
    blend.bits.b = 1;
    blend.bits.c = 0;
    blend.bits.d = 1;
    blend.bits.fix = 64;

    test = mgPixelTest;
    test.bits.ate = 0;
    test.bits.date = 0;
    test.bits.datm = 1;
    test.bits.zte = 1;
    test.bits.ztst = SCE_GS_ALWAYS;

    zbuf = mgZBuffer;
    zbuf.bits.zmsk = 1;

    texa = mgTexa;

    sceVif1PkCnt(packet, 0);
    sceVif1PkOpenDirectCode(packet, 0);
    sceVif1PkOpenGifTag(packet, *(u_long128 *) &GiftagAD);

    sceVif1PkAddGsAD(packet, SCE_GS_TEXFLUSH, 0);
    sceVif1PkAddGsAD(packet, SCE_GS_FRAME_1,
                     SCE_GS_SET_FRAME(Shadow_SaveFrameBuff.TBP0 >> 5, Shadow_SaveFrameBuff.TBW,
                                      Shadow_SaveFrameBuff.PSM, 0));

    texa.AEM = 1;
    texa.TA0 = alpha;
    q = 1.0f;

    sceVif1PkAddGsAD(packet, SCE_GS_TEXA, *(u_long *) &texa);
    sceVif1PkAddGsAD(packet, SCE_GS_ALPHA_1, *(u_long *) &blend);
    sceVif1PkAddGsAD(packet, SCE_GS_TEST_1, *(u_long *) &test);
    sceVif1PkAddGsAD(packet, SCE_GS_ZBUF_1, *(u_long *) &zbuf);
    sceVif1PkAddGsAD(packet, SCE_GS_TEX1_1, 1);
    sceVif1PkAddGsAD(packet, SCE_GS_PRIM,
                     SCE_GS_SET_PRIM(SCE_GS_PRIM_SPRITE, 0, 1, 0, 1, 0, 1, 0, 0));
    sceVif1PkAddGsAD(packet, SCE_GS_RGBAQ, SCE_GS_SET_RGBAQ(128, 128, 128, 128, *(u_int *) &q));
    sceVif1PkAddGsAD(packet, SCE_GS_TEX0_1, *(u_long *) &Shadow_WorkTex);
    sceVif1PkAddGsAD(packet, SCE_GS_UV, SCE_GS_SET_UV(0, 0));
    sceVif1PkAddGsAD(packet, SCE_GS_XYZF2, SCE_GS_SET_XYZF2(27648, 30976, 0, 0));
    sceVif1PkAddGsAD(packet, SCE_GS_UV, SCE_GS_SET_UV(640 * 16, 224 * 16));
    sceVif1PkAddGsAD(packet, SCE_GS_XYZF2,
                     SCE_GS_SET_XYZF2(27648 + 640 * 16 - 1, 30976 + 224 * 16 - 1, 0, 0));
    sceVif1PkAddGsAD(packet, SCE_GS_TEXFLUSH, 0);
    sceVif1PkAddGsAD(packet, SCE_GS_ALPHA_1, *(u_long *) &mgAlpha);
    sceVif1PkAddGsAD(packet, SCE_GS_TEST_1, *(u_long *) &mgPixelTest);
    sceVif1PkAddGsAD(packet, SCE_GS_ZBUF_1, *(u_long *) &mgZBuffer);

    sceVif1PkCloseGifTag(packet);
    sceVif1PkCloseDirectCode(packet);
}

/* The one texture manager the game has. It is built here rather than beside the textures because
   this is the unit that brings up the graphics, and its own storage is the last of what this unit
   reserves. */
CTextureManager TexManager;
