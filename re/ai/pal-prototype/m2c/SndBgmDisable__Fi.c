? SndBgmStop__Fv();                                 /* extern */
extern s32 bgm_off;

/* SndBgmDisable (int) */
void SndBgmDisable__Fi(s32 arg0) {
    bgm_off = arg0;
    if (arg0 != 0) {
        SndBgmStop__Fv();
    }
}
