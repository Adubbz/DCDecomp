.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdInitModeFinish__FP7CCameraP8CTexture
/* 72E30 00172D30 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 72E34 00172D34 0000BF7F */  sq         $31, 0x0($sp)
/* 72E38 00172D38 688F828F */  lw         $2, -0x7098($gp)
/* 72E3C 00172D3C 01004224 */  addiu      $2, $2, 0x1
/* 72E40 00172D40 688F82AF */  sw         $2, -0x7098($gp)
/* 72E44 00172D44 688F828F */  lw         $2, -0x7098($gp)
/* 72E48 00172D48 04004128 */  slti       $at, $2, 0x4
/* 72E4C 00172D4C 03002014 */  bnez       $at, .L00172D5C
/* 72E50 00172D50 00000000 */   nop
/* 72E54 00172D54 04000224 */  addiu      $2, $0, 0x4
/* 72E58 00172D58 688F82AF */  sw         $2, -0x7098($gp)
.L00172D5C:
/* 72E5C 00172D5C 688F828F */  lw         $2, -0x7098($gp)
/* 72E60 00172D60 04004128 */  slti       $at, $2, 0x4
/* 72E64 00172D64 04002010 */  beqz       $at, .L00172D78
/* 72E68 00172D68 00000000 */   nop
/* 72E6C 00172D6C 28160070 */  paddub     $2, $0, $0
/* 72E70 00172D70 6B000010 */  b          .L00172F20
/* 72E74 00172D74 00000000 */   nop
.L00172D78:
/* 72E78 00172D78 0400A010 */  beqz       $5, .L00172D8C
/* 72E7C 00172D7C 00000000 */   nop
/* 72E80 00172D80 2826A070 */  paddub     $4, $5, $0
/* 72E84 00172D84 80CF050C */  jal        EdSaveFrameImage__F8CTexture
/* 72E88 00172D88 00000000 */   nop
.L00172D8C:
/* 72E8C 00172D8C CC01023C */  lui        $2, %hi(GamePad)
/* 72E90 00172D90 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 72E94 00172D94 78000524 */  addiu      $5, $0, 0x78
/* 72E98 00172D98 48AE040C */  jal        MenuModeOn__8CGamePadFi
/* 72E9C 00172D9C 00000000 */   nop
/* 72EA0 00172DA0 2600023C */  lui        $2, %hi(_494_2)
/* 72EA4 00172DA4 706F4224 */  addiu      $2, $2, %lo(_494_2)
/* 72EA8 00172DA8 1000A527 */  addiu      $5, $sp, 0x10
/* 72EAC 00172DAC 00004378 */  lq         $3, 0x0($2)
/* 72EB0 00172DB0 100042C4 */  lwc1       $f2, 0x10($2)
/* 72EB4 00172DB4 0000A37C */  sq         $3, 0x0($5)
/* 72EB8 00172DB8 1000A2E4 */  swc1       $f2, 0x10($5)
/* 72EBC 00172DBC 6C8F848F */  lw         $4, -0x7094($gp)
/* 72EC0 00172DC0 0B00812C */  sltiu      $at, $4, 0xB
/* 72EC4 00172DC4 55002010 */  beqz       $at, .L00172F1C
/* 72EC8 00172DC8 00000000 */   nop
/* 72ECC 00172DCC 2A00023C */  lui        $2, %hi(_507_2)
/* 72ED0 00172DD0 B0A24324 */  addiu      $3, $2, %lo(_507_2)
/* 72ED4 00172DD4 80100400 */  sll        $2, $4, 2
/* 72ED8 00172DD8 21104300 */  addu       $2, $2, $3
/* 72EDC 00172DDC 0000428C */  lw         $2, 0x0($2)
/* 72EE0 00172DE0 08004000 */  jr         $2
/* 72EE4 00172DE4 00000000 */   nop
/* 72EE8 00172DE8 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 72EEC 00172DEC D09B228C */  lw         $2, -0x6430($at)
/* 72EF0 00172DF0 26284000 */  xor        $5, $2, $0
/* 72EF4 00172DF4 0100A52C */  sltiu      $5, $5, 0x1
/* 72EF8 00172DF8 1000A427 */  addiu      $4, $sp, 0x10
/* 72EFC 00172DFC AC42080C */  jal        EditMenuInit__FPii
/* 72F00 00172E00 00000000 */   nop
/* 72F04 00172E04 06000224 */  addiu      $2, $0, 0x6
/* 72F08 00172E08 45000010 */  b          .L00172F20
/* 72F0C 00172E0C 00000000 */   nop
/* 72F10 00172E10 2826A070 */  paddub     $4, $5, $0
/* 72F14 00172E14 01000524 */  addiu      $5, $0, 0x1
/* 72F18 00172E18 3CD7070C */  jal        BattleMenuInit__FPii
/* 72F1C 00172E1C 00000000 */   nop
/* 72F20 00172E20 3E000010 */  b          .L00172F1C
/* 72F24 00172E24 00000000 */   nop
/* 72F28 00172E28 1000A427 */  addiu      $4, $sp, 0x10
/* 72F2C 00172E2C 748F858F */  lw         $5, -0x708C($gp)
/* 72F30 00172E30 01000624 */  addiu      $6, $0, 0x1
/* 72F34 00172E34 D09B070C */  jal        ShopNoInput__FPiii
/* 72F38 00172E38 00000000 */   nop
/* 72F3C 00172E3C 37000010 */  b          .L00172F1C
/* 72F40 00172E40 00000000 */   nop
/* 72F44 00172E44 1C8D848F */  lw         $4, -0x72E4($gp)
/* 72F48 00172E48 7860050C */  jal        GetDngStatus__9CSaveDataFv
/* 72F4C 00172E4C 00000000 */   nop
/* 72F50 00172E50 10000424 */  addiu      $4, $0, 0x10
/* 72F54 00172E54 D201033C */  lui        $3, %hi(use_item_list)
/* 72F58 00172E58 009A6524 */  addiu      $5, $3, %lo(use_item_list)
/* 72F5C 00172E5C 60434624 */  addiu      $6, $2, 0x4360
/* 72F60 00172E60 B4000724 */  addiu      $7, $0, 0xB4
/* 72F64 00172E64 D2000824 */  addiu      $8, $0, 0xD2
/* 72F68 00172E68 01000924 */  addiu      $9, $0, 0x1
/* 72F6C 00172E6C 28560070 */  paddub     $10, $0, $0
/* 72F70 00172E70 188F080C */  jal        InitEventItemSelect__FiPiP9ITEM_PACKiiii
/* 72F74 00172E74 00000000 */   nop
/* 72F78 00172E78 28000010 */  b          .L00172F1C
/* 72F7C 00172E7C 00000000 */   nop
/* 72F80 00172E80 1C8D848F */  lw         $4, -0x72E4($gp)
/* 72F84 00172E84 7860050C */  jal        GetDngStatus__9CSaveDataFv
/* 72F88 00172E88 00000000 */   nop
/* 72F8C 00172E8C 10000424 */  addiu      $4, $0, 0x10
/* 72F90 00172E90 D201033C */  lui        $3, %hi(use_item_list)
/* 72F94 00172E94 009A6524 */  addiu      $5, $3, %lo(use_item_list)
/* 72F98 00172E98 60434624 */  addiu      $6, $2, 0x4360
/* 72F9C 00172E9C B4000724 */  addiu      $7, $0, 0xB4
/* 72FA0 00172EA0 D2000824 */  addiu      $8, $0, 0xD2
/* 72FA4 00172EA4 01000924 */  addiu      $9, $0, 0x1
/* 72FA8 00172EA8 28562071 */  paddub     $10, $9, $0
/* 72FAC 00172EAC 188F080C */  jal        InitEventItemSelect__FiPiP9ITEM_PACKiiii
/* 72FB0 00172EB0 00000000 */   nop
/* 72FB4 00172EB4 19000010 */  b          .L00172F1C
/* 72FB8 00172EB8 00000000 */   nop
/* 72FBC 00172EBC 788F848F */  lw         $4, -0x7088($gp)
/* 72FC0 00172EC0 10000524 */  addiu      $5, $0, 0x10
/* 72FC4 00172EC4 28360070 */  paddub     $6, $0, $0
/* 72FC8 00172EC8 28E1080C */  jal        InitNameRegist__FiiP1
/* 72FCC 00172ECC 00000000 */   nop
/* 72FD0 00172ED0 12000010 */  b          .L00172F1C
/* 72FD4 00172ED4 00000000 */   nop
/* 72FD8 00172ED8 948B868F */  lw         $6, -0x746C($gp)
/* 72FDC 00172EDC 05000424 */  addiu      $4, $0, 0x5
/* 72FE0 00172EE0 10000524 */  addiu      $5, $0, 0x10
/* 72FE4 00172EE4 BC1F080C */  jal        InitMenuMove__FiiP1
/* 72FE8 00172EE8 00000000 */   nop
/* 72FEC 00172EEC 0B000010 */  b          .L00172F1C
/* 72FF0 00172EF0 00000000 */   nop
/* 72FF4 00172EF4 28260070 */  paddub     $4, $0, $0
/* 72FF8 00172EF8 28360070 */  paddub     $6, $0, $0
/* 72FFC 00172EFC 04C5070C */  jal        InitFishingExchange__FP1Pii
/* 73000 00172F00 00000000 */   nop
/* 73004 00172F04 05000010 */  b          .L00172F1C
/* 73008 00172F08 00000000 */   nop
/* 7300C 00172F0C 28260070 */  paddub     $4, $0, $0
/* 73010 00172F10 28360070 */  paddub     $6, $0, $0
/* 73014 00172F14 A0CB070C */  jal        InitFishRecordView__FP1Pii
/* 73018 00172F18 00000000 */   nop
.L00172F1C:
/* 7301C 00172F1C 08000224 */  addiu      $2, $0, 0x8
.L00172F20:
/* 73020 00172F20 0000BF7B */  lq         $31, 0x0($sp)
/* 73024 00172F24 3000BD27 */  addiu      $sp, $sp, 0x30
/* 73028 00172F28 0800E003 */  jr         $31
/* 7302C 00172F2C 00000000 */   nop
