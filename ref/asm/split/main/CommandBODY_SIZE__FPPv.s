.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandBODY_SIZE__FPPv
/* 03A9D0 0013A8D0 0000838C */  lw          $3, 0x0($4)
/* 03A9D4 0013A8D4 000060C4 */  lwc1        $f0, 0x0($3)
/* 03A9D8 0013A8D8 A08C838F */  lw          $3, -0x7360($28)
/* 03A9DC 0013A8DC B40060E4 */  swc1        $f0, 0xB4($3)
/* 03A9E0 0013A8E0 0400838C */  lw          $3, 0x4($4)
/* 03A9E4 0013A8E4 000060C4 */  lwc1        $f0, 0x0($3)
/* 03A9E8 0013A8E8 A08C838F */  lw          $3, -0x7360($28)
/* 03A9EC 0013A8EC B00060E4 */  swc1        $f0, 0xB0($3)
/* 03A9F0 0013A8F0 0800838C */  lw          $3, 0x8($4)
/* 03A9F4 0013A8F4 000060C4 */  lwc1        $f0, 0x0($3)
/* 03A9F8 0013A8F8 A08C838F */  lw          $3, -0x7360($28)
/* 03A9FC 0013A8FC B80060E4 */  swc1        $f0, 0xB8($3)
/* 03AA00 0013A900 0800E003 */  jr          $31
/* 03AA04 0013A904 00000000 */   nop
/* 03AA08 0013A908 00000000 */  nop
/* 03AA0C 0013A90C 00000000 */  nop
