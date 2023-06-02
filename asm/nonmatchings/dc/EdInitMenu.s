.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdInitMenu__Fi
/* 72DD0 00172CD0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 72DD4 00172CD4 0000BF7F */  sq         $31, 0x0($sp)
/* 72DD8 00172CD8 6C8F84AF */  sw         $4, -0x7094($gp)
/* 72DDC 00172CDC 688F80AF */  sw         $0, -0x7098($gp)
/* 72DE0 00172CE0 0400801C */  bgtz       $4, .L00172CF4
/* 72DE4 00172CE4 00000000 */   nop
/* 72DE8 00172CE8 28160070 */  paddub     $2, $0, $0
/* 72DEC 00172CEC 0C000010 */  b          .L00172D20
/* 72DF0 00172CF0 00000000 */   nop
.L00172CF4:
/* 72DF4 00172CF4 01000424 */  addiu      $4, $0, 0x1
/* 72DF8 00172CF8 B4B5040C */  jal        MGFlipWaitVSync__Fi
/* 72DFC 00172CFC 00000000 */   nop
/* 72E00 00172D00 78CD050C */  jal        EdClearSystemMes__Fv
/* 72E04 00172D04 00000000 */   nop
/* 72E08 00172D08 3480050C */  jal        ClearSystemMes__Fv
/* 72E0C 00172D0C 00000000 */   nop
/* 72E10 00172D10 28260070 */  paddub     $4, $0, $0
/* 72E14 00172D14 F0CF070C */  jal        SetInteriorOutFlag__Fi
/* 72E18 00172D18 00000000 */   nop
/* 72E1C 00172D1C 01000224 */  addiu      $2, $0, 0x1
.L00172D20:
/* 72E20 00172D20 0000BF7B */  lq         $31, 0x0($sp)
/* 72E24 00172D24 1000BD27 */  addiu      $sp, $sp, 0x10
/* 72E28 00172D28 0800E003 */  jr         $31
/* 72E2C 00172D2C 00000000 */   nop
