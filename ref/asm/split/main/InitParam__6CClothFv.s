.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InitParam__6CClothFv
/* 03CAB0 0013C9B0 A0FFBD27 */  addiu       $29, $29, -0x60
/* 03CAB4 0013C9B4 4000BF7F */  sq          $31, 0x40($29)
/* 03CAB8 0013C9B8 3000B37F */  sq          $19, 0x30($29)
/* 03CABC 0013C9BC 2000B27F */  sq          $18, 0x20($29)
/* 03CAC0 0013C9C0 1000B17F */  sq          $17, 0x10($29)
/* 03CAC4 0013C9C4 0000B07F */  sq          $16, 0x0($29)
/* 03CAC8 0013C9C8 28968070 */  paddub      $18, $4, $0
/* 03CACC 0013C9CC 10000324 */  addiu       $3, $0, 0x10
/* 03CAD0 0013C9D0 2C0083AC */  sw          $3, 0x2C($4)
/* 03CAD4 0013C9D4 300083AC */  sw          $3, 0x30($4)
/* 03CAD8 0013C9D8 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 03CADC 0013C9DC 340083AC */  sw          $3, 0x34($4)
/* 03CAE0 0013C9E0 200080AC */  sw          $0, 0x20($4)
/* 03CAE4 0013C9E4 280080AC */  sw          $0, 0x28($4)
/* 03CAE8 0013C9E8 240080AC */  sw          $0, 0x24($4)
/* 03CAEC 0013C9EC 3C0080AC */  sw          $0, 0x3C($4)
/* 03CAF0 0013C9F0 400080AC */  sw          $0, 0x40($4)
/* 03CAF4 0013C9F4 000080AC */  sw          $0, 0x0($4)
/* 03CAF8 0013C9F8 500080AC */  sw          $0, 0x50($4)
/* 03CAFC 0013C9FC 540083AC */  sw          $3, 0x54($4)
/* 03CB00 0013CA00 4C0080AC */  sw          $0, 0x4C($4)
/* 03CB04 0013CA04 F00080AC */  sw          $0, 0xF0($4)
/* 03CB08 0013CA08 F40080AC */  sw          $0, 0xF4($4)
/* 03CB0C 0013CA0C F80080AC */  sw          $0, 0xF8($4)
/* 03CB10 0013CA10 808080C7 */  lwc1        $f0, -0x7F80($28)
/* 03CB14 0013CA14 E00080E4 */  swc1        $f0, 0xE0($4)
/* 03CB18 0013CA18 808080C7 */  lwc1        $f0, -0x7F80($28)
/* 03CB1C 0013CA1C E40080E4 */  swc1        $f0, 0xE4($4)
/* 03CB20 0013CA20 808080C7 */  lwc1        $f0, -0x7F80($28)
/* 03CB24 0013CA24 E80080E4 */  swc1        $f0, 0xE8($4)
/* 03CB28 0013CA28 848081C7 */  lwc1        $f1, -0x7F7C($28)
/* 03CB2C 0013CA2C D00081E4 */  swc1        $f1, 0xD0($4)
/* 03CB30 0013CA30 888080C7 */  lwc1        $f0, -0x7F78($28)
/* 03CB34 0013CA34 D40080E4 */  swc1        $f0, 0xD4($4)
/* 03CB38 0013CA38 D80081E4 */  swc1        $f1, 0xD8($4)
/* 03CB3C 0013CA3C C00080AC */  sw          $0, 0xC0($4)
/* 03CB40 0013CA40 8C8080C7 */  lwc1        $f0, -0x7F74($28)
/* 03CB44 0013CA44 C40080E4 */  swc1        $f0, 0xC4($4)
/* 03CB48 0013CA48 C80080AC */  sw          $0, 0xC8($4)
/* 03CB4C 0013CA4C 580083AC */  sw          $3, 0x58($4)
/* 03CB50 0013CA50 380080AC */  sw          $0, 0x38($4)
/* 03CB54 0013CA54 01000324 */  addiu       $3, $0, 0x1
/* 03CB58 0013CA58 480083AC */  sw          $3, 0x48($4)
/* 03CB5C 0013CA5C 2500033C */  lui         $3, %hi(LIT_456)
/* 03CB60 0013CA60 30156324 */  addiu       $3, $3, %lo(LIT_456)
/* 03CB64 0013CA64 5000A427 */  addiu       $4, $29, 0x50
/* 03CB68 0013CA68 00006378 */  lq          $3, 0x0($3)
/* 03CB6C 0013CA6C 0000837C */  sq          $3, 0x0($4)
/* 03CB70 0013CA70 28860070 */  paddub      $16, $0, $0
/* 03CB74 0013CA74 30000010 */  b           .L0013CB38
/* 03CB78 0013CA78 00000000 */   nop
.L0013CA7C:
/* 03CB7C 0013CA7C 288E0070 */  paddub      $17, $0, $0
/* 03CB80 0013CA80 28000010 */  b           .L0013CB24
/* 03CB84 0013CA84 00000000 */   nop
.L0013CA88:
/* 03CB88 0013CA88 FFFF0434 */  ori         $4, $0, 0xFFFF
/* 03CB8C 0013CA8C 80111000 */  sll         $2, $16, 6
/* 03CB90 0013CA90 21185200 */  addu        $3, $2, $18
/* 03CB94 0013CA94 80101100 */  sll         $2, $17, 2
/* 03CB98 0013CA98 21104300 */  addu        $2, $2, $3
/* 03CB9C 0013CA9C 507144AC */  sw          $4, 0x7150($2)
/* 03CBA0 0013CAA0 00121000 */  sll         $2, $16, 8
/* 03CBA4 0013CAA4 21184202 */  addu        $3, $18, $2
/* 03CBA8 0013CAA8 00111100 */  sll         $2, $17, 4
/* 03CBAC 0013CAAC 21986200 */  addu        $19, $3, $2
/* 03CBB0 0013CAB0 10016426 */  addiu       $4, $19, 0x110
/* 03CBB4 0013CAB4 5000A527 */  addiu       $5, $29, 0x50
/* 03CBB8 0013CAB8 0C86040C */  jal         sceVu0CopyVector
/* 03CBBC 0013CABC 00000000 */   nop
/* 03CBC0 0013CAC0 10116426 */  addiu       $4, $19, 0x1110
/* 03CBC4 0013CAC4 5000A527 */  addiu       $5, $29, 0x50
/* 03CBC8 0013CAC8 0C86040C */  jal         sceVu0CopyVector
/* 03CBCC 0013CACC 00000000 */   nop
/* 03CBD0 0013CAD0 10216426 */  addiu       $4, $19, 0x2110
/* 03CBD4 0013CAD4 5000A527 */  addiu       $5, $29, 0x50
/* 03CBD8 0013CAD8 0C86040C */  jal         sceVu0CopyVector
/* 03CBDC 0013CADC 00000000 */   nop
/* 03CBE0 0013CAE0 10316426 */  addiu       $4, $19, 0x3110
/* 03CBE4 0013CAE4 5000A527 */  addiu       $5, $29, 0x50
/* 03CBE8 0013CAE8 0C86040C */  jal         sceVu0CopyVector
/* 03CBEC 0013CAEC 00000000 */   nop
/* 03CBF0 0013CAF0 10416426 */  addiu       $4, $19, 0x4110
/* 03CBF4 0013CAF4 5000A527 */  addiu       $5, $29, 0x50
/* 03CBF8 0013CAF8 0C86040C */  jal         sceVu0CopyVector
/* 03CBFC 0013CAFC 00000000 */   nop
/* 03CC00 0013CB00 10516426 */  addiu       $4, $19, 0x5110
/* 03CC04 0013CB04 5000A527 */  addiu       $5, $29, 0x50
/* 03CC08 0013CB08 0C86040C */  jal         sceVu0CopyVector
/* 03CC0C 0013CB0C 00000000 */   nop
/* 03CC10 0013CB10 10616426 */  addiu       $4, $19, 0x6110
/* 03CC14 0013CB14 5000A527 */  addiu       $5, $29, 0x50
/* 03CC18 0013CB18 0C86040C */  jal         sceVu0CopyVector
/* 03CC1C 0013CB1C 00000000 */   nop
/* 03CC20 0013CB20 01003126 */  addiu       $17, $17, 0x1
.L0013CB24:
/* 03CC24 0013CB24 3000438E */  lw          $3, 0x30($18)
/* 03CC28 0013CB28 2A182302 */  slt         $3, $17, $3
/* 03CC2C 0013CB2C D6FF6014 */  bnez        $3, .L0013CA88
/* 03CC30 0013CB30 00000000 */   nop
/* 03CC34 0013CB34 01001026 */  addiu       $16, $16, 0x1
.L0013CB38:
/* 03CC38 0013CB38 2C00438E */  lw          $3, 0x2C($18)
/* 03CC3C 0013CB3C 2A180302 */  slt         $3, $16, $3
/* 03CC40 0013CB40 CEFF6014 */  bnez        $3, .L0013CA7C
/* 03CC44 0013CB44 00000000 */   nop
/* 03CC48 0013CB48 440040AE */  sw          $0, 0x44($18)
/* 03CC4C 0013CB4C 940040A2 */  sb          $0, 0x94($18)
/* 03CC50 0013CB50 4000BF7B */  lq          $31, 0x40($29)
/* 03CC54 0013CB54 3000B37B */  lq          $19, 0x30($29)
/* 03CC58 0013CB58 2000B27B */  lq          $18, 0x20($29)
/* 03CC5C 0013CB5C 1000B17B */  lq          $17, 0x10($29)
/* 03CC60 0013CB60 0000B07B */  lq          $16, 0x0($29)
/* 03CC64 0013CB64 6000BD27 */  addiu       $29, $29, 0x60
/* 03CC68 0013CB68 0800E003 */  jr          $31
/* 03CC6C 0013CB6C 00000000 */   nop
