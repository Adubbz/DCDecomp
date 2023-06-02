.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel eh_context_initialize
/* D798 0010D698 1100023C */  lui        $2, %hi(eh_context_static)
/* D79C 0010D69C F0FFBD27 */  addiu      $sp, $sp, -0x10
/* D7A0 0010D6A0 2500033C */  lui        $3, (0x250384 >> 16)
/* D7A4 0010D6A4 C0D64224 */  addiu      $2, $2, %lo(eh_context_static)
/* D7A8 0010D6A8 0000BFFF */  sd         $31, 0x0($sp)
/* D7AC 0010D6AC 09F84000 */  jalr       $2
/* D7B0 0010D6B0 840362AC */   sw        $2, (0x250384 & 0xFFFF)($3)
/* D7B4 0010D6B4 0000BFDF */  ld         $31, 0x0($sp)
/* D7B8 0010D6B8 0800E003 */  jr         $31
/* D7BC 0010D6BC 1000BD27 */   addiu     $sp, $sp, 0x10
