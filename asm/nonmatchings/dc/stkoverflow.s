.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel stkoverflow__Fv
/* 13D810 0023D710 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 13D814 0023D714 0000BF7F */  sq         $31, 0x0($sp)
/* 13D818 0023D718 2A00023C */  lui        $2, %hi(_17)
/* 13D81C 0023D71C 88F74424 */  addiu      $4, $2, %lo(_17)
/* 13D820 0023D720 B0F5080C */  jal        runerror__FPCc
/* 13D824 0023D724 00000000 */   nop
/* 13D828 0023D728 0000BF7B */  lq         $31, 0x0($sp)
/* 13D82C 0023D72C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 13D830 0023D730 0800E003 */  jr         $31
/* 13D834 0023D734 00000000 */   nop
/* 13D838 0023D738 00000000 */  nop
/* 13D83C 0023D73C 00000000 */  nop
