.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WeaponMenuKastumSelectDown__Fii
/* FDFD0 001FDED0 28160070 */  paddub     $2, $0, $0
/* FDFD4 001FDED4 0B000010 */  b          .L001FDF04
/* FDFD8 001FDED8 00000000 */   nop
.L001FDEDC:
/* FDFDC 001FDEDC FDFF8624 */  addiu      $6, $4, -0x3
/* FDFE0 001FDEE0 01000324 */  addiu      $3, $0, 0x1
/* FDFE4 001FDEE4 0418C300 */  sllv       $3, $3, $6
/* FDFE8 001FDEE8 2418A300 */  and        $3, $5, $3
/* FDFEC 001FDEEC 04006010 */  beqz       $3, .L001FDF00
/* FDFF0 001FDEF0 00000000 */   nop
/* FDFF4 001FDEF4 28168070 */  paddub     $2, $4, $0
/* FDFF8 001FDEF8 05000010 */  b          .L001FDF10
/* FDFFC 001FDEFC 00000000 */   nop
.L001FDF00:
/* FE000 001FDF00 01008424 */  addiu      $4, $4, 0x1
.L001FDF04:
/* FE004 001FDF04 07008128 */  slti       $at, $4, 0x7
/* FE008 001FDF08 F4FF2014 */  bnez       $at, .L001FDEDC
/* FE00C 001FDF0C 00000000 */   nop
.L001FDF10:
/* FE010 001FDF10 0800E003 */  jr         $31
/* FE014 001FDF14 00000000 */   nop
/* FE018 001FDF18 00000000 */  nop
/* FE01C 001FDF1C 00000000 */  nop
