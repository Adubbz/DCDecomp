.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetPos__7CCameraFPf
/* 24390 00124290 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 24394 00124294 0000BF7F */  sq         $31, 0x0($sp)
/* 24398 00124298 2816A070 */  paddub     $2, $5, $0
/* 2439C 0012429C 282E0070 */  paddub     $5, $0, $0
/* 243A0 001242A0 00004CC4 */  lwc1       $f12, 0x0($2)
/* 243A4 001242A4 04004DC4 */  lwc1       $f13, 0x4($2)
/* 243A8 001242A8 08004EC4 */  lwc1       $f14, 0x8($2)
/* 243AC 001242AC 9890040C */  jal        SetPos__7CCameraFP6CFramefff
/* 243B0 001242B0 00000000 */   nop
/* 243B4 001242B4 0000BF7B */  lq         $31, 0x0($sp)
/* 243B8 001242B8 1000BD27 */  addiu      $sp, $sp, 0x10
/* 243BC 001242BC 0800E003 */  jr         $31
/* 243C0 001242C0 00000000 */   nop
/* 243C4 001242C4 00000000 */  nop
/* 243C8 001242C8 00000000 */  nop
/* 243CC 001242CC 00000000 */  nop
