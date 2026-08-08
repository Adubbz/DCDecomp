#include "common.h"

/* Shared helpers: the IOP midi bridge, motion interpolation, collision and
 * ground queries, and 2D sprite setup. */

INCLUDE_ASM("main", ezMidiInit__Fv);
INCLUDE_ASM("main", ezMidi__Fii);
INCLUDE_ASM("main", ezTransToIOP__FPvPvi);
INCLUDE_ASM("main", QuatSlerp__FPfPffPf);
INCLUDE_ASM("main", MotionProc__FP6CFrameP12MOTION_STATEP8Mot_List);
INCLUDE_ASM("main", MotionProc2__FP6CFrameP14tagMOTION_TYPEP12tagFRAME_INFP8Mot_List);
INCLUDE_ASM("main", SetMotionEX__FP6CFrameP14tagMOTION_TYPEP11MOTION_INFOP12MOTION_STATEP12tagFRAME_INF);
INCLUDE_ASM("main", CreateAnimeDataEX__FP14tagMOTION_TYPEP14CDataAlloc2_1_P16MOTION_FILE_INFO);
INCLUDE_ASM("main", AnimeDataInit__FP6CFrameP14tagMOTION_TYPEP14CDataAlloc2_1_PP12tagFRAME_INF);
INCLUDE_ASM("main", AnimeDataInit__FP6CFrameP14tagMOTION_TYPEP14CDataAlloc2_1_P12tagFRAME_INF);
INCLUDE_ASM("main", NextMotionTime_GET_EX__FP11MOTION_INFOP12MOTION_STATE);
INCLUDE_ASM("main", SetRotationMatrixFromDir__FPA4_fPff);
INCLUDE_ASM("main", LookAt__FP9CFrameVu1Pf16_FRAMECONSTRAINT);
INCLUDE_ASM("main", LookAt__FP9CFrameVu1P9CFrameVu116_FRAMECONSTRAINT);
INCLUDE_ASM("main", PickUpNearPoly__FP6CCPoly7CBoxVu0P6CCPolyi);
INCLUDE_ASM("main", CheckHit__FP6CCPolyiPfPfPfii);
INCLUDE_ASM("main", CheckHitVertical__FP6CCPolyiPffPfi);
INCLUDE_ASM("main", CheckHits__FP6CCPolyiPfPfiPiPA4_fii);
INCLUDE_ASM("main", MoveCheck__FPfPfPfP13MoveCheckInfoP6CCPolyii);
INCLUDE_ASM("main", GetFootPoly__FPffP6CCPolyPfP6CCPolyii);
INCLUDE_ASM("main", GetEventPoly__FPfPfP6CCPolyPiPfP6CCPolyii);
INCLUDE_ASM("main", CheckWidth__FP6CCPolyiPffPfi);
INCLUDE_ASM("main", CheckCameraWidth__FP6CCPolyiPffPfi);
INCLUDE_ASM("main", set2DSprite_Start__FP13sceVif1PacketP8CTexture);
INCLUDE_ASM("main", set2DSprite_Core__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_UcUcUcUc);
INCLUDE_ASM("main", set2DSprite_End__FP13sceVif1PacketP8CTexture);
INCLUDE_ASM("main", SetClut__FP13sceVif1PacketP8CTextureP1);
INCLUDE_ASM("main", LinerInterpolation__Ffff);
INCLUDE_ASM("main", AreaAddPos__FPiPiPi);
INCLUDE_ASM("main", RollPos__FPfPffPf);
INCLUDE_ASM("main", CheckPosInOutForRect__FP4RECTii);
INCLUDE_ASM("main", GetDisPosToRect__FP4RECTii);
INCLUDE_ASM("main", GetScrPosFromChar__FP10CCharacterPi);
INCLUDE_ASM("main", Color2Clut__FUi);
INCLUDE_ASM("main", NameRegistCodeJtoE__Fi);
INCLUDE_RODATA("main", LIT_25);
INCLUDE_RODATA("main", LIT_414__4);
INCLUDE_RODATA("main", LIT_821);
INCLUDE_RODATA("main", LIT_822);
INCLUDE_RODATA("main", LIT_1556);
INCLUDE_RODATA("main", LIT_1557);
INCLUDE_RODATA("main", LIT_1838);
INCLUDE_RODATA("main", LIT_1837);
