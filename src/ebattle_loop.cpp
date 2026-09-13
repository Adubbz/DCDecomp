#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 517

#include "common.h"

#include <libvu0.h>

#include "camerafollow.hpp"
#include "dataread.hpp"
#include "ebattle.hpp"
#include "edit.hpp"
#include "editloop.hpp"
#include "gamepad.hpp"
#include "snd.hpp"

/* The rest of the ebattle module: the intro, the main loop and the draw pass. */

INCLUDE_RODATA("asm/nonmatchings/ebattle_loop", @1686);
INCLUDE_RODATA("asm/nonmatchings/ebattle_loop", @1700);
INCLUDE_RODATA("asm/nonmatchings/ebattle_loop", @1701);
INCLUDE_RODATA("asm/nonmatchings/ebattle_loop", @1702);
INCLUDE_RODATA("asm/nonmatchings/ebattle_loop", @1703);
INCLUDE_RODATA("asm/nonmatchings/ebattle_loop", @1704);

/**
 * Enemy-battle diagnostic display mode.
 */
extern int debug_mode;

/**
 * Frames remaining for the enemy-battle confirmation effect.
 */
extern int ok_draw_cnt;

/**
 * Button shown by the enemy-battle confirmation effect, or -1 for none.
 */
extern int ok_effect_button;

/**
 * Kind of enemy-battle confirmation effect to draw.
 */
extern int ok_type;

/**
 * Character-control state whose low bits lock editor input.
 */
extern int chara_mode;

/**
 * Current editor camera-view mode.
 */
extern int viewMode;

/**
 * Whether the editor-controlled character is fishing.
 */
extern int chara_fishing;

/**
 * Fishing message state used by editor character control.
 */
extern int fishing_mes;

/**
 * Horizontal editor camera angle.
 */
extern float viewAngleH;

/**
 * Vertical editor camera angle.
 */
extern float viewAngleV;

/**
 * Default near-follow distance for the editor camera.
 */
extern float camera_near_dist;

/**
 * Whether an enemy-battle sequence is active.
 */
extern int ebattle_flag;

/**
 * Whether the enemy-battle introduction is active.
 */
extern int ebattle_intro_flag;

/**
 * Enemy-battle introduction frame counter.
 */
extern int eb_intro_cnt;

/**
 * Enemy-battle finish frame counter.
 */
extern int eb_finish_cnt;

/**
 * Clears the enemy-battle confirmation effect.
 *
 * @mangled init_draw_ok__Fv
 * @address 0x169420
 * @size 0x14
 */
void init_draw_ok();

INCLUDE_ASM("asm/nonmatchings/ebattle_loop", EBInitIntro__Fv);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", EBSetMotion__FP10CCharacterPi);

void EBDebug(int mode) {
    debug_mode = mode;
}

INCLUDE_ASM("asm/nonmatchings/ebattle_loop", EBSetKey__Ffii);

void EBExit() {
    ebattle_flag = 0;
    eb_intro_cnt = 0;
    GamePad.MenuModeOff();
    ebattle_intro_flag = 0;
    eb_finish_cnt = 0;
    init_draw_ok();
    do {
    } while (SndSPSeSyncBG() != 0);
    InitReadBG();
}

INCLUDE_ASM("asm/nonmatchings/ebattle_loop", EBIntroLoop__Fv);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", EBLoop__Fv);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", EBDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", DrawButton__Fiiifi);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", DrawButtonSub__Fiiiif);

void init_draw_ok() {
    ok_draw_cnt = 0;
    ok_effect_button = -1;
}

/**
 * Starts the confirmation effect for the selected button.
 *
 * @mangled set_draw_ok__Fii
 * @address 0x169440
 * @size 0x18
 */
void set_draw_ok(int type, int button) {
    ok_effect_button = button;
    ok_draw_cnt = 30;
    ok_type = type;
}

/**
 * Counts down the active confirmation effect.
 *
 * @mangled draw_ok_loop__Fv
 * @address 0x169460
 * @size 0x2C
 */
void draw_ok_loop() {
    if (ok_draw_cnt > 0) {
        --ok_draw_cnt;
        if (ok_draw_cnt < 0) {
            ok_draw_cnt = 0;
        }
    }
}

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

/**
 * Returns the low two character-control lock bits.
 *
 * @mangled keylock__Fv
 * @address 0x1699E0
 * @size 0x10
 */
