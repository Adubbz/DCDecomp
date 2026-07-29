.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __get_eh_info
/* 00D770 0010D670 2500033C */  lui         $3, %hi(get_eh_context)
/* 00D774 0010D674 F0FFBD27 */  addiu       $29, $29, -0x10
/* 00D778 0010D678 8403628C */  lw          $2, %lo(get_eh_context)($3)
/* 00D77C 0010D67C 0000BFFF */  sd          $31, 0x0($29)
/* 00D780 0010D680 09F84000 */  jalr        $2
/* 00D784 0010D684 00000000 */   nop
/* 00D788 0010D688 0000BFDF */  ld          $31, 0x0($29)
/* 00D78C 0010D68C 08004224 */  addiu       $2, $2, 0x8
/* 00D790 0010D690 0800E003 */  jr          $31
/* 00D794 0010D694 1000BD27 */   addiu      $29, $29, 0x10
