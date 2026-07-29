.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdSetNameRegChara__Fi
/* 072DB0 00172CB0 788F84AF */  sw          $4, -0x7088($28)
/* 072DB4 00172CB4 0800E003 */  jr          $31
/* 072DB8 00172CB8 00000000 */   nop
/* 072DBC 00172CBC 00000000 */  nop
