.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetFuncPoint__FiPUiP16EPARTS_FUNC_DATA
/* 9FA30 0019F930 0400A28C */  lw         $2, 0x4($5)
/* 9FA34 0019F934 2148A200 */  addu       $9, $5, $2
/* 9FA38 0019F938 7000228D */  lw         $2, 0x70($9)
/* 9FA3C 0019F93C 21582201 */  addu       $11, $9, $2
/* 9FA40 0019F940 28560070 */  paddub     $10, $0, $0
/* 9FA44 0019F944 11000010 */  b          .L0019F98C
/* 9FA48 0019F948 00000000 */   nop
.L0019F94C:
/* 9FA4C 0019F94C 18000524 */  addiu      $5, $0, 0x18
/* 9FA50 0019F950 28466071 */  paddub     $8, $11, $0
/* 9FA54 0019F954 283EC070 */  paddub     $7, $6, $0
.L0019F958:
/* 9FA58 0019F958 0000038D */  lw         $3, 0x0($8)
/* 9FA5C 0019F95C 0400028D */  lw         $2, 0x4($8)
/* 9FA60 0019F960 08000825 */  addiu      $8, $8, 0x8
/* 9FA64 0019F964 FFFFA524 */  addiu      $5, $5, -0x1
/* 9FA68 0019F968 0000E3AC */  sw         $3, 0x0($7)
/* 9FA6C 0019F96C 0400E2AC */  sw         $2, 0x4($7)
/* 9FA70 0019F970 0800E724 */  addiu      $7, $7, 0x8
/* 9FA74 0019F974 F8FFA01C */  bgtz       $5, .L0019F958
/* 9FA78 0019F978 00000000 */   nop
/* 9FA7C 0019F97C C0006B25 */  addiu      $11, $11, 0xC0
/* 9FA80 0019F980 1400C4AC */  sw         $4, 0x14($6)
/* 9FA84 0019F984 01004A25 */  addiu      $10, $10, 0x1
/* 9FA88 0019F988 C000C624 */  addiu      $6, $6, 0xC0
.L0019F98C:
/* 9FA8C 0019F98C 7400228D */  lw         $2, 0x74($9)
/* 9FA90 0019F990 2A184201 */  slt        $3, $10, $2
/* 9FA94 0019F994 EDFF6014 */  bnez       $3, .L0019F94C
/* 9FA98 0019F998 00000000 */   nop
/* 9FA9C 0019F99C 0800E003 */  jr         $31
/* 9FAA0 0019F9A0 00000000 */   nop
/* 9FAA4 0019F9A4 00000000 */  nop
/* 9FAA8 0019F9A8 00000000 */  nop
/* 9FAAC 0019F9AC 00000000 */  nop
