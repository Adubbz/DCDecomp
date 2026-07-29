.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandFOG__FPPv__2
/* 09FED0 0019FDD0 0000838C */  lw          $3, 0x0($4)
/* 09FED4 0019FDD4 000060C4 */  lwc1        $f0, 0x0($3)
/* 09FED8 0019FDD8 9092838F */  lw          $3, -0x6D70($28)
/* 09FEDC 0019FDDC 700560E4 */  swc1        $f0, 0x570($3)
/* 09FEE0 0019FDE0 0400838C */  lw          $3, 0x4($4)
/* 09FEE4 0019FDE4 000060C4 */  lwc1        $f0, 0x0($3)
/* 09FEE8 0019FDE8 9092838F */  lw          $3, -0x6D70($28)
/* 09FEEC 0019FDEC 740560E4 */  swc1        $f0, 0x574($3)
/* 09FEF0 0019FDF0 0800838C */  lw          $3, 0x8($4)
/* 09FEF4 0019FDF4 00006590 */  lbu         $5, 0x0($3)
/* 09FEF8 0019FDF8 9092838F */  lw          $3, -0x6D70($28)
/* 09FEFC 0019FDFC 780565A0 */  sb          $5, 0x578($3)
/* 09FF00 0019FE00 0C00838C */  lw          $3, 0xC($4)
/* 09FF04 0019FE04 00006590 */  lbu         $5, 0x0($3)
/* 09FF08 0019FE08 9092838F */  lw          $3, -0x6D70($28)
/* 09FF0C 0019FE0C 790565A0 */  sb          $5, 0x579($3)
/* 09FF10 0019FE10 1000838C */  lw          $3, 0x10($4)
/* 09FF14 0019FE14 00006590 */  lbu         $5, 0x0($3)
/* 09FF18 0019FE18 9092838F */  lw          $3, -0x6D70($28)
/* 09FF1C 0019FE1C 7A0565A0 */  sb          $5, 0x57A($3)
/* 09FF20 0019FE20 1400838C */  lw          $3, 0x14($4)
/* 09FF24 0019FE24 000060C4 */  lwc1        $f0, 0x0($3)
/* 09FF28 0019FE28 9092838F */  lw          $3, -0x6D70($28)
/* 09FF2C 0019FE2C 7C0560E4 */  swc1        $f0, 0x57C($3)
/* 09FF30 0019FE30 1800838C */  lw          $3, 0x18($4)
/* 09FF34 0019FE34 000060C4 */  lwc1        $f0, 0x0($3)
/* 09FF38 0019FE38 9092838F */  lw          $3, -0x6D70($28)
/* 09FF3C 0019FE3C 800560E4 */  swc1        $f0, 0x580($3)
/* 09FF40 0019FE40 0800E003 */  jr          $31
/* 09FF44 0019FE44 00000000 */   nop
/* 09FF48 0019FE48 00000000 */  nop
/* 09FF4C 0019FE4C 00000000 */  nop
