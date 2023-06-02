.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _ADD_CAMERA_DIST__FP12RS_STACKDATAi
/* 921D0 001920D0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 921D4 001920D4 1000BF7F */  sq         $31, 0x10($sp)
/* 921D8 001920D8 0000B07F */  sq         $16, 0x0($sp)
/* 921DC 001920DC D401013C */  lui        $at, (0x1D40000 >> 16)
/* 921E0 001920E0 10D2308C */  lw         $16, -0x2DF0($at)
/* 921E4 001920E4 04000016 */  bnez       $16, .L001920F8
/* 921E8 001920E8 00000000 */   nop
/* 921EC 001920EC 28160070 */  paddub     $2, $0, $0
/* 921F0 001920F0 0B000010 */  b          .L00192120
/* 921F4 001920F4 00000000 */   nop
.L001920F8:
/* 921F8 001920F8 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 921FC 001920FC 00000000 */   nop
/* 92200 00192100 28260072 */  paddub     $4, $16, $0
/* 92204 00192104 06030046 */  mov.s      $f12, $f0
/* 92208 00192108 E492040C */  jal        AddDistance__13CCameraFollowFf
/* 9220C 0019210C 00000000 */   nop
/* 92210 00192110 28260072 */  paddub     $4, $16, $0
/* 92214 00192114 C092040C */  jal        FollowOn__13CCameraFollowFv
/* 92218 00192118 00000000 */   nop
/* 9221C 0019211C 01000224 */  addiu      $2, $0, 0x1
.L00192120:
/* 92220 00192120 1000BF7B */  lq         $31, 0x10($sp)
/* 92224 00192124 0000B07B */  lq         $16, 0x0($sp)
/* 92228 00192128 2000BD27 */  addiu      $sp, $sp, 0x20
/* 9222C 0019212C 0800E003 */  jr         $31
/* 92230 00192130 00000000 */   nop
/* 92234 00192134 00000000 */  nop
/* 92238 00192138 00000000 */  nop
/* 9223C 0019213C 00000000 */  nop
