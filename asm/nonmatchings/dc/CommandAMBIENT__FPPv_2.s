.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandAMBIENT__FPPv_2
/* 9FD50 0019FC50 0000838C */  lw         $3, 0x0($4)
/* 9FD54 0019FC54 000060C4 */  lwc1       $f0, 0x0($3)
/* 9FD58 0019FC58 9092838F */  lw         $3, -0x6D70($gp)
/* 9FD5C 0019FC5C D00460E4 */  swc1       $f0, 0x4D0($3)
/* 9FD60 0019FC60 0400838C */  lw         $3, 0x4($4)
/* 9FD64 0019FC64 000060C4 */  lwc1       $f0, 0x0($3)
/* 9FD68 0019FC68 9092838F */  lw         $3, -0x6D70($gp)
/* 9FD6C 0019FC6C D40460E4 */  swc1       $f0, 0x4D4($3)
/* 9FD70 0019FC70 0800838C */  lw         $3, 0x8($4)
/* 9FD74 0019FC74 000060C4 */  lwc1       $f0, 0x0($3)
/* 9FD78 0019FC78 9092838F */  lw         $3, -0x6D70($gp)
/* 9FD7C 0019FC7C D80460E4 */  swc1       $f0, 0x4D8($3)
/* 9FD80 0019FC80 0043043C */  lui        $4, (0x43000000 >> 16)
/* 9FD84 0019FC84 9092838F */  lw         $3, -0x6D70($gp)
/* 9FD88 0019FC88 DC0464AC */  sw         $4, 0x4DC($3)
/* 9FD8C 0019FC8C 0800E003 */  jr         $31
/* 9FD90 0019FC90 00000000 */   nop
/* 9FD94 0019FC94 00000000 */  nop
/* 9FD98 0019FC98 00000000 */  nop
/* 9FD9C 0019FC9C 00000000 */  nop
