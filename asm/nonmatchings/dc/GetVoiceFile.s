.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetVoiceFile__FiPcPc
/* 5B410 0015B310 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 5B414 0015B314 2000BF7F */  sq         $31, 0x20($sp)
/* 5B418 0015B318 1000B17F */  sq         $17, 0x10($sp)
/* 5B41C 0015B31C 0000B07F */  sq         $16, 0x0($sp)
/* 5B420 0015B320 281E8070 */  paddub     $3, $4, $0
/* 5B424 0015B324 288EA070 */  paddub     $17, $5, $0
/* 5B428 0015B328 2886C070 */  paddub     $16, $6, $0
/* 5B42C 0015B32C 3000A427 */  addiu      $4, $sp, 0x30
/* 5B430 0015B330 2A00023C */  lui        $2, %hi(_725_2)
/* 5B434 0015B334 D89F4524 */  addiu      $5, $2, %lo(_725_2)
/* 5B438 0015B338 28366070 */  paddub     $6, $3, $0
/* 5B43C 0015B33C 1614040C */  jal        sprintf
/* 5B440 0015B340 00000000 */   nop
/* 5B444 0015B344 28262072 */  paddub     $4, $17, $0
/* 5B448 0015B348 2A00023C */  lui        $2, %hi(_726_2)
/* 5B44C 0015B34C E09F4524 */  addiu      $5, $2, %lo(_726_2)
/* 5B450 0015B350 3000A627 */  addiu      $6, $sp, 0x30
/* 5B454 0015B354 1614040C */  jal        sprintf
/* 5B458 0015B358 00000000 */   nop
/* 5B45C 0015B35C 28260072 */  paddub     $4, $16, $0
/* 5B460 0015B360 2A00023C */  lui        $2, %hi(_350)
/* 5B464 0015B364 789F4524 */  addiu      $5, $2, %lo(_350)
/* 5B468 0015B368 3000A627 */  addiu      $6, $sp, 0x30
/* 5B46C 0015B36C 1614040C */  jal        sprintf
/* 5B470 0015B370 00000000 */   nop
/* 5B474 0015B374 2000BF7B */  lq         $31, 0x20($sp)
/* 5B478 0015B378 1000B17B */  lq         $17, 0x10($sp)
/* 5B47C 0015B37C 0000B07B */  lq         $16, 0x0($sp)
/* 5B480 0015B380 4000BD27 */  addiu      $sp, $sp, 0x40
/* 5B484 0015B384 0800E003 */  jr         $31
/* 5B488 0015B388 00000000 */   nop
/* 5B48C 0015B38C 00000000 */  nop
