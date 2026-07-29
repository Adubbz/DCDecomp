.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FishingCheckUkiHook__Fv
/* 0AA2E0 001AA1E0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0AA2E4 001AA1E4 0000BF7F */  sq          $31, 0x0($29)
/* 0AA2E8 001AA1E8 1000A427 */  addiu       $4, $29, 0x10
/* 0AA2EC 001AA1EC 60A8060C */  jal         FishLineGetUki__FPf
/* 0AA2F0 001AA1F0 00000000 */   nop
/* 0AA2F4 001AA1F4 2000A427 */  addiu       $4, $29, 0x20
/* 0AA2F8 001AA1F8 6CA8060C */  jal         FishLineGetHook__FPf
/* 0AA2FC 001AA1FC 00000000 */   nop
/* 0AA300 001AA200 281E0070 */  paddub      $3, $0, $0
/* 0AA304 001AA204 2E000010 */  b           .L001AA2C0
/* 0AA308 001AA208 00000000 */   nop
.L001AA20C:
/* 0AA30C 001AA20C 80200300 */  sll         $4, $3, 2
/* 0AA310 001AA210 D501023C */  lui         $2, %hi(fishing_rect)
/* 0AA314 001AA214 D0494224 */  addiu       $2, $2, %lo(fishing_rect)
/* 0AA318 001AA218 21104400 */  addu        $2, $2, $4
/* 0AA31C 001AA21C 000040C4 */  lwc1        $f0, 0x0($2)
/* 0AA320 001AA220 21109D00 */  addu        $2, $4, $29
/* 0AA324 001AA224 100041C4 */  lwc1        $f1, 0x10($2)
/* 0AA328 001AA228 34000146 */  c.lt.s      $f0, $f1
/* 0AA32C 001AA22C 01000224 */  addiu       $2, $0, 0x1
/* 0AA330 001AA230 02000145 */  bc1t        .L001AA23C
/* 0AA334 001AA234 00000000 */   nop
/* 0AA338 001AA238 28160070 */  paddub      $2, $0, $0
.L001AA23C:
/* 0AA33C 001AA23C 04004010 */  beqz        $2, .L001AA250
/* 0AA340 001AA240 00000000 */   nop
/* 0AA344 001AA244 01000224 */  addiu       $2, $0, 0x1
/* 0AA348 001AA248 37000010 */  b           .L001AA328
/* 0AA34C 001AA24C 00000000 */   nop
.L001AA250:
/* 0AA350 001AA250 21109D00 */  addu        $2, $4, $29
/* 0AA354 001AA254 200042C4 */  lwc1        $f2, 0x20($2)
/* 0AA358 001AA258 34000246 */  c.lt.s      $f0, $f2
/* 0AA35C 001AA25C 00000000 */  nop
/* 0AA360 001AA260 04000045 */  bc1f        .L001AA274
/* 0AA364 001AA264 00000000 */   nop
/* 0AA368 001AA268 01000224 */  addiu       $2, $0, 0x1
/* 0AA36C 001AA26C 2E000010 */  b           .L001AA328
/* 0AA370 001AA270 00000000 */   nop
.L001AA274:
/* 0AA374 001AA274 D501023C */  lui         $2, %hi(fishing_rect + 0x10)
/* 0AA378 001AA278 E0494224 */  addiu       $2, $2, %lo(fishing_rect + 0x10)
/* 0AA37C 001AA27C 21104400 */  addu        $2, $2, $4
/* 0AA380 001AA280 000040C4 */  lwc1        $f0, 0x0($2)
/* 0AA384 001AA284 36000146 */  c.le.s      $f0, $f1
/* 0AA388 001AA288 00000000 */  nop
/* 0AA38C 001AA28C 04000145 */  bc1t        .L001AA2A0
/* 0AA390 001AA290 00000000 */   nop
/* 0AA394 001AA294 01000224 */  addiu       $2, $0, 0x1
/* 0AA398 001AA298 23000010 */  b           .L001AA328
/* 0AA39C 001AA29C 00000000 */   nop
.L001AA2A0:
/* 0AA3A0 001AA2A0 36000246 */  c.le.s      $f0, $f2
/* 0AA3A4 001AA2A4 00000000 */  nop
/* 0AA3A8 001AA2A8 04000145 */  bc1t        .L001AA2BC
/* 0AA3AC 001AA2AC 00000000 */   nop
/* 0AA3B0 001AA2B0 01000224 */  addiu       $2, $0, 0x1
/* 0AA3B4 001AA2B4 1C000010 */  b           .L001AA328
/* 0AA3B8 001AA2B8 00000000 */   nop
.L001AA2BC:
/* 0AA3BC 001AA2BC 01006324 */  addiu       $3, $3, 0x1
.L001AA2C0:
/* 0AA3C0 001AA2C0 03006228 */  slti        $2, $3, 0x3
/* 0AA3C4 001AA2C4 D1FF4014 */  bnez        $2, .L001AA20C
/* 0AA3C8 001AA2C8 00000000 */   nop
/* 0AA3CC 001AA2CC 74A4060C */  jal         FishingGetWaterLevel__Fv
/* 0AA3D0 001AA2D0 00000000 */   nop
/* 0AA3D4 001AA2D4 A040023C */  lui         $2, (0x40A00000 >> 16)
/* 0AA3D8 001AA2D8 00088244 */  mtc1        $2, $f1
/* 0AA3DC 001AA2DC 00000000 */  nop
/* 0AA3E0 001AA2E0 40080046 */  add.s       $f1, $f1, $f0
/* 0AA3E4 001AA2E4 2400A0C7 */  lwc1        $f0, 0x24($29)
/* 0AA3E8 001AA2E8 36000146 */  c.le.s      $f0, $f1
/* 0AA3EC 001AA2EC 00000000 */  nop
/* 0AA3F0 001AA2F0 04000145 */  bc1t        .L001AA304
/* 0AA3F4 001AA2F4 00000000 */   nop
/* 0AA3F8 001AA2F8 01000224 */  addiu       $2, $0, 0x1
/* 0AA3FC 001AA2FC 0A000010 */  b           .L001AA328
/* 0AA400 001AA300 00000000 */   nop
.L001AA304:
/* 0AA404 001AA304 1400A0C7 */  lwc1        $f0, 0x14($29)
/* 0AA408 001AA308 36000146 */  c.le.s      $f0, $f1
/* 0AA40C 001AA30C 00000000 */  nop
/* 0AA410 001AA310 04000145 */  bc1t        .L001AA324
/* 0AA414 001AA314 00000000 */   nop
/* 0AA418 001AA318 01000224 */  addiu       $2, $0, 0x1
/* 0AA41C 001AA31C 02000010 */  b           .L001AA328
/* 0AA420 001AA320 00000000 */   nop
.L001AA324:
/* 0AA424 001AA324 28160070 */  paddub      $2, $0, $0
.L001AA328:
/* 0AA428 001AA328 0000BF7B */  lq          $31, 0x0($29)
/* 0AA42C 001AA32C 3000BD27 */  addiu       $29, $29, 0x30
/* 0AA430 001AA330 0800E003 */  jr          $31
/* 0AA434 001AA334 00000000 */   nop
/* 0AA438 001AA338 00000000 */  nop
/* 0AA43C 001AA33C 00000000 */  nop
