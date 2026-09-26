extern s128 @513;

/* Get_NameTemp_PutX (int, int) */
s16 Get_NameTemp_PutX__Fii(s32 arg0, s32 arg1) {
    s128 *var_a2;
    s128 *var_a3;
    s128 temp_v0;
    s32 var_v1;

    var_a3 = &@513;
    var_a2 = sp;
    var_v1 = 9;
    do {
        temp_v0 = *var_a3;
        var_a3 += 0x10;
        var_v1 -= 1;
        *var_a2 = temp_v0;
        var_a2 += 0x10;
    } while (var_v1 > 0);
    var_a2->unk0 = (s64) var_a3->unk0;
    var_a2->unk8 = (s16) var_a3->unk8;
    return *((arg1 * 2) + ((arg0 * 0x16) + sp));
}
