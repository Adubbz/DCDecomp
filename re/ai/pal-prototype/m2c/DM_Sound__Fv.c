? AddStr__FP10CDebugFontPc(CDebugFont *arg0, s8 *arg1); /* extern */
s32 Down__8CGamePadFi(CGamePad *this, s32 arg0);    /* extern */
? SndBgmDisable__Fi(s32 arg0);                      /* extern */
? SndBgmInit__Fv();                                 /* extern */
? SndBgmLoad__Fi(s32 arg0);                         /* extern */
? SndBgmPlay__Fi(s32 arg0);                         /* extern */
? SndBgmStop__Fv();                                 /* extern */
s32 SndGetBgmDisableFlag__Fv();                     /* extern */
? SndSePlay__Fiii(s32 arg0, s32 arg1, s32 arg2);    /* extern */
? SndSeStop__Fii(s32 arg0, s32 arg1);               /* extern */
? SndSoundLoad__Fi(s32 arg0);                       /* extern */
extern s64 @639;
extern s64 @640;
extern CDebugFont *DebugFont;
extern s32 bgm_no$626;
extern s32 bgm_seq$635;
extern s8 init$624;
extern s8 init$627;
extern s8 init$630;
extern s8 init$633;
extern s8 init$636;
extern s32 se_no$629;
extern s32 select$623;
extern s32 set_no$632;

/* DM_Sound (void) */
void DM_Sound__Fv(void) {
    s64 sp98;
    s64 sp90;
    s8 sp10;

    if (init$624 == 0) {
        select$623 = 0;
        init$624 = 1;
    }
    if (init$627 == 0) {
        bgm_no$626 = 0;
        init$627 = 1;
    }
    if (init$630 == 0) {
        se_no$629 = 0;
        init$630 = 1;
    }
    if (init$633 == 0) {
        set_no$632 = 0;
        init$633 = 1;
    }
    if (init$636 == 0) {
        bgm_seq$635 = 0;
        init$636 = 1;
    }
    sp90 = @639;
    sp98 = @640;
    AddStr__FP10CDebugFontPc(DebugFont, "L2<-SOUND   ->\n");
    sprintf(&sp10, "%sBGM PLAY %d SEQ = %d o:PLAY x:STOP\n", (((select$623 == 0) * 4) + sp)->unk98, bgm_no$626);
    AddStr__FP10CDebugFontPc(DebugFont, &sp10);
    sprintf(&sp10, "%sBGM OFF = %s\n", (((select$623 == 1) * 4) + sp)->unk98, ((SndGetBgmDisableFlag__Fv() * 4) + sp)->unk90);
    AddStr__FP10CDebugFontPc(DebugFont, &sp10);
    sprintf(&sp10, "%sSE PLAY  %d  O:PLAY X:STOP\n", (((select$623 == 2) * 4) + sp)->unk98, se_no$629);
    AddStr__FP10CDebugFontPc(DebugFont, &sp10);
    sprintf(&sp10, "%sSOUND SET  %d  O:PLAY X:STOP\n", (((select$623 == 3) * 4) + sp)->unk98, set_no$632);
    AddStr__FP10CDebugFontPc(DebugFont, &sp10);
    switch (select$623) {                           /* irregular */
    case 0:
        if (Down__8CGamePadFi(&GamePad, 0x2000) != 0) {
            bgm_no$626 += 1;
        }
        if (Down__8CGamePadFi(&GamePad, 0x8000) != 0) {
            bgm_no$626 -= 1;
        }
        if (Down__8CGamePadFi(&GamePad, 4) != 0) {
            bgm_no$626 -= 0xA;
        }
        if (Down__8CGamePadFi(&GamePad, 8) != 0) {
            bgm_no$626 += 0xA;
        }
        if (Down__8CGamePadFi(&GamePad, 0x10) != 0) {
            bgm_seq$635 += 1;
        }
        if (Down__8CGamePadFi(&GamePad, 0x80) != 0) {
            bgm_seq$635 -= 1;
        }
        if (bgm_seq$635 < 0) {
            bgm_seq$635 = 0;
        }
        if (bgm_seq$635 >= 4) {
            bgm_seq$635 = 3;
        }
        if (Down__8CGamePadFi(&GamePad, 0x20) != 0) {
            SndBgmStop__Fv();
            SndBgmInit__Fv();
            SndBgmLoad__Fi(bgm_no$626);
            SndBgmPlay__Fi(bgm_seq$635);
        }
        if (Down__8CGamePadFi(&GamePad, 0x40) != 0) {
            SndBgmStop__Fv();
            SndBgmInit__Fv();
        }
        break;
    case 1:
        if (Down__8CGamePadFi(&GamePad, 0x2000) != 0) {
            SndBgmDisable__Fi(1);
        }
        if (Down__8CGamePadFi(&GamePad, 0x8000) != 0) {
            SndBgmDisable__Fi(0);
        }
        break;
    case 2:
        if (Down__8CGamePadFi(&GamePad, 0x2000) != 0) {
            se_no$629 += 1;
        }
        if (Down__8CGamePadFi(&GamePad, 0x8000) != 0) {
            se_no$629 -= 1;
        }
        if (Down__8CGamePadFi(&GamePad, 4) != 0) {
            se_no$629 -= 0xA;
        }
        if (Down__8CGamePadFi(&GamePad, 8) != 0) {
            se_no$629 += 0xA;
        }
        if (Down__8CGamePadFi(&GamePad, 0x20) != 0) {
            SndSePlay__Fiii(se_no$629, -1, 0);
        }
        if (Down__8CGamePadFi(&GamePad, 0x40) != 0) {
            SndSeStop__Fii(se_no$629, 0);
        }
        break;
    case 3:
        if (Down__8CGamePadFi(&GamePad, 0x2000) != 0) {
            set_no$632 += 1;
        }
        if (Down__8CGamePadFi(&GamePad, 0x8000) != 0) {
            set_no$632 -= 1;
        }
        if (Down__8CGamePadFi(&GamePad, 4) != 0) {
            set_no$632 -= 0xA;
        }
        if (Down__8CGamePadFi(&GamePad, 8) != 0) {
            set_no$632 += 0xA;
        }
        if (Down__8CGamePadFi(&GamePad, 0x20) != 0) {
            SndSoundLoad__Fi(set_no$632);
        }
        break;
    }
    if (Down__8CGamePadFi(&GamePad, 0x4000) != 0) {
        select$623 += 1;
    }
    if (Down__8CGamePadFi(&GamePad, 0x1000) != 0) {
        select$623 -= 1;
    }
    if (select$623 < 0) {
        select$623 = 0;
    }
    if (select$623 >= 4) {
        select$623 = 3;
    }
}
