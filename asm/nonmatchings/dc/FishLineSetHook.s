.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishLineSetHook__FPff
/* AA1D0 001AA0D0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* AA1D4 001AA0D4 1000BF7F */  sq         $31, 0x10($sp)
/* AA1D8 001AA0D8 0000B4E7 */  swc1       $f20, 0x0($sp)
/* AA1DC 001AA0DC 282E8070 */  paddub     $5, $4, $0
/* AA1E0 001AA0E0 06650046 */  mov.s      $f20, $f12
/* AA1E4 001AA0E4 00008044 */  mtc1       $0, $f0
/* AA1E8 001AA0E8 00000000 */  nop
/* AA1EC 001AA0EC 34A00046 */  c.lt.s     $f20, $f0
/* AA1F0 001AA0F0 00000000 */  nop
/* AA1F4 001AA0F4 04000045 */  bc1f       .L001AA108
/* AA1F8 001AA0F8 00000000 */   nop
/* AA1FC 001AA0FC 809380AF */  sw         $0, -0x6C80($gp)
/* AA200 001AA100 14000010 */  b          .L001AA154
/* AA204 001AA104 00000000 */   nop
.L001AA108:
/* AA208 001AA108 2000A427 */  addiu      $4, $sp, 0x20
/* AA20C 001AA10C D501023C */  lui        $2, %hi(hookp)
/* AA210 001AA110 B0624624 */  addiu      $6, $2, %lo(hookp)
/* AA214 001AA114 EE85040C */  jal        sceVu0SubVector
/* AA218 001AA118 00000000 */   nop
/* AA21C 001AA11C 2000A427 */  addiu      $4, $sp, 0x20
/* AA220 001AA120 282E8070 */  paddub     $5, $4, $0
/* AA224 001AA124 06A30046 */  mov.s      $f12, $f20
/* AA228 001AA128 FA85040C */  jal        sceVu0ScaleVector
/* AA22C 001AA12C 00000000 */   nop
/* AA230 001AA130 D501023C */  lui        $2, %hi(fishhook)
/* AA234 001AA134 40644424 */  addiu      $4, $2, %lo(fishhook)
/* AA238 001AA138 D501023C */  lui        $2, %hi(hookp)
/* AA23C 001AA13C B0624524 */  addiu      $5, $2, %lo(hookp)
/* AA240 001AA140 2000A627 */  addiu      $6, $sp, 0x20
/* AA244 001AA144 E885040C */  jal        sceVu0AddVector
/* AA248 001AA148 00000000 */   nop
/* AA24C 001AA14C 01000324 */  addiu      $3, $0, 0x1
/* AA250 001AA150 809383AF */  sw         $3, -0x6C80($gp)
.L001AA154:
/* AA254 001AA154 1000BF7B */  lq         $31, 0x10($sp)
/* AA258 001AA158 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* AA25C 001AA15C 3000BD27 */  addiu      $sp, $sp, 0x30
/* AA260 001AA160 0800E003 */  jr         $31
/* AA264 001AA164 00000000 */   nop
/* AA268 001AA168 00000000 */  nop
/* AA26C 001AA16C 00000000 */  nop
