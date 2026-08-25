.include "macro.inc"

.set noat
.set noreorder

glabel EdDSetFont__FP10CDebugFont
    /* 070360 00170260 508F84AF */  sw         $4, -0x70B0($28)
    /* 070364 00170264 0800E003 */  jr         $31
    /* 070368 00170268 00000000 */   nop
    /* 07036C 0017026C 00000000 */  nop
