.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _CHK_ROTATION__FP12RS_STACKDATAi
/* 0E21B0 001E20B0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0E21B4 001E20B4 0000BF7F */  sq          $31, 0x0($29)
/* 0E21B8 001E20B8 E09C868F */  lw          $6, -0x6320($28)
/* 0E21BC 001E20BC 9000C38C */  lw          $3, 0x90($6)
/* 0E21C0 001E20C0 282E0070 */  paddub      $5, $0, $0
/* 0E21C4 001E20C4 80100300 */  sll         $2, $3, 2
/* 0E21C8 001E20C8 21184300 */  addu        $3, $2, $3
/* 0E21CC 001E20CC 80100300 */  sll         $2, $3, 2
/* 0E21D0 001E20D0 21106200 */  addu        $2, $3, $2
/* 0E21D4 001E20D4 00110200 */  sll         $2, $2, 4
/* 0E21D8 001E20D8 21104600 */  addu        $2, $2, $6
/* 0E21DC 001E20DC 0200013C */  lui         $1, (0x20000 >> 16)
/* 0E21E0 001E20E0 21084100 */  addu        $1, $2, $1
/* 0E21E4 001E20E4 54E421C4 */  lwc1        $f1, -0x1BAC($1)
/* 0E21E8 001E20E8 00008044 */  mtc1        $0, $f0
/* 0E21EC 001E20EC 00000000 */  nop
/* 0E21F0 001E20F0 32000146 */  c.eq.s      $f0, $f1
/* 0E21F4 001E20F4 00000000 */  nop
/* 0E21F8 001E20F8 02000045 */  bc1f        .L001E2104
/* 0E21FC 001E20FC 00000000 */   nop
/* 0E2200 001E2100 01000524 */  addiu       $5, $0, 0x1
.L001E2104:
/* 0E2204 001E2104 B485070C */  jal         SetStack__FP12RS_STACKDATAi__3
/* 0E2208 001E2108 00000000 */   nop
/* 0E220C 001E210C 01000224 */  addiu       $2, $0, 0x1
/* 0E2210 001E2110 0000BF7B */  lq          $31, 0x0($29)
/* 0E2214 001E2114 1000BD27 */  addiu       $29, $29, 0x10
/* 0E2218 001E2118 0800E003 */  jr          $31
/* 0E221C 001E211C 00000000 */   nop
