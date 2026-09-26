? Stop__6CSoundFi(CSound *this, s32 arg0);          /* extern */
extern s32 now_bgm_no;
extern s32 now_bgm_play;

/* SndBgmPause (void) */
void SndBgmPause__Fv(void) {
    if ((now_bgm_no >= 0) && (now_bgm_play != 0)) {
        Stop__6CSoundFi(&CSnd, 0);
        now_bgm_play = 2;
    }
}
