.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PersonalBoardAttachPush__FP9IHAVEITEMi
/* 12F4F0 0022F3F0 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 12F4F4 0022F3F4 5000BF7F */  sq         $31, 0x50($sp)
/* 12F4F8 0022F3F8 4000B47F */  sq         $20, 0x40($sp)
/* 12F4FC 0022F3FC 3000B37F */  sq         $19, 0x30($sp)
/* 12F500 0022F400 2000B27F */  sq         $18, 0x20($sp)
/* 12F504 0022F404 1000B17F */  sq         $17, 0x10($sp)
/* 12F508 0022F408 0000B07F */  sq         $16, 0x0($sp)
/* 12F50C 0022F40C 288E8070 */  paddub     $17, $4, $0
/* 12F510 0022F410 2896A070 */  paddub     $18, $5, $0
/* 12F514 0022F414 28860070 */  paddub     $16, $0, $0
/* 12F518 0022F418 10008484 */  lh         $4, 0x10($4)
/* 12F51C 0022F41C 88C7080C */  jal        WhatIsKindofItem__Fi
/* 12F520 0022F420 00000000 */   nop
/* 12F524 0022F424 02000324 */  addiu      $3, $0, 0x2
/* 12F528 0022F428 03004310 */  beq        $2, $3, .L0022F438
/* 12F52C 0022F42C 00000000 */   nop
/* 12F530 0022F430 1B004104 */  bgez       $2, .L0022F4A0
/* 12F534 0022F434 00000000 */   nop
.L0022F438:
/* 12F538 0022F438 02000224 */  addiu      $2, $0, 0x2
/* 12F53C 0022F43C 040022AE */  sw         $2, 0x4($17)
/* 12F540 0022F440 0C0032AE */  sw         $18, 0xC($17)
/* 12F544 0022F444 A097828F */  lw         $2, -0x6860($gp)
/* 12F548 0022F448 04054324 */  addiu      $3, $2, 0x504
/* 12F54C 0022F44C F87F6324 */  addiu      $3, $3, 0x7FF8
/* 12F550 0022F450 40111200 */  sll        $2, $18, 5
/* 12F554 0022F454 21906200 */  addu       $18, $3, $2
/* 12F558 0022F458 10003386 */  lh         $19, 0x10($17)
/* 12F55C 0022F45C 00005486 */  lh         $20, 0x0($18)
/* 12F560 0022F460 A897828F */  lw         $2, -0x6858($gp)
/* 12F564 0022F464 28264072 */  paddub     $4, $18, $0
/* 12F568 0022F468 3C014524 */  addiu      $5, $2, 0x13C
/* 12F56C 0022F46C 74B9080C */  jal        MenuDataSwap__FP11ATTACH_LISTP11ATTACH_LIST
/* 12F570 0022F470 00000000 */   nop
/* 12F574 0022F474 100034A6 */  sh         $20, 0x10($17)
/* 12F578 0022F478 000053A6 */  sh         $19, 0x0($18)
/* 12F57C 0022F47C 10002286 */  lh         $2, 0x10($17)
/* 12F580 0022F480 51004128 */  slti       $at, $2, 0x51
/* 12F584 0022F484 05002010 */  beqz       $at, .L0022F49C
/* 12F588 0022F488 00000000 */   nop
/* 12F58C 0022F48C 00004286 */  lh         $2, 0x0($18)
/* 12F590 0022F490 51004228 */  slti       $2, $2, 0x51
/* 12F594 0022F494 02004014 */  bnez       $2, .L0022F4A0
/* 12F598 0022F498 00000000 */   nop
.L0022F49C:
/* 12F59C 0022F49C 01001024 */  addiu      $16, $0, 0x1
.L0022F4A0:
/* 12F5A0 0022F4A0 28160072 */  paddub     $2, $16, $0
/* 12F5A4 0022F4A4 5000BF7B */  lq         $31, 0x50($sp)
/* 12F5A8 0022F4A8 4000B47B */  lq         $20, 0x40($sp)
/* 12F5AC 0022F4AC 3000B37B */  lq         $19, 0x30($sp)
/* 12F5B0 0022F4B0 2000B27B */  lq         $18, 0x20($sp)
/* 12F5B4 0022F4B4 1000B17B */  lq         $17, 0x10($sp)
/* 12F5B8 0022F4B8 0000B07B */  lq         $16, 0x0($sp)
/* 12F5BC 0022F4BC 6000BD27 */  addiu      $sp, $sp, 0x60
/* 12F5C0 0022F4C0 0800E003 */  jr         $31
/* 12F5C4 0022F4C4 00000000 */   nop
/* 12F5C8 0022F4C8 00000000 */  nop
/* 12F5CC 0022F4CC 00000000 */  nop
