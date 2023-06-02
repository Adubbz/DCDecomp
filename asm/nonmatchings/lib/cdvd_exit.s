.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel cdvd_exit
/* 9AD0 001099D0 2500023C */  lui        $2, (0x25027C >> 16)
/* 9AD4 001099D4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 9AD8 001099D8 7C02438C */  lw         $3, (0x25027C & 0xFFFF)($2)
/* 9ADC 001099DC 1000BFFF */  sd         $31, 0x10($sp)
/* 9AE0 001099E0 09006010 */  beqz       $3, .L00109A08
/* 9AE4 001099E4 0000B0FF */   sd        $16, 0x0($sp)
/* 9AE8 001099E8 2500033C */  lui        $3, (0x2502C0 >> 16)
/* 9AEC 001099EC FFFF0224 */  addiu      $2, $0, -0x1
/* 9AF0 001099F0 C00262AC */  sw         $2, (0x2502C0 & 0xFFFF)($3)
/* 9AF4 001099F4 2500103C */  lui        $16, (0x250288 >> 16)
/* 9AF8 001099F8 D050040C */  jal        SignalSema
/* 9AFC 001099FC 8802048E */   lw        $4, (0x250288 & 0xFFFF)($16)
/* 9B00 00109A00 03000010 */  b          .L00109A10
/* 9B04 00109A04 2500023C */   lui       $2, (0x250280 >> 16)
.L00109A08:
/* 9B08 00109A08 2500103C */  lui        $16, (0x250288 >> 16)
/* 9B0C 00109A0C 2500023C */  lui        $2, (0x250280 >> 16)
.L00109A10:
/* 9B10 00109A10 CC50040C */  jal        DeleteSema
/* 9B14 00109A14 8002448C */   lw        $4, (0x250280 & 0xFFFF)($2)
/* 9B18 00109A18 2500033C */  lui        $3, (0x250284 >> 16)
/* 9B1C 00109A1C CC50040C */  jal        DeleteSema
/* 9B20 00109A20 8402648C */   lw        $4, (0x250284 & 0xFFFF)($3)
/* 9B24 00109A24 8802048E */  lw         $4, (0x250288 & 0xFFFF)($16)
/* 9B28 00109A28 1000BFDF */  ld         $31, 0x10($sp)
/* 9B2C 00109A2C 0000B0DF */  ld         $16, 0x0($sp)
/* 9B30 00109A30 CC500408 */  j          DeleteSema
/* 9B34 00109A34 2000BD27 */   addiu     $sp, $sp, 0x20
