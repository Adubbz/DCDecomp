.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandAMBIENT__FPPv__2
/* 09FD50 0019FC50 0000838C */  lw          $3, 0x0($4)
/* 09FD54 0019FC54 000060C4 */  lwc1        $f0, 0x0($3)
/* 09FD58 0019FC58 9092838F */  lw          $3, -0x6D70($28)
/* 09FD5C 0019FC5C D00460E4 */  swc1        $f0, 0x4D0($3)
/* 09FD60 0019FC60 0400838C */  lw          $3, 0x4($4)
/* 09FD64 0019FC64 000060C4 */  lwc1        $f0, 0x0($3)
/* 09FD68 0019FC68 9092838F */  lw          $3, -0x6D70($28)
/* 09FD6C 0019FC6C D40460E4 */  swc1        $f0, 0x4D4($3)
/* 09FD70 0019FC70 0800838C */  lw          $3, 0x8($4)
/* 09FD74 0019FC74 000060C4 */  lwc1        $f0, 0x0($3)
/* 09FD78 0019FC78 9092838F */  lw          $3, -0x6D70($28)
/* 09FD7C 0019FC7C D80460E4 */  swc1        $f0, 0x4D8($3)
/* 09FD80 0019FC80 0043043C */  lui         $4, (0x43000000 >> 16)
/* 09FD84 0019FC84 9092838F */  lw          $3, -0x6D70($28)
/* 09FD88 0019FC88 DC0464AC */  sw          $4, 0x4DC($3)
/* 09FD8C 0019FC8C 0800E003 */  jr          $31
/* 09FD90 0019FC90 00000000 */   nop
/* 09FD94 0019FC94 00000000 */  nop
/* 09FD98 0019FC98 00000000 */  nop
/* 09FD9C 0019FC9C 00000000 */  nop
