.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FaceChange__Fi
/* 00CAD0 01DB87D0 20FFBD27 */  addiu       $29, $29, -0xE0
/* 00CAD4 01DB87D4 A000BF7F */  sq          $31, 0xA0($29)
/* 00CAD8 01DB87D8 9000B77F */  sq          $23, 0x90($29)
/* 00CADC 01DB87DC 8000B67F */  sq          $22, 0x80($29)
/* 00CAE0 01DB87E0 7000B57F */  sq          $21, 0x70($29)
/* 00CAE4 01DB87E4 6000B47F */  sq          $20, 0x60($29)
/* 00CAE8 01DB87E8 5000B37F */  sq          $19, 0x50($29)
/* 00CAEC 01DB87EC 4000B27F */  sq          $18, 0x40($29)
/* 00CAF0 01DB87F0 3000B17F */  sq          $17, 0x30($29)
/* 00CAF4 01DB87F4 2000B07F */  sq          $16, 0x20($29)
/* 00CAF8 01DB87F8 28AE8070 */  paddub      $21, $4, $0
/* 00CAFC 01DB87FC DD01023C */  lui         $2, %hi(LIT_1092)
/* 00CB00 01DB8800 E0674224 */  addiu       $2, $2, %lo(LIT_1092)
/* 00CB04 01DB8804 B000A327 */  addiu       $3, $29, 0xB0
/* 00CB08 01DB8808 00004278 */  lq          $2, 0x0($2)
/* 00CB0C 01DB880C 0000627C */  sq          $2, 0x0($3)
/* 00CB10 01DB8810 D48B848F */  lw          $4, -0x742C($28)
/* 00CB14 01DB8814 282E0070 */  paddub      $5, $0, $0
/* 00CB18 01DB8818 2083040C */  jal         sceVif1PkCnt
/* 00CB1C 01DB881C 00000000 */   nop
/* 00CB20 01DB8820 D48B848F */  lw          $4, -0x742C($28)
/* 00CB24 01DB8824 282E0070 */  paddub      $5, $0, $0
/* 00CB28 01DB8828 8E83040C */  jal         sceVif1PkOpenDirectCode
/* 00CB2C 01DB882C 00000000 */   nop
/* 00CB30 01DB8830 B000A227 */  addiu       $2, $29, 0xB0
/* 00CB34 01DB8834 D48B848F */  lw          $4, -0x742C($28)
/* 00CB38 01DB8838 00004578 */  lq          $5, 0x0($2)
/* 00CB3C 01DB883C B083040C */  jal         sceVif1PkOpenGifTag
/* 00CB40 01DB8840 00000000 */   nop
/* 00CB44 01DB8844 D48B848F */  lw          $4, -0x742C($28)
/* 00CB48 01DB8848 3F000524 */  addiu       $5, $0, 0x3F
/* 00CB4C 01DB884C 28360070 */  paddub      $6, $0, $0
/* 00CB50 01DB8850 0A84040C */  jal         sceVif1PkAddGsAD
/* 00CB54 01DB8854 00000000 */   nop
/* 00CB58 01DB8858 D48B848F */  lw          $4, -0x742C($28)
/* 00CB5C 01DB885C B683040C */  jal         sceVif1PkCloseGifTag
/* 00CB60 01DB8860 00000000 */   nop
/* 00CB64 01DB8864 D48B848F */  lw          $4, -0x742C($28)
/* 00CB68 01DB8868 A483040C */  jal         sceVif1PkCloseDirectCode
/* 00CB6C 01DB886C 00000000 */   nop
/* 00CB70 01DB8870 D48B848F */  lw          $4, -0x742C($28)
/* 00CB74 01DB8874 0A83040C */  jal         sceVif1PkTerminate
/* 00CB78 01DB8878 00000000 */   nop
/* 00CB7C 01DB887C 80101500 */  sll         $2, $21, 2
/* 00CB80 01DB8880 21105500 */  addu        $2, $2, $21
/* 00CB84 01DB8884 40100200 */  sll         $2, $2, 1
/* 00CB88 01DB8888 21105500 */  addu        $2, $2, $21
/* 00CB8C 01DB888C 80900200 */  sll         $18, $2, 2
/* 00CB90 01DB8890 DD01023C */  lui         $2, %hi(face$1093)
/* 00CB94 01DB8894 F0674224 */  addiu       $2, $2, %lo(face$1093)
/* 00CB98 01DB8898 21185200 */  addu        $3, $2, $18
/* 00CB9C 01DB889C C701023C */  lui         $2, %hi(TexManager)
/* 00CBA0 01DB88A0 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00CBA4 01DB88A4 0000658C */  lw          $5, 0x0($3)
/* 00CBA8 01DB88A8 FFFF0624 */  addiu       $6, $0, -0x1
/* 00CBAC 01DB88AC B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 00CBB0 01DB88B0 00000000 */   nop
/* 00CBB4 01DB88B4 288E4070 */  paddub      $17, $2, $0
/* 00CBB8 01DB88B8 DD01023C */  lui         $2, %hi(face$1093 + 0x4)
/* 00CBBC 01DB88BC F4674224 */  addiu       $2, $2, %lo(face$1093 + 0x4)
/* 00CBC0 01DB88C0 21185200 */  addu        $3, $2, $18
/* 00CBC4 01DB88C4 C701023C */  lui         $2, %hi(TexManager)
/* 00CBC8 01DB88C8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00CBCC 01DB88CC 0000658C */  lw          $5, 0x0($3)
/* 00CBD0 01DB88D0 FFFF0624 */  addiu       $6, $0, -0x1
/* 00CBD4 01DB88D4 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 00CBD8 01DB88D8 00000000 */   nop
/* 00CBDC 01DB88DC 03002012 */  beqz        $17, .L01DB88EC_2BE0EC
/* 00CBE0 01DB88E0 00000000 */   nop
/* 00CBE4 01DB88E4 03004014 */  bnez        $2, .L01DB88F4_2BE0F4
/* 00CBE8 01DB88E8 00000000 */   nop
.L01DB88EC_2BE0EC:
/* 00CBEC 01DB88EC 77010010 */  b           .L01DB8ECC_2BE6CC
/* 00CBF0 01DB88F0 00000000 */   nop
.L01DB88F4_2BE0F4:
/* 00CBF4 01DB88F4 2800438C */  lw          $3, 0x28($2)
/* 00CBF8 01DB88F8 FF3F7730 */  andi        $23, $3, 0x3FFF
/* 00CBFC 01DB88FC 2800238E */  lw          $3, 0x28($17)
/* 00CC00 01DB8900 FF3F7630 */  andi        $22, $3, 0x3FFF
/* 00CC04 01DB8904 280043DC */  ld          $3, 0x28($2)
/* 00CC08 01DB8908 BA1B0300 */  dsrl        $3, $3, 14
/* 00CC0C 01DB890C 3F006330 */  andi        $3, $3, 0x3F
/* 00CC10 01DB8910 3C800300 */  dsll32      $16, $3, 0
/* 00CC14 01DB8914 3F801000 */  dsra32      $16, $16, 0
/* 00CC18 01DB8918 280023DE */  ld          $3, 0x28($17)
/* 00CC1C 01DB891C BA1B0300 */  dsrl        $3, $3, 14
/* 00CC20 01DB8920 3F006330 */  andi        $3, $3, 0x3F
/* 00CC24 01DB8924 3C880300 */  dsll32      $17, $3, 0
/* 00CC28 01DB8928 3F881100 */  dsra32      $17, $17, 0
/* 00CC2C 01DB892C 01000324 */  addiu       $3, $0, 0x1
/* 00CC30 01DB8930 6601A312 */  beq         $21, $3, .L01DB8ECC_2BE6CC
/* 00CC34 01DB8934 00000000 */   nop
/* 00CC38 01DB8938 04000324 */  addiu       $3, $0, 0x4
/* 00CC3C 01DB893C 6301A312 */  beq         $21, $3, .L01DB8ECC_2BE6CC
/* 00CC40 01DB8940 00000000 */   nop
/* 00CC44 01DB8944 05000324 */  addiu       $3, $0, 0x5
/* 00CC48 01DB8948 6001A312 */  beq         $21, $3, .L01DB8ECC_2BE6CC
/* 00CC4C 01DB894C 00000000 */   nop
/* 00CC50 01DB8950 07000324 */  addiu       $3, $0, 0x7
/* 00CC54 01DB8954 5D01A312 */  beq         $21, $3, .L01DB8ECC_2BE6CC
/* 00CC58 01DB8958 00000000 */   nop
/* 00CC5C 01DB895C 0898828F */  lw          $2, -0x67F8($28)
/* 00CC60 01DB8960 78004014 */  bnez        $2, .L01DB8B44_2BE344
/* 00CC64 01DB8964 00000000 */   nop
/* 00CC68 01DB8968 40101500 */  sll         $2, $21, 1
/* 00CC6C 01DB896C 21105500 */  addu        $2, $2, $21
/* 00CC70 01DB8970 80100200 */  sll         $2, $2, 2
/* 00CC74 01DB8974 21105500 */  addu        $2, $2, $21
/* 00CC78 01DB8978 80200200 */  sll         $4, $2, 2
/* 00CC7C 01DB897C DE01023C */  lui         $2, %hi(CScript__2 + 0x44)
/* 00CC80 01DB8980 441B4224 */  addiu       $2, $2, %lo(CScript__2 + 0x44)
/* 00CC84 01DB8984 21A04400 */  addu        $20, $2, $4
/* 00CC88 01DB8988 0000838E */  lw          $3, 0x0($20)
/* 00CC8C 01DB898C DD01023C */  lui         $2, %hi(face$1093 + 0x24)
/* 00CC90 01DB8990 14684224 */  addiu       $2, $2, %lo(face$1093 + 0x24)
/* 00CC94 01DB8994 21285200 */  addu        $5, $2, $18
/* 00CC98 01DB8998 0000A28C */  lw          $2, 0x0($5)
/* 00CC9C 01DB899C 2A084300 */  slt         $1, $2, $3
/* 00CCA0 01DB89A0 05002010 */  beqz        $1, .L01DB89B8_2BE1B8
/* 00CCA4 01DB89A4 00000000 */   nop
/* 00CCA8 01DB89A8 DD01023C */  lui         $2, %hi(face$1093 + 0x28)
/* 00CCAC 01DB89AC 18684224 */  addiu       $2, $2, %lo(face$1093 + 0x28)
/* 00CCB0 01DB89B0 21105200 */  addu        $2, $2, $18
/* 00CCB4 01DB89B4 000040AC */  sw          $0, 0x0($2)
.L01DB89B8_2BE1B8:
/* 00CCB8 01DB89B8 DE01023C */  lui         $2, %hi(CScript__2 + 0x48)
/* 00CCBC 01DB89BC 481B4224 */  addiu       $2, $2, %lo(CScript__2 + 0x48)
/* 00CCC0 01DB89C0 21984400 */  addu        $19, $2, $4
/* 00CCC4 01DB89C4 000060C6 */  lwc1        $f0, 0x0($19)
/* 00CCC8 01DB89C8 DE01013C */  lui         $1, %hi(CScript__2 + 0x4E4)
/* 00CCCC 01DB89CC E41F21C4 */  lwc1        $f1, %lo(CScript__2 + 0x4E4)($1)
/* 00CCD0 01DB89D0 34000146 */  c.lt.s      $f0, $f1
/* 00CCD4 01DB89D4 00000000 */  nop
/* 00CCD8 01DB89D8 23000145 */  bc1t        .L01DB8A68_2BE268
/* 00CCDC 01DB89DC 00000000 */   nop
/* 00CCE0 01DB89E0 01000146 */  sub.s       $f0, $f0, $f1
/* 00CCE4 01DB89E4 000060E6 */  swc1        $f0, 0x0($19)
/* 00CCE8 01DB89E8 DD01023C */  lui         $2, %hi(face$1093 + 0x28)
/* 00CCEC 01DB89EC 18684224 */  addiu       $2, $2, %lo(face$1093 + 0x28)
/* 00CCF0 01DB89F0 21305200 */  addu        $6, $2, $18
/* 00CCF4 01DB89F4 0000C48C */  lw          $4, 0x0($6)
/* 00CCF8 01DB89F8 02000324 */  addiu       $3, $0, 0x2
/* 00CCFC 01DB89FC 13008310 */  beq         $4, $3, .L01DB8A4C_2BE24C
/* 00CD00 01DB8A00 00000000 */   nop
/* 00CD04 01DB8A04 01000224 */  addiu       $2, $0, 0x1
/* 00CD08 01DB8A08 03008210 */  beq         $4, $2, .L01DB8A18_2BE218
/* 00CD0C 01DB8A0C 00000000 */   nop
/* 00CD10 01DB8A10 4C000010 */  b           .L01DB8B44_2BE344
/* 00CD14 01DB8A14 00000000 */   nop
.L01DB8A18_2BE218:
/* 00CD18 01DB8A18 0000828E */  lw          $2, 0x0($20)
/* 00CD1C 01DB8A1C 0000A48C */  lw          $4, 0x0($5)
/* 00CD20 01DB8A20 2A084400 */  slt         $1, $2, $4
/* 00CD24 01DB8A24 47002010 */  beqz        $1, .L01DB8B44_2BE344
/* 00CD28 01DB8A28 00000000 */   nop
/* 00CD2C 01DB8A2C 01004224 */  addiu       $2, $2, 0x1
/* 00CD30 01DB8A30 000082AE */  sw          $2, 0x0($20)
/* 00CD34 01DB8A34 0000828E */  lw          $2, 0x0($20)
/* 00CD38 01DB8A38 42004414 */  bne         $2, $4, .L01DB8B44_2BE344
/* 00CD3C 01DB8A3C 00000000 */   nop
/* 00CD40 01DB8A40 0000C3AC */  sw          $3, 0x0($6)
/* 00CD44 01DB8A44 3F000010 */  b           .L01DB8B44_2BE344
/* 00CD48 01DB8A48 00000000 */   nop
.L01DB8A4C_2BE24C:
/* 00CD4C 01DB8A4C 0000828E */  lw          $2, 0x0($20)
/* 00CD50 01DB8A50 3C004018 */  blez        $2, .L01DB8B44_2BE344
/* 00CD54 01DB8A54 00000000 */   nop
/* 00CD58 01DB8A58 FFFF4224 */  addiu       $2, $2, -0x1
/* 00CD5C 01DB8A5C 000082AE */  sw          $2, 0x0($20)
/* 00CD60 01DB8A60 38000010 */  b           .L01DB8B44_2BE344
/* 00CD64 01DB8A64 00000000 */   nop
.L01DB8A68_2BE268:
/* 00CD68 01DB8A68 BE11040C */  jal         rand
/* 00CD6C 01DB8A6C 00000000 */   nop
/* 00CD70 01DB8A70 C8000324 */  addiu       $3, $0, 0xC8
/* 00CD74 01DB8A74 1A004300 */  div         $0, $2, $3
/* 00CD78 01DB8A78 00000000 */  nop
/* 00CD7C 01DB8A7C 00000000 */  nop
/* 00CD80 01DB8A80 10100000 */  mfhi        $2
/* 00CD84 01DB8A84 12004014 */  bnez        $2, .L01DB8AD0_2BE2D0
/* 00CD88 01DB8A88 00000000 */   nop
/* 00CD8C 01DB8A8C 0000828E */  lw          $2, 0x0($20)
/* 00CD90 01DB8A90 2C004014 */  bnez        $2, .L01DB8B44_2BE344
/* 00CD94 01DB8A94 00000000 */   nop
/* 00CD98 01DB8A98 01000324 */  addiu       $3, $0, 0x1
/* 00CD9C 01DB8A9C DD01023C */  lui         $2, %hi(face$1093 + 0x28)
/* 00CDA0 01DB8AA0 18684224 */  addiu       $2, $2, %lo(face$1093 + 0x28)
/* 00CDA4 01DB8AA4 21105200 */  addu        $2, $2, $18
/* 00CDA8 01DB8AA8 000043AC */  sw          $3, 0x0($2)
/* 00CDAC 01DB8AAC 000083AE */  sw          $3, 0x0($20)
/* 00CDB0 01DB8AB0 7041023C */  lui         $2, (0x41700000 >> 16)
/* 00CDB4 01DB8AB4 00088244 */  mtc1        $2, $f1
/* 00CDB8 01DB8AB8 DE01013C */  lui         $1, %hi(CScript__2 + 0x4E4)
/* 00CDBC 01DB8ABC E41F20C4 */  lwc1        $f0, %lo(CScript__2 + 0x4E4)($1)
/* 00CDC0 01DB8AC0 02080046 */  mul.s       $f0, $f1, $f0
/* 00CDC4 01DB8AC4 000060E6 */  swc1        $f0, 0x0($19)
/* 00CDC8 01DB8AC8 1E000010 */  b           .L01DB8B44_2BE344
/* 00CDCC 01DB8ACC 00000000 */   nop
.L01DB8AD0_2BE2D0:
/* 00CDD0 01DB8AD0 02000224 */  addiu       $2, $0, 0x2
/* 00CDD4 01DB8AD4 1600A216 */  bne         $21, $2, .L01DB8B30_2BE330
/* 00CDD8 01DB8AD8 00000000 */   nop
/* 00CDDC 01DB8ADC DE01013C */  lui         $1, %hi(CScript__2 + 0xAC)
/* 00CDE0 01DB8AE0 AC1B238C */  lw          $3, %lo(CScript__2 + 0xAC)($1)
/* 00CDE4 01DB8AE4 05000224 */  addiu       $2, $0, 0x5
/* 00CDE8 01DB8AE8 0A006214 */  bne         $3, $2, .L01DB8B14_2BE314
/* 00CDEC 01DB8AEC 00000000 */   nop
/* 00CDF0 01DB8AF0 04000224 */  addiu       $2, $0, 0x4
/* 00CDF4 01DB8AF4 DE01013C */  lui         $1, %hi(CScript__2 + 0xAC)
/* 00CDF8 01DB8AF8 AC1B22AC */  sw          $2, %lo(CScript__2 + 0xAC)($1)
/* 00CDFC 01DB8AFC DE01013C */  lui         $1, %hi(CScript__2 + 0x4E4)
/* 00CE00 01DB8B00 E41F20C4 */  lwc1        $f0, %lo(CScript__2 + 0x4E4)($1)
/* 00CE04 01DB8B04 DE01013C */  lui         $1, %hi(CScript__2 + 0xB0)
/* 00CE08 01DB8B08 B01B20E4 */  swc1        $f0, %lo(CScript__2 + 0xB0)($1)
/* 00CE0C 01DB8B0C 0D000010 */  b           .L01DB8B44_2BE344
/* 00CE10 01DB8B10 00000000 */   nop
.L01DB8B14_2BE314:
/* 00CE14 01DB8B14 000080AE */  sw          $0, 0x0($20)
/* 00CE18 01DB8B18 DD01023C */  lui         $2, %hi(face$1093 + 0x28)
/* 00CE1C 01DB8B1C 18684224 */  addiu       $2, $2, %lo(face$1093 + 0x28)
/* 00CE20 01DB8B20 21105200 */  addu        $2, $2, $18
/* 00CE24 01DB8B24 000040AC */  sw          $0, 0x0($2)
/* 00CE28 01DB8B28 06000010 */  b           .L01DB8B44_2BE344
/* 00CE2C 01DB8B2C 00000000 */   nop
.L01DB8B30_2BE330:
/* 00CE30 01DB8B30 000080AE */  sw          $0, 0x0($20)
/* 00CE34 01DB8B34 DD01023C */  lui         $2, %hi(face$1093 + 0x28)
/* 00CE38 01DB8B38 18684224 */  addiu       $2, $2, %lo(face$1093 + 0x28)
/* 00CE3C 01DB8B3C 21105200 */  addu        $2, $2, $18
/* 00CE40 01DB8B40 000040AC */  sw          $0, 0x0($2)
.L01DB8B44_2BE344:
/* 00CE44 01DB8B44 40101500 */  sll         $2, $21, 1
/* 00CE48 01DB8B48 21105500 */  addu        $2, $2, $21
/* 00CE4C 01DB8B4C 80100200 */  sll         $2, $2, 2
/* 00CE50 01DB8B50 21105500 */  addu        $2, $2, $21
/* 00CE54 01DB8B54 80980200 */  sll         $19, $2, 2
/* 00CE58 01DB8B58 DE01023C */  lui         $2, %hi(CScript__2 + 0x44)
/* 00CE5C 01DB8B5C 441B4224 */  addiu       $2, $2, %lo(CScript__2 + 0x44)
/* 00CE60 01DB8B60 21105300 */  addu        $2, $2, $19
/* 00CE64 01DB8B64 0000438C */  lw          $3, 0x0($2)
/* 00CE68 01DB8B68 DD01023C */  lui         $2, %hi(face$1093 + 0x18)
/* 00CE6C 01DB8B6C 08684224 */  addiu       $2, $2, %lo(face$1093 + 0x18)
/* 00CE70 01DB8B70 21205200 */  addu        $4, $2, $18
/* 00CE74 01DB8B74 000083AC */  sw          $3, 0x0($4)
/* 00CE78 01DB8B78 DD01023C */  lui         $2, %hi(face$1093 + 0xC)
/* 00CE7C 01DB8B7C FC674224 */  addiu       $2, $2, %lo(face$1093 + 0xC)
/* 00CE80 01DB8B80 21105200 */  addu        $2, $2, $18
/* 00CE84 01DB8B84 0000458C */  lw          $5, 0x0($2)
/* 00CE88 01DB8B88 DD01023C */  lui         $2, %hi(face$1093 + 0x20)
/* 00CE8C 01DB8B8C 10684224 */  addiu       $2, $2, %lo(face$1093 + 0x20)
/* 00CE90 01DB8B90 21A05200 */  addu        $20, $2, $18
/* 00CE94 01DB8B94 0000838E */  lw          $3, 0x0($20)
/* 00CE98 01DB8B98 0000828C */  lw          $2, 0x0($4)
/* 00CE9C 01DB8B9C 01004224 */  addiu       $2, $2, 0x1
/* 00CEA0 01DB8BA0 1810A200 */  mult        $2, $5, $2
/* 00CEA4 01DB8BA4 23106200 */  subu        $2, $3, $2
/* 00CEA8 01DB8BA8 C000A0AF */  sw          $0, 0xC0($29)
/* 00CEAC 01DB8BAC C400A2AF */  sw          $2, 0xC4($29)
/* 00CEB0 01DB8BB0 80000224 */  addiu       $2, $0, 0x80
/* 00CEB4 01DB8BB4 C800A2AF */  sw          $2, 0xC8($29)
/* 00CEB8 01DB8BB8 CC00A5AF */  sw          $5, 0xCC($29)
/* 00CEBC 01DB8BBC 0000A0FF */  sd          $0, 0x0($29)
/* 00CEC0 01DB8BC0 58000324 */  addiu       $3, $0, 0x58
/* 00CEC4 01DB8BC4 DD01023C */  lui         $2, %hi(face$1093 + 0x8)
/* 00CEC8 01DB8BC8 F8674224 */  addiu       $2, $2, %lo(face$1093 + 0x8)
/* 00CECC 01DB8BCC 21105200 */  addu        $2, $2, $18
/* 00CED0 01DB8BD0 0000428C */  lw          $2, 0x0($2)
/* 00CED4 01DB8BD4 23106200 */  subu        $2, $3, $2
/* 00CED8 01DB8BD8 0800A2FF */  sd          $2, 0x8($29)
/* 00CEDC 01DB8BDC 1000A0FF */  sd          $0, 0x10($29)
/* 00CEE0 01DB8BE0 D48B848F */  lw          $4, -0x742C($28)
/* 00CEE4 01DB8BE4 282EE072 */  paddub      $5, $23, $0
/* 00CEE8 01DB8BE8 28360072 */  paddub      $6, $16, $0
/* 00CEEC 01DB8BEC 13000724 */  addiu       $7, $0, 0x13
/* 00CEF0 01DB8BF0 C000A827 */  addiu       $8, $29, 0xC0
/* 00CEF4 01DB8BF4 284EC072 */  paddub      $9, $22, $0
/* 00CEF8 01DB8BF8 28562072 */  paddub      $10, $17, $0
/* 00CEFC 01DB8BFC 285EE070 */  paddub      $11, $7, $0
/* 00CF00 01DB8C00 9801050C */  jal         MoveImageTest__FP13sceVif1PacketiiiRC8CRect_i_iiiiii
/* 00CF04 01DB8C04 00000000 */   nop
/* 00CF08 01DB8C08 0898868F */  lw          $6, -0x67F8($28)
/* 00CF0C 01DB8C0C 2B00C014 */  bnez        $6, .L01DB8CBC_2BE4BC
/* 00CF10 01DB8C10 00000000 */   nop
/* 00CF14 01DB8C14 DE01013C */  lui         $1, %hi(CScript__2 + 0xB0)
/* 00CF18 01DB8C18 B01B21C4 */  lwc1        $f1, %lo(CScript__2 + 0xB0)($1)
/* 00CF1C 01DB8C1C 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 00CF20 01DB8C20 00008244 */  mtc1        $2, $f0
/* 00CF24 01DB8C24 00000000 */  nop
/* 00CF28 01DB8C28 36080046 */  c.le.s      $f1, $f0
/* 00CF2C 01DB8C2C 00000000 */  nop
/* 00CF30 01DB8C30 11000145 */  bc1t        .L01DB8C78_2BE478
/* 00CF34 01DB8C34 00000000 */   nop
/* 00CF38 01DB8C38 DE01013C */  lui         $1, %hi(CScript__2 + 0xAC)
/* 00CF3C 01DB8C3C AC1B238C */  lw          $3, %lo(CScript__2 + 0xAC)($1)
/* 00CF40 01DB8C40 04000224 */  addiu       $2, $0, 0x4
/* 00CF44 01DB8C44 04006214 */  bne         $3, $2, .L01DB8C58_2BE458
/* 00CF48 01DB8C48 00000000 */   nop
/* 00CF4C 01DB8C4C 05000224 */  addiu       $2, $0, 0x5
/* 00CF50 01DB8C50 DE01013C */  lui         $1, %hi(CScript__2 + 0xAC)
/* 00CF54 01DB8C54 AC1B22AC */  sw          $2, %lo(CScript__2 + 0xAC)($1)
.L01DB8C58_2BE458:
/* 00CF58 01DB8C58 DE01013C */  lui         $1, %hi(CScript__2 + 0xAC)
/* 00CF5C 01DB8C5C AC1B238C */  lw          $3, %lo(CScript__2 + 0xAC)($1)
/* 00CF60 01DB8C60 06000224 */  addiu       $2, $0, 0x6
/* 00CF64 01DB8C64 04006214 */  bne         $3, $2, .L01DB8C78_2BE478
/* 00CF68 01DB8C68 00000000 */   nop
/* 00CF6C 01DB8C6C 07000224 */  addiu       $2, $0, 0x7
/* 00CF70 01DB8C70 DE01013C */  lui         $1, %hi(CScript__2 + 0xAC)
/* 00CF74 01DB8C74 AC1B22AC */  sw          $2, %lo(CScript__2 + 0xAC)($1)
.L01DB8C78_2BE478:
/* 00CF78 01DB8C78 DE01013C */  lui         $1, %hi(CScript__2 + 0xE4)
/* 00CF7C 01DB8C7C E41B21C4 */  lwc1        $f1, %lo(CScript__2 + 0xE4)($1)
/* 00CF80 01DB8C80 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 00CF84 01DB8C84 00008244 */  mtc1        $2, $f0
/* 00CF88 01DB8C88 00000000 */  nop
/* 00CF8C 01DB8C8C 36080046 */  c.le.s      $f1, $f0
/* 00CF90 01DB8C90 00000000 */  nop
/* 00CF94 01DB8C94 09000145 */  bc1t        .L01DB8CBC_2BE4BC
/* 00CF98 01DB8C98 00000000 */   nop
/* 00CF9C 01DB8C9C DE01013C */  lui         $1, %hi(CScript__2 + 0xE0)
/* 00CFA0 01DB8CA0 E01B238C */  lw          $3, %lo(CScript__2 + 0xE0)($1)
/* 00CFA4 01DB8CA4 03000224 */  addiu       $2, $0, 0x3
/* 00CFA8 01DB8CA8 04006214 */  bne         $3, $2, .L01DB8CBC_2BE4BC
/* 00CFAC 01DB8CAC 00000000 */   nop
/* 00CFB0 01DB8CB0 04000224 */  addiu       $2, $0, 0x4
/* 00CFB4 01DB8CB4 DE01013C */  lui         $1, %hi(CScript__2 + 0xE0)
/* 00CFB8 01DB8CB8 E01B22AC */  sw          $2, %lo(CScript__2 + 0xE0)($1)
.L01DB8CBC_2BE4BC:
/* 00CFBC 01DB8CBC 3600C014 */  bnez        $6, .L01DB8D98_2BE598
/* 00CFC0 01DB8CC0 00000000 */   nop
/* 00CFC4 01DB8CC4 DE01023C */  lui         $2, %hi(CScript__2 + 0x50)
/* 00CFC8 01DB8CC8 501B4224 */  addiu       $2, $2, %lo(CScript__2 + 0x50)
/* 00CFCC 01DB8CCC 21185300 */  addu        $3, $2, $19
/* 00CFD0 01DB8CD0 000060C4 */  lwc1        $f0, 0x0($3)
/* 00CFD4 01DB8CD4 DE01013C */  lui         $1, %hi(CScript__2 + 0x4E4)
/* 00CFD8 01DB8CD8 E41F21C4 */  lwc1        $f1, %lo(CScript__2 + 0x4E4)($1)
/* 00CFDC 01DB8CDC 34000146 */  c.lt.s      $f0, $f1
/* 00CFE0 01DB8CE0 00000000 */  nop
/* 00CFE4 01DB8CE4 24000145 */  bc1t        .L01DB8D78_2BE578
/* 00CFE8 01DB8CE8 00000000 */   nop
/* 00CFEC 01DB8CEC 01000146 */  sub.s       $f0, $f0, $f1
/* 00CFF0 01DB8CF0 000060E4 */  swc1        $f0, 0x0($3)
/* 00CFF4 01DB8CF4 DE01023C */  lui         $2, %hi(CScript__2 + 0x54)
/* 00CFF8 01DB8CF8 541B4224 */  addiu       $2, $2, %lo(CScript__2 + 0x54)
/* 00CFFC 01DB8CFC 21105300 */  addu        $2, $2, $19
/* 00D000 01DB8D00 00004290 */  lbu         $2, 0x0($2)
/* 00D004 01DB8D04 24004010 */  beqz        $2, .L01DB8D98_2BE598
/* 00D008 01DB8D08 00000000 */   nop
/* 00D00C 01DB8D0C C842023C */  lui         $2, (0x42C80000 >> 16)
/* 00D010 01DB8D10 00088244 */  mtc1        $2, $f1
/* 00D014 01DB8D14 000060C4 */  lwc1        $f0, 0x0($3)
/* 00D018 01DB8D18 020B0046 */  mul.s       $f12, $f1, $f0
/* 00D01C 01DB8D1C 2C44040C */  jal         fptosi
/* 00D020 01DB8D20 00000000 */   nop
/* 00D024 01DB8D24 06000324 */  addiu       $3, $0, 0x6
/* 00D028 01DB8D28 1A004300 */  div         $0, $2, $3
/* 00D02C 01DB8D2C 00000000 */  nop
/* 00D030 01DB8D30 00000000 */  nop
/* 00D034 01DB8D34 10100000 */  mfhi        $2
/* 00D038 01DB8D38 17004014 */  bnez        $2, .L01DB8D98_2BE598
/* 00D03C 01DB8D3C 00000000 */   nop
/* 00D040 01DB8D40 BE11040C */  jal         rand
/* 00D044 01DB8D44 00000000 */   nop
/* 00D048 01DB8D48 03004330 */  andi        $3, $2, 0x3
/* 00D04C 01DB8D4C 04004104 */  bgez        $2, .L01DB8D60_2BE560
/* 00D050 01DB8D50 00000000 */   nop
/* 00D054 01DB8D54 02006010 */  beqz        $3, .L01DB8D60_2BE560
/* 00D058 01DB8D58 00000000 */   nop
/* 00D05C 01DB8D5C FCFF6324 */  addiu       $3, $3, -0x4
.L01DB8D60_2BE560:
/* 00D060 01DB8D60 DE01023C */  lui         $2, %hi(CScript__2 + 0x4C)
/* 00D064 01DB8D64 4C1B4224 */  addiu       $2, $2, %lo(CScript__2 + 0x4C)
/* 00D068 01DB8D68 21105300 */  addu        $2, $2, $19
/* 00D06C 01DB8D6C 000043AC */  sw          $3, 0x0($2)
/* 00D070 01DB8D70 09000010 */  b           .L01DB8D98_2BE598
/* 00D074 01DB8D74 00000000 */   nop
.L01DB8D78_2BE578:
/* 00D078 01DB8D78 DE01023C */  lui         $2, %hi(CScript__2 + 0x4C)
/* 00D07C 01DB8D7C 4C1B4224 */  addiu       $2, $2, %lo(CScript__2 + 0x4C)
/* 00D080 01DB8D80 21105300 */  addu        $2, $2, $19
/* 00D084 01DB8D84 000040AC */  sw          $0, 0x0($2)
/* 00D088 01DB8D88 DE01023C */  lui         $2, %hi(CScript__2 + 0x54)
/* 00D08C 01DB8D8C 541B4224 */  addiu       $2, $2, %lo(CScript__2 + 0x54)
/* 00D090 01DB8D90 21105300 */  addu        $2, $2, $19
/* 00D094 01DB8D94 000040A0 */  sb          $0, 0x0($2)
.L01DB8D98_2BE598:
/* 00D098 01DB8D98 DE01023C */  lui         $2, %hi(CScript__2 + 0x4C)
/* 00D09C 01DB8D9C 4C1B4224 */  addiu       $2, $2, %lo(CScript__2 + 0x4C)
/* 00D0A0 01DB8DA0 21105300 */  addu        $2, $2, $19
/* 00D0A4 01DB8DA4 0000438C */  lw          $3, 0x0($2)
/* 00D0A8 01DB8DA8 DD01023C */  lui         $2, %hi(face$1093 + 0x1C)
/* 00D0AC 01DB8DAC 0C684224 */  addiu       $2, $2, %lo(face$1093 + 0x1C)
/* 00D0B0 01DB8DB0 21205200 */  addu        $4, $2, $18
/* 00D0B4 01DB8DB4 000083AC */  sw          $3, 0x0($4)
/* 00D0B8 01DB8DB8 DD01023C */  lui         $2, %hi(face$1093 + 0x14)
/* 00D0BC 01DB8DBC 04684224 */  addiu       $2, $2, %lo(face$1093 + 0x14)
/* 00D0C0 01DB8DC0 21105200 */  addu        $2, $2, $18
/* 00D0C4 01DB8DC4 0000458C */  lw          $5, 0x0($2)
/* 00D0C8 01DB8DC8 0000828C */  lw          $2, 0x0($4)
/* 00D0CC 01DB8DCC 01004224 */  addiu       $2, $2, 0x1
/* 00D0D0 01DB8DD0 1818A200 */  mult        $3, $5, $2
/* 00D0D4 01DB8DD4 0000828E */  lw          $2, 0x0($20)
/* 00D0D8 01DB8DD8 23184300 */  subu        $3, $2, $3
/* 00D0DC 01DB8DDC 80000224 */  addiu       $2, $0, 0x80
/* 00D0E0 01DB8DE0 D000A2AF */  sw          $2, 0xD0($29)
/* 00D0E4 01DB8DE4 D400A3AF */  sw          $3, 0xD4($29)
/* 00D0E8 01DB8DE8 D800A2AF */  sw          $2, 0xD8($29)
/* 00D0EC 01DB8DEC DC00A5AF */  sw          $5, 0xDC($29)
/* 00D0F0 01DB8DF0 0000A0FF */  sd          $0, 0x0($29)
/* 00D0F4 01DB8DF4 58000324 */  addiu       $3, $0, 0x58
/* 00D0F8 01DB8DF8 DD01023C */  lui         $2, %hi(face$1093 + 0x10)
/* 00D0FC 01DB8DFC 00684224 */  addiu       $2, $2, %lo(face$1093 + 0x10)
/* 00D100 01DB8E00 21105200 */  addu        $2, $2, $18
/* 00D104 01DB8E04 0000428C */  lw          $2, 0x0($2)
/* 00D108 01DB8E08 23106200 */  subu        $2, $3, $2
/* 00D10C 01DB8E0C 0800A2FF */  sd          $2, 0x8($29)
/* 00D110 01DB8E10 1000A0FF */  sd          $0, 0x10($29)
/* 00D114 01DB8E14 D48B848F */  lw          $4, -0x742C($28)
/* 00D118 01DB8E18 282EE072 */  paddub      $5, $23, $0
/* 00D11C 01DB8E1C 28360072 */  paddub      $6, $16, $0
/* 00D120 01DB8E20 13000724 */  addiu       $7, $0, 0x13
/* 00D124 01DB8E24 D000A827 */  addiu       $8, $29, 0xD0
/* 00D128 01DB8E28 284EC072 */  paddub      $9, $22, $0
/* 00D12C 01DB8E2C 28562072 */  paddub      $10, $17, $0
/* 00D130 01DB8E30 285EE070 */  paddub      $11, $7, $0
/* 00D134 01DB8E34 9801050C */  jal         MoveImageTest__FP13sceVif1PacketiiiRC8CRect_i_iiiiii
/* 00D138 01DB8E38 00000000 */   nop
/* 00D13C 01DB8E3C 0898828F */  lw          $2, -0x67F8($28)
/* 00D140 01DB8E40 09004014 */  bnez        $2, .L01DB8E68_2BE668
/* 00D144 01DB8E44 00000000 */   nop
/* 00D148 01DB8E48 DE01013C */  lui         $1, %hi(CScript__2 + 0xB4)
/* 00D14C 01DB8E4C B41B238C */  lw          $3, %lo(CScript__2 + 0xB4)($1)
/* 00D150 01DB8E50 04000224 */  addiu       $2, $0, 0x4
/* 00D154 01DB8E54 04006214 */  bne         $3, $2, .L01DB8E68_2BE668
/* 00D158 01DB8E58 00000000 */   nop
/* 00D15C 01DB8E5C 05000224 */  addiu       $2, $0, 0x5
/* 00D160 01DB8E60 DE01013C */  lui         $1, %hi(CScript__2 + 0xB4)
/* 00D164 01DB8E64 B41B22AC */  sw          $2, %lo(CScript__2 + 0xB4)($1)
.L01DB8E68_2BE668:
/* 00D168 01DB8E68 D48B848F */  lw          $4, -0x742C($28)
/* 00D16C 01DB8E6C 282E0070 */  paddub      $5, $0, $0
/* 00D170 01DB8E70 2083040C */  jal         sceVif1PkCnt
/* 00D174 01DB8E74 00000000 */   nop
/* 00D178 01DB8E78 D48B848F */  lw          $4, -0x742C($28)
/* 00D17C 01DB8E7C 282E0070 */  paddub      $5, $0, $0
/* 00D180 01DB8E80 8E83040C */  jal         sceVif1PkOpenDirectCode
/* 00D184 01DB8E84 00000000 */   nop
/* 00D188 01DB8E88 C701023C */  lui         $2, %hi(GiftagAD)
/* 00D18C 01DB8E8C C0524224 */  addiu       $2, $2, %lo(GiftagAD)
/* 00D190 01DB8E90 D48B848F */  lw          $4, -0x742C($28)
/* 00D194 01DB8E94 00004578 */  lq          $5, 0x0($2)
/* 00D198 01DB8E98 B083040C */  jal         sceVif1PkOpenGifTag
/* 00D19C 01DB8E9C 00000000 */   nop
/* 00D1A0 01DB8EA0 D48B848F */  lw          $4, -0x742C($28)
/* 00D1A4 01DB8EA4 3F000524 */  addiu       $5, $0, 0x3F
/* 00D1A8 01DB8EA8 28360070 */  paddub      $6, $0, $0
/* 00D1AC 01DB8EAC 0A84040C */  jal         sceVif1PkAddGsAD
/* 00D1B0 01DB8EB0 00000000 */   nop
/* 00D1B4 01DB8EB4 D48B848F */  lw          $4, -0x742C($28)
/* 00D1B8 01DB8EB8 B683040C */  jal         sceVif1PkCloseGifTag
/* 00D1BC 01DB8EBC 00000000 */   nop
/* 00D1C0 01DB8EC0 D48B848F */  lw          $4, -0x742C($28)
/* 00D1C4 01DB8EC4 A483040C */  jal         sceVif1PkCloseDirectCode
/* 00D1C8 01DB8EC8 00000000 */   nop
.L01DB8ECC_2BE6CC:
/* 00D1CC 01DB8ECC A000BF7B */  lq          $31, 0xA0($29)
/* 00D1D0 01DB8ED0 9000B77B */  lq          $23, 0x90($29)
/* 00D1D4 01DB8ED4 8000B67B */  lq          $22, 0x80($29)
/* 00D1D8 01DB8ED8 7000B57B */  lq          $21, 0x70($29)
/* 00D1DC 01DB8EDC 6000B47B */  lq          $20, 0x60($29)
/* 00D1E0 01DB8EE0 5000B37B */  lq          $19, 0x50($29)
/* 00D1E4 01DB8EE4 4000B27B */  lq          $18, 0x40($29)
/* 00D1E8 01DB8EE8 3000B17B */  lq          $17, 0x30($29)
/* 00D1EC 01DB8EEC 2000B07B */  lq          $16, 0x20($29)
/* 00D1F0 01DB8EF0 E000BD27 */  addiu       $29, $29, 0xE0
/* 00D1F4 01DB8EF4 0800E003 */  jr          $31
/* 00D1F8 01DB8EF8 00000000 */   nop
/* 00D1FC 01DB8EFC 00000000 */  nop
