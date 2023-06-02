.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Draw__10CMapObjectFv
/* 577C0 001576C0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 577C4 001576C4 0000BF7F */  sq         $31, 0x0($sp)
/* 577C8 001576C8 C400838C */  lw         $3, 0xC4($4)
/* 577CC 001576CC 06006010 */  beqz       $3, .L001576E8
/* 577D0 001576D0 00000000 */   nop
/* 577D4 001576D4 E800838C */  lw         $3, 0xE8($4)
/* 577D8 001576D8 03006004 */  bltz       $3, .L001576E8
/* 577DC 001576DC 00000000 */   nop
/* 577E0 001576E0 645C050C */  jal        Draw__12CObjectFrameFv
/* 577E4 001576E4 00000000 */   nop
.L001576E8:
/* 577E8 001576E8 0000BF7B */  lq         $31, 0x0($sp)
/* 577EC 001576EC 1000BD27 */  addiu      $sp, $sp, 0x10
/* 577F0 001576F0 0800E003 */  jr         $31
/* 577F4 001576F4 00000000 */   nop
/* 577F8 001576F8 00000000 */  nop
/* 577FC 001576FC 00000000 */  nop
