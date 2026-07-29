.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetFuncPoint__FiPUiP16EPARTS_FUNC_DATA
/* 09FA30 0019F930 0400A28C */  lw          $2, 0x4($5)
/* 09FA34 0019F934 2148A200 */  addu        $9, $5, $2
/* 09FA38 0019F938 7000228D */  lw          $2, 0x70($9)
/* 09FA3C 0019F93C 21582201 */  addu        $11, $9, $2
/* 09FA40 0019F940 28560070 */  paddub      $10, $0, $0
/* 09FA44 0019F944 11000010 */  b           .L0019F98C
/* 09FA48 0019F948 00000000 */   nop
.L0019F94C:
/* 09FA4C 0019F94C 18000524 */  addiu       $5, $0, 0x18
/* 09FA50 0019F950 28466071 */  paddub      $8, $11, $0
/* 09FA54 0019F954 283EC070 */  paddub      $7, $6, $0
.L0019F958:
/* 09FA58 0019F958 0000038D */  lw          $3, 0x0($8)
/* 09FA5C 0019F95C 0400028D */  lw          $2, 0x4($8)
/* 09FA60 0019F960 08000825 */  addiu       $8, $8, 0x8
/* 09FA64 0019F964 FFFFA524 */  addiu       $5, $5, -0x1
/* 09FA68 0019F968 0000E3AC */  sw          $3, 0x0($7)
/* 09FA6C 0019F96C 0400E2AC */  sw          $2, 0x4($7)
/* 09FA70 0019F970 0800E724 */  addiu       $7, $7, 0x8
/* 09FA74 0019F974 F8FFA01C */  bgtz        $5, .L0019F958
/* 09FA78 0019F978 00000000 */   nop
/* 09FA7C 0019F97C C0006B25 */  addiu       $11, $11, 0xC0
/* 09FA80 0019F980 1400C4AC */  sw          $4, 0x14($6)
/* 09FA84 0019F984 01004A25 */  addiu       $10, $10, 0x1
/* 09FA88 0019F988 C000C624 */  addiu       $6, $6, 0xC0
.L0019F98C:
/* 09FA8C 0019F98C 7400228D */  lw          $2, 0x74($9)
/* 09FA90 0019F990 2A184201 */  slt         $3, $10, $2
/* 09FA94 0019F994 EDFF6014 */  bnez        $3, .L0019F94C
/* 09FA98 0019F998 00000000 */   nop
/* 09FA9C 0019F99C 0800E003 */  jr          $31
/* 09FAA0 0019F9A0 00000000 */   nop
/* 09FAA4 0019F9A4 00000000 */  nop
/* 09FAA8 0019F9A8 00000000 */  nop
/* 09FAAC 0019F9AC 00000000 */  nop
