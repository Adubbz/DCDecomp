.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel check_stack__10CRunScriptFv
/* 13DA80 0023D980 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 13DA84 0023D984 0000BF7F */  sq         $31, 0x0($sp)
/* 13DA88 0023D988 1000858C */  lw         $5, 0x10($4)
/* 13DA8C 0023D98C 1400838C */  lw         $3, 0x14($4)
/* 13DA90 0023D990 2B18A300 */  sltu       $3, $5, $3
/* 13DA94 0023D994 03006014 */  bnez       $3, .L0023D9A4
/* 13DA98 0023D998 00000000 */   nop
/* 13DA9C 0023D99C C4F5080C */  jal        stkoverflow__Fv
/* 13DAA0 0023D9A0 00000000 */   nop
.L0023D9A4:
/* 13DAA4 0023D9A4 0000BF7B */  lq         $31, 0x0($sp)
/* 13DAA8 0023D9A8 1000BD27 */  addiu      $sp, $sp, 0x10
/* 13DAAC 0023D9AC 0800E003 */  jr         $31
/* 13DAB0 0023D9B0 00000000 */   nop
/* 13DAB4 0023D9B4 00000000 */  nop
/* 13DAB8 0023D9B8 00000000 */  nop
/* 13DABC 0023D9BC 00000000 */  nop
