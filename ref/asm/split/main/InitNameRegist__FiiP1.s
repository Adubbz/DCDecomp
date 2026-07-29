.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InitNameRegist__FiiP1
/* 1385A0 002384A0 C0FFBD27 */  addiu       $29, $29, -0x40
/* 1385A4 002384A4 3000BF7F */  sq          $31, 0x30($29)
/* 1385A8 002384A8 2000B27F */  sq          $18, 0x20($29)
/* 1385AC 002384AC 1000B17F */  sq          $17, 0x10($29)
/* 1385B0 002384B0 0000B07F */  sq          $16, 0x0($29)
/* 1385B4 002384B4 28968070 */  paddub      $18, $4, $0
/* 1385B8 002384B8 2886A070 */  paddub      $16, $5, $0
/* 1385BC 002384BC 288EC070 */  paddub      $17, $6, $0
/* 1385C0 002384C0 30FB040C */  jal         StartReadBG__Fv
/* 1385C4 002384C4 00000000 */   nop
/* 1385C8 002384C8 04002016 */  bnez        $17, .L002384DC
/* 1385CC 002384CC 00000000 */   nop
/* 1385D0 002384D0 948B918F */  lw          $17, -0x746C($28)
/* 1385D4 002384D4 01000010 */  b           .L002384DC
/* 1385D8 002384D8 00000000 */   nop
.L002384DC:
/* 1385DC 002384DC 28262072 */  paddub      $4, $17, $0
/* 1385E0 002384E0 00AF080C */  jal         MenuCalcBufAlignment__FP1
/* 1385E4 002384E4 00000000 */   nop
/* 1385E8 002384E8 2A00033C */  lui         $3, %hi(LIT_348__4)
/* 1385EC 002384EC D0F56424 */  addiu       $4, $3, %lo(LIT_348__4)
/* 1385F0 002384F0 282E4070 */  paddub      $5, $2, $0
/* 1385F4 002384F4 ACAE080C */  jal         LoadFileBGMenuData__FPcP1
/* 1385F8 002384F8 00000000 */   nop
/* 1385FC 002384FC 80AE080C */  jal         GetMenuLangFlag__Fv
/* 138600 00238500 00000000 */   nop
/* 138604 00238504 DB01013C */  lui         $1, %hi(NameSelect + 0x24)
/* 138608 00238508 64BC22A4 */  sh          $2, %lo(NameSelect + 0x24)($1)
/* 13860C 0023850C CC01023C */  lui         $2, %hi(GamePad)
/* 138610 00238510 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 138614 00238514 78000524 */  addiu       $5, $0, 0x78
/* 138618 00238518 48AE040C */  jal         MenuModeOn__8CGamePadFi
/* 13861C 0023851C 00000000 */   nop
/* 138620 00238520 CC01023C */  lui         $2, %hi(GamePad)
/* 138624 00238524 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 138628 00238528 00F00534 */  ori         $5, $0, 0xF000
/* 13862C 0023852C 1E000624 */  addiu       $6, $0, 0x1E
/* 138630 00238530 09000724 */  addiu       $7, $0, 0x9
/* 138634 00238534 58AD040C */  jal         SetAutoRepeat__8CGamePadFiii
/* 138638 00238538 00000000 */   nop
/* 13863C 0023853C DB01013C */  lui         $1, %hi(NameSelect)
/* 138640 00238540 40BC32A4 */  sh          $18, %lo(NameSelect)($1)
/* 138644 00238544 04000224 */  addiu       $2, $0, 0x4
/* 138648 00238548 DB01013C */  lui         $1, %hi(NameSelect + 0x2)
/* 13864C 0023854C 42BC22A4 */  sh          $2, %lo(NameSelect + 0x2)($1)
/* 138650 00238550 DB01013C */  lui         $1, %hi(NameSelect + 0xC)
/* 138654 00238554 4CBC20AC */  sw          $0, %lo(NameSelect + 0xC)($1)
/* 138658 00238558 DB01013C */  lui         $1, %hi(NameSelect + 0x24)
/* 13865C 0023855C 64BC2384 */  lh          $3, %lo(NameSelect + 0x24)($1)
/* 138660 00238560 01000224 */  addiu       $2, $0, 0x1
/* 138664 00238564 09006210 */  beq         $3, $2, .L0023858C
/* 138668 00238568 00000000 */   nop
/* 13866C 0023856C 03006010 */  beqz        $3, .L0023857C
/* 138670 00238570 00000000 */   nop
/* 138674 00238574 05000010 */  b           .L0023858C
/* 138678 00238578 00000000 */   nop
.L0023857C:
/* 13867C 0023857C DB01013C */  lui         $1, %hi(NameSelect + 0xA)
/* 138680 00238580 4ABC20A4 */  sh          $0, %lo(NameSelect + 0xA)($1)
/* 138684 00238584 04000010 */  b           .L00238598
/* 138688 00238588 00000000 */   nop
.L0023858C:
/* 13868C 0023858C 02000224 */  addiu       $2, $0, 0x2
/* 138690 00238590 DB01013C */  lui         $1, %hi(NameSelect + 0xA)
/* 138694 00238594 4ABC22A4 */  sh          $2, %lo(NameSelect + 0xA)($1)
.L00238598:
/* 138698 00238598 DB01013C */  lui         $1, %hi(NameSelect + 0x6)
/* 13869C 0023859C 46BC20A4 */  sh          $0, %lo(NameSelect + 0x6)($1)
/* 1386A0 002385A0 01000224 */  addiu       $2, $0, 0x1
/* 1386A4 002385A4 DB01013C */  lui         $1, %hi(NameSelect + 0x10)
/* 1386A8 002385A8 50BC22A4 */  sh          $2, %lo(NameSelect + 0x10)($1)
/* 1386AC 002385AC DB01013C */  lui         $1, %hi(NameSelect + 0x14)
/* 1386B0 002385B0 54BC20AC */  sw          $0, %lo(NameSelect + 0x14)($1)
/* 1386B4 002385B4 DB01013C */  lui         $1, %hi(NameSelect + 0x28)
/* 1386B8 002385B8 68BC20A4 */  sh          $0, %lo(NameSelect + 0x28)($1)
/* 1386BC 002385BC DB01013C */  lui         $1, %hi(NameSelect + 0x26)
/* 1386C0 002385C0 66BC30A4 */  sh          $16, %lo(NameSelect + 0x26)($1)
/* 1386C4 002385C4 C842023C */  lui         $2, (0x42C80000 >> 16)
/* 1386C8 002385C8 DB01013C */  lui         $1, %hi(NameSelect + 0x18)
/* 1386CC 002385CC 58BC22AC */  sw          $2, %lo(NameSelect + 0x18)($1)
/* 1386D0 002385D0 7243023C */  lui         $2, (0x43720000 >> 16)
/* 1386D4 002385D4 DB01013C */  lui         $1, %hi(NameSelect + 0x1C)
/* 1386D8 002385D8 5CBC22AC */  sw          $2, %lo(NameSelect + 0x1C)($1)
/* 1386DC 002385DC DB01013C */  lui         $1, %hi(NameSelect + 0x20)
/* 1386E0 002385E0 60BC20AC */  sw          $0, %lo(NameSelect + 0x20)($1)
/* 1386E4 002385E4 DB01013C */  lui         $1, %hi(NameSelect)
/* 1386E8 002385E8 40BC2584 */  lh          $5, %lo(NameSelect)($1)
/* 1386EC 002385EC 1C8D848F */  lw          $4, -0x72E4($28)
/* 1386F0 002385F0 D45E050C */  jal         GetCharaName__9CSaveDataFi
/* 1386F4 002385F4 00000000 */   nop
/* 1386F8 002385F8 BC9782AF */  sw          $2, -0x6844($28)
/* 1386FC 002385FC DB01013C */  lui         $1, %hi(NameSelect)
/* 138700 00238600 40BC2484 */  lh          $4, %lo(NameSelect)($1)
/* 138704 00238604 DCF1080C */  jal         NameDefaultSet__Fi
/* 138708 00238608 00000000 */   nop
/* 13870C 0023860C DB01013C */  lui         $1, %hi(NameSelect + 0x4)
/* 138710 00238610 44BC20A4 */  sh          $0, %lo(NameSelect + 0x4)($1)
/* 138714 00238614 3000BF7B */  lq          $31, 0x30($29)
/* 138718 00238618 2000B27B */  lq          $18, 0x20($29)
/* 13871C 0023861C 1000B17B */  lq          $17, 0x10($29)
/* 138720 00238620 0000B07B */  lq          $16, 0x0($29)
/* 138724 00238624 4000BD27 */  addiu       $29, $29, 0x40
/* 138728 00238628 0800E003 */  jr          $31
/* 13872C 0023862C 00000000 */   nop
