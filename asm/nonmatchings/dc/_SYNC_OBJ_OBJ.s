.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SYNC_OBJ_OBJ__FP12RS_STACKDATAi
/* 91400 00191300 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 91404 00191304 2000BF7F */  sq         $31, 0x20($sp)
/* 91408 00191308 1000B17F */  sq         $17, 0x10($sp)
/* 9140C 0019130C 0000B07F */  sq         $16, 0x0($sp)
/* 91410 00191310 08009124 */  addiu      $17, $4, 0x8
/* 91414 00191314 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 91418 00191318 00000000 */   nop
/* 9141C 0019131C 28264070 */  paddub     $4, $2, $0
/* 91420 00191320 0C29060C */  jal        GetObjHandle__Fi
/* 91424 00191324 00000000 */   nop
/* 91428 00191328 28864070 */  paddub     $16, $2, $0
/* 9142C 0019132C 04000016 */  bnez       $16, .L00191340
/* 91430 00191330 00000000 */   nop
/* 91434 00191334 28160070 */  paddub     $2, $0, $0
/* 91438 00191338 11000010 */  b          .L00191380
/* 9143C 0019133C 00000000 */   nop
.L00191340:
/* 91440 00191340 28262072 */  paddub     $4, $17, $0
/* 91444 00191344 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 91448 00191348 00000000 */   nop
/* 9144C 0019134C 28264070 */  paddub     $4, $2, $0
/* 91450 00191350 0C29060C */  jal        GetObjHandle__Fi
/* 91454 00191354 00000000 */   nop
/* 91458 00191358 04004014 */  bnez       $2, .L0019136C
/* 9145C 0019135C 00000000 */   nop
/* 91460 00191360 28160070 */  paddub     $2, $0, $0
/* 91464 00191364 06000010 */  b          .L00191380
/* 91468 00191368 00000000 */   nop
.L0019136C:
/* 9146C 0019136C 28260072 */  paddub     $4, $16, $0
/* 91470 00191370 282E4070 */  paddub     $5, $2, $0
/* 91474 00191374 A82B060C */  jal        sync_obj_obj__FP10OBJ_HANDLEP10OBJ_HANDLE
/* 91478 00191378 00000000 */   nop
/* 9147C 0019137C 01000224 */  addiu      $2, $0, 0x1
.L00191380:
/* 91480 00191380 2000BF7B */  lq         $31, 0x20($sp)
/* 91484 00191384 1000B17B */  lq         $17, 0x10($sp)
/* 91488 00191388 0000B07B */  lq         $16, 0x0($sp)
/* 9148C 0019138C 3000BD27 */  addiu      $sp, $sp, 0x30
/* 91490 00191390 0800E003 */  jr         $31
/* 91494 00191394 00000000 */   nop
/* 91498 00191398 00000000 */  nop
/* 9149C 0019139C 00000000 */  nop