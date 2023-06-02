.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetRectParts__11CEditGroundFP8CRect_i_P9CMapPartsi
/* A63C0 001A62C0 60FFBD27 */  addiu      $sp, $sp, -0xA0
/* A63C4 001A62C4 6000BF7F */  sq         $31, 0x60($sp)
/* A63C8 001A62C8 5000B57F */  sq         $21, 0x50($sp)
/* A63CC 001A62CC 4000B47F */  sq         $20, 0x40($sp)
/* A63D0 001A62D0 3000B37F */  sq         $19, 0x30($sp)
/* A63D4 001A62D4 2000B27F */  sq         $18, 0x20($sp)
/* A63D8 001A62D8 1000B17F */  sq         $17, 0x10($sp)
/* A63DC 001A62DC 0000B07F */  sq         $16, 0x0($sp)
/* A63E0 001A62E0 28AE8070 */  paddub     $21, $4, $0
/* A63E4 001A62E4 28A6A070 */  paddub     $20, $5, $0
/* A63E8 001A62E8 289EC070 */  paddub     $19, $6, $0
/* A63EC 001A62EC 2896E070 */  paddub     $18, $7, $0
/* A63F0 001A62F0 9000A0AF */  sw         $0, 0x90($sp)
/* A63F4 001A62F4 9400A0AF */  sw         $0, 0x94($sp)
/* A63F8 001A62F8 9800A0AF */  sw         $0, 0x98($sp)
/* A63FC 001A62FC 9C00A0AF */  sw         $0, 0x9C($sp)
/* A6400 001A6300 9000A327 */  addiu      $3, $sp, 0x90
/* A6404 001A6304 00006378 */  lq         $3, 0x0($3)
/* A6408 001A6308 0000A37C */  sq         $3, 0x0($5)
/* A640C 001A630C 35006012 */  beqz       $19, .L001A63E4
/* A6410 001A6310 00000000 */   nop
/* A6414 001A6314 28266072 */  paddub     $4, $19, $0
/* A6418 001A6318 7000A527 */  addiu      $5, $sp, 0x70
/* A641C 001A631C EC69060C */  jal        GetPosition__9CMapPartsFPf
/* A6420 001A6320 00000000 */   nop
/* A6424 001A6324 7400B127 */  addiu      $17, $sp, 0x74
/* A6428 001A6328 7800B027 */  addiu      $16, $sp, 0x78
/* A642C 001A632C 2826A072 */  paddub     $4, $21, $0
/* A6430 001A6330 7000ACC7 */  lwc1       $f12, 0x70($sp)
/* A6434 001A6334 00002DC6 */  lwc1       $f13, 0x0($17)
/* A6438 001A6338 00000EC6 */  lwc1       $f14, 0x0($16)
/* A643C 001A633C AC85060C */  jal        GetAreaCode__11CEditGroundFfff
/* A6440 001A6340 00000000 */   nop
/* A6444 001A6344 04004004 */  bltz       $2, .L001A6358
/* A6448 001A6348 00000000 */   nop
/* A644C 001A634C 04004328 */  slti       $3, $2, 0x4
/* A6450 001A6350 03006014 */  bnez       $3, .L001A6360
/* A6454 001A6354 00000000 */   nop
.L001A6358:
/* A6458 001A6358 22000010 */  b          .L001A63E4
/* A645C 001A635C 00000000 */   nop
.L001A6360:
/* A6460 001A6360 80180200 */  sll        $3, $2, 2
/* A6464 001A6364 21187500 */  addu       $3, $3, $21
/* A6468 001A6368 0400648C */  lw         $4, 0x4($3)
/* A646C 001A636C 1D008010 */  beqz       $4, .L001A63E4
/* A6470 001A6370 00000000 */   nop
/* A6474 001A6374 8000A527 */  addiu      $5, $sp, 0x80
/* A6478 001A6378 7000ACC7 */  lwc1       $f12, 0x70($sp)
/* A647C 001A637C 00002DC6 */  lwc1       $f13, 0x0($17)
/* A6480 001A6380 00000EC6 */  lwc1       $f14, 0x0($16)
/* A6484 001A6384 20B6050C */  jal        GetPos__9CEditAreaFP11CVector3_i_fff
/* A6488 001A6388 00000000 */   nop
/* A648C 001A638C 28266072 */  paddub     $4, $19, $0
/* A6490 001A6390 886A060C */  jal        GetWidth__9CMapPartsFv
/* A6494 001A6394 00000000 */   nop
/* A6498 001A6398 28864070 */  paddub     $16, $2, $0
/* A649C 001A639C 28266072 */  paddub     $4, $19, $0
/* A64A0 001A63A0 A06A060C */  jal        GetHeight__9CMapPartsFv
/* A64A4 001A63A4 00000000 */   nop
/* A64A8 001A63A8 43201000 */  sra        $4, $16, 1
/* A64AC 001A63AC 8000A38F */  lw         $3, 0x80($sp)
/* A64B0 001A63B0 23186400 */  subu       $3, $3, $4
/* A64B4 001A63B4 23187200 */  subu       $3, $3, $18
/* A64B8 001A63B8 000083AE */  sw         $3, 0x0($20)
/* A64BC 001A63BC 43200200 */  sra        $4, $2, 1
/* A64C0 001A63C0 8800A38F */  lw         $3, 0x88($sp)
/* A64C4 001A63C4 23186400 */  subu       $3, $3, $4
/* A64C8 001A63C8 23187200 */  subu       $3, $3, $18
/* A64CC 001A63CC 040083AE */  sw         $3, 0x4($20)
/* A64D0 001A63D0 40201200 */  sll        $4, $18, 1
/* A64D4 001A63D4 21180402 */  addu       $3, $16, $4
/* A64D8 001A63D8 080083AE */  sw         $3, 0x8($20)
/* A64DC 001A63DC 21184400 */  addu       $3, $2, $4
/* A64E0 001A63E0 0C0083AE */  sw         $3, 0xC($20)
.L001A63E4:
/* A64E4 001A63E4 6000BF7B */  lq         $31, 0x60($sp)
/* A64E8 001A63E8 5000B57B */  lq         $21, 0x50($sp)
/* A64EC 001A63EC 4000B47B */  lq         $20, 0x40($sp)
/* A64F0 001A63F0 3000B37B */  lq         $19, 0x30($sp)
/* A64F4 001A63F4 2000B27B */  lq         $18, 0x20($sp)
/* A64F8 001A63F8 1000B17B */  lq         $17, 0x10($sp)
/* A64FC 001A63FC 0000B07B */  lq         $16, 0x0($sp)
/* A6500 001A6400 A000BD27 */  addiu      $sp, $sp, 0xA0
/* A6504 001A6404 0800E003 */  jr         $31
/* A6508 001A6408 00000000 */   nop
/* A650C 001A640C 00000000 */  nop
