.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel strtol
/* 6E88 00106D88 2D408000 */  daddu      $8, $4, $0
/* 6E8C 00106D8C 2500023C */  lui        $2, (0x250000 >> 16)
/* 6E90 00106D90 2D18A000 */  daddu      $3, $5, $0
/* 6E94 00106D94 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 6E98 00106D98 2D38C000 */  daddu      $7, $6, $0
/* 6E9C 00106D9C ECFD448C */  lw         $4, -0x214($2)
/* 6EA0 00106DA0 0000BFFF */  sd         $31, 0x0($sp)
/* 6EA4 00106DA4 2D280001 */  daddu      $5, $8, $0
/* 6EA8 00106DA8 D41A040C */  jal        _strtol_r
/* 6EAC 00106DAC 2D306000 */   daddu     $6, $3, $0
/* 6EB0 00106DB0 0000BFDF */  ld         $31, 0x0($sp)
/* 6EB4 00106DB4 0800E003 */  jr         $31
/* 6EB8 00106DB8 1000BD27 */   addiu     $sp, $sp, 0x10
/* 6EBC 00106DBC 00000000 */  nop
