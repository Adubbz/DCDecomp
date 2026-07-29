.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetWait__12CNPCharacterFi
/* 056510 00156410 E0FFBD27 */  addiu       $29, $29, -0x20
/* 056514 00156414 1000BF7F */  sq          $31, 0x10($29)
/* 056518 00156418 0000B07F */  sq          $16, 0x0($29)
/* 05651C 0015641C 2886A070 */  paddub      $16, $5, $0
/* 056520 00156420 1C59050C */  jal         GetNextSeq__12CNPCharacterFv
/* 056524 00156424 00000000 */   nop
/* 056528 00156428 02000324 */  addiu       $3, $0, 0x2
/* 05652C 0015642C 000043AC */  sw          $3, 0x0($2)
/* 056530 00156430 040050AC */  sw          $16, 0x4($2)
/* 056534 00156434 01000224 */  addiu       $2, $0, 0x1
/* 056538 00156438 1000BF7B */  lq          $31, 0x10($29)
/* 05653C 0015643C 0000B07B */  lq          $16, 0x0($29)
/* 056540 00156440 2000BD27 */  addiu       $29, $29, 0x20
/* 056544 00156444 0800E003 */  jr          $31
/* 056548 00156448 00000000 */   nop
/* 05654C 0015644C 00000000 */  nop
