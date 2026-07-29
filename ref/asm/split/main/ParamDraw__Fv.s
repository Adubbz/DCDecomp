.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ParamDraw__Fv
/* 07CAB0 0017C9B0 80FFBD27 */  addiu       $29, $29, -0x80
/* 07CAB4 0017C9B4 3000BF7F */  sq          $31, 0x30($29)
/* 07CAB8 0017C9B8 2000B27F */  sq          $18, 0x20($29)
/* 07CABC 0017C9BC 1000B17F */  sq          $17, 0x10($29)
/* 07CAC0 0017C9C0 0000B07F */  sq          $16, 0x0($29)
/* 07CAC4 0017C9C4 448F838F */  lw          $3, -0x70BC($28)
/* 07CAC8 0017C9C8 7B006014 */  bnez        $3, .L0017CBB8
/* 07CACC 0017C9CC 00000000 */   nop
/* 07CAD0 0017C9D0 C701023C */  lui         $2, %hi(TexManager)
/* 07CAD4 0017C9D4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 07CAD8 0017C9D8 D48B858F */  lw          $5, -0x742C($28)
/* 07CADC 0017C9DC 14000624 */  addiu       $6, $0, 0x14
/* 07CAE0 0017C9E0 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 07CAE4 0017C9E4 00000000 */   nop
/* 07CAE8 0017C9E8 8040023C */  lui         $2, (0x40800000 >> 16)
/* 07CAEC 0017C9EC 00608244 */  mtc1        $2, $f12
/* 07CAF0 0017C9F0 D301023C */  lui         $2, %hi(NowCursorPos)
/* 07CAF4 0017C9F4 405C4424 */  addiu       $4, $2, %lo(NowCursorPos)
/* 07CAF8 0017C9F8 D301023C */  lui         $2, %hi(NowCursorPos)
/* 07CAFC 0017C9FC 405C4524 */  addiu       $5, $2, %lo(NowCursorPos)
/* 07CB00 0017CA00 D301023C */  lui         $2, %hi(NextCursorPos)
/* 07CB04 0017CA04 505C4624 */  addiu       $6, $2, %lo(NextCursorPos)
/* 07CB08 0017CA08 01000724 */  addiu       $7, $0, 0x1
/* 07CB0C 0017CA0C 108E040C */  jal         VectorInterpolate__FPfPfPffi
/* 07CB10 0017CA10 00000000 */   nop
/* 07CB14 0017CA14 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 07CB18 0017CA18 D301013C */  lui         $1, %hi(NowCursorPos + 0xC)
/* 07CB1C 0017CA1C 4C5C22AC */  sw          $2, %lo(NowCursorPos + 0xC)($1)
/* 07CB20 0017CA20 4000A427 */  addiu       $4, $29, 0x40
/* 07CB24 0017CA24 D301023C */  lui         $2, %hi(NowCursorPos)
/* 07CB28 0017CA28 405C4524 */  addiu       $5, $2, %lo(NowCursorPos)
/* 07CB2C 0017CA2C 28360070 */  paddub      $6, $0, $0
/* 07CB30 0017CA30 38B9040C */  jal         MGRotTransPers2D__FPiPfi
/* 07CB34 0017CA34 00000000 */   nop
/* 07CB38 0017CA38 4400B227 */  addiu       $18, $29, 0x44
/* 07CB3C 0017CA3C 0000428E */  lw          $2, 0x0($18)
/* 07CB40 0017CA40 E0FF4324 */  addiu       $3, $2, -0x20
/* 07CB44 0017CA44 4000A28F */  lw          $2, 0x40($29)
/* 07CB48 0017CA48 F6FF4224 */  addiu       $2, $2, -0xA
/* 07CB4C 0017CA4C 5000A2AF */  sw          $2, 0x50($29)
/* 07CB50 0017CA50 5400A3AF */  sw          $3, 0x54($29)
/* 07CB54 0017CA54 20000224 */  addiu       $2, $0, 0x20
/* 07CB58 0017CA58 5800A2AF */  sw          $2, 0x58($29)
/* 07CB5C 0017CA5C 5C00A2AF */  sw          $2, 0x5C($29)
/* 07CB60 0017CA60 C701023C */  lui         $2, %hi(TexManager)
/* 07CB64 0017CA64 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 07CB68 0017CA68 2A00023C */  lui         $2, %hi(LIT_1871)
/* 07CB6C 0017CA6C F8AB4524 */  addiu       $5, $2, %lo(LIT_1871)
/* 07CB70 0017CA70 FFFF0624 */  addiu       $6, $0, -0x1
/* 07CB74 0017CA74 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 07CB78 0017CA78 00000000 */   nop
/* 07CB7C 0017CA7C D48B848F */  lw          $4, -0x742C($28)
/* 07CB80 0017CA80 282E4070 */  paddub      $5, $2, $0
/* 07CB84 0017CA84 5000A627 */  addiu       $6, $29, 0x50
/* 07CB88 0017CA88 283E0070 */  paddub      $7, $0, $0
/* 07CB8C 0017CA8C 28460070 */  paddub      $8, $0, $0
/* 07CB90 0017CA90 406F050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_ii
/* 07CB94 0017CA94 00000000 */   nop
/* 07CB98 0017CA98 40010324 */  addiu       $3, $0, 0x140
/* 07CB9C 0017CA9C 4000A3AF */  sw          $3, 0x40($29)
/* 07CBA0 0017CAA0 E0000324 */  addiu       $3, $0, 0xE0
/* 07CBA4 0017CAA4 000043AE */  sw          $3, 0x0($18)
/* 07CBA8 0017CAA8 5091838F */  lw          $3, -0x6EB0($28)
/* 07CBAC 0017CAAC 42006010 */  beqz        $3, .L0017CBB8
/* 07CBB0 0017CAB0 00000000 */   nop
/* 07CBB4 0017CAB4 5891838F */  lw          $3, -0x6EA8($28)
/* 07CBB8 0017CAB8 3F006014 */  bnez        $3, .L0017CBB8
/* 07CBBC 0017CABC 00000000 */   nop
/* 07CBC0 0017CAC0 7487858F */  lw          $5, -0x788C($28)
/* 07CBC4 0017CAC4 3C00A018 */  blez        $5, .L0017CBB8
/* 07CBC8 0017CAC8 00000000 */   nop
/* 07CBCC 0017CACC 06000324 */  addiu       $3, $0, 0x6
/* 07CBD0 0017CAD0 09000424 */  addiu       $4, $0, 0x9
/* 07CBD4 0017CAD4 14001124 */  addiu       $17, $0, 0x14
/* 07CBD8 0017CAD8 28860070 */  paddub      $16, $0, $0
/* 07CBDC 0017CADC 9886828F */  lw          $2, -0x7968($28)
/* 07CBE0 0017CAE0 04004018 */  blez        $2, .L0017CAF4
/* 07CBE4 0017CAE4 00000000 */   nop
/* 07CBE8 0017CAE8 0C000324 */  addiu       $3, $0, 0xC
/* 07CBEC 0017CAEC 12000424 */  addiu       $4, $0, 0x12
/* 07CBF0 0017CAF0 0A001124 */  addiu       $17, $0, 0xA
.L0017CAF4:
/* 07CBF4 0017CAF4 0700A128 */  slti        $1, $5, 0x7
/* 07CBF8 0017CAF8 08002010 */  beqz        $1, .L0017CB1C
/* 07CBFC 0017CAFC 00000000 */   nop
/* 07CC00 0017CB00 30001026 */  addiu       $16, $16, 0x30
/* 07CC04 0017CB04 23106500 */  subu        $2, $3, $5
/* 07CC08 0017CB08 18102202 */  mult        $2, $17, $2
/* 07CC0C 0017CB0C 43100200 */  sra         $2, $2, 1
/* 07CC10 0017CB10 21882202 */  addu        $17, $17, $2
/* 07CC14 0017CB14 05000010 */  b           .L0017CB2C
/* 07CC18 0017CB18 00000000 */   nop
.L0017CB1C:
/* 07CC1C 0017CB1C 23108500 */  subu        $2, $4, $5
/* 07CC20 0017CB20 18102202 */  mult        $2, $17, $2
/* 07CC24 0017CB24 43100200 */  sra         $2, $2, 1
/* 07CC28 0017CB28 21882202 */  addu        $17, $17, $2
.L0017CB2C:
/* 07CC2C 0017CB2C 28260070 */  paddub      $4, $0, $0
/* 07CC30 0017CB30 046F050C */  jal         setbilinear__Fi
/* 07CC34 0017CB34 00000000 */   nop
/* 07CC38 0017CB38 0000448E */  lw          $4, 0x0($18)
/* 07CC3C 0017CB3C 0E008324 */  addiu       $3, $4, 0xE
/* 07CC40 0017CB40 4000A58F */  lw          $5, 0x40($29)
/* 07CC44 0017CB44 2110B100 */  addu        $2, $5, $17
/* 07CC48 0017CB48 D201013C */  lui         $1, %hi(EditNameMes + 0x1750)
/* 07CC4C 0017CB4C A02B22AC */  sw          $2, %lo(EditNameMes + 0x1750)($1)
/* 07CC50 0017CB50 D201013C */  lui         $1, %hi(EditNameMes + 0x1754)
/* 07CC54 0017CB54 A42B23AC */  sw          $3, %lo(EditNameMes + 0x1754)($1)
/* 07CC58 0017CB58 7000A0AF */  sw          $0, 0x70($29)
/* 07CC5C 0017CB5C 7400B0AF */  sw          $16, 0x74($29)
/* 07CC60 0017CB60 DC000324 */  addiu       $3, $0, 0xDC
/* 07CC64 0017CB64 7800A3AF */  sw          $3, 0x78($29)
/* 07CC68 0017CB68 30000224 */  addiu       $2, $0, 0x30
/* 07CC6C 0017CB6C 7C00A2AF */  sw          $2, 0x7C($29)
/* 07CC70 0017CB70 6000A5AF */  sw          $5, 0x60($29)
/* 07CC74 0017CB74 6400A4AF */  sw          $4, 0x64($29)
/* 07CC78 0017CB78 6800A3AF */  sw          $3, 0x68($29)
/* 07CC7C 0017CB7C 6C00A2AF */  sw          $2, 0x6C($29)
/* 07CC80 0017CB80 C701023C */  lui         $2, %hi(TexManager)
/* 07CC84 0017CB84 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 07CC88 0017CB88 2A00023C */  lui         $2, %hi(LIT_1872)
/* 07CC8C 0017CB8C 00AC4524 */  addiu       $5, $2, %lo(LIT_1872)
/* 07CC90 0017CB90 FFFF0624 */  addiu       $6, $0, -0x1
/* 07CC94 0017CB94 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 07CC98 0017CB98 00000000 */   nop
/* 07CC9C 0017CB9C D48B848F */  lw          $4, -0x742C($28)
/* 07CCA0 0017CBA0 282E4070 */  paddub      $5, $2, $0
/* 07CCA4 0017CBA4 6000A627 */  addiu       $6, $29, 0x60
/* 07CCA8 0017CBA8 7000A727 */  addiu       $7, $29, 0x70
/* 07CCAC 0017CBAC 60000824 */  addiu       $8, $0, 0x60
/* 07CCB0 0017CBB0 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 07CCB4 0017CBB4 00000000 */   nop
.L0017CBB8:
/* 07CCB8 0017CBB8 3000BF7B */  lq          $31, 0x30($29)
/* 07CCBC 0017CBBC 2000B27B */  lq          $18, 0x20($29)
/* 07CCC0 0017CBC0 1000B17B */  lq          $17, 0x10($29)
/* 07CCC4 0017CBC4 0000B07B */  lq          $16, 0x0($29)
/* 07CCC8 0017CBC8 8000BD27 */  addiu       $29, $29, 0x80
/* 07CCCC 0017CBCC 0800E003 */  jr          $31
/* 07CCD0 0017CBD0 00000000 */   nop
/* 07CCD4 0017CBD4 00000000 */  nop
/* 07CCD8 0017CBD8 00000000 */  nop
/* 07CCDC 0017CBDC 00000000 */  nop
