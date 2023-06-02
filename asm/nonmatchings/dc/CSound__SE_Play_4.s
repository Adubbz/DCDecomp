.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SE_Play__6CSoundFiiii
/* 45950 00145850 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 45954 00145854 0000BF7F */  sq         $31, 0x0($sp)
/* 45958 00145858 285E0071 */  paddub     $11, $8, $0
/* 4595C 0014585C 40000824 */  addiu      $8, $0, 0x40
/* 45960 00145860 7F000924 */  addiu      $9, $0, 0x7F
/* 45964 00145864 28562071 */  paddub     $10, $9, $0
/* 45968 00145868 7C15050C */  jal        SE_Play__6CSoundFiiiiiii
/* 4596C 0014586C 00000000 */   nop
/* 45970 00145870 0000BF7B */  lq         $31, 0x0($sp)
/* 45974 00145874 1000BD27 */  addiu      $sp, $sp, 0x10
/* 45978 00145878 0800E003 */  jr         $31
/* 4597C 0014587C 00000000 */   nop
