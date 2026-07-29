.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel eh_context_initialize
/* 00D798 0010D698 1100023C */  lui         $2, %hi(eh_context_static)
/* 00D79C 0010D69C F0FFBD27 */  addiu       $29, $29, -0x10
/* 00D7A0 0010D6A0 2500033C */  lui         $3, %hi(get_eh_context)
/* 00D7A4 0010D6A4 C0D64224 */  addiu       $2, $2, %lo(eh_context_static)
/* 00D7A8 0010D6A8 0000BFFF */  sd          $31, 0x0($29)
/* 00D7AC 0010D6AC 09F84000 */  jalr        $2
/* 00D7B0 0010D6B0 840362AC */   sw         $2, %lo(get_eh_context)($3)
/* 00D7B4 0010D6B4 0000BFDF */  ld          $31, 0x0($29)
/* 00D7B8 0010D6B8 0800E003 */  jr          $31
/* 00D7BC 0010D6BC 1000BD27 */   addiu      $29, $29, 0x10
