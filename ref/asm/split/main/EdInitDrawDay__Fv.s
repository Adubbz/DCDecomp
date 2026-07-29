.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdInitDrawDay__Fv
/* 07D130 0017D030 B49180AF */  sw          $0, -0x6E4C($28)
/* 07D134 0017D034 B89180AF */  sw          $0, -0x6E48($28)
/* 07D138 0017D038 0800E003 */  jr          $31
/* 07D13C 0017D03C 00000000 */   nop
