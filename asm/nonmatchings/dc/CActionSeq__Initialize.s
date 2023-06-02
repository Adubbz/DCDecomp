.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Initialize__10CActionSeqFP7ACT_SEQi
/* 54C30 00154B30 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 54C34 00154B34 3000BF7F */  sq         $31, 0x30($sp)
/* 54C38 00154B38 2000B27F */  sq         $18, 0x20($sp)
/* 54C3C 00154B3C 1000B17F */  sq         $17, 0x10($sp)
/* 54C40 00154B40 0000B07F */  sq         $16, 0x0($sp)
/* 54C44 00154B44 28968070 */  paddub     $18, $4, $0
/* 54C48 00154B48 288EA070 */  paddub     $17, $5, $0
/* 54C4C 00154B4C 2886C070 */  paddub     $16, $6, $0
/* 54C50 00154B50 F052050C */  jal        ClearSeq__10CActionSeqFv
/* 54C54 00154B54 00000000 */   nop
/* 54C58 00154B58 C80051AE */  sw         $17, 0xC8($18)
/* 54C5C 00154B5C C40050AE */  sw         $16, 0xC4($18)
/* 54C60 00154B60 3000BF7B */  lq         $31, 0x30($sp)
/* 54C64 00154B64 2000B27B */  lq         $18, 0x20($sp)
/* 54C68 00154B68 1000B17B */  lq         $17, 0x10($sp)
/* 54C6C 00154B6C 0000B07B */  lq         $16, 0x0($sp)
/* 54C70 00154B70 4000BD27 */  addiu      $sp, $sp, 0x40
/* 54C74 00154B74 0800E003 */  jr         $31
/* 54C78 00154B78 00000000 */   nop
/* 54C7C 00154B7C 00000000 */  nop
