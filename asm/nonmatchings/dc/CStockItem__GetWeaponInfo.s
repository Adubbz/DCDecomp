.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetWeaponInfo__10CStockItemFiP11WEAPON_HAVE
/* 13F890 0023F790 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 13F894 0023F794 0000BF7F */  sq         $31, 0x0($sp)
/* 13F898 0023F798 40110500 */  sll        $2, $5, 5
/* 13F89C 0023F79C 23104500 */  subu       $2, $2, $5
/* 13F8A0 0023F7A0 C0100200 */  sll        $2, $2, 3
/* 13F8A4 0023F7A4 21108200 */  addu       $2, $4, $2
/* 13F8A8 0023F7A8 2826C070 */  paddub     $4, $6, $0
/* 13F8AC 0023F7AC F0004524 */  addiu      $5, $2, 0xF0
/* 13F8B0 0023F7B0 F8000624 */  addiu      $6, $0, 0xF8
/* 13F8B4 0023F7B4 EC0C040C */  jal        memcpy
/* 13F8B8 0023F7B8 00000000 */   nop
/* 13F8BC 0023F7BC 0000BF7B */  lq         $31, 0x0($sp)
/* 13F8C0 0023F7C0 1000BD27 */  addiu      $sp, $sp, 0x10
/* 13F8C4 0023F7C4 0800E003 */  jr         $31
/* 13F8C8 0023F7C8 00000000 */   nop
/* 13F8CC 0023F7CC 00000000 */  nop
