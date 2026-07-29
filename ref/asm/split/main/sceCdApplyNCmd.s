.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceCdApplyNCmd
/* 00BCC8 0010BBC8 50FFBD27 */  addiu       $29, $29, -0xB0
/* 00BCCC 0010BBCC 2500023C */  lui         $2, %hi(ncmd_semid)
/* 00BCD0 0010BBD0 9000BEFF */  sd          $30, 0x90($29)
/* 00BCD4 0010BBD4 FF009E30 */  andi        $30, $4, 0xFF
/* 00BCD8 0010BBD8 8000B7FF */  sd          $23, 0x80($29)
/* 00BCDC 0010BBDC 6000B5FF */  sd          $21, 0x60($29)
/* 00BCE0 0010BBE0 2DB8A000 */  daddu       $23, $5, $0
/* 00BCE4 0010BBE4 8002448C */  lw          $4, %lo(ncmd_semid)($2)
/* 00BCE8 0010BBE8 2DA8C000 */  daddu       $21, $6, $0
/* 00BCEC 0010BBEC 3000B2FF */  sd          $18, 0x30($29)
/* 00BCF0 0010BBF0 A000BFFF */  sd          $31, 0xA0($29)
/* 00BCF4 0010BBF4 2500123C */  lui         $18, %hi(CD_debug)
/* 00BCF8 0010BBF8 7000B6FF */  sd          $22, 0x70($29)
/* 00BCFC 0010BBFC 5000B4FF */  sd          $20, 0x50($29)
/* 00BD00 0010BC00 4000B3FF */  sd          $19, 0x40($29)
/* 00BD04 0010BC04 2000B1FF */  sd          $17, 0x20($29)
/* 00BD08 0010BC08 D850040C */  jal         WaitSema
/* 00BD0C 0010BC0C 1000B0FF */   sd         $16, 0x10($29)
/* 00BD10 0010BC10 2500033C */  lui         $3, %hi(ncmd_sema_keep_cmd)
/* 00BD14 0010BC14 0E000224 */  addiu       $2, $0, 0xE
/* 00BD18 0010BC18 780262AC */  sw          $2, %lo(ncmd_sema_keep_cmd)($3)
/* 00BD1C 0010BC1C 662B040C */  jal         sceCdSync
/* 00BD20 0010BC20 2D200000 */   daddu      $4, $0, $0
/* 00BD24 0010BC24 7002438E */  lw          $3, %lo(CD_debug)($18)
/* 00BD28 0010BC28 03006018 */  blez        $3, .L0010BC38
/* 00BD2C 0010BC2C 2900043C */   lui        $4, %hi(RO_00297258)
/* 00BD30 0010BC30 A611040C */  jal         printf
/* 00BD34 0010BC34 58728424 */   addiu      $4, $4, %lo(RO_00297258)
.L0010BC38:
/* 00BD38 0010BC38 2D200000 */  daddu       $4, $0, $0
/* 00BD3C 0010BC3C 125B040C */  jal         sceSifInitRpc
/* 00BD40 0010BC40 2500113C */   lui        $17, %hi(_rd_bind)
/* 00BD44 0010BC44 9C02228E */  lw          $2, %lo(_rd_bind)($17)
/* 00BD48 0010BC48 2C004104 */  bgez        $2, .L0010BCFC
/* 00BD4C 0010BC4C 2A00143C */   lui        $20, %hi(cdrd)
/* 00BD50 0010BC50 2A00133C */  lui         $19, %hi(_acn_data)
/* 00BD54 0010BC54 0B000010 */  b           .L0010BC84
/* 00BD58 0010BC58 2A00163C */   lui        $22, %hi(ncmdrdata)
/* 00BD5C 0010BC5C 00000000 */  nop
.L0010BC60:
/* 00BD60 0010BC60 FFFF0324 */  addiu       $3, $0, -0x1
/* 00BD64 0010BC64 00000000 */  nop
.L0010BC68:
/* 00BD68 0010BC68 FFFF4224 */  addiu       $2, $2, -0x1
/* 00BD6C 0010BC6C 00000000 */  nop
/* 00BD70 0010BC70 00000000 */  nop
/* 00BD74 0010BC74 00000000 */  nop
/* 00BD78 0010BC78 00000000 */  nop
/* 00BD7C 0010BC7C FAFF4314 */  bne         $2, $3, .L0010BC68
/* 00BD80 0010BC80 00000000 */   nop
.L0010BC84:
/* 00BD84 0010BC84 003C9026 */  addiu       $16, $20, %lo(cdrd)
.L0010BC88:
/* 00BD88 0010BC88 0080053C */  lui         $5, (0x80000595 >> 16)
/* 00BD8C 0010BC8C 2D200002 */  daddu       $4, $16, $0
/* 00BD90 0010BC90 9505A534 */  ori         $5, $5, (0x80000595 & 0xFFFF)
/* 00BD94 0010BC94 B65C040C */  jal         sceSifBindRpc
/* 00BD98 0010BC98 2D300000 */   daddu      $6, $0, $0
/* 00BD9C 0010BC9C 13004304 */  bgezl       $2, .L0010BCEC
/* 00BDA0 0010BCA0 2400028E */   lw         $2, 0x24($16)
/* 00BDA4 0010BCA4 7002428E */  lw          $2, %lo(CD_debug)($18)
/* 00BDA8 0010BCA8 05004018 */  blez        $2, .L0010BCC0
/* 00BDAC 0010BCAC 1000023C */   lui        $2, 0x10
/* 00BDB0 0010BCB0 2900043C */  lui         $4, %hi(RO_00297268)
/* 00BDB4 0010BCB4 A611040C */  jal         printf
/* 00BDB8 0010BCB8 68728424 */   addiu      $4, $4, %lo(RO_00297268)
/* 00BDBC 0010BCBC 1000023C */  lui         $2, (0x100000 >> 16)
.L0010BCC0:
/* 00BDC0 0010BCC0 FFFF0324 */  addiu       $3, $0, -0x1
/* 00BDC4 0010BCC4 00000000 */  nop
.L0010BCC8:
/* 00BDC8 0010BCC8 FFFF4224 */  addiu       $2, $2, -0x1
/* 00BDCC 0010BCCC 00000000 */  nop
/* 00BDD0 0010BCD0 00000000 */  nop
/* 00BDD4 0010BCD4 00000000 */  nop
/* 00BDD8 0010BCD8 00000000 */  nop
/* 00BDDC 0010BCDC FAFF4314 */  bne         $2, $3, .L0010BCC8
/* 00BDE0 0010BCE0 00000000 */   nop
/* 00BDE4 0010BCE4 E8FF0010 */  b           .L0010BC88
/* 00BDE8 0010BCE8 003C9026 */   addiu      $16, $20, %lo(cdrd)
.L0010BCEC:
/* 00BDEC 0010BCEC DCFF4010 */  beqz        $2, .L0010BC60
/* 00BDF0 0010BCF0 1000023C */   lui        $2, 0x10
/* 00BDF4 0010BCF4 03000010 */  b           .L0010BD04
/* 00BDF8 0010BCF8 9C0220AE */   sw         $0, %lo(_rd_bind)($17)
.L0010BCFC:
/* 00BDFC 0010BCFC 2A00133C */  lui         $19, %hi(_acn_data)
/* 00BE00 0010BD00 2A00163C */  lui         $22, %hi(ncmdrdata)
.L0010BD04:
/* 00BE04 0010BD04 904E7026 */  addiu       $16, $19, %lo(_acn_data)
/* 00BE08 0010BD08 904E7EA6 */  sh          $30, %lo(_acn_data)($19)
/* 00BE0C 0010BD0C 2D28E002 */  daddu       $5, $23, $0
/* 00BE10 0010BD10 2D30A002 */  daddu       $6, $21, $0
/* 00BE14 0010BD14 020015A6 */  sh          $21, 0x2($16)
/* 00BE18 0010BD18 EC0C040C */  jal         memcpy
/* 00BE1C 0010BD1C 04000426 */   addiu      $4, $16, 0x4
/* 00BE20 0010BD20 7002438E */  lw          $3, %lo(CD_debug)($18)
/* 00BE24 0010BD24 03006018 */  blez        $3, .L0010BD34
/* 00BE28 0010BD28 2900043C */   lui        $4, %hi(RO_00297280)
/* 00BE2C 0010BD2C A611040C */  jal         printf
/* 00BE30 0010BD30 80728424 */   addiu      $4, $4, %lo(RO_00297280)
.L0010BD34:
/* 00BE34 0010BD34 2D200002 */  daddu       $4, $16, $0
/* 00BE38 0010BD38 E65A040C */  jal         sceSifWriteBackDCache
/* 00BE3C 0010BD3C 84000524 */   addiu      $5, $0, 0x84
/* 00BE40 0010BD40 0000A0AF */  sw          $0, 0x0($29)
/* 00BE44 0010BD44 00000000 */  nop
.L0010BD48:
/* 00BE48 0010BD48 003C8426 */  addiu       $4, $20, %lo(cdrd)
/* 00BE4C 0010BD4C 0C000524 */  addiu       $5, $0, 0xC
/* 00BE50 0010BD50 2D300000 */  daddu       $6, $0, $0
/* 00BE54 0010BD54 904E6726 */  addiu       $7, $19, %lo(_acn_data)
/* 00BE58 0010BD58 84000824 */  addiu       $8, $0, 0x84
/* 00BE5C 0010BD5C 8039C926 */  addiu       $9, $22, %lo(ncmdrdata)
/* 00BE60 0010BD60 04000A24 */  addiu       $10, $0, 0x4
/* 00BE64 0010BD64 2A5D040C */  jal         sceSifCallRpc
/* 00BE68 0010BD68 2D580000 */   daddu      $11, $0, $0
/* 00BE6C 0010BD6C F6FF4204 */  bltzl       $2, .L0010BD48
/* 00BE70 0010BD70 0000A0AF */   sw         $0, 0x0($29)
/* 00BE74 0010BD74 7002428E */  lw          $2, %lo(CD_debug)($18)
/* 00BE78 0010BD78 03004018 */  blez        $2, .L0010BD88
/* 00BE7C 0010BD7C 2900043C */   lui        $4, %hi(RO_00297290)
/* 00BE80 0010BD80 A611040C */  jal         printf
/* 00BE84 0010BD84 90728424 */   addiu      $4, $4, %lo(RO_00297290)
.L0010BD88:
/* 00BE88 0010BD88 2500023C */  lui         $2, %hi(ncmd_semid)
/* 00BE8C 0010BD8C D050040C */  jal         SignalSema
/* 00BE90 0010BD90 8002448C */   lw         $4, %lo(ncmd_semid)($2)
/* 00BE94 0010BD94 A000BFDF */  ld          $31, 0xA0($29)
/* 00BE98 0010BD98 01000224 */  addiu       $2, $0, 0x1
/* 00BE9C 0010BD9C 9000BEDF */  ld          $30, 0x90($29)
/* 00BEA0 0010BDA0 8000B7DF */  ld          $23, 0x80($29)
/* 00BEA4 0010BDA4 7000B6DF */  ld          $22, 0x70($29)
/* 00BEA8 0010BDA8 6000B5DF */  ld          $21, 0x60($29)
/* 00BEAC 0010BDAC 5000B4DF */  ld          $20, 0x50($29)
/* 00BEB0 0010BDB0 4000B3DF */  ld          $19, 0x40($29)
/* 00BEB4 0010BDB4 3000B2DF */  ld          $18, 0x30($29)
/* 00BEB8 0010BDB8 2000B1DF */  ld          $17, 0x20($29)
/* 00BEBC 0010BDBC 1000B0DF */  ld          $16, 0x10($29)
/* 00BEC0 0010BDC0 0800E003 */  jr          $31
/* 00BEC4 0010BDC4 B000BD27 */   addiu      $29, $29, 0xB0
