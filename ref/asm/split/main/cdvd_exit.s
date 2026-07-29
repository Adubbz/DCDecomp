.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel cdvd_exit
/* 009AD0 001099D0 2500023C */  lui         $2, %hi(cb_thid)
/* 009AD4 001099D4 E0FFBD27 */  addiu       $29, $29, -0x20
/* 009AD8 001099D8 7C02438C */  lw          $3, %lo(cb_thid)($2)
/* 009ADC 001099DC 1000BFFF */  sd          $31, 0x10($29)
/* 009AE0 001099E0 09006010 */  beqz        $3, .L00109A08
/* 009AE4 001099E4 0000B0FF */   sd         $16, 0x0($29)
/* 009AE8 001099E8 2500033C */  lui         $3, %hi(sceCdCbfunc_num)
/* 009AEC 001099EC FFFF0224 */  addiu       $2, $0, -0x1
/* 009AF0 001099F0 C00262AC */  sw          $2, %lo(sceCdCbfunc_num)($3)
/* 009AF4 001099F4 2500103C */  lui         $16, %hi(cb_semid)
/* 009AF8 001099F8 D050040C */  jal         SignalSema
/* 009AFC 001099FC 8802048E */   lw         $4, %lo(cb_semid)($16)
/* 009B00 00109A00 03000010 */  b           .L00109A10
/* 009B04 00109A04 2500023C */   lui        $2, %hi(ncmd_semid)
.L00109A08:
/* 009B08 00109A08 2500103C */  lui         $16, %hi(cb_semid)
/* 009B0C 00109A0C 2500023C */  lui         $2, %hi(ncmd_semid)
.L00109A10:
/* 009B10 00109A10 CC50040C */  jal         DeleteSema
/* 009B14 00109A14 8002448C */   lw         $4, %lo(ncmd_semid)($2)
/* 009B18 00109A18 2500033C */  lui         $3, %hi(scmd_semid)
/* 009B1C 00109A1C CC50040C */  jal         DeleteSema
/* 009B20 00109A20 8402648C */   lw         $4, %lo(scmd_semid)($3)
/* 009B24 00109A24 8802048E */  lw          $4, %lo(cb_semid)($16)
/* 009B28 00109A28 1000BFDF */  ld          $31, 0x10($29)
/* 009B2C 00109A2C 0000B0DF */  ld          $16, 0x0($29)
/* 009B30 00109A30 CC500408 */  j           DeleteSema
/* 009B34 00109A34 2000BD27 */   addiu      $29, $29, 0x20
