.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InitFishingExchange__FP1Pii
/* 0F1510 001F1410 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0F1514 001F1414 2000BF7F */  sq          $31, 0x20($29)
/* 0F1518 001F1418 1000B17F */  sq          $17, 0x10($29)
/* 0F151C 001F141C 0000B07F */  sq          $16, 0x0($29)
/* 0F1520 001F1420 288EA070 */  paddub      $17, $5, $0
/* 0F1524 001F1424 2886C070 */  paddub      $16, $6, $0
/* 0F1528 001F1428 D201013C */  lui         $1, %hi(EdMenuBuffer + 0x8)
/* 0F152C 001F142C D8B3228C */  lw          $2, %lo(EdMenuBuffer + 0x8)($1)
/* 0F1530 001F1430 00190200 */  sll         $3, $2, 4
/* 0F1534 001F1434 D201013C */  lui         $1, %hi(EdMenuBuffer)
/* 0F1538 001F1438 D0B3228C */  lw          $2, %lo(EdMenuBuffer)($1)
/* 0F153C 001F143C 21104300 */  addu        $2, $2, $3
/* 0F1540 001F1440 D901013C */  lui         $1, %hi(FishMenu + 0x24)
/* 0F1544 001F1444 B40322AC */  sw          $2, %lo(FishMenu + 0x24)($1)
/* 0F1548 001F1448 D901013C */  lui         $1, %hi(FishMenu + 0x24)
/* 0F154C 001F144C B403248C */  lw          $4, %lo(FishMenu + 0x24)($1)
/* 0F1550 001F1450 00AF080C */  jal         MenuCalcBufAlignment__FP1
/* 0F1554 001F1454 00000000 */   nop
/* 0F1558 001F1458 D901013C */  lui         $1, %hi(FishMenu + 0x24)
/* 0F155C 001F145C B40322AC */  sw          $2, %lo(FishMenu + 0x24)($1)
/* 0F1560 001F1460 00002286 */  lh          $2, 0x0($17)
/* 0F1564 001F1464 D901013C */  lui         $1, %hi(FishMenu)
/* 0F1568 001F1468 900322A4 */  sh          $2, %lo(FishMenu)($1)
/* 0F156C 001F146C 04002286 */  lh          $2, 0x4($17)
/* 0F1570 001F1470 D901013C */  lui         $1, %hi(FishMenu + 0x2)
/* 0F1574 001F1474 920322A4 */  sh          $2, %lo(FishMenu + 0x2)($1)
/* 0F1578 001F1478 D901013C */  lui         $1, %hi(FishMenu + 0x10)
/* 0F157C 001F147C A00330A4 */  sh          $16, %lo(FishMenu + 0x10)($1)
/* 0F1580 001F1480 30FB040C */  jal         StartReadBG__Fv
/* 0F1584 001F1484 00000000 */   nop
/* 0F1588 001F1488 2A00023C */  lui         $2, %hi(LIT_2943)
/* 0F158C 001F148C 00D44424 */  addiu       $4, $2, %lo(LIT_2943)
/* 0F1590 001F1490 D901013C */  lui         $1, %hi(FishMenu + 0x24)
/* 0F1594 001F1494 B403258C */  lw          $5, %lo(FishMenu + 0x24)($1)
/* 0F1598 001F1498 ACAE080C */  jal         LoadFileBGMenuData__FPcP1
/* 0F159C 001F149C 00000000 */   nop
/* 0F15A0 001F14A0 03110200 */  sra         $2, $2, 4
/* 0F15A4 001F14A4 00190200 */  sll         $3, $2, 4
/* 0F15A8 001F14A8 D901013C */  lui         $1, %hi(FishMenu + 0x24)
/* 0F15AC 001F14AC B403228C */  lw          $2, %lo(FishMenu + 0x24)($1)
/* 0F15B0 001F14B0 21104300 */  addu        $2, $2, $3
/* 0F15B4 001F14B4 10004224 */  addiu       $2, $2, 0x10
/* 0F15B8 001F14B8 D901013C */  lui         $1, %hi(FishMenu + 0x24)
/* 0F15BC 001F14BC B40322AC */  sw          $2, %lo(FishMenu + 0x24)($1)
/* 0F15C0 001F14C0 D901013C */  lui         $1, %hi(FishMenu + 0x24)
/* 0F15C4 001F14C4 B403248C */  lw          $4, %lo(FishMenu + 0x24)($1)
/* 0F15C8 001F14C8 00AF080C */  jal         MenuCalcBufAlignment__FP1
/* 0F15CC 001F14CC 00000000 */   nop
/* 0F15D0 001F14D0 D901013C */  lui         $1, %hi(FishMenu + 0x24)
/* 0F15D4 001F14D4 B40322AC */  sw          $2, %lo(FishMenu + 0x24)($1)
/* 0F15D8 001F14D8 D901013C */  lui         $1, %hi(FishMenu + 0x4)
/* 0F15DC 001F14DC 940320A4 */  sh          $0, %lo(FishMenu + 0x4)($1)
/* 0F15E0 001F14E0 01000224 */  addiu       $2, $0, 0x1
/* 0F15E4 001F14E4 D901013C */  lui         $1, %hi(FishMenu + 0x12)
/* 0F15E8 001F14E8 A20322A4 */  sh          $2, %lo(FishMenu + 0x12)($1)
/* 0F15EC 001F14EC D901013C */  lui         $1, %hi(FishMenu + 0x14)
/* 0F15F0 001F14F0 A40320A4 */  sh          $0, %lo(FishMenu + 0x14)($1)
/* 0F15F4 001F14F4 D901013C */  lui         $1, %hi(FishMenu + 0x18)
/* 0F15F8 001F14F8 A80320A4 */  sh          $0, %lo(FishMenu + 0x18)($1)
/* 0F15FC 001F14FC D901013C */  lui         $1, %hi(FishMenu + 0x16)
/* 0F1600 001F1500 A60320A4 */  sh          $0, %lo(FishMenu + 0x16)($1)
/* 0F1604 001F1504 D901013C */  lui         $1, %hi(FishMenu + 0x20)
/* 0F1608 001F1508 B00320AC */  sw          $0, %lo(FishMenu + 0x20)($1)
/* 0F160C 001F150C 1C8D848F */  lw          $4, -0x72E4($28)
/* 0F1610 001F1510 DC01828C */  lw          $2, 0x1DC($4)
/* 0F1614 001F1514 D901013C */  lui         $1, %hi(FishMenu + 0x8)
/* 0F1618 001F1518 980322AC */  sw          $2, %lo(FishMenu + 0x8)($1)
/* 0F161C 001F151C D901013C */  lui         $1, %hi(FishMenu + 0x8)
/* 0F1620 001F1520 9803228C */  lw          $2, %lo(FishMenu + 0x8)($1)
/* 0F1624 001F1524 08004104 */  bgez        $2, .L001F1548
/* 0F1628 001F1528 00000000 */   nop
/* 0F162C 001F152C 282E0070 */  paddub      $5, $0, $0
/* 0F1630 001F1530 605F050C */  jal         SetFishingPoint__9CSaveDataFi
/* 0F1634 001F1534 00000000 */   nop
/* 0F1638 001F1538 1C8D828F */  lw          $2, -0x72E4($28)
/* 0F163C 001F153C DC01428C */  lw          $2, 0x1DC($2)
/* 0F1640 001F1540 D901013C */  lui         $1, %hi(FishMenu + 0x8)
/* 0F1644 001F1544 980322AC */  sw          $2, %lo(FishMenu + 0x8)($1)
.L001F1548:
/* 0F1648 001F1548 D901013C */  lui         $1, %hi(FishMenu + 0x8)
/* 0F164C 001F154C 9803228C */  lw          $2, %lo(FishMenu + 0x8)($1)
/* 0F1650 001F1550 10274128 */  slti        $1, $2, 0x2710
/* 0F1654 001F1554 04002014 */  bnez        $1, .L001F1568
/* 0F1658 001F1558 00000000 */   nop
/* 0F165C 001F155C 0F270224 */  addiu       $2, $0, 0x270F
/* 0F1660 001F1560 D901013C */  lui         $1, %hi(FishMenu + 0x8)
/* 0F1664 001F1564 980322AC */  sw          $2, %lo(FishMenu + 0x8)($1)
.L001F1568:
/* 0F1668 001F1568 C701023C */  lui         $2, %hi(TexManager)
/* 0F166C 001F156C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F1670 001F1570 2A00023C */  lui         $2, %hi(LIT_761)
/* 0F1674 001F1574 60D14524 */  addiu       $5, $2, %lo(LIT_761)
/* 0F1678 001F1578 FFFF0624 */  addiu       $6, $0, -0x1
/* 0F167C 001F157C B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0F1680 001F1580 00000000 */   nop
/* 0F1684 001F1584 A09682AF */  sw          $2, -0x6960($28)
/* 0F1688 001F1588 CC01023C */  lui         $2, %hi(GamePad)
/* 0F168C 001F158C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0F1690 001F1590 00F00534 */  ori         $5, $0, 0xF000
/* 0F1694 001F1594 1E000624 */  addiu       $6, $0, 0x1E
/* 0F1698 001F1598 05000724 */  addiu       $7, $0, 0x5
/* 0F169C 001F159C 58AD040C */  jal         SetAutoRepeat__8CGamePadFiii
/* 0F16A0 001F15A0 00000000 */   nop
/* 0F16A4 001F15A4 CC01023C */  lui         $2, %hi(GamePad)
/* 0F16A8 001F15A8 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0F16AC 001F15AC 78000524 */  addiu       $5, $0, 0x78
/* 0F16B0 001F15B0 48AE040C */  jal         MenuModeOn__8CGamePadFi
/* 0F16B4 001F15B4 00000000 */   nop
/* 0F16B8 001F15B8 2000BF7B */  lq          $31, 0x20($29)
/* 0F16BC 001F15BC 1000B17B */  lq          $17, 0x10($29)
/* 0F16C0 001F15C0 0000B07B */  lq          $16, 0x0($29)
/* 0F16C4 001F15C4 3000BD27 */  addiu       $29, $29, 0x30
/* 0F16C8 001F15C8 0800E003 */  jr          $31
/* 0F16CC 001F15CC 00000000 */   nop
