.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MenuPolygonDraw__FiPFv_v
/* 12BF90 0022BE90 70FEBD27 */  addiu      $sp, $sp, -0x190
/* 12BF94 0022BE94 2000BF7F */  sq         $31, 0x20($sp)
/* 12BF98 0022BE98 1000B17F */  sq         $17, 0x10($sp)
/* 12BF9C 0022BE9C 0000B07F */  sq         $16, 0x0($sp)
/* 12BFA0 0022BEA0 288E8070 */  paddub     $17, $4, $0
/* 12BFA4 0022BEA4 2886A070 */  paddub     $16, $5, $0
/* 12BFA8 0022BEA8 2900023C */  lui        $2, %hi(_611_3)
/* 12BFAC 0022BEAC E0444224 */  addiu      $2, $2, %lo(_611_3)
/* 12BFB0 0022BEB0 3000A527 */  addiu      $5, $sp, 0x30
/* 12BFB4 0022BEB4 00004278 */  lq         $2, 0x0($2)
/* 12BFB8 0022BEB8 0000A27C */  sq         $2, 0x0($5)
/* 12BFBC 0022BEBC 2900023C */  lui        $2, %hi(_612_3)
/* 12BFC0 0022BEC0 F0444224 */  addiu      $2, $2, %lo(_612_3)
/* 12BFC4 0022BEC4 4000A327 */  addiu      $3, $sp, 0x40
/* 12BFC8 0022BEC8 00004278 */  lq         $2, 0x0($2)
/* 12BFCC 0022BECC 0000627C */  sq         $2, 0x0($3)
/* 12BFD0 0022BED0 DA01023C */  lui        $2, %hi(MenuCamera)
/* 12BFD4 0022BED4 D0084424 */  addiu      $4, $2, %lo(MenuCamera)
/* 12BFD8 0022BED8 C490040C */  jal        SetRef__7CCameraFPf
/* 12BFDC 0022BEDC 00000000 */   nop
/* 12BFE0 0022BEE0 DA01023C */  lui        $2, %hi(MenuCamera)
/* 12BFE4 0022BEE4 D0084424 */  addiu      $4, $2, %lo(MenuCamera)
/* 12BFE8 0022BEE8 4000A527 */  addiu      $5, $sp, 0x40
/* 12BFEC 0022BEEC A490040C */  jal        SetPos__7CCameraFPf
/* 12BFF0 0022BEF0 00000000 */   nop
/* 12BFF4 0022BEF4 2900023C */  lui        $2, %hi(_613_2)
/* 12BFF8 0022BEF8 00454524 */  addiu      $5, $2, %lo(_613_2)
/* 12BFFC 0022BEFC 5000A427 */  addiu      $4, $sp, 0x50
/* 12C000 0022BF00 04000324 */  addiu      $3, $0, 0x4
.L0022BF04:
/* 12C004 0022BF04 0000A278 */  lq         $2, 0x0($5)
/* 12C008 0022BF08 1000A524 */  addiu      $5, $5, 0x10
/* 12C00C 0022BF0C FFFF6324 */  addiu      $3, $3, -0x1
/* 12C010 0022BF10 0000827C */  sq         $2, 0x0($4)
/* 12C014 0022BF14 10008424 */  addiu      $4, $4, 0x10
/* 12C018 0022BF18 FAFF601C */  bgtz       $3, .L0022BF04
/* 12C01C 0022BF1C 00000000 */   nop
/* 12C020 0022BF20 2900023C */  lui        $2, %hi(_614_3)
/* 12C024 0022BF24 40454524 */  addiu      $5, $2, %lo(_614_3)
/* 12C028 0022BF28 9000A427 */  addiu      $4, $sp, 0x90
/* 12C02C 0022BF2C 04000324 */  addiu      $3, $0, 0x4
.L0022BF30:
/* 12C030 0022BF30 0000A278 */  lq         $2, 0x0($5)
/* 12C034 0022BF34 1000A524 */  addiu      $5, $5, 0x10
/* 12C038 0022BF38 FFFF6324 */  addiu      $3, $3, -0x1
/* 12C03C 0022BF3C 0000827C */  sq         $2, 0x0($4)
/* 12C040 0022BF40 10008424 */  addiu      $4, $4, 0x10
/* 12C044 0022BF44 FAFF601C */  bgtz       $3, .L0022BF30
/* 12C048 0022BF48 00000000 */   nop
/* 12C04C 0022BF4C F000A427 */  addiu      $4, $sp, 0xF0
/* 12C050 0022BF50 3001A527 */  addiu      $5, $sp, 0x130
/* 12C054 0022BF54 2CB7040C */  jal        MGGetPLight__FPA4_fPA4_f
/* 12C058 0022BF58 00000000 */   nop
/* 12C05C 0022BF5C D000A427 */  addiu      $4, $sp, 0xD0
/* 12C060 0022BF60 4CB7040C */  jal        MGGetAmbient__FPf
/* 12C064 0022BF64 00000000 */   nop
/* 12C068 0022BF68 A042023C */  lui        $2, (0x42A00000 >> 16)
/* 12C06C 0022BF6C E800A2AF */  sw         $2, 0xE8($sp)
/* 12C070 0022BF70 E400A2AF */  sw         $2, 0xE4($sp)
/* 12C074 0022BF74 E000A2AF */  sw         $2, 0xE0($sp)
/* 12C078 0022BF78 00009144 */  mtc1       $17, $f0
/* 12C07C 0022BF7C 00000000 */  nop
/* 12C080 0022BF80 20008046 */  cvt.s.w    $f0, $f0
/* 12C084 0022BF84 EC00A0E7 */  swc1       $f0, 0xEC($sp)
/* 12C088 0022BF88 2900023C */  lui        $2, %hi(_615_3)
/* 12C08C 0022BF8C 80454224 */  addiu      $2, $2, %lo(_615_3)
/* 12C090 0022BF90 7001A527 */  addiu      $5, $sp, 0x170
/* 12C094 0022BF94 00004278 */  lq         $2, 0x0($2)
/* 12C098 0022BF98 0000A27C */  sq         $2, 0x0($5)
/* 12C09C 0022BF9C 8001A427 */  addiu      $4, $sp, 0x180
/* 12C0A0 0022BFA0 9285040C */  jal        sceVu0Normalize
/* 12C0A4 0022BFA4 00000000 */   nop
/* 12C0A8 0022BFA8 8001A0C7 */  lwc1       $f0, 0x180($sp)
/* 12C0AC 0022BFAC 5000A0E7 */  swc1       $f0, 0x50($sp)
/* 12C0B0 0022BFB0 8401A0C7 */  lwc1       $f0, 0x184($sp)
/* 12C0B4 0022BFB4 6000A0E7 */  swc1       $f0, 0x60($sp)
/* 12C0B8 0022BFB8 8801A0C7 */  lwc1       $f0, 0x188($sp)
/* 12C0BC 0022BFBC 7000A0E7 */  swc1       $f0, 0x70($sp)
/* 12C0C0 0022BFC0 5000A427 */  addiu      $4, $sp, 0x50
/* 12C0C4 0022BFC4 9000A527 */  addiu      $5, $sp, 0x90
/* 12C0C8 0022BFC8 08B7040C */  jal        MGSetPLight__FPA4_fPA4_f
/* 12C0CC 0022BFCC 00000000 */   nop
/* 12C0D0 0022BFD0 E000A427 */  addiu      $4, $sp, 0xE0
/* 12C0D4 0022BFD4 40B7040C */  jal        MGSetAmbient__FPf
/* 12C0D8 0022BFD8 00000000 */   nop
/* 12C0DC 0022BFDC 09F80002 */  jalr       $16
/* 12C0E0 0022BFE0 00000000 */   nop
/* 12C0E4 0022BFE4 F000A427 */  addiu      $4, $sp, 0xF0
/* 12C0E8 0022BFE8 3001A527 */  addiu      $5, $sp, 0x130
/* 12C0EC 0022BFEC 08B7040C */  jal        MGSetPLight__FPA4_fPA4_f
/* 12C0F0 0022BFF0 00000000 */   nop
/* 12C0F4 0022BFF4 D000A427 */  addiu      $4, $sp, 0xD0
/* 12C0F8 0022BFF8 40B7040C */  jal        MGSetAmbient__FPf
/* 12C0FC 0022BFFC 00000000 */   nop
/* 12C100 0022C000 2000BF7B */  lq         $31, 0x20($sp)
/* 12C104 0022C004 1000B17B */  lq         $17, 0x10($sp)
/* 12C108 0022C008 0000B07B */  lq         $16, 0x0($sp)
/* 12C10C 0022C00C 9001BD27 */  addiu      $sp, $sp, 0x190
/* 12C110 0022C010 0800E003 */  jr         $31
/* 12C114 0022C014 00000000 */   nop
/* 12C118 0022C018 00000000 */  nop
/* 12C11C 0022C01C 00000000 */  nop
