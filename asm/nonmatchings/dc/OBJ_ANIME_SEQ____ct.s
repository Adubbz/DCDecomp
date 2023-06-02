.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__13OBJ_ANIME_SEQFv
/* 65DB0 00165CB0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 65DB4 00165CB4 1000BF7F */  sq         $31, 0x10($sp)
/* 65DB8 00165CB8 0000B07F */  sq         $16, 0x0($sp)
/* 65DBC 00165CBC 28868070 */  paddub     $16, $4, $0
/* 65DC0 00165CC0 2497050C */  jal        Initialize__13OBJ_ANIME_SEQFv
/* 65DC4 00165CC4 00000000 */   nop
/* 65DC8 00165CC8 28160072 */  paddub     $2, $16, $0
/* 65DCC 00165CCC 1000BF7B */  lq         $31, 0x10($sp)
/* 65DD0 00165CD0 0000B07B */  lq         $16, 0x0($sp)
/* 65DD4 00165CD4 2000BD27 */  addiu      $sp, $sp, 0x20
/* 65DD8 00165CD8 0800E003 */  jr         $31
/* 65DDC 00165CDC 00000000 */   nop
