#include "common.h"

#include <libvu0.h>

#include <cmath>

#include "camerafollow.hpp"
#include "character.hpp"
#include "dataread.hpp"
#include "ebattle.hpp"
#include "edit.hpp"
#include "editloop.hpp"
#include "gamepad.hpp"
#include "mathutil.hpp"
#include "mglib.hpp"
#include "rect.hpp"
#include "snd.hpp"
#include "texture.hpp"

#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 517

/**
 * Stores one event-battle key and its timing state.
 */
struct EB_KEY {
    int unk_00;
    int unk_04;
    int unk_08;
    int unk_0C;
    int unk_10;
    int unk_14;
    int unk_18;
};

STATIC_ASSERT(sizeof(EB_KEY) == 0x1C);

/**
 * Stores one motion and its frame range for the event-battle sequence.
 */
struct EB_MOTION {
    int motion_no; /**< Motion requested from the character. */
    float start;   /**< First frame of the motion. */
    float end;     /**< Frame after the motion ends. */
    float speed;   /**< Frames advanced on each update. */
    int frames;    /**< Number of updates in the motion. */
};

STATIC_ASSERT(sizeof(EB_MOTION) == 0x14);

/* The four values EBDraw reads to place its caution mark; all of them zero. */
extern "C" const s32 Caution[4] = {0, 0, 0, 0};

/** Stores the key state for each event-battle motion. */
extern EB_KEY eb_key[64];
extern EB_MOTION eb_motion[32];
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

/**
 * Stores one motion segment used to convert animation time into battle frames.
 */
struct EB_MOTION_ENTRY {
    int motion_no;
    float start;
    float end;
    float speed;
    int duration;
};

/**
 * Stores one timed controller prompt in an event battle.
 */
struct EB_KEY_ENTRY {
    int frame;
    int buttons;
    int mode;
    int pressed;
    int complete;
    int early;
    int reserved;
};

extern CCharacter *eb_chara;
extern int eb_cool_flag;
extern int eb_result;
extern float now_time;
extern ED_MOVE_CHARA_INFO EdMoveCharaInfo;

/** The part of the screen the event battle's opening wipe has reached. */
extern CRect_i_ draw_rect;
extern int eb_key_num;

static void init_draw_ok();
static void set_draw_ok(int type, int button);
void draw_ok_loop();
void DrawButton(int buttons, int x, int y, float scale, int early);
static void DrawButtonSub(int x, int y, int texture_x, int texture_y, float scale);
static void draw_ok(int x);
static float button_scale(int button);
void EdEyeCamera(CCamera *camera, CCharacter *character);

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
            eb_motion[0].motion_no = -1;
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

/**
 * Looks up the textures the event battle's opening needs.
 *
 * @mangled EBInitIntro__Fv
 * @address 0x168200
 * @size 0xA8
 */
void EBInitIntro(void) {
    tex = TexManager.GetTexture("ebat", -1);
    if (tex == NULL) {
        return;
    }
    tex2 = TexManager.GetTexture("ebat2", -1);
    if (tex2 == NULL) {
        return;
    }
    eb_intro_cnt = 0;
    ebattle_intro_flag = 1;
    // The wipe opens from the right edge, so it starts with no width.
    draw_rect = CRect_i_(0x280, 0, 0, 0x1C0);
}
void EBSetMotion(CCharacter *character, int *motions) {
    if (character == NULL) {
        return;
    }

    int i;
    for (i = 0;; i++) {
        int motion_no = motions[i];
        if (motion_no < 0) {
            break;
        }
        eb_motion[i].motion_no = motion_no;
    }
    eb_motion[i].motion_no = -1;

    eb_chara = character;
    for (i = 0;; i++) {
        if (eb_motion[i].motion_no < 0) {
            break;
        }
        MOTION_INFO *info = eb_chara->GetMotionInfo(eb_motion[i].motion_no);
        if (info == NULL) {
            return;
        }
        float start = (float) info->start;
        float end = (float) info->end;
        eb_motion[i].start = start;
        eb_motion[i].end = end;
        eb_motion[i].speed = info->speed;
        int frames = (int) ((end - start) / info->speed);
        eb_end_count += frames;
        eb_motion[i].frames = frames;
    }

    ebattle_flag = 1;
    eb_cool_flag = 1;
    GamePad.MenuModeOn(0x50);
}

