.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BtCleatFreeMap__Fv
/* 00D4C0 01DB91C0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 00D4C4 01DB91C4 0000BF7F */  sq          $31, 0x0($29)
/* 00D4C8 01DB91C8 DD01013C */  lui         $1, %hi(DrawProcH__Fv + 0xEC)
/* 00D4CC 01DB91CC CC09268C */  lw          $6, %lo(DrawProcH__Fv + 0xEC)($1)
/* 00D4D0 01DB91D0 789C828F */  lw          $2, -0x6388($28)
/* 00D4D4 01DB91D4 02004580 */  lb          $5, 0x2($2)
/* 00D4D8 01DB91D8 DC01023C */  lui         $2, %hi(MainDungeonMap)
/* 00D4DC 01DB91DC E04B4424 */  addiu       $4, $2, %lo(MainDungeonMap)
/* 00D4E0 01DB91E0 01000724 */  addiu       $7, $0, 0x1
/* 00D4E4 01DB91E4 5021070C */  jal         buildEventData__11CDungeonMapFiii
/* 00D4E8 01DB91E8 00000000 */   nop
/* 00D4EC 01DB91EC DC01023C */  lui         $2, %hi(MainDungeonMap)
/* 00D4F0 01DB91F0 E04B4424 */  addiu       $4, $2, %lo(MainDungeonMap)
/* 00D4F4 01DB91F4 000F070C */  jal         FlushCheckMask__11CDungeonMapFv
/* 00D4F8 01DB91F8 00000000 */   nop
/* 00D4FC 01DB91FC DD01013C */  lui         $1, %hi(DrawProcH__Fv + 0xEC)
/* 00D500 01DB9200 CC09258C */  lw          $5, %lo(DrawProcH__Fv + 0xEC)($1)
/* 00D504 01DB9204 DC01023C */  lui         $2, %hi(MainDungeonMap)
/* 00D508 01DB9208 E04B4424 */  addiu       $4, $2, %lo(MainDungeonMap)
/* 00D50C 01DB920C 3009070C */  jal         DrawMapCalc__11CDungeonMapFi
/* 00D510 01DB9210 00000000 */   nop
/* 00D514 01DB9214 DD01013C */  lui         $1, %hi(DrawProcH__Fv + 0xEC)
/* 00D518 01DB9218 CC09268C */  lw          $6, %lo(DrawProcH__Fv + 0xEC)($1)
/* 00D51C 01DB921C DF01023C */  lui         $2, %hi(DngEventMan)
/* 00D520 01DB9220 B0364424 */  addiu       $4, $2, %lo(DngEventMan)
/* 00D524 01DB9224 DC01023C */  lui         $2, %hi(MainDungeonMap)
/* 00D528 01DB9228 E04B4524 */  addiu       $5, $2, %lo(MainDungeonMap)
/* 00D52C 01DB922C D033070C */  jal         SetupEvent__16CDungeonEventManFP11CDungeonMapi
/* 00D530 01DB9230 00000000 */   nop
/* 00D534 01DB9234 2C9E858F */  lw          $5, -0x61D4($28)
/* 00D538 01DB9238 28260070 */  paddub      $4, $0, $0
/* 00D53C 01DB923C 10000010 */  b           .L01DB9280_2F4880
/* 00D540 01DB9240 00000000 */   nop
.L01DB9244_2F4844:
/* 00D544 01DB9244 FFFF0324 */  addiu       $3, $0, -0x1
/* 00D548 01DB9248 80300400 */  sll         $6, $4, 2
/* 00D54C 01DB924C EA01023C */  lui         $2, %hi(MainRandomItem + 0x290)
/* 00D550 01DB9250 50794224 */  addiu       $2, $2, %lo(MainRandomItem + 0x290)
/* 00D554 01DB9254 21104600 */  addu        $2, $2, $6
/* 00D558 01DB9258 000043AC */  sw          $3, 0x0($2)
/* 00D55C 01DB925C EA01023C */  lui         $2, %hi(MainRandomItem + 0x494)
/* 00D560 01DB9260 547B4224 */  addiu       $2, $2, %lo(MainRandomItem + 0x494)
/* 00D564 01DB9264 21104600 */  addu        $2, $2, $6
/* 00D568 01DB9268 000043AC */  sw          $3, 0x0($2)
/* 00D56C 01DB926C EA01023C */  lui         $2, %hi(MainRandomItem + 0x514)
/* 00D570 01DB9270 D47B4224 */  addiu       $2, $2, %lo(MainRandomItem + 0x514)
/* 00D574 01DB9274 21104600 */  addu        $2, $2, $6
/* 00D578 01DB9278 000040AC */  sw          $0, 0x0($2)
/* 00D57C 01DB927C 01008424 */  addiu       $4, $4, 0x1
.L01DB9280_2F4880:
/* 00D580 01DB9280 20008228 */  slti        $2, $4, 0x20
/* 00D584 01DB9284 EFFF4014 */  bnez        $2, .L01DB9244_2F4844
/* 00D588 01DB9288 00000000 */   nop
/* 00D58C 01DB928C EA01013C */  lui         $1, %hi(MainRandomItem)
/* 00D590 01DB9290 C07625AC */  sw          $5, %lo(MainRandomItem)($1)
/* 00D594 01DB9294 EA01023C */  lui         $2, %hi(MainRandomItem)
/* 00D598 01DB9298 C0764224 */  addiu       $2, $2, %lo(MainRandomItem)
/* 00D59C 01DB929C 089D82AF */  sw          $2, -0x62F8($28)
/* 00D5A0 01DB92A0 789C848F */  lw          $4, -0x6388($28)
/* 00D5A4 01DB92A4 C8F6060C */  jal         ClearEventFlag__11CUserStatusFv
/* 00D5A8 01DB92A8 00000000 */   nop
/* 00D5AC 01DB92AC C49C80AF */  sw          $0, -0x633C($28)
/* 00D5B0 01DB92B0 DC01033C */  lui         $3, %hi(MainDungeonMap)
/* 00D5B4 01DB92B4 E04B6324 */  addiu       $3, $3, %lo(MainDungeonMap)
/* 00D5B8 01DB92B8 C89C83AF */  sw          $3, -0x6338($28)
/* 00D5BC 01DB92BC DF01033C */  lui         $3, %hi(DngEventMan)
/* 00D5C0 01DB92C0 B0366324 */  addiu       $3, $3, %lo(DngEventMan)
/* 00D5C4 01DB92C4 D09C83AF */  sw          $3, -0x6330($28)
/* 00D5C8 01DB92C8 AC9D80AF */  sw          $0, -0x6254($28)
/* 00D5CC 01DB92CC B09D80AF */  sw          $0, -0x6250($28)
/* 00D5D0 01DB92D0 0000BF7B */  lq          $31, 0x0($29)
/* 00D5D4 01DB92D4 1000BD27 */  addiu       $29, $29, 0x10
/* 00D5D8 01DB92D8 0800E003 */  jr          $31
/* 00D5DC 01DB92DC 00000000 */   nop
