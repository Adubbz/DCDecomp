.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __kernel_sin
/* 1BCA0 0011BBA0 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 1BCA4 0011BBA4 5000B5FF */  sd         $21, 0x50($sp)
/* 1BCA8 0011BBA8 2000B2FF */  sd         $18, 0x20($sp)
/* 1BCAC 0011BBAC 2DA8A000 */  daddu      $21, $5, $0
/* 1BCB0 0011BBB0 0000B0FF */  sd         $16, 0x0($sp)
/* 1BCB4 0011BBB4 2D908000 */  daddu      $18, $4, $0
/* 1BCB8 0011BBB8 6000BFFF */  sd         $31, 0x60($sp)
/* 1BCBC 0011BBBC 2D80C000 */  daddu      $16, $6, $0
/* 1BCC0 0011BBC0 4000B4FF */  sd         $20, 0x40($sp)
/* 1BCC4 0011BBC4 3000B3FF */  sd         $19, 0x30($sp)
/* 1BCC8 0011BBC8 2D104002 */  daddu      $2, $18, $0
/* 1BCCC 0011BBCC 3F100200 */  dsra32     $2, $2, 0
/* 1BCD0 0011BBD0 FF7F043C */  lui        $4, (0x7FFFFFFF >> 16)
/* 1BCD4 0011BBD4 FFFF8434 */  ori        $4, $4, (0x7FFFFFFF & 0xFFFF)
/* 1BCD8 0011BBD8 3F3E033C */  lui        $3, (0x3E3FFFFF >> 16)
/* 1BCDC 0011BBDC 24104400 */  and        $2, $2, $4
/* 1BCE0 0011BBE0 FFFF6334 */  ori        $3, $3, (0x3E3FFFFF & 0xFFFF)
/* 1BCE4 0011BBE4 2A186200 */  slt        $3, $3, $2
/* 1BCE8 0011BBE8 07006014 */  bnez       $3, .L0011BC08
/* 1BCEC 0011BBEC 1000B1FF */   sd        $17, 0x10($sp)
/* 1BCF0 0011BBF0 2A41040C */  jal        dptoli
/* 1BCF4 0011BBF4 2D204002 */   daddu     $4, $18, $0
/* 1BCF8 0011BBF8 04004014 */  bnez       $2, .L0011BC0C
/* 1BCFC 0011BBFC 2D204002 */   daddu     $4, $18, $0
/* 1BD00 0011BC00 53000010 */  b          .L0011BD50
/* 1BD04 0011BC04 2D104002 */   daddu     $2, $18, $0
.L0011BC08:
/* 1BD08 0011BC08 2D204002 */  daddu      $4, $18, $0
.L0011BC0C:
/* 1BD0C 0011BC0C 9E3F040C */  jal        dpmul
/* 1BD10 0011BC10 2D284002 */   daddu     $5, $18, $0
/* 1BD14 0011BC14 2D884000 */  daddu      $17, $2, $0
/* 1BD18 0011BC18 2D284002 */  daddu      $5, $18, $0
/* 1BD1C 0011BC1C 9E3F040C */  jal        dpmul
/* 1BD20 0011BC20 2D202002 */   daddu     $4, $17, $0
/* 1BD24 0011BC24 2A00013C */  lui        $at, (0x2A0000 >> 16)
/* 1BD28 0011BC28 A08825DC */  ld         $5, -0x7760($at)
/* 1BD2C 0011BC2C 2DA04000 */  daddu      $20, $2, $0
/* 1BD30 0011BC30 9E3F040C */  jal        dpmul
/* 1BD34 0011BC34 2D202002 */   daddu     $4, $17, $0
/* 1BD38 0011BC38 2A00013C */  lui        $at, (0x2A0000 >> 16)
/* 1BD3C 0011BC3C A88825DC */  ld         $5, -0x7758($at)
/* 1BD40 0011BC40 6E3F040C */  jal        dpadd
/* 1BD44 0011BC44 2D204000 */   daddu     $4, $2, $0
/* 1BD48 0011BC48 2D284000 */  daddu      $5, $2, $0
/* 1BD4C 0011BC4C 9E3F040C */  jal        dpmul
/* 1BD50 0011BC50 2D202002 */   daddu     $4, $17, $0
/* 1BD54 0011BC54 2A00013C */  lui        $at, (0x2A0000 >> 16)
/* 1BD58 0011BC58 B08825DC */  ld         $5, -0x7750($at)
/* 1BD5C 0011BC5C 6E3F040C */  jal        dpadd
/* 1BD60 0011BC60 2D204000 */   daddu     $4, $2, $0
/* 1BD64 0011BC64 2D284000 */  daddu      $5, $2, $0
/* 1BD68 0011BC68 9E3F040C */  jal        dpmul
/* 1BD6C 0011BC6C 2D202002 */   daddu     $4, $17, $0
/* 1BD70 0011BC70 2A00013C */  lui        $at, (0x2A0000 >> 16)
/* 1BD74 0011BC74 B88825DC */  ld         $5, -0x7748($at)
/* 1BD78 0011BC78 6E3F040C */  jal        dpadd
/* 1BD7C 0011BC7C 2D204000 */   daddu     $4, $2, $0
/* 1BD80 0011BC80 2D284000 */  daddu      $5, $2, $0
/* 1BD84 0011BC84 9E3F040C */  jal        dpmul
/* 1BD88 0011BC88 2D202002 */   daddu     $4, $17, $0
/* 1BD8C 0011BC8C 2A00013C */  lui        $at, (0x2A0000 >> 16)
/* 1BD90 0011BC90 C08825DC */  ld         $5, -0x7740($at)
/* 1BD94 0011BC94 6E3F040C */  jal        dpadd
/* 1BD98 0011BC98 2D204000 */   daddu     $4, $2, $0
/* 1BD9C 0011BC9C 10000016 */  bnez       $16, .L0011BCE0
/* 1BDA0 0011BCA0 2D984000 */   daddu     $19, $2, $0
/* 1BDA4 0011BCA4 2D202002 */  daddu      $4, $17, $0
/* 1BDA8 0011BCA8 9E3F040C */  jal        dpmul
/* 1BDAC 0011BCAC 2D286002 */   daddu     $5, $19, $0
/* 1BDB0 0011BCB0 2A00013C */  lui        $at, (0x2A0000 >> 16)
/* 1BDB4 0011BCB4 C88825DC */  ld         $5, -0x7738($at)
/* 1BDB8 0011BCB8 6E3F040C */  jal        dpadd
/* 1BDBC 0011BCBC 2D204000 */   daddu     $4, $2, $0
/* 1BDC0 0011BCC0 2D208002 */  daddu      $4, $20, $0
/* 1BDC4 0011BCC4 9E3F040C */  jal        dpmul
/* 1BDC8 0011BCC8 2D284000 */   daddu     $5, $2, $0
/* 1BDCC 0011BCCC 2D204002 */  daddu      $4, $18, $0
/* 1BDD0 0011BCD0 6E3F040C */  jal        dpadd
/* 1BDD4 0011BCD4 2D284000 */   daddu     $5, $2, $0
/* 1BDD8 0011BCD8 1E000010 */  b          .L0011BD54
/* 1BDDC 0011BCDC 6000BFDF */   ld        $31, 0x60($sp)
.L0011BCE0:
/* 1BDE0 0011BCE0 80FF0534 */  ori        $5, $0, 0xFF80
/* 1BDE4 0011BCE4 BC2B0500 */  dsll32     $5, $5, 14
/* 1BDE8 0011BCE8 9E3F040C */  jal        dpmul
/* 1BDEC 0011BCEC 2D20A002 */   daddu     $4, $21, $0
/* 1BDF0 0011BCF0 2D804000 */  daddu      $16, $2, $0
/* 1BDF4 0011BCF4 2D286002 */  daddu      $5, $19, $0
/* 1BDF8 0011BCF8 9E3F040C */  jal        dpmul
/* 1BDFC 0011BCFC 2D208002 */   daddu     $4, $20, $0
/* 1BE00 0011BD00 2D200002 */  daddu      $4, $16, $0
/* 1BE04 0011BD04 843F040C */  jal        dpsub
/* 1BE08 0011BD08 2D284000 */   daddu     $5, $2, $0
/* 1BE0C 0011BD0C 2D202002 */  daddu      $4, $17, $0
/* 1BE10 0011BD10 9E3F040C */  jal        dpmul
/* 1BE14 0011BD14 2D284000 */   daddu     $5, $2, $0
/* 1BE18 0011BD18 2D204000 */  daddu      $4, $2, $0
/* 1BE1C 0011BD1C 843F040C */  jal        dpsub
/* 1BE20 0011BD20 2D28A002 */   daddu     $5, $21, $0
/* 1BE24 0011BD24 2A00013C */  lui        $at, (0x2A0000 >> 16)
/* 1BE28 0011BD28 D08825DC */  ld         $5, -0x7730($at)
/* 1BE2C 0011BD2C 2D804000 */  daddu      $16, $2, $0
/* 1BE30 0011BD30 9E3F040C */  jal        dpmul
/* 1BE34 0011BD34 2D208002 */   daddu     $4, $20, $0
/* 1BE38 0011BD38 2D200002 */  daddu      $4, $16, $0
/* 1BE3C 0011BD3C 843F040C */  jal        dpsub
/* 1BE40 0011BD40 2D284000 */   daddu     $5, $2, $0
/* 1BE44 0011BD44 2D204002 */  daddu      $4, $18, $0
/* 1BE48 0011BD48 843F040C */  jal        dpsub
/* 1BE4C 0011BD4C 2D284000 */   daddu     $5, $2, $0
.L0011BD50:
/* 1BE50 0011BD50 6000BFDF */  ld         $31, 0x60($sp)
.L0011BD54:
/* 1BE54 0011BD54 5000B5DF */  ld         $21, 0x50($sp)
/* 1BE58 0011BD58 4000B4DF */  ld         $20, 0x40($sp)
/* 1BE5C 0011BD5C 3000B3DF */  ld         $19, 0x30($sp)
/* 1BE60 0011BD60 2000B2DF */  ld         $18, 0x20($sp)
/* 1BE64 0011BD64 1000B1DF */  ld         $17, 0x10($sp)
/* 1BE68 0011BD68 0000B0DF */  ld         $16, 0x0($sp)
/* 1BE6C 0011BD6C 0800E003 */  jr         $31
/* 1BE70 0011BD70 7000BD27 */   addiu     $sp, $sp, 0x70
/* 1BE74 0011BD74 00000000 */  nop
