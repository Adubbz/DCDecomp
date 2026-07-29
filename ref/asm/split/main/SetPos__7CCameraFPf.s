.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetPos__7CCameraFPf
/* 024390 00124290 F0FFBD27 */  addiu       $29, $29, -0x10
/* 024394 00124294 0000BF7F */  sq          $31, 0x0($29)
/* 024398 00124298 2816A070 */  paddub      $2, $5, $0
/* 02439C 0012429C 282E0070 */  paddub      $5, $0, $0
/* 0243A0 001242A0 00004CC4 */  lwc1        $f12, 0x0($2)
/* 0243A4 001242A4 04004DC4 */  lwc1        $f13, 0x4($2)
/* 0243A8 001242A8 08004EC4 */  lwc1        $f14, 0x8($2)
/* 0243AC 001242AC 9890040C */  jal         SetPos__7CCameraFP6CFramefff
/* 0243B0 001242B0 00000000 */   nop
/* 0243B4 001242B4 0000BF7B */  lq          $31, 0x0($29)
/* 0243B8 001242B8 1000BD27 */  addiu       $29, $29, 0x10
/* 0243BC 001242BC 0800E003 */  jr          $31
/* 0243C0 001242C0 00000000 */   nop
/* 0243C4 001242C4 00000000 */  nop
/* 0243C8 001242C8 00000000 */  nop
/* 0243CC 001242CC 00000000 */  nop
