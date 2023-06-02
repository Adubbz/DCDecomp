.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetFrameSearch__11CDungeonMapFPc
/* C2430 001C2330 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* C2434 001C2334 3000BF7F */  sq         $31, 0x30($sp)
/* C2438 001C2338 2000B27F */  sq         $18, 0x20($sp)
/* C243C 001C233C 1000B17F */  sq         $17, 0x10($sp)
/* C2440 001C2340 0000B07F */  sq         $16, 0x0($sp)
/* C2444 001C2344 28968070 */  paddub     $18, $4, $0
/* C2448 001C2348 288EA070 */  paddub     $17, $5, $0
/* C244C 001C234C 28860070 */  paddub     $16, $0, $0
/* C2450 001C2350 10000010 */  b          .L001C2394
/* C2454 001C2354 00000000 */   nop
.L001C2358:
/* C2458 001C2358 C0101000 */  sll        $2, $16, 3
/* C245C 001C235C 23105000 */  subu       $2, $2, $16
/* C2460 001C2360 80100200 */  sll        $2, $2, 2
/* C2464 001C2364 21105000 */  addu       $2, $2, $16
/* C2468 001C2368 00110200 */  sll        $2, $2, 4
/* C246C 001C236C 21104202 */  addu       $2, $18, $2
/* C2470 001C2370 90044424 */  addiu      $4, $2, 0x490
/* C2474 001C2374 282E2072 */  paddub     $5, $17, $0
/* C2478 001C2378 6405070C */  jal        GetSearchFrame__13CDungeonPartsFPc
/* C247C 001C237C 00000000 */   nop
/* C2480 001C2380 03004010 */  beqz       $2, .L001C2390
/* C2484 001C2384 00000000 */   nop
/* C2488 001C2388 06000010 */  b          .L001C23A4
/* C248C 001C238C 00000000 */   nop
.L001C2390:
/* C2490 001C2390 01001026 */  addiu      $16, $16, 0x1
.L001C2394:
/* C2494 001C2394 4800022A */  slti       $2, $16, 0x48
/* C2498 001C2398 EFFF4014 */  bnez       $2, .L001C2358
/* C249C 001C239C 00000000 */   nop
/* C24A0 001C23A0 28160070 */  paddub     $2, $0, $0
.L001C23A4:
/* C24A4 001C23A4 3000BF7B */  lq         $31, 0x30($sp)
/* C24A8 001C23A8 2000B27B */  lq         $18, 0x20($sp)
/* C24AC 001C23AC 1000B17B */  lq         $17, 0x10($sp)
/* C24B0 001C23B0 0000B07B */  lq         $16, 0x0($sp)
/* C24B4 001C23B4 4000BD27 */  addiu      $sp, $sp, 0x40
/* C24B8 001C23B8 0800E003 */  jr         $31
/* C24BC 001C23BC 00000000 */   nop
