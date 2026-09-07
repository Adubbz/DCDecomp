#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000

#include "ebattle.hpp"

#include "texture.hpp"

/* The four values EBDraw reads to place its caution mark; all of them zero. */
extern "C" const s32 Caution[4] = {0, 0, 0, 0};

INCLUDE_ASM("asm/nonmatchings/ebattle", CommandTEX_ANIME__FPPv);
INCLUDE_ASM("asm/nonmatchings/ebattle", CommandTEX_ANIME_DATA__FPPv);
INCLUDE_ASM("asm/nonmatchings/ebattle", CommandTEX_ANIME_DATA2__FPPv);
INCLUDE_ASM("asm/nonmatchings/ebattle", CommandTEX_SCROLL_DATA__FPPv);
void CommandTEX_ANIME_END(void **arg0) {
}

/* External */

/* strings */

/* data */
extern int eb_motion[160];

/* sdata */
extern float old_time;
extern float speed;
extern int now_eb_key;
extern s16 key_mode;

/* bss */
extern int ebattle_flag;
extern int ebattle_intro_flag;
extern int eb_count;
extern int eb_intro_cnt;
extern int eb_finish_cnt;
extern int eb_end_count;
extern int eb_result;
extern int eb_key_count;
extern int now_button_no;
extern int eb_chara;
extern int fade_bgm;
extern int play_fanfare;
extern int now_time;
extern int sound_cnt;
extern int debug_mode;
extern CTexture *tex;
extern CTexture *tex2;
extern int eb_key_num;

extern void init_draw_ok();

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
