.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel IsWeaponOptionGoodOrBad__Fi
/* 10F870 0020F770 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 10F874 0020F774 2900023C */  lui        $2, %hi(_1463)
/* 10F878 0020F778 603C4224 */  addiu      $2, $2, %lo(_1463)
/* 10F87C 0020F77C 0000A627 */  addiu      $6, $sp, 0x0
/* 10F880 0020F780 00004578 */  lq         $5, 0x0($2)
/* 10F884 0020F784 100043DC */  ld         $3, 0x10($2)
/* 10F888 0020F788 180042C4 */  lwc1       $f2, 0x18($2)
/* 10F88C 0020F78C 0000C57C */  sq         $5, 0x0($6)
/* 10F890 0020F790 1000C3FC */  sd         $3, 0x10($6)
/* 10F894 0020F794 1800C2E4 */  swc1       $f2, 0x18($6)
/* 10F898 0020F798 40100400 */  sll        $2, $4, 1
/* 10F89C 0020F79C 21105D00 */  addu       $2, $2, $sp
/* 10F8A0 0020F7A0 00004284 */  lh         $2, 0x0($2)
/* 10F8A4 0020F7A4 2000BD27 */  addiu      $sp, $sp, 0x20
/* 10F8A8 0020F7A8 0800E003 */  jr         $31
/* 10F8AC 0020F7AC 00000000 */   nop
