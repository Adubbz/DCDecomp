.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _CAMERA_STEP__FP12RS_STACKDATAi
/* 92240 00192140 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 92244 00192144 1000BF7F */  sq         $31, 0x10($sp)
/* 92248 00192148 0000B07F */  sq         $16, 0x0($sp)
/* 9224C 0019214C D401013C */  lui        $at, (0x1D40000 >> 16)
/* 92250 00192150 10D2308C */  lw         $16, -0x2DF0($at)
/* 92254 00192154 04000016 */  bnez       $16, .L00192168
/* 92258 00192158 00000000 */   nop
/* 9225C 0019215C 01000224 */  addiu      $2, $0, 0x1
/* 92260 00192160 15000010 */  b          .L001921B8
/* 92264 00192164 00000000 */   nop
.L00192168:
/* 92268 00192168 4892848F */  lw         $4, -0x6DB8($gp)
/* 9226C 0019216C 11008010 */  beqz       $4, .L001921B4
/* 92270 00192170 00000000 */   nop
/* 92274 00192174 2000A527 */  addiu      $5, $sp, 0x20
/* 92278 00192178 A000998C */  lw         $25, 0xA0($4)
/* 9227C 0019217C A000398F */  lw         $25, 0xA0($25)
/* 92280 00192180 09F82003 */  jalr       $25
/* 92284 00192184 00000000 */   nop
/* 92288 00192188 4892828F */  lw         $2, -0x6DB8($gp)
/* 9228C 0019218C 508181C7 */  lwc1       $f1, -0x7EB0($gp)
/* 92290 00192190 B40040C4 */  lwc1       $f0, 0xB4($2)
/* 92294 00192194 42080046 */  mul.s      $f1, $f1, $f0
/* 92298 00192198 2400A0C7 */  lwc1       $f0, 0x24($sp)
/* 9229C 0019219C 40030146 */  add.s      $f13, $f0, $f1
/* 922A0 001921A0 28260072 */  paddub     $4, $16, $0
/* 922A4 001921A4 2000ACC7 */  lwc1       $f12, 0x20($sp)
/* 922A8 001921A8 2800AEC7 */  lwc1       $f14, 0x28($sp)
/* 922AC 001921AC B892040C */  jal        SetFollow__13CCameraFollowFfff
/* 922B0 001921B0 00000000 */   nop
.L001921B4:
/* 922B4 001921B4 01000224 */  addiu      $2, $0, 0x1
.L001921B8:
/* 922B8 001921B8 1000BF7B */  lq         $31, 0x10($sp)
/* 922BC 001921BC 0000B07B */  lq         $16, 0x0($sp)
/* 922C0 001921C0 3000BD27 */  addiu      $sp, $sp, 0x30
/* 922C4 001921C4 0800E003 */  jr         $31
/* 922C8 001921C8 00000000 */   nop
/* 922CC 001921CC 00000000 */  nop
