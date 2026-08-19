.include "macro.inc"

.set noat
.set noreorder

glabel MenuModeOff__8CGamePadFv
    /* 02BA30 0012B930 540480AC */  sw         $0, 0x454($4)
    /* 02BA34 0012B934 0800E003 */  jr         $31
    /* 02BA38 0012B938 00000000 */   nop
    /* 02BA3C 0012B93C 00000000 */  nop
