.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __get_dynamic_handler_chain
/* D828 0010D728 2500033C */  lui        $3, (0x250384 >> 16)
/* D82C 0010D72C F0FFBD27 */  addiu      $sp, $sp, -0x10
/* D830 0010D730 8403628C */  lw         $2, (0x250384 & 0xFFFF)($3)
/* D834 0010D734 0000BFFF */  sd         $31, 0x0($sp)
/* D838 0010D738 09F84000 */  jalr       $2
/* D83C 0010D73C 00000000 */   nop
/* D840 0010D740 0000BFDF */  ld         $31, 0x0($sp)
/* D844 0010D744 04004224 */  addiu      $2, $2, 0x4
/* D848 0010D748 0800E003 */  jr         $31
/* D84C 0010D74C 1000BD27 */   addiu     $sp, $sp, 0x10
