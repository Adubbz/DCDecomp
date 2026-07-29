.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_EVENT_ROT__FP12RS_STACKDATAi
/* 0BC480 001BC380 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0BC484 001BC384 0000BF7F */  sq          $31, 0x0($29)
/* 0BC488 001BC388 08008224 */  addiu       $2, $4, 0x8
/* 0BC48C 001BC38C D501013C */  lui         $1, %hi(BtEventInfo + 0x10)
/* 0BC490 001BC390 50672CC4 */  lwc1        $f12, %lo(BtEventInfo + 0x10)($1)
/* 0BC494 001BC394 78EE060C */  jal         SetStack__FP12RS_STACKDATAf__2
/* 0BC498 001BC398 00000000 */   nop
/* 0BC49C 001BC39C 28264070 */  paddub      $4, $2, $0
/* 0BC4A0 001BC3A0 08008224 */  addiu       $2, $4, 0x8
/* 0BC4A4 001BC3A4 D501013C */  lui         $1, %hi(BtEventInfo + 0x14)
/* 0BC4A8 001BC3A8 54672CC4 */  lwc1        $f12, %lo(BtEventInfo + 0x14)($1)
/* 0BC4AC 001BC3AC 78EE060C */  jal         SetStack__FP12RS_STACKDATAf__2
/* 0BC4B0 001BC3B0 00000000 */   nop
/* 0BC4B4 001BC3B4 28264070 */  paddub      $4, $2, $0
/* 0BC4B8 001BC3B8 D501013C */  lui         $1, %hi(BtEventInfo + 0x18)
/* 0BC4BC 001BC3BC 58672CC4 */  lwc1        $f12, %lo(BtEventInfo + 0x18)($1)
/* 0BC4C0 001BC3C0 78EE060C */  jal         SetStack__FP12RS_STACKDATAf__2
/* 0BC4C4 001BC3C4 00000000 */   nop
/* 0BC4C8 001BC3C8 01000224 */  addiu       $2, $0, 0x1
/* 0BC4CC 001BC3CC 0000BF7B */  lq          $31, 0x0($29)
/* 0BC4D0 001BC3D0 1000BD27 */  addiu       $29, $29, 0x10
/* 0BC4D4 001BC3D4 0800E003 */  jr          $31
/* 0BC4D8 001BC3D8 00000000 */   nop
/* 0BC4DC 001BC3DC 00000000 */  nop
