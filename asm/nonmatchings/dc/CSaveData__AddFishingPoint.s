.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AddFishingPoint__9CSaveDataFi
/* 57E40 00157D40 DC01838C */  lw         $3, 0x1DC($4)
/* 57E44 00157D44 21186500 */  addu       $3, $3, $5
/* 57E48 00157D48 DC0183AC */  sw         $3, 0x1DC($4)
/* 57E4C 00157D4C DC01838C */  lw         $3, 0x1DC($4)
/* 57E50 00157D50 10276128 */  slti       $at, $3, 0x2710
/* 57E54 00157D54 03002014 */  bnez       $at, .L00157D64
/* 57E58 00157D58 00000000 */   nop
/* 57E5C 00157D5C 0F270324 */  addiu      $3, $0, 0x270F
/* 57E60 00157D60 DC0183AC */  sw         $3, 0x1DC($4)
.L00157D64:
/* 57E64 00157D64 DC01838C */  lw         $3, 0x1DC($4)
/* 57E68 00157D68 02006104 */  bgez       $3, .L00157D74
/* 57E6C 00157D6C 00000000 */   nop
/* 57E70 00157D70 DC0180AC */  sw         $0, 0x1DC($4)
.L00157D74:
/* 57E74 00157D74 0800E003 */  jr         $31
/* 57E78 00157D78 00000000 */   nop
/* 57E7C 00157D7C 00000000 */  nop
