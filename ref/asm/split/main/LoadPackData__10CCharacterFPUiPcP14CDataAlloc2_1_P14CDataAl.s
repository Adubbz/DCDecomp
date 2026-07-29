.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 0398F0 001397F0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0398F4 001397F4 0000BF7F */  sq          $31, 0x0($29)
/* 0398F8 001397F8 284E0071 */  paddub      $9, $8, $0
/* 0398FC 001397FC 2846E070 */  paddub      $8, $7, $0
/* 039900 00139800 A000998C */  lw          $25, 0xA0($4)
/* 039904 00139804 B800398F */  lw          $25, 0xB8($25)
/* 039908 00139808 09F82003 */  jalr        $25
/* 03990C 0013980C 00000000 */   nop
/* 039910 00139810 0000BF7B */  lq          $31, 0x0($29)
/* 039914 00139814 1000BD27 */  addiu       $29, $29, 0x10
/* 039918 00139818 0800E003 */  jr          $31
/* 03991C 0013981C 00000000 */   nop
