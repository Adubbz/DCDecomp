.include "macro.inc"

.set noat
.set noreorder

glabel FootSoundEnable__10CCharacterFi
    /* 038320 00138220 DC0D85AC */  sw         $5, 0xDDC($4)
    /* 038324 00138224 0800E003 */  jr         $31
    /* 038328 00138228 00000000 */   nop
    /* 03832C 0013822C 00000000 */  nop
