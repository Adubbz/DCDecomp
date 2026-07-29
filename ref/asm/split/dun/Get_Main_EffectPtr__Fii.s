.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Get_Main_EffectPtr__Fii
/* 00E360 01DBA060 0600812C */  sltiu       $1, $4, 0x6
/* 00E364 01DBA064 6E002010 */  beqz        $1, .L01DBA220_2F5820
/* 00E368 01DBA068 00000000 */   nop
/* 00E36C 01DBA06C DC01023C */  lui         $2, %hi(LIT_5137)
/* 00E370 01DBA070 10314324 */  addiu       $3, $2, %lo(LIT_5137)
/* 00E374 01DBA074 80100400 */  sll         $2, $4, 2
/* 00E378 01DBA078 21104300 */  addu        $2, $2, $3
/* 00E37C 01DBA07C 0000428C */  lw          $2, 0x0($2)
/* 00E380 01DBA080 08004000 */  jr          $2
/* 00E384 01DBA084 00000000 */   nop
jlabel .L01DBA088_2F5688
.L01DBA088_2F5688$b:
/* 00E388 01DBA088 DC01013C */  lui         $1, %hi(MyEffectEntry_Tbl)
/* 00E38C 01DBA08C F021228C */  lw          $2, %lo(MyEffectEntry_Tbl)($1)
/* 00E390 01DBA090 64000010 */  b           .L01DBA224_2F5824
/* 00E394 01DBA094 00000000 */   nop
jlabel .L01DBA098_2F5698
.L01DBA098_2F5698$b:
/* 00E398 01DBA098 DC01013C */  lui         $1, %hi(MyEffectEntry_Tbl + 0x4)
/* 00E39C 01DBA09C F421228C */  lw          $2, %lo(MyEffectEntry_Tbl + 0x4)($1)
/* 00E3A0 01DBA0A0 60000010 */  b           .L01DBA224_2F5824
/* 00E3A4 01DBA0A4 00000000 */   nop
jlabel .L01DBA0A8_2F56A8
.L01DBA0A8_2F56A8$b:
/* 00E3A8 01DBA0A8 DC01013C */  lui         $1, %hi(MyEffectEntry_Tbl + 0x8)
/* 00E3AC 01DBA0AC F821228C */  lw          $2, %lo(MyEffectEntry_Tbl + 0x8)($1)
/* 00E3B0 01DBA0B0 5C000010 */  b           .L01DBA224_2F5824
/* 00E3B4 01DBA0B4 00000000 */   nop
jlabel .L01DBA0B8_2F56B8
.L01DBA0B8_2F56B8$b:
/* 00E3B8 01DBA0B8 0400A004 */  bltz        $5, .L01DBA0CC_2F56CC
/* 00E3BC 01DBA0BC 00000000 */   nop
/* 00E3C0 01DBA0C0 0500A128 */  slti        $1, $5, 0x5
/* 00E3C4 01DBA0C4 02002014 */  bnez        $1, .L01DBA0D0_2F56D0
/* 00E3C8 01DBA0C8 00000000 */   nop
.L01DBA0CC_2F56CC:
/* 00E3CC 01DBA0CC 282E0070 */  paddub      $5, $0, $0
.L01DBA0D0_2F56D0:
/* 00E3D0 01DBA0D0 80180500 */  sll         $3, $5, 2
/* 00E3D4 01DBA0D4 DC01023C */  lui         $2, %hi(MyEffectEntry_Tbl + 0xC)
/* 00E3D8 01DBA0D8 FC214224 */  addiu       $2, $2, %lo(MyEffectEntry_Tbl + 0xC)
/* 00E3DC 01DBA0DC 21104300 */  addu        $2, $2, $3
/* 00E3E0 01DBA0E0 0000428C */  lw          $2, 0x0($2)
/* 00E3E4 01DBA0E4 4F000010 */  b           .L01DBA224_2F5824
/* 00E3E8 01DBA0E8 00000000 */   nop
jlabel .L01DBA0EC_2F56EC
.L01DBA0EC_2F56EC$b:
/* 00E3EC 01DBA0EC DC01013C */  lui         $1, %hi(MyEffectEntry_Tbl + 0x20)
/* 00E3F0 01DBA0F0 1022228C */  lw          $2, %lo(MyEffectEntry_Tbl + 0x20)($1)
/* 00E3F4 01DBA0F4 4B000010 */  b           .L01DBA224_2F5824
/* 00E3F8 01DBA0F8 00000000 */   nop
jlabel .L01DBA0FC_2F56FC
.L01DBA0FC_2F56FC$b:
/* 00E3FC 01DBA0FC 789C838F */  lw          $3, -0x6388($28)
/* 00E400 01DBA100 A80A0224 */  addiu       $2, $0, 0xAA8
/* 00E404 01DBA104 18108200 */  mult        $2, $4, $2
/* 00E408 01DBA108 21284300 */  addu        $5, $2, $3
/* 00E40C 01DBA10C 21108300 */  addu        $2, $4, $3
/* 00E410 01DBA110 40434380 */  lb          $3, 0x4340($2)
/* 00E414 01DBA114 40110300 */  sll         $2, $3, 5
/* 00E418 01DBA118 23104300 */  subu        $2, $2, $3
/* 00E41C 01DBA11C C0100200 */  sll         $2, $2, 3
/* 00E420 01DBA120 21104500 */  addu        $2, $2, $5
/* 00E424 01DBA124 0C454384 */  lh          $3, 0x450C($2)
/* 00E428 01DBA128 28260070 */  paddub      $4, $0, $0
/* 00E42C 01DBA12C DC01013C */  lui         $1, %hi(BtActStatus + 0xA0)
/* 00E430 01DBA130 204520AC */  sw          $0, %lo(BtActStatus + 0xA0)($1)
/* 00E434 01DBA134 6D010224 */  addiu       $2, $0, 0x16D
/* 00E438 01DBA138 04006214 */  bne         $3, $2, .L01DBA14C_2F574C
/* 00E43C 01DBA13C 00000000 */   nop
/* 00E440 01DBA140 03000424 */  addiu       $4, $0, 0x3
/* 00E444 01DBA144 DC01013C */  lui         $1, %hi(BtActStatus + 0xA0)
/* 00E448 01DBA148 204520AC */  sw          $0, %lo(BtActStatus + 0xA0)($1)
.L01DBA14C_2F574C:
/* 00E44C 01DBA14C 70010224 */  addiu       $2, $0, 0x170
/* 00E450 01DBA150 05006214 */  bne         $3, $2, .L01DBA168_2F5768
/* 00E454 01DBA154 00000000 */   nop
/* 00E458 01DBA158 28260070 */  paddub      $4, $0, $0
/* 00E45C 01DBA15C 02000224 */  addiu       $2, $0, 0x2
/* 00E460 01DBA160 DC01013C */  lui         $1, %hi(BtActStatus + 0xA0)
/* 00E464 01DBA164 204522AC */  sw          $2, %lo(BtActStatus + 0xA0)($1)
.L01DBA168_2F5768:
/* 00E468 01DBA168 71010224 */  addiu       $2, $0, 0x171
/* 00E46C 01DBA16C 05006214 */  bne         $3, $2, .L01DBA184_2F5784
/* 00E470 01DBA170 00000000 */   nop
/* 00E474 01DBA174 28260070 */  paddub      $4, $0, $0
/* 00E478 01DBA178 02000224 */  addiu       $2, $0, 0x2
/* 00E47C 01DBA17C DC01013C */  lui         $1, %hi(BtActStatus + 0xA0)
/* 00E480 01DBA180 204522AC */  sw          $2, %lo(BtActStatus + 0xA0)($1)
.L01DBA184_2F5784:
/* 00E484 01DBA184 72010224 */  addiu       $2, $0, 0x172
/* 00E488 01DBA188 04006214 */  bne         $3, $2, .L01DBA19C_2F579C
/* 00E48C 01DBA18C 00000000 */   nop
/* 00E490 01DBA190 04000424 */  addiu       $4, $0, 0x4
/* 00E494 01DBA194 DC01013C */  lui         $1, %hi(BtActStatus + 0xA0)
/* 00E498 01DBA198 204520AC */  sw          $0, %lo(BtActStatus + 0xA0)($1)
.L01DBA19C_2F579C:
/* 00E49C 01DBA19C 73010224 */  addiu       $2, $0, 0x173
/* 00E4A0 01DBA1A0 04006214 */  bne         $3, $2, .L01DBA1B4_2F57B4
/* 00E4A4 01DBA1A4 00000000 */   nop
/* 00E4A8 01DBA1A8 01000424 */  addiu       $4, $0, 0x1
/* 00E4AC 01DBA1AC DC01013C */  lui         $1, %hi(BtActStatus + 0xA0)
/* 00E4B0 01DBA1B0 204524AC */  sw          $4, %lo(BtActStatus + 0xA0)($1)
.L01DBA1B4_2F57B4:
/* 00E4B4 01DBA1B4 74010224 */  addiu       $2, $0, 0x174
/* 00E4B8 01DBA1B8 04006214 */  bne         $3, $2, .L01DBA1CC_2F57CC
/* 00E4BC 01DBA1BC 00000000 */   nop
/* 00E4C0 01DBA1C0 05000424 */  addiu       $4, $0, 0x5
/* 00E4C4 01DBA1C4 DC01013C */  lui         $1, %hi(BtActStatus + 0xA0)
/* 00E4C8 01DBA1C8 204520AC */  sw          $0, %lo(BtActStatus + 0xA0)($1)
.L01DBA1CC_2F57CC:
/* 00E4CC 01DBA1CC 75010224 */  addiu       $2, $0, 0x175
/* 00E4D0 01DBA1D0 05006214 */  bne         $3, $2, .L01DBA1E8_2F57E8
/* 00E4D4 01DBA1D4 00000000 */   nop
/* 00E4D8 01DBA1D8 02000424 */  addiu       $4, $0, 0x2
/* 00E4DC 01DBA1DC 01000224 */  addiu       $2, $0, 0x1
/* 00E4E0 01DBA1E0 DC01013C */  lui         $1, %hi(BtActStatus + 0xA0)
/* 00E4E4 01DBA1E4 204522AC */  sw          $2, %lo(BtActStatus + 0xA0)($1)
.L01DBA1E8_2F57E8:
/* 00E4E8 01DBA1E8 76010224 */  addiu       $2, $0, 0x176
/* 00E4EC 01DBA1EC 05006214 */  bne         $3, $2, .L01DBA204_2F5804
/* 00E4F0 01DBA1F0 00000000 */   nop
/* 00E4F4 01DBA1F4 02000424 */  addiu       $4, $0, 0x2
/* 00E4F8 01DBA1F8 01000224 */  addiu       $2, $0, 0x1
/* 00E4FC 01DBA1FC DC01013C */  lui         $1, %hi(BtActStatus + 0xA0)
/* 00E500 01DBA200 204522AC */  sw          $2, %lo(BtActStatus + 0xA0)($1)
.L01DBA204_2F5804:
/* 00E504 01DBA204 80180400 */  sll         $3, $4, 2
/* 00E508 01DBA208 DC01023C */  lui         $2, %hi(MyEffectEntry_Tbl + 0x24)
/* 00E50C 01DBA20C 14224224 */  addiu       $2, $2, %lo(MyEffectEntry_Tbl + 0x24)
/* 00E510 01DBA210 21104300 */  addu        $2, $2, $3
/* 00E514 01DBA214 0000428C */  lw          $2, 0x0($2)
/* 00E518 01DBA218 02000010 */  b           .L01DBA224_2F5824
/* 00E51C 01DBA21C 00000000 */   nop
.L01DBA220_2F5820:
/* 00E520 01DBA220 28160070 */  paddub      $2, $0, $0
.L01DBA224_2F5824:
/* 00E524 01DBA224 0800E003 */  jr          $31
/* 00E528 01DBA228 00000000 */   nop
/* 00E52C 01DBA22C 00000000 */  nop
