.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __get_eh_info
/* D770 0010D670 2500033C */  lui        $3, (0x250384 >> 16)
/* D774 0010D674 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* D778 0010D678 8403628C */  lw         $2, (0x250384 & 0xFFFF)($3)
/* D77C 0010D67C 0000BFFF */  sd         $31, 0x0($sp)
/* D780 0010D680 09F84000 */  jalr       $2
/* D784 0010D684 00000000 */   nop
/* D788 0010D688 0000BFDF */  ld         $31, 0x0($sp)
/* D78C 0010D68C 08004224 */  addiu      $2, $2, 0x8
/* D790 0010D690 0800E003 */  jr         $31
/* D794 0010D694 1000BD27 */   addiu     $sp, $sp, 0x10
