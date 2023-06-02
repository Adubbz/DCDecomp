.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ClearFishMardanGarayanNum__Fv
/* F1470 001F1370 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* F1474 001F1374 0000BF7F */  sq         $31, 0x0($sp)
/* F1478 001F1378 1C8D848F */  lw         $4, -0x72E4($gp)
/* F147C 001F137C 14000524 */  addiu      $5, $0, 0x14
/* F1480 001F1380 28360070 */  paddub     $6, $0, $0
/* F1484 001F1384 D860050C */  jal        SetGameIntFlag__9CSaveDataFii
/* F1488 001F1388 00000000 */   nop
/* F148C 001F138C 0000BF7B */  lq         $31, 0x0($sp)
/* F1490 001F1390 1000BD27 */  addiu      $sp, $sp, 0x10
/* F1494 001F1394 0800E003 */  jr         $31
/* F1498 001F1398 00000000 */   nop
/* F149C 001F139C 00000000 */  nop
