.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_CURRENT_DIR__FP12RS_STACKDATAi
/* 8C350 0018C250 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 8C354 0018C254 0000BF7F */  sq         $31, 0x0($sp)
/* 8C358 0018C258 F428060C */  jal        GetStackString__FP12RS_STACKDATA
/* 8C35C 0018C25C 00000000 */   nop
/* 8C360 0018C260 04004014 */  bnez       $2, .L0018C274
/* 8C364 0018C264 00000000 */   nop
/* 8C368 0018C268 28160070 */  paddub     $2, $0, $0
/* 8C36C 0018C26C 07000010 */  b          .L0018C28C
/* 8C370 0018C270 00000000 */   nop
.L0018C274:
/* 8C374 0018C274 D401033C */  lui        $3, %hi(CurrentDir_3)
/* 8C378 0018C278 A0EE6424 */  addiu      $4, $3, %lo(CurrentDir_3)
/* 8C37C 0018C27C 282E4070 */  paddub     $5, $2, $0
/* 8C380 0018C280 5A15040C */  jal        strcpy
/* 8C384 0018C284 00000000 */   nop
/* 8C388 0018C288 01000224 */  addiu      $2, $0, 0x1
.L0018C28C:
/* 8C38C 0018C28C 0000BF7B */  lq         $31, 0x0($sp)
/* 8C390 0018C290 1000BD27 */  addiu      $sp, $sp, 0x10
/* 8C394 0018C294 0800E003 */  jr         $31
/* 8C398 0018C298 00000000 */   nop
/* 8C39C 0018C29C 00000000 */  nop
