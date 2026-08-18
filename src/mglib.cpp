#include "mglib.hpp"

/* Declared in exact retail `.sbss` address order: DmaCH8 (0x2A23C0),
 * Vif1Packet (0x2A23C4), VSyncField__2 (0x2A23C8), mgClearBackFlag
 * (0x2A23CC), mgTEX1Env (0x2A23D0, 8 bytes). */
s32 DmaCH8;
sceVif1Packet *Vif1Packet;
s32 VSyncField__2;
s32 mgClearBackFlag;
s32 mgTEX1Env[2];

/* Retail `mgWindowRect` (main.bss, 0x10 bytes) -- most likely the rectangle
 * MGSetWindowRect/MGGetWindowRect operate on. Field layout unconfirmed, so
 * migrated as a same-sized placeholder array. */
char mgWindowRect[0x10];

INCLUDE_ASM("asm/nonmatchings/mglib", VSyncCallBack__Fi);
INCLUDE_ASM("asm/nonmatchings/mglib", MGGetVSyncCount__Fv);
INCLUDE_ASM("asm/nonmatchings/mglib", MGInit__Fv);
INCLUDE_ASM("asm/nonmatchings/mglib", MGInitVSyncCallBack__FPFi_i);
INCLUDE_ASM("asm/nonmatchings/mglib", MGInitVif1Packet__FP1P1);
INCLUDE_ASM("asm/nonmatchings/mglib", StoreImage__Fv);
INCLUDE_RODATA("asm/nonmatchings/mglib", LIT_250);
INCLUDE_RODATA("asm/nonmatchings/mglib", LIT_251);
INCLUDE_RODATA("asm/nonmatchings/mglib", LIT_252);
INCLUDE_ASM("asm/nonmatchings/mglib", MGBeginFrame__Fv);
INCLUDE_ASM("asm/nonmatchings/mglib", WaitVSync__Fi);
INCLUDE_ASM("asm/nonmatchings/mglib", MGEndFrame__Fv);
INCLUDE_RODATA("asm/nonmatchings/mglib", LIT_414);
INCLUDE_RODATA("asm/nonmatchings/mglib", LIT_415);
INCLUDE_RODATA("asm/nonmatchings/mglib", LIT_416);
INCLUDE_RODATA("asm/nonmatchings/mglib", LIT_417);
INCLUDE_RODATA("asm/nonmatchings/mglib", LIT_418);
INCLUDE_ASM("asm/nonmatchings/mglib", MGFlipWaitVSync__Fi);
INCLUDE_ASM("asm/nonmatchings/mglib", MGSetRenderInfo__Ffff);
INCLUDE_ASM("asm/nonmatchings/mglib", MGSetProjection__Ff);
INCLUDE_ASM("asm/nonmatchings/mglib", MGGetProjection__Fv);
INCLUDE_ASM("asm/nonmatchings/mglib", MGSetWindowRect__Fv);
INCLUDE_ASM("asm/nonmatchings/mglib", MGSetWindowRect__F8CRect_i_);
INCLUDE_ASM("asm/nonmatchings/mglib", MGSetPLight__FPA4_fPA4_f);
INCLUDE_ASM("asm/nonmatchings/mglib", MGGetPLight__FPA4_fPA4_f);
INCLUDE_ASM("asm/nonmatchings/mglib", MGSetAmbient__FPf);
INCLUDE_ASM("asm/nonmatchings/mglib", MGGetAmbient__FPf);
INCLUDE_ASM("asm/nonmatchings/mglib", MGSetViewMatrix_sub__FPA4_fff);
INCLUDE_ASM("asm/nonmatchings/mglib", MGSetViewMatrix__FPA4_f);
INCLUDE_ASM("asm/nonmatchings/mglib", MGSetViewMatrix__FPA4_fPf);
INCLUDE_ASM("asm/nonmatchings/mglib", MGSetFogParm__FffUcUcUcff);
INCLUDE_ASM("asm/nonmatchings/mglib", MGSetBGColor__Fffff);
INCLUDE_ASM("asm/nonmatchings/mglib", MGSetBGColor__FPf);
INCLUDE_ASM("asm/nonmatchings/mglib", MGGetBGColor__FPf);
INCLUDE_ASM("asm/nonmatchings/mglib", MGScisioringForce__Fi);
INCLUDE_ASM("asm/nonmatchings/mglib", GetVif1Packet__Fv);
INCLUDE_ASM("asm/nonmatchings/mglib", MGRotTransPers__FPiPfi);
INCLUDE_ASM("asm/nonmatchings/mglib", MGRotTransPers2D__FPiPfi);
INCLUDE_ASM("asm/nonmatchings/mglib", MGRotTransPers3DSprite__FPiPiPfffi);
INCLUDE_ASM("asm/nonmatchings/mglib", MGCalcColor__FPfPf);
INCLUDE_ASM("asm/nonmatchings/mglib", MGClipVertex__FPf);
INCLUDE_ASM("asm/nonmatchings/mglib", MGClipBox__FP7CBoxVu0);
INCLUDE_ASM("asm/nonmatchings/mglib", MGDraw__FP6CFrame);
INCLUDE_ASM("asm/nonmatchings/mglib", MGSetGsTEST__FP9sceGsTest);
INCLUDE_ASM("asm/nonmatchings/mglib", MGSetGsZBUF__FP9sceGsZbuf);
INCLUDE_ASM("asm/nonmatchings/mglib", MGSetGsALPHA__FP10sceGsAlpha);
INCLUDE_ASM("asm/nonmatchings/mglib", MGSetGsTEXA__FP9sceGsTexa);
INCLUDE_ASM("asm/nonmatchings/mglib", MGGetFBuffTex__FP9sceGsTex0);
INCLUDE_ASM("asm/nonmatchings/mglib", MGGetFBuffBackTex__FP9sceGsTex0);
INCLUDE_ASM("asm/nonmatchings/mglib", MGMoveImage__FP9sceGsTex0RC8CRect_i_P9sceGsTex0iii);
INCLUDE_ASM("asm/nonmatchings/mglib", MGStretchMoveImage__FP9sceGsTex0RC8CRect_i_P9sceGsTex0RC8CRect_i_);
INCLUDE_ASM("asm/nonmatchings/mglib", MGMoveFrameBuffImage__FP9sceGsTex0iii);
INCLUDE_ASM("asm/nonmatchings/mglib", MGFillBox__FRC8CRect_i_UcUcUcUc);
INCLUDE_ASM("asm/nonmatchings/mglib", MGClearZBuffer__Fi);
INCLUDE_ASM("asm/nonmatchings/mglib", MGClearScreen__FUcUcUcUc);
INCLUDE_ASM("asm/nonmatchings/mglib", MGDrawShadowFast__FP6CFramePfPf);
INCLUDE_ASM("asm/nonmatchings/mglib", MGDrawShadowFast2__FP6CFramePfPf);
INCLUDE_ASM("asm/nonmatchings/mglib", MGDrawShadow__FP6CFramePfPf);
INCLUDE_ASM("asm/nonmatchings/mglib", MGDrawShade__FP6CFrame);
INCLUDE_ASM("asm/nonmatchings/mglib", MGBeginDrawShadow__F9sceGsTex0);
INCLUDE_ASM("asm/nonmatchings/mglib", MGEndDrawShadow__FUc);
