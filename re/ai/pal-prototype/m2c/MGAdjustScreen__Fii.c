extern s32 mgAdjustX;
extern s32 mgAdjustY;

/* MGAdjustScreen (int, int) */
void MGAdjustScreen__Fii(s32 arg0, s32 arg1) {
    s32 var_a0;
    s32 var_a1;

    var_a0 = arg0;
    var_a1 = arg1;
    if (var_a0 >= 0x21) {
        var_a0 = 0;
    }
    if (var_a0 < -0x20) {
        var_a0 = 0;
    }
    if (var_a1 >= 0x21) {
        var_a1 = 0;
    }
    if (var_a1 < -0x20) {
        var_a1 = 0;
    }
    mgAdjustX = (var_a0 >> 1) * 2;
    mgAdjustY = (var_a1 >> 1) * 2;
}
