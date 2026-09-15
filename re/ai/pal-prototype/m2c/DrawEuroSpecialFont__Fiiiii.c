? DrawMenu2DSprite__FP8CTexture8CRect<i>8CRect<i>UcUcUci(CTexture *arg0, CRect<int> arg1, CRect<int> arg2, u8 arg3, u8 arg4, u8 arg5, s32 arg6); /* extern */
CTexture *GetTexture__15CTextureManagerFPci(CTextureManager *this, s8 *arg0, s32 arg1); /* extern */
extern CTexture *EuroTex;
extern ? menu_euro_codetbl;

/* DrawEuroSpecialFont (int, int, int, int, int) */
void DrawEuroSpecialFont__Fiiiii(s32 arg0, s32 arg1, s32 arg2, s32 arg3, s32 arg4) {
    s32 spEC;
    s32 spE8;
    s32 spE4;
    s32 spE0;
    s32 spDC;
    s32 spD8;
    s32 spD4;
    s32 spD0;
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
    s32 temp_a1;
    s32 temp_a1_2;
    s32 temp_s0;
    s32 temp_s1;
    s32 temp_s6;
    s32 temp_s7;
    s32 var_s2;
    s32 var_s3;

    spAC = arg1;
    spA8 = arg3;
    EuroTex = GetTexture__15CTextureManagerFPci(&TexManager, "euro", -1);
    var_s2 = 0;
loop_9:
    if (var_s2 < 2) {
        var_s3 = 0;
loop_7:
        if (var_s3 < 0xD) {
            temp_a1 = var_s3 + (var_s2 * 0xD);
            if (temp_a1 < 0x1A) {
                temp_a1_2 = *((temp_a1 * 2) + (&menu_euro_codetbl + (arg2 * 0x34))) - 0x104;
                if (temp_a1_2 != -2) {
                    if (temp_a1_2 >= 0) {
                        temp_s0 = (temp_a1_2 % 10) * 0x16;
                        temp_s1 = (temp_a1_2 / 10) * 0x16;
                        temp_s7 = arg0 + (var_s3 * 0x22);
                        temp_s6 = spAC + (var_s2 * 0x1A);
                        spC0 = temp_s0;
                        spC4 = temp_s1;
                        spC8 = 0x16;
                        spCC = 0x17;
                        spB0 = temp_s7 + 1;
                        spB4 = temp_s6 + 1;
                        spB8 = 0x16;
                        spBC = 0x16;
                        DrawMenu2DSprite__FP8CTexture8CRect<i>8CRect<i>UcUcUci(EuroTex, (CRect<int>) &spB0, (CRect<int>) &spC0, 0U, M2C_ERROR(/* Read from unset register $a4 */), M2C_ERROR(/* Read from unset register $a5 */), M2C_ERROR(/* Read from unset register $a6 */));
                        spE0 = temp_s0;
                        spE4 = temp_s1;
                        spE8 = 0x16;
                        spEC = 0x17;
                        spD0 = temp_s7;
                        spD4 = temp_s6;
                        spD8 = 0x16;
                        spDC = 0x16;
                        DrawMenu2DSprite__FP8CTexture8CRect<i>8CRect<i>UcUcUci(EuroTex, (CRect<int>) &spD0, (CRect<int>) &spE0, (u8) spA8, M2C_ERROR(/* Read from unset register $a4 */), M2C_ERROR(/* Read from unset register $a5 */), M2C_ERROR(/* Read from unset register $a6 */));
                    }
                    var_s3 += 1;
                    goto loop_7;
                }
            }
        }
        var_s2 += 1;
        goto loop_9;
    }
}
