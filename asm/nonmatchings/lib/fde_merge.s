.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel fde_merge
/* 11418 00111318 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 1141C 0011131C 1000B1FF */  sd         $17, 0x10($sp)
/* 11420 00111320 2000B2FF */  sd         $18, 0x20($sp)
/* 11424 00111324 2D888000 */  daddu      $17, $4, $0
/* 11428 00111328 0000B0FF */  sd         $16, 0x0($sp)
/* 1142C 0011132C 0400B88C */  lw         $24, 0x4($5)
/* 11430 00111330 33000013 */  beqz       $24, .L00111400
/* 11434 00111334 2D680003 */   daddu     $13, $24, $0
/* 11438 00111338 0400308E */  lw         $16, 0x4($17)
/* 1143C 0011133C 80201800 */  sll        $4, $24, 2
/* 11440 00111340 0000398E */  lw         $25, 0x0($17)
/* 11444 00111344 0000A38C */  lw         $3, 0x0($5)
/* 11448 00111348 80101000 */  sll        $2, $16, 2
/* 1144C 0011134C 2D782003 */  daddu      $15, $25, $0
/* 11450 00111350 FCFF4224 */  addiu      $2, $2, -0x4
/* 11454 00111354 21288300 */  addu       $5, $4, $3
/* 11458 00111358 2D90E001 */  daddu      $18, $15, $0
/* 1145C 0011135C 2D504000 */  daddu      $10, $2, $0
/* 11460 00111360 21208F00 */  addu       $4, $4, $15
/* 11464 00111364 2D480002 */  daddu      $9, $16, $0
/* 11468 00111368 21584F00 */  addu       $11, $2, $15
/* 1146C 0011136C 00000000 */  nop
.L00111370:
/* 11470 00111370 FCFFA524 */  addiu      $5, $5, -0x4
/* 11474 00111374 FCFF8424 */  addiu      $4, $4, -0x4
/* 11478 00111378 0000AE8C */  lw         $14, 0x0($5)
/* 1147C 0011137C 19002011 */  beqz       $9, .L001113E4
/* 11480 00111380 FFFFAD25 */   addiu     $13, $13, -0x1
/* 11484 00111384 0000638D */  lw         $3, 0x0($11)
/* 11488 00111388 0800C68D */  lw         $6, 0x8($14)
/* 1148C 0011138C 0800628C */  lw         $2, 0x8($3)
/* 11490 00111390 23104600 */  subu       $2, $2, $6
/* 11494 00111394 13004018 */  blez       $2, .L001113E4
/* 11498 00111398 80100900 */   sll       $2, $9, 2
/* 1149C 0011139C 2D60C000 */  daddu      $12, $6, $0
/* 114A0 001113A0 21404400 */  addu       $8, $2, $4
/* 114A4 001113A4 21385901 */  addu       $7, $10, $25
/* 114A8 001113A8 21305201 */  addu       $6, $10, $18
/* 114AC 001113AC 0000C28C */  lw         $2, 0x0($6)
.L001113B0:
/* 114B0 001113B0 FCFFE724 */  addiu      $7, $7, -0x4
/* 114B4 001113B4 FCFFC624 */  addiu      $6, $6, -0x4
/* 114B8 001113B8 FCFF6B25 */  addiu      $11, $11, -0x4
/* 114BC 001113BC 000002AD */  sw         $2, 0x0($8)
/* 114C0 001113C0 FCFF4A25 */  addiu      $10, $10, -0x4
/* 114C4 001113C4 FFFF2925 */  addiu      $9, $9, -0x1
/* 114C8 001113C8 06002011 */  beqz       $9, .L001113E4
/* 114CC 001113CC FCFF0825 */   addiu     $8, $8, -0x4
/* 114D0 001113D0 0000E38C */  lw         $3, 0x0($7)
/* 114D4 001113D4 0800628C */  lw         $2, 0x8($3)
/* 114D8 001113D8 23104C00 */  subu       $2, $2, $12
/* 114DC 001113DC F4FF405C */  bgtzl      $2, .L001113B0
/* 114E0 001113E0 0000C28C */   lw        $2, 0x0($6)
.L001113E4:
/* 114E4 001113E4 21102D01 */  addu       $2, $9, $13
/* 114E8 001113E8 80100200 */  sll        $2, $2, 2
/* 114EC 001113EC 21104F00 */  addu       $2, $2, $15
/* 114F0 001113F0 DFFFA015 */  bnez       $13, .L00111370
/* 114F4 001113F4 00004EAC */   sw        $14, 0x0($2)
/* 114F8 001113F8 21101802 */  addu       $2, $16, $24
/* 114FC 001113FC 040022AE */  sw         $2, 0x4($17)
.L00111400:
/* 11500 00111400 2000B2DF */  ld         $18, 0x20($sp)
/* 11504 00111404 1000B1DF */  ld         $17, 0x10($sp)
/* 11508 00111408 0000B0DF */  ld         $16, 0x0($sp)
/* 1150C 0011140C 0800E003 */  jr         $31
/* 11510 00111410 3000BD27 */   addiu     $sp, $sp, 0x30
/* 11514 00111414 00000000 */  nop
