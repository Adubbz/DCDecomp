.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdCheckGetItem__Fi
/* 733E0 001732E0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 733E4 001732E4 2000BF7F */  sq         $31, 0x20($sp)
/* 733E8 001732E8 1000B17F */  sq         $17, 0x10($sp)
/* 733EC 001732EC 0000B07F */  sq         $16, 0x0($sp)
/* 733F0 001732F0 288E8070 */  paddub     $17, $4, $0
/* 733F4 001732F4 1C8D848F */  lw         $4, -0x72E4($gp)
/* 733F8 001732F8 7860050C */  jal        GetDngStatus__9CSaveDataFv
/* 733FC 001732FC 00000000 */   nop
/* 73400 00173300 28864070 */  paddub     $16, $2, $0
/* 73404 00173304 28262072 */  paddub     $4, $17, $0
/* 73408 00173308 E4CA050C */  jal        ConvertItemNo__Fi
/* 7340C 0017330C 00000000 */   nop
/* 73410 00173310 07004004 */  bltz       $2, .L00173330
/* 73414 00173314 00000000 */   nop
/* 73418 00173318 28260072 */  paddub     $4, $16, $0
/* 7341C 0017331C 282E4070 */  paddub     $5, $2, $0
/* 73420 00173320 50F7060C */  jal        CheckItemGet__14CDngStatusDataFi
/* 73424 00173324 00000000 */   nop
/* 73428 00173328 02000010 */  b          .L00173334
/* 7342C 0017332C 00000000 */   nop
.L00173330:
/* 73430 00173330 28160070 */  paddub     $2, $0, $0
.L00173334:
/* 73434 00173334 2000BF7B */  lq         $31, 0x20($sp)
/* 73438 00173338 1000B17B */  lq         $17, 0x10($sp)
/* 7343C 0017333C 0000B07B */  lq         $16, 0x0($sp)
/* 73440 00173340 3000BD27 */  addiu      $sp, $sp, 0x30
/* 73444 00173344 0800E003 */  jr         $31
/* 73448 00173348 00000000 */   nop
/* 7344C 0017334C 00000000 */  nop
