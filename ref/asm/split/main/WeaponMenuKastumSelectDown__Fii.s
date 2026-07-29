.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel WeaponMenuKastumSelectDown__Fii
/* 0FDFD0 001FDED0 28160070 */  paddub      $2, $0, $0
/* 0FDFD4 001FDED4 0B000010 */  b           .L001FDF04
/* 0FDFD8 001FDED8 00000000 */   nop
.L001FDEDC:
/* 0FDFDC 001FDEDC FDFF8624 */  addiu       $6, $4, -0x3
/* 0FDFE0 001FDEE0 01000324 */  addiu       $3, $0, 0x1
/* 0FDFE4 001FDEE4 0418C300 */  sllv        $3, $3, $6
/* 0FDFE8 001FDEE8 2418A300 */  and         $3, $5, $3
/* 0FDFEC 001FDEEC 04006010 */  beqz        $3, .L001FDF00
/* 0FDFF0 001FDEF0 00000000 */   nop
/* 0FDFF4 001FDEF4 28168070 */  paddub      $2, $4, $0
/* 0FDFF8 001FDEF8 05000010 */  b           .L001FDF10
/* 0FDFFC 001FDEFC 00000000 */   nop
.L001FDF00:
/* 0FE000 001FDF00 01008424 */  addiu       $4, $4, 0x1
.L001FDF04:
/* 0FE004 001FDF04 07008128 */  slti        $1, $4, 0x7
/* 0FE008 001FDF08 F4FF2014 */  bnez        $1, .L001FDEDC
/* 0FE00C 001FDF0C 00000000 */   nop
.L001FDF10:
/* 0FE010 001FDF10 0800E003 */  jr          $31
/* 0FE014 001FDF14 00000000 */   nop
/* 0FE018 001FDF18 00000000 */  nop
/* 0FE01C 001FDF1C 00000000 */  nop
