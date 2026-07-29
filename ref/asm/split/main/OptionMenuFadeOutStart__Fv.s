.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel OptionMenuFadeOutStart__Fv
/* 11FBE0 0021FAE0 28160070 */  paddub      $2, $0, $0
/* 11FBE4 0021FAE4 DB01013C */  lui         $1, %hi(OptionMenu + 0x10)
/* 11FBE8 0021FAE8 508A248C */  lw          $4, %lo(OptionMenu + 0x10)($1)
/* 11FBEC 0021FAEC 02000324 */  addiu       $3, $0, 0x2
/* 11FBF0 0021FAF0 02008314 */  bne         $4, $3, .L0021FAFC
/* 11FBF4 0021FAF4 00000000 */   nop
/* 11FBF8 0021FAF8 01000224 */  addiu       $2, $0, 0x1
.L0021FAFC:
/* 11FBFC 0021FAFC 0800E003 */  jr          $31
/* 11FC00 0021FB00 00000000 */   nop
/* 11FC04 0021FB04 00000000 */  nop
/* 11FC08 0021FB08 00000000 */  nop
/* 11FC0C 0021FB0C 00000000 */  nop
