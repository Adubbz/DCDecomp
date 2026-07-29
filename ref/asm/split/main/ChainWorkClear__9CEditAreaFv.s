.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ChainWorkClear__9CEditAreaFv
/* 06FDA0 0016FCA0 28360070 */  paddub      $6, $0, $0
/* 06FDA4 0016FCA4 0E000010 */  b           .L0016FCE0
/* 06FDA8 0016FCA8 00000000 */   nop
.L0016FCAC:
/* 06FDAC 0016FCAC 283E0070 */  paddub      $7, $0, $0
/* 06FDB0 0016FCB0 07000010 */  b           .L0016FCD0
/* 06FDB4 0016FCB4 00000000 */   nop
.L0016FCB8:
/* 06FDB8 0016FCB8 80190600 */  sll         $3, $6, 6
/* 06FDBC 0016FCBC 21286400 */  addu        $5, $3, $4
/* 06FDC0 0016FCC0 80180700 */  sll         $3, $7, 2
/* 06FDC4 0016FCC4 21186500 */  addu        $3, $3, $5
/* 06FDC8 0016FCC8 281C60AC */  sw          $0, 0x1C28($3)
/* 06FDCC 0016FCCC 0100E724 */  addiu       $7, $7, 0x1
.L0016FCD0:
/* 06FDD0 0016FCD0 1000E328 */  slti        $3, $7, 0x10
/* 06FDD4 0016FCD4 F8FF6014 */  bnez        $3, .L0016FCB8
/* 06FDD8 0016FCD8 00000000 */   nop
/* 06FDDC 0016FCDC 0100C624 */  addiu       $6, $6, 0x1
.L0016FCE0:
/* 06FDE0 0016FCE0 1000C328 */  slti        $3, $6, 0x10
/* 06FDE4 0016FCE4 F1FF6014 */  bnez        $3, .L0016FCAC
/* 06FDE8 0016FCE8 00000000 */   nop
/* 06FDEC 0016FCEC 0800E003 */  jr          $31
/* 06FDF0 0016FCF0 00000000 */   nop
/* 06FDF4 0016FCF4 00000000 */  nop
/* 06FDF8 0016FCF8 00000000 */  nop
/* 06FDFC 0016FCFC 00000000 */  nop
