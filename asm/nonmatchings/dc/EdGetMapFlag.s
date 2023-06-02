.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdGetMapFlag__Fi
/* 78150 00178050 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 78154 00178054 0000BF7F */  sq         $31, 0x0($sp)
/* 78158 00178058 28368070 */  paddub     $6, $4, $0
/* 7815C 0017805C 0400C01C */  bgtz       $6, .L00178070
/* 78160 00178060 00000000 */   nop
/* 78164 00178064 28160070 */  paddub     $2, $0, $0
/* 78168 00178068 05000010 */  b          .L00178080
/* 7816C 0017806C 00000000 */   nop
.L00178070:
/* 78170 00178070 1C8D848F */  lw         $4, -0x72E4($gp)
/* 78174 00178074 288D858F */  lw         $5, -0x72D8($gp)
/* 78178 00178078 E860050C */  jal        GetMapFlag__9CSaveDataFii
/* 7817C 0017807C 00000000 */   nop
.L00178080:
/* 78180 00178080 0000BF7B */  lq         $31, 0x0($sp)
/* 78184 00178084 1000BD27 */  addiu      $sp, $sp, 0x10
/* 78188 00178088 0800E003 */  jr         $31
/* 7818C 0017808C 00000000 */   nop
