.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetNPC__Fi
/* 8B2C0 0018B1C0 06008004 */  bltz       $4, .L0018B1DC
/* 8B2C4 0018B1C4 00000000 */   nop
/* 8B2C8 0018B1C8 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8B2CC 0018B1CC C8D3228C */  lw         $2, -0x2C38($at)
/* 8B2D0 0018B1D0 2A108200 */  slt        $2, $4, $2
/* 8B2D4 0018B1D4 04004014 */  bnez       $2, .L0018B1E8
/* 8B2D8 0018B1D8 00000000 */   nop
.L0018B1DC:
/* 8B2DC 0018B1DC 28160070 */  paddub     $2, $0, $0
/* 8B2E0 0018B1E0 09000010 */  b          .L0018B208
/* 8B2E4 0018B1E4 00000000 */   nop
.L0018B1E8:
/* 8B2E8 0018B1E8 40110400 */  sll        $2, $4, 5
/* 8B2EC 0018B1EC 21184400 */  addu       $3, $2, $4
/* 8B2F0 0018B1F0 80100300 */  sll        $2, $3, 2
/* 8B2F4 0018B1F4 21106200 */  addu       $2, $3, $2
/* 8B2F8 0018B1F8 40190200 */  sll        $3, $2, 5
/* 8B2FC 0018B1FC D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8B300 0018B200 28D2228C */  lw         $2, -0x2DD8($at)
/* 8B304 0018B204 21104300 */  addu       $2, $2, $3
.L0018B208:
/* 8B308 0018B208 0800E003 */  jr         $31
/* 8B30C 0018B20C 00000000 */   nop
