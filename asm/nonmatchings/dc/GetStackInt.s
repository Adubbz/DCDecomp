.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetStackInt__FP12RS_STACKDATA
/* 8A450 0018A350 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 8A454 0018A354 0000BF7F */  sq         $31, 0x0($sp)
/* 8A458 0018A358 0000838C */  lw         $3, 0x0($4)
/* 8A45C 0018A35C 01000224 */  addiu      $2, $0, 0x1
/* 8A460 0018A360 06006214 */  bne        $3, $2, .L0018A37C
/* 8A464 0018A364 00000000 */   nop
/* 8A468 0018A368 04008CC4 */  lwc1       $f12, 0x4($4)
/* 8A46C 0018A36C 2C44040C */  jal        fptosi
/* 8A470 0018A370 00000000 */   nop
/* 8A474 0018A374 03000010 */  b          .L0018A384
/* 8A478 0018A378 00000000 */   nop
.L0018A37C:
/* 8A47C 0018A37C 0400828C */  lw         $2, 0x4($4)
/* 8A480 0018A380 00000000 */  nop
.L0018A384:
/* 8A484 0018A384 0000BF7B */  lq         $31, 0x0($sp)
/* 8A488 0018A388 1000BD27 */  addiu      $sp, $sp, 0x10
/* 8A48C 0018A38C 0800E003 */  jr         $31
/* 8A490 0018A390 00000000 */   nop
/* 8A494 0018A394 00000000 */  nop
/* 8A498 0018A398 00000000 */  nop
/* 8A49C 0018A39C 00000000 */  nop
