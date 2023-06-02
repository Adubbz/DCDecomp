.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetLocalPos__FPfPf
/* 8B610 0018B510 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 8B614 0018B514 0000BF7F */  sq         $31, 0x0($sp)
/* 8B618 0018B518 2836A070 */  paddub     $6, $5, $0
/* 8B61C 0018B51C 4492828F */  lw         $2, -0x6DBC($gp)
/* 8B620 0018B520 05004014 */  bnez       $2, .L0018B538
/* 8B624 0018B524 00000000 */   nop
/* 8B628 0018B528 0C86040C */  jal        sceVu0CopyVector
/* 8B62C 0018B52C 00000000 */   nop
/* 8B630 0018B530 07000010 */  b          .L0018B550
/* 8B634 0018B534 00000000 */   nop
.L0018B538:
/* 8B638 0018B538 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 8B63C 0018B53C 0C00C2AC */  sw         $2, 0xC($6)
/* 8B640 0018B540 D401023C */  lui        $2, %hi(local_world)
/* 8B644 0018B544 40EF4524 */  addiu      $5, $2, %lo(local_world)
/* 8B648 0018B548 6285040C */  jal        sceVu0ApplyMatrix
/* 8B64C 0018B54C 00000000 */   nop
.L0018B550:
/* 8B650 0018B550 0000BF7B */  lq         $31, 0x0($sp)
/* 8B654 0018B554 1000BD27 */  addiu      $sp, $sp, 0x10
/* 8B658 0018B558 0800E003 */  jr         $31
/* 8B65C 0018B55C 00000000 */   nop
