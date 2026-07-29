.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel NeedMesWinWH_sub__FPiPiPiPiii
/* 04FE00 0014FD00 14002019 */  blez        $9, .L0014FD54
/* 04FE04 0014FD04 00000000 */   nop
/* 04FE08 0014FD08 0000838C */  lw          $3, 0x0($4)
/* 04FE0C 0014FD0C 21186900 */  addu        $3, $3, $9
/* 04FE10 0014FD10 000083AC */  sw          $3, 0x0($4)
/* 04FE14 0014FD14 0000A38C */  lw          $3, 0x0($5)
/* 04FE18 0014FD18 0000848C */  lw          $4, 0x0($4)
/* 04FE1C 0014FD1C 2A086400 */  slt         $1, $3, $4
/* 04FE20 0014FD20 02002010 */  beqz        $1, .L0014FD2C
/* 04FE24 0014FD24 00000000 */   nop
/* 04FE28 0014FD28 0000A4AC */  sw          $4, 0x0($5)
.L0014FD2C:
/* 04FE2C 0014FD2C 18202801 */  mult        $4, $9, $8
/* 04FE30 0014FD30 0000C38C */  lw          $3, 0x0($6)
/* 04FE34 0014FD34 21186400 */  addu        $3, $3, $4
/* 04FE38 0014FD38 0000C3AC */  sw          $3, 0x0($6)
/* 04FE3C 0014FD3C 0000E38C */  lw          $3, 0x0($7)
/* 04FE40 0014FD40 0000C48C */  lw          $4, 0x0($6)
/* 04FE44 0014FD44 2A086400 */  slt         $1, $3, $4
/* 04FE48 0014FD48 02002010 */  beqz        $1, .L0014FD54
/* 04FE4C 0014FD4C 00000000 */   nop
/* 04FE50 0014FD50 0000E4AC */  sw          $4, 0x0($7)
.L0014FD54:
/* 04FE54 0014FD54 0800E003 */  jr          $31
/* 04FE58 0014FD58 00000000 */   nop
/* 04FE5C 0014FD5C 00000000 */  nop
