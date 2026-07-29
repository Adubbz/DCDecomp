.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FaceChange__Fi__2
/* 00FD90 01DBBA90 40FFBD27 */  addiu       $29, $29, -0xC0
/* 00FD94 01DBBA94 9000BF7F */  sq          $31, 0x90($29)
/* 00FD98 01DBBA98 8000B67F */  sq          $22, 0x80($29)
/* 00FD9C 01DBBA9C 7000B57F */  sq          $21, 0x70($29)
/* 00FDA0 01DBBAA0 6000B47F */  sq          $20, 0x60($29)
/* 00FDA4 01DBBAA4 5000B37F */  sq          $19, 0x50($29)
/* 00FDA8 01DBBAA8 4000B27F */  sq          $18, 0x40($29)
/* 00FDAC 01DBBAAC 3000B17F */  sq          $17, 0x30($29)
/* 00FDB0 01DBBAB0 2000B07F */  sq          $16, 0x20($29)
/* 00FDB4 01DBBAB4 28A68070 */  paddub      $20, $4, $0
/* 00FDB8 01DBBAB8 D48B848F */  lw          $4, -0x742C($28)
/* 00FDBC 01DBBABC 282E0070 */  paddub      $5, $0, $0
/* 00FDC0 01DBBAC0 2083040C */  jal         sceVif1PkCnt
/* 00FDC4 01DBBAC4 00000000 */   nop
/* 00FDC8 01DBBAC8 D48B848F */  lw          $4, -0x742C($28)
/* 00FDCC 01DBBACC 282E0070 */  paddub      $5, $0, $0
/* 00FDD0 01DBBAD0 8E83040C */  jal         sceVif1PkOpenDirectCode
/* 00FDD4 01DBBAD4 00000000 */   nop
/* 00FDD8 01DBBAD8 C701023C */  lui         $2, %hi(GiftagAD)
/* 00FDDC 01DBBADC C0524224 */  addiu       $2, $2, %lo(GiftagAD)
/* 00FDE0 01DBBAE0 D48B848F */  lw          $4, -0x742C($28)
/* 00FDE4 01DBBAE4 00004578 */  lq          $5, 0x0($2)
/* 00FDE8 01DBBAE8 B083040C */  jal         sceVif1PkOpenGifTag
/* 00FDEC 01DBBAEC 00000000 */   nop
/* 00FDF0 01DBBAF0 D48B848F */  lw          $4, -0x742C($28)
/* 00FDF4 01DBBAF4 3F000524 */  addiu       $5, $0, 0x3F
/* 00FDF8 01DBBAF8 28360070 */  paddub      $6, $0, $0
/* 00FDFC 01DBBAFC 0A84040C */  jal         sceVif1PkAddGsAD
/* 00FE00 01DBBB00 00000000 */   nop
/* 00FE04 01DBBB04 D48B848F */  lw          $4, -0x742C($28)
/* 00FE08 01DBBB08 B683040C */  jal         sceVif1PkCloseGifTag
/* 00FE0C 01DBBB0C 00000000 */   nop
/* 00FE10 01DBBB10 D48B848F */  lw          $4, -0x742C($28)
/* 00FE14 01DBBB14 A483040C */  jal         sceVif1PkCloseDirectCode
/* 00FE18 01DBBB18 00000000 */   nop
/* 00FE1C 01DBBB1C 80181400 */  sll         $3, $20, 2
/* 00FE20 01DBBB20 21187400 */  addu        $3, $3, $20
/* 00FE24 01DBBB24 40180300 */  sll         $3, $3, 1
/* 00FE28 01DBBB28 21187400 */  addu        $3, $3, $20
/* 00FE2C 01DBBB2C 80980300 */  sll         $19, $3, 2
/* 00FE30 01DBBB30 DD01033C */  lui         $3, %hi(face$800)
/* 00FE34 01DBBB34 C0776324 */  addiu       $3, $3, %lo(face$800)
/* 00FE38 01DBBB38 21187300 */  addu        $3, $3, $19
/* 00FE3C 01DBBB3C 0000658C */  lw          $5, 0x0($3)
/* 00FE40 01DBBB40 CC00A010 */  beqz        $5, .L01DBBE74_2C1674
/* 00FE44 01DBBB44 00000000 */   nop
/* 00FE48 01DBBB48 C701023C */  lui         $2, %hi(TexManager)
/* 00FE4C 01DBBB4C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00FE50 01DBBB50 FFFF0624 */  addiu       $6, $0, -0x1
/* 00FE54 01DBBB54 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 00FE58 01DBBB58 00000000 */   nop
/* 00FE5C 01DBBB5C 28964070 */  paddub      $18, $2, $0
/* 00FE60 01DBBB60 DD01023C */  lui         $2, %hi(face$800 + 0x4)
/* 00FE64 01DBBB64 C4774224 */  addiu       $2, $2, %lo(face$800 + 0x4)
/* 00FE68 01DBBB68 21185300 */  addu        $3, $2, $19
/* 00FE6C 01DBBB6C C701023C */  lui         $2, %hi(TexManager)
/* 00FE70 01DBBB70 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00FE74 01DBBB74 0000658C */  lw          $5, 0x0($3)
/* 00FE78 01DBBB78 FFFF0624 */  addiu       $6, $0, -0x1
/* 00FE7C 01DBBB7C B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 00FE80 01DBBB80 00000000 */   nop
/* 00FE84 01DBBB84 03004012 */  beqz        $18, .L01DBBB94_2C1394
/* 00FE88 01DBBB88 00000000 */   nop
/* 00FE8C 01DBBB8C 03004014 */  bnez        $2, .L01DBBB9C_2C139C
/* 00FE90 01DBBB90 00000000 */   nop
.L01DBBB94_2C1394:
/* 00FE94 01DBBB94 B7000010 */  b           .L01DBBE74_2C1674
/* 00FE98 01DBBB98 00000000 */   nop
.L01DBBB9C_2C139C:
/* 00FE9C 01DBBB9C 2800438C */  lw          $3, 0x28($2)
/* 00FEA0 01DBBBA0 FF3F7630 */  andi        $22, $3, 0x3FFF
/* 00FEA4 01DBBBA4 2800438E */  lw          $3, 0x28($18)
/* 00FEA8 01DBBBA8 FF3F7030 */  andi        $16, $3, 0x3FFF
/* 00FEAC 01DBBBAC 280042DC */  ld          $2, 0x28($2)
/* 00FEB0 01DBBBB0 BA130200 */  dsrl        $2, $2, 14
/* 00FEB4 01DBBBB4 3F004230 */  andi        $2, $2, 0x3F
/* 00FEB8 01DBBBB8 3C880200 */  dsll32      $17, $2, 0
/* 00FEBC 01DBBBBC 3F881100 */  dsra32      $17, $17, 0
/* 00FEC0 01DBBBC0 280042DE */  ld          $2, 0x28($18)
/* 00FEC4 01DBBBC4 BA130200 */  dsrl        $2, $2, 14
/* 00FEC8 01DBBBC8 3F004230 */  andi        $2, $2, 0x3F
/* 00FECC 01DBBBCC 3C900200 */  dsll32      $18, $2, 0
/* 00FED0 01DBBBD0 3F901200 */  dsra32      $18, $18, 0
/* 00FED4 01DBBBD4 40101400 */  sll         $2, $20, 1
/* 00FED8 01DBBBD8 21105400 */  addu        $2, $2, $20
/* 00FEDC 01DBBBDC 80100200 */  sll         $2, $2, 2
/* 00FEE0 01DBBBE0 21105400 */  addu        $2, $2, $20
/* 00FEE4 01DBBBE4 80A00200 */  sll         $20, $2, 2
/* 00FEE8 01DBBBE8 DE01023C */  lui         $2, %hi(CScript__2 + 0x44)
/* 00FEEC 01DBBBEC 441B4224 */  addiu       $2, $2, %lo(CScript__2 + 0x44)
/* 00FEF0 01DBBBF0 21105400 */  addu        $2, $2, $20
/* 00FEF4 01DBBBF4 0000438C */  lw          $3, 0x0($2)
/* 00FEF8 01DBBBF8 DD01023C */  lui         $2, %hi(face$800 + 0x18)
/* 00FEFC 01DBBBFC D8774224 */  addiu       $2, $2, %lo(face$800 + 0x18)
/* 00FF00 01DBBC00 21205300 */  addu        $4, $2, $19
/* 00FF04 01DBBC04 000083AC */  sw          $3, 0x0($4)
/* 00FF08 01DBBC08 DD01023C */  lui         $2, %hi(face$800 + 0xC)
/* 00FF0C 01DBBC0C CC774224 */  addiu       $2, $2, %lo(face$800 + 0xC)
/* 00FF10 01DBBC10 21105300 */  addu        $2, $2, $19
/* 00FF14 01DBBC14 0000458C */  lw          $5, 0x0($2)
/* 00FF18 01DBBC18 DD01023C */  lui         $2, %hi(face$800 + 0x20)
/* 00FF1C 01DBBC1C E0774224 */  addiu       $2, $2, %lo(face$800 + 0x20)
/* 00FF20 01DBBC20 21A85300 */  addu        $21, $2, $19
/* 00FF24 01DBBC24 0000A38E */  lw          $3, 0x0($21)
/* 00FF28 01DBBC28 0000828C */  lw          $2, 0x0($4)
/* 00FF2C 01DBBC2C 01004224 */  addiu       $2, $2, 0x1
/* 00FF30 01DBBC30 1810A200 */  mult        $2, $5, $2
/* 00FF34 01DBBC34 23106200 */  subu        $2, $3, $2
/* 00FF38 01DBBC38 A000A0AF */  sw          $0, 0xA0($29)
/* 00FF3C 01DBBC3C A400A2AF */  sw          $2, 0xA4($29)
/* 00FF40 01DBBC40 80000224 */  addiu       $2, $0, 0x80
/* 00FF44 01DBBC44 A800A2AF */  sw          $2, 0xA8($29)
/* 00FF48 01DBBC48 AC00A5AF */  sw          $5, 0xAC($29)
/* 00FF4C 01DBBC4C 0000A0FF */  sd          $0, 0x0($29)
/* 00FF50 01DBBC50 23184500 */  subu        $3, $2, $5
/* 00FF54 01DBBC54 DD01023C */  lui         $2, %hi(face$800 + 0x8)
/* 00FF58 01DBBC58 C8774224 */  addiu       $2, $2, %lo(face$800 + 0x8)
/* 00FF5C 01DBBC5C 21105300 */  addu        $2, $2, $19
/* 00FF60 01DBBC60 0000428C */  lw          $2, 0x0($2)
/* 00FF64 01DBBC64 23106200 */  subu        $2, $3, $2
/* 00FF68 01DBBC68 0800A2FF */  sd          $2, 0x8($29)
/* 00FF6C 01DBBC6C 1000A0FF */  sd          $0, 0x10($29)
/* 00FF70 01DBBC70 D48B848F */  lw          $4, -0x742C($28)
/* 00FF74 01DBBC74 282EC072 */  paddub      $5, $22, $0
/* 00FF78 01DBBC78 28362072 */  paddub      $6, $17, $0
/* 00FF7C 01DBBC7C 13000724 */  addiu       $7, $0, 0x13
/* 00FF80 01DBBC80 A000A827 */  addiu       $8, $29, 0xA0
/* 00FF84 01DBBC84 284E0072 */  paddub      $9, $16, $0
/* 00FF88 01DBBC88 28564072 */  paddub      $10, $18, $0
/* 00FF8C 01DBBC8C 285EE070 */  paddub      $11, $7, $0
/* 00FF90 01DBBC90 9801050C */  jal         MoveImageTest__FP13sceVif1PacketiiiRC8CRect_i_iiiiii
/* 00FF94 01DBBC94 00000000 */   nop
/* 00FF98 01DBBC98 DE01023C */  lui         $2, %hi(CScript__2 + 0x50)
/* 00FF9C 01DBBC9C 501B4224 */  addiu       $2, $2, %lo(CScript__2 + 0x50)
/* 00FFA0 01DBBCA0 21185400 */  addu        $3, $2, $20
/* 00FFA4 01DBBCA4 000060C4 */  lwc1        $f0, 0x0($3)
/* 00FFA8 01DBBCA8 DE01013C */  lui         $1, %hi(CScript__2 + 0x4E4)
/* 00FFAC 01DBBCAC E41F21C4 */  lwc1        $f1, %lo(CScript__2 + 0x4E4)($1)
/* 00FFB0 01DBBCB0 34000146 */  c.lt.s      $f0, $f1
/* 00FFB4 01DBBCB4 00000000 */  nop
/* 00FFB8 01DBBCB8 24000145 */  bc1t        .L01DBBD4C_2C154C
/* 00FFBC 01DBBCBC 00000000 */   nop
/* 00FFC0 01DBBCC0 01000146 */  sub.s       $f0, $f0, $f1
/* 00FFC4 01DBBCC4 000060E4 */  swc1        $f0, 0x0($3)
/* 00FFC8 01DBBCC8 DE01023C */  lui         $2, %hi(CScript__2 + 0x54)
/* 00FFCC 01DBBCCC 541B4224 */  addiu       $2, $2, %lo(CScript__2 + 0x54)
/* 00FFD0 01DBBCD0 21105400 */  addu        $2, $2, $20
/* 00FFD4 01DBBCD4 00004290 */  lbu         $2, 0x0($2)
/* 00FFD8 01DBBCD8 24004010 */  beqz        $2, .L01DBBD6C_2C156C
/* 00FFDC 01DBBCDC 00000000 */   nop
/* 00FFE0 01DBBCE0 C842023C */  lui         $2, (0x42C80000 >> 16)
/* 00FFE4 01DBBCE4 00088244 */  mtc1        $2, $f1
/* 00FFE8 01DBBCE8 000060C4 */  lwc1        $f0, 0x0($3)
/* 00FFEC 01DBBCEC 020B0046 */  mul.s       $f12, $f1, $f0
/* 00FFF0 01DBBCF0 2C44040C */  jal         fptosi
/* 00FFF4 01DBBCF4 00000000 */   nop
/* 00FFF8 01DBBCF8 06000324 */  addiu       $3, $0, 0x6
/* 00FFFC 01DBBCFC 1A004300 */  div         $0, $2, $3
/* 010000 01DBBD00 00000000 */  nop
/* 010004 01DBBD04 00000000 */  nop
/* 010008 01DBBD08 10100000 */  mfhi        $2
/* 01000C 01DBBD0C 17004014 */  bnez        $2, .L01DBBD6C_2C156C
/* 010010 01DBBD10 00000000 */   nop
/* 010014 01DBBD14 BE11040C */  jal         rand
/* 010018 01DBBD18 00000000 */   nop
/* 01001C 01DBBD1C 03004330 */  andi        $3, $2, 0x3
/* 010020 01DBBD20 04004104 */  bgez        $2, .L01DBBD34_2C1534
/* 010024 01DBBD24 00000000 */   nop
/* 010028 01DBBD28 02006010 */  beqz        $3, .L01DBBD34_2C1534
/* 01002C 01DBBD2C 00000000 */   nop
/* 010030 01DBBD30 FCFF6324 */  addiu       $3, $3, -0x4
.L01DBBD34_2C1534:
/* 010034 01DBBD34 DE01023C */  lui         $2, %hi(CScript__2 + 0x4C)
/* 010038 01DBBD38 4C1B4224 */  addiu       $2, $2, %lo(CScript__2 + 0x4C)
/* 01003C 01DBBD3C 21105400 */  addu        $2, $2, $20
/* 010040 01DBBD40 000043AC */  sw          $3, 0x0($2)
/* 010044 01DBBD44 09000010 */  b           .L01DBBD6C_2C156C
/* 010048 01DBBD48 00000000 */   nop
.L01DBBD4C_2C154C:
/* 01004C 01DBBD4C DE01023C */  lui         $2, %hi(CScript__2 + 0x4C)
/* 010050 01DBBD50 4C1B4224 */  addiu       $2, $2, %lo(CScript__2 + 0x4C)
/* 010054 01DBBD54 21105400 */  addu        $2, $2, $20
/* 010058 01DBBD58 000040AC */  sw          $0, 0x0($2)
/* 01005C 01DBBD5C DE01023C */  lui         $2, %hi(CScript__2 + 0x54)
/* 010060 01DBBD60 541B4224 */  addiu       $2, $2, %lo(CScript__2 + 0x54)
/* 010064 01DBBD64 21105400 */  addu        $2, $2, $20
/* 010068 01DBBD68 000040A0 */  sb          $0, 0x0($2)
.L01DBBD6C_2C156C:
/* 01006C 01DBBD6C DE01023C */  lui         $2, %hi(CScript__2 + 0x4C)
/* 010070 01DBBD70 4C1B4224 */  addiu       $2, $2, %lo(CScript__2 + 0x4C)
/* 010074 01DBBD74 21105400 */  addu        $2, $2, $20
/* 010078 01DBBD78 0000438C */  lw          $3, 0x0($2)
/* 01007C 01DBBD7C DD01023C */  lui         $2, %hi(face$800 + 0x1C)
/* 010080 01DBBD80 DC774224 */  addiu       $2, $2, %lo(face$800 + 0x1C)
/* 010084 01DBBD84 21205300 */  addu        $4, $2, $19
/* 010088 01DBBD88 000083AC */  sw          $3, 0x0($4)
/* 01008C 01DBBD8C DD01023C */  lui         $2, %hi(face$800 + 0x14)
/* 010090 01DBBD90 D4774224 */  addiu       $2, $2, %lo(face$800 + 0x14)
/* 010094 01DBBD94 21105300 */  addu        $2, $2, $19
/* 010098 01DBBD98 0000458C */  lw          $5, 0x0($2)
/* 01009C 01DBBD9C 0000828C */  lw          $2, 0x0($4)
/* 0100A0 01DBBDA0 01004224 */  addiu       $2, $2, 0x1
/* 0100A4 01DBBDA4 1818A200 */  mult        $3, $5, $2
/* 0100A8 01DBBDA8 0000A28E */  lw          $2, 0x0($21)
/* 0100AC 01DBBDAC 23184300 */  subu        $3, $2, $3
/* 0100B0 01DBBDB0 80000224 */  addiu       $2, $0, 0x80
/* 0100B4 01DBBDB4 B000A2AF */  sw          $2, 0xB0($29)
/* 0100B8 01DBBDB8 B400A3AF */  sw          $3, 0xB4($29)
/* 0100BC 01DBBDBC B800A2AF */  sw          $2, 0xB8($29)
/* 0100C0 01DBBDC0 BC00A5AF */  sw          $5, 0xBC($29)
/* 0100C4 01DBBDC4 0000A0FF */  sd          $0, 0x0($29)
/* 0100C8 01DBBDC8 23184500 */  subu        $3, $2, $5
/* 0100CC 01DBBDCC DD01023C */  lui         $2, %hi(face$800 + 0x10)
/* 0100D0 01DBBDD0 D0774224 */  addiu       $2, $2, %lo(face$800 + 0x10)
/* 0100D4 01DBBDD4 21105300 */  addu        $2, $2, $19
/* 0100D8 01DBBDD8 0000428C */  lw          $2, 0x0($2)
/* 0100DC 01DBBDDC 23106200 */  subu        $2, $3, $2
/* 0100E0 01DBBDE0 0800A2FF */  sd          $2, 0x8($29)
/* 0100E4 01DBBDE4 1000A0FF */  sd          $0, 0x10($29)
/* 0100E8 01DBBDE8 D48B848F */  lw          $4, -0x742C($28)
/* 0100EC 01DBBDEC 282EC072 */  paddub      $5, $22, $0
/* 0100F0 01DBBDF0 28362072 */  paddub      $6, $17, $0
/* 0100F4 01DBBDF4 13000724 */  addiu       $7, $0, 0x13
/* 0100F8 01DBBDF8 B000A827 */  addiu       $8, $29, 0xB0
/* 0100FC 01DBBDFC 284E0072 */  paddub      $9, $16, $0
/* 010100 01DBBE00 28564072 */  paddub      $10, $18, $0
/* 010104 01DBBE04 285EE070 */  paddub      $11, $7, $0
/* 010108 01DBBE08 9801050C */  jal         MoveImageTest__FP13sceVif1PacketiiiRC8CRect_i_iiiiii
/* 01010C 01DBBE0C 00000000 */   nop
/* 010110 01DBBE10 D48B848F */  lw          $4, -0x742C($28)
/* 010114 01DBBE14 282E0070 */  paddub      $5, $0, $0
/* 010118 01DBBE18 2083040C */  jal         sceVif1PkCnt
/* 01011C 01DBBE1C 00000000 */   nop
/* 010120 01DBBE20 D48B848F */  lw          $4, -0x742C($28)
/* 010124 01DBBE24 282E0070 */  paddub      $5, $0, $0
/* 010128 01DBBE28 8E83040C */  jal         sceVif1PkOpenDirectCode
/* 01012C 01DBBE2C 00000000 */   nop
/* 010130 01DBBE30 C701023C */  lui         $2, %hi(GiftagAD)
/* 010134 01DBBE34 C0524224 */  addiu       $2, $2, %lo(GiftagAD)
/* 010138 01DBBE38 D48B848F */  lw          $4, -0x742C($28)
/* 01013C 01DBBE3C 00004578 */  lq          $5, 0x0($2)
/* 010140 01DBBE40 B083040C */  jal         sceVif1PkOpenGifTag
/* 010144 01DBBE44 00000000 */   nop
/* 010148 01DBBE48 D48B848F */  lw          $4, -0x742C($28)
/* 01014C 01DBBE4C 3F000524 */  addiu       $5, $0, 0x3F
/* 010150 01DBBE50 28360070 */  paddub      $6, $0, $0
/* 010154 01DBBE54 0A84040C */  jal         sceVif1PkAddGsAD
/* 010158 01DBBE58 00000000 */   nop
/* 01015C 01DBBE5C D48B848F */  lw          $4, -0x742C($28)
/* 010160 01DBBE60 B683040C */  jal         sceVif1PkCloseGifTag
/* 010164 01DBBE64 00000000 */   nop
/* 010168 01DBBE68 D48B848F */  lw          $4, -0x742C($28)
/* 01016C 01DBBE6C A483040C */  jal         sceVif1PkCloseDirectCode
/* 010170 01DBBE70 00000000 */   nop
.L01DBBE74_2C1674:
/* 010174 01DBBE74 9000BF7B */  lq          $31, 0x90($29)
/* 010178 01DBBE78 8000B67B */  lq          $22, 0x80($29)
/* 01017C 01DBBE7C 7000B57B */  lq          $21, 0x70($29)
/* 010180 01DBBE80 6000B47B */  lq          $20, 0x60($29)
/* 010184 01DBBE84 5000B37B */  lq          $19, 0x50($29)
/* 010188 01DBBE88 4000B27B */  lq          $18, 0x40($29)
/* 01018C 01DBBE8C 3000B17B */  lq          $17, 0x30($29)
/* 010190 01DBBE90 2000B07B */  lq          $16, 0x20($29)
/* 010194 01DBBE94 C000BD27 */  addiu       $29, $29, 0xC0
/* 010198 01DBBE98 0800E003 */  jr          $31
/* 01019C 01DBBE9C 00000000 */   nop
