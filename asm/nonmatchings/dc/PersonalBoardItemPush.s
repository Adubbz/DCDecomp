.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PersonalBoardItemPush__FP9IHAVEITEMi
/* 12F090 0022EF90 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 12F094 0022EF94 5000BF7F */  sq         $31, 0x50($sp)
/* 12F098 0022EF98 4000B47F */  sq         $20, 0x40($sp)
/* 12F09C 0022EF9C 3000B37F */  sq         $19, 0x30($sp)
/* 12F0A0 0022EFA0 2000B27F */  sq         $18, 0x20($sp)
/* 12F0A4 0022EFA4 1000B17F */  sq         $17, 0x10($sp)
/* 12F0A8 0022EFA8 0000B07F */  sq         $16, 0x0($sp)
/* 12F0AC 0022EFAC 28A68070 */  paddub     $20, $4, $0
/* 12F0B0 0022EFB0 289EA070 */  paddub     $19, $5, $0
/* 12F0B4 0022EFB4 28860070 */  paddub     $16, $0, $0
/* 12F0B8 0022EFB8 10008484 */  lh         $4, 0x10($4)
/* 12F0BC 0022EFBC 88C7080C */  jal        WhatIsKindofItem__Fi
/* 12F0C0 0022EFC0 00000000 */   nop
/* 12F0C4 0022EFC4 03004010 */  beqz       $2, .L0022EFD4
/* 12F0C8 0022EFC8 00000000 */   nop
/* 12F0CC 0022EFCC 2A004104 */  bgez       $2, .L0022F078
/* 12F0D0 0022EFD0 00000000 */   nop
.L0022EFD4:
/* 12F0D4 0022EFD4 A897828F */  lw         $2, -0x6858($gp)
/* 12F0D8 0022EFD8 40181300 */  sll        $3, $19, 1
/* 12F0DC 0022EFDC 2400428C */  lw         $2, 0x24($2)
/* 12F0E0 0022EFE0 21104300 */  addu       $2, $2, $3
/* 12F0E4 0022EFE4 0E005124 */  addiu      $17, $2, 0xE
/* 12F0E8 0022EFE8 DC005224 */  addiu      $18, $2, 0xDC
/* 12F0EC 0022EFEC DB01023C */  lui        $2, %hi(MenuTrushMark)
/* 12F0F0 0022EFF0 10904224 */  addiu      $2, $2, %lo(MenuTrushMark)
/* 12F0F4 0022EFF4 21105300 */  addu       $2, $2, $19
/* 12F0F8 0022EFF8 00004380 */  lb         $3, 0x0($2)
/* 12F0FC 0022EFFC 01000224 */  addiu      $2, $0, 0x1
/* 12F100 0022F000 04006214 */  bne        $3, $2, .L0022F014
/* 12F104 0022F004 00000000 */   nop
/* 12F108 0022F008 28860070 */  paddub     $16, $0, $0
/* 12F10C 0022F00C 1A000010 */  b          .L0022F078
/* 12F110 0022F010 00000000 */   nop
.L0022F014:
/* 12F114 0022F014 28262072 */  paddub     $4, $17, $0
/* 12F118 0022F018 10008526 */  addiu      $5, $20, 0x10
/* 12F11C 0022F01C 38B9080C */  jal        MenuDataSwap__FPsPs
/* 12F120 0022F020 00000000 */   nop
/* 12F124 0022F024 28264072 */  paddub     $4, $18, $0
/* 12F128 0022F028 12008526 */  addiu      $5, $20, 0x12
/* 12F12C 0022F02C 38B9080C */  jal        MenuDataSwap__FPsPs
/* 12F130 0022F030 00000000 */   nop
/* 12F134 0022F034 10008286 */  lh         $2, 0x10($20)
/* 12F138 0022F038 51004228 */  slti       $2, $2, 0x51
/* 12F13C 0022F03C 05004014 */  bnez       $2, .L0022F054
/* 12F140 0022F040 00000000 */   nop
/* 12F144 0022F044 040080AE */  sw         $0, 0x4($20)
/* 12F148 0022F048 A897828F */  lw         $2, -0x6858($gp)
/* 12F14C 0022F04C 0C00428C */  lw         $2, 0xC($2)
/* 12F150 0022F050 0C0082AE */  sw         $2, 0xC($20)
.L0022F054:
/* 12F154 0022F054 10008286 */  lh         $2, 0x10($20)
/* 12F158 0022F058 84004128 */  slti       $at, $2, 0x84
/* 12F15C 0022F05C 05002010 */  beqz       $at, .L0022F074
/* 12F160 0022F060 00000000 */   nop
/* 12F164 0022F064 00002286 */  lh         $2, 0x0($17)
/* 12F168 0022F068 84004228 */  slti       $2, $2, 0x84
/* 12F16C 0022F06C 02004014 */  bnez       $2, .L0022F078
/* 12F170 0022F070 00000000 */   nop
.L0022F074:
/* 12F174 0022F074 01001024 */  addiu      $16, $0, 0x1
.L0022F078:
/* 12F178 0022F078 28160072 */  paddub     $2, $16, $0
/* 12F17C 0022F07C 5000BF7B */  lq         $31, 0x50($sp)
/* 12F180 0022F080 4000B47B */  lq         $20, 0x40($sp)
/* 12F184 0022F084 3000B37B */  lq         $19, 0x30($sp)
/* 12F188 0022F088 2000B27B */  lq         $18, 0x20($sp)
/* 12F18C 0022F08C 1000B17B */  lq         $17, 0x10($sp)
/* 12F190 0022F090 0000B07B */  lq         $16, 0x0($sp)
/* 12F194 0022F094 6000BD27 */  addiu      $sp, $sp, 0x60
/* 12F198 0022F098 0800E003 */  jr         $31
/* 12F19C 0022F09C 00000000 */   nop