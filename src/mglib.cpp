#include "mglib.hpp"

/* Declared in exact retail `.sbss` address order: DmaCH8 (0x2A23C0),
 * Vif1Packet (0x2A23C4), VSyncField__2 (0x2A23C8), mgClearBackFlag
 * (0x2A23CC), mgTEX1Env (0x2A23D0, 8 bytes). */
s32 DmaCH8;
s32 Vif1Packet;
s32 VSyncField__2;
s32 mgClearBackFlag;
s32 mgTEX1Env[2];

/* Retail `mgWindowRect` (main.bss, 0x10 bytes) -- most likely the rectangle
 * MGSetWindowRect/MGGetWindowRect operate on. Field layout unconfirmed, so
 * migrated as a same-sized placeholder array. */
char mgWindowRect[0x10];

INCLUDE_ASM("main", VSyncCallBack__Fi);
INCLUDE_ASM("main", MGGetVSyncCount__Fv);
INCLUDE_ASM("main", MGInit__Fv);
INCLUDE_ASM("main", MGInitVSyncCallBack__FPFi_i);
INCLUDE_ASM("main", MGInitVif1Packet__FP1P1);
INCLUDE_ASM("main", StoreImage__Fv);
INCLUDE_ASM("main", MGBeginFrame__Fv);
INCLUDE_ASM("main", WaitVSync__Fi);
INCLUDE_ASM("main", MGEndFrame__Fv);
INCLUDE_ASM("main", MGFlipWaitVSync__Fi);
INCLUDE_ASM("main", MGSetRenderInfo__Ffff);
INCLUDE_ASM("main", MGSetProjection__Ff);
INCLUDE_ASM("main", MGGetProjection__Fv);
INCLUDE_ASM("main", MGSetWindowRect__Fv);
INCLUDE_ASM("main", MGSetWindowRect__F8CRect_i_);
INCLUDE_ASM("main", MGSetPLight__FPA4_fPA4_f);
INCLUDE_ASM("main", MGGetPLight__FPA4_fPA4_f);
INCLUDE_ASM("main", MGSetAmbient__FPf);
INCLUDE_ASM("main", MGGetAmbient__FPf);
INCLUDE_ASM("main", MGSetViewMatrix_sub__FPA4_fff);
INCLUDE_ASM("main", MGSetViewMatrix__FPA4_f);
INCLUDE_ASM("main", MGSetViewMatrix__FPA4_fPf);
INCLUDE_ASM("main", MGSetFogParm__FffUcUcUcff);
INCLUDE_ASM("main", MGSetBGColor__Fffff);
INCLUDE_ASM("main", MGSetBGColor__FPf);
INCLUDE_ASM("main", MGGetBGColor__FPf);
INCLUDE_ASM("main", MGScisioringForce__Fi);
INCLUDE_ASM("main", GetVif1Packet__Fv);
INCLUDE_ASM("main", MGRotTransPers__FPiPfi);
INCLUDE_ASM("main", MGRotTransPers2D__FPiPfi);
INCLUDE_ASM("main", MGRotTransPers3DSprite__FPiPiPfffi);
INCLUDE_ASM("main", MGCalcColor__FPfPf);
INCLUDE_ASM("main", MGClipVertex__FPf);
INCLUDE_ASM("main", MGClipBox__FP7CBoxVu0);
INCLUDE_ASM("main", MGDraw__FP6CFrame);
INCLUDE_ASM("main", MGSetGsTEST__FP9sceGsTest);
INCLUDE_ASM("main", MGSetGsZBUF__FP9sceGsZbuf);
INCLUDE_ASM("main", MGSetGsALPHA__FP10sceGsAlpha);
INCLUDE_ASM("main", MGSetGsTEXA__FP9sceGsTexa);
INCLUDE_ASM("main", MGGetFBuffTex__FP9sceGsTex0);
INCLUDE_ASM("main", MGGetFBuffBackTex__FP9sceGsTex0);
INCLUDE_ASM("main", MGMoveImage__FP9sceGsTex0RC8CRect_i_P9sceGsTex0iii);
INCLUDE_ASM("main", MGStretchMoveImage__FP9sceGsTex0RC8CRect_i_P9sceGsTex0RC8CRect_i_);
INCLUDE_ASM("main", MGMoveFrameBuffImage__FP9sceGsTex0iii);
INCLUDE_ASM("main", MGFillBox__FRC8CRect_i_UcUcUcUc);
INCLUDE_ASM("main", MGClearZBuffer__Fi);
INCLUDE_ASM("main", MGClearScreen__FUcUcUcUc);
INCLUDE_ASM("main", MGDrawShadowFast__FP6CFramePfPf);
INCLUDE_ASM("main", MGDrawShadowFast2__FP6CFramePfPf);
INCLUDE_ASM("main", MGDrawShadow__FP6CFramePfPf);
INCLUDE_ASM("main", MGDrawShade__FP6CFrame);
INCLUDE_ASM("main", MGBeginDrawShadow__F9sceGsTex0);
INCLUDE_ASM("main", MGEndDrawShadow__FUc);
