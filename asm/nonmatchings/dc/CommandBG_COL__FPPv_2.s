.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandBG_COL__FPPv_2
/* 9FF50 0019FE50 0000838C */  lw         $3, 0x0($4)
/* 9FF54 0019FE54 000060C4 */  lwc1       $f0, 0x0($3)
/* 9FF58 0019FE58 9092838F */  lw         $3, -0x6D70($gp)
/* 9FF5C 0019FE5C 600560E4 */  swc1       $f0, 0x560($3)
/* 9FF60 0019FE60 0400838C */  lw         $3, 0x4($4)
/* 9FF64 0019FE64 000060C4 */  lwc1       $f0, 0x0($3)
/* 9FF68 0019FE68 9092838F */  lw         $3, -0x6D70($gp)
/* 9FF6C 0019FE6C 640560E4 */  swc1       $f0, 0x564($3)
/* 9FF70 0019FE70 0800838C */  lw         $3, 0x8($4)
/* 9FF74 0019FE74 000060C4 */  lwc1       $f0, 0x0($3)
/* 9FF78 0019FE78 9092838F */  lw         $3, -0x6D70($gp)
/* 9FF7C 0019FE7C 680560E4 */  swc1       $f0, 0x568($3)
/* 9FF80 0019FE80 0043043C */  lui        $4, (0x43000000 >> 16)
/* 9FF84 0019FE84 9092838F */  lw         $3, -0x6D70($gp)
/* 9FF88 0019FE88 6C0564AC */  sw         $4, 0x56C($3)
/* 9FF8C 0019FE8C 0800E003 */  jr         $31
/* 9FF90 0019FE90 00000000 */   nop
/* 9FF94 0019FE94 00000000 */  nop
/* 9FF98 0019FE98 00000000 */  nop
/* 9FF9C 0019FE9C 00000000 */  nop
