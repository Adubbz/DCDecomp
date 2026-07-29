.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __terminate
/* 00D690 0010D590 2500023C */  lui         $2, %hi(__terminate_func)
/* 00D694 0010D594 F0FFBD27 */  addiu       $29, $29, -0x10
/* 00D698 0010D598 8003438C */  lw          $3, %lo(__terminate_func)($2)
/* 00D69C 0010D59C 0000BFFF */  sd          $31, 0x0($29)
/* 00D6A0 0010D5A0 09F86000 */  jalr        $3
/* 00D6A4 0010D5A4 00000000 */   nop
/* 00D6A8 0010D5A8 0000BFDF */  ld          $31, 0x0($29)
/* 00D6AC 0010D5AC 0800E003 */  jr          $31
/* 00D6B0 0010D5B0 1000BD27 */   addiu      $29, $29, 0x10
/* 00D6B4 0010D5B4 00000000 */  nop
