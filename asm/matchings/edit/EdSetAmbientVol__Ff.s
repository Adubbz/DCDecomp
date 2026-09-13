.include "macro.inc"

.set noat
.set noreorder

glabel EdSetAmbientVol__Ff
    /* 071710 00171610 F0FFBD27 */  addiu      $29, $29, -0x10
    /* 071714 00171614 0000BF7F */  sq         $31, 0x0($29)
    /* 071718 00171618 906C050C */  jal        SndAmbientSetVolf__Ff
    /* 07171C 0017161C 00000000 */   nop
    /* 071720 00171620 0000BF7B */  lq         $31, 0x0($29)
    /* 071724 00171624 1000BD27 */  addiu      $29, $29, 0x10
    /* 071728 00171628 0800E003 */  jr         $31
    /* 07172C 0017162C 00000000 */   nop
