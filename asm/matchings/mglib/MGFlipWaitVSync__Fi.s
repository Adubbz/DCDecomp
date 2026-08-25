.include "macro.inc"

.set noat
.set noreorder

glabel MGFlipWaitVSync__Fi
    /* 02D7D0 0012D6D0 C48B84AF */  sw         $4, -0x743C($28)
    /* 02D7D4 0012D6D4 0800E003 */  jr         $31
    /* 02D7D8 0012D6D8 00000000 */   nop
    /* 02D7DC 0012D6DC 00000000 */  nop
