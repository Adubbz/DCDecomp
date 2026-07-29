.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_BIN2__FP12RS_STACKDATAi
/* 0E5C20 001E5B20 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0E5C24 001E5B24 1000BF7F */  sq          $31, 0x10($29)
/* 0E5C28 001E5B28 0000B07F */  sq          $16, 0x0($29)
/* 0E5C2C 001E5B2C E09C828F */  lw          $2, -0x6320($28)
/* 0E5C30 001E5B30 9000508C */  lw          $16, 0x90($2)
/* 0E5C34 001E5B34 9085070C */  jal         GetStackInt__FP12RS_STACKDATA__3
/* 0E5C38 001E5B38 00000000 */   nop
/* 0E5C3C 001E5B3C E09C858F */  lw          $5, -0x6320($28)
/* 0E5C40 001E5B40 80181000 */  sll         $3, $16, 2
/* 0E5C44 001E5B44 21207000 */  addu        $4, $3, $16
/* 0E5C48 001E5B48 80180400 */  sll         $3, $4, 2
/* 0E5C4C 001E5B4C 21188300 */  addu        $3, $4, $3
/* 0E5C50 001E5B50 00190300 */  sll         $3, $3, 4
/* 0E5C54 001E5B54 21186500 */  addu        $3, $3, $5
/* 0E5C58 001E5B58 0200013C */  lui         $1, (0x20000 >> 16)
/* 0E5C5C 001E5B5C 21086100 */  addu        $1, $3, $1
/* 0E5C60 001E5B60 E0E322AC */  sw          $2, -0x1C20($1)
/* 0E5C64 001E5B64 01000224 */  addiu       $2, $0, 0x1
/* 0E5C68 001E5B68 1000BF7B */  lq          $31, 0x10($29)
/* 0E5C6C 001E5B6C 0000B07B */  lq          $16, 0x0($29)
/* 0E5C70 001E5B70 2000BD27 */  addiu       $29, $29, 0x20
/* 0E5C74 001E5B74 0800E003 */  jr          $31
/* 0E5C78 001E5B78 00000000 */   nop
/* 0E5C7C 001E5B7C 00000000 */  nop
