.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVu0InversMatrix
/* 217C8 001216C8 0000A878 */  lq         $8, 0x0($5)
/* 217CC 001216CC 1000A978 */  lq         $9, 0x10($5)
/* 217D0 001216D0 2000AA78 */  lq         $10, 0x20($5)
/* 217D4 001216D4 3000A4D8 */  lqc2       $vf4, 0x30($5)
/* 217D8 001216D8 3C23E54B */  vmove.xyzw $vf5, $vf4
/* 217DC 001216DC 2C21C44B */  vsub.xyz   $vf4, $vf4, $vf4
/* 217E0 001216E0 3C23E94B */  vmove.xyzw $vf9, $vf4
/* 217E4 001216E4 00202B48 */  qmfc2      $11, $vf4
/* 217E8 001216E8 88642871 */  pextlw     $12, $9, $8
/* 217EC 001216EC A86C2871 */  pextuw     $13, $9, $8
/* 217F0 001216F0 88746A71 */  pextlw     $14, $11, $10
/* 217F4 001216F4 A87C6A71 */  pextuw     $15, $11, $10
/* 217F8 001216F8 8943CC71 */  pcpyld     $8, $14, $12
/* 217FC 001216FC A94B8E71 */  pcpyud     $9, $12, $14
/* 21800 00121700 8953ED71 */  pcpyld     $10, $15, $13
/* 21804 00121704 0030A848 */  qmtc2      $8, $vf6
/* 21808 00121708 0038A948 */  qmtc2      $9, $vf7
/* 2180C 0012170C 0040AA48 */  qmtc2      $10, $vf8
/* 21810 00121710 BC31C54B */  vmulax.xyz ACC, $vf6, $vf5x
/* 21814 00121714 BD38C54B */  vmadday.xyz ACC, $vf7, $vf5y
/* 21818 00121718 0A41C54B */  vmaddz.xyz $vf4, $vf8, $vf5z
/* 2181C 0012171C 2C49C44B */  vsub.xyz   $vf4, $vf9, $vf4
/* 21820 00121720 0000887C */  sq         $8, 0x0($4)
/* 21824 00121724 1000897C */  sq         $9, 0x10($4)
/* 21828 00121728 20008A7C */  sq         $10, 0x20($4)
/* 2182C 0012172C 0800E003 */  jr         $31
/* 21830 00121730 300084F8 */   sqc2      $vf4, 0x30($4)
/* 21834 00121734 00000000 */  nop
