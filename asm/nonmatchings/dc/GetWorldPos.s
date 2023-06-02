.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetWorldPos__FPfPf
/* 8B530 0018B430 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 8B534 0018B434 0000BF7F */  sq         $31, 0x0($sp)
/* 8B538 0018B438 2836A070 */  paddub     $6, $5, $0
/* 8B53C 0018B43C 4492828F */  lw         $2, -0x6DBC($gp)
/* 8B540 0018B440 05004014 */  bnez       $2, .L0018B458
/* 8B544 0018B444 00000000 */   nop
/* 8B548 0018B448 0C86040C */  jal        sceVu0CopyVector
/* 8B54C 0018B44C 00000000 */   nop
/* 8B550 0018B450 07000010 */  b          .L0018B470
/* 8B554 0018B454 00000000 */   nop
.L0018B458:
/* 8B558 0018B458 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 8B55C 0018B45C 0C00C2AC */  sw         $2, 0xC($6)
/* 8B560 0018B460 D401023C */  lui        $2, %hi(world_local)
/* 8B564 0018B464 00EF4524 */  addiu      $5, $2, %lo(world_local)
/* 8B568 0018B468 6285040C */  jal        sceVu0ApplyMatrix
/* 8B56C 0018B46C 00000000 */   nop
.L0018B470:
/* 8B570 0018B470 0000BF7B */  lq         $31, 0x0($sp)
/* 8B574 0018B474 1000BD27 */  addiu      $sp, $sp, 0x10
/* 8B578 0018B478 0800E003 */  jr         $31
/* 8B57C 0018B47C 00000000 */   nop
