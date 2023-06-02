.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetCollision__FP6CCPolyP7CBoxVu0
/* 7F4F0 0017F3F0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 7F4F4 0017F3F4 1000BF7F */  sq         $31, 0x10($sp)
/* 7F4F8 0017F3F8 0000B07F */  sq         $16, 0x0($sp)
/* 7F4FC 0017F3FC 28868070 */  paddub     $16, $4, $0
/* 7F500 0017F400 2000A427 */  addiu      $4, $sp, 0x20
/* 7F504 0017F404 1000A624 */  addiu      $6, $5, 0x10
/* 7F508 0017F408 E885040C */  jal        sceVu0AddVector
/* 7F50C 0017F40C 00000000 */   nop
/* 7F510 0017F410 003F023C */  lui        $2, (0x3F000000 >> 16)
/* 7F514 0017F414 00608244 */  mtc1       $2, $f12
/* 7F518 0017F418 2000A427 */  addiu      $4, $sp, 0x20
/* 7F51C 0017F41C 282E8070 */  paddub     $5, $4, $0
/* 7F520 0017F420 FA85040C */  jal        sceVu0ScaleVector
/* 7F524 0017F424 00000000 */   nop
/* 7F528 0017F428 E890848F */  lw         $4, -0x6F18($gp)
/* 7F52C 0017F42C 282E0072 */  paddub     $5, $16, $0
/* 7F530 0017F430 2000ACC7 */  lwc1       $f12, 0x20($sp)
/* 7F534 0017F434 2400ADC7 */  lwc1       $f13, 0x24($sp)
/* 7F538 0017F438 2800AEC7 */  lwc1       $f14, 0x28($sp)
/* 7F53C 0017F43C B893060C */  jal        PickUpPoly__11CEditGroundFP6CCPolyfff
/* 7F540 0017F440 00000000 */   nop
/* 7F544 0017F444 1000BF7B */  lq         $31, 0x10($sp)
/* 7F548 0017F448 0000B07B */  lq         $16, 0x0($sp)
/* 7F54C 0017F44C 3000BD27 */  addiu      $sp, $sp, 0x30
/* 7F550 0017F450 0800E003 */  jr         $31
/* 7F554 0017F454 00000000 */   nop
/* 7F558 0017F458 00000000 */  nop
/* 7F55C 0017F45C 00000000 */  nop
