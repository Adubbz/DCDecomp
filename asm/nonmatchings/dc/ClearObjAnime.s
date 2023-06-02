.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ClearObjAnime__Fi
/* 8A330 0018A230 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 8A334 0018A234 0000BF7F */  sq         $31, 0x0($sp)
/* 8A338 0018A238 12008104 */  bgez       $4, .L0018A284
/* 8A33C 0018A23C 00000000 */   nop
/* 8A340 0018A240 28360070 */  paddub     $6, $0, $0
/* 8A344 0018A244 0A000010 */  b          .L0018A270
/* 8A348 0018A248 00000000 */   nop
.L0018A24C:
/* 8A34C 0018A24C FFFF0524 */  addiu      $5, $0, -0x1
/* 8A350 0018A250 C0180600 */  sll        $3, $6, 3
/* 8A354 0018A254 21186600 */  addu       $3, $3, $6
/* 8A358 0018A258 00210300 */  sll        $4, $3, 4
/* 8A35C 0018A25C D401033C */  lui        $3, %hi(D_1D3E5B0)
/* 8A360 0018A260 B0E56324 */  addiu      $3, $3, %lo(D_1D3E5B0)
/* 8A364 0018A264 21186400 */  addu       $3, $3, $4
/* 8A368 0018A268 000065AC */  sw         $5, 0x0($3)
/* 8A36C 0018A26C 0100C624 */  addiu      $6, $6, 0x1
.L0018A270:
/* 8A370 0018A270 1000C328 */  slti       $3, $6, 0x10
/* 8A374 0018A274 F5FF6014 */  bnez       $3, .L0018A24C
/* 8A378 0018A278 00000000 */   nop
/* 8A37C 0018A27C 07000010 */  b          .L0018A29C
/* 8A380 0018A280 00000000 */   nop
.L0018A284:
/* 8A384 0018A284 7C28060C */  jal        GetObjAnime__Fi
/* 8A388 0018A288 00000000 */   nop
/* 8A38C 0018A28C 03004010 */  beqz       $2, .L0018A29C
/* 8A390 0018A290 00000000 */   nop
/* 8A394 0018A294 FFFF0324 */  addiu      $3, $0, -0x1
/* 8A398 0018A298 100043AC */  sw         $3, 0x10($2)
.L0018A29C:
/* 8A39C 0018A29C 0000BF7B */  lq         $31, 0x0($sp)
/* 8A3A0 0018A2A0 1000BD27 */  addiu      $sp, $sp, 0x10
/* 8A3A4 0018A2A4 0800E003 */  jr         $31
/* 8A3A8 0018A2A8 00000000 */   nop
/* 8A3AC 0018A2AC 00000000 */  nop
