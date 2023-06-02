.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel memcmp
/* 3418 00103318 1000C22C */  sltiu      $2, $6, 0x10
/* 341C 0010331C 11004014 */  bnez       $2, .L00103364
/* 3420 00103320 25108500 */   or        $2, $4, $5
/* 3424 00103324 0F004230 */  andi       $2, $2, 0xF
/* 3428 00103328 0E004014 */  bnez       $2, .L00103364
/* 342C 0010332C 00000000 */   nop
.L00103330:
/* 3430 00103330 00008378 */  lq         $3, 0x0($4)
/* 3434 00103334 2000C72C */  sltiu      $7, $6, 0x20
/* 3438 00103338 0000A278 */  lq         $2, 0x0($5)
/* 343C 0010333C 10008424 */  addiu      $4, $4, 0x10
/* 3440 00103340 C9444370 */  pxor       $8, $2, $3
/* 3444 00103344 1000A224 */  addiu      $2, $5, 0x10
/* 3448 00103348 A9530771 */  pcpyud     $10, $8, $7
/* 344C 0010334C 25484801 */  or         $9, $10, $8
/* 3450 00103350 0A284900 */  movz       $5, $2, $9
/* 3454 00103354 03002055 */  bnel       $9, $0, .L00103364
/* 3458 00103358 F0FF8424 */   addiu     $4, $4, -0x10
/* 345C 0010335C F4FFE010 */  beqz       $7, .L00103330
/* 3460 00103360 F0FFC624 */   addiu     $6, $6, -0x10
.L00103364:
/* 3464 00103364 FFFF023C */  lui        $2, (0xFFFFFFFF >> 16)
/* 3468 00103368 FFFFC624 */  addiu      $6, $6, -0x1
/* 346C 0010336C FFFF4234 */  ori        $2, $2, (0xFFFFFFFF & 0xFFFF)
/* 3470 00103370 0C00C210 */  beq        $6, $2, .L001033A4
/* 3474 00103374 00000000 */   nop
/* 3478 00103378 FFFF073C */  lui        $7, (0xFFFFFFFF >> 16)
/* 347C 0010337C FFFFE734 */  ori        $7, $7, (0xFFFFFFFF & 0xFFFF)
.L00103380:
/* 3480 00103380 00008390 */  lbu        $3, 0x0($4)
/* 3484 00103384 0000A290 */  lbu        $2, 0x0($5)
/* 3488 00103388 03006210 */  beq        $3, $2, .L00103398
/* 348C 0010338C 01008424 */   addiu     $4, $4, 0x1
/* 3490 00103390 0800E003 */  jr         $31
/* 3494 00103394 23106200 */   subu      $2, $3, $2
.L00103398:
/* 3498 00103398 FFFFC624 */  addiu      $6, $6, -0x1
/* 349C 0010339C F8FFC714 */  bne        $6, $7, .L00103380
/* 34A0 001033A0 0100A524 */   addiu     $5, $5, 0x1
.L001033A4:
/* 34A4 001033A4 0800E003 */  jr         $31
/* 34A8 001033A8 2D100000 */   daddu     $2, $0, $0
/* 34AC 001033AC 00000000 */  nop
