.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetNewEventPoint__FP14ED_EVENT_POINTi
/* 083B10 00183A10 01000624 */  addiu       $6, $0, 0x1
/* 083B14 00183A14 0B000010 */  b           .L00183A44
/* 083B18 00183A18 00000000 */   nop
.L00183A1C:
/* 083B1C 00183A1C C0100600 */  sll         $2, $6, 3
/* 083B20 00183A20 21104600 */  addu        $2, $2, $6
/* 083B24 00183A24 00110200 */  sll         $2, $2, 4
/* 083B28 00183A28 21104400 */  addu        $2, $2, $4
/* 083B2C 00183A2C 1000438C */  lw          $3, 0x10($2)
/* 083B30 00183A30 03006014 */  bnez        $3, .L00183A40
/* 083B34 00183A34 00000000 */   nop
/* 083B38 00183A38 06000010 */  b           .L00183A54
/* 083B3C 00183A3C 00000000 */   nop
.L00183A40:
/* 083B40 00183A40 0100C624 */  addiu       $6, $6, 0x1
.L00183A44:
/* 083B44 00183A44 2A10C500 */  slt         $2, $6, $5
/* 083B48 00183A48 F4FF4014 */  bnez        $2, .L00183A1C
/* 083B4C 00183A4C 00000000 */   nop
/* 083B50 00183A50 28160070 */  paddub      $2, $0, $0
.L00183A54:
/* 083B54 00183A54 0800E003 */  jr          $31
/* 083B58 00183A58 00000000 */   nop
/* 083B5C 00183A5C 00000000 */  nop
