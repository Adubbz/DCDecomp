.include "macro.inc"

.set noat
.set noreorder

glabel ObjAnimeAllStop__Fv
    /* 065DE0 00165CE0 01000324 */  addiu      $3, $0, 0x1
    /* 065DE4 00165CE4 8C8E83AF */  sw         $3, -0x7174($28)
    /* 065DE8 00165CE8 0800E003 */  jr         $31
    /* 065DEC 00165CEC 00000000 */   nop
