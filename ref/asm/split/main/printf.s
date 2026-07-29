.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel printf
/* 004798 00104698 70FFBD27 */  addiu       $29, $29, -0x90
/* 00479C 0010469C 25000C3C */  lui         $12, %hi(_impure_ptr)
/* 0047A0 001046A0 5800A5FF */  sd          $5, 0x58($29)
/* 0047A4 001046A4 6000A6FF */  sd          $6, 0x60($29)
/* 0047A8 001046A8 2D288000 */  daddu       $5, $4, $0
/* 0047AC 001046AC 0000BFFF */  sd          $31, 0x0($29)
/* 0047B0 001046B0 5800A627 */  addiu       $6, $29, 0x58
/* 0047B4 001046B4 6800A7FF */  sd          $7, 0x68($29)
/* 0047B8 001046B8 7000A8FF */  sd          $8, 0x70($29)
/* 0047BC 001046BC 7800A9FF */  sd          $9, 0x78($29)
/* 0047C0 001046C0 8000AAFF */  sd          $10, 0x80($29)
/* 0047C4 001046C4 8800ABFF */  sd          $11, 0x88($29)
/* 0047C8 001046C8 ECFD828D */  lw          $2, %lo(_impure_ptr)($12)
/* 0047CC 001046CC 0800438C */  lw          $3, 0x8($2)
/* 0047D0 001046D0 540062AC */  sw          $2, 0x54($3)
/* 0047D4 001046D4 021F040C */  jal         vfprintf
/* 0047D8 001046D8 0800448C */   lw         $4, 0x8($2)
/* 0047DC 001046DC 0000BFDF */  ld          $31, 0x0($29)
/* 0047E0 001046E0 0800E003 */  jr          $31
/* 0047E4 001046E4 9000BD27 */   addiu      $29, $29, 0x90
