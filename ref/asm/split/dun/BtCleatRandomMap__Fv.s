.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BtCleatRandomMap__Fv
/* 00CA90 01DB8790 F0FFBD27 */  addiu       $29, $29, -0x10
/* 00CA94 01DB8794 0000BF7F */  sq          $31, 0x0($29)
/* 00CA98 01DB8798 DC01023C */  lui         $2, %hi(MainDungeonMap)
/* 00CA9C 01DB879C E04B4224 */  addiu       $2, $2, %lo(MainDungeonMap)
/* 00CAA0 01DB87A0 C89C82AF */  sw          $2, -0x6338($28)
/* 00CAA4 01DB87A4 DF01023C */  lui         $2, %hi(DngEventMan)
/* 00CAA8 01DB87A8 B0364224 */  addiu       $2, $2, %lo(DngEventMan)
/* 00CAAC 01DB87AC D09C82AF */  sw          $2, -0x6330($28)
/* 00CAB0 01DB87B0 789C848F */  lw          $4, -0x6388($28)
/* 00CAB4 01DB87B4 F0F6060C */  jal         LostGateKey__14CDngStatusDataFv
/* 00CAB8 01DB87B8 00000000 */   nop
/* 00CABC 01DB87BC D09C858F */  lw          $5, -0x6330($28)
/* 00CAC0 01DB87C0 28260070 */  paddub      $4, $0, $0
/* 00CAC4 01DB87C4 0A000010 */  b           .L01DB87F0_2F3DF0
/* 00CAC8 01DB87C8 00000000 */   nop
.L01DB87CC_2F3DCC:
/* 00CACC 01DB87CC 80110400 */  sll         $2, $4, 6
/* 00CAD0 01DB87D0 2118A200 */  addu        $3, $5, $2
/* 00CAD4 01DB87D4 001060AC */  sw          $0, 0x1000($3)
/* 00CAD8 01DB87D8 341060AC */  sw          $0, 0x1034($3)
/* 00CADC 01DB87DC 381060AC */  sw          $0, 0x1038($3)
/* 00CAE0 01DB87E0 301060AC */  sw          $0, 0x1030($3)
/* 00CAE4 01DB87E4 FFFF0224 */  addiu       $2, $0, -0x1
/* 00CAE8 01DB87E8 3C1062AC */  sw          $2, 0x103C($3)
/* 00CAEC 01DB87EC 01008424 */  addiu       $4, $4, 0x1
.L01DB87F0_2F3DF0:
/* 00CAF0 01DB87F0 60008228 */  slti        $2, $4, 0x60
/* 00CAF4 01DB87F4 F5FF4014 */  bnez        $2, .L01DB87CC_2F3DCC
/* 00CAF8 01DB87F8 00000000 */   nop
/* 00CAFC 01DB87FC C89C858F */  lw          $5, -0x6338($28)
/* 00CB00 01DB8800 28260070 */  paddub      $4, $0, $0
/* 00CB04 01DB8804 0D000010 */  b           .L01DB883C_2F3E3C
/* 00CB08 01DB8808 00000000 */   nop
.L01DB880C_2F3E0C:
/* 00CB0C 01DB880C FFFF0324 */  addiu       $3, $0, -0x1
/* 00CB10 01DB8810 80100400 */  sll         $2, $4, 2
/* 00CB14 01DB8814 21104400 */  addu        $2, $2, $4
/* 00CB18 01DB8818 00110200 */  sll         $2, $2, 4
/* 00CB1C 01DB881C 21104500 */  addu        $2, $2, $5
/* 00CB20 01DB8820 0100013C */  lui         $1, (0x10000 >> 16)
/* 00CB24 01DB8824 21084100 */  addu        $1, $2, $1
/* 00CB28 01DB8828 588D23AC */  sw          $3, -0x72A8($1)
/* 00CB2C 01DB882C 0100013C */  lui         $1, (0x10000 >> 16)
/* 00CB30 01DB8830 21084100 */  addu        $1, $2, $1
/* 00CB34 01DB8834 7C8D20AC */  sw          $0, -0x7284($1)
/* 00CB38 01DB8838 01008424 */  addiu       $4, $4, 0x1
.L01DB883C_2F3E3C:
/* 00CB3C 01DB883C 30008228 */  slti        $2, $4, 0x30
/* 00CB40 01DB8840 F2FF4014 */  bnez        $2, .L01DB880C_2F3E0C
/* 00CB44 01DB8844 00000000 */   nop
/* 00CB48 01DB8848 28260070 */  paddub      $4, $0, $0
/* 00CB4C 01DB884C 0D000010 */  b           .L01DB8884_2F3E84
/* 00CB50 01DB8850 00000000 */   nop
.L01DB8854_2F3E54:
/* 00CB54 01DB8854 80110400 */  sll         $2, $4, 6
/* 00CB58 01DB8858 21104500 */  addu        $2, $2, $5
/* 00CB5C 01DB885C 0100013C */  lui         $1, (0x10000 >> 16)
/* 00CB60 01DB8860 21084100 */  addu        $1, $2, $1
/* 00CB64 01DB8864 60B620AC */  sw          $0, -0x49A0($1)
/* 00CB68 01DB8868 0100013C */  lui         $1, (0x10000 >> 16)
/* 00CB6C 01DB886C 21084100 */  addu        $1, $2, $1
/* 00CB70 01DB8870 8CB620AC */  sw          $0, -0x4974($1)
/* 00CB74 01DB8874 0100013C */  lui         $1, (0x10000 >> 16)
/* 00CB78 01DB8878 21084100 */  addu        $1, $2, $1
/* 00CB7C 01DB887C 90B620AC */  sw          $0, -0x4970($1)
/* 00CB80 01DB8880 01008424 */  addiu       $4, $4, 0x1
.L01DB8884_2F3E84:
/* 00CB84 01DB8884 18008228 */  slti        $2, $4, 0x18
/* 00CB88 01DB8888 F2FF4014 */  bnez        $2, .L01DB8854_2F3E54
/* 00CB8C 01DB888C 00000000 */   nop
/* 00CB90 01DB8890 0100013C */  lui         $1, (0x10000 >> 16)
/* 00CB94 01DB8894 2108A100 */  addu        $1, $5, $1
/* 00CB98 01DB8898 60BC20AC */  sw          $0, -0x43A0($1)
/* 00CB9C 01DB889C 28260070 */  paddub      $4, $0, $0
/* 00CBA0 01DB88A0 07000010 */  b           .L01DB88C0_2F3EC0
/* 00CBA4 01DB88A4 00000000 */   nop
.L01DB88A8_2F3EA8:
/* 00CBA8 01DB88A8 40110400 */  sll         $2, $4, 5
/* 00CBAC 01DB88AC 21104500 */  addu        $2, $2, $5
/* 00CBB0 01DB88B0 0100013C */  lui         $1, (0x10000 >> 16)
/* 00CBB4 01DB88B4 21084100 */  addu        $1, $2, $1
/* 00CBB8 01DB88B8 94BC20AC */  sw          $0, -0x436C($1)
/* 00CBBC 01DB88BC 01008424 */  addiu       $4, $4, 0x1
.L01DB88C0_2F3EC0:
/* 00CBC0 01DB88C0 08008228 */  slti        $2, $4, 0x8
/* 00CBC4 01DB88C4 F8FF4014 */  bnez        $2, .L01DB88A8_2F3EA8
/* 00CBC8 01DB88C8 00000000 */   nop
/* 00CBCC 01DB88CC 0100013C */  lui         $1, (0x10000 >> 16)
/* 00CBD0 01DB88D0 2108A100 */  addu        $1, $5, $1
/* 00CBD4 01DB88D4 80BD20AC */  sw          $0, -0x4280($1)
/* 00CBD8 01DB88D8 28260070 */  paddub      $4, $0, $0
/* 00CBDC 01DB88DC 09000010 */  b           .L01DB8904_2F3F04
/* 00CBE0 01DB88E0 00000000 */   nop
.L01DB88E4_2F3EE4:
/* 00CBE4 01DB88E4 40100400 */  sll         $2, $4, 1
/* 00CBE8 01DB88E8 21104400 */  addu        $2, $2, $4
/* 00CBEC 01DB88EC C0100200 */  sll         $2, $2, 3
/* 00CBF0 01DB88F0 21104500 */  addu        $2, $2, $5
/* 00CBF4 01DB88F4 0100013C */  lui         $1, (0x10000 >> 16)
/* 00CBF8 01DB88F8 21084100 */  addu        $1, $2, $1
/* 00CBFC 01DB88FC 9CBD20AC */  sw          $0, -0x4264($1)
/* 00CC00 01DB8900 01008424 */  addiu       $4, $4, 0x1
.L01DB8904_2F3F04:
/* 00CC04 01DB8904 04008228 */  slti        $2, $4, 0x4
/* 00CC08 01DB8908 F6FF4014 */  bnez        $2, .L01DB88E4_2F3EE4
/* 00CC0C 01DB890C 00000000 */   nop
/* 00CC10 01DB8910 2C9E828F */  lw          $2, -0x61D4($28)
/* 00CC14 01DB8914 282E0070 */  paddub      $5, $0, $0
/* 00CC18 01DB8918 10000010 */  b           .L01DB895C_2F3F5C
/* 00CC1C 01DB891C 00000000 */   nop
.L01DB8920_2F3F20:
/* 00CC20 01DB8920 FFFF0424 */  addiu       $4, $0, -0x1
/* 00CC24 01DB8924 80300500 */  sll         $6, $5, 2
/* 00CC28 01DB8928 EA01033C */  lui         $3, %hi(MainRandomItem + 0x290)
/* 00CC2C 01DB892C 50796324 */  addiu       $3, $3, %lo(MainRandomItem + 0x290)
/* 00CC30 01DB8930 21186600 */  addu        $3, $3, $6
/* 00CC34 01DB8934 000064AC */  sw          $4, 0x0($3)
/* 00CC38 01DB8938 EA01033C */  lui         $3, %hi(MainRandomItem + 0x494)
/* 00CC3C 01DB893C 547B6324 */  addiu       $3, $3, %lo(MainRandomItem + 0x494)
/* 00CC40 01DB8940 21186600 */  addu        $3, $3, $6
/* 00CC44 01DB8944 000064AC */  sw          $4, 0x0($3)
/* 00CC48 01DB8948 EA01033C */  lui         $3, %hi(MainRandomItem + 0x514)
/* 00CC4C 01DB894C D47B6324 */  addiu       $3, $3, %lo(MainRandomItem + 0x514)
/* 00CC50 01DB8950 21186600 */  addu        $3, $3, $6
/* 00CC54 01DB8954 000060AC */  sw          $0, 0x0($3)
/* 00CC58 01DB8958 0100A524 */  addiu       $5, $5, 0x1
.L01DB895C_2F3F5C:
/* 00CC5C 01DB895C 2000A328 */  slti        $3, $5, 0x20
/* 00CC60 01DB8960 EFFF6014 */  bnez        $3, .L01DB8920_2F3F20
/* 00CC64 01DB8964 00000000 */   nop
/* 00CC68 01DB8968 EA01013C */  lui         $1, %hi(MainRandomItem)
/* 00CC6C 01DB896C C07622AC */  sw          $2, %lo(MainRandomItem)($1)
/* 00CC70 01DB8970 282E0070 */  paddub      $5, $0, $0
/* 00CC74 01DB8974 10000010 */  b           .L01DB89B8_2F3FB8
/* 00CC78 01DB8978 00000000 */   nop
.L01DB897C_2F3F7C:
/* 00CC7C 01DB897C FFFF0424 */  addiu       $4, $0, -0x1
/* 00CC80 01DB8980 80300500 */  sll         $6, $5, 2
/* 00CC84 01DB8984 EA01033C */  lui         $3, %hi(SubRandomItem + 0x290)
/* 00CC88 01DB8988 707F6324 */  addiu       $3, $3, %lo(SubRandomItem + 0x290)
/* 00CC8C 01DB898C 21186600 */  addu        $3, $3, $6
/* 00CC90 01DB8990 000064AC */  sw          $4, 0x0($3)
/* 00CC94 01DB8994 EB01033C */  lui         $3, %hi(SubRandomItem + 0x494)
/* 00CC98 01DB8998 74816324 */  addiu       $3, $3, %lo(SubRandomItem + 0x494)
/* 00CC9C 01DB899C 21186600 */  addu        $3, $3, $6
/* 00CCA0 01DB89A0 000064AC */  sw          $4, 0x0($3)
/* 00CCA4 01DB89A4 EB01033C */  lui         $3, %hi(SubRandomItem + 0x514)
/* 00CCA8 01DB89A8 F4816324 */  addiu       $3, $3, %lo(SubRandomItem + 0x514)
/* 00CCAC 01DB89AC 21186600 */  addu        $3, $3, $6
/* 00CCB0 01DB89B0 000060AC */  sw          $0, 0x0($3)
/* 00CCB4 01DB89B4 0100A524 */  addiu       $5, $5, 0x1
.L01DB89B8_2F3FB8:
/* 00CCB8 01DB89B8 2000A328 */  slti        $3, $5, 0x20
/* 00CCBC 01DB89BC EFFF6014 */  bnez        $3, .L01DB897C_2F3F7C
/* 00CCC0 01DB89C0 00000000 */   nop
/* 00CCC4 01DB89C4 EA01013C */  lui         $1, %hi(SubRandomItem)
/* 00CCC8 01DB89C8 E07C22AC */  sw          $2, %lo(SubRandomItem)($1)
/* 00CCCC 01DB89CC EA01023C */  lui         $2, %hi(MainRandomItem)
/* 00CCD0 01DB89D0 C0764224 */  addiu       $2, $2, %lo(MainRandomItem)
/* 00CCD4 01DB89D4 089D82AF */  sw          $2, -0x62F8($28)
/* 00CCD8 01DB89D8 C89C848F */  lw          $4, -0x6338($28)
/* 00CCDC 01DB89DC 06000524 */  addiu       $5, $0, 0x6
/* 00CCE0 01DB89E0 01000624 */  addiu       $6, $0, 0x1
/* 00CCE4 01DB89E4 9C2D070C */  jal         buildRandomMap__11CDungeonMapFii
/* 00CCE8 01DB89E8 00000000 */   nop
/* 00CCEC 01DB89EC C89C848F */  lw          $4, -0x6338($28)
/* 00CCF0 01DB89F0 0100013C */  lui         $1, (0x10000 >> 16)
/* 00CCF4 01DB89F4 21088100 */  addu        $1, $4, $1
/* 00CCF8 01DB89F8 ECBD268C */  lw          $6, -0x4214($1)
/* 00CCFC 01DB89FC 789C828F */  lw          $2, -0x6388($28)
/* 00CD00 01DB8A00 02004580 */  lb          $5, 0x2($2)
/* 00CD04 01DB8A04 01000724 */  addiu       $7, $0, 0x1
/* 00CD08 01DB8A08 5021070C */  jal         buildEventData__11CDungeonMapFiii
/* 00CD0C 01DB8A0C 00000000 */   nop
/* 00CD10 01DB8A10 C89C848F */  lw          $4, -0x6338($28)
/* 00CD14 01DB8A14 000F070C */  jal         FlushCheckMask__11CDungeonMapFv
/* 00CD18 01DB8A18 00000000 */   nop
/* 00CD1C 01DB8A1C C89C848F */  lw          $4, -0x6338($28)
/* 00CD20 01DB8A20 0100013C */  lui         $1, (0x10000 >> 16)
/* 00CD24 01DB8A24 21088100 */  addu        $1, $4, $1
/* 00CD28 01DB8A28 ECBD258C */  lw          $5, -0x4214($1)
/* 00CD2C 01DB8A2C 3009070C */  jal         DrawMapCalc__11CDungeonMapFi
/* 00CD30 01DB8A30 00000000 */   nop
/* 00CD34 01DB8A34 C89C858F */  lw          $5, -0x6338($28)
/* 00CD38 01DB8A38 0100013C */  lui         $1, (0x10000 >> 16)
/* 00CD3C 01DB8A3C 2108A100 */  addu        $1, $5, $1
/* 00CD40 01DB8A40 ECBD268C */  lw          $6, -0x4214($1)
/* 00CD44 01DB8A44 D09C848F */  lw          $4, -0x6330($28)
/* 00CD48 01DB8A48 D033070C */  jal         SetupEvent__16CDungeonEventManFP11CDungeonMapi
/* 00CD4C 01DB8A4C 00000000 */   nop
/* 00CD50 01DB8A50 DD01023C */  lui         $2, %hi(UraDungeonMap)
/* 00CD54 01DB8A54 F0564224 */  addiu       $2, $2, %lo(UraDungeonMap)
/* 00CD58 01DB8A58 C89C82AF */  sw          $2, -0x6338($28)
/* 00CD5C 01DB8A5C DF01023C */  lui         $2, %hi(UraEventMan)
/* 00CD60 01DB8A60 B05E4224 */  addiu       $2, $2, %lo(UraEventMan)
/* 00CD64 01DB8A64 D09C82AF */  sw          $2, -0x6330($28)
/* 00CD68 01DB8A68 DC01013C */  lui         $1, %hi(MainDungeonMap)
/* 00CD6C 01DB8A6C E04B228C */  lw          $2, %lo(MainDungeonMap)($1)
/* 00CD70 01DB8A70 DD01013C */  lui         $1, %hi(UraDungeonMap)
/* 00CD74 01DB8A74 F05622AC */  sw          $2, %lo(UraDungeonMap)($1)
/* 00CD78 01DB8A78 DC01013C */  lui         $1, %hi(MainDungeonMap + 0x4)
/* 00CD7C 01DB8A7C E44B228C */  lw          $2, %lo(MainDungeonMap + 0x4)($1)
/* 00CD80 01DB8A80 DD01013C */  lui         $1, %hi(UraDungeonMap + 0x4)
/* 00CD84 01DB8A84 F45622AC */  sw          $2, %lo(UraDungeonMap + 0x4)($1)
/* 00CD88 01DB8A88 DC01023C */  lui         $2, %hi(MainDungeonMap + 0x8)
/* 00CD8C 01DB8A8C E84B4624 */  addiu       $6, $2, %lo(MainDungeonMap + 0x8)
/* 00CD90 01DB8A90 DD01023C */  lui         $2, %hi(UraDungeonMap + 0x8)
/* 00CD94 01DB8A94 F8564524 */  addiu       $5, $2, %lo(UraDungeonMap + 0x8)
/* 00CD98 01DB8A98 08000424 */  addiu       $4, $0, 0x8
.L01DB8A9C_2F409C:
/* 00CD9C 01DB8A9C 0000C38C */  lw          $3, 0x0($6)
/* 00CDA0 01DB8AA0 0400C28C */  lw          $2, 0x4($6)
/* 00CDA4 01DB8AA4 0800C624 */  addiu       $6, $6, 0x8
/* 00CDA8 01DB8AA8 FFFF8424 */  addiu       $4, $4, -0x1
/* 00CDAC 01DB8AAC 0000A3AC */  sw          $3, 0x0($5)
/* 00CDB0 01DB8AB0 0400A2AC */  sw          $2, 0x4($5)
/* 00CDB4 01DB8AB4 0800A524 */  addiu       $5, $5, 0x8
/* 00CDB8 01DB8AB8 F8FF801C */  bgtz        $4, .L01DB8A9C_2F409C
/* 00CDBC 01DB8ABC 00000000 */   nop
/* 00CDC0 01DB8AC0 DC01023C */  lui         $2, %hi(MainDungeonMap + 0x50)
/* 00CDC4 01DB8AC4 304C4524 */  addiu       $5, $2, %lo(MainDungeonMap + 0x50)
/* 00CDC8 01DB8AC8 DD01023C */  lui         $2, %hi(UraDungeonMap + 0x50)
/* 00CDCC 01DB8ACC 40574424 */  addiu       $4, $2, %lo(UraDungeonMap + 0x50)
/* 00CDD0 01DB8AD0 04000324 */  addiu       $3, $0, 0x4
.L01DB8AD4_2F40D4:
/* 00CDD4 01DB8AD4 0000A278 */  lq          $2, 0x0($5)
/* 00CDD8 01DB8AD8 1000A524 */  addiu       $5, $5, 0x10
/* 00CDDC 01DB8ADC FFFF6324 */  addiu       $3, $3, -0x1
/* 00CDE0 01DB8AE0 0000827C */  sq          $2, 0x0($4)
/* 00CDE4 01DB8AE4 10008424 */  addiu       $4, $4, 0x10
/* 00CDE8 01DB8AE8 FAFF601C */  bgtz        $3, .L01DB8AD4_2F40D4
/* 00CDEC 01DB8AEC 00000000 */   nop
/* 00CDF0 01DB8AF0 DD01023C */  lui         $2, %hi(UraDungeonMap + 0x90)
/* 00CDF4 01DB8AF4 80574424 */  addiu       $4, $2, %lo(UraDungeonMap + 0x90)
/* 00CDF8 01DB8AF8 DC01023C */  lui         $2, %hi(MainDungeonMap + 0x90)
/* 00CDFC 01DB8AFC 704C4524 */  addiu       $5, $2, %lo(MainDungeonMap + 0x90)
/* 00CE00 01DB8B00 980C050C */  jal         func_00143260
/* 00CE04 01DB8B04 00000000 */   nop
/* 00CE08 01DB8B08 DC01013C */  lui         $1, %hi(SkyColor__FP9CFrameVu1 + 0x60)
/* 00CE0C 01DB8B0C 904F20C4 */  lwc1        $f0, %lo(SkyColor__FP9CFrameVu1 + 0x60)($1)
/* 00CE10 01DB8B10 DD01013C */  lui         $1, %hi(LIT_636__3 + 0x280)
/* 00CE14 01DB8B14 A05A20E4 */  swc1        $f0, %lo(LIT_636__3 + 0x280)($1)
/* 00CE18 01DB8B18 DC01013C */  lui         $1, %hi(SkyColor__FP9CFrameVu1 + 0x64)
/* 00CE1C 01DB8B1C 944F228C */  lw          $2, %lo(SkyColor__FP9CFrameVu1 + 0x64)($1)
/* 00CE20 01DB8B20 DD01013C */  lui         $1, %hi(LIT_636__3 + 0x284)
/* 00CE24 01DB8B24 A45A22AC */  sw          $2, %lo(LIT_636__3 + 0x284)($1)
/* 00CE28 01DB8B28 DC01013C */  lui         $1, %hi(SkyColor__FP9CFrameVu1 + 0x68)
/* 00CE2C 01DB8B2C 984F228C */  lw          $2, %lo(SkyColor__FP9CFrameVu1 + 0x68)($1)
/* 00CE30 01DB8B30 DD01013C */  lui         $1, %hi(LIT_636__3 + 0x288)
/* 00CE34 01DB8B34 A85A22AC */  sw          $2, %lo(LIT_636__3 + 0x288)($1)
/* 00CE38 01DB8B38 DC01023C */  lui         $2, %hi(SkyColor__FP9CFrameVu1 + 0x70)
/* 00CE3C 01DB8B3C A04F4624 */  addiu       $6, $2, %lo(SkyColor__FP9CFrameVu1 + 0x70)
/* 00CE40 01DB8B40 DD01023C */  lui         $2, %hi(LIT_636__3 + 0x290)
/* 00CE44 01DB8B44 B05A4524 */  addiu       $5, $2, %lo(LIT_636__3 + 0x290)
/* 00CE48 01DB8B48 10000424 */  addiu       $4, $0, 0x10
.L01DB8B4C_2F414C:
/* 00CE4C 01DB8B4C 0000C38C */  lw          $3, 0x0($6)
/* 00CE50 01DB8B50 0400C28C */  lw          $2, 0x4($6)
/* 00CE54 01DB8B54 0800C624 */  addiu       $6, $6, 0x8
/* 00CE58 01DB8B58 FFFF8424 */  addiu       $4, $4, -0x1
/* 00CE5C 01DB8B5C 0000A3AC */  sw          $3, 0x0($5)
/* 00CE60 01DB8B60 0400A2AC */  sw          $2, 0x4($5)
/* 00CE64 01DB8B64 0800A524 */  addiu       $5, $5, 0x8
/* 00CE68 01DB8B68 F8FF801C */  bgtz        $4, .L01DB8B4C_2F414C
/* 00CE6C 01DB8B6C 00000000 */   nop
/* 00CE70 01DB8B70 DC01023C */  lui         $2, %hi(SkyColor__FP9CFrameVu1 + 0xF0)
/* 00CE74 01DB8B74 20504624 */  addiu       $6, $2, %lo(SkyColor__FP9CFrameVu1 + 0xF0)
/* 00CE78 01DB8B78 DD01023C */  lui         $2, %hi(LIT_636__3 + 0x310)
/* 00CE7C 01DB8B7C 305B4524 */  addiu       $5, $2, %lo(LIT_636__3 + 0x310)
/* 00CE80 01DB8B80 04000424 */  addiu       $4, $0, 0x4
.L01DB8B84_2F4184:
/* 00CE84 01DB8B84 0000C38C */  lw          $3, 0x0($6)
/* 00CE88 01DB8B88 0400C28C */  lw          $2, 0x4($6)
/* 00CE8C 01DB8B8C 0800C624 */  addiu       $6, $6, 0x8
/* 00CE90 01DB8B90 FFFF8424 */  addiu       $4, $4, -0x1
/* 00CE94 01DB8B94 0000A3AC */  sw          $3, 0x0($5)
/* 00CE98 01DB8B98 0400A2AC */  sw          $2, 0x4($5)
/* 00CE9C 01DB8B9C 0800A524 */  addiu       $5, $5, 0x8
/* 00CEA0 01DB8BA0 F8FF801C */  bgtz        $4, .L01DB8B84_2F4184
/* 00CEA4 01DB8BA4 00000000 */   nop
/* 00CEA8 01DB8BA8 DC01013C */  lui         $1, %hi(SkyColor__FP9CFrameVu1 + 0x110)
/* 00CEAC 01DB8BAC 4050228C */  lw          $2, %lo(SkyColor__FP9CFrameVu1 + 0x110)($1)
/* 00CEB0 01DB8BB0 DD01013C */  lui         $1, %hi(LIT_636__3 + 0x330)
/* 00CEB4 01DB8BB4 505B22AC */  sw          $2, %lo(LIT_636__3 + 0x330)($1)
/* 00CEB8 01DB8BB8 DC01013C */  lui         $1, %hi(SkyColor__FP9CFrameVu1 + 0x114)
/* 00CEBC 01DB8BBC 4450228C */  lw          $2, %lo(SkyColor__FP9CFrameVu1 + 0x114)($1)
/* 00CEC0 01DB8BC0 DD01013C */  lui         $1, %hi(LIT_636__3 + 0x334)
/* 00CEC4 01DB8BC4 545B22AC */  sw          $2, %lo(LIT_636__3 + 0x334)($1)
/* 00CEC8 01DB8BC8 DC01013C */  lui         $1, %hi(SkyColor__FP9CFrameVu1 + 0x118)
/* 00CECC 01DB8BCC 4850228C */  lw          $2, %lo(SkyColor__FP9CFrameVu1 + 0x118)($1)
/* 00CED0 01DB8BD0 DD01013C */  lui         $1, %hi(LIT_636__3 + 0x338)
/* 00CED4 01DB8BD4 585B22AC */  sw          $2, %lo(LIT_636__3 + 0x338)($1)
/* 00CED8 01DB8BD8 DC01023C */  lui         $2, %hi(SkyColor__FP9CFrameVu1 + 0x11C)
/* 00CEDC 01DB8BDC 4C504324 */  addiu       $3, $2, %lo(SkyColor__FP9CFrameVu1 + 0x11C)
/* 00CEE0 01DB8BE0 DD01023C */  lui         $2, %hi(LIT_636__3 + 0x33C)
/* 00CEE4 01DB8BE4 5C5B4224 */  addiu       $2, $2, %lo(LIT_636__3 + 0x33C)
/* 00CEE8 01DB8BE8 000062C4 */  lwc1        $f2, 0x0($3)
/* 00CEEC 01DB8BEC 040061C4 */  lwc1        $f1, 0x4($3)
/* 00CEF0 01DB8BF0 080060C4 */  lwc1        $f0, 0x8($3)
/* 00CEF4 01DB8BF4 000042E4 */  swc1        $f2, 0x0($2)
/* 00CEF8 01DB8BF8 040041E4 */  swc1        $f1, 0x4($2)
/* 00CEFC 01DB8BFC 080040E4 */  swc1        $f0, 0x8($2)
/* 00CF00 01DB8C00 DC01023C */  lui         $2, %hi(SkyColor__FP9CFrameVu1 + 0x128)
/* 00CF04 01DB8C04 58504624 */  addiu       $6, $2, %lo(SkyColor__FP9CFrameVu1 + 0x128)
/* 00CF08 01DB8C08 DD01023C */  lui         $2, %hi(LIT_636__3 + 0x348)
/* 00CF0C 01DB8C0C 685B4524 */  addiu       $5, $2, %lo(LIT_636__3 + 0x348)
/* 00CF10 01DB8C10 03000424 */  addiu       $4, $0, 0x3
.L01DB8C14_2F4214:
/* 00CF14 01DB8C14 0000C38C */  lw          $3, 0x0($6)
/* 00CF18 01DB8C18 0400C28C */  lw          $2, 0x4($6)
/* 00CF1C 01DB8C1C 0800C624 */  addiu       $6, $6, 0x8
/* 00CF20 01DB8C20 FFFF8424 */  addiu       $4, $4, -0x1
/* 00CF24 01DB8C24 0000A3AC */  sw          $3, 0x0($5)
/* 00CF28 01DB8C28 0400A2AC */  sw          $2, 0x4($5)
/* 00CF2C 01DB8C2C 0800A524 */  addiu       $5, $5, 0x8
/* 00CF30 01DB8C30 F8FF801C */  bgtz        $4, .L01DB8C14_2F4214
/* 00CF34 01DB8C34 00000000 */   nop
/* 00CF38 01DB8C38 DC01023C */  lui         $2, %hi(SkyColor__FP9CFrameVu1 + 0x140)
/* 00CF3C 01DB8C3C 70504624 */  addiu       $6, $2, %lo(SkyColor__FP9CFrameVu1 + 0x140)
/* 00CF40 01DB8C40 DD01023C */  lui         $2, %hi(LIT_636__3 + 0x360)
/* 00CF44 01DB8C44 805B4524 */  addiu       $5, $2, %lo(LIT_636__3 + 0x360)
/* 00CF48 01DB8C48 50100424 */  addiu       $4, $0, 0x1050
.L01DB8C4C_2F424C:
/* 00CF4C 01DB8C4C 0000C38C */  lw          $3, 0x0($6)
/* 00CF50 01DB8C50 0400C28C */  lw          $2, 0x4($6)
/* 00CF54 01DB8C54 0800C624 */  addiu       $6, $6, 0x8
/* 00CF58 01DB8C58 FFFF8424 */  addiu       $4, $4, -0x1
/* 00CF5C 01DB8C5C 0000A3AC */  sw          $3, 0x0($5)
/* 00CF60 01DB8C60 0400A2AC */  sw          $2, 0x4($5)
/* 00CF64 01DB8C64 0800A524 */  addiu       $5, $5, 0x8
/* 00CF68 01DB8C68 F8FF801C */  bgtz        $4, .L01DB8C4C_2F424C
/* 00CF6C 01DB8C6C 00000000 */   nop
/* 00CF70 01DB8C70 DD01023C */  lui         $2, %hi(AtraLight__Fv + 0x120)
/* 00CF74 01DB8C74 F0D24624 */  addiu       $6, $2, %lo(AtraLight__Fv + 0x120)
/* 00CF78 01DB8C78 DE01023C */  lui         $2, %hi(LIT_834)
/* 00CF7C 01DB8C7C 00DE4524 */  addiu       $5, $2, %lo(LIT_834)
/* 00CF80 01DB8C80 C8000424 */  addiu       $4, $0, 0xC8
.L01DB8C84_2F4284:
/* 00CF84 01DB8C84 0000C38C */  lw          $3, 0x0($6)
/* 00CF88 01DB8C88 0400C28C */  lw          $2, 0x4($6)
/* 00CF8C 01DB8C8C 0800C624 */  addiu       $6, $6, 0x8
/* 00CF90 01DB8C90 FFFF8424 */  addiu       $4, $4, -0x1
/* 00CF94 01DB8C94 0000A3AC */  sw          $3, 0x0($5)
/* 00CF98 01DB8C98 0400A2AC */  sw          $2, 0x4($5)
/* 00CF9C 01DB8C9C 0800A524 */  addiu       $5, $5, 0x8
/* 00CFA0 01DB8CA0 F8FF801C */  bgtz        $4, .L01DB8C84_2F4284
/* 00CFA4 01DB8CA4 00000000 */   nop
/* 00CFA8 01DB8CA8 DD01023C */  lui         $2, %hi(InitProcC__Fv + 0x4D0)
/* 00CFAC 01DB8CAC 30D94624 */  addiu       $6, $2, %lo(InitProcC__Fv + 0x4D0)
/* 00CFB0 01DB8CB0 DE01023C */  lui         $2, %hi(LIT_345__9 + 0x10)
/* 00CFB4 01DB8CB4 40E44524 */  addiu       $5, $2, %lo(LIT_345__9 + 0x10)
/* 00CFB8 01DB8CB8 E0010424 */  addiu       $4, $0, 0x1E0
.L01DB8CBC_2F42BC:
/* 00CFBC 01DB8CBC 0000C38C */  lw          $3, 0x0($6)
/* 00CFC0 01DB8CC0 0400C28C */  lw          $2, 0x4($6)
/* 00CFC4 01DB8CC4 0800C624 */  addiu       $6, $6, 0x8
/* 00CFC8 01DB8CC8 FFFF8424 */  addiu       $4, $4, -0x1
/* 00CFCC 01DB8CCC 0000A3AC */  sw          $3, 0x0($5)
/* 00CFD0 01DB8CD0 0400A2AC */  sw          $2, 0x4($5)
/* 00CFD4 01DB8CD4 0800A524 */  addiu       $5, $5, 0x8
/* 00CFD8 01DB8CD8 F8FF801C */  bgtz        $4, .L01DB8CBC_2F42BC
/* 00CFDC 01DB8CDC 00000000 */   nop
/* 00CFE0 01DB8CE0 DD01023C */  lui         $2, %hi(InitProcE__Fv + 0x190)
/* 00CFE4 01DB8CE4 30E84624 */  addiu       $6, $2, %lo(InitProcE__Fv + 0x190)
/* 00CFE8 01DB8CE8 DE01023C */  lui         $2, %hi(LIT_638__6 + 0x10)
/* 00CFEC 01DB8CEC 40F34524 */  addiu       $5, $2, %lo(LIT_638__6 + 0x10)
/* 00CFF0 01DB8CF0 20030424 */  addiu       $4, $0, 0x320
.L01DB8CF4_2F42F4:
/* 00CFF4 01DB8CF4 0000C38C */  lw          $3, 0x0($6)
/* 00CFF8 01DB8CF8 0400C28C */  lw          $2, 0x4($6)
/* 00CFFC 01DB8CFC 0800C624 */  addiu       $6, $6, 0x8
/* 00D000 01DB8D00 FFFF8424 */  addiu       $4, $4, -0x1
/* 00D004 01DB8D04 0000A3AC */  sw          $3, 0x0($5)
/* 00D008 01DB8D08 0400A2AC */  sw          $2, 0x4($5)
/* 00D00C 01DB8D0C 0800A524 */  addiu       $5, $5, 0x8
/* 00D010 01DB8D10 F8FF801C */  bgtz        $4, .L01DB8CF4_2F42F4
/* 00D014 01DB8D14 00000000 */   nop
/* 00D018 01DB8D18 DD01023C */  lui         $2, %hi(InitProcH__Fv + 0x240)
/* 00D01C 01DB8D1C 30014624 */  addiu       $6, $2, %lo(InitProcH__Fv + 0x240)
/* 00D020 01DB8D20 DE01023C */  lui         $2, %hi(LIT_343__4 + 0x10)
/* 00D024 01DB8D24 400C4524 */  addiu       $5, $2, %lo(LIT_343__4 + 0x10)
/* 00D028 01DB8D28 20000424 */  addiu       $4, $0, 0x20
.L01DB8D2C_2F432C:
/* 00D02C 01DB8D2C 0000C38C */  lw          $3, 0x0($6)
/* 00D030 01DB8D30 0400C28C */  lw          $2, 0x4($6)
/* 00D034 01DB8D34 0800C624 */  addiu       $6, $6, 0x8
/* 00D038 01DB8D38 FFFF8424 */  addiu       $4, $4, -0x1
/* 00D03C 01DB8D3C 0000A3AC */  sw          $3, 0x0($5)
/* 00D040 01DB8D40 0400A2AC */  sw          $2, 0x4($5)
/* 00D044 01DB8D44 0800A524 */  addiu       $5, $5, 0x8
/* 00D048 01DB8D48 F8FF801C */  bgtz        $4, .L01DB8D2C_2F432C
/* 00D04C 01DB8D4C 00000000 */   nop
/* 00D050 01DB8D50 DD01013C */  lui         $1, %hi(InitProcH__Fv + 0x340)
/* 00D054 01DB8D54 3002228C */  lw          $2, %lo(InitProcH__Fv + 0x340)($1)
/* 00D058 01DB8D58 DE01013C */  lui         $1, %hi(LIT_358__6 + 0x8)
/* 00D05C 01DB8D5C 400D22AC */  sw          $2, %lo(LIT_358__6 + 0x8)($1)
/* 00D060 01DB8D60 DD01023C */  lui         $2, %hi(InitProcH__Fv + 0x350)
/* 00D064 01DB8D64 40024624 */  addiu       $6, $2, %lo(InitProcH__Fv + 0x350)
/* 00D068 01DB8D68 DE01023C */  lui         $2, %hi(LIT_359__5 + 0x8)
/* 00D06C 01DB8D6C 500D4524 */  addiu       $5, $2, %lo(LIT_359__5 + 0x8)
/* 00D070 01DB8D70 C0000424 */  addiu       $4, $0, 0xC0
.L01DB8D74_2F4374:
/* 00D074 01DB8D74 0000C38C */  lw          $3, 0x0($6)
/* 00D078 01DB8D78 0400C28C */  lw          $2, 0x4($6)
/* 00D07C 01DB8D7C 0800C624 */  addiu       $6, $6, 0x8
/* 00D080 01DB8D80 FFFF8424 */  addiu       $4, $4, -0x1
/* 00D084 01DB8D84 0000A3AC */  sw          $3, 0x0($5)
/* 00D088 01DB8D88 0400A2AC */  sw          $2, 0x4($5)
/* 00D08C 01DB8D8C 0800A524 */  addiu       $5, $5, 0x8
/* 00D090 01DB8D90 F8FF801C */  bgtz        $4, .L01DB8D74_2F4374
/* 00D094 01DB8D94 00000000 */   nop
/* 00D098 01DB8D98 DD01013C */  lui         $1, %hi(InitProcH__Fv + 0x950)
/* 00D09C 01DB8D9C 4008228C */  lw          $2, %lo(InitProcH__Fv + 0x950)($1)
/* 00D0A0 01DB8DA0 DE01013C */  lui         $1, %hi(__sinit_op_b.cpp + 0x50)
/* 00D0A4 01DB8DA4 501322AC */  sw          $2, %lo(__sinit_op_b.cpp + 0x50)($1)
/* 00D0A8 01DB8DA8 DD01013C */  lui         $1, %hi(InitProcH__Fv + 0x954)
/* 00D0AC 01DB8DAC 4408228C */  lw          $2, %lo(InitProcH__Fv + 0x954)($1)
/* 00D0B0 01DB8DB0 DE01013C */  lui         $1, %hi(__sinit_op_b.cpp + 0x54)
/* 00D0B4 01DB8DB4 541322AC */  sw          $2, %lo(__sinit_op_b.cpp + 0x54)($1)
/* 00D0B8 01DB8DB8 DD01013C */  lui         $1, %hi(InitProcH__Fv + 0x958)
/* 00D0BC 01DB8DBC 4808228C */  lw          $2, %lo(InitProcH__Fv + 0x958)($1)
/* 00D0C0 01DB8DC0 DE01013C */  lui         $1, %hi(__sinit_op_b.cpp + 0x58)
/* 00D0C4 01DB8DC4 581322AC */  sw          $2, %lo(__sinit_op_b.cpp + 0x58)($1)
/* 00D0C8 01DB8DC8 DD01013C */  lui         $1, %hi(InitProcH__Fv + 0x95C)
/* 00D0CC 01DB8DCC 4C08228C */  lw          $2, %lo(InitProcH__Fv + 0x95C)($1)
/* 00D0D0 01DB8DD0 DE01013C */  lui         $1, %hi(__sinit_op_b.cpp + 0x5C)
/* 00D0D4 01DB8DD4 5C1322AC */  sw          $2, %lo(__sinit_op_b.cpp + 0x5C)($1)
/* 00D0D8 01DB8DD8 DD01013C */  lui         $1, %hi(InitProcH__Fv + 0x960)
/* 00D0DC 01DB8DDC 5008228C */  lw          $2, %lo(InitProcH__Fv + 0x960)($1)
/* 00D0E0 01DB8DE0 DE01013C */  lui         $1, %hi(__sinit_op_b.cpp + 0x60)
/* 00D0E4 01DB8DE4 601322AC */  sw          $2, %lo(__sinit_op_b.cpp + 0x60)($1)
/* 00D0E8 01DB8DE8 DD01013C */  lui         $1, %hi(InitProcH__Fv + 0x964)
/* 00D0EC 01DB8DEC 5408228C */  lw          $2, %lo(InitProcH__Fv + 0x964)($1)
/* 00D0F0 01DB8DF0 DE01013C */  lui         $1, %hi(__sinit_op_b.cpp + 0x64)
/* 00D0F4 01DB8DF4 641322AC */  sw          $2, %lo(__sinit_op_b.cpp + 0x64)($1)
/* 00D0F8 01DB8DF8 DD01013C */  lui         $1, %hi(InitProcH__Fv + 0x968)
/* 00D0FC 01DB8DFC 5808228C */  lw          $2, %lo(InitProcH__Fv + 0x968)($1)
/* 00D100 01DB8E00 DE01013C */  lui         $1, %hi(__sinit_op_b.cpp + 0x68)
/* 00D104 01DB8E04 681322AC */  sw          $2, %lo(__sinit_op_b.cpp + 0x68)($1)
/* 00D108 01DB8E08 DD01013C */  lui         $1, %hi(InitProcH__Fv + 0x96C)
/* 00D10C 01DB8E0C 5C08228C */  lw          $2, %lo(InitProcH__Fv + 0x96C)($1)
/* 00D110 01DB8E10 DE01013C */  lui         $1, %hi(__sinit_op_b.cpp + 0x6C)
/* 00D114 01DB8E14 6C1322AC */  sw          $2, %lo(__sinit_op_b.cpp + 0x6C)($1)
/* 00D118 01DB8E18 DD01023C */  lui         $2, %hi(InitProcH__Fv + 0x970)
/* 00D11C 01DB8E1C 60084624 */  addiu       $6, $2, %lo(InitProcH__Fv + 0x970)
/* 00D120 01DB8E20 DE01023C */  lui         $2, %hi(__sinit_op_b.cpp + 0x70)
/* 00D124 01DB8E24 70134524 */  addiu       $5, $2, %lo(__sinit_op_b.cpp + 0x70)
/* 00D128 01DB8E28 20000424 */  addiu       $4, $0, 0x20
.L01DB8E2C_2F442C:
/* 00D12C 01DB8E2C 0000C38C */  lw          $3, 0x0($6)
/* 00D130 01DB8E30 0400C28C */  lw          $2, 0x4($6)
/* 00D134 01DB8E34 0800C624 */  addiu       $6, $6, 0x8
/* 00D138 01DB8E38 FFFF8424 */  addiu       $4, $4, -0x1
/* 00D13C 01DB8E3C 0000A3AC */  sw          $3, 0x0($5)
/* 00D140 01DB8E40 0400A2AC */  sw          $2, 0x4($5)
/* 00D144 01DB8E44 0800A524 */  addiu       $5, $5, 0x8
/* 00D148 01DB8E48 F8FF801C */  bgtz        $4, .L01DB8E2C_2F442C
/* 00D14C 01DB8E4C 00000000 */   nop
/* 00D150 01DB8E50 DD01013C */  lui         $1, %hi(DrawProcH__Fv + 0x80)
/* 00D154 01DB8E54 6009228C */  lw          $2, %lo(DrawProcH__Fv + 0x80)($1)
/* 00D158 01DB8E58 DE01013C */  lui         $1, %hi(__sinit_op_b.cpp + 0x170)
/* 00D15C 01DB8E5C 701422AC */  sw          $2, %lo(__sinit_op_b.cpp + 0x170)($1)
/* 00D160 01DB8E60 DD01013C */  lui         $1, %hi(DrawProcH__Fv + 0x84)
/* 00D164 01DB8E64 6409228C */  lw          $2, %lo(DrawProcH__Fv + 0x84)($1)
/* 00D168 01DB8E68 DE01013C */  lui         $1, %hi(__sinit_op_b.cpp + 0x174)
/* 00D16C 01DB8E6C 741422AC */  sw          $2, %lo(__sinit_op_b.cpp + 0x174)($1)
/* 00D170 01DB8E70 DD01013C */  lui         $1, %hi(DrawProcH__Fv + 0x88)
/* 00D174 01DB8E74 6809228C */  lw          $2, %lo(DrawProcH__Fv + 0x88)($1)
/* 00D178 01DB8E78 DE01013C */  lui         $1, %hi(__sinit_op_b.cpp + 0x178)
/* 00D17C 01DB8E7C 781422AC */  sw          $2, %lo(__sinit_op_b.cpp + 0x178)($1)
/* 00D180 01DB8E80 DD01023C */  lui         $2, %hi(DrawProcH__Fv + 0x8C)
/* 00D184 01DB8E84 6C094624 */  addiu       $6, $2, %lo(DrawProcH__Fv + 0x8C)
/* 00D188 01DB8E88 DE01023C */  lui         $2, %hi(__sinit_op_b.cpp + 0x17C)
/* 00D18C 01DB8E8C 7C144524 */  addiu       $5, $2, %lo(__sinit_op_b.cpp + 0x17C)
/* 00D190 01DB8E90 0C000424 */  addiu       $4, $0, 0xC
.L01DB8E94_2F4494:
/* 00D194 01DB8E94 0000C38C */  lw          $3, 0x0($6)
/* 00D198 01DB8E98 0400C28C */  lw          $2, 0x4($6)
/* 00D19C 01DB8E9C 0800C624 */  addiu       $6, $6, 0x8
/* 00D1A0 01DB8EA0 FFFF8424 */  addiu       $4, $4, -0x1
/* 00D1A4 01DB8EA4 0000A3AC */  sw          $3, 0x0($5)
/* 00D1A8 01DB8EA8 0400A2AC */  sw          $2, 0x4($5)
/* 00D1AC 01DB8EAC 0800A524 */  addiu       $5, $5, 0x8
/* 00D1B0 01DB8EB0 F8FF801C */  bgtz        $4, .L01DB8E94_2F4494
/* 00D1B4 01DB8EB4 00000000 */   nop
/* 00D1B8 01DB8EB8 DD01013C */  lui         $1, %hi(DrawProcH__Fv + 0xEC)
/* 00D1BC 01DB8EBC CC09228C */  lw          $2, %lo(DrawProcH__Fv + 0xEC)($1)
/* 00D1C0 01DB8EC0 DE01013C */  lui         $1, %hi(__sinit_op_c.cpp + 0x2C)
/* 00D1C4 01DB8EC4 DC1422AC */  sw          $2, %lo(__sinit_op_c.cpp + 0x2C)($1)
/* 00D1C8 01DB8EC8 DE01023C */  lui         $2, %hi(__sinit_op_c.cpp + 0x30)
/* 00D1CC 01DB8ECC E0144424 */  addiu       $4, $2, %lo(__sinit_op_c.cpp + 0x30)
/* 00D1D0 01DB8ED0 DD01023C */  lui         $2, %hi(DrawProcH__Fv + 0xF0)
/* 00D1D4 01DB8ED4 D0094524 */  addiu       $5, $2, %lo(DrawProcH__Fv + 0xF0)
/* 00D1D8 01DB8ED8 240B050C */  jal         func_00142C90
/* 00D1DC 01DB8EDC 00000000 */   nop
/* 00D1E0 01DB8EE0 DE01023C */  lui         $2, %hi(CScript__2 + 0xD10)
/* 00D1E4 01DB8EE4 10284424 */  addiu       $4, $2, %lo(CScript__2 + 0xD10)
/* 00D1E8 01DB8EE8 DD01023C */  lui         $2, %hi(TitleInit__Fi + 0x250)
/* 00D1EC 01DB8EEC 001D4524 */  addiu       $5, $2, %lo(TitleInit__Fi + 0x250)
/* 00D1F0 01DB8EF0 240B050C */  jal         func_00142C90
/* 00D1F4 01DB8EF4 00000000 */   nop
/* 00D1F8 01DB8EF8 DE01023C */  lui         $2, %hi(CScript__2 + 0x2040)
/* 00D1FC 01DB8EFC 403B4424 */  addiu       $4, $2, %lo(CScript__2 + 0x2040)
/* 00D200 01DB8F00 DD01023C */  lui         $2, %hi(TitleDraw__Fv + 0x420)
/* 00D204 01DB8F04 30304524 */  addiu       $5, $2, %lo(TitleDraw__Fv + 0x420)
/* 00D208 01DB8F08 240B050C */  jal         func_00142C90
/* 00D20C 01DB8F0C 00000000 */   nop
/* 00D210 01DB8F10 DE01023C */  lui         $2, %hi(CScript__2 + 0x3370)
/* 00D214 01DB8F14 704E4424 */  addiu       $4, $2, %lo(CScript__2 + 0x3370)
/* 00D218 01DB8F18 DD01023C */  lui         $2, %hi(Draw__5CLogoFv + 0xD0)
/* 00D21C 01DB8F1C 60434524 */  addiu       $5, $2, %lo(Draw__5CLogoFv + 0xD0)
/* 00D220 01DB8F20 240B050C */  jal         func_00142C90
/* 00D224 01DB8F24 00000000 */   nop
/* 00D228 01DB8F28 DD01023C */  lui         $2, %hi(_title_text_end + 0x310)
/* 00D22C 01DB8F2C 90564624 */  addiu       $6, $2, %lo(_title_text_end + 0x310)
/* 00D230 01DB8F30 DE01023C */  lui         $2, %hi(CScript__2 + 0x46A0)
/* 00D234 01DB8F34 A0614524 */  addiu       $5, $2, %lo(CScript__2 + 0x46A0)
/* 00D238 01DB8F38 0C000424 */  addiu       $4, $0, 0xC
.L01DB8F3C_2F453C:
/* 00D23C 01DB8F3C 0000C38C */  lw          $3, 0x0($6)
/* 00D240 01DB8F40 0400C28C */  lw          $2, 0x4($6)
/* 00D244 01DB8F44 0800C624 */  addiu       $6, $6, 0x8
/* 00D248 01DB8F48 FFFF8424 */  addiu       $4, $4, -0x1
/* 00D24C 01DB8F4C 0000A3AC */  sw          $3, 0x0($5)
/* 00D250 01DB8F50 0400A2AC */  sw          $2, 0x4($5)
/* 00D254 01DB8F54 0800A524 */  addiu       $5, $5, 0x8
/* 00D258 01DB8F58 F8FF801C */  bgtz        $4, .L01DB8F3C_2F453C
/* 00D25C 01DB8F5C 00000000 */   nop
/* 00D260 01DB8F60 DF01023C */  lui         $2, %hi(DngEventMan)
/* 00D264 01DB8F64 B0364624 */  addiu       $6, $2, %lo(DngEventMan)
/* 00D268 01DB8F68 DF01023C */  lui         $2, %hi(UraEventMan)
/* 00D26C 01DB8F6C B05E4524 */  addiu       $5, $2, %lo(UraEventMan)
/* 00D270 01DB8F70 40010424 */  addiu       $4, $0, 0x140
.L01DB8F74_2F4574:
/* 00D274 01DB8F74 0000C378 */  lq          $3, 0x0($6)
/* 00D278 01DB8F78 1000C278 */  lq          $2, 0x10($6)
/* 00D27C 01DB8F7C 2000C624 */  addiu       $6, $6, 0x20
/* 00D280 01DB8F80 FFFF8424 */  addiu       $4, $4, -0x1
/* 00D284 01DB8F84 0000A37C */  sq          $3, 0x0($5)
/* 00D288 01DB8F88 1000A27C */  sq          $2, 0x10($5)
/* 00D28C 01DB8F8C 2000A524 */  addiu       $5, $5, 0x20
/* 00D290 01DB8F90 F8FF801C */  bgtz        $4, .L01DB8F74_2F4574
/* 00D294 01DB8F94 00000000 */   nop
/* 00D298 01DB8F98 28260070 */  paddub      $4, $0, $0
/* 00D29C 01DB8F9C 0C000010 */  b           .L01DB8FD0_2F45D0
/* 00D2A0 01DB8FA0 00000000 */   nop
.L01DB8FA4_2F45A4:
/* 00D2A4 01DB8FA4 80190400 */  sll         $3, $4, 6
/* 00D2A8 01DB8FA8 DF01023C */  lui         $2, %hi(UraEventMan)
/* 00D2AC 01DB8FAC B05E4224 */  addiu       $2, $2, %lo(UraEventMan)
/* 00D2B0 01DB8FB0 21184300 */  addu        $3, $2, $3
/* 00D2B4 01DB8FB4 001060AC */  sw          $0, 0x1000($3)
/* 00D2B8 01DB8FB8 341060AC */  sw          $0, 0x1034($3)
/* 00D2BC 01DB8FBC 381060AC */  sw          $0, 0x1038($3)
/* 00D2C0 01DB8FC0 301060AC */  sw          $0, 0x1030($3)
/* 00D2C4 01DB8FC4 FFFF0224 */  addiu       $2, $0, -0x1
/* 00D2C8 01DB8FC8 3C1062AC */  sw          $2, 0x103C($3)
/* 00D2CC 01DB8FCC 01008424 */  addiu       $4, $4, 0x1
.L01DB8FD0_2F45D0:
/* 00D2D0 01DB8FD0 60008228 */  slti        $2, $4, 0x60
/* 00D2D4 01DB8FD4 F3FF4014 */  bnez        $2, .L01DB8FA4_2F45A4
/* 00D2D8 01DB8FD8 00000000 */   nop
/* 00D2DC 01DB8FDC 28160070 */  paddub      $2, $0, $0
/* 00D2E0 01DB8FE0 0E000010 */  b           .L01DB901C_2F461C
/* 00D2E4 01DB8FE4 00000000 */   nop
.L01DB8FE8_2F45E8:
/* 00D2E8 01DB8FE8 FFFF0424 */  addiu       $4, $0, -0x1
/* 00D2EC 01DB8FEC 80180200 */  sll         $3, $2, 2
/* 00D2F0 01DB8FF0 21186200 */  addu        $3, $3, $2
/* 00D2F4 01DB8FF4 00290300 */  sll         $5, $3, 4
/* 00D2F8 01DB8FF8 DE01033C */  lui         $3, %hi(UraDungeonMap + 0x8D58)
/* 00D2FC 01DB8FFC 48E46324 */  addiu       $3, $3, %lo(UraDungeonMap + 0x8D58)
/* 00D300 01DB9000 21186500 */  addu        $3, $3, $5
/* 00D304 01DB9004 000064AC */  sw          $4, 0x0($3)
/* 00D308 01DB9008 DE01033C */  lui         $3, %hi(UraDungeonMap + 0x8D7C)
/* 00D30C 01DB900C 6CE46324 */  addiu       $3, $3, %lo(UraDungeonMap + 0x8D7C)
/* 00D310 01DB9010 21186500 */  addu        $3, $3, $5
/* 00D314 01DB9014 000060AC */  sw          $0, 0x0($3)
/* 00D318 01DB9018 01004224 */  addiu       $2, $2, 0x1
.L01DB901C_2F461C:
/* 00D31C 01DB901C 30004328 */  slti        $3, $2, 0x30
/* 00D320 01DB9020 F1FF6014 */  bnez        $3, .L01DB8FE8_2F45E8
/* 00D324 01DB9024 00000000 */   nop
/* 00D328 01DB9028 28160070 */  paddub      $2, $0, $0
/* 00D32C 01DB902C 0F000010 */  b           .L01DB906C_2F466C
/* 00D330 01DB9030 00000000 */   nop
.L01DB9034_2F4634:
/* 00D334 01DB9034 80210200 */  sll         $4, $2, 6
/* 00D338 01DB9038 DE01033C */  lui         $3, %hi(LIT_359__5 + 0x8)
/* 00D33C 01DB903C 500D6324 */  addiu       $3, $3, %lo(LIT_359__5 + 0x8)
/* 00D340 01DB9040 21186400 */  addu        $3, $3, $4
/* 00D344 01DB9044 000060AC */  sw          $0, 0x0($3)
/* 00D348 01DB9048 DE01033C */  lui         $3, %hi(LIT_379__4 + 0xC)
/* 00D34C 01DB904C 7C0D6324 */  addiu       $3, $3, %lo(LIT_379__4 + 0xC)
/* 00D350 01DB9050 21186400 */  addu        $3, $3, $4
/* 00D354 01DB9054 000060AC */  sw          $0, 0x0($3)
/* 00D358 01DB9058 DE01033C */  lui         $3, %hi(LIT_379__4 + 0x10)
/* 00D35C 01DB905C 800D6324 */  addiu       $3, $3, %lo(LIT_379__4 + 0x10)
/* 00D360 01DB9060 21186400 */  addu        $3, $3, $4
/* 00D364 01DB9064 000060AC */  sw          $0, 0x0($3)
/* 00D368 01DB9068 01004224 */  addiu       $2, $2, 0x1
.L01DB906C_2F466C:
/* 00D36C 01DB906C 18004328 */  slti        $3, $2, 0x18
/* 00D370 01DB9070 F0FF6014 */  bnez        $3, .L01DB9034_2F4634
/* 00D374 01DB9074 00000000 */   nop
/* 00D378 01DB9078 DE01013C */  lui         $1, %hi(__sinit_op_b.cpp + 0x50)
/* 00D37C 01DB907C 501320AC */  sw          $0, %lo(__sinit_op_b.cpp + 0x50)($1)
/* 00D380 01DB9080 28160070 */  paddub      $2, $0, $0
/* 00D384 01DB9084 07000010 */  b           .L01DB90A4_2F46A4
/* 00D388 01DB9088 00000000 */   nop
.L01DB908C_2F468C:
/* 00D38C 01DB908C 40210200 */  sll         $4, $2, 5
/* 00D390 01DB9090 DE01033C */  lui         $3, %hi(__sinit_op_b.cpp + 0x84)
/* 00D394 01DB9094 84136324 */  addiu       $3, $3, %lo(__sinit_op_b.cpp + 0x84)
/* 00D398 01DB9098 21186400 */  addu        $3, $3, $4
/* 00D39C 01DB909C 000060AC */  sw          $0, 0x0($3)
/* 00D3A0 01DB90A0 01004224 */  addiu       $2, $2, 0x1
.L01DB90A4_2F46A4:
/* 00D3A4 01DB90A4 08004328 */  slti        $3, $2, 0x8
/* 00D3A8 01DB90A8 F8FF6014 */  bnez        $3, .L01DB908C_2F468C
/* 00D3AC 01DB90AC 00000000 */   nop
/* 00D3B0 01DB90B0 DE01013C */  lui         $1, %hi(__sinit_op_b.cpp + 0x170)
/* 00D3B4 01DB90B4 701420AC */  sw          $0, %lo(__sinit_op_b.cpp + 0x170)($1)
/* 00D3B8 01DB90B8 28160070 */  paddub      $2, $0, $0
/* 00D3BC 01DB90BC 09000010 */  b           .L01DB90E4_2F46E4
/* 00D3C0 01DB90C0 00000000 */   nop
.L01DB90C4_2F46C4:
/* 00D3C4 01DB90C4 40180200 */  sll         $3, $2, 1
/* 00D3C8 01DB90C8 21186200 */  addu        $3, $3, $2
/* 00D3CC 01DB90CC C0200300 */  sll         $4, $3, 3
/* 00D3D0 01DB90D0 DE01033C */  lui         $3, %hi(__sinit_op_b.cpp + 0x18C)
/* 00D3D4 01DB90D4 8C146324 */  addiu       $3, $3, %lo(__sinit_op_b.cpp + 0x18C)
/* 00D3D8 01DB90D8 21186400 */  addu        $3, $3, $4
/* 00D3DC 01DB90DC 000060AC */  sw          $0, 0x0($3)
/* 00D3E0 01DB90E0 01004224 */  addiu       $2, $2, 0x1
.L01DB90E4_2F46E4:
/* 00D3E4 01DB90E4 04004328 */  slti        $3, $2, 0x4
/* 00D3E8 01DB90E8 F6FF6014 */  bnez        $3, .L01DB90C4_2F46C4
/* 00D3EC 01DB90EC 00000000 */   nop
/* 00D3F0 01DB90F0 DD01023C */  lui         $2, %hi(UraDungeonMap)
/* 00D3F4 01DB90F4 F0564424 */  addiu       $4, $2, %lo(UraDungeonMap)
/* 00D3F8 01DB90F8 06000524 */  addiu       $5, $0, 0x6
/* 00D3FC 01DB90FC 28360070 */  paddub      $6, $0, $0
/* 00D400 01DB9100 9C2D070C */  jal         buildRandomMap__11CDungeonMapFii
/* 00D404 01DB9104 00000000 */   nop
/* 00D408 01DB9108 DE01013C */  lui         $1, %hi(__sinit_op_c.cpp + 0x2C)
/* 00D40C 01DB910C DC14268C */  lw          $6, %lo(__sinit_op_c.cpp + 0x2C)($1)
/* 00D410 01DB9110 789C828F */  lw          $2, -0x6388($28)
/* 00D414 01DB9114 02004580 */  lb          $5, 0x2($2)
/* 00D418 01DB9118 DD01023C */  lui         $2, %hi(UraDungeonMap)
/* 00D41C 01DB911C F0564424 */  addiu       $4, $2, %lo(UraDungeonMap)
/* 00D420 01DB9120 283E0070 */  paddub      $7, $0, $0
/* 00D424 01DB9124 5021070C */  jal         buildEventData__11CDungeonMapFiii
/* 00D428 01DB9128 00000000 */   nop
/* 00D42C 01DB912C DD01023C */  lui         $2, %hi(UraDungeonMap)
/* 00D430 01DB9130 F0564424 */  addiu       $4, $2, %lo(UraDungeonMap)
/* 00D434 01DB9134 000F070C */  jal         FlushCheckMask__11CDungeonMapFv
/* 00D438 01DB9138 00000000 */   nop
/* 00D43C 01DB913C DE01013C */  lui         $1, %hi(__sinit_op_c.cpp + 0x2C)
/* 00D440 01DB9140 DC14258C */  lw          $5, %lo(__sinit_op_c.cpp + 0x2C)($1)
/* 00D444 01DB9144 DD01023C */  lui         $2, %hi(UraDungeonMap)
/* 00D448 01DB9148 F0564424 */  addiu       $4, $2, %lo(UraDungeonMap)
/* 00D44C 01DB914C 3009070C */  jal         DrawMapCalc__11CDungeonMapFi
/* 00D450 01DB9150 00000000 */   nop
/* 00D454 01DB9154 DE01013C */  lui         $1, %hi(__sinit_op_c.cpp + 0x2C)
/* 00D458 01DB9158 DC14268C */  lw          $6, %lo(__sinit_op_c.cpp + 0x2C)($1)
/* 00D45C 01DB915C DF01023C */  lui         $2, %hi(UraEventMan)
/* 00D460 01DB9160 B05E4424 */  addiu       $4, $2, %lo(UraEventMan)
/* 00D464 01DB9164 DD01023C */  lui         $2, %hi(UraDungeonMap)
/* 00D468 01DB9168 F0564524 */  addiu       $5, $2, %lo(UraDungeonMap)
/* 00D46C 01DB916C D033070C */  jal         SetupEvent__16CDungeonEventManFP11CDungeonMapi
/* 00D470 01DB9170 00000000 */   nop
/* 00D474 01DB9174 DC01023C */  lui         $2, %hi(MainDungeonMap)
/* 00D478 01DB9178 E04B4224 */  addiu       $2, $2, %lo(MainDungeonMap)
/* 00D47C 01DB917C C89C82AF */  sw          $2, -0x6338($28)
/* 00D480 01DB9180 DF01023C */  lui         $2, %hi(DngEventMan)
/* 00D484 01DB9184 B0364224 */  addiu       $2, $2, %lo(DngEventMan)
/* 00D488 01DB9188 D09C82AF */  sw          $2, -0x6330($28)
/* 00D48C 01DB918C 789C848F */  lw          $4, -0x6388($28)
/* 00D490 01DB9190 C8F6060C */  jal         ClearEventFlag__11CUserStatusFv
/* 00D494 01DB9194 00000000 */   nop
/* 00D498 01DB9198 C49C80AF */  sw          $0, -0x633C($28)
/* 00D49C 01DB919C AC9D80AF */  sw          $0, -0x6254($28)
/* 00D4A0 01DB91A0 B09D80AF */  sw          $0, -0x6250($28)
/* 00D4A4 01DB91A4 0000BF7B */  lq          $31, 0x0($29)
/* 00D4A8 01DB91A8 1000BD27 */  addiu       $29, $29, 0x10
/* 00D4AC 01DB91AC 0800E003 */  jr          $31
/* 00D4B0 01DB91B0 00000000 */   nop
/* 00D4B4 01DB91B4 00000000 */  nop
/* 00D4B8 01DB91B8 00000000 */  nop
/* 00D4BC 01DB91BC 00000000 */  nop
