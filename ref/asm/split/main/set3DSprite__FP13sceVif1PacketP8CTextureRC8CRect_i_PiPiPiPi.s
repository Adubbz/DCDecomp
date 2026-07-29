.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
/* 05D570 0015D470 E0FFBD27 */  addiu       $29, $29, -0x20
/* 05D574 0015D474 0000BF7F */  sq          $31, 0x0($29)
/* 05D578 0015D478 1C00A227 */  addiu       $2, $29, 0x1C
/* 05D57C 0015D47C FC8680C7 */  lwc1        $f0, -0x7904($28)
/* 05D580 0015D480 000040E4 */  swc1        $f0, 0x0($2)
/* 05D584 0015D484 1F00ABA3 */  sb          $11, 0x1F($29)
/* 05D588 0015D488 285E4070 */  paddub      $11, $2, $0
/* 05D58C 0015D48C 2C75050C */  jal         set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiP6spRGBA
/* 05D590 0015D490 00000000 */   nop
/* 05D594 0015D494 0000BF7B */  lq          $31, 0x0($29)
/* 05D598 0015D498 2000BD27 */  addiu       $29, $29, 0x20
/* 05D59C 0015D49C 0800E003 */  jr          $31
/* 05D5A0 0015D4A0 00000000 */   nop
/* 05D5A4 0015D4A4 00000000 */  nop
/* 05D5A8 0015D4A8 00000000 */  nop
/* 05D5AC 0015D4AC 00000000 */  nop
