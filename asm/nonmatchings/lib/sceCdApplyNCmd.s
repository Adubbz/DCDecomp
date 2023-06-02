.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceCdApplyNCmd
/* BCC8 0010BBC8 50FFBD27 */  addiu      $sp, $sp, -0xB0
/* BCCC 0010BBCC 2500023C */  lui        $2, (0x250280 >> 16)
/* BCD0 0010BBD0 9000BEFF */  sd         $fp, 0x90($sp)
/* BCD4 0010BBD4 FF009E30 */  andi       $fp, $4, 0xFF
/* BCD8 0010BBD8 8000B7FF */  sd         $23, 0x80($sp)
/* BCDC 0010BBDC 6000B5FF */  sd         $21, 0x60($sp)
/* BCE0 0010BBE0 2DB8A000 */  daddu      $23, $5, $0
/* BCE4 0010BBE4 8002448C */  lw         $4, (0x250280 & 0xFFFF)($2)
/* BCE8 0010BBE8 2DA8C000 */  daddu      $21, $6, $0
/* BCEC 0010BBEC 3000B2FF */  sd         $18, 0x30($sp)
/* BCF0 0010BBF0 A000BFFF */  sd         $31, 0xA0($sp)
/* BCF4 0010BBF4 2500123C */  lui        $18, (0x250270 >> 16)
/* BCF8 0010BBF8 7000B6FF */  sd         $22, 0x70($sp)
/* BCFC 0010BBFC 5000B4FF */  sd         $20, 0x50($sp)
/* BD00 0010BC00 4000B3FF */  sd         $19, 0x40($sp)
/* BD04 0010BC04 2000B1FF */  sd         $17, 0x20($sp)
/* BD08 0010BC08 D850040C */  jal        WaitSema
/* BD0C 0010BC0C 1000B0FF */   sd        $16, 0x10($sp)
/* BD10 0010BC10 2500033C */  lui        $3, (0x250278 >> 16)
/* BD14 0010BC14 0E000224 */  addiu      $2, $0, 0xE
/* BD18 0010BC18 780262AC */  sw         $2, (0x250278 & 0xFFFF)($3)
/* BD1C 0010BC1C 662B040C */  jal        sceCdSync
/* BD20 0010BC20 2D200000 */   daddu     $4, $0, $0
/* BD24 0010BC24 7002438E */  lw         $3, (0x250270 & 0xFFFF)($18)
/* BD28 0010BC28 03006018 */  blez       $3, .L0010BC38
/* BD2C 0010BC2C 2900043C */   lui       $4, %hi(D_00297258)
/* BD30 0010BC30 A611040C */  jal        printf
/* BD34 0010BC34 58728424 */   addiu     $4, $4, %lo(D_00297258)
.L0010BC38:
/* BD38 0010BC38 2D200000 */  daddu      $4, $0, $0
/* BD3C 0010BC3C 125B040C */  jal        sceSifInitRpc
/* BD40 0010BC40 2500113C */   lui       $17, (0x25029C >> 16)
/* BD44 0010BC44 9C02228E */  lw         $2, (0x25029C & 0xFFFF)($17)
/* BD48 0010BC48 2C004104 */  bgez       $2, .L0010BCFC
/* BD4C 0010BC4C 2A00143C */   lui       $20, %hi(D_002A3C00)
/* BD50 0010BC50 2A00133C */  lui        $19, (0x2A4E90 >> 16)
/* BD54 0010BC54 0B000010 */  b          .L0010BC84
/* BD58 0010BC58 2A00163C */   lui       $22, (0x2A0000 >> 16)
/* BD5C 0010BC5C 00000000 */  nop
.L0010BC60:
/* BD60 0010BC60 FFFF0324 */  addiu      $3, $0, -0x1
/* BD64 0010BC64 00000000 */  nop
.L0010BC68:
/* BD68 0010BC68 FFFF4224 */  addiu      $2, $2, %lo(D_FFFFF)
/* BD6C 0010BC6C 00000000 */  nop
/* BD70 0010BC70 00000000 */  nop
/* BD74 0010BC74 00000000 */  nop
/* BD78 0010BC78 00000000 */  nop
/* BD7C 0010BC7C FAFF4314 */  bne        $2, $3, .L0010BC68
/* BD80 0010BC80 00000000 */   nop
.L0010BC84:
/* BD84 0010BC84 003C9026 */  addiu      $16, $20, %lo(D_002A3C00)
.L0010BC88:
/* BD88 0010BC88 0080053C */  lui        $5, (0x80000595 >> 16)
/* BD8C 0010BC8C 2D200002 */  daddu      $4, $16, $0
/* BD90 0010BC90 9505A534 */  ori        $5, $5, (0x80000595 & 0xFFFF)
/* BD94 0010BC94 B65C040C */  jal        sceSifBindRpc
/* BD98 0010BC98 2D300000 */   daddu     $6, $0, $0
/* BD9C 0010BC9C 13004304 */  bgezl      $2, .L0010BCEC
/* BDA0 0010BCA0 2400028E */   lw        $2, 0x24($16)
/* BDA4 0010BCA4 7002428E */  lw         $2, (0x250270 & 0xFFFF)($18)
/* BDA8 0010BCA8 05004018 */  blez       $2, .L0010BCC0
/* BDAC 0010BCAC 1000023C */   lui       $2, %hi(D_FFFFF)
/* BDB0 0010BCB0 2900043C */  lui        $4, %hi(D_00297268)
/* BDB4 0010BCB4 A611040C */  jal        printf
/* BDB8 0010BCB8 68728424 */   addiu     $4, $4, %lo(D_00297268)
/* BDBC 0010BCBC 1000023C */  lui        $2, %hi(D_FFFFF)
.L0010BCC0:
/* BDC0 0010BCC0 FFFF0324 */  addiu      $3, $0, -0x1
/* BDC4 0010BCC4 00000000 */  nop
.L0010BCC8:
/* BDC8 0010BCC8 FFFF4224 */  addiu      $2, $2, %lo(D_FFFFF)
/* BDCC 0010BCCC 00000000 */  nop
/* BDD0 0010BCD0 00000000 */  nop
/* BDD4 0010BCD4 00000000 */  nop
/* BDD8 0010BCD8 00000000 */  nop
/* BDDC 0010BCDC FAFF4314 */  bne        $2, $3, .L0010BCC8
/* BDE0 0010BCE0 00000000 */   nop
/* BDE4 0010BCE4 E8FF0010 */  b          .L0010BC88
/* BDE8 0010BCE8 003C9026 */   addiu     $16, $20, %lo(D_002A3C00)
.L0010BCEC:
/* BDEC 0010BCEC DCFF4010 */  beqz       $2, .L0010BC60
/* BDF0 0010BCF0 1000023C */   lui       $2, %hi(D_FFFFF)
/* BDF4 0010BCF4 03000010 */  b          .L0010BD04
/* BDF8 0010BCF8 9C0220AE */   sw        $0, (0x25029C & 0xFFFF)($17)
.L0010BCFC:
/* BDFC 0010BCFC 2A00133C */  lui        $19, (0x2A4E90 >> 16)
/* BE00 0010BD00 2A00163C */  lui        $22, %hi(D_002A3980)
.L0010BD04:
/* BE04 0010BD04 904E7026 */  addiu      $16, $19, %lo(D_002A4E90)
/* BE08 0010BD08 904E7EA6 */  sh         $fp, (0x2A4E90 & 0xFFFF)($19)
/* BE0C 0010BD0C 2D28E002 */  daddu      $5, $23, $0
/* BE10 0010BD10 2D30A002 */  daddu      $6, $21, $0
/* BE14 0010BD14 020015A6 */  sh         $21, 0x2($16)
/* BE18 0010BD18 EC0C040C */  jal        memcpy
/* BE1C 0010BD1C 04000426 */   addiu     $4, $16, 0x4
/* BE20 0010BD20 7002438E */  lw         $3, (0x250270 & 0xFFFF)($18)
/* BE24 0010BD24 03006018 */  blez       $3, .L0010BD34
/* BE28 0010BD28 2900043C */   lui       $4, %hi(D_00297280)
/* BE2C 0010BD2C A611040C */  jal        printf
/* BE30 0010BD30 80728424 */   addiu     $4, $4, %lo(D_00297280)
.L0010BD34:
/* BE34 0010BD34 2D200002 */  daddu      $4, $16, $0
/* BE38 0010BD38 E65A040C */  jal        sceSifWriteBackDCache
/* BE3C 0010BD3C 84000524 */   addiu     $5, $0, 0x84
/* BE40 0010BD40 0000A0AF */  sw         $0, 0x0($sp)
/* BE44 0010BD44 00000000 */  nop
.L0010BD48:
/* BE48 0010BD48 003C8426 */  addiu      $4, $20, %lo(D_002A3C00)
/* BE4C 0010BD4C 0C000524 */  addiu      $5, $0, 0xC
/* BE50 0010BD50 2D300000 */  daddu      $6, $0, $0
/* BE54 0010BD54 904E6726 */  addiu      $7, $19, %lo(D_002A4E90)
/* BE58 0010BD58 84000824 */  addiu      $8, $0, 0x84
/* BE5C 0010BD5C 8039C926 */  addiu      $9, $22, %lo(D_002A3980)
/* BE60 0010BD60 04000A24 */  addiu      $10, $0, 0x4
/* BE64 0010BD64 2A5D040C */  jal        sceSifCallRpc
/* BE68 0010BD68 2D580000 */   daddu     $11, $0, $0
/* BE6C 0010BD6C F6FF4204 */  bltzl      $2, .L0010BD48
/* BE70 0010BD70 0000A0AF */   sw        $0, 0x0($sp)
/* BE74 0010BD74 7002428E */  lw         $2, (0x250270 & 0xFFFF)($18)
/* BE78 0010BD78 03004018 */  blez       $2, .L0010BD88
/* BE7C 0010BD7C 2900043C */   lui       $4, %hi(D_00297290)
/* BE80 0010BD80 A611040C */  jal        printf
/* BE84 0010BD84 90728424 */   addiu     $4, $4, %lo(D_00297290)
.L0010BD88:
/* BE88 0010BD88 2500023C */  lui        $2, (0x250280 >> 16)
/* BE8C 0010BD8C D050040C */  jal        SignalSema
/* BE90 0010BD90 8002448C */   lw        $4, (0x250280 & 0xFFFF)($2)
/* BE94 0010BD94 A000BFDF */  ld         $31, 0xA0($sp)
/* BE98 0010BD98 01000224 */  addiu      $2, $0, 0x1
/* BE9C 0010BD9C 9000BEDF */  ld         $fp, 0x90($sp)
/* BEA0 0010BDA0 8000B7DF */  ld         $23, 0x80($sp)
/* BEA4 0010BDA4 7000B6DF */  ld         $22, 0x70($sp)
/* BEA8 0010BDA8 6000B5DF */  ld         $21, 0x60($sp)
/* BEAC 0010BDAC 5000B4DF */  ld         $20, 0x50($sp)
/* BEB0 0010BDB0 4000B3DF */  ld         $19, 0x40($sp)
/* BEB4 0010BDB4 3000B2DF */  ld         $18, 0x30($sp)
/* BEB8 0010BDB8 2000B1DF */  ld         $17, 0x20($sp)
/* BEBC 0010BDBC 1000B0DF */  ld         $16, 0x10($sp)
/* BEC0 0010BDC0 0800E003 */  jr         $31
/* BEC4 0010BDC4 B000BD27 */   addiu     $sp, $sp, 0xB0
