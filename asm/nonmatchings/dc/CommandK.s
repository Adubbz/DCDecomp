.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandK__FPPv
/* 3FDC0 0013FCC0 0000838C */  lw         $3, 0x0($4)
/* 3FDC4 0013FCC4 000060C4 */  lwc1       $f0, 0x0($3)
/* 3FDC8 0013FCC8 0C8D838F */  lw         $3, -0x72F4($gp)
/* 3FDCC 0013FCCC E00060E4 */  swc1       $f0, 0xE0($3)
/* 3FDD0 0013FCD0 0400838C */  lw         $3, 0x4($4)
/* 3FDD4 0013FCD4 000060C4 */  lwc1       $f0, 0x0($3)
/* 3FDD8 0013FCD8 0C8D838F */  lw         $3, -0x72F4($gp)
/* 3FDDC 0013FCDC E40060E4 */  swc1       $f0, 0xE4($3)
/* 3FDE0 0013FCE0 0800838C */  lw         $3, 0x8($4)
/* 3FDE4 0013FCE4 000060C4 */  lwc1       $f0, 0x0($3)
/* 3FDE8 0013FCE8 0C8D838F */  lw         $3, -0x72F4($gp)
/* 3FDEC 0013FCEC E80060E4 */  swc1       $f0, 0xE8($3)
/* 3FDF0 0013FCF0 0800E003 */  jr         $31
/* 3FDF4 0013FCF4 00000000 */   nop
/* 3FDF8 0013FCF8 00000000 */  nop
/* 3FDFC 0013FCFC 00000000 */  nop
