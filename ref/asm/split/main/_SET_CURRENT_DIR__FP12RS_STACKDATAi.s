.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_CURRENT_DIR__FP12RS_STACKDATAi
/* 08C350 0018C250 F0FFBD27 */  addiu       $29, $29, -0x10
/* 08C354 0018C254 0000BF7F */  sq          $31, 0x0($29)
/* 08C358 0018C258 F428060C */  jal         GetStackString__FP12RS_STACKDATA
/* 08C35C 0018C25C 00000000 */   nop
/* 08C360 0018C260 04004014 */  bnez        $2, .L0018C274
/* 08C364 0018C264 00000000 */   nop
/* 08C368 0018C268 28160070 */  paddub      $2, $0, $0
/* 08C36C 0018C26C 07000010 */  b           .L0018C28C
/* 08C370 0018C270 00000000 */   nop
.L0018C274:
/* 08C374 0018C274 D401033C */  lui         $3, %hi(CurrentDir__4)
/* 08C378 0018C278 A0EE6424 */  addiu       $4, $3, %lo(CurrentDir__4)
/* 08C37C 0018C27C 282E4070 */  paddub      $5, $2, $0
/* 08C380 0018C280 5A15040C */  jal         strcpy
/* 08C384 0018C284 00000000 */   nop
/* 08C388 0018C288 01000224 */  addiu       $2, $0, 0x1
.L0018C28C:
/* 08C38C 0018C28C 0000BF7B */  lq          $31, 0x0($29)
/* 08C390 0018C290 1000BD27 */  addiu       $29, $29, 0x10
/* 08C394 0018C294 0800E003 */  jr          $31
/* 08C398 0018C298 00000000 */   nop
/* 08C39C 0018C29C 00000000 */  nop
