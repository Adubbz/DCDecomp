.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PersonalBoardLimmitCheck__Fv
/* 12EBE0 0022EAE0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 12EBE4 0022EAE4 1000BF7F */  sq         $31, 0x10($sp)
/* 12EBE8 0022EAE8 0000B07F */  sq         $16, 0x0($sp)
/* 12EBEC 0022EAEC A897828F */  lw         $2, -0x6858($gp)
/* 12EBF0 0022EAF0 0400448C */  lw         $4, 0x4($2)
/* 12EBF4 0022EAF4 0C005024 */  addiu      $16, $2, 0xC
/* 12EBF8 0022EAF8 D8BD080C */  jal        PersonalRetMax__Fi
/* 12EBFC 0022EAFC 00000000 */   nop
/* 12EC00 0022EB00 A897838F */  lw         $3, -0x6858($gp)
/* 12EC04 0022EB04 1800668C */  lw         $6, 0x18($3)
/* 12EC08 0022EB08 05000324 */  addiu      $3, $0, 0x5
/* 12EC0C 0022EB0C 1A004300 */  div        $0, $2, $3
/* 12EC10 0022EB10 02006014 */  bnez       $3, .L0022EB1C
/* 12EC14 0022EB14 00000000 */   nop
/* 12EC18 0022EB18 CD010000 */  break      0, 7
.L0022EB1C:
/* 12EC1C 0022EB1C 12180000 */  mflo       $3
/* 12EC20 0022EB20 FCFF6724 */  addiu      $7, $3, -0x4
/* 12EC24 0022EB24 0200E104 */  bgez       $7, .L0022EB30
/* 12EC28 0022EB28 00000000 */   nop
/* 12EC2C 0022EB2C 283E0070 */  paddub     $7, $0, $0
.L0022EB30:
/* 12EC30 0022EB30 FFFF4524 */  addiu      $5, $2, -0x1
/* 12EC34 0022EB34 0000048E */  lw         $4, 0x0($16)
/* 12EC38 0022EB38 2A08A400 */  slt        $at, $5, $4
/* 12EC3C 0022EB3C 39002010 */  beqz       $at, .L0022EC24
/* 12EC40 0022EB40 00000000 */   nop
/* 12EC44 0022EB44 04000010 */  b          .L0022EB58
/* 12EC48 0022EB48 00000000 */   nop
.L0022EB4C:
/* 12EC4C 0022EB4C 0000048E */  lw         $4, 0x0($16)
/* 12EC50 0022EB50 FBFF8424 */  addiu      $4, $4, -0x5
/* 12EC54 0022EB54 000004AE */  sw         $4, 0x0($16)
.L0022EB58:
/* 12EC58 0022EB58 0000058E */  lw         $5, 0x0($16)
/* 12EC5C 0022EB5C 2A08A200 */  slt        $at, $5, $2
/* 12EC60 0022EB60 FAFF2010 */  beqz       $at, .L0022EB4C
/* 12EC64 0022EB64 00000000 */   nop
/* 12EC68 0022EB68 05000424 */  addiu      $4, $0, 0x5
/* 12EC6C 0022EB6C 1A00A400 */  div        $0, $5, $4
/* 12EC70 0022EB70 02008014 */  bnez       $4, .L0022EB7C
/* 12EC74 0022EB74 00000000 */   nop
/* 12EC78 0022EB78 CD010000 */  break      0, 7
.L0022EB7C:
/* 12EC7C 0022EB7C 12200000 */  mflo       $4
/* 12EC80 0022EB80 FDFF8524 */  addiu      $5, $4, -0x3
/* 12EC84 0022EB84 A897848F */  lw         $4, -0x6858($gp)
/* 12EC88 0022EB88 180085AC */  sw         $5, 0x18($4)
/* 12EC8C 0022EB8C A897848F */  lw         $4, -0x6858($gp)
/* 12EC90 0022EB90 18008524 */  addiu      $5, $4, 0x18
/* 12EC94 0022EB94 1800848C */  lw         $4, 0x18($4)
/* 12EC98 0022EB98 02008104 */  bgez       $4, .L0022EBA4
/* 12EC9C 0022EB9C 00000000 */   nop
/* 12ECA0 0022EBA0 0000A0AC */  sw         $0, 0x0($5)
.L0022EBA4:
/* 12ECA4 0022EBA4 A897868F */  lw         $6, -0x6858($gp)
/* 12ECA8 0022EBA8 1800C58C */  lw         $5, 0x18($6)
/* 12ECAC 0022EBAC 80200500 */  sll        $4, $5, 2
/* 12ECB0 0022EBB0 21208500 */  addu       $4, $4, $5
/* 12ECB4 0022EBB4 C0280400 */  sll        $5, $4, 3
/* 12ECB8 0022EBB8 7F000424 */  addiu      $4, $0, 0x7F
/* 12ECBC 0022EBBC 23208500 */  subu       $4, $4, $5
/* 12ECC0 0022EBC0 00008444 */  mtc1       $4, $f0
/* 12ECC4 0022EBC4 00000000 */  nop
/* 12ECC8 0022EBC8 20008046 */  cvt.s.w    $f0, $f0
/* 12ECCC 0022EBCC 1000C0E4 */  swc1       $f0, 0x10($6)
/* 12ECD0 0022EBD0 0200601C */  bgtz       $3, .L0022EBDC
/* 12ECD4 0022EBD4 00000000 */   nop
/* 12ECD8 0022EBD8 04000324 */  addiu      $3, $0, 0x4
.L0022EBDC:
/* 12ECDC 0022EBDC A897858F */  lw         $5, -0x6858($gp)
/* 12ECE0 0022EBE0 1800A0C4 */  lwc1       $f0, 0x18($5)
/* 12ECE4 0022EBE4 60008046 */  cvt.s.w    $f1, $f0
/* 12ECE8 0022EBE8 E442043C */  lui        $4, (0x42E40000 >> 16)
/* 12ECEC 0022EBEC 00008444 */  mtc1       $4, $f0
/* 12ECF0 0022EBF0 00000000 */  nop
/* 12ECF4 0022EBF4 42000146 */  mul.s      $f1, $f0, $f1
/* 12ECF8 0022EBF8 00008344 */  mtc1       $3, $f0
/* 12ECFC 0022EBFC 00000000 */  nop
/* 12ED00 0022EC00 20008046 */  cvt.s.w    $f0, $f0
/* 12ED04 0022EC04 43080046 */  div.s      $f1, $f1, $f0
/* 12ED08 0022EC08 0C43033C */  lui        $3, (0x430C0000 >> 16)
/* 12ED0C 0022EC0C 00008344 */  mtc1       $3, $f0
/* 12ED10 0022EC10 00000000 */  nop
/* 12ED14 0022EC14 00000146 */  add.s      $f0, $f0, $f1
/* 12ED18 0022EC18 1400A0E4 */  swc1       $f0, 0x14($5)
/* 12ED1C 0022EC1C 12000010 */  b          .L0022EC68
/* 12ED20 0022EC20 00000000 */   nop
.L0022EC24:
/* 12ED24 0022EC24 2A08E600 */  slt        $at, $7, $6
/* 12ED28 0022EC28 0F002010 */  beqz       $at, .L0022EC68
/* 12ED2C 0022EC2C 00000000 */   nop
/* 12ED30 0022EC30 0700E104 */  bgez       $7, .L0022EC50
/* 12ED34 0022EC34 00000000 */   nop
/* 12ED38 0022EC38 283E0070 */  paddub     $7, $0, $0
/* 12ED3C 0022EC3C 04000010 */  b          .L0022EC50
/* 12ED40 0022EC40 00000000 */   nop
.L0022EC44:
/* 12ED44 0022EC44 0000838C */  lw         $3, 0x0($4)
/* 12ED48 0022EC48 FFFF6324 */  addiu      $3, $3, -0x1
/* 12ED4C 0022EC4C 000083AC */  sw         $3, 0x0($4)
.L0022EC50:
/* 12ED50 0022EC50 A897838F */  lw         $3, -0x6858($gp)
/* 12ED54 0022EC54 18006424 */  addiu      $4, $3, 0x18
/* 12ED58 0022EC58 1800638C */  lw         $3, 0x18($3)
/* 12ED5C 0022EC5C 2A18E300 */  slt        $3, $7, $3
/* 12ED60 0022EC60 F8FF6014 */  bnez       $3, .L0022EC44
/* 12ED64 0022EC64 00000000 */   nop
.L0022EC68:
/* 12ED68 0022EC68 1000BF7B */  lq         $31, 0x10($sp)
/* 12ED6C 0022EC6C 0000B07B */  lq         $16, 0x0($sp)
/* 12ED70 0022EC70 2000BD27 */  addiu      $sp, $sp, 0x20
/* 12ED74 0022EC74 0800E003 */  jr         $31
/* 12ED78 0022EC78 00000000 */   nop
/* 12ED7C 0022EC7C 00000000 */  nop
