.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BoardModeChangeKey__Fv
/* 12EAB0 0022E9B0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 12EAB4 0022E9B4 1000BF7F */  sq         $31, 0x10($sp)
/* 12EAB8 0022E9B8 0000B07F */  sq         $16, 0x0($sp)
/* 12EABC 0022E9BC A897828F */  lw         $2, -0x6858($gp)
/* 12EAC0 0022E9C0 0400508C */  lw         $16, 0x4($2)
/* 12EAC4 0022E9C4 CC01023C */  lui        $2, %hi(GamePad)
/* 12EAC8 0022E9C8 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 12EACC 0022E9CC 05000524 */  addiu      $5, $0, 0x5
/* 12EAD0 0022E9D0 1CAE040C */  jal        Down__8CGamePadFi
/* 12EAD4 0022E9D4 00000000 */   nop
/* 12EAD8 0022E9D8 16004010 */  beqz       $2, .L0022EA34
/* 12EADC 0022E9DC 00000000 */   nop
/* 12EAE0 0022E9E0 A897858F */  lw         $5, -0x6858($gp)
/* 12EAE4 0022E9E4 0000A48C */  lw         $4, 0x0($5)
/* 12EAE8 0022E9E8 01000224 */  addiu      $2, $0, 0x1
/* 12EAEC 0022E9EC 11008210 */  beq        $4, $2, .L0022EA34
/* 12EAF0 0022E9F0 00000000 */   nop
/* 12EAF4 0022E9F4 02000324 */  addiu      $3, $0, 0x2
/* 12EAF8 0022E9F8 0E008310 */  beq        $4, $3, .L0022EA34
/* 12EAFC 0022E9FC 00000000 */   nop
/* 12EB00 0022EA00 03008010 */  beqz       $4, .L0022EA10
/* 12EB04 0022EA04 00000000 */   nop
/* 12EB08 0022EA08 0A000010 */  b          .L0022EA34
/* 12EB0C 0022EA0C 00000000 */   nop
.L0022EA10:
/* 12EB10 0022EA10 0400A28C */  lw         $2, 0x4($5)
/* 12EB14 0022EA14 FFFF4224 */  addiu      $2, $2, -0x1
/* 12EB18 0022EA18 0400A2AC */  sw         $2, 0x4($5)
/* 12EB1C 0022EA1C A897828F */  lw         $2, -0x6858($gp)
/* 12EB20 0022EA20 04004424 */  addiu      $4, $2, 0x4
/* 12EB24 0022EA24 0400428C */  lw         $2, 0x4($2)
/* 12EB28 0022EA28 02004104 */  bgez       $2, .L0022EA34
/* 12EB2C 0022EA2C 00000000 */   nop
/* 12EB30 0022EA30 000083AC */  sw         $3, 0x0($4)
.L0022EA34:
/* 12EB34 0022EA34 CC01023C */  lui        $2, %hi(GamePad)
/* 12EB38 0022EA38 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 12EB3C 0022EA3C 0A000524 */  addiu      $5, $0, 0xA
/* 12EB40 0022EA40 1CAE040C */  jal        Down__8CGamePadFi
/* 12EB44 0022EA44 00000000 */   nop
/* 12EB48 0022EA48 17004010 */  beqz       $2, .L0022EAA8
/* 12EB4C 0022EA4C 00000000 */   nop
/* 12EB50 0022EA50 A897848F */  lw         $4, -0x6858($gp)
/* 12EB54 0022EA54 0000838C */  lw         $3, 0x0($4)
/* 12EB58 0022EA58 01000224 */  addiu      $2, $0, 0x1
/* 12EB5C 0022EA5C 12006210 */  beq        $3, $2, .L0022EAA8
/* 12EB60 0022EA60 00000000 */   nop
/* 12EB64 0022EA64 02000224 */  addiu      $2, $0, 0x2
/* 12EB68 0022EA68 0F006210 */  beq        $3, $2, .L0022EAA8
/* 12EB6C 0022EA6C 00000000 */   nop
/* 12EB70 0022EA70 03006010 */  beqz       $3, .L0022EA80
/* 12EB74 0022EA74 00000000 */   nop
/* 12EB78 0022EA78 0B000010 */  b          .L0022EAA8
/* 12EB7C 0022EA7C 00000000 */   nop
.L0022EA80:
/* 12EB80 0022EA80 0400828C */  lw         $2, 0x4($4)
/* 12EB84 0022EA84 01004224 */  addiu      $2, $2, 0x1
/* 12EB88 0022EA88 040082AC */  sw         $2, 0x4($4)
/* 12EB8C 0022EA8C A897828F */  lw         $2, -0x6858($gp)
/* 12EB90 0022EA90 04004324 */  addiu      $3, $2, 0x4
/* 12EB94 0022EA94 0400428C */  lw         $2, 0x4($2)
/* 12EB98 0022EA98 03004128 */  slti       $at, $2, 0x3
/* 12EB9C 0022EA9C 02002014 */  bnez       $at, .L0022EAA8
/* 12EBA0 0022EAA0 00000000 */   nop
/* 12EBA4 0022EAA4 000060AC */  sw         $0, 0x0($3)
.L0022EAA8:
/* 12EBA8 0022EAA8 A897828F */  lw         $2, -0x6858($gp)
/* 12EBAC 0022EAAC 0400428C */  lw         $2, 0x4($2)
/* 12EBB0 0022EAB0 04000212 */  beq        $16, $2, .L0022EAC4
/* 12EBB4 0022EAB4 00000000 */   nop
/* 12EBB8 0022EAB8 01000224 */  addiu      $2, $0, 0x1
/* 12EBBC 0022EABC 02000010 */  b          .L0022EAC8
/* 12EBC0 0022EAC0 00000000 */   nop
.L0022EAC4:
/* 12EBC4 0022EAC4 28160070 */  paddub     $2, $0, $0
.L0022EAC8:
/* 12EBC8 0022EAC8 1000BF7B */  lq         $31, 0x10($sp)
/* 12EBCC 0022EACC 0000B07B */  lq         $16, 0x0($sp)
/* 12EBD0 0022EAD0 2000BD27 */  addiu      $sp, $sp, 0x20
/* 12EBD4 0022EAD4 0800E003 */  jr         $31
/* 12EBD8 0022EAD8 00000000 */   nop
/* 12EBDC 0022EADC 00000000 */  nop
