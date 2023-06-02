.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SaveMenuEffectFadeOut__Fv
/* 122A10 00222910 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 122A14 00222914 D48A238C */  lw         $3, -0x752C($at)
/* 122A18 00222918 01000224 */  addiu      $2, $0, 0x1
/* 122A1C 0022291C 03006214 */  bne        $3, $2, .L0022292C
/* 122A20 00222920 00000000 */   nop
/* 122A24 00222924 02000010 */  b          .L00222930
/* 122A28 00222928 00000000 */   nop
.L0022292C:
/* 122A2C 0022292C 28160070 */  paddub     $2, $0, $0
.L00222930:
/* 122A30 00222930 0800E003 */  jr         $31
/* 122A34 00222934 00000000 */   nop
/* 122A38 00222938 00000000 */  nop
/* 122A3C 0022293C 00000000 */  nop
