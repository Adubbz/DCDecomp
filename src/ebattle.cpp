#include "common.h"

#include <libvu0.h>

#include "camerafollow.hpp"
#include "dataread.hpp"
#include "ebattle.hpp"
#include "edit.hpp"
#include "editloop.hpp"
#include "gamepad.hpp"
#include "snd.hpp"
#include "texture.hpp"

#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 517

/* The four values EBDraw reads to place its caution mark; all of them zero. */
extern "C" const s32 Caution[4] = {0, 0, 0, 0};

INCLUDE_ASM("asm/nonmatchings/ebattle", CommandTEX_ANIME__FPPv);
INCLUDE_ASM("asm/nonmatchings/ebattle", CommandTEX_ANIME_DATA__FPPv);
INCLUDE_ASM("asm/nonmatchings/ebattle", CommandTEX_ANIME_DATA2__FPPv);
INCLUDE_ASM("asm/nonmatchings/ebattle", CommandTEX_SCROLL_DATA__FPPv);

/**
 * Ends a texture animation command; nothing remains to be done.
 *
 * @mangled CommandTEX_ANIME_END__FPPv
 * @address 0x1680F0
 * @size 0x8
 */
void CommandTEX_ANIME_END(void **arguments) {
}

extern int eb_motion[160];
extern float old_time;
extern float speed;
extern int now_eb_key;
extern int ebattle_flag;
extern int ebattle_intro_flag;
extern int eb_count;
extern int eb_intro_cnt;
extern int eb_finish_cnt;
extern int eb_end_count;
extern int eb_key_count;
extern int now_button_no;
extern int fade_bgm;
extern int play_fanfare;
extern int sound_cnt;
extern int debug_mode;
extern CTexture *tex;
extern CTexture *tex2;
extern int eb_key_num;

static void init_draw_ok();

/* @ 0x168100 (0x10 bytes) -- EBInitialize__Fv */
void EBInitialize() {
    ebattle_flag = 0;
}

/* @ 0x168110 (0xE0 bytes) -- EBInit__Ff */
void EBInit(float speed_mult) {
    tex = TexManager.GetTexture("ebat", -1);

    if (tex) {
        tex2 = TexManager.GetTexture("ebat2", -1);

        if (tex2) {
            eb_count = 0;
            old_time = -1.0;
            eb_key_num = 0;
            speed = 4.0f * speed_mult;
            eb_end_count = 0;
            now_eb_key = -1;
            sound_cnt = 0;
            debug_mode = 0;
            eb_motion[0] = -1;
            eb_key_count = 0;
            eb_finish_cnt = 0;
            now_button_no = 0;
            init_draw_ok();
            fade_bgm = 1;
            play_fanfare = 1;
        }
    }
}

/* @ 0x1681F0 (0x10 bytes) -- EBFinishSound__Fii */
void EBFinishSound(int do_fade_bgm, int do_play_fanfare) {
    fade_bgm = do_fade_bgm;
    play_fanfare = do_play_fanfare;
}

INCLUDE_RODATA("asm/nonmatchings/ebattle", @1686);
INCLUDE_RODATA("asm/nonmatchings/ebattle", @1700);
INCLUDE_RODATA("asm/nonmatchings/ebattle", @1701);
INCLUDE_RODATA("asm/nonmatchings/ebattle", @1702);
INCLUDE_RODATA("asm/nonmatchings/ebattle", @1703);
INCLUDE_RODATA("asm/nonmatchings/ebattle", @1704);

extern int ok_draw_cnt;
extern int ok_effect_button;
extern int ok_type;
extern int chara_mode;
extern int viewMode;
extern int chara_fishing;
extern int fishing_mes;
extern float viewAngleH;
extern float viewAngleV;
extern float camera_near_dist;

INCLUDE_ASM("asm/nonmatchings/ebattle", EBInitIntro__Fv);
INCLUDE_ASM("asm/nonmatchings/ebattle", EBSetMotion__FP10CCharacterPi);

void EBDebug(int mode) {
    debug_mode = mode;
}

INCLUDE_ASM("asm/nonmatchings/ebattle", EBSetKey__Ffii);

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

INCLUDE_ASM("asm/nonmatchings/ebattle", EBIntroLoop__Fv);
INCLUDE_ASM("asm/nonmatchings/ebattle", EBLoop__Fv);
INCLUDE_ASM("asm/nonmatchings/ebattle", EBDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/ebattle", DrawButton__Fiiifi);
INCLUDE_ASM("asm/nonmatchings/ebattle", DrawButtonSub__Fiiiif);

/**
 * Clears the enemy-battle confirmation effect.
 *
 * @mangled init_draw_ok__Fv
 * @address 0x169420
 * @size 0x14
 */
static void init_draw_ok() {
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
static void set_draw_ok(int type, int button) {
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

INCLUDE_ASM("asm/nonmatchings/ebattle", draw_ok__Fi);
INCLUDE_ASM("asm/nonmatchings/ebattle", button_scale__Fi);
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
static int keylock() {
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

INCLUDE_ASM("asm/nonmatchings/ebattle", PadOn__Fi);
INCLUDE_ASM("asm/nonmatchings/ebattle", PadDown__Fi);
INCLUDE_ASM("asm/nonmatchings/ebattle", CameraAutoMove__FP13CCameraFollowP6CCPolyPfff);

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

INCLUDE_ASM("asm/nonmatchings/ebattle", InitEyeCamera__FP10CCharacter);
INCLUDE_ASM("asm/nonmatchings/ebattle", EyeCamera__FP7CCameraP10CCharacteri);

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

INCLUDE_ASM("asm/nonmatchings/ebattle", EdEyeCamera__FP7CCameraP10CCharacter);

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

INCLUDE_ASM("asm/nonmatchings/ebattle", EdMoveChara__Fv);

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