void EBDebug(int mode) {
    debug_mode = mode;
}

void EBSetKey(float time, int buttons, int mode) {
    if (eb_key_num < 64) {
        EB_KEY_ENTRY *key = (EB_KEY_ENTRY *) &eb_key[eb_key_num++];
        key->frame = 0;
        for (int i = 0;; i++) {
            EB_MOTION *motion = &eb_motion[i];
            if (motion->motion_no < 0) {
                break;
            }
            if (time >= motion->start && time < motion->end) {
                key->frame += (time - motion->start) / motion->speed;
                break;
            }
            key->frame += motion->frames;
        }
        key->buttons = buttons;
        key->pressed = 0;
        if (mode > 5) {
            mode = 5;
        }
        key->mode = mode;
        key->early = 0;
        key->complete = 0;
        key->reserved = 0;
    }
}

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

/**
 * Runs the event battle's opening and reports when it ends.
 *
 * @mangled EBIntroLoop__Fv
 * @address 0x1685C0
 * @size 0xCC
 */
int EBIntroLoop(void) {
    int width;

    if (ebattle_intro_flag == 0) {
        return 1;
    }

    // The wipe crosses the screen over a hundred frames.
    width = eb_intro_cnt * 640 / 100;
    if (width > 640) {
        width = 640;
    }
    draw_rect.x = 640 - width;
    draw_rect.width = width;
    eb_intro_cnt++;
    if (eb_intro_cnt > 100) {
        draw_rect = CRect_i_(0, 0, 640, 448);
        return 1;
    }
    return 0;
}
/**
 * Runs one frame of the event battle and reports the result.
 *
 * @mangled EBLoop__Fv
 * @address 0x168690
 * @size 0x4E4
 */
