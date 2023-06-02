.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetDistance__7CObjectFR7CObject
/* 56CB0 00156BB0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 56CB4 00156BB4 1000BF7F */  sq         $31, 0x10($sp)
/* 56CB8 00156BB8 0000B07F */  sq         $16, 0x0($sp)
/* 56CBC 00156BBC 28868070 */  paddub     $16, $4, $0
/* 56CC0 00156BC0 3000A427 */  addiu      $4, $sp, 0x30
/* 56CC4 00156BC4 1000A524 */  addiu      $5, $5, 0x10
/* 56CC8 00156BC8 0C86040C */  jal        sceVu0CopyVector
/* 56CCC 00156BCC 00000000 */   nop
/* 56CD0 00156BD0 2000A427 */  addiu      $4, $sp, 0x20
/* 56CD4 00156BD4 10000526 */  addiu      $5, $16, 0x10
/* 56CD8 00156BD8 0C86040C */  jal        sceVu0CopyVector
/* 56CDC 00156BDC 00000000 */   nop
/* 56CE0 00156BE0 2000A427 */  addiu      $4, $sp, 0x20
/* 56CE4 00156BE4 3000A527 */  addiu      $5, $sp, 0x30
/* 56CE8 00156BE8 648D040C */  jal        DistVector__FPfPf
/* 56CEC 00156BEC 00000000 */   nop
/* 56CF0 00156BF0 1000BF7B */  lq         $31, 0x10($sp)
/* 56CF4 00156BF4 0000B07B */  lq         $16, 0x0($sp)
/* 56CF8 00156BF8 4000BD27 */  addiu      $sp, $sp, 0x40
/* 56CFC 00156BFC 0800E003 */  jr         $31
/* 56D00 00156C00 00000000 */   nop
/* 56D04 00156C04 00000000 */  nop
/* 56D08 00156C08 00000000 */  nop
/* 56D0C 00156C0C 00000000 */  nop
