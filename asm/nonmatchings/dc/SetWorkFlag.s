.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetWorkFlag__Fii
/* 8A3D0 0018A2D0 04008004 */  bltz       $4, .L0018A2E4
/* 8A3D4 0018A2D4 00000000 */   nop
/* 8A3D8 0018A2D8 20008228 */  slti       $2, $4, 0x20
/* 8A3DC 0018A2DC 04004014 */  bnez       $2, .L0018A2F0
/* 8A3E0 0018A2E0 00000000 */   nop
.L0018A2E4:
/* 8A3E4 0018A2E4 28160070 */  paddub     $2, $0, $0
/* 8A3E8 0018A2E8 07000010 */  b          .L0018A308
/* 8A3EC 0018A2EC 00000000 */   nop
.L0018A2F0:
/* 8A3F0 0018A2F0 80180400 */  sll        $3, $4, 2
/* 8A3F4 0018A2F4 D401023C */  lui        $2, %hi(work_flag)
/* 8A3F8 0018A2F8 90EF4224 */  addiu      $2, $2, %lo(work_flag)
/* 8A3FC 0018A2FC 21104300 */  addu       $2, $2, $3
/* 8A400 0018A300 000045AC */  sw         $5, 0x0($2)
/* 8A404 0018A304 01000224 */  addiu      $2, $0, 0x1
.L0018A308:
/* 8A408 0018A308 0800E003 */  jr         $31
/* 8A40C 0018A30C 00000000 */   nop
