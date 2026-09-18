? DrawMenu2DSprite__FP8CTexture8CRect<i>8CRect<i>i(CTexture *arg0, CRect<int> arg1, CRect<int> arg2, s32 arg3); /* extern */
extern s128 @2353;
extern s128 @2354;
extern s64 @2355;
extern CTexture *MenuOption;

/* DrawOptionScreenWaku (void) */
void DrawOptionScreenWaku__Fv(void) {
    s64 spD8;
    s32 spCC;
    s32 spC8;
    s32 spC4;
    s32 spC0;
    s32 spBC;
    s32 spB8;
    s32 spB4;
    s32 spB0;
    s32 spAC;
    s32 spA8;
    s32 spA4;
    s32 spA0;
    s32 sp9C;
    s32 sp98;
    s32 sp94;
    s32 sp90;
    s32 sp8C;
    s32 sp88;
    s32 sp84;
    s32 sp80;
    s32 sp7C;
    s32 sp78;
    s32 sp74;
    s32 sp70;
    s16 sp6E;
    s16 sp6C;
    s16 sp6A;
    s16 sp68;
    s16 sp66;
    s16 sp64;
    s16 sp62;
    s16 sp60;
    s128 sp50;
    s32 temp_s1;
    s32 var_s0;
    void *temp_v0;
    void *temp_v0_2;
    void *temp_v1;

    sp80 = 0x1C0;
    sp84 = 0;
    sp88 = 0x40;
    sp8C = 0x40;
    sp70 = 0x120;
    sp74 = 0xD0;
    sp78 = 0x40;
    sp7C = 0x40;
    DrawMenu2DSprite__FP8CTexture8CRect<i>8CRect<i>i(MenuOption, (CRect<int>) &sp70, (CRect<int>) &sp80, 0x80);
    sp50 = @2353;
    sp60 = (s128) @2354;
    sp60 = 0x130;
    sp62 = 0x90;
    sp64 = 0x180;
    sp66 = 0xE0;
    sp68 = 0x130;
    sp6A = 0x130;
    sp6C = 0xE0;
    sp6E = 0xE0;
    spD8 = @2355;
    var_s0 = 0;
loop_2:
    if (var_s0 < 4) {
        temp_v1 = (var_s0 * 2) + sp;
        spA0 = temp_v1->unkD8 + 0x1C0;
        spA4 = temp_v1->unkD9 + 0x40;
        spA8 = 0x20;
        spAC = 0x20;
        temp_s1 = var_s0 * 4;
        temp_v0 = temp_s1 + sp;
        sp90 = (s32) temp_v0->unk50;
        sp94 = (s32) temp_v0->unk52;
        sp98 = 0x20;
        sp9C = 0x20;
        DrawMenu2DSprite__FP8CTexture8CRect<i>8CRect<i>i(MenuOption, (CRect<int>) &sp90, (CRect<int>) &spA0, 0x80);
        spC0 = temp_v1->unkD8 + 0x1C0;
        spC4 = temp_v1->unkD9 + 0x80;
        spC8 = 0x20;
        spCC = 0x20;
        temp_v0_2 = temp_s1 + sp;
        spB0 = (s32) temp_v0_2->unk60;
        spB4 = (s32) temp_v0_2->unk62;
        spB8 = 0x20;
        spBC = 0x20;
        DrawMenu2DSprite__FP8CTexture8CRect<i>8CRect<i>i(MenuOption, (CRect<int>) &spB0, (CRect<int>) &spC0, 0x80);
        var_s0 += 1;
        goto loop_2;
    }
}
