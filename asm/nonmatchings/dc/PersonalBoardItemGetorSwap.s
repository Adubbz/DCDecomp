.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PersonalBoardItemGetorSwap__Fi
/* 12F5D0 0022F4D0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 12F5D4 0022F4D4 0000BF7F */  sq         $31, 0x0($sp)
/* 12F5D8 0022F4D8 282E8070 */  paddub     $5, $4, $0
/* 12F5DC 0022F4DC 28160070 */  paddub     $2, $0, $0
/* 12F5E0 0022F4E0 A897838F */  lw         $3, -0x6858($gp)
/* 12F5E4 0022F4E4 30006424 */  addiu      $4, $3, 0x30
/* 12F5E8 0022F4E8 0400668C */  lw         $6, 0x4($3)
/* 12F5EC 0022F4EC 02000324 */  addiu      $3, $0, 0x2
/* 12F5F0 0022F4F0 1000C310 */  beq        $6, $3, .L0022F534
/* 12F5F4 0022F4F4 00000000 */   nop
/* 12F5F8 0022F4F8 01000324 */  addiu      $3, $0, 0x1
/* 12F5FC 0022F4FC 0900C310 */  beq        $6, $3, .L0022F524
/* 12F600 0022F500 00000000 */   nop
/* 12F604 0022F504 0300C010 */  beqz       $6, .L0022F514
/* 12F608 0022F508 00000000 */   nop
/* 12F60C 0022F50C 0B000010 */  b          .L0022F53C
/* 12F610 0022F510 00000000 */   nop
.L0022F514:
/* 12F614 0022F514 E4BB080C */  jal        PersonalBoardItemPush__FP9IHAVEITEMi
/* 12F618 0022F518 00000000 */   nop
/* 12F61C 0022F51C 07000010 */  b          .L0022F53C
/* 12F620 0022F520 00000000 */   nop
.L0022F524:
/* 12F624 0022F524 28BC080C */  jal        PersonalBoardWeaponPush__FP9IHAVEITEMi
/* 12F628 0022F528 00000000 */   nop
/* 12F62C 0022F52C 03000010 */  b          .L0022F53C
/* 12F630 0022F530 00000000 */   nop
.L0022F534:
/* 12F634 0022F534 FCBC080C */  jal        PersonalBoardAttachPush__FP9IHAVEITEMi
/* 12F638 0022F538 00000000 */   nop
.L0022F53C:
/* 12F63C 0022F53C 0000BF7B */  lq         $31, 0x0($sp)
/* 12F640 0022F540 1000BD27 */  addiu      $sp, $sp, 0x10
/* 12F644 0022F544 0800E003 */  jr         $31
/* 12F648 0022F548 00000000 */   nop
/* 12F64C 0022F54C 00000000 */  nop
