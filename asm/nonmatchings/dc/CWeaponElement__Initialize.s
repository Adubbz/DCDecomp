.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Initialize__14CWeaponElementFv
/* B7900 001B7800 28360070 */  paddub     $6, $0, $0
/* B7904 001B7804 07000010 */  b          .L001B7824
/* B7908 001B7808 00000000 */   nop
.L001B780C:
/* B790C 001B780C 803F053C */  lui        $5, (0x3F800000 >> 16)
/* B7910 001B7810 80180600 */  sll        $3, $6, 2
/* B7914 001B7814 21186400 */  addu       $3, $3, $4
/* B7918 001B7818 200465AC */  sw         $5, 0x420($3)
/* B791C 001B781C 200565AC */  sw         $5, 0x520($3)
/* B7920 001B7820 0100C624 */  addiu      $6, $6, 0x1
.L001B7824:
/* B7924 001B7824 2000C328 */  slti       $3, $6, 0x20
/* B7928 001B7828 F8FF6014 */  bnez       $3, .L001B780C
/* B792C 001B782C 00000000 */   nop
/* B7930 001B7830 AC0580A4 */  sh         $0, 0x5AC($4)
/* B7934 001B7834 0800E003 */  jr         $31
/* B7938 001B7838 00000000 */   nop
/* B793C 001B783C 00000000 */  nop
