.include "macro.inc"

.set noat
.set noreorder

glabel PlayTimeCountFlag__Fi
    /* 041020 00140F20 A48684AF */  sw         $4, -0x795C($28)
    /* 041024 00140F24 0800E003 */  jr         $31
    /* 041028 00140F28 00000000 */   nop
    /* 04102C 00140F2C 00000000 */  nop
