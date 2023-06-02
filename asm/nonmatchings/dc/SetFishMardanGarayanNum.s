.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetFishMardanGarayanNum__Fi
/* F13C0 001F12C0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* F13C4 001F12C4 1000BF7F */  sq         $31, 0x10($sp)
/* F13C8 001F12C8 0000B07F */  sq         $16, 0x0($sp)
/* F13CC 001F12CC 28868070 */  paddub     $16, $4, $0
/* F13D0 001F12D0 D0C4070C */  jal        GetFishMardanGarayanNum__Fv
/* F13D4 001F12D4 00000000 */   nop
/* F13D8 001F12D8 21300202 */  addu       $6, $16, $2
/* F13DC 001F12DC 0200C104 */  bgez       $6, .L001F12E8
/* F13E0 001F12E0 00000000 */   nop
/* F13E4 001F12E4 28360070 */  paddub     $6, $0, $0
.L001F12E8:
/* F13E8 001F12E8 1127C128 */  slti       $at, $6, 0x2711
/* F13EC 001F12EC 02002014 */  bnez       $at, .L001F12F8
/* F13F0 001F12F0 00000000 */   nop
/* F13F4 001F12F4 10270624 */  addiu      $6, $0, 0x2710
.L001F12F8:
/* F13F8 001F12F8 1C8D848F */  lw         $4, -0x72E4($gp)
/* F13FC 001F12FC 14000524 */  addiu      $5, $0, 0x14
/* F1400 001F1300 D860050C */  jal        SetGameIntFlag__9CSaveDataFii
/* F1404 001F1304 00000000 */   nop
/* F1408 001F1308 D0C4070C */  jal        GetFishMardanGarayanNum__Fv
/* F140C 001F130C 00000000 */   nop
/* F1410 001F1310 2A00033C */  lui        $3, %hi(_2912)
/* F1414 001F1314 E0D36424 */  addiu      $4, $3, %lo(_2912)
/* F1418 001F1318 282E4070 */  paddub     $5, $2, $0
/* F141C 001F131C A611040C */  jal        printf
/* F1420 001F1320 00000000 */   nop
/* F1424 001F1324 1000BF7B */  lq         $31, 0x10($sp)
/* F1428 001F1328 0000B07B */  lq         $16, 0x0($sp)
/* F142C 001F132C 2000BD27 */  addiu      $sp, $sp, 0x20
/* F1430 001F1330 0800E003 */  jr         $31
/* F1434 001F1334 00000000 */   nop
/* F1438 001F1338 00000000 */  nop
/* F143C 001F133C 00000000 */  nop