#ifdef NON_MATCHING
int EBLoop() {
    if (ebattle_flag == 0) {
        return 1;
    }
    if (eb_finish_cnt > 1) {
        --eb_finish_cnt;
        return 0;
    }
    if (eb_finish_cnt == 1) {
        EBExit();
        return eb_result;
    }

    if (eb_count == 0 && play_fanfare != 0) {
        int sound_size;
        StartReadBG();
        SndSPSeLoadBG(0x2F, read_buffer, &sound_size);
    }
    ReadBG();

    EB_KEY_ENTRY *keys = (EB_KEY_ENTRY *) eb_key;
    EB_KEY_ENTRY *active = NULL;
    int timing_grade = 0;
    for (int i = 0; i < eb_key_num; ++i) {
        EB_KEY_ENTRY &key = keys[i];
        float distance = (float) (eb_count - key.frame) * speed;
        int early_window = key.mode > 0 ? (6 - key.mode) * 64 : 0;
        key.early = distance <= 16.0f - (float) early_window && early_window > 0;
        if (distance > 0.0f) {
            if (distance >= 48.0f) {
                key.complete = 1;
            } else if (distance < 24.0f) {
                timing_grade = 1;
            }
        }
        if (distance > -16.0f && distance < 48.0f) {
            active = &key;
        }
    }

    int failed = 0;
    if (active == NULL) {
        failed = GamePad.GetPadDown() != 0;
    } else {
        active->pressed |= GamePad.GetPadDown();
        if (active->pressed == active->buttons) {
            if (active->complete == 0) {
                SndSePlay(timing_grade != 0 ? 10 : 9, -1, 0);
                int button = (int) (active - keys);
                set_draw_ok(timing_grade, button);
                eb_cool_flag &= timing_grade;
                ++eb_key_count;
            }
            active->complete = 1;
        }
        if (active->buttons != (active->buttons | active->pressed)) {
            failed = 1;
        }
    }

    if (failed != 0 && debug_mode == 0 && eb_key_count < eb_key_num &&
        EdDebugParamDrawOff == 0) {
        SndBgmFadeOut(40, 0);
        eb_finish_cnt = 80;
        eb_result = -1;
        ++eb_count;
        return 0;
    }

    if (eb_count == eb_end_count - 100 && fade_bgm != 0) {
        SndBgmFadeOut(100, 0);
    }
    if (eb_count < eb_end_count) {
        old_time = now_time;
        draw_ok_loop();
        ++eb_count;
        return 0;
    }

    if (play_fanfare != 0) {
        while (SndSPSeSyncBG() != 0) {
        }
        SndSPSePlay(0x2F, -1);
    }
    eb_finish_cnt = 160;
    eb_result = (eb_cool_flag != 0) + 1;
    return 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/ebattle", EBLoop__Fv);
#endif
/**
 * Draws the event battle's prompt strip and result overlay.
 */
#ifdef NON_MATCHING
void EBDraw() {
    if ((ebattle_intro_flag == 0 && ebattle_flag == 0) || EdDebugParamDrawOff != 0) {
        return;
    }

    setbilinear(0);
    TexManager.ReloadTexture(GetVif1Packet(), 0x2D);
    if (eb_finish_cnt > 0) {
        CRect_i_ result_screen;
        CRect_i_ result_texel;
        if (eb_result < 0) {
            result_texel = CRect_i_(0, 0x50, 0x92, 0x3C);
        } else if (eb_result == 2) {
            result_texel = CRect_i_(0, 0, 0x100, 0x46);
        } else {
            result_texel = CRect_i_(0, 0x92, 0xB8, 0x40);
        }
        if (eb_result < 1 && ((eb_finish_cnt >> 2) & 1) == 0) {
            return;
        }
        result_screen = CRect_i_(0x140 - result_texel.width / 2,
                                 0xE0 - result_texel.height / 2,
                                 result_texel.width, result_texel.height);
        set2DSprite(GetVif1Packet(), tex2, result_screen, 0, result_texel.y);
        return;
    }

    CRect_i_ dark_bar(0, 0xA0, 0x280, 0x10);
    CRect_i_ top_line(0xA8, 0xA0, 0x40, 0x10);
    CRect_i_ bottom_line(0xC0, 0xA0, 0x10, 0x10);
    if (ebattle_intro_flag != 0) {
        dark_bar.x += draw_rect.x;
        top_line.x += draw_rect.x;
        bottom_line.x += draw_rect.x;
    }
    MGFillBox(dark_bar, 0, 0x28, 0xA0, 0x40);
    MGFillBox(top_line, 0xFF, 0xFF, 0xFF, 0x20);
    MGFillBox(bottom_line, 0xFF, 0xFF, 0xFF, 0x20);

    if (ebattle_intro_flag != 0) {
        if (((eb_intro_cnt >> 2) & 1) != 0) {
            CRect_i_ caution(0x140 - 0x49, 0xE0 - 0x1E, 0x92, 0x3C);
            set2DSprite(GetVif1Packet(), tex2, caution, Caution[0], Caution[1]);
        }
        if ((eb_intro_cnt & 7) == 0) {
            SndSePlay(8, -1, 0);
        }
        return;
    }

    EB_KEY_ENTRY *keys = (EB_KEY_ENTRY *) eb_key;
    for (int i = eb_key_count; i < eb_key_num; ++i) {
        float position = 200.0f - (float) (eb_count - keys[i].frame) * speed;
        DrawButton(keys[i].buttons, (int) position, 0x140, button_scale(i), keys[i].early);
    }
    if (eb_key_count > 0) {
        EB_KEY_ENTRY &previous = keys[eb_key_count - 1];
        float position = 200.0f - (float) (eb_count - previous.frame) * speed;
        draw_ok((int) position);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/ebattle", EBDraw__Fv);
#endif
/**
 * Draws one button prompt of the event battle.
 *
 * @mangled DrawButton__Fiiifi
 * @address 0x1690E0
 * @size 0x260
 */
#ifdef NON_MATCHING
void DrawButton(int buttons, int x, int y, float scale, int early) {
    if (x < -0x20 || x >= 0x281) {
        return;
    }
    if (early != 0) {
        DrawButtonSub(x, y, 0, 0x60, scale);
    } else if ((buttons & 0x20) != 0) {
        DrawButtonSub(x, y, 0, 0, scale);
    } else if ((buttons & 0x10) != 0) {
        DrawButtonSub(x, y, 0x20, 0, scale);
    } else if ((buttons & 0x80) != 0) {
        DrawButtonSub(x, y, 0x40, 0, scale);
    } else if ((buttons & 0x40) != 0) {
        DrawButtonSub(x, y, 0x60, 0, scale);
    } else if ((buttons & 0x1000) != 0) {
        if ((buttons & 0x8000) != 0) {
            DrawButtonSub(x, y, 0x20, 0x40, scale);
        } else if ((buttons & 0x2000) != 0) {
            DrawButtonSub(x, y, 0, 0x40, scale);
        } else {
            DrawButtonSub(x, y, 0, 0x20, scale);
        }
    } else if ((buttons & 0x8000) != 0) {
        DrawButtonSub(x, y, 0x60, 0x20, scale);
    } else if ((buttons & 0x2000) != 0) {
        DrawButtonSub(x, y, 0x40, 0x20, scale);
    } else if ((buttons & 0x4000) != 0) {
        DrawButtonSub(x, y, 0x20, 0x20, scale);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/ebattle", DrawButton__Fiiifi);
#endif
/**
 * Draws one button prompt at a scale.
 *
 * @mangled DrawButtonSub__Fiiiif
 * @address 0x169340
 * @size 0xE0
 */
static void DrawButtonSub(int x, int y, int u, int v, float scale) {
    int width = 32.0f * scale;
    int height = 32.0f * scale;
    CRect_i_ screen;
    CRect_i_ texel;

    // The prompt grows about its own centre.
    x -= (width - 32) >> 1;
    y -= (height - 32) >> 1;
    texel.x = u;
    texel.y = v;
    texel.width = 32;
    texel.height = 32;
    screen.x = x;
    screen.y = y;
    screen.width = width;
    screen.height = height;
    set2DSprite(GetVif1Packet(), tex, screen, texel);
}

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

/**
 * Draws the success flash after a button is pressed in time.
 *
 * @mangled draw_ok__Fi
 * @address 0x169490
 * @size 0x2A0
 */
#ifdef NON_MATCHING
static void draw_ok(int x) {
    if (ok_draw_cnt <= 0) {
        return;
    }

    CRect_i_ success_texel(0, 0xD0, 0x1A, 0x10);
    CRect_i_ cool_texel(0, 0xE0, 0x28, 0x10);
    CRect_i_ spark_texel(0x20, 0x60, 0x20, 0x20);
    CRect_i_ *result_texel = ok_type == 0 ? &success_texel : &cool_texel;
    if (((ok_draw_cnt / 3) & 1) != 0) {
        CRect_i_ result_screen(0xC8 - result_texel->width / 2,
                               0x13E - result_texel->height,
                               result_texel->width, result_texel->height);
        set2DSprite(GetVif1Packet(), tex2, result_screen, result_texel->x, result_texel->y);
    }

    sceVu0FVECTOR directions[8] = {
        {1.0f, 0.0f, 0.0f, 0.0f},   {1.0f, 1.0f, 0.0f, 0.0f},
        {0.0f, 1.0f, 0.0f, 0.0f},   {-1.0f, 1.0f, 0.0f, 0.0f},
        {-1.0f, 0.0f, 0.0f, 0.0f},  {-1.0f, -1.0f, 0.0f, 0.0f},
        {0.0f, -1.0f, 0.0f, 0.0f},  {1.0f, -1.0f, 0.0f, 0.0f},
    };
    int age = 30 - ok_draw_cnt;
    int alpha = 0x80 - ((30 - ok_draw_cnt * 2) * 0x80) / 30;
    for (int i = 0; i < 8 && alpha > 0; ++i) {
        sceVu0FVECTOR offset;
        sceVu0Normalize(directions[i], directions[i]);
        sceVu0ScaleVector(offset, directions[i], 2.0f * (float) age);
        CRect_i_ screen(x + 0x18 + (int) offset[0] - spark_texel.width / 2,
                        (int) offset[1] + 0x15E - spark_texel.height,
                        spark_texel.width, spark_texel.height);
        set2DSprite(GetVif1Packet(), tex, screen, spark_texel, (unsigned char) alpha);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/ebattle", draw_ok__Fi);
#endif
/**
 * Gives the scale a button prompt draws at while it flashes.
 *
 * @mangled button_scale__Fi
 * @address 0x169730
 * @size 0x90
 */
static float button_scale(int button) {
    if (button != ok_effect_button) {
        return 1.0f;
    }

    // The prompt swells over the first five frames of the flash and settles
    // back over the next five.
    int elapsed = 30 - ok_draw_cnt;
    float scale = 1.0f;

    if (elapsed < 5) {
        scale += 0.2f * (float) elapsed;
    } else if (elapsed < 10) {
        scale += 0.2f * (float) (10 - elapsed);
    }
    return scale;
}
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

/**
 * Reports whether a button is held, unless the pad is locked.
 *
 * @mangled PadOn__Fi
 * @address 0x169AF0
 * @size 0x40
 */
static int PadOn(int keys) {
    if (keylock() != 0) {
        return 0;
    }
    return EdPadOn(keys, 1);
}
/**
 * Reports whether a button was just pressed, unless the pad is locked.
 *
 * @mangled PadDown__Fi
 * @address 0x169B30
 * @size 0x40
 */
static int PadDown(int keys) {
    if (keylock() != 0) {
        return 0;
    }
    return EdPadDown(keys, 1);
}
/**
 * Moves the camera towards a point, keeping it clear of the collision.
 *
 * @mangled CameraAutoMove__FP13CCameraFollowP6CCPolyPfff
 * @address 0x169B70
 * @size 0x20C
 */
static void CameraAutoMove(CCameraFollow *camera, CCPoly *poly, float *position, float from,
                           float to) {
    float reference[4];
    float offset[4];
    float step;

    camera->GetRef(reference);
    offset[0] = position[0] - reference[0];
    offset[2] = position[2] - reference[2];
    offset[1] = 0.0f;
    camera->SetDistance(0.1f + DistVector(offset));

    step = 0.0f;
    float over = camera->GetDistance() - camera_near_dist;
    if (over < step) {
        step = -over / 10.0f;
    }
    if (over > 0.0f) {
        step = over / 15.0f;
    }
    if (step > 2.0f) {
        step = 2.0f;
    }
    if (step < 0.05f) {
        step = 0.05f;
    }
    if (over < 0.0f) {
        step *= 2.0f;
    }

    camera->SetAngle(atan2f(offset[0], offset[2]));
    if (from < to) {
        camera->AddAngle(0.2f * -step);
    } else {
        camera->AddAngle(0.2f * step);
    }
    if (camera->GetDistance() < 0.8f * camera_near_dist) {
        camera->AddHeight(1.0f);
    }
}

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

/**
 * Places the eye camera on a character's head.
 *
 * @mangled InitEyeCamera__FP10CCharacter
 * @address 0x169D90
 * @size 0x34
 */
static void InitEyeCamera(CCharacter *chara) {
    // The camera looks the way the character faces.
    viewAngleH = chara->GetRotation()->y;
    viewAngleV = 0.0f;
}

/**
 * Aims the eye camera from a character's head.
 *
 * @mangled EyeCamera__FP7CCameraP10CCharacteri
 * @address 0x169DD0
 * @size 0x1B0
 */
void EyeCamera(CCamera *camera, CCharacter *character, int right_stick) {
    float stick_x;
    float stick_y;

    if (right_stick != 0) {
        stick_x = 0.0f;
        stick_y = -GetRYf();
    } else {
        stick_x = GetLXf();
        stick_y = -GetLYf();
    }
    if (stick_x > 0.0f) {
        float rate = 0.02f;
        viewAngleH -= stick_x * rate;
        if (viewAngleH < -3.1415927f) {
            viewAngleH += 6.2831855f;
        }
    }
    if (stick_x < -0.0f) {
        float rate = 0.02f;
        viewAngleH -= stick_x * rate;
        if (viewAngleH > 3.1415927f) {
            viewAngleH -= 6.2831855f;
        }
    }
    if (stick_y > 0.0f && viewAngleV < 0.65f) {
        float rate = 0.02f;
        viewAngleV += stick_y * rate;
    }
    if (stick_y < -0.0f && viewAngleV > -1.0f) {
        float rate = 0.02f;
        viewAngleV += stick_y * rate;
    }
    EdEyeCamera(camera, character);
}

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

/**
 * Aims the editor's eye camera from a character's head.
 *
 * @mangled EdEyeCamera__FP7CCameraP10CCharacter
 * @address 0x169FF0
 * @size 0x128
 */
void EdEyeCamera(CCamera *camera, CCharacter *chara) {
    sceVu0FVECTOR position;
    sceVu0FVECTOR reference;
    sceVu0FMATRIX rotation;
    sceVu0FMATRIX unit;

    // The point the camera looks at sits ten units ahead of the head, turned
    // by the two view angles.
    reference[0] = 0.0f;
    reference[1] = 0.0f;
    reference[2] = 10.0f;
    reference[3] = 0.0f;
    sceVu0UnitMatrix(unit);
    sceVu0RotMatrixX(rotation, unit, viewAngleV);
    sceVu0RotMatrixY(rotation, rotation, viewAngleH);
    sceVu0ApplyMatrix(reference, rotation, reference);
    chara->GetPosition(position);
    position[1] += 14.0f;
    reference[0] += position[0];
    reference[1] += position[1];
    reference[2] += position[2];
    camera->SetPos(position);
    camera->SetRef(reference);
}

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

#ifdef NON_MATCHING
void EdMoveChara() {
    CCharacter *character = EdMoveCharaInfo.chara;
    CCamera *camera = EdMoveCharaInfo.camera;
    if (character == NULL || camera == NULL) {
        return;
    }

    if (EdMoveCharaInfo.key_lock == 0) {
        chara_mode &= ~1;
    } else {
        chara_mode |= 1;
    }

    float horizontal = GetLXf();
    float vertical = GetLYf();
    float camera_angle = camera->GetAngleH();
    float forward = horizontal * cosf(camera_angle) + vertical * sinf(camera_angle);
    float sideways = vertical * cosf(camera_angle) - horizontal * sinf(camera_angle);
    if (viewMode == 0 && (forward != 0.0f || sideways != 0.0f)) {
        float position[4];
        character->GetPosition(position);
        position[0] += forward;
        position[2] += sideways;
        character->SetPosition(position[0], position[1], position[2]);
        character->SetRotation(0.0f, atan2f(forward, sideways), 0.0f);
        character->SetMotion(1, 0);
    } else if (viewMode == 0) {
        character->SetMotion(0, 0);
    }

    if (EdMoveCharaInfo.in_event == 0 && PadDown(2) != 0) {
        viewMode = viewMode == 0;
        InitEyeCamera(character);
    }
    if (viewMode != 0) {
        EyeCamera(camera, character, EdMoveCharaInfo.key_lock);
    }

    EdMoveCharaInfo.motion_previous = EdMoveCharaInfo.motion_current;
    EdMoveCharaInfo.motion_current = character->GetNowTime();
}
#else
INCLUDE_ASM("asm/nonmatchings/ebattle", EdMoveChara__Fv);
#endif

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
