.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetWeaponMsgNo2__Fi
/* 12A940 0022A840 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 12A944 0022A844 0000BF7F */  sq         $31, 0x0($sp)
/* 12A948 0022A848 7443070C */  jal        GetCommonItemInfo__Fi
/* 12A94C 0022A84C 00000000 */   nop
/* 12A950 0022A850 04004010 */  beqz       $2, .L0022A864
/* 12A954 0022A854 00000000 */   nop
/* 12A958 0022A858 06004284 */  lh         $2, 0x6($2)
/* 12A95C 0022A85C 02000010 */  b          .L0022A868
/* 12A960 0022A860 00000000 */   nop
.L0022A864:
/* 12A964 0022A864 28160070 */  paddub     $2, $0, $0
.L0022A868:
/* 12A968 0022A868 0000BF7B */  lq         $31, 0x0($sp)
/* 12A96C 0022A86C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 12A970 0022A870 0800E003 */  jr         $31
/* 12A974 0022A874 00000000 */   nop
/* 12A978 0022A878 00000000 */  nop
/* 12A97C 0022A87C 00000000 */  nop
