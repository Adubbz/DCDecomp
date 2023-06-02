.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_MOVE_VEC__FP12RS_STACKDATAi
/* E6460 001E6360 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* E6464 001E6364 0000BF7F */  sq         $31, 0x0($sp)
/* E6468 001E6368 08008224 */  addiu      $2, $4, 0x8
/* E646C 001E636C DC01013C */  lui        $at, (0x1DC4550 >> 16)
/* E6470 001E6370 50452CC4 */  lwc1       $f12, (0x1DC4550 & 0xFFFF)($at)
/* E6474 001E6374 BC85070C */  jal        SetStack__FP12RS_STACKDATAf_3
/* E6478 001E6378 00000000 */   nop
/* E647C 001E637C 28264070 */  paddub     $4, $2, $0
/* E6480 001E6380 08008224 */  addiu      $2, $4, 0x8
/* E6484 001E6384 DC01013C */  lui        $at, (0x1DC4554 >> 16)
/* E6488 001E6388 54452CC4 */  lwc1       $f12, (0x1DC4554 & 0xFFFF)($at)
/* E648C 001E638C BC85070C */  jal        SetStack__FP12RS_STACKDATAf_3
/* E6490 001E6390 00000000 */   nop
/* E6494 001E6394 28264070 */  paddub     $4, $2, $0
/* E6498 001E6398 DC01013C */  lui        $at, (0x1DC4558 >> 16)
/* E649C 001E639C 58452CC4 */  lwc1       $f12, (0x1DC4558 & 0xFFFF)($at)
/* E64A0 001E63A0 BC85070C */  jal        SetStack__FP12RS_STACKDATAf_3
/* E64A4 001E63A4 00000000 */   nop
/* E64A8 001E63A8 01000224 */  addiu      $2, $0, 0x1
/* E64AC 001E63AC 0000BF7B */  lq         $31, 0x0($sp)
/* E64B0 001E63B0 1000BD27 */  addiu      $sp, $sp, 0x10
/* E64B4 001E63B4 0800E003 */  jr         $31
/* E64B8 001E63B8 00000000 */   nop
/* E64BC 001E63BC 00000000 */  nop
