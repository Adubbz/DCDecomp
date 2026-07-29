.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandPROJECTION__FPPv
/* 09FFA0 0019FEA0 0000838C */  lw          $3, 0x0($4)
/* 09FFA4 0019FEA4 000060C4 */  lwc1        $f0, 0x0($3)
/* 09FFA8 0019FEA8 9092838F */  lw          $3, -0x6D70($28)
/* 09FFAC 0019FEAC C00460E4 */  swc1        $f0, 0x4C0($3)
/* 09FFB0 0019FEB0 0800E003 */  jr          $31
/* 09FFB4 0019FEB4 00000000 */   nop
/* 09FFB8 0019FEB8 00000000 */  nop
/* 09FFBC 0019FEBC 00000000 */  nop
