.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __ct__13OBJ_ANIME_SEQFv
/* 065DB0 00165CB0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 065DB4 00165CB4 1000BF7F */  sq          $31, 0x10($29)
/* 065DB8 00165CB8 0000B07F */  sq          $16, 0x0($29)
/* 065DBC 00165CBC 28868070 */  paddub      $16, $4, $0
/* 065DC0 00165CC0 2497050C */  jal         Initialize__13OBJ_ANIME_SEQFv
/* 065DC4 00165CC4 00000000 */   nop
/* 065DC8 00165CC8 28160072 */  paddub      $2, $16, $0
/* 065DCC 00165CCC 1000BF7B */  lq          $31, 0x10($29)
/* 065DD0 00165CD0 0000B07B */  lq          $16, 0x0($29)
/* 065DD4 00165CD4 2000BD27 */  addiu       $29, $29, 0x20
/* 065DD8 00165CD8 0800E003 */  jr          $31
/* 065DDC 00165CDC 00000000 */   nop
