.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_STATUS_BIN2__FP12RS_STACKDATAi
/* 0E5E60 001E5D60 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0E5E64 001E5D64 0000BF7F */  sq          $31, 0x0($29)
/* 0E5E68 001E5D68 E09C858F */  lw          $5, -0x6320($28)
/* 0E5E6C 001E5D6C 9000A38C */  lw          $3, 0x90($5)
/* 0E5E70 001E5D70 80100300 */  sll         $2, $3, 2
/* 0E5E74 001E5D74 21184300 */  addu        $3, $2, $3
/* 0E5E78 001E5D78 80100300 */  sll         $2, $3, 2
/* 0E5E7C 001E5D7C 21106200 */  addu        $2, $3, $2
/* 0E5E80 001E5D80 00110200 */  sll         $2, $2, 4
/* 0E5E84 001E5D84 21104500 */  addu        $2, $2, $5
/* 0E5E88 001E5D88 0100013C */  lui         $1, (0x1E3E0 >> 16)
/* 0E5E8C 001E5D8C E0E32134 */  ori         $1, $1, (0x1E3E0 & 0xFFFF)
/* 0E5E90 001E5D90 21104100 */  addu        $2, $2, $1
/* 0E5E94 001E5D94 0000458C */  lw          $5, 0x0($2)
/* 0E5E98 001E5D98 000045AC */  sw          $5, 0x0($2)
/* 0E5E9C 001E5D9C B485070C */  jal         SetStack__FP12RS_STACKDATAi__3
/* 0E5EA0 001E5DA0 00000000 */   nop
/* 0E5EA4 001E5DA4 01000224 */  addiu       $2, $0, 0x1
/* 0E5EA8 001E5DA8 0000BF7B */  lq          $31, 0x0($29)
/* 0E5EAC 001E5DAC 1000BD27 */  addiu       $29, $29, 0x10
/* 0E5EB0 001E5DB0 0800E003 */  jr          $31
/* 0E5EB4 001E5DB4 00000000 */   nop
/* 0E5EB8 001E5DB8 00000000 */  nop
/* 0E5EBC 001E5DBC 00000000 */  nop
