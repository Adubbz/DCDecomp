.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetRef__7CCameraFPf
/* 024410 00124310 F0FFBD27 */  addiu       $29, $29, -0x10
/* 024414 00124314 0000BF7F */  sq          $31, 0x0($29)
/* 024418 00124318 2816A070 */  paddub      $2, $5, $0
/* 02441C 0012431C 282E0070 */  paddub      $5, $0, $0
/* 024420 00124320 00004CC4 */  lwc1        $f12, 0x0($2)
/* 024424 00124324 04004DC4 */  lwc1        $f13, 0x4($2)
/* 024428 00124328 08004EC4 */  lwc1        $f14, 0x8($2)
/* 02442C 0012432C BC90040C */  jal         SetRef__7CCameraFP6CFramefff
/* 024430 00124330 00000000 */   nop
/* 024434 00124334 0000BF7B */  lq          $31, 0x0($29)
/* 024438 00124338 1000BD27 */  addiu       $29, $29, 0x10
/* 02443C 0012433C 0800E003 */  jr          $31
/* 024440 00124340 00000000 */   nop
/* 024444 00124344 00000000 */  nop
/* 024448 00124348 00000000 */  nop
/* 02444C 0012434C 00000000 */  nop
