.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel duhandler__3stdFv
/* 0229E0 001228E0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0229E4 001228E4 0000BF7F */  sq          $31, 0x0($29)
/* 0229E8 001228E8 2500013C */  lui         $1, %hi(thandler__3std)
/* 0229EC 001228EC 200B228C */  lw          $2, %lo(thandler__3std)($1)
/* 0229F0 001228F0 09F84000 */  jalr        $2
/* 0229F4 001228F4 00000000 */   nop
/* 0229F8 001228F8 0000BF7B */  lq          $31, 0x0($29)
/* 0229FC 001228FC 0800E003 */  jr          $31
/* 022A00 00122900 1000BD27 */   addiu      $29, $29, 0x10
/* 022A04 00122904 00000000 */  nop
/* 022A08 00122908 00000000 */  nop
/* 022A0C 0012290C 00000000 */  nop
