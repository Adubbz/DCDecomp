.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel printf
/* 4798 00104698 70FFBD27 */  addiu      $sp, $sp, -0x90
/* 479C 0010469C 25000C3C */  lui        $12, (0x250000 >> 16)
/* 47A0 001046A0 5800A5FF */  sd         $5, 0x58($sp)
/* 47A4 001046A4 6000A6FF */  sd         $6, 0x60($sp)
/* 47A8 001046A8 2D288000 */  daddu      $5, $4, $0
/* 47AC 001046AC 0000BFFF */  sd         $31, 0x0($sp)
/* 47B0 001046B0 5800A627 */  addiu      $6, $sp, 0x58
/* 47B4 001046B4 6800A7FF */  sd         $7, 0x68($sp)
/* 47B8 001046B8 7000A8FF */  sd         $8, 0x70($sp)
/* 47BC 001046BC 7800A9FF */  sd         $9, 0x78($sp)
/* 47C0 001046C0 8000AAFF */  sd         $10, 0x80($sp)
/* 47C4 001046C4 8800ABFF */  sd         $11, 0x88($sp)
/* 47C8 001046C8 ECFD828D */  lw         $2, -0x214($12)
/* 47CC 001046CC 0800438C */  lw         $3, 0x8($2)
/* 47D0 001046D0 540062AC */  sw         $2, 0x54($3)
/* 47D4 001046D4 021F040C */  jal        vfprintf
/* 47D8 001046D8 0800448C */   lw        $4, 0x8($2)
/* 47DC 001046DC 0000BFDF */  ld         $31, 0x0($sp)
/* 47E0 001046E0 0800E003 */  jr         $31
/* 47E4 001046E4 9000BD27 */   addiu     $sp, $sp, 0x90
