.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_SHADOW_FLAG__FP12RS_STACKDATAi
/* 0E6790 001E6690 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0E6794 001E6694 1000BF7F */  sq          $31, 0x10($29)
/* 0E6798 001E6698 0000B07F */  sq          $16, 0x0($29)
/* 0E679C 001E669C E09C828F */  lw          $2, -0x6320($28)
/* 0E67A0 001E66A0 9000508C */  lw          $16, 0x90($2)
/* 0E67A4 001E66A4 9085070C */  jal         GetStackInt__FP12RS_STACKDATA__3
/* 0E67A8 001E66A8 00000000 */   nop
/* 0E67AC 001E66AC E09C858F */  lw          $5, -0x6320($28)
/* 0E67B0 001E66B0 80181000 */  sll         $3, $16, 2
/* 0E67B4 001E66B4 21207000 */  addu        $4, $3, $16
/* 0E67B8 001E66B8 80180400 */  sll         $3, $4, 2
/* 0E67BC 001E66BC 21188300 */  addu        $3, $4, $3
/* 0E67C0 001E66C0 00190300 */  sll         $3, $3, 4
/* 0E67C4 001E66C4 21186500 */  addu        $3, $3, $5
/* 0E67C8 001E66C8 0200013C */  lui         $1, (0x20000 >> 16)
/* 0E67CC 001E66CC 21086100 */  addu        $1, $3, $1
/* 0E67D0 001E66D0 A2E422A4 */  sh          $2, -0x1B5E($1)
/* 0E67D4 001E66D4 01000224 */  addiu       $2, $0, 0x1
/* 0E67D8 001E66D8 1000BF7B */  lq          $31, 0x10($29)
/* 0E67DC 001E66DC 0000B07B */  lq          $16, 0x0($29)
/* 0E67E0 001E66E0 2000BD27 */  addiu       $29, $29, 0x20
/* 0E67E4 001E66E4 0800E003 */  jr          $31
/* 0E67E8 001E66E8 00000000 */   nop
/* 0E67EC 001E66EC 00000000 */  nop
