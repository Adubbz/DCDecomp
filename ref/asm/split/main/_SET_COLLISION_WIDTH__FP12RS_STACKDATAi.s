.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_COLLISION_WIDTH__FP12RS_STACKDATAi
/* 0E5EC0 001E5DC0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0E5EC4 001E5DC4 0000BF7F */  sq          $31, 0x0($29)
/* 0E5EC8 001E5DC8 E09C828F */  lw          $2, -0x6320($28)
/* 0E5ECC 001E5DCC 9000438C */  lw          $3, 0x90($2)
/* 0E5ED0 001E5DD0 A485070C */  jal         GetStackFloat__FP12RS_STACKDATA__3
/* 0E5ED4 001E5DD4 00000000 */   nop
/* 0E5ED8 001E5DD8 E09C848F */  lw          $4, -0x6320($28)
/* 0E5EDC 001E5DDC 80100300 */  sll         $2, $3, 2
/* 0E5EE0 001E5DE0 21184300 */  addu        $3, $2, $3
/* 0E5EE4 001E5DE4 80100300 */  sll         $2, $3, 2
/* 0E5EE8 001E5DE8 21106200 */  addu        $2, $3, $2
/* 0E5EEC 001E5DEC 00110200 */  sll         $2, $2, 4
/* 0E5EF0 001E5DF0 21104400 */  addu        $2, $2, $4
/* 0E5EF4 001E5DF4 0200013C */  lui         $1, (0x20000 >> 16)
/* 0E5EF8 001E5DF8 21084100 */  addu        $1, $2, $1
/* 0E5EFC 001E5DFC 18E420E4 */  swc1        $f0, -0x1BE8($1)
/* 0E5F00 001E5E00 01000224 */  addiu       $2, $0, 0x1
/* 0E5F04 001E5E04 0000BF7B */  lq          $31, 0x0($29)
/* 0E5F08 001E5E08 1000BD27 */  addiu       $29, $29, 0x10
/* 0E5F0C 001E5E0C 0800E003 */  jr          $31
/* 0E5F10 001E5E10 00000000 */   nop
/* 0E5F14 001E5E14 00000000 */  nop
/* 0E5F18 001E5E18 00000000 */  nop
/* 0E5F1C 001E5E1C 00000000 */  nop
