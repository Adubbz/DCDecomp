.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel strtok
/* 6B88 00106A88 2500023C */  lui        $2, (0x250000 >> 16)
/* 6B8C 00106A8C F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 6B90 00106A90 ECFD468C */  lw         $6, -0x214($2)
/* 6B94 00106A94 0000BFFF */  sd         $31, 0x0($sp)
/* 6B98 00106A98 AC1A040C */  jal        strtok_r
/* 6B9C 00106A9C 5C00C624 */   addiu     $6, $6, 0x5C
/* 6BA0 00106AA0 0000BFDF */  ld         $31, 0x0($sp)
/* 6BA4 00106AA4 0800E003 */  jr         $31
/* 6BA8 00106AA8 1000BD27 */   addiu     $sp, $sp, 0x10
/* 6BAC 00106AAC 00000000 */  nop
