? AddStr__FP10CDebugFontPc(CDebugFont *arg0, s8 *arg1); /* extern */
s32 fptodp(f32);                                    /* extern */
extern s32 Debug;
extern CDebugFont *DebugFont;

/* EdDPrintChara (CMainChara *) */
void EdDPrintChara__FP10CMainChara(CMainChara *arg0) {
    s8 sp70;
    f32 sp68;
    f32 sp64;
    f32 sp60;
    s32 temp_s1;
    s32 temp_s3;
    s32 temp_s3_2;
    s32 temp_s4;

    if ((Debug != 0) && (DebugFont != NULL)) {
        arg0->unkA0->unkA0(&sp60);
        temp_s4 = fptodp(sp60);
        temp_s3 = fptodp(sp64);
        fptodp(sp68);
        sprintf(&sp70, "chara\n pos = %7.2f,%7.2f,%7.2f\n", temp_s4, temp_s3);
        AddStr__FP10CDebugFontPc(DebugFont, &sp70);
        arg0->unkA0->unk58(arg0, &sp60);
        temp_s3_2 = fptodp(sp60);
        temp_s1 = fptodp(sp64);
        fptodp(sp68);
        sprintf(&sp70, " rot = %7.2f,%7.2f,%7.2f\n", temp_s3_2, temp_s1);
        AddStr__FP10CDebugFontPc(DebugFont, &sp70);
        sprintf(&sp70, " (%d %d %d)\n", arg0->unk1220, arg0->unk1222);
        if (arg0->unk11D0 != 0) {
            AddStr__FP10CDebugFontPc(DebugFont, &sp70);
        }
    }
}
