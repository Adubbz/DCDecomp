? DM_Flag__Fv();                                    /* extern */
? DM_Main__Fv();                                    /* extern */
? DM_Sound__Fv();                                   /* extern */
s32 Down__8CGamePadFi(CGamePad *this, s32 arg0);    /* extern */
? Draw__10CDebugFontFv(CDebugFont *this);           /* extern */
sceVif1Packet *GetVif1Packet__Fv();                 /* extern */
? ReloadTexture__15CTextureManagerFP13sceVif1Packeti(CTextureManager *this, sceVif1Packet *arg0, s32 arg1); /* extern */
extern CDebugFont *DebugFont;
extern s8 init$506;
extern s32 mode$505;

/* EdDebugMenu (void) */
void EdDebugMenu__Fv(void) {
    if (init$506 == 0) {
        mode$505 = 0;
        init$506 = 1;
    }
    switch (mode$505) {                             /* irregular */
    case 0:
        DM_Main__Fv();
        break;
    case 2:
        DM_Sound__Fv();
        break;
    case 1:
        DM_Flag__Fv();
        break;
    }
    if (Down__8CGamePadFi(&GamePad, 2) != 0) {
        mode$505 += 1;
    }
    if (Down__8CGamePadFi(&GamePad, 1) != 0) {
        mode$505 -= 1;
    }
    if (mode$505 < 0) {
        mode$505 = 0;
    }
    if (mode$505 >= 3) {
        mode$505 = 2;
    }
    ReloadTexture__15CTextureManagerFP13sceVif1Packeti(&TexManager, GetVif1Packet__Fv(), 0x1F);
    Draw__10CDebugFontFv(DebugFont);
}
