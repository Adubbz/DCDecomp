.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _BOSS_FADE_OUT__FP12RS_STACKDATAi
/* E60C0 001E5FC0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* E60C4 001E5FC4 0000BF7F */  sq         $31, 0x0($sp)
/* E60C8 001E5FC8 B425060C */  jal        EdFadeInit__Fv
/* E60CC 001E5FCC 00000000 */   nop
/* E60D0 001E5FD0 00688044 */  mtc1       $0, $f13
/* E60D4 001E5FD4 00000000 */  nop
/* E60D8 001E5FD8 866B0046 */  mov.s      $f14, $f13
/* E60DC 001E5FDC 066B0046 */  mov.s      $f12, $f13
/* E60E0 001E5FE0 78000424 */  addiu      $4, $0, 0x78
/* E60E4 001E5FE4 E425060C */  jal        EdFadeOut__Fifff
/* E60E8 001E5FE8 00000000 */   nop
/* E60EC 001E5FEC DC01013C */  lui        $at, (0x1DC44E4 >> 16)
/* E60F0 001E5FF0 E44420A4 */  sh         $0, (0x1DC44E4 & 0xFFFF)($at)
/* E60F4 001E5FF4 01000224 */  addiu      $2, $0, 0x1
/* E60F8 001E5FF8 DC01013C */  lui        $at, (0x1DC4518 >> 16)
/* E60FC 001E5FFC 184522AC */  sw         $2, (0x1DC4518 & 0xFFFF)($at)
/* E6100 001E6000 0000BF7B */  lq         $31, 0x0($sp)
/* E6104 001E6004 1000BD27 */  addiu      $sp, $sp, 0x10
/* E6108 001E6008 0800E003 */  jr         $31
/* E610C 001E600C 00000000 */   nop
