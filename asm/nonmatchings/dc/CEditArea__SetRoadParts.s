.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetRoadParts__9CEditAreaFii
/* 6E9B0 0016E8B0 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 6E9B4 0016E8B4 5000BF7F */  sq         $31, 0x50($sp)
/* 6E9B8 0016E8B8 4000B47F */  sq         $20, 0x40($sp)
/* 6E9BC 0016E8BC 3000B37F */  sq         $19, 0x30($sp)
/* 6E9C0 0016E8C0 2000B27F */  sq         $18, 0x20($sp)
/* 6E9C4 0016E8C4 1000B17F */  sq         $17, 0x10($sp)
/* 6E9C8 0016E8C8 0000B07F */  sq         $16, 0x0($sp)
/* 6E9CC 0016E8CC 28A68070 */  paddub     $20, $4, $0
/* 6E9D0 0016E8D0 289EA070 */  paddub     $19, $5, $0
/* 6E9D4 0016E8D4 2896C070 */  paddub     $18, $6, $0
/* 6E9D8 0016E8D8 05006006 */  bltz       $19, .L0016E8F0
/* 6E9DC 0016E8DC 00000000 */   nop
/* 6E9E0 0016E8E0 0800828E */  lw         $2, 0x8($20)
/* 6E9E4 0016E8E4 2A106202 */  slt        $2, $19, $2
/* 6E9E8 0016E8E8 04004014 */  bnez       $2, .L0016E8FC
/* 6E9EC 0016E8EC 00000000 */   nop
.L0016E8F0:
/* 6E9F0 0016E8F0 FFFF0224 */  addiu      $2, $0, -0x1
/* 6E9F4 0016E8F4 B0000010 */  b          .L0016EBB8
/* 6E9F8 0016E8F8 00000000 */   nop
.L0016E8FC:
/* 6E9FC 0016E8FC 05004006 */  bltz       $18, .L0016E914
/* 6EA00 0016E900 00000000 */   nop
/* 6EA04 0016E904 0C00828E */  lw         $2, 0xC($20)
/* 6EA08 0016E908 2A104202 */  slt        $2, $18, $2
/* 6EA0C 0016E90C 04004014 */  bnez       $2, .L0016E920
/* 6EA10 0016E910 00000000 */   nop
.L0016E914:
/* 6EA14 0016E914 FFFF0224 */  addiu      $2, $0, -0x1
/* 6EA18 0016E918 A7000010 */  b          .L0016EBB8
/* 6EA1C 0016E91C 00000000 */   nop
.L0016E920:
/* 6EA20 0016E920 A4B7050C */  jal        GetPartsExtra__9CEditAreaFii
/* 6EA24 0016E924 00000000 */   nop
/* 6EA28 0016E928 01000324 */  addiu      $3, $0, 0x1
/* 6EA2C 0016E92C 04004310 */  beq        $2, $3, .L0016E940
/* 6EA30 0016E930 00000000 */   nop
/* 6EA34 0016E934 FFFF0224 */  addiu      $2, $0, -0x1
/* 6EA38 0016E938 9F000010 */  b          .L0016EBB8
/* 6EA3C 0016E93C 00000000 */   nop
.L0016E940:
/* 6EA40 0016E940 FFFF4626 */  addiu      $6, $18, -0x1
/* 6EA44 0016E944 28268072 */  paddub     $4, $20, $0
/* 6EA48 0016E948 282E6072 */  paddub     $5, $19, $0
/* 6EA4C 0016E94C A4B7050C */  jal        GetPartsExtra__9CEditAreaFii
/* 6EA50 0016E950 00000000 */   nop
/* 6EA54 0016E954 01004238 */  xori       $2, $2, 0x1
/* 6EA58 0016E958 0100422C */  sltiu      $2, $2, 0x1
/* 6EA5C 0016E95C 6000A2AF */  sw         $2, 0x60($sp)
/* 6EA60 0016E960 01006526 */  addiu      $5, $19, 0x1
/* 6EA64 0016E964 28268072 */  paddub     $4, $20, $0
/* 6EA68 0016E968 28364072 */  paddub     $6, $18, $0
/* 6EA6C 0016E96C A4B7050C */  jal        GetPartsExtra__9CEditAreaFii
/* 6EA70 0016E970 00000000 */   nop
/* 6EA74 0016E974 01004238 */  xori       $2, $2, 0x1
/* 6EA78 0016E978 0100422C */  sltiu      $2, $2, 0x1
/* 6EA7C 0016E97C 6400B027 */  addiu      $16, $sp, 0x64
/* 6EA80 0016E980 000002AE */  sw         $2, 0x0($16)
/* 6EA84 0016E984 01004626 */  addiu      $6, $18, 0x1
/* 6EA88 0016E988 28268072 */  paddub     $4, $20, $0
/* 6EA8C 0016E98C 282E6072 */  paddub     $5, $19, $0
/* 6EA90 0016E990 A4B7050C */  jal        GetPartsExtra__9CEditAreaFii
/* 6EA94 0016E994 00000000 */   nop
/* 6EA98 0016E998 01004238 */  xori       $2, $2, 0x1
/* 6EA9C 0016E99C 0100422C */  sltiu      $2, $2, 0x1
/* 6EAA0 0016E9A0 6800B127 */  addiu      $17, $sp, 0x68
/* 6EAA4 0016E9A4 000022AE */  sw         $2, 0x0($17)
/* 6EAA8 0016E9A8 FFFF6526 */  addiu      $5, $19, -0x1
/* 6EAAC 0016E9AC 28268072 */  paddub     $4, $20, $0
/* 6EAB0 0016E9B0 28364072 */  paddub     $6, $18, $0
/* 6EAB4 0016E9B4 A4B7050C */  jal        GetPartsExtra__9CEditAreaFii
/* 6EAB8 0016E9B8 00000000 */   nop
/* 6EABC 0016E9BC 01004238 */  xori       $2, $2, 0x1
/* 6EAC0 0016E9C0 0100422C */  sltiu      $2, $2, 0x1
/* 6EAC4 0016E9C4 6C00A527 */  addiu      $5, $sp, 0x6C
/* 6EAC8 0016E9C8 0000A2AC */  sw         $2, 0x0($5)
/* 6EACC 0016E9CC 28160070 */  paddub     $2, $0, $0
/* 6EAD0 0016E9D0 28260070 */  paddub     $4, $0, $0
/* 6EAD4 0016E9D4 06000010 */  b          .L0016E9F0
/* 6EAD8 0016E9D8 00000000 */   nop
.L0016E9DC:
/* 6EADC 0016E9DC 80180400 */  sll        $3, $4, 2
/* 6EAE0 0016E9E0 21187D00 */  addu       $3, $3, $sp
/* 6EAE4 0016E9E4 6000638C */  lw         $3, 0x60($3)
/* 6EAE8 0016E9E8 21104300 */  addu       $2, $2, $3
/* 6EAEC 0016E9EC 01008424 */  addiu      $4, $4, 0x1
.L0016E9F0:
/* 6EAF0 0016E9F0 04008328 */  slti       $3, $4, 0x4
/* 6EAF4 0016E9F4 F9FF6014 */  bnez       $3, .L0016E9DC
/* 6EAF8 0016E9F8 00000000 */   nop
/* 6EAFC 0016E9FC FFFF0324 */  addiu      $3, $0, -0x1
/* 6EB00 0016EA00 28260070 */  paddub     $4, $0, $0
/* 6EB04 0016EA04 04000624 */  addiu      $6, $0, 0x4
/* 6EB08 0016EA08 02004614 */  bne        $2, $6, .L0016EA14
/* 6EB0C 0016EA0C 00000000 */   nop
/* 6EB10 0016EA10 281EC070 */  paddub     $3, $6, $0
.L0016EA14:
/* 6EB14 0016EA14 03000624 */  addiu      $6, $0, 0x3
/* 6EB18 0016EA18 12004614 */  bne        $2, $6, .L0016EA64
/* 6EB1C 0016EA1C 00000000 */   nop
/* 6EB20 0016EA20 281EC070 */  paddub     $3, $6, $0
/* 6EB24 0016EA24 6000A68F */  lw         $6, 0x60($sp)
/* 6EB28 0016EA28 0200C014 */  bnez       $6, .L0016EA34
/* 6EB2C 0016EA2C 00000000 */   nop
/* 6EB30 0016EA30 28260070 */  paddub     $4, $0, $0
.L0016EA34:
/* 6EB34 0016EA34 0000068E */  lw         $6, 0x0($16)
/* 6EB38 0016EA38 0200C014 */  bnez       $6, .L0016EA44
/* 6EB3C 0016EA3C 00000000 */   nop
/* 6EB40 0016EA40 03000424 */  addiu      $4, $0, 0x3
.L0016EA44:
/* 6EB44 0016EA44 0000268E */  lw         $6, 0x0($17)
/* 6EB48 0016EA48 0200C014 */  bnez       $6, .L0016EA54
/* 6EB4C 0016EA4C 00000000 */   nop
/* 6EB50 0016EA50 02000424 */  addiu      $4, $0, 0x2
.L0016EA54:
/* 6EB54 0016EA54 0000A68C */  lw         $6, 0x0($5)
/* 6EB58 0016EA58 0200C014 */  bnez       $6, .L0016EA64
/* 6EB5C 0016EA5C 00000000 */   nop
/* 6EB60 0016EA60 01000424 */  addiu      $4, $0, 0x1
.L0016EA64:
/* 6EB64 0016EA64 02000624 */  addiu      $6, $0, 0x2
/* 6EB68 0016EA68 33004614 */  bne        $2, $6, .L0016EB38
/* 6EB6C 0016EA6C 00000000 */   nop
/* 6EB70 0016EA70 6000A38F */  lw         $3, 0x60($sp)
/* 6EB74 0016EA74 04006010 */  beqz       $3, .L0016EA88
/* 6EB78 0016EA78 00000000 */   nop
/* 6EB7C 0016EA7C 0000238E */  lw         $3, 0x0($17)
/* 6EB80 0016EA80 07006014 */  bnez       $3, .L0016EAA0
/* 6EB84 0016EA84 00000000 */   nop
.L0016EA88:
/* 6EB88 0016EA88 0000078E */  lw         $7, 0x0($16)
/* 6EB8C 0016EA8C 0F00E010 */  beqz       $7, .L0016EACC
/* 6EB90 0016EA90 00000000 */   nop
/* 6EB94 0016EA94 0000A38C */  lw         $3, 0x0($5)
/* 6EB98 0016EA98 0C006010 */  beqz       $3, .L0016EACC
/* 6EB9C 0016EA9C 00000000 */   nop
.L0016EAA0:
/* 6EBA0 0016EAA0 02000324 */  addiu      $3, $0, 0x2
/* 6EBA4 0016EAA4 6000A68F */  lw         $6, 0x60($sp)
/* 6EBA8 0016EAA8 0200C010 */  beqz       $6, .L0016EAB4
/* 6EBAC 0016EAAC 00000000 */   nop
/* 6EBB0 0016EAB0 28260070 */  paddub     $4, $0, $0
.L0016EAB4:
/* 6EBB4 0016EAB4 0000068E */  lw         $6, 0x0($16)
/* 6EBB8 0016EAB8 1F00C010 */  beqz       $6, .L0016EB38
/* 6EBBC 0016EABC 00000000 */   nop
/* 6EBC0 0016EAC0 01000424 */  addiu      $4, $0, 0x1
/* 6EBC4 0016EAC4 1C000010 */  b          .L0016EB38
/* 6EBC8 0016EAC8 00000000 */   nop
.L0016EACC:
/* 6EBCC 0016EACC 01000324 */  addiu      $3, $0, 0x1
/* 6EBD0 0016EAD0 0500E010 */  beqz       $7, .L0016EAE8
/* 6EBD4 0016EAD4 00000000 */   nop
/* 6EBD8 0016EAD8 0000268E */  lw         $6, 0x0($17)
/* 6EBDC 0016EADC 0200C010 */  beqz       $6, .L0016EAE8
/* 6EBE0 0016EAE0 00000000 */   nop
/* 6EBE4 0016EAE4 28260070 */  paddub     $4, $0, $0
.L0016EAE8:
/* 6EBE8 0016EAE8 0000268E */  lw         $6, 0x0($17)
/* 6EBEC 0016EAEC 0500C010 */  beqz       $6, .L0016EB04
/* 6EBF0 0016EAF0 00000000 */   nop
/* 6EBF4 0016EAF4 0000A68C */  lw         $6, 0x0($5)
/* 6EBF8 0016EAF8 0200C010 */  beqz       $6, .L0016EB04
/* 6EBFC 0016EAFC 00000000 */   nop
/* 6EC00 0016EB00 03000424 */  addiu      $4, $0, 0x3
.L0016EB04:
/* 6EC04 0016EB04 0000A68C */  lw         $6, 0x0($5)
/* 6EC08 0016EB08 0500C010 */  beqz       $6, .L0016EB20
/* 6EC0C 0016EB0C 00000000 */   nop
/* 6EC10 0016EB10 6000A68F */  lw         $6, 0x60($sp)
/* 6EC14 0016EB14 0200C010 */  beqz       $6, .L0016EB20
/* 6EC18 0016EB18 00000000 */   nop
/* 6EC1C 0016EB1C 02000424 */  addiu      $4, $0, 0x2
.L0016EB20:
/* 6EC20 0016EB20 6000A68F */  lw         $6, 0x60($sp)
/* 6EC24 0016EB24 0400C010 */  beqz       $6, .L0016EB38
/* 6EC28 0016EB28 00000000 */   nop
/* 6EC2C 0016EB2C 0200E010 */  beqz       $7, .L0016EB38
/* 6EC30 0016EB30 00000000 */   nop
/* 6EC34 0016EB34 01000424 */  addiu      $4, $0, 0x1
.L0016EB38:
/* 6EC38 0016EB38 01000624 */  addiu      $6, $0, 0x1
/* 6EC3C 0016EB3C 12004614 */  bne        $2, $6, .L0016EB88
/* 6EC40 0016EB40 00000000 */   nop
/* 6EC44 0016EB44 06000324 */  addiu      $3, $0, 0x6
/* 6EC48 0016EB48 6000A68F */  lw         $6, 0x60($sp)
/* 6EC4C 0016EB4C 0200C010 */  beqz       $6, .L0016EB58
/* 6EC50 0016EB50 00000000 */   nop
/* 6EC54 0016EB54 02000424 */  addiu      $4, $0, 0x2
.L0016EB58:
/* 6EC58 0016EB58 0000068E */  lw         $6, 0x0($16)
/* 6EC5C 0016EB5C 0200C010 */  beqz       $6, .L0016EB68
/* 6EC60 0016EB60 00000000 */   nop
/* 6EC64 0016EB64 01000424 */  addiu      $4, $0, 0x1
.L0016EB68:
/* 6EC68 0016EB68 0000268E */  lw         $6, 0x0($17)
/* 6EC6C 0016EB6C 0200C010 */  beqz       $6, .L0016EB78
/* 6EC70 0016EB70 00000000 */   nop
/* 6EC74 0016EB74 28260070 */  paddub     $4, $0, $0
.L0016EB78:
/* 6EC78 0016EB78 0000A58C */  lw         $5, 0x0($5)
/* 6EC7C 0016EB7C 0200A010 */  beqz       $5, .L0016EB88
/* 6EC80 0016EB80 00000000 */   nop
/* 6EC84 0016EB84 03000424 */  addiu      $4, $0, 0x3
.L0016EB88:
/* 6EC88 0016EB88 02004014 */  bnez       $2, .L0016EB94
/* 6EC8C 0016EB8C 00000000 */   nop
/* 6EC90 0016EB90 05000324 */  addiu      $3, $0, 0x5
.L0016EB94:
/* 6EC94 0016EB94 04006104 */  bgez       $3, .L0016EBA8
/* 6EC98 0016EB98 00000000 */   nop
/* 6EC9C 0016EB9C FFFF0224 */  addiu      $2, $0, -0x1
/* 6ECA0 0016EBA0 05000010 */  b          .L0016EBB8
/* 6ECA4 0016EBA4 00000000 */   nop
.L0016EBA8:
/* 6ECA8 0016EBA8 00110300 */  sll        $2, $3, 4
/* 6ECAC 0016EBAC F00F4330 */  andi       $3, $2, 0xFF0
/* 6ECB0 0016EBB0 0F008230 */  andi       $2, $4, 0xF
/* 6ECB4 0016EBB4 25106200 */  or         $2, $3, $2
.L0016EBB8:
/* 6ECB8 0016EBB8 5000BF7B */  lq         $31, 0x50($sp)
/* 6ECBC 0016EBBC 4000B47B */  lq         $20, 0x40($sp)
/* 6ECC0 0016EBC0 3000B37B */  lq         $19, 0x30($sp)
/* 6ECC4 0016EBC4 2000B27B */  lq         $18, 0x20($sp)
/* 6ECC8 0016EBC8 1000B17B */  lq         $17, 0x10($sp)
/* 6ECCC 0016EBCC 0000B07B */  lq         $16, 0x0($sp)
/* 6ECD0 0016EBD0 7000BD27 */  addiu      $sp, $sp, 0x70
/* 6ECD4 0016EBD4 0800E003 */  jr         $31
/* 6ECD8 0016EBD8 00000000 */   nop
/* 6ECDC 0016EBDC 00000000 */  nop
