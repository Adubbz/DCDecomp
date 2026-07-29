.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _ADD_CAMERA_DIST__FP12RS_STACKDATAi
/* 0921D0 001920D0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0921D4 001920D4 1000BF7F */  sq          $31, 0x10($29)
/* 0921D8 001920D8 0000B07F */  sq          $16, 0x0($29)
/* 0921DC 001920DC D401013C */  lui         $1, %hi(EdEventInfo + 0x40)
/* 0921E0 001920E0 10D2308C */  lw          $16, %lo(EdEventInfo + 0x40)($1)
/* 0921E4 001920E4 04000016 */  bnez        $16, .L001920F8
/* 0921E8 001920E8 00000000 */   nop
/* 0921EC 001920EC 28160070 */  paddub      $2, $0, $0
/* 0921F0 001920F0 0B000010 */  b           .L00192120
/* 0921F4 001920F4 00000000 */   nop
.L001920F8:
/* 0921F8 001920F8 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 0921FC 001920FC 00000000 */   nop
/* 092200 00192100 28260072 */  paddub      $4, $16, $0
/* 092204 00192104 06030046 */  mov.s       $f12, $f0
/* 092208 00192108 E492040C */  jal         AddDistance__13CCameraFollowFf
/* 09220C 0019210C 00000000 */   nop
/* 092210 00192110 28260072 */  paddub      $4, $16, $0
/* 092214 00192114 C092040C */  jal         FollowOn__13CCameraFollowFv
/* 092218 00192118 00000000 */   nop
/* 09221C 0019211C 01000224 */  addiu       $2, $0, 0x1
.L00192120:
/* 092220 00192120 1000BF7B */  lq          $31, 0x10($29)
/* 092224 00192124 0000B07B */  lq          $16, 0x0($29)
/* 092228 00192128 2000BD27 */  addiu       $29, $29, 0x20
/* 09222C 0019212C 0800E003 */  jr          $31
/* 092230 00192130 00000000 */   nop
/* 092234 00192134 00000000 */  nop
/* 092238 00192138 00000000 */  nop
/* 09223C 0019213C 00000000 */  nop
