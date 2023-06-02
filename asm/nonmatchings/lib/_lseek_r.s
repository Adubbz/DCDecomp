.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _lseek_r
/* 2740 00102640 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 2744 00102644 0000B0FF */  sd         $16, 0x0($sp)
/* 2748 00102648 2D808000 */  daddu      $16, $4, $0
/* 274C 0010264C 1000B1FF */  sd         $17, 0x10($sp)
/* 2750 00102650 2D20A000 */  daddu      $4, $5, $0
/* 2754 00102654 DB01113C */  lui        $17, (0x1DB0000 >> 16)
/* 2758 00102658 2D28C000 */  daddu      $5, $6, $0
/* 275C 0010265C 2000BFFF */  sd         $31, 0x20($sp)
/* 2760 00102660 94BC20AE */  sw         $0, -0x436C($17)
/* 2764 00102664 5C52040C */  jal        lseek
/* 2768 00102668 2D30E000 */   daddu     $6, $7, $0
/* 276C 0010266C 2D184000 */  daddu      $3, $2, $0
/* 2770 00102670 FFFF0224 */  addiu      $2, $0, -0x1
/* 2774 00102674 05006214 */  bne        $3, $2, .L0010268C
/* 2778 00102678 2000BFDF */   ld        $31, 0x20($sp)
/* 277C 0010267C 94BC228E */  lw         $2, -0x436C($17)
/* 2780 00102680 02004054 */  bnel       $2, $0, .L0010268C
/* 2784 00102684 000002AE */   sw        $2, 0x0($16)
/* 2788 00102688 2000BFDF */  ld         $31, 0x20($sp)
.L0010268C:
/* 278C 0010268C 2D106000 */  daddu      $2, $3, $0
/* 2790 00102690 1000B1DF */  ld         $17, 0x10($sp)
/* 2794 00102694 0000B0DF */  ld         $16, 0x0($sp)
/* 2798 00102698 0800E003 */  jr         $31
/* 279C 0010269C 3000BD27 */   addiu     $sp, $sp, 0x30