.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LocalWeaponDataChange__FPciii
/* 10FCE0 0020FBE0 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 10FCE4 0020FBE4 5000BF7F */  sq         $31, 0x50($sp)
/* 10FCE8 0020FBE8 4000B47F */  sq         $20, 0x40($sp)
/* 10FCEC 0020FBEC 3000B37F */  sq         $19, 0x30($sp)
/* 10FCF0 0020FBF0 2000B27F */  sq         $18, 0x20($sp)
/* 10FCF4 0020FBF4 1000B17F */  sq         $17, 0x10($sp)
/* 10FCF8 0020FBF8 0000B07F */  sq         $16, 0x0($sp)
/* 10FCFC 0020FBFC 288E8070 */  paddub     $17, $4, $0
/* 10FD00 0020FC00 2886A070 */  paddub     $16, $5, $0
/* 10FD04 0020FC04 28A6C070 */  paddub     $20, $6, $0
/* 10FD08 0020FC08 289EE070 */  paddub     $19, $7, $0
/* 10FD0C 0020FC0C 07002016 */  bnez       $17, .L0020FC2C
/* 10FD10 0020FC10 00000000 */   nop
/* 10FD14 0020FC14 2A00023C */  lui        $2, %hi(_1549_2)
/* 10FD18 0020FC18 F0E14424 */  addiu      $4, $2, %lo(_1549_2)
/* 10FD1C 0020FC1C A611040C */  jal        printf
/* 10FD20 0020FC20 00000000 */   nop
/* 10FD24 0020FC24 23000010 */  b          .L0020FCB4
/* 10FD28 0020FC28 00000000 */   nop
.L0020FC2C:
/* 10FD2C 0020FC2C BE11040C */  jal        rand
/* 10FD30 0020FC30 00000000 */   nop
/* 10FD34 0020FC34 1A005000 */  div        $0, $2, $16
/* 10FD38 0020FC38 02000016 */  bnez       $16, .L0020FC44
/* 10FD3C 0020FC3C 00000000 */   nop
/* 10FD40 0020FC40 CD010000 */  break      0, 7
.L0020FC44:
/* 10FD44 0020FC44 10900000 */  mfhi       $18
/* 10FD48 0020FC48 BE11040C */  jal        rand
/* 10FD4C 0020FC4C 00000000 */   nop
/* 10FD50 0020FC50 1A005300 */  div        $0, $2, $19
/* 10FD54 0020FC54 02006016 */  bnez       $19, .L0020FC60
/* 10FD58 0020FC58 00000000 */   nop
/* 10FD5C 0020FC5C CD010000 */  break      0, 7
.L0020FC60:
/* 10FD60 0020FC60 10180000 */  mfhi       $3
/* 10FD64 0020FC64 21208302 */  addu       $4, $20, $3
/* 10FD68 0020FC68 282E0070 */  paddub     $5, $0, $0
/* 10FD6C 0020FC6C 0E000010 */  b          .L0020FCA8
/* 10FD70 0020FC70 00000000 */   nop
.L0020FC74:
/* 10FD74 0020FC74 0A00B214 */  bne        $5, $18, .L0020FCA0
/* 10FD78 0020FC78 00000000 */   nop
/* 10FD7C 0020FC7C 00002382 */  lb         $3, 0x0($17)
/* 10FD80 0020FC80 23186400 */  subu       $3, $3, $4
/* 10FD84 0020FC84 000023A2 */  sb         $3, 0x0($17)
/* 10FD88 0020FC88 00002382 */  lb         $3, 0x0($17)
/* 10FD8C 0020FC8C 09006104 */  bgez       $3, .L0020FCB4
/* 10FD90 0020FC90 00000000 */   nop
/* 10FD94 0020FC94 000020A2 */  sb         $0, 0x0($17)
/* 10FD98 0020FC98 06000010 */  b          .L0020FCB4
/* 10FD9C 0020FC9C 00000000 */   nop
.L0020FCA0:
/* 10FDA0 0020FCA0 0100A524 */  addiu      $5, $5, 0x1
/* 10FDA4 0020FCA4 01003126 */  addiu      $17, $17, 0x1
.L0020FCA8:
/* 10FDA8 0020FCA8 2A18B000 */  slt        $3, $5, $16
/* 10FDAC 0020FCAC F1FF6014 */  bnez       $3, .L0020FC74
/* 10FDB0 0020FCB0 00000000 */   nop
.L0020FCB4:
/* 10FDB4 0020FCB4 5000BF7B */  lq         $31, 0x50($sp)
/* 10FDB8 0020FCB8 4000B47B */  lq         $20, 0x40($sp)
/* 10FDBC 0020FCBC 3000B37B */  lq         $19, 0x30($sp)
/* 10FDC0 0020FCC0 2000B27B */  lq         $18, 0x20($sp)
/* 10FDC4 0020FCC4 1000B17B */  lq         $17, 0x10($sp)
/* 10FDC8 0020FCC8 0000B07B */  lq         $16, 0x0($sp)
/* 10FDCC 0020FCCC 6000BD27 */  addiu      $sp, $sp, 0x60
/* 10FDD0 0020FCD0 0800E003 */  jr         $31
/* 10FDD4 0020FCD4 00000000 */   nop
/* 10FDD8 0020FCD8 00000000 */  nop
/* 10FDDC 0020FCDC 00000000 */  nop
