.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceCdStream
/* C310 0010C210 70FFBD27 */  addiu      $sp, $sp, -0x90
/* C314 0010C214 3000B2FF */  sd         $18, 0x30($sp)
/* C318 0010C218 6000B5FF */  sd         $21, 0x60($sp)
/* C31C 0010C21C 2D908000 */  daddu      $18, $4, $0
/* C320 0010C220 5000B4FF */  sd         $20, 0x50($sp)
/* C324 0010C224 2DA8E000 */  daddu      $21, $7, $0
/* C328 0010C228 4000B3FF */  sd         $19, 0x40($sp)
/* C32C 0010C22C 2DA0C000 */  daddu      $20, $6, $0
/* C330 0010C230 2000B1FF */  sd         $17, 0x20($sp)
/* C334 0010C234 2D98A000 */  daddu      $19, $5, $0
/* C338 0010C238 8000BFFF */  sd         $31, 0x80($sp)
/* C33C 0010C23C 2D880001 */  daddu      $17, $8, $0
/* C340 0010C240 7000B6FF */  sd         $22, 0x70($sp)
/* C344 0010C244 0F000424 */  addiu      $4, $0, 0xF
/* C348 0010C248 E627040C */  jal        ncmd_prechk
/* C34C 0010C24C 1000B0FF */   sd        $16, 0x10($sp)
/* C350 0010C250 03004014 */  bnez       $2, .L0010C260
/* C354 0010C254 2500163C */   lui       $22, (0x250270 >> 16)
/* C358 0010C258 3B000010 */  b          .L0010C348
/* C35C 0010C25C 2D100000 */   daddu     $2, $0, $0
.L0010C260:
/* C360 0010C260 7002C48E */  lw         $4, (0x250270 & 0xFFFF)($22)
/* C364 0010C264 06008018 */  blez       $4, .L0010C280
/* C368 0010C268 2A00023C */   lui       $2, (0x2A4F30 >> 16)
/* C36C 0010C26C 2900043C */  lui        $4, %hi(D_00297380)
/* C370 0010C270 A611040C */  jal        printf
/* C374 0010C274 80738424 */   addiu     $4, $4, %lo(D_00297380)
/* C378 0010C278 7002C48E */  lw         $4, (0x250270 & 0xFFFF)($22)
/* C37C 0010C27C 2A00023C */  lui        $2, (0x2A4F30 >> 16)
.L0010C280:
/* C380 0010C280 304F5024 */  addiu      $16, $2, %lo(D_002A4F30)
/* C384 0010C284 304F52AC */  sw         $18, (0x2A4F30 & 0xFFFF)($2)
/* C388 0010C288 040013AE */  sw         $19, 0x4($16)
/* C38C 0010C28C 080014AE */  sw         $20, 0x8($16)
/* C390 0010C290 07002012 */  beqz       $17, .L0010C2B0
/* C394 0010C294 0C0015AE */   sw        $21, 0xC($16)
/* C398 0010C298 00002292 */  lbu        $2, 0x0($17)
/* C39C 0010C29C 100002A2 */  sb         $2, 0x10($16)
/* C3A0 0010C2A0 01002392 */  lbu        $3, 0x1($17)
/* C3A4 0010C2A4 110003A2 */  sb         $3, 0x11($16)
/* C3A8 0010C2A8 02002292 */  lbu        $2, 0x2($17)
/* C3AC 0010C2AC 120002A2 */  sb         $2, 0x12($16)
.L0010C2B0:
/* C3B0 0010C2B0 03008018 */  blez       $4, .L0010C2C0
/* C3B4 0010C2B4 2900043C */   lui       $4, %hi(D_00297398)
/* C3B8 0010C2B8 A611040C */  jal        printf
/* C3BC 0010C2BC 98738424 */   addiu     $4, $4, %lo(D_00297398)
.L0010C2C0:
/* C3C0 0010C2C0 2D200002 */  daddu      $4, $16, $0
/* C3C4 0010C2C4 E65A040C */  jal        sceSifWriteBackDCache
/* C3C8 0010C2C8 14000524 */   addiu     $5, $0, 0x14
/* C3CC 0010C2CC 2A00023C */  lui        $2, %hi(D_002A3980)
/* C3D0 0010C2D0 2A00043C */  lui        $4, %hi(D_002A3C00)
/* C3D4 0010C2D4 80395124 */  addiu      $17, $2, %lo(D_002A3980)
/* C3D8 0010C2D8 003C8424 */  addiu      $4, $4, %lo(D_002A3C00)
/* C3DC 0010C2DC 2D380002 */  daddu      $7, $16, $0
/* C3E0 0010C2E0 0000A0AF */  sw         $0, 0x0($sp)
/* C3E4 0010C2E4 09000524 */  addiu      $5, $0, 0x9
/* C3E8 0010C2E8 2D300000 */  daddu      $6, $0, $0
/* C3EC 0010C2EC 14000824 */  addiu      $8, $0, 0x14
/* C3F0 0010C2F0 2D482002 */  daddu      $9, $17, $0
/* C3F4 0010C2F4 04000A24 */  addiu      $10, $0, 0x4
/* C3F8 0010C2F8 2A5D040C */  jal        sceSifCallRpc
/* C3FC 0010C2FC 2D580000 */   daddu     $11, $0, $0
/* C400 0010C300 06004304 */  bgezl      $2, .L0010C31C
/* C404 0010C304 7002C28E */   lw        $2, (0x250270 & 0xFFFF)($22)
/* C408 0010C308 2500023C */  lui        $2, (0x250280 >> 16)
/* C40C 0010C30C D050040C */  jal        SignalSema
/* C410 0010C310 8002448C */   lw        $4, (0x250280 & 0xFFFF)($2)
/* C414 0010C314 0C000010 */  b          .L0010C348
/* C418 0010C318 2D100000 */   daddu     $2, $0, $0
.L0010C31C:
/* C41C 0010C31C 03004018 */  blez       $2, .L0010C32C
/* C420 0010C320 2900043C */   lui       $4, %hi(D_00297108)
/* C424 0010C324 A611040C */  jal        printf
/* C428 0010C328 08718424 */   addiu     $4, $4, %lo(D_00297108)
.L0010C32C:
/* C42C 0010C32C 2500033C */  lui        $3, (0x250280 >> 16)
/* C430 0010C330 0020023C */  lui        $2, (0x20000000 >> 16)
/* C434 0010C334 25102202 */  or         $2, $17, $2
/* C438 0010C338 8002648C */  lw         $4, (0x250280 & 0xFFFF)($3)
/* C43C 0010C33C D050040C */  jal        SignalSema
/* C440 0010C340 0000508C */   lw        $16, (0x20000000 & 0xFFFF)($2)
/* C444 0010C344 2D100002 */  daddu      $2, $16, $0
.L0010C348:
/* C448 0010C348 8000BFDF */  ld         $31, 0x80($sp)
/* C44C 0010C34C 7000B6DF */  ld         $22, 0x70($sp)
/* C450 0010C350 6000B5DF */  ld         $21, 0x60($sp)
/* C454 0010C354 5000B4DF */  ld         $20, 0x50($sp)
/* C458 0010C358 4000B3DF */  ld         $19, 0x40($sp)
/* C45C 0010C35C 3000B2DF */  ld         $18, 0x30($sp)
/* C460 0010C360 2000B1DF */  ld         $17, 0x20($sp)
/* C464 0010C364 1000B0DF */  ld         $16, 0x10($sp)
/* C468 0010C368 0800E003 */  jr         $31
/* C46C 0010C36C 9000BD27 */   addiu     $sp, $sp, 0x90
