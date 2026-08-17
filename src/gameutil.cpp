#include "common.h"

/* Shared helpers: the IOP midi bridge, motion interpolation, collision and
 * ground queries, and 2D sprite setup. */

INCLUDE_ASM("asm/nonmatchings/gameutil", ezMidiInit__Fv);
INCLUDE_ASM("asm/nonmatchings/gameutil", ezMidi__Fii);
INCLUDE_ASM("asm/nonmatchings/gameutil", ezTransToIOP__FPvPvi);
INCLUDE_ASM("asm/nonmatchings/gameutil", QuatSlerp__FPfPffPf);
INCLUDE_ASM("asm/nonmatchings/gameutil", MotionProc__FP6CFrameP12MOTION_STATEP8Mot_List);
INCLUDE_ASM("asm/nonmatchings/gameutil", MotionProc2__FP6CFrameP14tagMOTION_TYPEP12tagFRAME_INFP8Mot_List);
INCLUDE_ASM("asm/nonmatchings/gameutil", SetMotionEX__FP6CFrameP14tagMOTION_TYPEP11MOTION_INFOP12MOTION_STATEP12tagFRAME_INF);
INCLUDE_ASM("asm/nonmatchings/gameutil", CreateAnimeDataEX__FP14tagMOTION_TYPEP14CDataAlloc2_1_P16MOTION_FILE_INFO);
INCLUDE_ASM("asm/nonmatchings/gameutil", AnimeDataInit__FP6CFrameP14tagMOTION_TYPEP14CDataAlloc2_1_PP12tagFRAME_INF);
INCLUDE_ASM("asm/nonmatchings/gameutil", AnimeDataInit__FP6CFrameP14tagMOTION_TYPEP14CDataAlloc2_1_P12tagFRAME_INF);
INCLUDE_ASM("asm/nonmatchings/gameutil", NextMotionTime_GET_EX__FP11MOTION_INFOP12MOTION_STATE);
INCLUDE_ASM("asm/nonmatchings/gameutil", SetRotationMatrixFromDir__FPA4_fPff);
INCLUDE_ASM("asm/nonmatchings/gameutil", LookAt__FP9CFrameVu1Pf16_FRAMECONSTRAINT);
INCLUDE_ASM("asm/nonmatchings/gameutil", LookAt__FP9CFrameVu1P9CFrameVu116_FRAMECONSTRAINT);
INCLUDE_ASM("asm/nonmatchings/gameutil", PickUpNearPoly__FP6CCPoly7CBoxVu0P6CCPolyi);
INCLUDE_ASM("asm/nonmatchings/gameutil", CheckHit__FP6CCPolyiPfPfPfii);
INCLUDE_ASM("asm/nonmatchings/gameutil", CheckHitVertical__FP6CCPolyiPffPfi);
INCLUDE_ASM("asm/nonmatchings/gameutil", CheckHits__FP6CCPolyiPfPfiPiPA4_fii);
INCLUDE_ASM("asm/nonmatchings/gameutil", MoveCheck__FPfPfPfP13MoveCheckInfoP6CCPolyii);
INCLUDE_ASM("asm/nonmatchings/gameutil", GetFootPoly__FPffP6CCPolyPfP6CCPolyii);
INCLUDE_ASM("asm/nonmatchings/gameutil", GetEventPoly__FPfPfP6CCPolyPiPfP6CCPolyii);
INCLUDE_ASM("asm/nonmatchings/gameutil", CheckWidth__FP6CCPolyiPffPfi);
INCLUDE_ASM("asm/nonmatchings/gameutil", CheckCameraWidth__FP6CCPolyiPffPfi);
INCLUDE_ASM("asm/nonmatchings/gameutil", set2DSprite_Start__FP13sceVif1PacketP8CTexture);
INCLUDE_ASM("asm/nonmatchings/gameutil", set2DSprite_Core__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_UcUcUcUc);
INCLUDE_ASM("asm/nonmatchings/gameutil", set2DSprite_End__FP13sceVif1PacketP8CTexture);
INCLUDE_ASM("asm/nonmatchings/gameutil", SetClut__FP13sceVif1PacketP8CTextureP1);
INCLUDE_ASM("asm/nonmatchings/gameutil", LinerInterpolation__Ffff);
INCLUDE_ASM("asm/nonmatchings/gameutil", AreaAddPos__FPiPiPi);
INCLUDE_ASM("asm/nonmatchings/gameutil", RollPos__FPfPffPf);
INCLUDE_ASM("asm/nonmatchings/gameutil", CheckPosInOutForRect__FP4RECTii);
INCLUDE_ASM("asm/nonmatchings/gameutil", GetDisPosToRect__FP4RECTii);
INCLUDE_ASM("asm/nonmatchings/gameutil", GetScrPosFromChar__FP10CCharacterPi);
INCLUDE_ASM("asm/nonmatchings/gameutil", Color2Clut__FUi);
INCLUDE_ASM("asm/nonmatchings/gameutil", NameRegistCodeJtoE__Fi);
