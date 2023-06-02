.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AddDay__9CSaveDataFi
/* 57E10 00157D10 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 57E14 00157D14 0000BF7F */  sq         $31, 0x0($sp)
/* 57E18 00157D18 D801828C */  lw         $2, 0x1D8($4)
/* 57E1C 00157D1C 21104500 */  addu       $2, $2, $5
/* 57E20 00157D20 D80182AC */  sw         $2, 0x1D8($4)
/* 57E24 00157D24 D801858C */  lw         $5, 0x1D8($4)
/* 57E28 00157D28 305F050C */  jal        SetDay__9CSaveDataFi
/* 57E2C 00157D2C 00000000 */   nop
/* 57E30 00157D30 0000BF7B */  lq         $31, 0x0($sp)
/* 57E34 00157D34 1000BD27 */  addiu      $sp, $sp, 0x10
/* 57E38 00157D38 0800E003 */  jr         $31
/* 57E3C 00157D3C 00000000 */   nop
