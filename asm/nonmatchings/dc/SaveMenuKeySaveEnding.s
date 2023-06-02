.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SaveMenuKeySaveEnding__Fv
/* 122470 00222370 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 122474 00222374 0000BF7F */  sq         $31, 0x0($sp)
/* 122478 00222378 19000224 */  addiu      $2, $0, 0x19
/* 12247C 0022237C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 122480 00222380 D48A22AC */  sw         $2, -0x752C($at)
/* 122484 00222384 DB01023C */  lui        $2, %hi(McAccess)
/* 122488 00222388 80824424 */  addiu      $4, $2, %lo(McAccess)
/* 12248C 0022238C 0E000524 */  addiu      $5, $0, 0xE
/* 122490 00222390 E44E080C */  jal        SetFuncNo__17CMemoryCardAccessFi
/* 122494 00222394 00000000 */   nop
/* 122498 00222398 01000224 */  addiu      $2, $0, 0x1
/* 12249C 0022239C 0000BF7B */  lq         $31, 0x0($sp)
/* 1224A0 002223A0 1000BD27 */  addiu      $sp, $sp, 0x10
/* 1224A4 002223A4 0800E003 */  jr         $31
/* 1224A8 002223A8 00000000 */   nop
/* 1224AC 002223AC 00000000 */  nop
