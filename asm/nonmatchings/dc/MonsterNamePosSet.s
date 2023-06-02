.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MonsterNamePosSet__Fii
/* 10EF10 0020EE10 1896868F */  lw         $6, -0x69E8($gp)
/* 10EF14 0020EE14 1300C010 */  beqz       $6, .L0020EE64
/* 10EF18 0020EE18 00000000 */   nop
/* 10EF1C 0020EE1C 1800C78C */  lw         $7, 0x18($6)
/* 10EF20 0020EE20 C0180700 */  sll        $3, $7, 3
/* 10EF24 0020EE24 23186700 */  subu       $3, $3, $7
/* 10EF28 0020EE28 7C180300 */  dsll32     $3, $3, 1
/* 10EF2C 0020EE2C 7F180300 */  dsra32     $3, $3, 1
/* 10EF30 0020EE30 23188300 */  subu       $3, $4, $3
/* 10EF34 0020EE34 0000C3AC */  sw         $3, 0x0($6)
/* 10EF38 0020EE38 0100A330 */  andi       $3, $5, 0x1
/* 10EF3C 0020EE3C 0400A104 */  bgez       $5, .L0020EE50
/* 10EF40 0020EE40 00000000 */   nop
/* 10EF44 0020EE44 02006010 */  beqz       $3, .L0020EE50
/* 10EF48 0020EE48 00000000 */   nop
/* 10EF4C 0020EE4C FEFF6324 */  addiu      $3, $3, -0x2
.L0020EE50:
/* 10EF50 0020EE50 02006010 */  beqz       $3, .L0020EE5C
/* 10EF54 0020EE54 00000000 */   nop
/* 10EF58 0020EE58 0100A524 */  addiu      $5, $5, 0x1
.L0020EE5C:
/* 10EF5C 0020EE5C 1896838F */  lw         $3, -0x69E8($gp)
/* 10EF60 0020EE60 040065AC */  sw         $5, 0x4($3)
.L0020EE64:
/* 10EF64 0020EE64 0800E003 */  jr         $31
/* 10EF68 0020EE68 00000000 */   nop
/* 10EF6C 0020EE6C 00000000 */  nop
