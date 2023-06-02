.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__13CTextureBlockFv
/* 31060 00130F60 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 31064 00130F64 1000BF7F */  sq         $31, 0x10($sp)
/* 31068 00130F68 0000B07F */  sq         $16, 0x0($sp)
/* 3106C 00130F6C 28868070 */  paddub     $16, $4, $0
/* 31070 00130F70 E4C3040C */  jal        Initialize__13CTextureBlockFv
/* 31074 00130F74 00000000 */   nop
/* 31078 00130F78 28160072 */  paddub     $2, $16, $0
/* 3107C 00130F7C 1000BF7B */  lq         $31, 0x10($sp)
/* 31080 00130F80 0000B07B */  lq         $16, 0x0($sp)
/* 31084 00130F84 2000BD27 */  addiu      $sp, $sp, 0x20
/* 31088 00130F88 0800E003 */  jr         $31
/* 3108C 00130F8C 00000000 */   nop
