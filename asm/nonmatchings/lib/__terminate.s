.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __terminate
/* D690 0010D590 2500023C */  lui        $2, (0x250380 >> 16)
/* D694 0010D594 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* D698 0010D598 8003438C */  lw         $3, (0x250380 & 0xFFFF)($2)
/* D69C 0010D59C 0000BFFF */  sd         $31, 0x0($sp)
/* D6A0 0010D5A0 09F86000 */  jalr       $3
/* D6A4 0010D5A4 00000000 */   nop
/* D6A8 0010D5A8 0000BFDF */  ld         $31, 0x0($sp)
/* D6AC 0010D5AC 0800E003 */  jr         $31
/* D6B0 0010D5B0 1000BD27 */   addiu     $sp, $sp, 0x10
/* D6B4 0010D5B4 00000000 */  nop
