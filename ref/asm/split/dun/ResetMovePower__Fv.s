.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ResetMovePower__Fv
/* 015700 01DC1400 DC01013C */  lui         $1, %hi(BtActStatus + 0x110)
/* 015704 01DC1404 904520AC */  sw          $0, %lo(BtActStatus + 0x110)($1)
/* 015708 01DC1408 DC01013C */  lui         $1, %hi(BtActStatus + 0x114)
/* 01570C 01DC140C 944520AC */  sw          $0, %lo(BtActStatus + 0x114)($1)
/* 015710 01DC1410 0800E003 */  jr          $31
/* 015714 01DC1414 00000000 */   nop
/* 015718 01DC1418 00000000 */  nop
/* 01571C 01DC141C 00000000 */  nop
