.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandSKY_FOLLOW__FPPv
/* 076FF0 00176EF0 0000838C */  lw          $3, 0x0($4)
/* 076FF4 00176EF4 0000658C */  lw          $5, 0x0($3)
/* 076FF8 00176EF8 C08F838F */  lw          $3, -0x7040($28)
/* 076FFC 00176EFC E01B65AC */  sw          $5, 0x1BE0($3)
/* 077000 00176F00 0400838C */  lw          $3, 0x4($4)
/* 077004 00176F04 0000658C */  lw          $5, 0x0($3)
/* 077008 00176F08 C08F838F */  lw          $3, -0x7040($28)
/* 07700C 00176F0C E41B65AC */  sw          $5, 0x1BE4($3)
/* 077010 00176F10 0800838C */  lw          $3, 0x8($4)
/* 077014 00176F14 0000648C */  lw          $4, 0x0($3)
/* 077018 00176F18 C08F838F */  lw          $3, -0x7040($28)
/* 07701C 00176F1C E81B64AC */  sw          $4, 0x1BE8($3)
/* 077020 00176F20 0800E003 */  jr          $31
/* 077024 00176F24 00000000 */   nop
/* 077028 00176F28 00000000 */  nop
/* 07702C 00176F2C 00000000 */  nop
