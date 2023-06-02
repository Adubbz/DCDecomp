.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EatFood__5CFishFv
/* 140350 00240250 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 140354 00240254 1000BF7F */  sq         $31, 0x10($sp)
/* 140358 00240258 0000B07F */  sq         $16, 0x0($sp)
/* 14035C 0024025C 28868070 */  paddub     $16, $4, $0
/* 140360 00240260 2000A527 */  addiu      $5, $sp, 0x20
/* 140364 00240264 F403090C */  jal        GetPosition__5CFishFPf
/* 140368 00240268 00000000 */   nop
/* 14036C 0024026C 8C0001C6 */  lwc1       $f1, 0x8C($16)
/* 140370 00240270 00008044 */  mtc1       $0, $f0
/* 140374 00240274 00000000 */  nop
/* 140378 00240278 36080046 */  c.le.s     $f1, $f0
/* 14037C 0024027C 00000000 */  nop
/* 140380 00240280 04000045 */  bc1f       .L00240294
/* 140384 00240284 00000000 */   nop
/* 140388 00240288 28160070 */  paddub     $2, $0, $0
/* 14038C 0024028C 1B000010 */  b          .L002402FC
/* 140390 00240290 00000000 */   nop
.L00240294:
/* 140394 00240294 90000426 */  addiu      $4, $16, 0x90
/* 140398 00240298 2000A527 */  addiu      $5, $sp, 0x20
/* 14039C 0024029C 648D040C */  jal        DistVector__FPfPf
/* 1403A0 002402A0 00000000 */   nop
/* 1403A4 002402A4 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 1403A8 002402A8 00088244 */  mtc1       $2, $f1
/* 1403AC 002402AC 00000000 */  nop
/* 1403B0 002402B0 36000146 */  c.le.s     $f0, $f1
/* 1403B4 002402B4 00000000 */  nop
/* 1403B8 002402B8 04000145 */  bc1t       .L002402CC
/* 1403BC 002402BC 00000000 */   nop
/* 1403C0 002402C0 28160070 */  paddub     $2, $0, $0
/* 1403C4 002402C4 0D000010 */  b          .L002402FC
/* 1403C8 002402C8 00000000 */   nop
.L002402CC:
/* 1403CC 002402CC 8800028E */  lw         $2, 0x88($16)
/* 1403D0 002402D0 80100200 */  sll        $2, $2, 2
/* 1403D4 002402D4 21185000 */  addu       $3, $2, $16
/* 1403D8 002402D8 003F023C */  lui        $2, (0x3F000000 >> 16)
/* 1403DC 002402DC 00088244 */  mtc1       $2, $f1
/* 1403E0 002402E0 180060C4 */  lwc1       $f0, 0x18($3)
/* 1403E4 002402E4 020B0046 */  mul.s      $f12, $f1, $f0
/* 1403E8 002402E8 1400090C */  jal        rand_check__Ff
/* 1403EC 002402EC 00000000 */   nop
/* 1403F0 002402F0 01000324 */  addiu      $3, $0, 0x1
/* 1403F4 002402F4 0A180200 */  movz       $3, $0, $2
/* 1403F8 002402F8 28166070 */  paddub     $2, $3, $0
.L002402FC:
/* 1403FC 002402FC 1000BF7B */  lq         $31, 0x10($sp)
/* 140400 00240300 0000B07B */  lq         $16, 0x0($sp)
/* 140404 00240304 3000BD27 */  addiu      $sp, $sp, 0x30
/* 140408 00240308 0800E003 */  jr         $31
/* 14040C 0024030C 00000000 */   nop