int keylock() {
    return chara_mode & 3;
}

/**
 * Returns the right stick's horizontal input, or zero while editor input is locked.
 */
static float GetRXf() {
    if (keylock() != 0) {
        return 0.0f;
    }
    return EdGetRXf(1);
}

/**
 * Returns the right stick's vertical input, or zero while editor input is locked.
 */
static float GetRYf() {
    if (keylock() != 0) {
        return 0.0f;
    }
    return EdGetRYf(1);
}

/**
 * Returns the left stick's horizontal input, or zero while editor input is locked.
 */
static float GetLXf() {
    if (keylock() != 0) {
        return 0.0f;
    }
    return EdGetLXf(1);
}

/**
 * Returns the left stick's vertical input, or zero while editor input is locked.
 */
static float GetLYf() {
    if (keylock() != 0) {
        return 0.0f;
    }
    return EdGetLYf(1);
}

INCLUDE_ASM("asm/nonmatchings/ebattle_loop", PadOn__Fi);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", PadDown__Fi);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", CameraAutoMove__FP13CCameraFollowP6CCPolyPfff);

/**
 * Disables the editor camera-view mode.
 *
 * @mangled EdViewModeOff__Fv
 * @address 0x169D80
 * @size 0xC
 */
void EdViewModeOff() {
    viewMode = 0;
}

INCLUDE_ASM("asm/nonmatchings/ebattle_loop", InitEyeCamera__FP10CCharacter);
INCLUDE_ASM("asm/nonmatchings/ebattle_loop", EyeCamera__FP7CCameraP10CCharacteri);

void EdInitCameraParam(CCameraFollow *camera) {
    if (camera != 0) {
        camera->SetDistance(camera_near_dist);
        camera->SetHeight(5.0f);
    }
}

void EdMoveCharaInit() {
    viewMode = 0;
    chara_mode = 0;
    chara_fishing = 0;
    fishing_mes = 0;
}

INCLUDE_ASM("asm/nonmatchings/ebattle_loop", EdEyeCamera__FP7CCameraP10CCharacter);

int EdCheckViewMode() {
    return viewMode;
}

/**
 * Returns the horizontal editor camera angle.
 *
 * @mangled EdAGetViewAngleH__Fv
 * @address 0x16A130
 * @size 0xC
 */
float EdAGetViewAngleH() {
    return viewAngleH;
}

/**
 * Returns the vertical editor camera angle.
 *
 * @mangled EdAGetViewAngleV__Fv
 * @address 0x16A140
 * @size 0xC
 */
float EdAGetViewAngleV() {
    return viewAngleV;
}

/**
 * Sets both editor camera angles.
 *
 * @mangled EdASetViewAngle__Fff
 * @address 0x16A150
 * @size 0x10
 */
void EdASetViewAngle(float horizontal, float vertical) {
    viewAngleH = horizontal;
    viewAngleV = vertical;
}

INCLUDE_ASM("asm/nonmatchings/ebattle_loop", EdMoveChara__Fv);

/**
 * Copies ladder endpoints and event parameters into the active event.
 *
 * @mangled EdInitHashigo__FP13ED_EVENT_INFOP14ED_EVENT_PARAM
 * @address 0x16D720
 * @size 0xD0
 */
void EdInitHashigo(ED_EVENT_INFO *info, ED_EVENT_PARAM *param) {
    if (param->kind == 4) {
        sceVu0CopyVector(info->vector_arguments[1], param->position);
        sceVu0CopyVector(info->vector_arguments[0], param->camera_pos);
        info->integer_arguments[0] = 0;
    } else {
        sceVu0CopyVector(info->vector_arguments[0], param->position);
        sceVu0CopyVector(info->vector_arguments[1], param->camera_pos);
        info->integer_arguments[0] = 1;
    }
    sceVu0CopyVector(info->vector_arguments[2], param->rotation);
    info->flag_arguments[0] = (int) param->point->unk_60[3];
    info->integer_arguments[1] = param->point->side;
    info->integer_arguments[2] = param->point->linked_value;
}

int EdInitGotoInterior(ED_EVENT_INFO *info, ED_EVENT_PARAM *param) {
    sceVu0CopyVector(info->vector_arguments[0], param->position);
    sceVu0CopyVector(info->vector_arguments[1], param->rotation);
    sceVu0CopyVector(info->vector_arguments[2], param->camera_pos);
    return param->point->minimum_progress;
}
