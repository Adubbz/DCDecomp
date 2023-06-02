.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ChainWorkClear__9CEditAreaFv
/* 6FDA0 0016FCA0 28360070 */  paddub     $6, $0, $0
/* 6FDA4 0016FCA4 0E000010 */  b          .L0016FCE0
/* 6FDA8 0016FCA8 00000000 */   nop
.L0016FCAC:
/* 6FDAC 0016FCAC 283E0070 */  paddub     $7, $0, $0
/* 6FDB0 0016FCB0 07000010 */  b          .L0016FCD0
/* 6FDB4 0016FCB4 00000000 */   nop
.L0016FCB8:
/* 6FDB8 0016FCB8 80190600 */  sll        $3, $6, 6
/* 6FDBC 0016FCBC 21286400 */  addu       $5, $3, $4
/* 6FDC0 0016FCC0 80180700 */  sll        $3, $7, 2
/* 6FDC4 0016FCC4 21186500 */  addu       $3, $3, $5
/* 6FDC8 0016FCC8 281C60AC */  sw         $0, 0x1C28($3)
/* 6FDCC 0016FCCC 0100E724 */  addiu      $7, $7, 0x1
.L0016FCD0:
/* 6FDD0 0016FCD0 1000E328 */  slti       $3, $7, 0x10
/* 6FDD4 0016FCD4 F8FF6014 */  bnez       $3, .L0016FCB8
/* 6FDD8 0016FCD8 00000000 */   nop
/* 6FDDC 0016FCDC 0100C624 */  addiu      $6, $6, 0x1
.L0016FCE0:
/* 6FDE0 0016FCE0 1000C328 */  slti       $3, $6, 0x10
/* 6FDE4 0016FCE4 F1FF6014 */  bnez       $3, .L0016FCAC
/* 6FDE8 0016FCE8 00000000 */   nop
/* 6FDEC 0016FCEC 0800E003 */  jr         $31
/* 6FDF0 0016FCF0 00000000 */   nop
/* 6FDF4 0016FCF4 00000000 */  nop
/* 6FDF8 0016FCF8 00000000 */  nop
/* 6FDFC 0016FCFC 00000000 */  nop
