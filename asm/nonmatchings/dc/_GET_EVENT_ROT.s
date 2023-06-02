.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_EVENT_ROT__FP12RS_STACKDATAi
/* BC480 001BC380 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* BC484 001BC384 0000BF7F */  sq         $31, 0x0($sp)
/* BC488 001BC388 08008224 */  addiu      $2, $4, 0x8
/* BC48C 001BC38C D501013C */  lui        $at, (0x1D56750 >> 16)
/* BC490 001BC390 50672CC4 */  lwc1       $f12, (0x1D56750 & 0xFFFF)($at)
/* BC494 001BC394 78EE060C */  jal        SetStack__FP12RS_STACKDATAf_2
/* BC498 001BC398 00000000 */   nop
/* BC49C 001BC39C 28264070 */  paddub     $4, $2, $0
/* BC4A0 001BC3A0 08008224 */  addiu      $2, $4, 0x8
/* BC4A4 001BC3A4 D501013C */  lui        $at, (0x1D56754 >> 16)
/* BC4A8 001BC3A8 54672CC4 */  lwc1       $f12, (0x1D56754 & 0xFFFF)($at)
/* BC4AC 001BC3AC 78EE060C */  jal        SetStack__FP12RS_STACKDATAf_2
/* BC4B0 001BC3B0 00000000 */   nop
/* BC4B4 001BC3B4 28264070 */  paddub     $4, $2, $0
/* BC4B8 001BC3B8 D501013C */  lui        $at, (0x1D56758 >> 16)
/* BC4BC 001BC3BC 58672CC4 */  lwc1       $f12, (0x1D56758 & 0xFFFF)($at)
/* BC4C0 001BC3C0 78EE060C */  jal        SetStack__FP12RS_STACKDATAf_2
/* BC4C4 001BC3C4 00000000 */   nop
/* BC4C8 001BC3C8 01000224 */  addiu      $2, $0, 0x1
/* BC4CC 001BC3CC 0000BF7B */  lq         $31, 0x0($sp)
/* BC4D0 001BC3D0 1000BD27 */  addiu      $sp, $sp, 0x10
/* BC4D4 001BC3D4 0800E003 */  jr         $31
/* BC4D8 001BC3D8 00000000 */   nop
/* BC4DC 001BC3DC 00000000 */  nop
