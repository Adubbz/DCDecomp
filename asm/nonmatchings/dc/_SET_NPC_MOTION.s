.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_NPC_MOTION__FP12RS_STACKDATAi
/* 8EB80 0018EA80 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 8EB84 0018EA84 5000BF7F */  sq         $31, 0x50($sp)
/* 8EB88 0018EA88 4000B37F */  sq         $19, 0x40($sp)
/* 8EB8C 0018EA8C 3000B27F */  sq         $18, 0x30($sp)
/* 8EB90 0018EA90 2000B17F */  sq         $17, 0x20($sp)
/* 8EB94 0018EA94 1000B07F */  sq         $16, 0x10($sp)
/* 8EB98 0018EA98 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 8EB9C 0018EA9C 2896A070 */  paddub     $18, $5, $0
/* 8EBA0 0018EAA0 08009324 */  addiu      $19, $4, 0x8
/* 8EBA4 0018EAA4 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8EBA8 0018EAA8 00000000 */   nop
/* 8EBAC 0018EAAC FFFF0324 */  addiu      $3, $0, -0x1
/* 8EBB0 0018EAB0 05004314 */  bne        $2, $3, .L0018EAC8
/* 8EBB4 0018EAB4 00000000 */   nop
/* 8EBB8 0018EAB8 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8EBBC 0018EABC 1CD2308C */  lw         $16, -0x2DE4($at)
/* 8EBC0 0018EAC0 05000010 */  b          .L0018EAD8
/* 8EBC4 0018EAC4 00000000 */   nop
.L0018EAC8:
/* 8EBC8 0018EAC8 28264070 */  paddub     $4, $2, $0
/* 8EBCC 0018EACC 702C060C */  jal        GetNPC__Fi
/* 8EBD0 0018EAD0 00000000 */   nop
/* 8EBD4 0018EAD4 28864070 */  paddub     $16, $2, $0
.L0018EAD8:
/* 8EBD8 0018EAD8 04000016 */  bnez       $16, .L0018EAEC
/* 8EBDC 0018EADC 00000000 */   nop
/* 8EBE0 0018EAE0 28160070 */  paddub     $2, $0, $0
/* 8EBE4 0018EAE4 28000010 */  b          .L0018EB88
/* 8EBE8 0018EAE8 00000000 */   nop
.L0018EAEC:
/* 8EBEC 0018EAEC 28266072 */  paddub     $4, $19, $0
/* 8EBF0 0018EAF0 08009324 */  addiu      $19, $4, 0x8
/* 8EBF4 0018EAF4 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8EBF8 0018EAF8 00000000 */   nop
/* 8EBFC 0018EAFC 288E4070 */  paddub     $17, $2, $0
/* 8EC00 0018EB00 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* 8EC04 0018EB04 00A08244 */  mtc1       $2, $f20
/* 8EC08 0018EB08 0300422A */  slti       $2, $18, 0x3
/* 8EC0C 0018EB0C 06004014 */  bnez       $2, .L0018EB28
/* 8EC10 0018EB10 00000000 */   nop
/* 8EC14 0018EB14 28266072 */  paddub     $4, $19, $0
/* 8EC18 0018EB18 08009324 */  addiu      $19, $4, 0x8
/* 8EC1C 0018EB1C E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 8EC20 0018EB20 00000000 */   nop
/* 8EC24 0018EB24 06050046 */  mov.s      $f20, $f0
.L0018EB28:
/* 8EC28 0018EB28 04000224 */  addiu      $2, $0, 0x4
/* 8EC2C 0018EB2C 0A004216 */  bne        $18, $2, .L0018EB58
/* 8EC30 0018EB30 00000000 */   nop
/* 8EC34 0018EB34 28266072 */  paddub     $4, $19, $0
/* 8EC38 0018EB38 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8EC3C 0018EB3C 00000000 */   nop
/* 8EC40 0018EB40 680C11AE */  sw         $17, 0xC68($16)
/* 8EC44 0018EB44 640C02AE */  sw         $2, 0xC64($16)
/* 8EC48 0018EB48 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* 8EC4C 0018EB4C 600C02AE */  sw         $2, 0xC60($16)
/* 8EC50 0018EB50 05000010 */  b          .L0018EB68
/* 8EC54 0018EB54 00000000 */   nop
.L0018EB58:
/* 8EC58 0018EB58 680C11AE */  sw         $17, 0xC68($16)
/* 8EC5C 0018EB5C 640C00AE */  sw         $0, 0xC64($16)
/* 8EC60 0018EB60 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* 8EC64 0018EB64 600C02AE */  sw         $2, 0xC60($16)
.L0018EB68:
/* 8EC68 0018EB68 00008044 */  mtc1       $0, $f0
/* 8EC6C 0018EB6C 00000000 */  nop
/* 8EC70 0018EB70 36A00046 */  c.le.s     $f20, $f0
/* 8EC74 0018EB74 00000000 */  nop
/* 8EC78 0018EB78 02000145 */  bc1t       .L0018EB84
/* 8EC7C 0018EB7C 00000000 */   nop
/* 8EC80 0018EB80 600C14E6 */  swc1       $f20, 0xC60($16)
.L0018EB84:
/* 8EC84 0018EB84 01000224 */  addiu      $2, $0, 0x1
.L0018EB88:
/* 8EC88 0018EB88 5000BF7B */  lq         $31, 0x50($sp)
/* 8EC8C 0018EB8C 4000B37B */  lq         $19, 0x40($sp)
/* 8EC90 0018EB90 3000B27B */  lq         $18, 0x30($sp)
/* 8EC94 0018EB94 2000B17B */  lq         $17, 0x20($sp)
/* 8EC98 0018EB98 1000B07B */  lq         $16, 0x10($sp)
/* 8EC9C 0018EB9C 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 8ECA0 0018EBA0 6000BD27 */  addiu      $sp, $sp, 0x60
/* 8ECA4 0018EBA4 0800E003 */  jr         $31
/* 8ECA8 0018EBA8 00000000 */   nop
/* 8ECAC 0018EBAC 00000000 */  nop
