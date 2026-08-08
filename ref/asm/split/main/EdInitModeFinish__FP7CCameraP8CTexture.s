.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdInitModeFinish__FP7CCameraP8CTexture
/* 072E30 00172D30 D0FFBD27 */  addiu       $29, $29, -0x30
/* 072E34 00172D34 0000BF7F */  sq          $31, 0x0($29)
/* 072E38 00172D38 688F828F */  lw          $2, -0x7098($28)
/* 072E3C 00172D3C 01004224 */  addiu       $2, $2, 0x1
/* 072E40 00172D40 688F82AF */  sw          $2, -0x7098($28)
/* 072E44 00172D44 688F828F */  lw          $2, -0x7098($28)
/* 072E48 00172D48 04004128 */  slti        $1, $2, 0x4
/* 072E4C 00172D4C 03002014 */  bnez        $1, .L00172D5C
/* 072E50 00172D50 00000000 */   nop
/* 072E54 00172D54 04000224 */  addiu       $2, $0, 0x4
/* 072E58 00172D58 688F82AF */  sw          $2, -0x7098($28)
.L00172D5C:
/* 072E5C 00172D5C 688F828F */  lw          $2, -0x7098($28)
/* 072E60 00172D60 04004128 */  slti        $1, $2, 0x4
/* 072E64 00172D64 04002010 */  beqz        $1, .L00172D78
/* 072E68 00172D68 00000000 */   nop
/* 072E6C 00172D6C 28160070 */  paddub      $2, $0, $0
/* 072E70 00172D70 6B000010 */  b           .L00172F20
/* 072E74 00172D74 00000000 */   nop
.L00172D78:
/* 072E78 00172D78 0400A010 */  beqz        $5, .L00172D8C
/* 072E7C 00172D7C 00000000 */   nop
/* 072E80 00172D80 2826A070 */  paddub      $4, $5, $0
/* 072E84 00172D84 80CF050C */  jal         EdSaveFrameImage__F8CTexture
/* 072E88 00172D88 00000000 */   nop
.L00172D8C:
/* 072E8C 00172D8C CC01023C */  lui         $2, %hi(GamePad)
/* 072E90 00172D90 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 072E94 00172D94 78000524 */  addiu       $5, $0, 0x78
/* 072E98 00172D98 48AE040C */  jal         MenuModeOn__8CGamePadFi
/* 072E9C 00172D9C 00000000 */   nop
/* 072EA0 00172DA0 2600023C */  lui         $2, %hi(LIT_494__2)
/* 072EA4 00172DA4 706F4224 */  addiu       $2, $2, %lo(LIT_494__2)
/* 072EA8 00172DA8 1000A527 */  addiu       $5, $29, 0x10
/* 072EAC 00172DAC 00004378 */  lq          $3, 0x0($2)
/* 072EB0 00172DB0 100042C4 */  lwc1        $f2, 0x10($2)
/* 072EB4 00172DB4 0000A37C */  sq          $3, 0x0($5)
/* 072EB8 00172DB8 1000A2E4 */  swc1        $f2, 0x10($5)
/* 072EBC 00172DBC 6C8F848F */  lw          $4, -0x7094($28)
/* 072EC0 00172DC0 0B00812C */  sltiu       $1, $4, 0xB
/* 072EC4 00172DC4 55002010 */  beqz        $1, .L.L00172F1C$b
/* 072EC8 00172DC8 00000000 */   nop
/* 072ECC 00172DCC 2A00023C */  lui         $2, %hi(LIT_507__2)
/* 072ED0 00172DD0 B0A24324 */  addiu       $3, $2, %lo(LIT_507__2)
/* 072ED4 00172DD4 80100400 */  sll         $2, $4, 2
/* 072ED8 00172DD8 21104300 */  addu        $2, $2, $3
/* 072EDC 00172DDC 0000428C */  lw          $2, 0x0($2)
/* 072EE0 00172DE0 08004000 */  jr          $2
/* 072EE4 00172DE4 00000000 */   nop
jlabel .L00172DE8
/* 072EE8 00172DE8 D201013C */  lui         $1, %hi(EditMenuStatus)
/* 072EEC 00172DEC D09B228C */  lw          $2, %lo(EditMenuStatus)($1)
/* 072EF0 00172DF0 26284000 */  xor         $5, $2, $0
/* 072EF4 00172DF4 0100A52C */  sltiu       $5, $5, 0x1
/* 072EF8 00172DF8 1000A427 */  addiu       $4, $29, 0x10
/* 072EFC 00172DFC AC42080C */  jal         EditMenuInit__FPii
/* 072F00 00172E00 00000000 */   nop
/* 072F04 00172E04 06000224 */  addiu       $2, $0, 0x6
/* 072F08 00172E08 45000010 */  b           .L00172F20
/* 072F0C 00172E0C 00000000 */   nop
jlabel .L00172E10
/* 072F10 00172E10 2826A070 */  paddub      $4, $5, $0
/* 072F14 00172E14 01000524 */  addiu       $5, $0, 0x1
/* 072F18 00172E18 3CD7070C */  jal         BattleMenuInit__FPii
/* 072F1C 00172E1C 00000000 */   nop
/* 072F20 00172E20 3E000010 */  b           .L.L00172F1C$b
/* 072F24 00172E24 00000000 */   nop
jlabel .L00172E28
/* 072F28 00172E28 1000A427 */  addiu       $4, $29, 0x10
/* 072F2C 00172E2C 748F858F */  lw          $5, -0x708C($28)
/* 072F30 00172E30 01000624 */  addiu       $6, $0, 0x1
/* 072F34 00172E34 D09B070C */  jal         ShopNoInput__FPiii
/* 072F38 00172E38 00000000 */   nop
/* 072F3C 00172E3C 37000010 */  b           .L.L00172F1C$b
/* 072F40 00172E40 00000000 */   nop
jlabel .L00172E44
/* 072F44 00172E44 1C8D848F */  lw          $4, -0x72E4($28)
/* 072F48 00172E48 7860050C */  jal         GetDngStatus__9CSaveDataFv
/* 072F4C 00172E4C 00000000 */   nop
/* 072F50 00172E50 10000424 */  addiu       $4, $0, 0x10
/* 072F54 00172E54 D201033C */  lui         $3, %hi(use_item_list)
/* 072F58 00172E58 009A6524 */  addiu       $5, $3, %lo(use_item_list)
/* 072F5C 00172E5C 60434624 */  addiu       $6, $2, 0x4360
/* 072F60 00172E60 B4000724 */  addiu       $7, $0, 0xB4
/* 072F64 00172E64 D2000824 */  addiu       $8, $0, 0xD2
/* 072F68 00172E68 01000924 */  addiu       $9, $0, 0x1
/* 072F6C 00172E6C 28560070 */  paddub      $10, $0, $0
/* 072F70 00172E70 188F080C */  jal         InitEventItemSelect__FiPiP9ITEM_PACKiiii
/* 072F74 00172E74 00000000 */   nop
/* 072F78 00172E78 28000010 */  b           .L.L00172F1C$b
/* 072F7C 00172E7C 00000000 */   nop
jlabel .L00172E80
/* 072F80 00172E80 1C8D848F */  lw          $4, -0x72E4($28)
/* 072F84 00172E84 7860050C */  jal         GetDngStatus__9CSaveDataFv
/* 072F88 00172E88 00000000 */   nop
/* 072F8C 00172E8C 10000424 */  addiu       $4, $0, 0x10
/* 072F90 00172E90 D201033C */  lui         $3, %hi(use_item_list)
/* 072F94 00172E94 009A6524 */  addiu       $5, $3, %lo(use_item_list)
/* 072F98 00172E98 60434624 */  addiu       $6, $2, 0x4360
/* 072F9C 00172E9C B4000724 */  addiu       $7, $0, 0xB4
/* 072FA0 00172EA0 D2000824 */  addiu       $8, $0, 0xD2
/* 072FA4 00172EA4 01000924 */  addiu       $9, $0, 0x1
/* 072FA8 00172EA8 28562071 */  paddub      $10, $9, $0
/* 072FAC 00172EAC 188F080C */  jal         InitEventItemSelect__FiPiP9ITEM_PACKiiii
/* 072FB0 00172EB0 00000000 */   nop
/* 072FB4 00172EB4 19000010 */  b           .L.L00172F1C$b
/* 072FB8 00172EB8 00000000 */   nop
jlabel .L00172EBC
/* 072FBC 00172EBC 788F848F */  lw          $4, -0x7088($28)
/* 072FC0 00172EC0 10000524 */  addiu       $5, $0, 0x10
/* 072FC4 00172EC4 28360070 */  paddub      $6, $0, $0
/* 072FC8 00172EC8 28E1080C */  jal         InitNameRegist__FiiP1
/* 072FCC 00172ECC 00000000 */   nop
/* 072FD0 00172ED0 12000010 */  b           .L.L00172F1C$b
/* 072FD4 00172ED4 00000000 */   nop
jlabel .L00172ED8
/* 072FD8 00172ED8 948B868F */  lw          $6, -0x746C($28)
/* 072FDC 00172EDC 05000424 */  addiu       $4, $0, 0x5
/* 072FE0 00172EE0 10000524 */  addiu       $5, $0, 0x10
/* 072FE4 00172EE4 BC1F080C */  jal         InitMenuMove__FiiP1
/* 072FE8 00172EE8 00000000 */   nop
/* 072FEC 00172EEC 0B000010 */  b           .L.L00172F1C$b
/* 072FF0 00172EF0 00000000 */   nop
jlabel .L00172EF4
/* 072FF4 00172EF4 28260070 */  paddub      $4, $0, $0
/* 072FF8 00172EF8 28360070 */  paddub      $6, $0, $0
/* 072FFC 00172EFC 04C5070C */  jal         InitFishingExchange__FP1Pii
/* 073000 00172F00 00000000 */   nop
/* 073004 00172F04 05000010 */  b           .L.L00172F1C$b
/* 073008 00172F08 00000000 */   nop
jlabel .L00172F0C
/* 07300C 00172F0C 28260070 */  paddub      $4, $0, $0
/* 073010 00172F10 28360070 */  paddub      $6, $0, $0
/* 073014 00172F14 A0CB070C */  jal         InitFishRecordView__FP1Pii
/* 073018 00172F18 00000000 */   nop
jlabel .L00172F1C
.L.L00172F1C$b:
/* 07301C 00172F1C 08000224 */  addiu       $2, $0, 0x8
.L00172F20:
/* 073020 00172F20 0000BF7B */  lq          $31, 0x0($29)
/* 073024 00172F24 3000BD27 */  addiu       $29, $29, 0x30
/* 073028 00172F28 0800E003 */  jr          $31
/* 07302C 00172F2C 00000000 */   nop
