? AddStr__FP10CDebugFontPc(CDebugFont *arg0, s8 *arg1); /* extern */
s32 Down__8CGamePadFi(CGamePad *this, s32 arg0);    /* extern */
? GetCompEvent__14CEditPartsInfoFi(CEditPartsInfo *this, s32 arg0); /* extern */
void *GetDngStatus__9CSaveDataFv(CSaveData *this);  /* extern */
? GetGameFlag__9CSaveDataFi(CSaveData *this, s32 arg0); /* extern */
s32 GetGameIntFlag__9CSaveDataFi(CSaveData *this, s32 arg0); /* extern */
void *GetGrdData__9CSaveDataFi(CSaveData *this, s32 arg0); /* extern */
void *GetGrdNPCData__9CSaveDataFii(CSaveData *this, s32 arg0, s32 arg1); /* extern */
? GetMapFlag__9CSaveDataFii(CSaveData *this, s32 arg0, s32 arg1); /* extern */
s32 QuestDungeon__9CSaveDataFii(CSaveData *this, s32 arg0, s32 arg1); /* extern */
? SetCompEvent__14CEditPartsInfoFii(CEditPartsInfo *this, s32 arg0, s32 arg1); /* extern */
? SetGameFlag__9CSaveDataFii(CSaveData *this, s32 arg0, s32 arg1); /* extern */
? SetGameIntFlag__9CSaveDataFii(CSaveData *this, s32 arg0, s32 arg1); /* extern */
? SetMapFlag__9CSaveDataFiii(CSaveData *this, s32 arg0, s32 arg1, s32 arg2); /* extern */
extern s64 @743;
extern s64 @744;
extern CDebugFont *DebugFont;
extern s32 chara$721;
extern s32 comp_no$715;
extern s32 dun_map$718;
extern s32 game_no$709;
extern s8 init$707;
extern s8 init$710;
extern s8 init$713;
extern s8 init$716;
extern s8 init$719;
extern s8 init$722;
extern s32 map_no$712;
extern u32 select$706;

