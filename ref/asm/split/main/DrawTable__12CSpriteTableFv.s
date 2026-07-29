.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawTable__12CSpriteTableFv
/* 02BB20 0012BA20 20FFBD27 */  addiu       $29, $29, -0xE0
/* 02BB24 0012BA24 9000BF7F */  sq          $31, 0x90($29)
/* 02BB28 0012BA28 8000BE7F */  sq          $30, 0x80($29)
/* 02BB2C 0012BA2C 7000B77F */  sq          $23, 0x70($29)
/* 02BB30 0012BA30 6000B67F */  sq          $22, 0x60($29)
/* 02BB34 0012BA34 5000B57F */  sq          $21, 0x50($29)
/* 02BB38 0012BA38 4000B47F */  sq          $20, 0x40($29)
/* 02BB3C 0012BA3C 3000B37F */  sq          $19, 0x30($29)
/* 02BB40 0012BA40 2000B27F */  sq          $18, 0x20($29)
/* 02BB44 0012BA44 1000B17F */  sq          $17, 0x10($29)
/* 02BB48 0012BA48 0000B07F */  sq          $16, 0x0($29)
/* 02BB4C 0012BA4C 28AE8070 */  paddub      $21, $4, $0
/* 02BB50 0012BA50 28860070 */  paddub      $16, $0, $0
/* 02BB54 0012BA54 A0B8040C */  jal         GetVif1Packet__Fv
/* 02BB58 0012BA58 00000000 */   nop
/* 02BB5C 0012BA5C 288E4070 */  paddub      $17, $2, $0
/* 02BB60 0012BA60 C000A327 */  addiu       $3, $29, 0xC0
/* 02BB64 0012BA64 F88B82DF */  ld          $2, -0x7408($28)
/* 02BB68 0012BA68 000062FC */  sd          $2, 0x0($3)
/* 02BB6C 0012BA6C C800A327 */  addiu       $3, $29, 0xC8
/* 02BB70 0012BA70 E88B82DF */  ld          $2, -0x7418($28)
/* 02BB74 0012BA74 000062FC */  sd          $2, 0x0($3)
/* 02BB78 0012BA78 C800A293 */  lbu         $2, 0xC8($29)
/* 02BB7C 0012BA7C 01000330 */  andi        $3, $0, 0x1
/* 02BB80 0012BA80 FEFF0624 */  addiu       $6, $0, -0x2
/* 02BB84 0012BA84 24104600 */  and         $2, $2, $6
/* 02BB88 0012BA88 25104300 */  or          $2, $2, $3
/* 02BB8C 0012BA8C C800A2A3 */  sb          $2, 0xC8($29)
/* 02BB90 0012BA90 C900A493 */  lbu         $4, 0xC9($29)
/* 02BB94 0012BA94 80190300 */  sll         $3, $3, 6
/* 02BB98 0012BA98 BFFF0224 */  addiu       $2, $0, -0x41
/* 02BB9C 0012BA9C 24108200 */  and         $2, $4, $2
/* 02BBA0 0012BAA0 25104300 */  or          $2, $2, $3
/* 02BBA4 0012BAA4 C900A2A3 */  sb          $2, 0xC9($29)
/* 02BBA8 0012BAA8 CA00A727 */  addiu       $7, $29, 0xCA
/* 02BBAC 0012BAAC 0000E290 */  lbu         $2, 0x0($7)
/* 02BBB0 0012BAB0 01000564 */  daddiu      $5, $0, 0x1
/* 02BBB4 0012BAB4 24104600 */  and         $2, $2, $6
/* 02BBB8 0012BAB8 25104500 */  or          $2, $2, $5
/* 02BBBC 0012BABC 0000E2A0 */  sb          $2, 0x0($7)
/* 02BBC0 0012BAC0 0000E490 */  lbu         $4, 0x0($7)
/* 02BBC4 0012BAC4 02000364 */  daddiu      $3, $0, 0x2
/* 02BBC8 0012BAC8 F9FF0224 */  addiu       $2, $0, -0x7
/* 02BBCC 0012BACC 24108200 */  and         $2, $4, $2
/* 02BBD0 0012BAD0 25104300 */  or          $2, $2, $3
/* 02BBD4 0012BAD4 0000E2A0 */  sb          $2, 0x0($7)
/* 02BBD8 0012BAD8 D000A327 */  addiu       $3, $29, 0xD0
/* 02BBDC 0012BADC F08B82DF */  ld          $2, -0x7410($28)
/* 02BBE0 0012BAE0 000062FC */  sd          $2, 0x0($3)
/* 02BBE4 0012BAE4 D400A293 */  lbu         $2, 0xD4($29)
/* 02BBE8 0012BAE8 24104600 */  and         $2, $2, $6
/* 02BBEC 0012BAEC 25104500 */  or          $2, $2, $5
/* 02BBF0 0012BAF0 D400A2A3 */  sb          $2, 0xD4($29)
/* 02BBF4 0012BAF4 28262072 */  paddub      $4, $17, $0
/* 02BBF8 0012BAF8 282E0070 */  paddub      $5, $0, $0
/* 02BBFC 0012BAFC 2083040C */  jal         sceVif1PkCnt
/* 02BC00 0012BB00 00000000 */   nop
/* 02BC04 0012BB04 28262072 */  paddub      $4, $17, $0
/* 02BC08 0012BB08 282E0070 */  paddub      $5, $0, $0
/* 02BC0C 0012BB0C 8E83040C */  jal         sceVif1PkOpenDirectCode
/* 02BC10 0012BB10 00000000 */   nop
/* 02BC14 0012BB14 C701023C */  lui         $2, %hi(GiftagAD)
/* 02BC18 0012BB18 C0524224 */  addiu       $2, $2, %lo(GiftagAD)
/* 02BC1C 0012BB1C 28262072 */  paddub      $4, $17, $0
/* 02BC20 0012BB20 00004578 */  lq          $5, 0x0($2)
/* 02BC24 0012BB24 B083040C */  jal         sceVif1PkOpenGifTag
/* 02BC28 0012BB28 00000000 */   nop
/* 02BC2C 0012BB2C 28262072 */  paddub      $4, $17, $0
/* 02BC30 0012BB30 3F000524 */  addiu       $5, $0, 0x3F
/* 02BC34 0012BB34 28360070 */  paddub      $6, $0, $0
/* 02BC38 0012BB38 0A84040C */  jal         sceVif1PkAddGsAD
/* 02BC3C 0012BB3C 00000000 */   nop
/* 02BC40 0012BB40 C000A227 */  addiu       $2, $29, 0xC0
/* 02BC44 0012BB44 28262072 */  paddub      $4, $17, $0
/* 02BC48 0012BB48 42000524 */  addiu       $5, $0, 0x42
/* 02BC4C 0012BB4C 000046DC */  ld          $6, 0x0($2)
/* 02BC50 0012BB50 0A84040C */  jal         sceVif1PkAddGsAD
/* 02BC54 0012BB54 00000000 */   nop
/* 02BC58 0012BB58 C800A227 */  addiu       $2, $29, 0xC8
/* 02BC5C 0012BB5C 28262072 */  paddub      $4, $17, $0
/* 02BC60 0012BB60 47000524 */  addiu       $5, $0, 0x47
/* 02BC64 0012BB64 000046DC */  ld          $6, 0x0($2)
/* 02BC68 0012BB68 0A84040C */  jal         sceVif1PkAddGsAD
/* 02BC6C 0012BB6C 00000000 */   nop
/* 02BC70 0012BB70 D000A227 */  addiu       $2, $29, 0xD0
/* 02BC74 0012BB74 28262072 */  paddub      $4, $17, $0
/* 02BC78 0012BB78 4E000524 */  addiu       $5, $0, 0x4E
/* 02BC7C 0012BB7C 000046DC */  ld          $6, 0x0($2)
/* 02BC80 0012BB80 0A84040C */  jal         sceVif1PkAddGsAD
/* 02BC84 0012BB84 00000000 */   nop
/* 02BC88 0012BB88 28262072 */  paddub      $4, $17, $0
/* 02BC8C 0012BB8C 14000524 */  addiu       $5, $0, 0x14
/* 02BC90 0012BB90 01000624 */  addiu       $6, $0, 0x1
/* 02BC94 0012BB94 0A84040C */  jal         sceVif1PkAddGsAD
/* 02BC98 0012BB98 00000000 */   nop
/* 02BC9C 0012BB9C 28262072 */  paddub      $4, $17, $0
/* 02BCA0 0012BBA0 282E0070 */  paddub      $5, $0, $0
/* 02BCA4 0012BBA4 56010624 */  addiu       $6, $0, 0x156
/* 02BCA8 0012BBA8 0A84040C */  jal         sceVif1PkAddGsAD
/* 02BCAC 0012BBAC 00000000 */   nop
/* 02BCB0 0012BBB0 28B60070 */  paddub      $22, $0, $0
/* 02BCB4 0012BBB4 0400A28E */  lw          $2, 0x4($21)
/* 02BCB8 0012BBB8 FFFF5224 */  addiu       $18, $2, -0x1
/* 02BCBC 0012BBBC 87000010 */  b           .L0012BDDC
/* 02BCC0 0012BBC0 00000000 */   nop
.L0012BBC4:
/* 02BCC4 0012BBC4 80A01200 */  sll         $20, $18, 2
/* 02BCC8 0012BBC8 21109502 */  addu        $2, $20, $21
/* 02BCCC 0012BBCC 0C00538C */  lw          $19, 0xC($2)
/* 02BCD0 0012BBD0 7D000010 */  b           .L0012BDC8
/* 02BCD4 0012BBD4 00000000 */   nop
.L0012BBD8:
/* 02BCD8 0012BBD8 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 02BCDC 0012BBDC DC00A2AF */  sw          $2, 0xDC($29)
/* 02BCE0 0012BBE0 10006386 */  lh          $3, 0x10($19)
/* 02BCE4 0012BBE4 12006286 */  lh          $2, 0x12($19)
/* 02BCE8 0012BBE8 38120200 */  dsll        $2, $2, 8
/* 02BCEC 0012BBEC 25186200 */  or          $3, $3, $2
/* 02BCF0 0012BBF0 14006286 */  lh          $2, 0x14($19)
/* 02BCF4 0012BBF4 38140200 */  dsll        $2, $2, 16
/* 02BCF8 0012BBF8 25184300 */  or          $3, $2, $3
/* 02BCFC 0012BBFC 16006286 */  lh          $2, 0x16($19)
/* 02BD00 0012BC00 38160200 */  dsll        $2, $2, 24
/* 02BD04 0012BC04 25184300 */  or          $3, $2, $3
/* 02BD08 0012BC08 DC00A227 */  addiu       $2, $29, 0xDC
/* 02BD0C 0012BC0C 0000429C */  lwu         $2, 0x0($2)
/* 02BD10 0012BC10 3C100200 */  dsll32      $2, $2, 0
/* 02BD14 0012BC14 25304300 */  or          $6, $2, $3
/* 02BD18 0012BC18 28262072 */  paddub      $4, $17, $0
/* 02BD1C 0012BC1C 01000524 */  addiu       $5, $0, 0x1
/* 02BD20 0012BC20 0A84040C */  jal         sceVif1PkAddGsAD
/* 02BD24 0012BC24 00000000 */   nop
/* 02BD28 0012BC28 28262072 */  paddub      $4, $17, $0
/* 02BD2C 0012BC2C 06000524 */  addiu       $5, $0, 0x6
/* 02BD30 0012BC30 280066DE */  ld          $6, 0x28($19)
/* 02BD34 0012BC34 0A84040C */  jal         sceVif1PkAddGsAD
/* 02BD38 0012BC38 00000000 */   nop
/* 02BD3C 0012BC3C 00006486 */  lh          $4, 0x0($19)
/* 02BD40 0012BC40 00110400 */  sll         $2, $4, 4
/* 02BD44 0012BC44 006C4224 */  addiu       $2, $2, 0x6C00
/* 02BD48 0012BC48 A000A2AF */  sw          $2, 0xA0($29)
/* 02BD4C 0012BC4C 02006386 */  lh          $3, 0x2($19)
/* 02BD50 0012BC50 00110300 */  sll         $2, $3, 4
/* 02BD54 0012BC54 43100200 */  sra         $2, $2, 1
/* 02BD58 0012BC58 00794224 */  addiu       $2, $2, 0x7900
/* 02BD5C 0012BC5C B000A2AF */  sw          $2, 0xB0($29)
/* 02BD60 0012BC60 04006286 */  lh          $2, 0x4($19)
/* 02BD64 0012BC64 21108200 */  addu        $2, $4, $2
/* 02BD68 0012BC68 00110200 */  sll         $2, $2, 4
/* 02BD6C 0012BC6C FF6B5E24 */  addiu       $30, $2, 0x6BFF
/* 02BD70 0012BC70 06006286 */  lh          $2, 0x6($19)
/* 02BD74 0012BC74 21106200 */  addu        $2, $3, $2
/* 02BD78 0012BC78 00110200 */  sll         $2, $2, 4
/* 02BD7C 0012BC7C 43100200 */  sra         $2, $2, 1
/* 02BD80 0012BC80 FF785724 */  addiu       $23, $2, 0x78FF
/* 02BD84 0012BC84 08006286 */  lh          $2, 0x8($19)
/* 02BD88 0012BC88 00190200 */  sll         $3, $2, 4
/* 02BD8C 0012BC8C 0A006286 */  lh          $2, 0xA($19)
/* 02BD90 0012BC90 00110200 */  sll         $2, $2, 4
/* 02BD94 0012BC94 38140200 */  dsll        $2, $2, 16
/* 02BD98 0012BC98 25306200 */  or          $6, $3, $2
/* 02BD9C 0012BC9C 28262072 */  paddub      $4, $17, $0
/* 02BDA0 0012BCA0 03000524 */  addiu       $5, $0, 0x3
/* 02BDA4 0012BCA4 0A84040C */  jal         sceVif1PkAddGsAD
/* 02BDA8 0012BCA8 00000000 */   nop
/* 02BDAC 0012BCAC A000A28F */  lw          $2, 0xA0($29)
/* 02BDB0 0012BCB0 281E4070 */  paddub      $3, $2, $0
/* 02BDB4 0012BCB4 B000A28F */  lw          $2, 0xB0($29)
/* 02BDB8 0012BCB8 28164070 */  paddub      $2, $2, $0
/* 02BDBC 0012BCBC 38140200 */  dsll        $2, $2, 16
/* 02BDC0 0012BCC0 25306200 */  or          $6, $3, $2
/* 02BDC4 0012BCC4 28262072 */  paddub      $4, $17, $0
/* 02BDC8 0012BCC8 0C000524 */  addiu       $5, $0, 0xC
/* 02BDCC 0012BCCC 0A84040C */  jal         sceVif1PkAddGsAD
/* 02BDD0 0012BCD0 00000000 */   nop
/* 02BDD4 0012BCD4 08006386 */  lh          $3, 0x8($19)
/* 02BDD8 0012BCD8 0C006286 */  lh          $2, 0xC($19)
/* 02BDDC 0012BCDC 21106200 */  addu        $2, $3, $2
/* 02BDE0 0012BCE0 00210200 */  sll         $4, $2, 4
/* 02BDE4 0012BCE4 0A006386 */  lh          $3, 0xA($19)
/* 02BDE8 0012BCE8 0E006286 */  lh          $2, 0xE($19)
/* 02BDEC 0012BCEC 21106200 */  addu        $2, $3, $2
/* 02BDF0 0012BCF0 00110200 */  sll         $2, $2, 4
/* 02BDF4 0012BCF4 38140200 */  dsll        $2, $2, 16
/* 02BDF8 0012BCF8 25308200 */  or          $6, $4, $2
/* 02BDFC 0012BCFC 28262072 */  paddub      $4, $17, $0
/* 02BE00 0012BD00 03000524 */  addiu       $5, $0, 0x3
/* 02BE04 0012BD04 0A84040C */  jal         sceVif1PkAddGsAD
/* 02BE08 0012BD08 00000000 */   nop
/* 02BE0C 0012BD0C 3C181E00 */  dsll32      $3, $30, 0
/* 02BE10 0012BD10 3F180300 */  dsra32      $3, $3, 0
/* 02BE14 0012BD14 3C101700 */  dsll32      $2, $23, 0
/* 02BE18 0012BD18 3F100200 */  dsra32      $2, $2, 0
/* 02BE1C 0012BD1C 38140200 */  dsll        $2, $2, 16
/* 02BE20 0012BD20 25306200 */  or          $6, $3, $2
/* 02BE24 0012BD24 28262072 */  paddub      $4, $17, $0
/* 02BE28 0012BD28 04000524 */  addiu       $5, $0, 0x4
/* 02BE2C 0012BD2C 0A84040C */  jal         sceVif1PkAddGsAD
/* 02BE30 0012BD30 00000000 */   nop
/* 02BE34 0012BD34 28262072 */  paddub      $4, $17, $0
/* 02BE38 0012BD38 3F000524 */  addiu       $5, $0, 0x3F
/* 02BE3C 0012BD3C 28360070 */  paddub      $6, $0, $0
/* 02BE40 0012BD40 0A84040C */  jal         sceVif1PkAddGsAD
/* 02BE44 0012BD44 00000000 */   nop
/* 02BE48 0012BD48 3000738E */  lw          $19, 0x30($19)
/* 02BE4C 0012BD4C 01001026 */  addiu       $16, $16, 0x1
/* 02BE50 0012BD50 0100D626 */  addiu       $22, $22, 0x1
/* 02BE54 0012BD54 8100012A */  slti        $1, $16, 0x81
/* 02BE58 0012BD58 1B002014 */  bnez        $1, .L0012BDC8
/* 02BE5C 0012BD5C 00000000 */   nop
/* 02BE60 0012BD60 28860070 */  paddub      $16, $0, $0
/* 02BE64 0012BD64 28262072 */  paddub      $4, $17, $0
/* 02BE68 0012BD68 B683040C */  jal         sceVif1PkCloseGifTag
/* 02BE6C 0012BD6C 00000000 */   nop
/* 02BE70 0012BD70 28262072 */  paddub      $4, $17, $0
/* 02BE74 0012BD74 A483040C */  jal         sceVif1PkCloseDirectCode
/* 02BE78 0012BD78 00000000 */   nop
/* 02BE7C 0012BD7C 28262072 */  paddub      $4, $17, $0
/* 02BE80 0012BD80 282E0070 */  paddub      $5, $0, $0
/* 02BE84 0012BD84 2083040C */  jal         sceVif1PkCnt
/* 02BE88 0012BD88 00000000 */   nop
/* 02BE8C 0012BD8C 28262072 */  paddub      $4, $17, $0
/* 02BE90 0012BD90 282E0070 */  paddub      $5, $0, $0
/* 02BE94 0012BD94 8E83040C */  jal         sceVif1PkOpenDirectCode
/* 02BE98 0012BD98 00000000 */   nop
/* 02BE9C 0012BD9C C701023C */  lui         $2, %hi(GiftagAD)
/* 02BEA0 0012BDA0 C0524224 */  addiu       $2, $2, %lo(GiftagAD)
/* 02BEA4 0012BDA4 28262072 */  paddub      $4, $17, $0
/* 02BEA8 0012BDA8 00004578 */  lq          $5, 0x0($2)
/* 02BEAC 0012BDAC B083040C */  jal         sceVif1PkOpenGifTag
/* 02BEB0 0012BDB0 00000000 */   nop
/* 02BEB4 0012BDB4 28262072 */  paddub      $4, $17, $0
/* 02BEB8 0012BDB8 282E0070 */  paddub      $5, $0, $0
/* 02BEBC 0012BDBC 56010624 */  addiu       $6, $0, 0x156
/* 02BEC0 0012BDC0 0A84040C */  jal         sceVif1PkAddGsAD
/* 02BEC4 0012BDC4 00000000 */   nop
.L0012BDC8:
/* 02BEC8 0012BDC8 21109502 */  addu        $2, $20, $21
/* 02BECC 0012BDCC 4C00428C */  lw          $2, 0x4C($2)
/* 02BED0 0012BDD0 81FF6216 */  bne         $19, $2, .L0012BBD8
/* 02BED4 0012BDD4 00000000 */   nop
/* 02BED8 0012BDD8 FFFF5226 */  addiu       $18, $18, -0x1
.L0012BDDC:
/* 02BEDC 0012BDDC 79FF4106 */  bgez        $18, .L0012BBC4
/* 02BEE0 0012BDE0 00000000 */   nop
/* 02BEE4 0012BDE4 28262072 */  paddub      $4, $17, $0
/* 02BEE8 0012BDE8 3F000524 */  addiu       $5, $0, 0x3F
/* 02BEEC 0012BDEC 28360070 */  paddub      $6, $0, $0
/* 02BEF0 0012BDF0 0A84040C */  jal         sceVif1PkAddGsAD
/* 02BEF4 0012BDF4 00000000 */   nop
/* 02BEF8 0012BDF8 F88B8227 */  addiu       $2, $28, -0x7408
/* 02BEFC 0012BDFC 28262072 */  paddub      $4, $17, $0
/* 02BF00 0012BE00 42000524 */  addiu       $5, $0, 0x42
/* 02BF04 0012BE04 000046DC */  ld          $6, 0x0($2)
/* 02BF08 0012BE08 0A84040C */  jal         sceVif1PkAddGsAD
/* 02BF0C 0012BE0C 00000000 */   nop
/* 02BF10 0012BE10 E88B8227 */  addiu       $2, $28, -0x7418
/* 02BF14 0012BE14 28262072 */  paddub      $4, $17, $0
/* 02BF18 0012BE18 47000524 */  addiu       $5, $0, 0x47
/* 02BF1C 0012BE1C 000046DC */  ld          $6, 0x0($2)
/* 02BF20 0012BE20 0A84040C */  jal         sceVif1PkAddGsAD
/* 02BF24 0012BE24 00000000 */   nop
/* 02BF28 0012BE28 F08B8227 */  addiu       $2, $28, -0x7410
/* 02BF2C 0012BE2C 28262072 */  paddub      $4, $17, $0
/* 02BF30 0012BE30 4E000524 */  addiu       $5, $0, 0x4E
/* 02BF34 0012BE34 000046DC */  ld          $6, 0x0($2)
/* 02BF38 0012BE38 0A84040C */  jal         sceVif1PkAddGsAD
/* 02BF3C 0012BE3C 00000000 */   nop
/* 02BF40 0012BE40 28262072 */  paddub      $4, $17, $0
/* 02BF44 0012BE44 B683040C */  jal         sceVif1PkCloseGifTag
/* 02BF48 0012BE48 00000000 */   nop
/* 02BF4C 0012BE4C 28262072 */  paddub      $4, $17, $0
/* 02BF50 0012BE50 A483040C */  jal         sceVif1PkCloseDirectCode
/* 02BF54 0012BE54 00000000 */   nop
/* 02BF58 0012BE58 9000BF7B */  lq          $31, 0x90($29)
/* 02BF5C 0012BE5C 8000BE7B */  lq          $30, 0x80($29)
/* 02BF60 0012BE60 7000B77B */  lq          $23, 0x70($29)
/* 02BF64 0012BE64 6000B67B */  lq          $22, 0x60($29)
/* 02BF68 0012BE68 5000B57B */  lq          $21, 0x50($29)
/* 02BF6C 0012BE6C 4000B47B */  lq          $20, 0x40($29)
/* 02BF70 0012BE70 3000B37B */  lq          $19, 0x30($29)
/* 02BF74 0012BE74 2000B27B */  lq          $18, 0x20($29)
/* 02BF78 0012BE78 1000B17B */  lq          $17, 0x10($29)
/* 02BF7C 0012BE7C 0000B07B */  lq          $16, 0x0($29)
/* 02BF80 0012BE80 E000BD27 */  addiu       $29, $29, 0xE0
/* 02BF84 0012BE84 0800E003 */  jr          $31
/* 02BF88 0012BE88 00000000 */   nop
/* 02BF8C 0012BE8C 00000000 */  nop
