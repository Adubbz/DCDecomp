.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceCdCallback
/* 9708 00109608 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 970C 0010960C 0000B0FF */  sd         $16, 0x0($sp)
/* 9710 00109610 2D808000 */  daddu      $16, $4, $0
/* 9714 00109614 1000BFFF */  sd         $31, 0x10($sp)
/* 9718 00109618 662B040C */  jal        sceCdSync
/* 971C 0010961C 01000424 */   addiu     $4, $0, 0x1
/* 9720 00109620 04004014 */  bnez       $2, .L00109634
/* 9724 00109624 2D100000 */   daddu     $2, $0, $0
/* 9728 00109628 2500033C */  lui        $3, (0x2502BC >> 16)
/* 972C 0010962C BC02628C */  lw         $2, (0x2502BC & 0xFFFF)($3)
/* 9730 00109630 BC0270AC */  sw         $16, (0x2502BC & 0xFFFF)($3)
.L00109634:
/* 9734 00109634 1000BFDF */  ld         $31, 0x10($sp)
/* 9738 00109638 0000B0DF */  ld         $16, 0x0($sp)
/* 973C 0010963C 0800E003 */  jr         $31
/* 9740 00109640 2000BD27 */   addiu     $sp, $sp, 0x20
/* 9744 00109644 00000000 */  nop
