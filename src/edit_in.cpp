#include "common.h"

/**
 * Identifies the kind of editor effect requested.
 */
// clang-format off
enum EFFECT_TYPE {
};
// clang-format on

INCLUDE_ASM("asm/nonmatchings/edit_in", GetElementObjName__FP14EDITPARTS_INFOPPcii);
INCLUDE_ASM("asm/nonmatchings/edit_in", LoadMapObject__FP9CMapPartsPPUiP14CDataAlloc2_1_);
INCLUDE_ASM("asm/nonmatchings/edit_in", LoadScript__Fv__2);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @419);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @420);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @421__2);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @422);
INCLUDE_ASM("asm/nonmatchings/edit_in", RunEvent__FiP7CCamera__2);
INCLUDE_ASM("asm/nonmatchings/edit_in", RunSystemEvent__FiP7CCamera__2);
INCLUDE_ASM("asm/nonmatchings/edit_in", InitWorkBuffer__Fv__2);
INCLUDE_ASM("asm/nonmatchings/edit_in", EditInInit__FfPc);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @469__4);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @886__2);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @891__2);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @892__2);
INCLUDE_ASM("asm/nonmatchings/edit_in", EditInLoop__Fv);
INCLUDE_ASM("asm/nonmatchings/edit_in", MainDraw__Fv__2);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1082__2);
INCLUDE_ASM("asm/nonmatchings/edit_in", DrawWaterSurface__FP7CCamera);
INCLUDE_ASM("asm/nonmatchings/edit_in", StepWater__Fv);
INCLUDE_ASM("asm/nonmatchings/edit_in", MoveCharacter__Fv);
INCLUDE_ASM("asm/nonmatchings/edit_in", MoveCamera__FP13CCameraFollow__2);
INCLUDE_ASM("asm/nonmatchings/edit_in", SearchMapJump__FPfPf);
INCLUDE_ASM("asm/nonmatchings/edit_in", GetMapJumpPos__FP10CCharacter);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1194);
INCLUDE_ASM("asm/nonmatchings/edit_in", GetDoorPos__FiPfPfPiPi);
INCLUDE_ASM("asm/nonmatchings/edit_in", SetCameraPos__FP6CFrameP7CCameraP10CCharacter);
INCLUDE_ASM("asm/nonmatchings/edit_in", GetCollision__FP6CCPolyP7CBoxVu0__2);
INCLUDE_ASM("asm/nonmatchings/edit_in", VillagerCollision__Fv__2);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1369);
INCLUDE_ASM("asm/nonmatchings/edit_in", LoadTexture__Fv__2);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1399);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1400);
void LoadChara() {
}
INCLUDE_ASM("asm/nonmatchings/edit_in", LoadData__Fv);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1537);
INCLUDE_ASM("asm/nonmatchings/edit_in", LoadPTS__FP9CMapPartsPUi);
INCLUDE_ASM("asm/nonmatchings/edit_in", GetFuncPoint__FiPUiP16EPARTS_FUNC_DATA);
INCLUDE_ASM("asm/nonmatchings/edit_in", setTexAnim__Fv);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1589);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1590);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1592);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1593);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1594);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1595);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1596);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1597);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1598);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1599);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1600);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1601);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1602);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1603);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1604);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1605);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1606);
INCLUDE_ASM("asm/nonmatchings/edit_in", LoadInfo__FPci);
INCLUDE_ASM("asm/nonmatchings/edit_in", CommandAMBIENT__FPPv__2);
INCLUDE_ASM("asm/nonmatchings/edit_in", CommandLIGHT_C__FPPv__2);
INCLUDE_ASM("asm/nonmatchings/edit_in", CommandFOG__FPPv__2);
INCLUDE_ASM("asm/nonmatchings/edit_in", CommandBG_COL__FPPv__2);
INCLUDE_ASM("asm/nonmatchings/edit_in", CommandPROJECTION__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit_in", CommandPEOPLE__FPPv__2);
INCLUDE_ASM("asm/nonmatchings/edit_in", CommandCD__FPPv__2);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1627__2);
INCLUDE_ASM("asm/nonmatchings/edit_in", CommandOBJ_ANIME__FPPv__2);

void SetEffect(EFFECT_TYPE, char *, float *, float *, float *) {
}
INCLUDE_ASM("asm/nonmatchings/edit_in", CommandFIRE__FPPv__2);
INCLUDE_ASM("asm/nonmatchings/edit_in", CommandFLAME__FPPv__2);
INCLUDE_ASM("asm/nonmatchings/edit_in", CommandBRIGHT__FPPv__2);
INCLUDE_ASM("asm/nonmatchings/edit_in", CommandDEBUG__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit_in", CommandMOTION_PARTS__FPPv__2);
INCLUDE_ASM("asm/nonmatchings/edit_in", CommandWATER_SURFACE__FPPv__2);
INCLUDE_ASM("asm/nonmatchings/edit_in", CommandWATER_SHAKE__FPPv__2);
