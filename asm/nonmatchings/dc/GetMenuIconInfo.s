.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetMenuIconInfo__Fi
/* 12E040 0022DF40 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 12E044 0022DF44 1000BF7F */  sq         $31, 0x10($sp)
/* 12E048 0022DF48 0000B07F */  sq         $16, 0x0($sp)
/* 12E04C 0022DF4C 28868070 */  paddub     $16, $4, $0
/* 12E050 0022DF50 80AE080C */  jal        GetMenuLangFlag__Fv
/* 12E054 0022DF54 00000000 */   nop
/* 12E058 0022DF58 C0180200 */  sll        $3, $2, 3
/* 12E05C 0022DF5C 23186200 */  subu       $3, $3, $2
/* 12E060 0022DF60 80100300 */  sll        $2, $3, 2
/* 12E064 0022DF64 21106200 */  addu       $2, $3, $2
/* 12E068 0022DF68 00190200 */  sll        $3, $2, 4
/* 12E06C 0022DF6C 2900023C */  lui        $2, %hi(MenuIcon)
/* 12E070 0022DF70 A0454224 */  addiu      $2, $2, %lo(MenuIcon)
/* 12E074 0022DF74 21184300 */  addu       $3, $2, $3
/* 12E078 0022DF78 80101000 */  sll        $2, $16, 2
/* 12E07C 0022DF7C 21105000 */  addu       $2, $2, $16
/* 12E080 0022DF80 C0100200 */  sll        $2, $2, 3
/* 12E084 0022DF84 21104300 */  addu       $2, $2, $3
/* 12E088 0022DF88 1000BF7B */  lq         $31, 0x10($sp)
/* 12E08C 0022DF8C 0000B07B */  lq         $16, 0x0($sp)
/* 12E090 0022DF90 2000BD27 */  addiu      $sp, $sp, 0x20
/* 12E094 0022DF94 0800E003 */  jr         $31
/* 12E098 0022DF98 00000000 */   nop
/* 12E09C 0022DF9C 00000000 */  nop
