.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DeleteItemFrame__Fi
/* 8B3C0 0018B2C0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 8B3C4 0018B2C4 1000BF7F */  sq         $31, 0x10($sp)
/* 8B3C8 0018B2C8 0000B07F */  sq         $16, 0x0($sp)
/* 8B3CC 0018B2CC 03008004 */  bltz       $4, .L0018B2DC
/* 8B3D0 0018B2D0 00000000 */   nop
/* 8B3D4 0018B2D4 03008018 */  blez       $4, .L0018B2E4
/* 8B3D8 0018B2D8 00000000 */   nop
.L0018B2DC:
/* 8B3DC 0018B2DC 0B000010 */  b          .L0018B30C
/* 8B3E0 0018B2E0 00000000 */   nop
.L0018B2E4:
/* 8B3E4 0018B2E4 80200400 */  sll        $4, $4, 2
/* 8B3E8 0018B2E8 D401033C */  lui        $3, %hi(D_1D3D42C)
/* 8B3EC 0018B2EC 2CD46324 */  addiu      $3, $3, %lo(D_1D3D42C)
/* 8B3F0 0018B2F0 21806400 */  addu       $16, $3, $4
/* 8B3F4 0018B2F4 0000048E */  lw         $4, 0x0($16)
/* 8B3F8 0018B2F8 04008010 */  beqz       $4, .L0018B30C
/* 8B3FC 0018B2FC 00000000 */   nop
/* 8B400 0018B300 68A0040C */  jal        DeleteReference__6CFrameFv
/* 8B404 0018B304 00000000 */   nop
/* 8B408 0018B308 000000AE */  sw         $0, 0x0($16)
.L0018B30C:
/* 8B40C 0018B30C 1000BF7B */  lq         $31, 0x10($sp)
/* 8B410 0018B310 0000B07B */  lq         $16, 0x0($sp)
/* 8B414 0018B314 2000BD27 */  addiu      $sp, $sp, 0x20
/* 8B418 0018B318 0800E003 */  jr         $31
/* 8B41C 0018B31C 00000000 */   nop
