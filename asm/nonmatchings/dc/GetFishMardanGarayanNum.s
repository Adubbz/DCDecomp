.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetFishMardanGarayanNum__Fv
/* F1440 001F1340 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* F1444 001F1344 0000BF7F */  sq         $31, 0x0($sp)
/* F1448 001F1348 1C8D848F */  lw         $4, -0x72E4($gp)
/* F144C 001F134C 14000524 */  addiu      $5, $0, 0x14
/* F1450 001F1350 C860050C */  jal        GetGameIntFlag__9CSaveDataFi
/* F1454 001F1354 00000000 */   nop
/* F1458 001F1358 0000BF7B */  lq         $31, 0x0($sp)
/* F145C 001F135C 1000BD27 */  addiu      $sp, $sp, 0x10
/* F1460 001F1360 0800E003 */  jr         $31
/* F1464 001F1364 00000000 */   nop
/* F1468 001F1368 00000000 */  nop
/* F146C 001F136C 00000000 */  nop
