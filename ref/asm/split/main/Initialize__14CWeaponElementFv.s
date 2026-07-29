.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Initialize__14CWeaponElementFv
/* 0B7900 001B7800 28360070 */  paddub      $6, $0, $0
/* 0B7904 001B7804 07000010 */  b           .L001B7824
/* 0B7908 001B7808 00000000 */   nop
.L001B780C:
/* 0B790C 001B780C 803F053C */  lui         $5, (0x3F800000 >> 16)
/* 0B7910 001B7810 80180600 */  sll         $3, $6, 2
/* 0B7914 001B7814 21186400 */  addu        $3, $3, $4
/* 0B7918 001B7818 200465AC */  sw          $5, 0x420($3)
/* 0B791C 001B781C 200565AC */  sw          $5, 0x520($3)
/* 0B7920 001B7820 0100C624 */  addiu       $6, $6, 0x1
.L001B7824:
/* 0B7924 001B7824 2000C328 */  slti        $3, $6, 0x20
/* 0B7928 001B7828 F8FF6014 */  bnez        $3, .L001B780C
/* 0B792C 001B782C 00000000 */   nop
/* 0B7930 001B7830 AC0580A4 */  sh          $0, 0x5AC($4)
/* 0B7934 001B7834 0800E003 */  jr          $31
/* 0B7938 001B7838 00000000 */   nop
/* 0B793C 001B783C 00000000 */  nop
