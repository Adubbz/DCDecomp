.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __get_eh_context
/* D748 0010D648 2500033C */  lui        $3, (0x250384 >> 16)
/* D74C 0010D64C F0FFBD27 */  addiu      $sp, $sp, -0x10
/* D750 0010D650 8403628C */  lw         $2, (0x250384 & 0xFFFF)($3)
/* D754 0010D654 0000BFFF */  sd         $31, 0x0($sp)
/* D758 0010D658 09F84000 */  jalr       $2
/* D75C 0010D65C 00000000 */   nop
/* D760 0010D660 0000BFDF */  ld         $31, 0x0($sp)
/* D764 0010D664 0800E003 */  jr         $31
/* D768 0010D668 1000BD27 */   addiu     $sp, $sp, 0x10
/* D76C 0010D66C 00000000 */  nop