/* DM_Flag (void) */
void DM_Flag__Fv(void) {
    s64 spC8;
    s64 spC0;
    s8 sp40;
    s32 *var_s2;
    s32 var_s0;
    s32 var_s0_2;
    s32 var_s0_3;
    s32 var_s0_4;
    s32 var_s0_5;
    s8 var_s1;
    void *temp_s0;
    void *temp_v0;
    void *temp_v0_2;
    void *temp_v0_3;
    void *temp_v0_4;
    void *temp_v0_5;
    void *temp_v1;

    if (init$707 == 0) {
        select$706 = 0;
        init$707 = 1;
    }
    if (init$710 == 0) {
        game_no$709 = 0;
        init$710 = 1;
    }
    if (init$713 == 0) {
        map_no$712 = 0;
        init$713 = 1;
    }
    if (init$716 == 0) {
        comp_no$715 = 0;
        init$716 = 1;
    }
    if (init$719 == 0) {
        dun_map$718 = MapNo;
        init$719 = 1;
    }
    if (init$722 == 0) {
        chara$721 = 0;
        init$722 = 1;
    }
    if (dun_map$718 == 0xB) {
        dun_map$718 = 1;
    }
    if (dun_map$718 == 0xD) {
        dun_map$718 = 1;
    }
    if (dun_map$718 == 0x21) {
        dun_map$718 = 1;
    }
    if (dun_map$718 == 0x13) {
        dun_map$718 = 2;
    }
    if (dun_map$718 == 0x2A) {
        dun_map$718 = 3;
    }
    if (dun_map$718 == 0x17) {
        dun_map$718 = 4;
    }
    if (dun_map$718 == 0x26) {
        dun_map$718 = 5;
    }
    if (dun_map$718 == 0x28) {
        dun_map$718 = 5;
    }
    if (dun_map$718 >= 6) {
        dun_map$718 = 0;
    }
    spC0 = @743;
    spC8 = @744;
    AddStr__FP10CDebugFontPc(DebugFont, "L2<-FALG   ->R\n");
    temp_s0 = GetDngStatus__9CSaveDataFv(SaveData);
    GetGameFlag__9CSaveDataFi(SaveData, game_no$709);
    sprintf(&sp40, "%sGAMEFLAG %3d    = %s\n", (((select$706 == 0) * 4) + sp)->unkC8, game_no$709);
    AddStr__FP10CDebugFontPc(DebugFont, &sp40);
    GetMapFlag__9CSaveDataFii(SaveData, MapNo, map_no$712);
    sprintf(&sp40, "%sMAPFLAG %3d     = %s\n", (((select$706 == 1) * 4) + sp)->unkC8, map_no$712);
    AddStr__FP10CDebugFontPc(DebugFont, &sp40);
    GetCompEvent__14CEditPartsInfoFi(&EditPartsInfo, comp_no$715);
    sprintf(&sp40, "%sCOMPFLAG %3d    = %s\n", (((select$706 == 2) * 4) + sp)->unkC8, comp_no$715);
    AddStr__FP10CDebugFontPc(DebugFont, &sp40);
    sprintf(&sp40, "%sGAME INT FALG 0 = %d\n", (((select$706 == 3) * 4) + sp)->unkC8, GetGameIntFlag__9CSaveDataFi(SaveData, 0));
    AddStr__FP10CDebugFontPc(DebugFont, &sp40);
    sprintf(&sp40, "%sQUEST DUNGEON   = %d\n", (((select$706 == 4) * 4) + sp)->unkC8, QuestDungeon__9CSaveDataFii(SaveData, dun_map$718, 0));
    AddStr__FP10CDebugFontPc(DebugFont, &sp40);
    sprintf(&sp40, "%sDUNGEON FLOOR   = %d\n", (((select$706 == 5) * 4) + sp)->unkC8, (dun_map$718 + temp_s0)->unk42BF);
    AddStr__FP10CDebugFontPc(DebugFont, &sp40);
    sprintf(&sp40, "%sPARTY NUM       = %d\n", (((select$706 == 6) * 4) + sp)->unkC8, temp_s0->unk5);
    AddStr__FP10CDebugFontPc(DebugFont, &sp40);
    temp_v0 = GetGrdNPCData__9CSaveDataFii(SaveData, MapNo, chara$721);
    if (temp_v0 != NULL) {

    }
    sprintf(&sp40, "%sTALKFLAG %3d    = %d\n", (((select$706 == 7) * 4) + sp)->unkC8, chara$721);
    AddStr__FP10CDebugFontPc(DebugFont, &sp40);
    var_s2 = NULL;
    switch (select$706) {
    case 0:
        var_s2 = &game_no$709;
        if (Down__8CGamePadFi(&GamePad, 0x20) != 0) {
            SetGameFlag__9CSaveDataFii(SaveData, game_no$709, 1);
        }
        if (Down__8CGamePadFi(&GamePad, 0x40) != 0) {
            SetGameFlag__9CSaveDataFii(SaveData, game_no$709, 0);
        }
        break;
    case 1:
        var_s2 = &map_no$712;
        if (Down__8CGamePadFi(&GamePad, 0x20) != 0) {
            SetMapFlag__9CSaveDataFiii(SaveData, MapNo, map_no$712, 0);
        }
        if (Down__8CGamePadFi(&GamePad, 0x40) != 0) {
            SetMapFlag__9CSaveDataFiii(SaveData, MapNo, map_no$712, 1);
        }
        break;
    case 2:
        var_s2 = &comp_no$715;
        if (Down__8CGamePadFi(&GamePad, 0x20) != 0) {
            SetCompEvent__14CEditPartsInfoFii(&EditPartsInfo, comp_no$715, 1);
        }
        if (Down__8CGamePadFi(&GamePad, 0x40) != 0) {
            SetCompEvent__14CEditPartsInfoFii(&EditPartsInfo, comp_no$715, 0);
        }
        if (Down__8CGamePadFi(&GamePad, 0x10) != 0) {
            var_s0 = 0;
loop_49:
            if (var_s0 < 0x18) {
                SetCompEvent__14CEditPartsInfoFii(&EditPartsInfo, var_s0, 1);
                var_s0 += 1;
                goto loop_49;
            }
            temp_v0_2 = GetGrdData__9CSaveDataFi(SaveData, MapNo);
            if (temp_v0_2 != NULL) {
                temp_v0_2->unk64 = 1;
            }
        }
        if (Down__8CGamePadFi(&GamePad, 0x80) != 0) {
            var_s0_2 = 0;
loop_55:
            if (var_s0_2 < 0x18) {
                SetCompEvent__14CEditPartsInfoFii(&EditPartsInfo, var_s0_2, 0);
                var_s0_2 += 1;
                goto loop_55;
            }
            temp_v0_3 = GetGrdData__9CSaveDataFi(SaveData, MapNo);
            if (temp_v0_3 != NULL) {
                temp_v0_3->unk64 = 0;
            }
        }
        break;
    case 3:
        var_s0_3 = GetGameIntFlag__9CSaveDataFi(SaveData, 0);
        if (Down__8CGamePadFi(&GamePad, 0x2000) != 0) {
            var_s0_3 += 1;
        }
        if (Down__8CGamePadFi(&GamePad, 0x8000) != 0) {
            var_s0_3 -= 1;
        }
        if (Down__8CGamePadFi(&GamePad, 8) != 0) {
            var_s0_3 += 0xA;
        }
        if (Down__8CGamePadFi(&GamePad, 4) != 0) {
            var_s0_3 -= 0xA;
        }
        if (var_s0_3 < 0) {
            var_s0_3 = 0;
        }
        SetGameIntFlag__9CSaveDataFii(SaveData, 0, var_s0_3);
        break;
    case 4:
        if (Down__8CGamePadFi(&GamePad, 0x2000) != 0) {
            QuestDungeon__9CSaveDataFii(SaveData, dun_map$718, 1);
        }
        if (Down__8CGamePadFi(&GamePad, 0x8000) != 0) {
            QuestDungeon__9CSaveDataFii(SaveData, dun_map$718, -1);
        }
        if (Down__8CGamePadFi(&GamePad, 8) != 0) {
            QuestDungeon__9CSaveDataFii(SaveData, dun_map$718, 0xA);
        }
        if (Down__8CGamePadFi(&GamePad, 4) != 0) {
            QuestDungeon__9CSaveDataFii(SaveData, dun_map$718, -0xA);
        }
        break;
    case 5:
        var_s1 = (dun_map$718 + temp_s0)->unk42BF;
        if (Down__8CGamePadFi(&GamePad, 0x2000) != 0) {
            var_s1 += 1;
        }
        if (Down__8CGamePadFi(&GamePad, 0x8000) != 0) {
            var_s1 -= 1;
        }
        if (Down__8CGamePadFi(&GamePad, 8) != 0) {
            var_s1 += 0xA;
        }
        if (Down__8CGamePadFi(&GamePad, 4) != 0) {
            var_s1 -= 0xA;
        }
        temp_v1 = dun_map$718 + temp_s0;
        if (temp_v1->unk42BF < var_s1) {
            temp_v1->unk42BF = var_s1;
        }
        break;
    case 6:
        if (Down__8CGamePadFi(&GamePad, 0x2000) != 0) {
            temp_s0->unk5 = (s8) (temp_s0->unk5 + 1);
        }
        if (Down__8CGamePadFi(&GamePad, 0x8000) != 0) {
            temp_s0->unk5 = (s8) (temp_s0->unk5 - 1);
        }
        if (Down__8CGamePadFi(&GamePad, 8) != 0) {
            temp_s0->unk5 = (s8) (temp_s0->unk5 + 0xA);
        }
        if (Down__8CGamePadFi(&GamePad, 4) != 0) {
            temp_s0->unk5 = (s8) (temp_s0->unk5 - 0xA);
        }
        break;
    case 7:
        var_s2 = &chara$721;
        if ((Down__8CGamePadFi(&GamePad, 0x20) != 0) && (temp_v0 != NULL)) {
            temp_v0->unk8 = (s32) (temp_v0->unk8 + 1);
        }
        if ((Down__8CGamePadFi(&GamePad, 0x40) != 0) && (temp_v0 != NULL)) {
            temp_v0->unk8 = (s32) (temp_v0->unk8 - 1);
        }
        if (Down__8CGamePadFi(&GamePad, 0x10) != 0) {
            var_s0_4 = 0;
loop_106:
            if (var_s0_4 < 0x14) {
                temp_v0_4 = GetGrdNPCData__9CSaveDataFii(SaveData, MapNo, var_s0_4);
                if (temp_v0_4 != NULL) {
                    temp_v0_4->unk8 = 1;
                }
                var_s0_4 += 1;
                goto loop_106;
            }
        }
        if (Down__8CGamePadFi(&GamePad, 0x80) != 0) {
            var_s0_5 = 0;
loop_112:
            if (var_s0_5 < 0x14) {
                temp_v0_5 = GetGrdNPCData__9CSaveDataFii(SaveData, MapNo, var_s0_5);
                if (temp_v0_5 != NULL) {
                    temp_v0_5->unk8 = 0;
                }
                var_s0_5 += 1;
                goto loop_112;
            }
        }
        break;
    }
    if (var_s2 != NULL) {
        if (Down__8CGamePadFi(&GamePad, 0x2000) != 0) {
            *var_s2 += 1;
        }
        if (Down__8CGamePadFi(&GamePad, 0x8000) != 0) {
            *var_s2 -= 1;
        }
        if (Down__8CGamePadFi(&GamePad, 8) != 0) {
            *var_s2 += 0xA;
        }
        if (Down__8CGamePadFi(&GamePad, 4) != 0) {
            *var_s2 -= 0xA;
        }
        if (*var_s2 < 0) {
            *var_s2 = 0;
        }
    }
    if (Down__8CGamePadFi(&GamePad, 0x4000) != 0) {
        select$706 += 1;
    }
    if (Down__8CGamePadFi(&GamePad, 0x1000) != 0) {
        select$706 -= 1;
    }
    if ((s32) select$706 < 0) {
        select$706 = 7;
    }
    if ((s32) select$706 >= 8) {
        select$706 = 0;
    }
}
