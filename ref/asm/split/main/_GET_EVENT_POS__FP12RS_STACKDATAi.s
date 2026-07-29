.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_EVENT_POS__FP12RS_STACKDATAi
/* 0BC420 001BC320 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0BC424 001BC324 0000BF7F */  sq          $31, 0x0($29)
/* 0BC428 001BC328 08008224 */  addiu       $2, $4, 0x8
/* 0BC42C 001BC32C D501013C */  lui         $1, %hi(BtEventInfo)
/* 0BC430 001BC330 40672CC4 */  lwc1        $f12, %lo(BtEventInfo)($1)
/* 0BC434 001BC334 78EE060C */  jal         SetStack__FP12RS_STACKDATAf__2
/* 0BC438 001BC338 00000000 */   nop
/* 0BC43C 001BC33C 28264070 */  paddub      $4, $2, $0
/* 0BC440 001BC340 08008224 */  addiu       $2, $4, 0x8
/* 0BC444 001BC344 D501013C */  lui         $1, %hi(BtEventInfo + 0x4)
/* 0BC448 001BC348 44672CC4 */  lwc1        $f12, %lo(BtEventInfo + 0x4)($1)
/* 0BC44C 001BC34C 78EE060C */  jal         SetStack__FP12RS_STACKDATAf__2
/* 0BC450 001BC350 00000000 */   nop
/* 0BC454 001BC354 28264070 */  paddub      $4, $2, $0
/* 0BC458 001BC358 D501013C */  lui         $1, %hi(BtEventInfo + 0x8)
/* 0BC45C 001BC35C 48672CC4 */  lwc1        $f12, %lo(BtEventInfo + 0x8)($1)
/* 0BC460 001BC360 78EE060C */  jal         SetStack__FP12RS_STACKDATAf__2
/* 0BC464 001BC364 00000000 */   nop
/* 0BC468 001BC368 01000224 */  addiu       $2, $0, 0x1
/* 0BC46C 001BC36C 0000BF7B */  lq          $31, 0x0($29)
/* 0BC470 001BC370 1000BD27 */  addiu       $29, $29, 0x10
/* 0BC474 001BC374 0800E003 */  jr          $31
/* 0BC478 001BC378 00000000 */   nop
/* 0BC47C 001BC37C 00000000 */  nop
