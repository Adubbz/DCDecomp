.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_LOCKON_SW__FP12RS_STACKDATAi
/* 0E4E70 001E4D70 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0E4E74 001E4D74 1000BF7F */  sq          $31, 0x10($29)
/* 0E4E78 001E4D78 0000B07F */  sq          $16, 0x0($29)
/* 0E4E7C 001E4D7C E09C828F */  lw          $2, -0x6320($28)
/* 0E4E80 001E4D80 9000508C */  lw          $16, 0x90($2)
/* 0E4E84 001E4D84 9085070C */  jal         GetStackInt__FP12RS_STACKDATA__3
/* 0E4E88 001E4D88 00000000 */   nop
/* 0E4E8C 001E4D8C E09C858F */  lw          $5, -0x6320($28)
/* 0E4E90 001E4D90 80181000 */  sll         $3, $16, 2
/* 0E4E94 001E4D94 21207000 */  addu        $4, $3, $16
/* 0E4E98 001E4D98 80180400 */  sll         $3, $4, 2
/* 0E4E9C 001E4D9C 21188300 */  addu        $3, $4, $3
/* 0E4EA0 001E4DA0 00190300 */  sll         $3, $3, 4
/* 0E4EA4 001E4DA4 21186500 */  addu        $3, $3, $5
/* 0E4EA8 001E4DA8 0200013C */  lui         $1, (0x20000 >> 16)
/* 0E4EAC 001E4DAC 21086100 */  addu        $1, $3, $1
/* 0E4EB0 001E4DB0 ECE422A4 */  sh          $2, -0x1B14($1)
/* 0E4EB4 001E4DB4 01000224 */  addiu       $2, $0, 0x1
/* 0E4EB8 001E4DB8 1000BF7B */  lq          $31, 0x10($29)
/* 0E4EBC 001E4DBC 0000B07B */  lq          $16, 0x0($29)
/* 0E4EC0 001E4DC0 2000BD27 */  addiu       $29, $29, 0x20
/* 0E4EC4 001E4DC4 0800E003 */  jr          $31
/* 0E4EC8 001E4DC8 00000000 */   nop
/* 0E4ECC 001E4DCC 00000000 */  nop
