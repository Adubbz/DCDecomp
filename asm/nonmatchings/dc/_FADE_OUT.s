.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _FADE_OUT__FP12RS_STACKDATAi
/* 92E20 00192D20 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 92E24 00192D24 5000BF7F */  sq         $31, 0x50($sp)
/* 92E28 00192D28 4000B47F */  sq         $20, 0x40($sp)
/* 92E2C 00192D2C 3000B37F */  sq         $19, 0x30($sp)
/* 92E30 00192D30 2000B27F */  sq         $18, 0x20($sp)
/* 92E34 00192D34 1000B17F */  sq         $17, 0x10($sp)
/* 92E38 00192D38 0000B07F */  sq         $16, 0x0($sp)
/* 92E3C 00192D3C 289EA070 */  paddub     $19, $5, $0
/* 92E40 00192D40 08009424 */  addiu      $20, $4, 0x8
/* 92E44 00192D44 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 92E48 00192D48 00000000 */   nop
/* 92E4C 00192D4C 28964070 */  paddub     $18, $2, $0
/* 92E50 00192D50 28160070 */  paddub     $2, $0, $0
/* 92E54 00192D54 288E0070 */  paddub     $17, $0, $0
/* 92E58 00192D58 28860070 */  paddub     $16, $0, $0
/* 92E5C 00192D5C 04000324 */  addiu      $3, $0, 0x4
/* 92E60 00192D60 0E006316 */  bne        $19, $3, .L00192D9C
/* 92E64 00192D64 00000000 */   nop
/* 92E68 00192D68 28268072 */  paddub     $4, $20, $0
/* 92E6C 00192D6C 08009424 */  addiu      $20, $4, 0x8
/* 92E70 00192D70 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 92E74 00192D74 00000000 */   nop
/* 92E78 00192D78 28864070 */  paddub     $16, $2, $0
/* 92E7C 00192D7C 28268072 */  paddub     $4, $20, $0
/* 92E80 00192D80 08009424 */  addiu      $20, $4, 0x8
/* 92E84 00192D84 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 92E88 00192D88 00000000 */   nop
/* 92E8C 00192D8C 288E4070 */  paddub     $17, $2, $0
/* 92E90 00192D90 28268072 */  paddub     $4, $20, $0
/* 92E94 00192D94 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 92E98 00192D98 00000000 */   nop
.L00192D9C:
/* 92E9C 00192D9C 00009044 */  mtc1       $16, $f0
/* 92EA0 00192DA0 00000000 */  nop
/* 92EA4 00192DA4 20038046 */  cvt.s.w    $f12, $f0
/* 92EA8 00192DA8 00009144 */  mtc1       $17, $f0
/* 92EAC 00192DAC 00000000 */  nop
/* 92EB0 00192DB0 60038046 */  cvt.s.w    $f13, $f0
/* 92EB4 00192DB4 00008244 */  mtc1       $2, $f0
/* 92EB8 00192DB8 00000000 */  nop
/* 92EBC 00192DBC A0038046 */  cvt.s.w    $f14, $f0
/* 92EC0 00192DC0 28264072 */  paddub     $4, $18, $0
/* 92EC4 00192DC4 E425060C */  jal        EdFadeOut__Fifff
/* 92EC8 00192DC8 00000000 */   nop
/* 92ECC 00192DCC 01000224 */  addiu      $2, $0, 0x1
/* 92ED0 00192DD0 5000BF7B */  lq         $31, 0x50($sp)
/* 92ED4 00192DD4 4000B47B */  lq         $20, 0x40($sp)
/* 92ED8 00192DD8 3000B37B */  lq         $19, 0x30($sp)
/* 92EDC 00192DDC 2000B27B */  lq         $18, 0x20($sp)
/* 92EE0 00192DE0 1000B17B */  lq         $17, 0x10($sp)
/* 92EE4 00192DE4 0000B07B */  lq         $16, 0x0($sp)
/* 92EE8 00192DE8 6000BD27 */  addiu      $sp, $sp, 0x60
/* 92EEC 00192DEC 0800E003 */  jr         $31
/* 92EF0 00192DF0 00000000 */   nop
/* 92EF4 00192DF4 00000000 */  nop
/* 92EF8 00192DF8 00000000 */  nop
/* 92EFC 00192DFC 00000000 */  nop
