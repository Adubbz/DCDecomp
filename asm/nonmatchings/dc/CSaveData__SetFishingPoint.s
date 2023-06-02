.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetFishingPoint__9CSaveDataFi
/* 57E80 00157D80 DC0185AC */  sw         $5, 0x1DC($4)
/* 57E84 00157D84 DC01838C */  lw         $3, 0x1DC($4)
/* 57E88 00157D88 10276128 */  slti       $at, $3, 0x2710
/* 57E8C 00157D8C 03002014 */  bnez       $at, .L00157D9C
/* 57E90 00157D90 00000000 */   nop
/* 57E94 00157D94 0F270324 */  addiu      $3, $0, 0x270F
/* 57E98 00157D98 DC0183AC */  sw         $3, 0x1DC($4)
.L00157D9C:
/* 57E9C 00157D9C DC01838C */  lw         $3, 0x1DC($4)
/* 57EA0 00157DA0 02006104 */  bgez       $3, .L00157DAC
/* 57EA4 00157DA4 00000000 */   nop
/* 57EA8 00157DA8 DC0180AC */  sw         $0, 0x1DC($4)
.L00157DAC:
/* 57EAC 00157DAC 0800E003 */  jr         $31
/* 57EB0 00157DB0 00000000 */   nop
/* 57EB4 00157DB4 00000000 */  nop
/* 57EB8 00157DB8 00000000 */  nop
/* 57EBC 00157DBC 00000000 */  nop
