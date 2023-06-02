.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel IconMoveTarSet__12ShopIconMoveFiiiP13MENU_ITEMDATAffi
/* E6A30 001E6930 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* E6A34 001E6934 2000BF7F */  sq         $31, 0x20($sp)
/* E6A38 001E6938 1000B07F */  sq         $16, 0x10($sp)
/* E6A3C 001E693C 0400B5E7 */  swc1       $f21, 0x4($sp)
/* E6A40 001E6940 0000B4E7 */  swc1       $f20, 0x0($sp)
/* E6A44 001E6944 28868070 */  paddub     $16, $4, $0
/* E6A48 001E6948 46650046 */  mov.s      $f21, $f12
/* E6A4C 001E694C 066D0046 */  mov.s      $f20, $f13
/* E6A50 001E6950 000089A4 */  sh         $9, 0x0($4)
/* E6A54 001E6954 100087A4 */  sh         $7, 0x10($4)
/* E6A58 001E6958 040085A4 */  sh         $5, 0x4($4)
/* E6A5C 001E695C 060086A4 */  sh         $6, 0x6($4)
/* E6A60 001E6960 14000426 */  addiu      $4, $16, 0x14
/* E6A64 001E6964 282E0071 */  paddub     $5, $8, $0
/* E6A68 001E6968 F8000624 */  addiu      $6, $0, 0xF8
/* E6A6C 001E696C EC0C040C */  jal        memcpy
/* E6A70 001E6970 00000000 */   nop
/* E6A74 001E6974 080015E6 */  swc1       $f21, 0x8($16)
/* E6A78 001E6978 0C0014E6 */  swc1       $f20, 0xC($16)
/* E6A7C 001E697C 2000BF7B */  lq         $31, 0x20($sp)
/* E6A80 001E6980 1000B07B */  lq         $16, 0x10($sp)
/* E6A84 001E6984 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* E6A88 001E6988 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* E6A8C 001E698C 3000BD27 */  addiu      $sp, $sp, 0x30
/* E6A90 001E6990 0800E003 */  jr         $31
/* E6A94 001E6994 00000000 */   nop
/* E6A98 001E6998 00000000 */  nop
/* E6A9C 001E699C 00000000 */  nop
