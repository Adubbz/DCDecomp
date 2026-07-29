.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GOTO_FISH_RANKING__FP12RS_STACKDATAi
/* 08C2A0 0018C1A0 0A000224 */  addiu       $2, $0, 0xA
/* 08C2A4 0018C1A4 289282AF */  sw          $2, -0x6DD8($28)
/* 08C2A8 0018C1A8 01000224 */  addiu       $2, $0, 0x1
/* 08C2AC 0018C1AC 0800E003 */  jr          $31
/* 08C2B0 0018C1B0 00000000 */   nop
/* 08C2B4 0018C1B4 00000000 */  nop
/* 08C2B8 0018C1B8 00000000 */  nop
/* 08C2BC 0018C1BC 00000000 */  nop
