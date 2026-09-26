? AddStr__FP10CDebugFontPc(CDebugFont *arg0, s8 *arg1); /* extern */
? GetPos__7CCameraFPf(CCamera *this, f32 *arg0);    /* extern */
? GetRef__7CCameraFPf(CCamera *this, f32 *arg0);    /* extern */
f32 MGGetProjection__Fv();                          /* extern */
s32 fptodp(f32);                                    /* extern */
extern s32 Debug;
extern CDebugFont *DebugFont;

/* EdDPrintCamera (CCamera *) */
void EdDPrintCamera__FP7CCamera(CCamera *arg0) {
    s8 sp70;
    f32 sp68;
    f32 sp64;
    f32 sp60;
    s32 temp_s0;
    s32 temp_s1;
    s32 temp_s1_2;
    s32 temp_s2;

    if ((Debug != 0) && (DebugFont != NULL)) {
        GetPos__7CCameraFPf(arg0, &sp60);
        temp_s2 = fptodp(sp60);
        temp_s1 = fptodp(sp64);
        fptodp(sp68);
        sprintf(&sp70, "camera\n pos = %7.2f,%7.2f,%7.2f\n", temp_s2, temp_s1);
        AddStr__FP10CDebugFontPc(DebugFont, &sp70);
        GetRef__7CCameraFPf(arg0, &sp60);
        temp_s1_2 = fptodp(sp60);
        temp_s0 = fptodp(sp64);
        fptodp(sp68);
        sprintf(&sp70, " ref = %7.2f,%7.2f,%7.2f\n", temp_s1_2, temp_s0);
        AddStr__FP10CDebugFontPc(DebugFont, &sp70);
        sprintf(&sp70, " projection = %7.1f\n", fptodp(MGGetProjection__Fv()));
        AddStr__FP10CDebugFontPc(DebugFont, &sp70);
    }
}
