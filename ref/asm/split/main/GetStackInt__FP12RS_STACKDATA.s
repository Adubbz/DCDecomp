.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetStackInt__FP12RS_STACKDATA
/* 08A450 0018A350 F0FFBD27 */  addiu       $29, $29, -0x10
/* 08A454 0018A354 0000BF7F */  sq          $31, 0x0($29)
/* 08A458 0018A358 0000838C */  lw          $3, 0x0($4)
/* 08A45C 0018A35C 01000224 */  addiu       $2, $0, 0x1
/* 08A460 0018A360 06006214 */  bne         $3, $2, .L0018A37C
/* 08A464 0018A364 00000000 */   nop
/* 08A468 0018A368 04008CC4 */  lwc1        $f12, 0x4($4)
/* 08A46C 0018A36C 2C44040C */  jal         fptosi
/* 08A470 0018A370 00000000 */   nop
/* 08A474 0018A374 03000010 */  b           .L0018A384
/* 08A478 0018A378 00000000 */   nop
.L0018A37C:
/* 08A47C 0018A37C 0400828C */  lw          $2, 0x4($4)
/* 08A480 0018A380 00000000 */  nop
.L0018A384:
/* 08A484 0018A384 0000BF7B */  lq          $31, 0x0($29)
/* 08A488 0018A388 1000BD27 */  addiu       $29, $29, 0x10
/* 08A48C 0018A38C 0800E003 */  jr          $31
/* 08A490 0018A390 00000000 */   nop
/* 08A494 0018A394 00000000 */  nop
/* 08A498 0018A398 00000000 */  nop
/* 08A49C 0018A39C 00000000 */  nop
