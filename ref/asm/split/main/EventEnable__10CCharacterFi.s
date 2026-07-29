.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EventEnable__10CCharacterFi
/* 038330 00138230 E40D85AC */  sw          $5, 0xDE4($4)
/* 038334 00138234 0800E003 */  jr          $31
/* 038338 00138238 00000000 */   nop
/* 03833C 0013823C 00000000 */  nop
