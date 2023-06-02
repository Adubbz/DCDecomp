.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MakeMesWinTbl_value__6ClsMesFiPiPi
/* 4EA30 0014E930 20FFBD27 */  addiu      $sp, $sp, -0xE0
/* 4EA34 0014E934 5000BF7F */  sq         $31, 0x50($sp)
/* 4EA38 0014E938 4000B47F */  sq         $20, 0x40($sp)
/* 4EA3C 0014E93C 3000B37F */  sq         $19, 0x30($sp)
/* 4EA40 0014E940 2000B27F */  sq         $18, 0x20($sp)
/* 4EA44 0014E944 1000B17F */  sq         $17, 0x10($sp)
/* 4EA48 0014E948 0000B07F */  sq         $16, 0x0($sp)
/* 4EA4C 0014E94C 28A68070 */  paddub     $20, $4, $0
/* 4EA50 0014E950 289EC070 */  paddub     $19, $6, $0
/* 4EA54 0014E954 2896E070 */  paddub     $18, $7, $0
/* 4EA58 0014E958 3017838C */  lw         $3, 0x1730($4)
/* 4EA5C 0014E95C 06006014 */  bnez       $3, .L0014E978
/* 4EA60 0014E960 00000000 */   nop
/* 4EA64 0014E964 80180500 */  sll        $3, $5, 2
/* 4EA68 0014E968 21187400 */  addu       $3, $3, $20
/* 4EA6C 0014E96C 0817638C */  lw         $3, 0x1708($3)
/* 4EA70 0014E970 75006010 */  beqz       $3, .L0014EB48
/* 4EA74 0014E974 00000000 */   nop
.L0014E978:
/* 4EA78 0014E978 2C17828E */  lw         $2, 0x172C($20)
/* 4EA7C 0014E97C 0D004010 */  beqz       $2, .L0014E9B4
/* 4EA80 0014E980 00000000 */   nop
/* 4EA84 0014E984 80100500 */  sll        $2, $5, 2
/* 4EA88 0014E988 21105400 */  addu       $2, $2, $20
/* 4EA8C 0014E98C 0817468C */  lw         $6, 0x1708($2)
/* 4EA90 0014E990 0800C018 */  blez       $6, .L0014E9B4
/* 4EA94 0014E994 00000000 */   nop
/* 4EA98 0014E998 6000A427 */  addiu      $4, $sp, 0x60
/* 4EA9C 0014E99C 2A00023C */  lui        $2, %hi(_821)
/* 4EAA0 0014E9A0 689A4524 */  addiu      $5, $2, %lo(_821)
/* 4EAA4 0014E9A4 1614040C */  jal        sprintf
/* 4EAA8 0014E9A8 00000000 */   nop
/* 4EAAC 0014E9AC 09000010 */  b          .L0014E9D4
/* 4EAB0 0014E9B0 00000000 */   nop
.L0014E9B4:
/* 4EAB4 0014E9B4 80100500 */  sll        $2, $5, 2
/* 4EAB8 0014E9B8 21185400 */  addu       $3, $2, $20
/* 4EABC 0014E9BC 6000A427 */  addiu      $4, $sp, 0x60
/* 4EAC0 0014E9C0 2A00023C */  lui        $2, %hi(_822)
/* 4EAC4 0014E9C4 709A4524 */  addiu      $5, $2, %lo(_822)
/* 4EAC8 0014E9C8 0817668C */  lw         $6, 0x1708($3)
/* 4EACC 0014E9CC 1614040C */  jal        sprintf
/* 4EAD0 0014E9D0 00000000 */   nop
.L0014E9D4:
/* 4EAD4 0014E9D4 6000A427 */  addiu      $4, $sp, 0x60
/* 4EAD8 0014E9D8 A015040C */  jal        strlen
/* 4EADC 0014E9DC 00000000 */   nop
/* 4EAE0 0014E9E0 28864070 */  paddub     $16, $2, $0
/* 4EAE4 0014E9E4 288E0070 */  paddub     $17, $0, $0
/* 4EAE8 0014E9E8 54000010 */  b          .L0014EB3C
/* 4EAEC 0014E9EC 00000000 */   nop
.L0014E9F0:
/* 4EAF0 0014E9F0 FFFF0524 */  addiu      $5, $0, -0x1
/* 4EAF4 0014E9F4 21183D02 */  addu       $3, $17, $sp
/* 4EAF8 0014E9F8 60006480 */  lb         $4, 0x60($3)
/* 4EAFC 0014E9FC 2B000324 */  addiu      $3, $0, 0x2B
/* 4EB00 0014EA00 02008314 */  bne        $4, $3, .L0014EA0C
/* 4EB04 0014EA04 00000000 */   nop
/* 4EB08 0014EA08 5CFD0524 */  addiu      $5, $0, -0x2A4
.L0014EA0C:
/* 4EB0C 0014EA0C 2D000324 */  addiu      $3, $0, 0x2D
/* 4EB10 0014EA10 02008314 */  bne        $4, $3, .L0014EA1C
/* 4EB14 0014EA14 00000000 */   nop
/* 4EB18 0014EA18 5DFD0524 */  addiu      $5, $0, -0x2A3
.L0014EA1C:
/* 4EB1C 0014EA1C 31000324 */  addiu      $3, $0, 0x31
/* 4EB20 0014EA20 02008314 */  bne        $4, $3, .L0014EA2C
/* 4EB24 0014EA24 00000000 */   nop
/* 4EB28 0014EA28 70FD0524 */  addiu      $5, $0, -0x290
.L0014EA2C:
/* 4EB2C 0014EA2C 32000324 */  addiu      $3, $0, 0x32
/* 4EB30 0014EA30 02008314 */  bne        $4, $3, .L0014EA3C
/* 4EB34 0014EA34 00000000 */   nop
/* 4EB38 0014EA38 71FD0524 */  addiu      $5, $0, -0x28F
.L0014EA3C:
/* 4EB3C 0014EA3C 33000324 */  addiu      $3, $0, 0x33
/* 4EB40 0014EA40 02008314 */  bne        $4, $3, .L0014EA4C
/* 4EB44 0014EA44 00000000 */   nop
/* 4EB48 0014EA48 72FD0524 */  addiu      $5, $0, -0x28E
.L0014EA4C:
/* 4EB4C 0014EA4C 34000324 */  addiu      $3, $0, 0x34
/* 4EB50 0014EA50 02008314 */  bne        $4, $3, .L0014EA5C
/* 4EB54 0014EA54 00000000 */   nop
/* 4EB58 0014EA58 73FD0524 */  addiu      $5, $0, -0x28D
.L0014EA5C:
/* 4EB5C 0014EA5C 35000324 */  addiu      $3, $0, 0x35
/* 4EB60 0014EA60 02008314 */  bne        $4, $3, .L0014EA6C
/* 4EB64 0014EA64 00000000 */   nop
/* 4EB68 0014EA68 74FD0524 */  addiu      $5, $0, -0x28C
.L0014EA6C:
/* 4EB6C 0014EA6C 36000324 */  addiu      $3, $0, 0x36
/* 4EB70 0014EA70 02008314 */  bne        $4, $3, .L0014EA7C
/* 4EB74 0014EA74 00000000 */   nop
/* 4EB78 0014EA78 75FD0524 */  addiu      $5, $0, -0x28B
.L0014EA7C:
/* 4EB7C 0014EA7C 37000324 */  addiu      $3, $0, 0x37
/* 4EB80 0014EA80 02008314 */  bne        $4, $3, .L0014EA8C
/* 4EB84 0014EA84 00000000 */   nop
/* 4EB88 0014EA88 76FD0524 */  addiu      $5, $0, -0x28A
.L0014EA8C:
/* 4EB8C 0014EA8C 38000324 */  addiu      $3, $0, 0x38
/* 4EB90 0014EA90 02008314 */  bne        $4, $3, .L0014EA9C
/* 4EB94 0014EA94 00000000 */   nop
/* 4EB98 0014EA98 77FD0524 */  addiu      $5, $0, -0x289
.L0014EA9C:
/* 4EB9C 0014EA9C 39000324 */  addiu      $3, $0, 0x39
/* 4EBA0 0014EAA0 02008314 */  bne        $4, $3, .L0014EAAC
/* 4EBA4 0014EAA4 00000000 */   nop
/* 4EBA8 0014EAA8 78FD0524 */  addiu      $5, $0, -0x288
.L0014EAAC:
/* 4EBAC 0014EAAC 30000324 */  addiu      $3, $0, 0x30
/* 4EBB0 0014EAB0 02008314 */  bne        $4, $3, .L0014EABC
/* 4EBB4 0014EAB4 00000000 */   nop
/* 4EBB8 0014EAB8 6FFD0524 */  addiu      $5, $0, -0x291
.L0014EABC:
/* 4EBBC 0014EABC FFFF0324 */  addiu      $3, $0, -0x1
/* 4EBC0 0014EAC0 1D00A310 */  beq        $5, $3, .L0014EB38
/* 4EBC4 0014EAC4 00000000 */   nop
/* 4EBC8 0014EAC8 3417828E */  lw         $2, 0x1734($20)
/* 4EBCC 0014EACC 10004010 */  beqz       $2, .L0014EB10
/* 4EBD0 0014EAD0 00000000 */   nop
/* 4EBD4 0014EAD4 00006786 */  lh         $7, 0x0($19)
/* 4EBD8 0014EAD8 00004886 */  lh         $8, 0x0($18)
/* 4EBDC 0014EADC 28268072 */  paddub     $4, $20, $0
/* 4EBE0 0014EAE0 28360070 */  paddub     $6, $0, $0
/* 4EBE4 0014EAE4 783D050C */  jal        SetMesWinTbl__6ClsMesFiiss
/* 4EBE8 0014EAE8 00000000 */   nop
/* 4EBEC 0014EAEC 0800838E */  lw         $3, 0x8($20)
/* 4EBF0 0014EAF0 83200300 */  sra        $4, $3, 2
/* 4EBF4 0014EAF4 40180400 */  sll        $3, $4, 1
/* 4EBF8 0014EAF8 21206400 */  addu       $4, $3, $4
/* 4EBFC 0014EAFC 0000638E */  lw         $3, 0x0($19)
/* 4EC00 0014EB00 21186400 */  addu       $3, $3, $4
/* 4EC04 0014EB04 000063AE */  sw         $3, 0x0($19)
/* 4EC08 0014EB08 0B000010 */  b          .L0014EB38
/* 4EC0C 0014EB0C 00000000 */   nop
.L0014EB10:
/* 4EC10 0014EB10 00006786 */  lh         $7, 0x0($19)
/* 4EC14 0014EB14 00004886 */  lh         $8, 0x0($18)
/* 4EC18 0014EB18 28268072 */  paddub     $4, $20, $0
/* 4EC1C 0014EB1C 28360070 */  paddub     $6, $0, $0
/* 4EC20 0014EB20 783D050C */  jal        SetMesWinTbl__6ClsMesFiiss
/* 4EC24 0014EB24 00000000 */   nop
/* 4EC28 0014EB28 0000648E */  lw         $4, 0x0($19)
/* 4EC2C 0014EB2C 0800838E */  lw         $3, 0x8($20)
/* 4EC30 0014EB30 21188300 */  addu       $3, $4, $3
/* 4EC34 0014EB34 000063AE */  sw         $3, 0x0($19)
.L0014EB38:
/* 4EC38 0014EB38 01003126 */  addiu      $17, $17, 0x1
.L0014EB3C:
/* 4EC3C 0014EB3C 2A183002 */  slt        $3, $17, $16
/* 4EC40 0014EB40 ABFF6014 */  bnez       $3, .L0014E9F0
/* 4EC44 0014EB44 00000000 */   nop
.L0014EB48:
/* 4EC48 0014EB48 5000BF7B */  lq         $31, 0x50($sp)
/* 4EC4C 0014EB4C 4000B47B */  lq         $20, 0x40($sp)
/* 4EC50 0014EB50 3000B37B */  lq         $19, 0x30($sp)
/* 4EC54 0014EB54 2000B27B */  lq         $18, 0x20($sp)
/* 4EC58 0014EB58 1000B17B */  lq         $17, 0x10($sp)
/* 4EC5C 0014EB5C 0000B07B */  lq         $16, 0x0($sp)
/* 4EC60 0014EB60 E000BD27 */  addiu      $sp, $sp, 0xE0
/* 4EC64 0014EB64 0800E003 */  jr         $31
/* 4EC68 0014EB68 00000000 */   nop
/* 4EC6C 0014EB6C 00000000 */  nop
