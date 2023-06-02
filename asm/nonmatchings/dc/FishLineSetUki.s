.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishLineSetUki__FPff
/* AA130 001AA030 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* AA134 001AA034 1000BF7F */  sq         $31, 0x10($sp)
/* AA138 001AA038 0000B4E7 */  swc1       $f20, 0x0($sp)
/* AA13C 001AA03C 282E8070 */  paddub     $5, $4, $0
/* AA140 001AA040 06650046 */  mov.s      $f20, $f12
/* AA144 001AA044 00008044 */  mtc1       $0, $f0
/* AA148 001AA048 00000000 */  nop
/* AA14C 001AA04C 34A00046 */  c.lt.s     $f20, $f0
/* AA150 001AA050 00000000 */  nop
/* AA154 001AA054 04000045 */  bc1f       .L001AA068
/* AA158 001AA058 00000000 */   nop
/* AA15C 001AA05C 849380AF */  sw         $0, -0x6C7C($gp)
/* AA160 001AA060 14000010 */  b          .L001AA0B4
/* AA164 001AA064 00000000 */   nop
.L001AA068:
/* AA168 001AA068 2000A427 */  addiu      $4, $sp, 0x20
/* AA16C 001AA06C D501023C */  lui        $2, %hi(ukip)
/* AA170 001AA070 50634624 */  addiu      $6, $2, %lo(ukip)
/* AA174 001AA074 EE85040C */  jal        sceVu0SubVector
/* AA178 001AA078 00000000 */   nop
/* AA17C 001AA07C 2000A427 */  addiu      $4, $sp, 0x20
/* AA180 001AA080 282E8070 */  paddub     $5, $4, $0
/* AA184 001AA084 06A30046 */  mov.s      $f12, $f20
/* AA188 001AA088 FA85040C */  jal        sceVu0ScaleVector
/* AA18C 001AA08C 00000000 */   nop
/* AA190 001AA090 D501023C */  lui        $2, %hi(uki)
/* AA194 001AA094 50644424 */  addiu      $4, $2, %lo(uki)
/* AA198 001AA098 D501023C */  lui        $2, %hi(ukip)
/* AA19C 001AA09C 50634524 */  addiu      $5, $2, %lo(ukip)
/* AA1A0 001AA0A0 2000A627 */  addiu      $6, $sp, 0x20
/* AA1A4 001AA0A4 E885040C */  jal        sceVu0AddVector
/* AA1A8 001AA0A8 00000000 */   nop
/* AA1AC 001AA0AC 01000324 */  addiu      $3, $0, 0x1
/* AA1B0 001AA0B0 849383AF */  sw         $3, -0x6C7C($gp)
.L001AA0B4:
/* AA1B4 001AA0B4 1000BF7B */  lq         $31, 0x10($sp)
/* AA1B8 001AA0B8 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* AA1BC 001AA0BC 3000BD27 */  addiu      $sp, $sp, 0x30
/* AA1C0 001AA0C0 0800E003 */  jr         $31
/* AA1C4 001AA0C4 00000000 */   nop
/* AA1C8 001AA0C8 00000000 */  nop
/* AA1CC 001AA0CC 00000000 */  nop
