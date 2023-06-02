.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetRotation__5CFishFPf
/* 141160 00241060 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 141164 00241064 0000BF7F */  sq         $31, 0x0($sp)
/* 141168 00241068 50128424 */  addiu      $4, $4, 0x1250
/* 14116C 0024106C A000998C */  lw         $25, 0xA0($4)
/* 141170 00241070 5800398F */  lw         $25, 0x58($25)
/* 141174 00241074 09F82003 */  jalr       $25
/* 141178 00241078 00000000 */   nop
/* 14117C 0024107C 0000BF7B */  lq         $31, 0x0($sp)
/* 141180 00241080 1000BD27 */  addiu      $sp, $sp, 0x10
/* 141184 00241084 0800E003 */  jr         $31
/* 141188 00241088 00000000 */   nop
/* 14118C 0024108C 00000000 */  nop
