#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 517

#include "common.h"

#include <libvu0.h>

#include "collision.hpp"
#include "ebattle.hpp"
#include "edit.hpp"
#include "editloop.hpp"
#include "gamepad.hpp"

/* The rest of the ebattle module: the intro, the main loop and the draw pass. */

/* Three of the module's own statics are still supplied by the reference
 * assembly below, so their callers reach each by the name the assembler
 * resolves, the way main.cpp and title/titleloop.cpp reach theirs.
 * Each declaration goes when its own body is written. */

/**
 * Draws one 32x32 button glyph from the ebattle texture, centred on a point
 * and scaled about it.
 *
 * @mangled DrawButtonSub__Fiiiif
 * @address 0x169340
 * @size 0xE0
 */
extern "C" void DrawButtonSub__Fiiiif(int x, int y, int tex_x, int tex_y, float scale);

/**
 * Clears the OK prompt: no button owns it, and its countdown is spent.
 *
 * @mangled init_draw_ok__Fv
 * @address 0x169420
 * @size 0x14
 */
extern "C" void init_draw_ok__Fv();

/**
 * Says whether either of the two editor key locks currently holds the pad.
 *
 * @mangled keylock__Fv
 * @address 0x1699E0
 * @size 0x10
 */
extern "C" int keylock__Fv();

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

static float GetRXf() {
    if (keylock__Fv() != 0) {
        return 0.0f;
    }
    return EdGetRXf(1);
}

static float GetRYf() {
    if (keylock__Fv() != 0) {
        return 0.0f;
    }
    return EdGetRYf(1);
}

static float GetLXf() {
    if (keylock__Fv() != 0) {
        return 0.0f;
    }
    return EdGetLXf(1);
}

static float GetLYf() {
    if (keylock__Fv() != 0) {
        return 0.0f;
    }
    return EdGetLYf(1);
}

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

int EdInitGotoInterior(ED_EVENT_INFO *info, ED_EVENT_PARAM *param) {
    sceVu0CopyVector(info->vector_arguments[0], param->position);
    sceVu0CopyVector(info->vector_arguments[1], param->rotation);
    sceVu0CopyVector(info->vector_arguments[2], param->camera_pos);
    return param->point->minimum_progress;
}
