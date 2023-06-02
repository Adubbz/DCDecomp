.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __sigtramp
/* 5048 00104F48 2D288000 */  daddu      $5, $4, $0
/* 504C 00104F4C 2500023C */  lui        $2, (0x250000 >> 16)
/* 5050 00104F50 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 5054 00104F54 ECFD448C */  lw         $4, -0x214($2)
/* 5058 00104F58 0000BFFF */  sd         $31, 0x0($sp)
/* 505C 00104F5C 8413040C */  jal        __sigtramp_r
/* 5060 00104F60 00000000 */   nop
/* 5064 00104F64 0000BFDF */  ld         $31, 0x0($sp)
/* 5068 00104F68 0800E003 */  jr         $31
/* 506C 00104F6C 1000BD27 */   addiu     $sp, $sp, 0x10
