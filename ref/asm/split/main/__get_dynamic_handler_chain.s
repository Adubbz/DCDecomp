.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __get_dynamic_handler_chain
/* 00D828 0010D728 2500033C */  lui         $3, %hi(get_eh_context)
/* 00D82C 0010D72C F0FFBD27 */  addiu       $29, $29, -0x10
/* 00D830 0010D730 8403628C */  lw          $2, %lo(get_eh_context)($3)
/* 00D834 0010D734 0000BFFF */  sd          $31, 0x0($29)
/* 00D838 0010D738 09F84000 */  jalr        $2
/* 00D83C 0010D73C 00000000 */   nop
/* 00D840 0010D740 0000BFDF */  ld          $31, 0x0($29)
/* 00D844 0010D744 04004224 */  addiu       $2, $2, 0x4
/* 00D848 0010D748 0800E003 */  jr          $31
/* 00D84C 0010D74C 1000BD27 */   addiu      $29, $29, 0x10
