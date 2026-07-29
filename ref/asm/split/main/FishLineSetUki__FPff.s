.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FishLineSetUki__FPff
/* 0AA130 001AA030 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0AA134 001AA034 1000BF7F */  sq          $31, 0x10($29)
/* 0AA138 001AA038 0000B4E7 */  swc1        $f20, 0x0($29)
/* 0AA13C 001AA03C 282E8070 */  paddub      $5, $4, $0
/* 0AA140 001AA040 06650046 */  mov.s       $f20, $f12
/* 0AA144 001AA044 00008044 */  mtc1        $0, $f0
/* 0AA148 001AA048 00000000 */  nop
/* 0AA14C 001AA04C 34A00046 */  c.lt.s      $f20, $f0
/* 0AA150 001AA050 00000000 */  nop
/* 0AA154 001AA054 04000045 */  bc1f        .L001AA068
/* 0AA158 001AA058 00000000 */   nop
/* 0AA15C 001AA05C 849380AF */  sw          $0, -0x6C7C($28)
/* 0AA160 001AA060 14000010 */  b           .L001AA0B4
/* 0AA164 001AA064 00000000 */   nop
.L001AA068:
/* 0AA168 001AA068 2000A427 */  addiu       $4, $29, 0x20
/* 0AA16C 001AA06C D501023C */  lui         $2, %hi(ukip)
/* 0AA170 001AA070 50634624 */  addiu       $6, $2, %lo(ukip)
/* 0AA174 001AA074 EE85040C */  jal         sceVu0SubVector
/* 0AA178 001AA078 00000000 */   nop
/* 0AA17C 001AA07C 2000A427 */  addiu       $4, $29, 0x20
/* 0AA180 001AA080 282E8070 */  paddub      $5, $4, $0
/* 0AA184 001AA084 06A30046 */  mov.s       $f12, $f20
/* 0AA188 001AA088 FA85040C */  jal         sceVu0ScaleVector
/* 0AA18C 001AA08C 00000000 */   nop
/* 0AA190 001AA090 D501023C */  lui         $2, %hi(uki)
/* 0AA194 001AA094 50644424 */  addiu       $4, $2, %lo(uki)
/* 0AA198 001AA098 D501023C */  lui         $2, %hi(ukip)
/* 0AA19C 001AA09C 50634524 */  addiu       $5, $2, %lo(ukip)
/* 0AA1A0 001AA0A0 2000A627 */  addiu       $6, $29, 0x20
/* 0AA1A4 001AA0A4 E885040C */  jal         sceVu0AddVector
/* 0AA1A8 001AA0A8 00000000 */   nop
/* 0AA1AC 001AA0AC 01000324 */  addiu       $3, $0, 0x1
/* 0AA1B0 001AA0B0 849383AF */  sw          $3, -0x6C7C($28)
.L001AA0B4:
/* 0AA1B4 001AA0B4 1000BF7B */  lq          $31, 0x10($29)
/* 0AA1B8 001AA0B8 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 0AA1BC 001AA0BC 3000BD27 */  addiu       $29, $29, 0x30
/* 0AA1C0 001AA0C0 0800E003 */  jr          $31
/* 0AA1C4 001AA0C4 00000000 */   nop
/* 0AA1C8 001AA0C8 00000000 */  nop
/* 0AA1CC 001AA0CC 00000000 */  nop
