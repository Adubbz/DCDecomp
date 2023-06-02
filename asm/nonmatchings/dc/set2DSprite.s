.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_ii
/* 5BE00 0015BD00 80FFBD27 */  addiu      $sp, $sp, -0x80
/* 5BE04 0015BD04 5000BF7F */  sq         $31, 0x50($sp)
/* 5BE08 0015BD08 4000B47F */  sq         $20, 0x40($sp)
/* 5BE0C 0015BD0C 3000B37F */  sq         $19, 0x30($sp)
/* 5BE10 0015BD10 2000B27F */  sq         $18, 0x20($sp)
/* 5BE14 0015BD14 1000B17F */  sq         $17, 0x10($sp)
/* 5BE18 0015BD18 0000B07F */  sq         $16, 0x0($sp)
/* 5BE1C 0015BD1C 28A68070 */  paddub     $20, $4, $0
/* 5BE20 0015BD20 289EA070 */  paddub     $19, $5, $0
/* 5BE24 0015BD24 2896C070 */  paddub     $18, $6, $0
/* 5BE28 0015BD28 288EE070 */  paddub     $17, $7, $0
/* 5BE2C 0015BD2C 28860071 */  paddub     $16, $8, $0
/* 5BE30 0015BD30 AA006012 */  beqz       $19, .L0015BFDC
/* 5BE34 0015BD34 00000000 */   nop
/* 5BE38 0015BD38 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 5BE3C 0015BD3C 7C00A2AF */  sw         $2, 0x7C($sp)
/* 5BE40 0015BD40 282E0070 */  paddub     $5, $0, $0
/* 5BE44 0015BD44 2083040C */  jal        sceVif1PkCnt
/* 5BE48 0015BD48 00000000 */   nop
/* 5BE4C 0015BD4C 28268072 */  paddub     $4, $20, $0
/* 5BE50 0015BD50 282E0070 */  paddub     $5, $0, $0
/* 5BE54 0015BD54 8E83040C */  jal        sceVif1PkOpenDirectCode
/* 5BE58 0015BD58 00000000 */   nop
/* 5BE5C 0015BD5C C701023C */  lui        $2, %hi(GiftagAD)
/* 5BE60 0015BD60 C0524224 */  addiu      $2, $2, %lo(GiftagAD)
/* 5BE64 0015BD64 28268072 */  paddub     $4, $20, $0
/* 5BE68 0015BD68 00004578 */  lq         $5, 0x0($2)
/* 5BE6C 0015BD6C B083040C */  jal        sceVif1PkOpenGifTag
/* 5BE70 0015BD70 00000000 */   nop
/* 5BE74 0015BD74 F886828F */  lw         $2, -0x7908($gp)
/* 5BE78 0015BD78 78110200 */  dsll       $2, $2, 5
/* 5BE7C 0015BD7C 41004634 */  ori        $6, $2, 0x41
/* 5BE80 0015BD80 28268072 */  paddub     $4, $20, $0
/* 5BE84 0015BD84 14000524 */  addiu      $5, $0, 0x14
/* 5BE88 0015BD88 0A84040C */  jal        sceVif1PkAddGsAD
/* 5BE8C 0015BD8C 00000000 */   nop
/* 5BE90 0015BD90 28268072 */  paddub     $4, $20, $0
/* 5BE94 0015BD94 282E0070 */  paddub     $5, $0, $0
/* 5BE98 0015BD98 56010624 */  addiu      $6, $0, 0x156
/* 5BE9C 0015BD9C 0A84040C */  jal        sceVif1PkAddGsAD
/* 5BEA0 0015BDA0 00000000 */   nop
/* 5BEA4 0015BDA4 6800A227 */  addiu      $2, $sp, 0x68
/* 5BEA8 0015BDA8 E88B83DF */  ld         $3, -0x7418($gp)
/* 5BEAC 0015BDAC 000043FC */  sd         $3, 0x0($2)
/* 5BEB0 0015BDB0 6800A393 */  lbu        $3, 0x68($sp)
/* 5BEB4 0015BDB4 01000430 */  andi       $4, $0, 0x1
/* 5BEB8 0015BDB8 FEFF0624 */  addiu      $6, $0, -0x2
/* 5BEBC 0015BDBC 24186600 */  and        $3, $3, $6
/* 5BEC0 0015BDC0 25186400 */  or         $3, $3, $4
/* 5BEC4 0015BDC4 6800A3A3 */  sb         $3, 0x68($sp)
/* 5BEC8 0015BDC8 6800A597 */  lhu        $5, 0x68($sp)
/* 5BECC 0015BDCC FF000330 */  andi       $3, $0, 0xFF
/* 5BED0 0015BDD0 00210300 */  sll        $4, $3, 4
/* 5BED4 0015BDD4 0FF00324 */  addiu      $3, $0, -0xFF1
/* 5BED8 0015BDD8 2418A300 */  and        $3, $5, $3
/* 5BEDC 0015BDDC 25186400 */  or         $3, $3, $4
/* 5BEE0 0015BDE0 6800A3A7 */  sh         $3, 0x68($sp)
/* 5BEE4 0015BDE4 6800A493 */  lbu        $4, 0x68($sp)
/* 5BEE8 0015BDE8 02000564 */  daddiu     $5, $0, 0x2
/* 5BEEC 0015BDEC F1FF0324 */  addiu      $3, $0, -0xF
/* 5BEF0 0015BDF0 24188300 */  and        $3, $4, $3
/* 5BEF4 0015BDF4 25186500 */  or         $3, $3, $5
/* 5BEF8 0015BDF8 6800A3A3 */  sb         $3, 0x68($sp)
/* 5BEFC 0015BDFC 6A00A727 */  addiu      $7, $sp, 0x6A
/* 5BF00 0015BE00 0000E390 */  lbu        $3, 0x0($7)
/* 5BF04 0015BE04 01000464 */  daddiu     $4, $0, 0x1
/* 5BF08 0015BE08 24186600 */  and        $3, $3, $6
/* 5BF0C 0015BE0C 25186400 */  or         $3, $3, $4
/* 5BF10 0015BE10 0000E3A0 */  sb         $3, 0x0($7)
/* 5BF14 0015BE14 0000E490 */  lbu        $4, 0x0($7)
/* 5BF18 0015BE18 F9FF0324 */  addiu      $3, $0, -0x7
/* 5BF1C 0015BE1C 24188300 */  and        $3, $4, $3
/* 5BF20 0015BE20 25186500 */  or         $3, $3, $5
/* 5BF24 0015BE24 0000E3A0 */  sb         $3, 0x0($7)
/* 5BF28 0015BE28 28268072 */  paddub     $4, $20, $0
/* 5BF2C 0015BE2C 47000524 */  addiu      $5, $0, 0x47
/* 5BF30 0015BE30 000046DC */  ld         $6, 0x0($2)
/* 5BF34 0015BE34 0A84040C */  jal        sceVif1PkAddGsAD
/* 5BF38 0015BE38 00000000 */   nop
/* 5BF3C 0015BE3C 7000A627 */  addiu      $6, $sp, 0x70
/* 5BF40 0015BE40 F08B82DF */  ld         $2, -0x7410($gp)
/* 5BF44 0015BE44 0000C2FC */  sd         $2, 0x0($6)
/* 5BF48 0015BE48 7400A493 */  lbu        $4, 0x74($sp)
/* 5BF4C 0015BE4C 01000364 */  daddiu     $3, $0, 0x1
/* 5BF50 0015BE50 FEFF0224 */  addiu      $2, $0, -0x2
/* 5BF54 0015BE54 24108200 */  and        $2, $4, $2
/* 5BF58 0015BE58 25104300 */  or         $2, $2, $3
/* 5BF5C 0015BE5C 7400A2A3 */  sb         $2, 0x74($sp)
/* 5BF60 0015BE60 28268072 */  paddub     $4, $20, $0
/* 5BF64 0015BE64 4E000524 */  addiu      $5, $0, 0x4E
/* 5BF68 0015BE68 0000C6DC */  ld         $6, 0x0($6)
/* 5BF6C 0015BE6C 0A84040C */  jal        sceVif1PkAddGsAD
/* 5BF70 0015BE70 00000000 */   nop
/* 5BF74 0015BE74 7C00A227 */  addiu      $2, $sp, 0x7C
/* 5BF78 0015BE78 0000429C */  lwu        $2, 0x0($2)
/* 5BF7C 0015BE7C 3C180200 */  dsll32     $3, $2, 0
/* 5BF80 0015BE80 80800234 */  ori        $2, $0, 0x8080
/* 5BF84 0015BE84 38140200 */  dsll       $2, $2, 16
/* 5BF88 0015BE88 80804234 */  ori        $2, $2, 0x8080
/* 5BF8C 0015BE8C 25306200 */  or         $6, $3, $2
/* 5BF90 0015BE90 28268072 */  paddub     $4, $20, $0
/* 5BF94 0015BE94 01000524 */  addiu      $5, $0, 0x1
/* 5BF98 0015BE98 0A84040C */  jal        sceVif1PkAddGsAD
/* 5BF9C 0015BE9C 00000000 */   nop
/* 5BFA0 0015BEA0 28268072 */  paddub     $4, $20, $0
/* 5BFA4 0015BEA4 06000524 */  addiu      $5, $0, 0x6
/* 5BFA8 0015BEA8 280066DE */  ld         $6, 0x28($19)
/* 5BFAC 0015BEAC 0A84040C */  jal        sceVif1PkAddGsAD
/* 5BFB0 0015BEB0 00000000 */   nop
/* 5BFB4 0015BEB4 00191100 */  sll        $3, $17, 4
/* 5BFB8 0015BEB8 00111000 */  sll        $2, $16, 4
/* 5BFBC 0015BEBC 38140200 */  dsll       $2, $2, 16
/* 5BFC0 0015BEC0 25306200 */  or         $6, $3, $2
/* 5BFC4 0015BEC4 28268072 */  paddub     $4, $20, $0
/* 5BFC8 0015BEC8 03000524 */  addiu      $5, $0, 0x3
/* 5BFCC 0015BECC 0A84040C */  jal        sceVif1PkAddGsAD
/* 5BFD0 0015BED0 00000000 */   nop
/* 5BFD4 0015BED4 0400428E */  lw         $2, 0x4($18)
/* 5BFD8 0015BED8 C0100200 */  sll        $2, $2, 3
/* 5BFDC 0015BEDC 00794224 */  addiu      $2, $2, 0x7900
/* 5BFE0 0015BEE0 3C100200 */  dsll32     $2, $2, 0
/* 5BFE4 0015BEE4 3F100200 */  dsra32     $2, $2, 0
/* 5BFE8 0015BEE8 381C0200 */  dsll       $3, $2, 16
/* 5BFEC 0015BEEC 0000428E */  lw         $2, 0x0($18)
/* 5BFF0 0015BEF0 00110200 */  sll        $2, $2, 4
/* 5BFF4 0015BEF4 006C4224 */  addiu      $2, $2, 0x6C00
/* 5BFF8 0015BEF8 3C100200 */  dsll32     $2, $2, 0
/* 5BFFC 0015BEFC 3F100200 */  dsra32     $2, $2, 0
/* 5C000 0015BF00 25304300 */  or         $6, $2, $3
/* 5C004 0015BF04 28268072 */  paddub     $4, $20, $0
/* 5C008 0015BF08 04000524 */  addiu      $5, $0, 0x4
/* 5C00C 0015BF0C 0A84040C */  jal        sceVif1PkAddGsAD
/* 5C010 0015BF10 00000000 */   nop
/* 5C014 0015BF14 0800428E */  lw         $2, 0x8($18)
/* 5C018 0015BF18 21102202 */  addu       $2, $17, $2
/* 5C01C 0015BF1C 00190200 */  sll        $3, $2, 4
/* 5C020 0015BF20 0C00428E */  lw         $2, 0xC($18)
/* 5C024 0015BF24 21100202 */  addu       $2, $16, $2
/* 5C028 0015BF28 00110200 */  sll        $2, $2, 4
/* 5C02C 0015BF2C 38140200 */  dsll       $2, $2, 16
/* 5C030 0015BF30 25306200 */  or         $6, $3, $2
/* 5C034 0015BF34 28268072 */  paddub     $4, $20, $0
/* 5C038 0015BF38 03000524 */  addiu      $5, $0, 0x3
/* 5C03C 0015BF3C 0A84040C */  jal        sceVif1PkAddGsAD
/* 5C040 0015BF40 00000000 */   nop
/* 5C044 0015BF44 0400438E */  lw         $3, 0x4($18)
/* 5C048 0015BF48 0C00428E */  lw         $2, 0xC($18)
/* 5C04C 0015BF4C 21106200 */  addu       $2, $3, $2
/* 5C050 0015BF50 C0100200 */  sll        $2, $2, 3
/* 5C054 0015BF54 00794224 */  addiu      $2, $2, 0x7900
/* 5C058 0015BF58 3C100200 */  dsll32     $2, $2, 0
/* 5C05C 0015BF5C 3F100200 */  dsra32     $2, $2, 0
/* 5C060 0015BF60 38240200 */  dsll       $4, $2, 16
/* 5C064 0015BF64 0000438E */  lw         $3, 0x0($18)
/* 5C068 0015BF68 0800428E */  lw         $2, 0x8($18)
/* 5C06C 0015BF6C 21106200 */  addu       $2, $3, $2
/* 5C070 0015BF70 00110200 */  sll        $2, $2, 4
/* 5C074 0015BF74 FF6B4224 */  addiu      $2, $2, 0x6BFF
/* 5C078 0015BF78 3C100200 */  dsll32     $2, $2, 0
/* 5C07C 0015BF7C 3F100200 */  dsra32     $2, $2, 0
/* 5C080 0015BF80 25304400 */  or         $6, $2, $4
/* 5C084 0015BF84 28268072 */  paddub     $4, $20, $0
/* 5C088 0015BF88 04000524 */  addiu      $5, $0, 0x4
/* 5C08C 0015BF8C 0A84040C */  jal        sceVif1PkAddGsAD
/* 5C090 0015BF90 00000000 */   nop
/* 5C094 0015BF94 E88B8227 */  addiu      $2, $gp, -0x7418
/* 5C098 0015BF98 28268072 */  paddub     $4, $20, $0
/* 5C09C 0015BF9C 47000524 */  addiu      $5, $0, 0x47
/* 5C0A0 0015BFA0 000046DC */  ld         $6, 0x0($2)
/* 5C0A4 0015BFA4 0A84040C */  jal        sceVif1PkAddGsAD
/* 5C0A8 0015BFA8 00000000 */   nop
/* 5C0AC 0015BFAC F08B8227 */  addiu      $2, $gp, -0x7410
/* 5C0B0 0015BFB0 28268072 */  paddub     $4, $20, $0
/* 5C0B4 0015BFB4 4E000524 */  addiu      $5, $0, 0x4E
/* 5C0B8 0015BFB8 000046DC */  ld         $6, 0x0($2)
/* 5C0BC 0015BFBC 0A84040C */  jal        sceVif1PkAddGsAD
/* 5C0C0 0015BFC0 00000000 */   nop
/* 5C0C4 0015BFC4 28268072 */  paddub     $4, $20, $0
/* 5C0C8 0015BFC8 B683040C */  jal        sceVif1PkCloseGifTag
/* 5C0CC 0015BFCC 00000000 */   nop
/* 5C0D0 0015BFD0 28268072 */  paddub     $4, $20, $0
/* 5C0D4 0015BFD4 A483040C */  jal        sceVif1PkCloseDirectCode
/* 5C0D8 0015BFD8 00000000 */   nop
.L0015BFDC:
/* 5C0DC 0015BFDC 5000BF7B */  lq         $31, 0x50($sp)
/* 5C0E0 0015BFE0 4000B47B */  lq         $20, 0x40($sp)
/* 5C0E4 0015BFE4 3000B37B */  lq         $19, 0x30($sp)
/* 5C0E8 0015BFE8 2000B27B */  lq         $18, 0x20($sp)
/* 5C0EC 0015BFEC 1000B17B */  lq         $17, 0x10($sp)
/* 5C0F0 0015BFF0 0000B07B */  lq         $16, 0x0($sp)
/* 5C0F4 0015BFF4 8000BD27 */  addiu      $sp, $sp, 0x80
/* 5C0F8 0015BFF8 0800E003 */  jr         $31
/* 5C0FC 0015BFFC 00000000 */   nop
