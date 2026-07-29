.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdSetShopNo__Fi
/* 072DC0 00172CC0 748F84AF */  sw          $4, -0x708C($28)
/* 072DC4 00172CC4 0800E003 */  jr          $31
/* 072DC8 00172CC8 00000000 */   nop
/* 072DCC 00172CCC 00000000 */  nop
