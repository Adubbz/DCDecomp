.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_LIGHT_COLOR__FP12RS_STACKDATAi
/* 93790 00193690 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 93794 00193694 1000BF7F */  sq         $31, 0x10($sp)
/* 93798 00193698 0000B07F */  sq         $16, 0x0($sp)
/* 9379C 0019369C 01000224 */  addiu      $2, $0, 0x1
/* 937A0 001936A0 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 937A4 001936A4 F0D422AC */  sw         $2, -0x2B10($at)
/* 937A8 001936A8 08009024 */  addiu      $16, $4, 0x8
/* 937AC 001936AC D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 937B0 001936B0 00000000 */   nop
/* 937B4 001936B4 281E4070 */  paddub     $3, $2, $0
/* 937B8 001936B8 04006004 */  bltz       $3, .L001936CC
/* 937BC 001936BC 00000000 */   nop
/* 937C0 001936C0 04006128 */  slti       $at, $3, 0x4
/* 937C4 001936C4 04002014 */  bnez       $at, .L001936D8
/* 937C8 001936C8 00000000 */   nop
.L001936CC:
/* 937CC 001936CC 28160070 */  paddub     $2, $0, $0
/* 937D0 001936D0 1A000010 */  b          .L0019373C
/* 937D4 001936D4 00000000 */   nop
.L001936D8:
/* 937D8 001936D8 28260072 */  paddub     $4, $16, $0
/* 937DC 001936DC 08009024 */  addiu      $16, $4, 0x8
/* 937E0 001936E0 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 937E4 001936E4 00000000 */   nop
/* 937E8 001936E8 00190300 */  sll        $3, $3, 4
/* 937EC 001936EC D401023C */  lui        $2, %hi(D_1D3D540)
/* 937F0 001936F0 40D54224 */  addiu      $2, $2, %lo(D_1D3D540)
/* 937F4 001936F4 21104300 */  addu       $2, $2, $3
/* 937F8 001936F8 000040E4 */  swc1       $f0, 0x0($2)
/* 937FC 001936FC 28260072 */  paddub     $4, $16, $0
/* 93800 00193700 08009024 */  addiu      $16, $4, 0x8
/* 93804 00193704 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 93808 00193708 00000000 */   nop
/* 9380C 0019370C D401023C */  lui        $2, %hi(D_1D3D544)
/* 93810 00193710 44D54224 */  addiu      $2, $2, %lo(D_1D3D544)
/* 93814 00193714 21104300 */  addu       $2, $2, $3
/* 93818 00193718 000040E4 */  swc1       $f0, 0x0($2)
/* 9381C 0019371C 28260072 */  paddub     $4, $16, $0
/* 93820 00193720 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 93824 00193724 00000000 */   nop
/* 93828 00193728 D401023C */  lui        $2, %hi(D_1D3D548)
/* 9382C 0019372C 48D54224 */  addiu      $2, $2, %lo(D_1D3D548)
/* 93830 00193730 21104300 */  addu       $2, $2, $3
/* 93834 00193734 000040E4 */  swc1       $f0, 0x0($2)
/* 93838 00193738 01000224 */  addiu      $2, $0, 0x1
.L0019373C:
/* 9383C 0019373C 1000BF7B */  lq         $31, 0x10($sp)
/* 93840 00193740 0000B07B */  lq         $16, 0x0($sp)
/* 93844 00193744 2000BD27 */  addiu      $sp, $sp, 0x20
/* 93848 00193748 0800E003 */  jr         $31
/* 9384C 0019374C 00000000 */   nop
