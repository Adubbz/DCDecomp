.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _CHK_ROTATION__FP12RS_STACKDATAi
/* E21B0 001E20B0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* E21B4 001E20B4 0000BF7F */  sq         $31, 0x0($sp)
/* E21B8 001E20B8 E09C868F */  lw         $6, -0x6320($gp)
/* E21BC 001E20BC 9000C38C */  lw         $3, 0x90($6)
/* E21C0 001E20C0 282E0070 */  paddub     $5, $0, $0
/* E21C4 001E20C4 80100300 */  sll        $2, $3, 2
/* E21C8 001E20C8 21184300 */  addu       $3, $2, $3
/* E21CC 001E20CC 80100300 */  sll        $2, $3, 2
/* E21D0 001E20D0 21106200 */  addu       $2, $3, $2
/* E21D4 001E20D4 00110200 */  sll        $2, $2, 4
/* E21D8 001E20D8 21104600 */  addu       $2, $2, $6
/* E21DC 001E20DC 0200013C */  lui        $at, (0x20000 >> 16)
/* E21E0 001E20E0 21084100 */  addu       $at, $2, $at
/* E21E4 001E20E4 54E421C4 */  lwc1       $f1, -0x1BAC($at)
/* E21E8 001E20E8 00008044 */  mtc1       $0, $f0
/* E21EC 001E20EC 00000000 */  nop
/* E21F0 001E20F0 32000146 */  c.eq.s     $f0, $f1
/* E21F4 001E20F4 00000000 */  nop
/* E21F8 001E20F8 02000045 */  bc1f       .L001E2104
/* E21FC 001E20FC 00000000 */   nop
/* E2200 001E2100 01000524 */  addiu      $5, $0, 0x1
.L001E2104:
/* E2204 001E2104 B485070C */  jal        SetStack__FP12RS_STACKDATAi_3
/* E2208 001E2108 00000000 */   nop
/* E220C 001E210C 01000224 */  addiu      $2, $0, 0x1
/* E2210 001E2110 0000BF7B */  lq         $31, 0x0($sp)
/* E2214 001E2114 1000BD27 */  addiu      $sp, $sp, 0x10
/* E2218 001E2118 0800E003 */  jr         $31
/* E221C 001E211C 00000000 */   nop
