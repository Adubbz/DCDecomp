.include "macro.inc"

.set noat
.set noreorder

glabel MenuModeOn__8CGamePadFi
    /* 02BA20 0012B920 540485AC */  sw         $5, 0x454($4)
    /* 02BA24 0012B924 0800E003 */  jr         $31
    /* 02BA28 0012B928 00000000 */   nop
    /* 02BA2C 0012B92C 00000000 */  nop
