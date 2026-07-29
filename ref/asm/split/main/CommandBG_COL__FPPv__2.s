.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandBG_COL__FPPv__2
/* 09FF50 0019FE50 0000838C */  lw          $3, 0x0($4)
/* 09FF54 0019FE54 000060C4 */  lwc1        $f0, 0x0($3)
/* 09FF58 0019FE58 9092838F */  lw          $3, -0x6D70($28)
/* 09FF5C 0019FE5C 600560E4 */  swc1        $f0, 0x560($3)
/* 09FF60 0019FE60 0400838C */  lw          $3, 0x4($4)
/* 09FF64 0019FE64 000060C4 */  lwc1        $f0, 0x0($3)
/* 09FF68 0019FE68 9092838F */  lw          $3, -0x6D70($28)
/* 09FF6C 0019FE6C 640560E4 */  swc1        $f0, 0x564($3)
/* 09FF70 0019FE70 0800838C */  lw          $3, 0x8($4)
/* 09FF74 0019FE74 000060C4 */  lwc1        $f0, 0x0($3)
/* 09FF78 0019FE78 9092838F */  lw          $3, -0x6D70($28)
/* 09FF7C 0019FE7C 680560E4 */  swc1        $f0, 0x568($3)
/* 09FF80 0019FE80 0043043C */  lui         $4, (0x43000000 >> 16)
/* 09FF84 0019FE84 9092838F */  lw          $3, -0x6D70($28)
/* 09FF88 0019FE88 6C0564AC */  sw          $4, 0x56C($3)
/* 09FF8C 0019FE8C 0800E003 */  jr          $31
/* 09FF90 0019FE90 00000000 */   nop
/* 09FF94 0019FE94 00000000 */  nop
/* 09FF98 0019FE98 00000000 */  nop
/* 09FF9C 0019FE9C 00000000 */  nop
