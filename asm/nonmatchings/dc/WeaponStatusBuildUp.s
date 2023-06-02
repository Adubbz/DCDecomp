.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WeaponStatusBuildUp__FP11WEAPON_HAVERi
/* 10CF70 0020CE70 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 10CF74 0020CE74 1000BF7F */  sq         $31, 0x10($sp)
/* 10CF78 0020CE78 0000B07F */  sq         $16, 0x0($sp)
/* 10CF7C 0020CE7C 28168070 */  paddub     $2, $4, $0
/* 10CF80 0020CE80 2886A070 */  paddub     $16, $5, $0
/* 10CF84 0020CE84 04004014 */  bnez       $2, .L0020CE98
/* 10CF88 0020CE88 00000000 */   nop
/* 10CF8C 0020CE8C 28160070 */  paddub     $2, $0, $0
/* 10CF90 0020CE90 22000010 */  b          .L0020CF1C
/* 10CF94 0020CE94 00000000 */   nop
.L0020CE98:
/* 10CF98 0020CE98 2000A427 */  addiu      $4, $sp, 0x20
/* 10CF9C 0020CE9C 282E4070 */  paddub     $5, $2, $0
/* 10CFA0 0020CEA0 20D5080C */  jal        EnableBuildUpModel__FP16WEP_BUILDUP_INFOP11WEAPON_HAVE
/* 10CFA4 0020CEA4 00000000 */   nop
/* 10CFA8 0020CEA8 28160070 */  paddub     $2, $0, $0
/* 10CFAC 0020CEAC 02000010 */  b          .L0020CEB8
/* 10CFB0 0020CEB0 00000000 */   nop
.L0020CEB4:
/* 10CFB4 0020CEB4 01004224 */  addiu      $2, $2, 0x1
.L0020CEB8:
/* 10CFB8 0020CEB8 80180200 */  sll        $3, $2, 2
/* 10CFBC 0020CEBC 21187D00 */  addu       $3, $3, $sp
/* 10CFC0 0020CEC0 20006484 */  lh         $4, 0x20($3)
/* 10CFC4 0020CEC4 FFFF0324 */  addiu      $3, $0, -0x1
/* 10CFC8 0020CEC8 04008310 */  beq        $4, $3, .L0020CEDC
/* 10CFCC 0020CECC 00000000 */   nop
/* 10CFD0 0020CED0 05004328 */  slti       $3, $2, 0x5
/* 10CFD4 0020CED4 F7FF6014 */  bnez       $3, .L0020CEB4
/* 10CFD8 0020CED8 00000000 */   nop
.L0020CEDC:
/* 10CFDC 0020CEDC 282E0070 */  paddub     $5, $0, $0
/* 10CFE0 0020CEE0 0B000010 */  b          .L0020CF10
/* 10CFE4 0020CEE4 00000000 */   nop
.L0020CEE8:
/* 10CFE8 0020CEE8 80180500 */  sll        $3, $5, 2
/* 10CFEC 0020CEEC 21187D00 */  addu       $3, $3, $sp
/* 10CFF0 0020CEF0 22006484 */  lh         $4, 0x22($3)
/* 10CFF4 0020CEF4 01000324 */  addiu      $3, $0, 0x1
/* 10CFF8 0020CEF8 04008314 */  bne        $4, $3, .L0020CF0C
/* 10CFFC 0020CEFC 00000000 */   nop
/* 10D000 0020CF00 0000038E */  lw         $3, 0x0($16)
/* 10D004 0020CF04 01006324 */  addiu      $3, $3, 0x1
/* 10D008 0020CF08 000003AE */  sw         $3, 0x0($16)
.L0020CF0C:
/* 10D00C 0020CF0C 0100A524 */  addiu      $5, $5, 0x1
.L0020CF10:
/* 10D010 0020CF10 2A18A200 */  slt        $3, $5, $2
/* 10D014 0020CF14 F4FF6014 */  bnez       $3, .L0020CEE8
/* 10D018 0020CF18 00000000 */   nop
.L0020CF1C:
/* 10D01C 0020CF1C 1000BF7B */  lq         $31, 0x10($sp)
/* 10D020 0020CF20 0000B07B */  lq         $16, 0x0($sp)
/* 10D024 0020CF24 4000BD27 */  addiu      $sp, $sp, 0x40
/* 10D028 0020CF28 0800E003 */  jr         $31
/* 10D02C 0020CF2C 00000000 */   nop
