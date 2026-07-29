.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetFishMardanGarayanNum__Fv
/* 0F1440 001F1340 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0F1444 001F1344 0000BF7F */  sq          $31, 0x0($29)
/* 0F1448 001F1348 1C8D848F */  lw          $4, -0x72E4($28)
/* 0F144C 001F134C 14000524 */  addiu       $5, $0, 0x14
/* 0F1450 001F1350 C860050C */  jal         GetGameIntFlag__9CSaveDataFi
/* 0F1454 001F1354 00000000 */   nop
/* 0F1458 001F1358 0000BF7B */  lq          $31, 0x0($29)
/* 0F145C 001F135C 1000BD27 */  addiu       $29, $29, 0x10
/* 0F1460 001F1360 0800E003 */  jr          $31
/* 0F1464 001F1364 00000000 */   nop
/* 0F1468 001F1368 00000000 */  nop
/* 0F146C 001F136C 00000000 */  nop
