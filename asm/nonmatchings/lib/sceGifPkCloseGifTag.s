.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceGifPkCloseGifTag
/* 20A80 00120980 2D508000 */  daddu      $10, $4, $0
/* 20A84 00120984 00C00734 */  ori        $7, $0, 0xC000
/* 20A88 00120988 3C3B0700 */  dsll32     $7, $7, 12
/* 20A8C 0012098C 0C00488D */  lw         $8, 0xC($10)
/* 20A90 00120990 10000524 */  addiu      $5, $0, 0x10
/* 20A94 00120994 0000428D */  lw         $2, 0x0($10)
/* 20A98 00120998 000006DD */  ld         $6, 0x0($8)
/* 20A9C 0012099C 23184800 */  subu       $3, $2, $8
/* 20AA0 001209A0 2D484000 */  daddu      $9, $2, $0
/* 20AA4 001209A4 C3180300 */  sra        $3, $3, 3
/* 20AA8 001209A8 2438C700 */  and        $7, $6, $7
/* 20AAC 001209AC FEFF6324 */  addiu      $3, $3, -0x2
/* 20AB0 001209B0 3E270600 */  dsrl32     $4, $6, 28
/* 20AB4 001209B4 42100300 */  srl        $2, $3, 1
/* 20AB8 001209B8 0B288400 */  movn       $5, $4, $4
/* 20ABC 001209BC 0B106700 */  movn       $2, $3, $7
/* 20AC0 001209C0 0100A050 */  beql       $5, $0, .L001209C8
/* 20AC4 001209C4 CD010000 */   break     0, 7
.L001209C8:
/* 20AC8 001209C8 21104500 */  addu       $2, $2, $5
/* 20ACC 001209CC 0C0040AD */  sw         $0, 0xC($10)
/* 20AD0 001209D0 FFFF4224 */  addiu      $2, $2, -0x1
/* 20AD4 001209D4 0C002331 */  andi       $3, $9, 0xC
/* 20AD8 001209D8 1B004500 */  divu       $0, $2, $5
/* 20ADC 001209DC 12100000 */  mflo       $2
/* 20AE0 001209E0 3C100200 */  dsll32     $2, $2, 0
/* 20AE4 001209E4 3E100200 */  dsrl32     $2, $2, 0
/* 20AE8 001209E8 2D30C200 */  daddu      $6, $6, $2
/* 20AEC 001209EC 09006010 */  beqz       $3, .L00120A14
/* 20AF0 001209F0 000006FD */   sd        $6, 0x0($8)
/* 20AF4 001209F4 00000000 */  nop
.L001209F8:
/* 20AF8 001209F8 000020AD */  sw         $0, 0x0($9)
/* 20AFC 001209FC 04002925 */  addiu      $9, $9, 0x4
/* 20B00 00120A00 0C002231 */  andi       $2, $9, 0xC
/* 20B04 00120A04 00000000 */  nop
/* 20B08 00120A08 00000000 */  nop
/* 20B0C 00120A0C FAFF4014 */  bnez       $2, .L001209F8
/* 20B10 00120A10 00000000 */   nop
.L00120A14:
/* 20B14 00120A14 0800E003 */  jr         $31
/* 20B18 00120A18 000049AD */   sw        $9, 0x0($10)
/* 20B1C 00120A1C 00000000 */  nop
