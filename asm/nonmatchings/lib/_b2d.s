.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _b2d
/* 4328 00104228 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 432C 0010422C 5000B4FF */  sd         $20, 0x50($sp)
/* 4330 00104230 3000B2FF */  sd         $18, 0x30($sp)
/* 4334 00104234 14009424 */  addiu      $20, $4, 0x14
/* 4338 00104238 1000B0FF */  sd         $16, 0x10($sp)
/* 433C 0010423C 6000BFFF */  sd         $31, 0x60($sp)
/* 4340 00104240 2D80A000 */  daddu      $16, $5, $0
/* 4344 00104244 4000B3FF */  sd         $19, 0x40($sp)
/* 4348 00104248 2000B1FF */  sd         $17, 0x20($sp)
/* 434C 0010424C 1000828C */  lw         $2, 0x10($4)
/* 4350 00104250 80100200 */  sll        $2, $2, 2
/* 4354 00104254 21908202 */  addu       $18, $20, $2
/* 4358 00104258 FCFF5226 */  addiu      $18, $18, -0x4
/* 435C 0010425C 0000538E */  lw         $19, 0x0($18)
/* 4360 00104260 5C0E040C */  jal        _hi0bits
/* 4364 00104264 2D206002 */   daddu     $4, $19, $0
/* 4368 00104268 2D304000 */  daddu      $6, $2, $0
/* 436C 0010426C 20000224 */  addiu      $2, $0, 0x20
/* 4370 00104270 0B00C328 */  slti       $3, $6, 0xB
/* 4374 00104274 23104600 */  subu       $2, $2, $6
/* 4378 00104278 1A006010 */  beqz       $3, .L001042E4
/* 437C 0010427C 000002AE */   sw        $2, 0x0($16)
/* 4380 00104280 0B000224 */  addiu      $2, $0, 0xB
/* 4384 00104284 F03F043C */  lui        $4, (0x3FF00000 >> 16)
/* 4388 00104288 23104600 */  subu       $2, $2, $6
/* 438C 0010428C FFFF033C */  lui        $3, (0xFFFF0000 >> 16)
/* 4390 00104290 3E180300 */  dsrl32     $3, $3, 0
/* 4394 00104294 06105300 */  srlv       $2, $19, $2
/* 4398 00104298 24882302 */  and        $17, $17, $3
/* 439C 0010429C 25104400 */  or         $2, $2, $4
/* 43A0 001042A0 2B189202 */  sltu       $3, $20, $18
/* 43A4 001042A4 3C100200 */  dsll32     $2, $2, 0
/* 43A8 001042A8 25882202 */  or         $17, $17, $2
/* 43AC 001042AC 02006010 */  beqz       $3, .L001042B8
/* 43B0 001042B0 2D200000 */   daddu     $4, $0, $0
/* 43B4 001042B4 FCFF448E */  lw         $4, -0x4($18)
.L001042B8:
/* 43B8 001042B8 0B000224 */  addiu      $2, $0, 0xB
/* 43BC 001042BC 1500C324 */  addiu      $3, $6, 0x15
/* 43C0 001042C0 23104600 */  subu       $2, $2, $6
/* 43C4 001042C4 04187300 */  sllv       $3, $19, $3
/* 43C8 001042C8 06104400 */  srlv       $2, $4, $2
/* 43CC 001042CC 25186200 */  or         $3, $3, $2
/* 43D0 001042D0 FFFF0424 */  addiu      $4, $0, -0x1
/* 43D4 001042D4 3C200400 */  dsll32     $4, $4, 0
/* 43D8 001042D8 3C180300 */  dsll32     $3, $3, 0
/* 43DC 001042DC 1F000010 */  b          .L0010435C
/* 43E0 001042E0 24882402 */   and       $17, $17, $4
.L001042E4:
/* 43E4 001042E4 2B109202 */  sltu       $2, $20, $18
/* 43E8 001042E8 03004010 */  beqz       $2, .L001042F8
/* 43EC 001042EC 2D380000 */   daddu     $7, $0, $0
/* 43F0 001042F0 FCFF5226 */  addiu      $18, $18, -0x4
/* 43F4 001042F4 0000478E */  lw         $7, 0x0($18)
.L001042F8:
/* 43F8 001042F8 F5FFC624 */  addiu      $6, $6, -0xB
/* 43FC 001042FC 1A00C010 */  beqz       $6, .L00104368
/* 4400 00104300 23100600 */   negu      $2, $6
/* 4404 00104304 F03F053C */  lui        $5, (0x3FF00000 >> 16)
/* 4408 00104308 06104700 */  srlv       $2, $7, $2
/* 440C 0010430C 0418D300 */  sllv       $3, $19, $6
/* 4410 00104310 25104500 */  or         $2, $2, $5
/* 4414 00104314 FFFF043C */  lui        $4, (0xFFFF0000 >> 16)
/* 4418 00104318 3E200400 */  dsrl32     $4, $4, 0
/* 441C 0010431C 25186200 */  or         $3, $3, $2
/* 4420 00104320 24882402 */  and        $17, $17, $4
/* 4424 00104324 3C180300 */  dsll32     $3, $3, 0
/* 4428 00104328 2B109202 */  sltu       $2, $20, $18
/* 442C 0010432C 25882302 */  or         $17, $17, $3
/* 4430 00104330 02004010 */  beqz       $2, .L0010433C
/* 4434 00104334 2D980000 */   daddu     $19, $0, $0
/* 4438 00104338 FCFF538E */  lw         $19, -0x4($18)
.L0010433C:
/* 443C 0010433C 23100600 */  negu       $2, $6
/* 4440 00104340 0418C700 */  sllv       $3, $7, $6
/* 4444 00104344 06105300 */  srlv       $2, $19, $2
/* 4448 00104348 FFFF0424 */  addiu      $4, $0, -0x1
/* 444C 0010434C 3C200400 */  dsll32     $4, $4, 0
/* 4450 00104350 25186200 */  or         $3, $3, $2
/* 4454 00104354 24882402 */  and        $17, $17, $4
/* 4458 00104358 3C180300 */  dsll32     $3, $3, 0
.L0010435C:
/* 445C 0010435C 3E180300 */  dsrl32     $3, $3, 0
/* 4460 00104360 07000010 */  b          .L00104380
/* 4464 00104364 25882302 */   or        $17, $17, $3
.L00104368:
/* 4468 00104368 F03F033C */  lui        $3, (0x3FF00000 >> 16)
/* 446C 0010436C 25186302 */  or         $3, $19, $3
/* 4470 00104370 3C100700 */  dsll32     $2, $7, 0
/* 4474 00104374 3E100200 */  dsrl32     $2, $2, 0
/* 4478 00104378 3C880300 */  dsll32     $17, $3, 0
/* 447C 0010437C 25882202 */  or         $17, $17, $2
.L00104380:
/* 4480 00104380 2D102002 */  daddu      $2, $17, $0
/* 4484 00104384 6000BFDF */  ld         $31, 0x60($sp)
/* 4488 00104388 5000B4DF */  ld         $20, 0x50($sp)
/* 448C 0010438C 4000B3DF */  ld         $19, 0x40($sp)
/* 4490 00104390 3000B2DF */  ld         $18, 0x30($sp)
/* 4494 00104394 2000B1DF */  ld         $17, 0x20($sp)
/* 4498 00104398 1000B0DF */  ld         $16, 0x10($sp)
/* 449C 0010439C 0800E003 */  jr         $31
/* 44A0 001043A0 7000BD27 */   addiu     $sp, $sp, 0x70
/* 44A4 001043A4 00000000 */  nop
