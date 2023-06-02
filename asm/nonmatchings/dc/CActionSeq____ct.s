.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__10CActionSeqFv
/* 54C80 00154B80 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 54C84 00154B84 1000BF7F */  sq         $31, 0x10($sp)
/* 54C88 00154B88 0000B07F */  sq         $16, 0x0($sp)
/* 54C8C 00154B8C 28868070 */  paddub     $16, $4, $0
/* 54C90 00154B90 282E0070 */  paddub     $5, $0, $0
/* 54C94 00154B94 28360070 */  paddub     $6, $0, $0
/* 54C98 00154B98 CC52050C */  jal        Initialize__10CActionSeqFP7ACT_SEQi
/* 54C9C 00154B9C 00000000 */   nop
/* 54CA0 00154BA0 28160072 */  paddub     $2, $16, $0
/* 54CA4 00154BA4 1000BF7B */  lq         $31, 0x10($sp)
/* 54CA8 00154BA8 0000B07B */  lq         $16, 0x0($sp)
/* 54CAC 00154BAC 2000BD27 */  addiu      $sp, $sp, 0x20
/* 54CB0 00154BB0 0800E003 */  jr         $31
/* 54CB4 00154BB4 00000000 */   nop
/* 54CB8 00154BB8 00000000 */  nop
/* 54CBC 00154BBC 00000000 */  nop
