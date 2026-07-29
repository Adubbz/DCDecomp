.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FishingSetWaterLevel__Fff
/* 0A9290 001A9190 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0A9294 001A9194 0000BF7F */  sq          $31, 0x0($29)
/* 0A9298 001A9198 38938CE7 */  swc1        $f12, -0x6CC8($28)
/* 0A929C 001A919C 3C938DE7 */  swc1        $f13, -0x6CC4($28)
/* 0A92A0 001A91A0 066B0046 */  mov.s       $f12, $f13
/* 0A92A4 001A91A4 70A4060C */  jal         FishingSetGroundLevel__Fff
/* 0A92A8 001A91A8 00000000 */   nop
/* 0A92AC 001A91AC 0000BF7B */  lq          $31, 0x0($29)
/* 0A92B0 001A91B0 1000BD27 */  addiu       $29, $29, 0x10
/* 0A92B4 001A91B4 0800E003 */  jr          $31
/* 0A92B8 001A91B8 00000000 */   nop
/* 0A92BC 001A91BC 00000000 */  nop
