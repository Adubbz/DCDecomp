s32 BtGetFloorLevel__Fi(s32 arg0);                  /* extern */
? set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect<i>RC8CRect<i>Uc(sceVif1Packet *arg0, CTexture *arg1, CRect<int> *arg2, CRect<int> *arg3, u8 arg4); /* extern */
extern ? center_ptr;

/* StartMessageDraw (CTexture *, int, int, int, int) */
void StartMessageDraw__FP8CTextureiiii(CTexture *arg0, s32 arg1, s32 arg2, s32 arg3, s32 arg4) {
    s32 sp18C;
    s32 sp188;
    s32 sp184;
    s32 sp180;
    s32 sp17C;
    s32 sp178;
    s32 sp174;
    s32 sp170;
    s32 sp16C;
    s32 sp168;
    s32 sp164;
    s32 sp160;
    s32 sp15C;
    s32 sp158;
    s32 sp154;
    s32 sp150;
    s32 sp14C;
    s32 sp148;
    s32 sp144;
    s32 sp140;
    s32 sp13C;
    s32 sp138;
    s32 sp134;
    s32 sp130;
    s32 sp12C;
    s32 sp128;
    s32 sp124;
    s32 sp120;
    s32 sp11C;
    s32 sp118;
    s32 sp114;
    s32 sp110;
    s32 sp10C;
    s32 sp108;
    s32 sp104;
    s32 sp100;
    s32 spFC;
    s32 spF8;
    s32 spF4;
    s32 spF0;
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
    s32 temp_s3;
    s32 var_s0;
    s32 var_s3;

    var_s0 = *(*(&center_ptr + (LanguageCode * 4)) + (arg1 * 4)) + 0x82;
    sp80 = 0;
    sp84 = 0;
    sp88 = 0x17C;
    sp8C = 0x32;
    sp70 = 0x82;
    sp74 = 0xAA;
    sp78 = 0x17C;
    sp7C = 0x32;
    set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect<i>RC8CRect<i>Uc(Vif1Packet, arg0, (CRect<int> *) &sp70, (CRect<int> *) &sp80, (u8) arg4);
    var_s3 = arg2 + 1;
    if (arg1 == 5) {
        var_s3 = BtGetFloorLevel__Fi(var_s3 - 1);
    }
    if (var_s3 < 0xA) {
        var_s0 -= 0x13;
        spA0 = (var_s3 % 10) * 0x26;
        spA4 = 0x32;
        spA8 = 0x26;
        spAC = 0x32;
        sp90 = var_s0;
        sp94 = 0xAA;
        sp98 = 0x26;
        sp9C = 0x32;
        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect<i>RC8CRect<i>Uc(Vif1Packet, arg0, (CRect<int> *) &sp90, (CRect<int> *) &spA0, M2C_ERROR(/* Read from unset register $a4 */));
    }
    if ((var_s3 >= 0xA) && (var_s3 < 0x64)) {
        var_s0 -= 0x26;
        spC0 = (var_s3 / 10) * 0x26;
        spC4 = 0x32;
        spC8 = 0x26;
        spCC = 0x32;
        spB0 = var_s0;
        spB4 = 0xAA;
        spB8 = 0x26;
        spBC = 0x32;
        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect<i>RC8CRect<i>Uc(Vif1Packet, arg0, (CRect<int> *) &spB0, (CRect<int> *) &spC0, M2C_ERROR(/* Read from unset register $a4 */));
        spE0 = (var_s3 % 10) * 0x26;
        spE4 = 0x32;
        spE8 = 0x26;
        spEC = 0x32;
        spD0 = var_s0 + 0x26;
        spD4 = 0xAA;
        spD8 = 0x26;
        spDC = 0x32;
        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect<i>RC8CRect<i>Uc(Vif1Packet, arg0, (CRect<int> *) &spD0, (CRect<int> *) &spE0, M2C_ERROR(/* Read from unset register $a4 */));
    }
    if (var_s3 >= 0x64) {
        temp_s3 = var_s3 % 100;
        sp100 = (var_s3 / 100) * 0x26;
        sp104 = 0x32;
        sp108 = 0x26;
        sp10C = 0x32;
        spF0 = var_s0 - 0x39;
        spF4 = 0xAA;
        spF8 = 0x26;
        spFC = 0x32;
        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect<i>RC8CRect<i>Uc(Vif1Packet, arg0, (CRect<int> *) &spF0, (CRect<int> *) &sp100, M2C_ERROR(/* Read from unset register $a4 */));
        sp120 = (temp_s3 / 10) * 0x26;
        sp124 = 0x32;
        sp128 = 0x26;
        sp12C = 0x32;
        sp110 = var_s0 - 0x13;
        sp114 = 0xAA;
        sp118 = 0x26;
        sp11C = 0x32;
        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect<i>RC8CRect<i>Uc(Vif1Packet, arg0, (CRect<int> *) &sp110, (CRect<int> *) &sp120, M2C_ERROR(/* Read from unset register $a4 */));
        sp140 = (temp_s3 % 10) * 0x26;
        sp144 = 0x32;
        sp148 = 0x26;
        sp14C = 0x32;
        sp130 = var_s0 + 0x13;
        sp134 = 0xAA;
        sp138 = 0x26;
        sp13C = 0x32;
        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect<i>RC8CRect<i>Uc(Vif1Packet, arg0, (CRect<int> *) &sp130, (CRect<int> *) &sp140, M2C_ERROR(/* Read from unset register $a4 */));
    }
    if (arg3 != 0) {
        sp160 = 0x114;
        sp164 = 0x7C;
        sp168 = 0x64;
        sp16C = 0x32;
        sp150 = 0x10E;
        sp154 = 0xE6;
        sp158 = 0x64;
        sp15C = 0x32;
        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect<i>RC8CRect<i>Uc(Vif1Packet, arg0, (CRect<int> *) &sp150, (CRect<int> *) &sp160, M2C_ERROR(/* Read from unset register $a4 */));
        return;
    }
    if (UserStatus->res_limit_zone_current >= 0) {
        sp180 = 0;
        sp184 = 0x7C;
        sp188 = 0xF0;
        sp18C = 0x32;
        sp170 = 0xC8;
        sp174 = 0xE6;
        sp178 = 0xF0;
        sp17C = 0x32;
        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect<i>RC8CRect<i>Uc(Vif1Packet, arg0, (CRect<int> *) &sp170, (CRect<int> *) &sp180, M2C_ERROR(/* Read from unset register $a4 */));
    }
}
