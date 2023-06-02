.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_EVENT_POS__FP12RS_STACKDATAi
/* BC420 001BC320 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* BC424 001BC324 0000BF7F */  sq         $31, 0x0($sp)
/* BC428 001BC328 08008224 */  addiu      $2, $4, 0x8
/* BC42C 001BC32C D501013C */  lui        $at, (0x1D56740 >> 16)
/* BC430 001BC330 40672CC4 */  lwc1       $f12, (0x1D56740 & 0xFFFF)($at)
/* BC434 001BC334 78EE060C */  jal        SetStack__FP12RS_STACKDATAf_2
/* BC438 001BC338 00000000 */   nop
/* BC43C 001BC33C 28264070 */  paddub     $4, $2, $0
/* BC440 001BC340 08008224 */  addiu      $2, $4, 0x8
/* BC444 001BC344 D501013C */  lui        $at, (0x1D56744 >> 16)
/* BC448 001BC348 44672CC4 */  lwc1       $f12, (0x1D56744 & 0xFFFF)($at)
/* BC44C 001BC34C 78EE060C */  jal        SetStack__FP12RS_STACKDATAf_2
/* BC450 001BC350 00000000 */   nop
/* BC454 001BC354 28264070 */  paddub     $4, $2, $0
/* BC458 001BC358 D501013C */  lui        $at, (0x1D56748 >> 16)
/* BC45C 001BC35C 48672CC4 */  lwc1       $f12, (0x1D56748 & 0xFFFF)($at)
/* BC460 001BC360 78EE060C */  jal        SetStack__FP12RS_STACKDATAf_2
/* BC464 001BC364 00000000 */   nop
/* BC468 001BC368 01000224 */  addiu      $2, $0, 0x1
/* BC46C 001BC36C 0000BF7B */  lq         $31, 0x0($sp)
/* BC470 001BC370 1000BD27 */  addiu      $sp, $sp, 0x10
/* BC474 001BC374 0800E003 */  jr         $31
/* BC478 001BC378 00000000 */   nop
/* BC47C 001BC37C 00000000 */  nop
