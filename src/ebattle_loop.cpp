#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 517

#include "common.h"

#include "ebattle.hpp"
#include "gamepad.hpp"

/* The rest of the ebattle module: the intro, the main loop and the draw pass. */

INCLUDE_RODATA("asm/nonmatchings/ebattle_loop", @1686);
INCLUDE_RODATA("asm/nonmatchings/ebattle_loop", @1700);
INCLUDE_RODATA("asm/nonmatchings/ebattle_loop", @1701);
INCLUDE_RODATA("asm/nonmatchings/ebattle_loop", @1702);
INCLUDE_RODATA("asm/nonmatchings/ebattle_loop", @1703);
INCLUDE_RODATA("asm/nonmatchings/ebattle_loop", @1704);

INCLUDE_ASM("asm/nonmatchings/ebattle_loop", EBInitIntro__Fv);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", EBSetMotion__FP10CCharacterPi);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", EBDebug__Fi);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", EBSetKey__Ffii);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", EBExit__Fv);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", EBIntroLoop__Fv);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", EBLoop__Fv);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", EBDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", DrawButton__Fiiifi);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", DrawButtonSub__Fiiiif);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", init_draw_ok__Fv);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", set_draw_ok__Fii);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", draw_ok_loop__Fv);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", draw_ok__Fi);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", button_scale__Fi);
static int key_mode = 0xFFFF;

/**
 * Tests whether an editor input mode currently owns the controller.
 */
static int check_key_mode(int mode) {
    if (mode == 0xFFFF)
        return 1;
    return (key_mode & mode) != 0;
}

int EdSetKeyMode(int mode) {
    return key_mode = mode;
}

float EdGetRXf(int mode) {
    if (check_key_mode(mode))
        return GamePad.GetRXf();
    return 0.0f;
}

float EdGetRYf(int mode) {
    if (check_key_mode(mode))
        return GamePad.GetRYf();
    return 0.0f;
}

float EdGetLXf(int mode) {
    if (check_key_mode(mode))
        return GamePad.GetLXf();
    return 0.0f;
}

float EdGetLYf(int mode) {
    if (check_key_mode(mode))
        return GamePad.GetLYf();
    return 0.0f;
}

int EdPadOn(int keys, int mode) {
    if (check_key_mode(mode))
        return GamePad.On(keys);
    return 0;
}

int EdPadDown(int keys, int mode) {
    if (check_key_mode(mode))
        return GamePad.Down(keys);
    return 0;
}

INCLUDE_ASM("asm/nonmatchings/ebattle_loop", keylock__Fv);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", GetRXf__Fv);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", GetRYf__Fv);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", GetLXf__Fv);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", GetLYf__Fv);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", PadOn__Fi);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", PadDown__Fi);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", CameraAutoMove__FP13CCameraFollowP6CCPolyPfff);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", EdViewModeOff__Fv);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", InitEyeCamera__FP10CCharacter);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", EyeCamera__FP7CCameraP10CCharacteri);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", EdInitCameraParam__FP13CCameraFollow);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", EdMoveCharaInit__Fv);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", EdEyeCamera__FP7CCameraP10CCharacter);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", EdCheckViewMode__Fv);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", EdAGetViewAngleH__Fv);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", EdAGetViewAngleV__Fv);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", EdASetViewAngle__Fff);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", EdMoveChara__Fv);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", EdInitHashigo__FP13ED_EVENT_INFOP14ED_EVENT_PARAM);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", EdInitGotoInterior__FP13ED_EVENT_INFOP14ED_EVENT_PARAM);
