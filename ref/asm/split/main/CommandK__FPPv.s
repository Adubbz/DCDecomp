.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandK__FPPv
/* 03FDC0 0013FCC0 0000838C */  lw          $3, 0x0($4)
/* 03FDC4 0013FCC4 000060C4 */  lwc1        $f0, 0x0($3)
/* 03FDC8 0013FCC8 0C8D838F */  lw          $3, -0x72F4($28)
/* 03FDCC 0013FCCC E00060E4 */  swc1        $f0, 0xE0($3)
/* 03FDD0 0013FCD0 0400838C */  lw          $3, 0x4($4)
/* 03FDD4 0013FCD4 000060C4 */  lwc1        $f0, 0x0($3)
/* 03FDD8 0013FCD8 0C8D838F */  lw          $3, -0x72F4($28)
/* 03FDDC 0013FCDC E40060E4 */  swc1        $f0, 0xE4($3)
/* 03FDE0 0013FCE0 0800838C */  lw          $3, 0x8($4)
/* 03FDE4 0013FCE4 000060C4 */  lwc1        $f0, 0x0($3)
/* 03FDE8 0013FCE8 0C8D838F */  lw          $3, -0x72F4($28)
/* 03FDEC 0013FCEC E80060E4 */  swc1        $f0, 0xE8($3)
/* 03FDF0 0013FCF0 0800E003 */  jr          $31
/* 03FDF4 0013FCF4 00000000 */   nop
/* 03FDF8 0013FCF8 00000000 */  nop
/* 03FDFC 0013FCFC 00000000 */  nop
