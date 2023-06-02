.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitParam__6CClothFv
/* 3CAB0 0013C9B0 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 3CAB4 0013C9B4 4000BF7F */  sq         $31, 0x40($sp)
/* 3CAB8 0013C9B8 3000B37F */  sq         $19, 0x30($sp)
/* 3CABC 0013C9BC 2000B27F */  sq         $18, 0x20($sp)
/* 3CAC0 0013C9C0 1000B17F */  sq         $17, 0x10($sp)
/* 3CAC4 0013C9C4 0000B07F */  sq         $16, 0x0($sp)
/* 3CAC8 0013C9C8 28968070 */  paddub     $18, $4, $0
/* 3CACC 0013C9CC 10000324 */  addiu      $3, $0, 0x10
/* 3CAD0 0013C9D0 2C0083AC */  sw         $3, 0x2C($4)
/* 3CAD4 0013C9D4 300083AC */  sw         $3, 0x30($4)
/* 3CAD8 0013C9D8 803F033C */  lui        $3, (0x3F800000 >> 16)
/* 3CADC 0013C9DC 340083AC */  sw         $3, 0x34($4)
/* 3CAE0 0013C9E0 200080AC */  sw         $0, 0x20($4)
/* 3CAE4 0013C9E4 280080AC */  sw         $0, 0x28($4)
/* 3CAE8 0013C9E8 240080AC */  sw         $0, 0x24($4)
/* 3CAEC 0013C9EC 3C0080AC */  sw         $0, 0x3C($4)
/* 3CAF0 0013C9F0 400080AC */  sw         $0, 0x40($4)
/* 3CAF4 0013C9F4 000080AC */  sw         $0, 0x0($4)
/* 3CAF8 0013C9F8 500080AC */  sw         $0, 0x50($4)
/* 3CAFC 0013C9FC 540083AC */  sw         $3, 0x54($4)
/* 3CB00 0013CA00 4C0080AC */  sw         $0, 0x4C($4)
/* 3CB04 0013CA04 F00080AC */  sw         $0, 0xF0($4)
/* 3CB08 0013CA08 F40080AC */  sw         $0, 0xF4($4)
/* 3CB0C 0013CA0C F80080AC */  sw         $0, 0xF8($4)
/* 3CB10 0013CA10 808080C7 */  lwc1       $f0, -0x7F80($gp)
/* 3CB14 0013CA14 E00080E4 */  swc1       $f0, 0xE0($4)
/* 3CB18 0013CA18 808080C7 */  lwc1       $f0, -0x7F80($gp)
/* 3CB1C 0013CA1C E40080E4 */  swc1       $f0, 0xE4($4)
/* 3CB20 0013CA20 808080C7 */  lwc1       $f0, -0x7F80($gp)
/* 3CB24 0013CA24 E80080E4 */  swc1       $f0, 0xE8($4)
/* 3CB28 0013CA28 848081C7 */  lwc1       $f1, -0x7F7C($gp)
/* 3CB2C 0013CA2C D00081E4 */  swc1       $f1, 0xD0($4)
/* 3CB30 0013CA30 888080C7 */  lwc1       $f0, -0x7F78($gp)
/* 3CB34 0013CA34 D40080E4 */  swc1       $f0, 0xD4($4)
/* 3CB38 0013CA38 D80081E4 */  swc1       $f1, 0xD8($4)
/* 3CB3C 0013CA3C C00080AC */  sw         $0, 0xC0($4)
/* 3CB40 0013CA40 8C8080C7 */  lwc1       $f0, -0x7F74($gp)
/* 3CB44 0013CA44 C40080E4 */  swc1       $f0, 0xC4($4)
/* 3CB48 0013CA48 C80080AC */  sw         $0, 0xC8($4)
/* 3CB4C 0013CA4C 580083AC */  sw         $3, 0x58($4)
/* 3CB50 0013CA50 380080AC */  sw         $0, 0x38($4)
/* 3CB54 0013CA54 01000324 */  addiu      $3, $0, 0x1
/* 3CB58 0013CA58 480083AC */  sw         $3, 0x48($4)
/* 3CB5C 0013CA5C 2500033C */  lui        $3, %hi(_456)
/* 3CB60 0013CA60 30156324 */  addiu      $3, $3, %lo(_456)
/* 3CB64 0013CA64 5000A427 */  addiu      $4, $sp, 0x50
/* 3CB68 0013CA68 00006378 */  lq         $3, 0x0($3)
/* 3CB6C 0013CA6C 0000837C */  sq         $3, 0x0($4)
/* 3CB70 0013CA70 28860070 */  paddub     $16, $0, $0
/* 3CB74 0013CA74 30000010 */  b          .L0013CB38
/* 3CB78 0013CA78 00000000 */   nop
.L0013CA7C:
/* 3CB7C 0013CA7C 288E0070 */  paddub     $17, $0, $0
/* 3CB80 0013CA80 28000010 */  b          .L0013CB24
/* 3CB84 0013CA84 00000000 */   nop
.L0013CA88:
/* 3CB88 0013CA88 FFFF0434 */  ori        $4, $0, 0xFFFF
/* 3CB8C 0013CA8C 80111000 */  sll        $2, $16, 6
/* 3CB90 0013CA90 21185200 */  addu       $3, $2, $18
/* 3CB94 0013CA94 80101100 */  sll        $2, $17, 2
/* 3CB98 0013CA98 21104300 */  addu       $2, $2, $3
/* 3CB9C 0013CA9C 507144AC */  sw         $4, 0x7150($2)
/* 3CBA0 0013CAA0 00121000 */  sll        $2, $16, 8
/* 3CBA4 0013CAA4 21184202 */  addu       $3, $18, $2
/* 3CBA8 0013CAA8 00111100 */  sll        $2, $17, 4
/* 3CBAC 0013CAAC 21986200 */  addu       $19, $3, $2
/* 3CBB0 0013CAB0 10016426 */  addiu      $4, $19, 0x110
/* 3CBB4 0013CAB4 5000A527 */  addiu      $5, $sp, 0x50
/* 3CBB8 0013CAB8 0C86040C */  jal        sceVu0CopyVector
/* 3CBBC 0013CABC 00000000 */   nop
/* 3CBC0 0013CAC0 10116426 */  addiu      $4, $19, 0x1110
/* 3CBC4 0013CAC4 5000A527 */  addiu      $5, $sp, 0x50
/* 3CBC8 0013CAC8 0C86040C */  jal        sceVu0CopyVector
/* 3CBCC 0013CACC 00000000 */   nop
/* 3CBD0 0013CAD0 10216426 */  addiu      $4, $19, 0x2110
/* 3CBD4 0013CAD4 5000A527 */  addiu      $5, $sp, 0x50
/* 3CBD8 0013CAD8 0C86040C */  jal        sceVu0CopyVector
/* 3CBDC 0013CADC 00000000 */   nop
/* 3CBE0 0013CAE0 10316426 */  addiu      $4, $19, 0x3110
/* 3CBE4 0013CAE4 5000A527 */  addiu      $5, $sp, 0x50
/* 3CBE8 0013CAE8 0C86040C */  jal        sceVu0CopyVector
/* 3CBEC 0013CAEC 00000000 */   nop
/* 3CBF0 0013CAF0 10416426 */  addiu      $4, $19, 0x4110
/* 3CBF4 0013CAF4 5000A527 */  addiu      $5, $sp, 0x50
/* 3CBF8 0013CAF8 0C86040C */  jal        sceVu0CopyVector
/* 3CBFC 0013CAFC 00000000 */   nop
/* 3CC00 0013CB00 10516426 */  addiu      $4, $19, 0x5110
/* 3CC04 0013CB04 5000A527 */  addiu      $5, $sp, 0x50
/* 3CC08 0013CB08 0C86040C */  jal        sceVu0CopyVector
/* 3CC0C 0013CB0C 00000000 */   nop
/* 3CC10 0013CB10 10616426 */  addiu      $4, $19, 0x6110
/* 3CC14 0013CB14 5000A527 */  addiu      $5, $sp, 0x50
/* 3CC18 0013CB18 0C86040C */  jal        sceVu0CopyVector
/* 3CC1C 0013CB1C 00000000 */   nop
/* 3CC20 0013CB20 01003126 */  addiu      $17, $17, 0x1
.L0013CB24:
/* 3CC24 0013CB24 3000438E */  lw         $3, 0x30($18)
/* 3CC28 0013CB28 2A182302 */  slt        $3, $17, $3
/* 3CC2C 0013CB2C D6FF6014 */  bnez       $3, .L0013CA88
/* 3CC30 0013CB30 00000000 */   nop
/* 3CC34 0013CB34 01001026 */  addiu      $16, $16, 0x1
.L0013CB38:
/* 3CC38 0013CB38 2C00438E */  lw         $3, 0x2C($18)
/* 3CC3C 0013CB3C 2A180302 */  slt        $3, $16, $3
/* 3CC40 0013CB40 CEFF6014 */  bnez       $3, .L0013CA7C
/* 3CC44 0013CB44 00000000 */   nop
/* 3CC48 0013CB48 440040AE */  sw         $0, 0x44($18)
/* 3CC4C 0013CB4C 940040A2 */  sb         $0, 0x94($18)
/* 3CC50 0013CB50 4000BF7B */  lq         $31, 0x40($sp)
/* 3CC54 0013CB54 3000B37B */  lq         $19, 0x30($sp)
/* 3CC58 0013CB58 2000B27B */  lq         $18, 0x20($sp)
/* 3CC5C 0013CB5C 1000B17B */  lq         $17, 0x10($sp)
/* 3CC60 0013CB60 0000B07B */  lq         $16, 0x0($sp)
/* 3CC64 0013CB64 6000BD27 */  addiu      $sp, $sp, 0x60
/* 3CC68 0013CB68 0800E003 */  jr         $31
/* 3CC6C 0013CB6C 00000000 */   nop
