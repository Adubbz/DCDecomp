.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
/* 5D570 0015D470 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 5D574 0015D474 0000BF7F */  sq         $31, 0x0($sp)
/* 5D578 0015D478 1C00A227 */  addiu      $2, $sp, 0x1C
/* 5D57C 0015D47C FC8680C7 */  lwc1       $f0, -0x7904($gp)
/* 5D580 0015D480 000040E4 */  swc1       $f0, 0x0($2)
/* 5D584 0015D484 1F00ABA3 */  sb         $11, 0x1F($sp)
/* 5D588 0015D488 285E4070 */  paddub     $11, $2, $0
/* 5D58C 0015D48C 2C75050C */  jal        set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiP6spRGBA
/* 5D590 0015D490 00000000 */   nop
/* 5D594 0015D494 0000BF7B */  lq         $31, 0x0($sp)
/* 5D598 0015D498 2000BD27 */  addiu      $sp, $sp, 0x20
/* 5D59C 0015D49C 0800E003 */  jr         $31
/* 5D5A0 0015D4A0 00000000 */   nop
/* 5D5A4 0015D4A4 00000000 */  nop
/* 5D5A8 0015D4A8 00000000 */  nop
/* 5D5AC 0015D4AC 00000000 */  nop
