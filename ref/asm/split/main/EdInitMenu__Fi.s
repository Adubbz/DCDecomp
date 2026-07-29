.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdInitMenu__Fi
/* 072DD0 00172CD0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 072DD4 00172CD4 0000BF7F */  sq          $31, 0x0($29)
/* 072DD8 00172CD8 6C8F84AF */  sw          $4, -0x7094($28)
/* 072DDC 00172CDC 688F80AF */  sw          $0, -0x7098($28)
/* 072DE0 00172CE0 0400801C */  bgtz        $4, .L00172CF4
/* 072DE4 00172CE4 00000000 */   nop
/* 072DE8 00172CE8 28160070 */  paddub      $2, $0, $0
/* 072DEC 00172CEC 0C000010 */  b           .L00172D20
/* 072DF0 00172CF0 00000000 */   nop
.L00172CF4:
/* 072DF4 00172CF4 01000424 */  addiu       $4, $0, 0x1
/* 072DF8 00172CF8 B4B5040C */  jal         MGFlipWaitVSync__Fi
/* 072DFC 00172CFC 00000000 */   nop
/* 072E00 00172D00 78CD050C */  jal         EdClearSystemMes__Fv
/* 072E04 00172D04 00000000 */   nop
/* 072E08 00172D08 3480050C */  jal         ClearSystemMes__Fv
/* 072E0C 00172D0C 00000000 */   nop
/* 072E10 00172D10 28260070 */  paddub      $4, $0, $0
/* 072E14 00172D14 F0CF070C */  jal         SetInteriorOutFlag__Fi
/* 072E18 00172D18 00000000 */   nop
/* 072E1C 00172D1C 01000224 */  addiu       $2, $0, 0x1
.L00172D20:
/* 072E20 00172D20 0000BF7B */  lq          $31, 0x0($29)
/* 072E24 00172D24 1000BD27 */  addiu       $29, $29, 0x10
/* 072E28 00172D28 0800E003 */  jr          $31
/* 072E2C 00172D2C 00000000 */   nop
