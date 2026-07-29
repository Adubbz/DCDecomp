.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdDrawOnAll__Fv
/* 078230 00178130 6C9080AF */  sw          $0, -0x6F94($28)
/* 078234 00178134 0800E003 */  jr          $31
/* 078238 00178138 00000000 */   nop
/* 07823C 0017813C 00000000 */  nop
