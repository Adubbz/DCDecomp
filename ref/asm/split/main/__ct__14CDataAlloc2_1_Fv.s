.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __ct__14CDataAlloc2_1_Fv
/* 043920 00143820 F0FFBD27 */  addiu       $29, $29, -0x10
/* 043924 00143824 0000BF7F */  sq          $31, 0x0($29)
/* 043928 00143828 FFFF0524 */  addiu       $5, $0, -0x1
/* 04392C 0014382C D09E040C */  jal         __ct__14CDataAlloc2_1_Fi
/* 043930 00143830 00000000 */   nop
/* 043934 00143834 0000BF7B */  lq          $31, 0x0($29)
/* 043938 00143838 1000BD27 */  addiu       $29, $29, 0x10
/* 04393C 0014383C 0800E003 */  jr          $31
/* 043940 00143840 00000000 */   nop
/* 043944 00143844 00000000 */  nop
/* 043948 00143848 00000000 */  nop
/* 04394C 0014384C 00000000 */  nop
