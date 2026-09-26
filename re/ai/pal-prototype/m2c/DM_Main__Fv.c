? AddStr__FP10CDebugFontPc(CDebugFont *arg0, s8 *arg1); /* extern */
s32 Down__8CGamePadFi(CGamePad *this, s32 arg0);    /* extern */
? EdTalkModeInit__FP12CNPCharacteri(CNPCharacter *arg0, s32 arg1); /* extern */
s32 On__8CGamePadFi(CGamePad *this, s32 arg0);      /* extern */
extern s64 @533;
extern s64 @536;
extern CDebugFont *DebugFont;
extern s32 EdDebugCameraFlag;
extern s32 EdDebugCharaDrawOff;
extern s32 EdDebugEventEnable;
extern s32 EdDebugMoveFlag;
extern s32 EdDebugRunEventNo;
extern CNPCharacter EdVillager;
extern s32 MesAbsDrawOff;
extern s8 init$522;
extern s8 init$525;
extern s8 init$528;
extern s32 run_event$524;
extern u32 select$521;
extern s32 talk_chara$527;

/* DM_Main (void) */
void DM_Main__Fv(void) {
    s64 sp98;
    s64 sp90;
    s8 sp10;

    if (init$522 == 0) {
        select$521 = 0;
        init$522 = 1;
    }
    if (init$525 == 0) {
        run_event$524 = 0x96;
        init$525 = 1;
    }
    if (init$528 == 0) {
        talk_chara$527 = 0;
        init$528 = 1;
    }
    sp90 = @533;
    sp98 = @536;
    AddStr__FP10CDebugFontPc(DebugFont, "    MAIN    ->R2\n");
    sprintf(&sp10, "%sDEBUG CAMERA %s\n", (((select$521 == 0) * 4) + sp)->unk98, ((EdDebugCameraFlag * 4) + sp)->unk90);
    AddStr__FP10CDebugFontPc(DebugFont, &sp10);
    sprintf(&sp10, "%sPARAMETER %s\n", (((select$521 == 1) * 4) + sp)->unk98, ((((EdDebugParamDrawOff == 0) & 0xFF) * 4) + sp)->unk90);
    AddStr__FP10CDebugFontPc(DebugFont, &sp10);
    sprintf(&sp10, "%sCHARACTER %s\n", (((select$521 == 2) * 4) + sp)->unk98, ((((EdDebugCharaDrawOff == 0) & 0xFF) * 4) + sp)->unk90);
    AddStr__FP10CDebugFontPc(DebugFont, &sp10);
    sprintf(&sp10, "%sMESSAGE %s\n", (((select$521 == 3) * 4) + sp)->unk98, ((((MesAbsDrawOff == 0) & 0xFF) * 4) + sp)->unk90);
    AddStr__FP10CDebugFontPc(DebugFont, &sp10);
    sprintf(&sp10, "%sDEBUG MOVE %d\n", (((select$521 == 4) * 4) + sp)->unk98, EdDebugMoveFlag);
    AddStr__FP10CDebugFontPc(DebugFont, &sp10);
    sprintf(&sp10, "%sRUN EVENT %d\n", (((select$521 == 5) * 4) + sp)->unk98, run_event$524);
    AddStr__FP10CDebugFontPc(DebugFont, &sp10);
    sprintf(&sp10, "%sTALK EVENT %d\n", (((select$521 == 6) * 4) + sp)->unk98, talk_chara$527);
    AddStr__FP10CDebugFontPc(DebugFont, &sp10);
    sprintf(&sp10, "%sEVENT %s\n", (((select$521 == 7) * 4) + sp)->unk98, ((EdDebugEventEnable * 4) + sp)->unk90);
    AddStr__FP10CDebugFontPc(DebugFont, &sp10);
    sprintf(&sp10, "%sLANGUAGE %d\n", (((select$521 == 8) * 4) + sp)->unk98, LanguageCode);
    AddStr__FP10CDebugFontPc(DebugFont, &sp10);
    EdDebugRunEventNo = -1;
    switch (select$521) {
    case 0:
        if (Down__8CGamePadFi(&GamePad, 0x2000) != 0) {
            EdDebugCameraFlag = 1;
        }
        if (Down__8CGamePadFi(&GamePad, 0x8000) != 0) {
            EdDebugCameraFlag = 0;
        }
        break;
    case 1:
        if (Down__8CGamePadFi(&GamePad, 0x2000) != 0) {
            EdDebugParamDrawOff = 0;
        }
        if (Down__8CGamePadFi(&GamePad, 0x8000) != 0) {
            EdDebugParamDrawOff = 1;
        }
        break;
    case 2:
        if (Down__8CGamePadFi(&GamePad, 0x2000) != 0) {
            EdDebugCharaDrawOff = 0;
        }
        if (Down__8CGamePadFi(&GamePad, 0x8000) != 0) {
            EdDebugCharaDrawOff = 1;
        }
        break;
    case 3:
        if (Down__8CGamePadFi(&GamePad, 0x2000) != 0) {
            MesAbsDrawOff = 0;
        }
        if (Down__8CGamePadFi(&GamePad, 0x8000) != 0) {
            MesAbsDrawOff = 1;
        }
        break;
    case 4:
        if (Down__8CGamePadFi(&GamePad, 0x2000) != 0) {
            EdDebugMoveFlag += 1;
        }
        if (Down__8CGamePadFi(&GamePad, 0x8000) != 0) {
            EdDebugMoveFlag -= 1;
        }
        if (EdDebugMoveFlag < 0) {
            EdDebugMoveFlag = 0;
        }
        if (EdDebugMoveFlag >= 3) {
            EdDebugMoveFlag = 2;
        }
        break;
    case 5:
        if (Down__8CGamePadFi(&GamePad, 0x2000) != 0) {
            run_event$524 += 1;
        }
        if (Down__8CGamePadFi(&GamePad, 0x8000) != 0) {
            run_event$524 -= 1;
        }
        if (Down__8CGamePadFi(&GamePad, 4) != 0) {
            run_event$524 -= 0xA;
        }
        if (Down__8CGamePadFi(&GamePad, 8) != 0) {
            run_event$524 += 0xA;
        }
        if (On__8CGamePadFi(&GamePad, 0x20) != 0) {
            EdDebugRunEventNo = run_event$524;
        }
        break;
    case 6:
        if (Down__8CGamePadFi(&GamePad, 0x2000) != 0) {
            talk_chara$527 += 1;
        }
        if (Down__8CGamePadFi(&GamePad, 0x8000) != 0) {
            talk_chara$527 -= 1;
        }
        if (Down__8CGamePadFi(&GamePad, 4) != 0) {
            talk_chara$527 -= 0xA;
        }
        if (Down__8CGamePadFi(&GamePad, 8) != 0) {
            talk_chara$527 += 0xA;
        }
        if (On__8CGamePadFi(&GamePad, 0x20) != 0) {
            EdTalkModeInit__FP12CNPCharacteri(&EdVillager, talk_chara$527);
            EdDebugRunEventNo = 0x100;
        }
        break;
    case 7:
        if (Down__8CGamePadFi(&GamePad, 0x2000) != 0) {
            EdDebugEventEnable = 1;
        }
        if (Down__8CGamePadFi(&GamePad, 0x8000) != 0) {
            EdDebugEventEnable = 0;
        }
        break;
    case 8:
        if (Down__8CGamePadFi(&GamePad, 0x2000) != 0) {
            LanguageCode += 1;
        }
        if (Down__8CGamePadFi(&GamePad, 0x8000) != 0) {
            LanguageCode -= 1;
        }
        if (LanguageCode < 0) {
            LanguageCode = 0;
        }
        if (LanguageCode >= 7) {
            LanguageCode = 6;
        }
        break;
    }
    if (Down__8CGamePadFi(&GamePad, 0x4000) != 0) {
        select$521 += 1;
    }
    if (Down__8CGamePadFi(&GamePad, 0x1000) != 0) {
        select$521 -= 1;
    }
    if ((s32) select$521 < 0) {
        select$521 = 8;
    }
    if ((s32) select$521 >= 9) {
        select$521 = 0;
    }
}
