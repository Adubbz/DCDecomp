.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdSetNameRegChara__Fi
/* 72DB0 00172CB0 788F84AF */  sw         $4, -0x7088($gp)
/* 72DB4 00172CB4 0800E003 */  jr         $31
/* 72DB8 00172CB8 00000000 */   nop
/* 72DBC 00172CBC 00000000 */  nop
