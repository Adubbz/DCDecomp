.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DeleteMapParts__11CEditGroundFPiPifff
/* A1390 001A1290 30FFBD27 */  addiu      $sp, $sp, -0xD0
/* A1394 001A1294 A000BF7F */  sq         $31, 0xA0($sp)
/* A1398 001A1298 9000BE7F */  sq         $fp, 0x90($sp)
/* A139C 001A129C 8000B77F */  sq         $23, 0x80($sp)
/* A13A0 001A12A0 7000B67F */  sq         $22, 0x70($sp)
/* A13A4 001A12A4 6000B57F */  sq         $21, 0x60($sp)
/* A13A8 001A12A8 5000B47F */  sq         $20, 0x50($sp)
/* A13AC 001A12AC 4000B37F */  sq         $19, 0x40($sp)
/* A13B0 001A12B0 3000B27F */  sq         $18, 0x30($sp)
/* A13B4 001A12B4 2000B17F */  sq         $17, 0x20($sp)
/* A13B8 001A12B8 1000B07F */  sq         $16, 0x10($sp)
/* A13BC 001A12BC 0800B6E7 */  swc1       $f22, 0x8($sp)
/* A13C0 001A12C0 0400B5E7 */  swc1       $f21, 0x4($sp)
/* A13C4 001A12C4 0000B4E7 */  swc1       $f20, 0x0($sp)
/* A13C8 001A12C8 28B68070 */  paddub     $22, $4, $0
/* A13CC 001A12CC 28BEA070 */  paddub     $23, $5, $0
/* A13D0 001A12D0 28F6C070 */  paddub     $fp, $6, $0
/* A13D4 001A12D4 86650046 */  mov.s      $f22, $f12
/* A13D8 001A12D8 466D0046 */  mov.s      $f21, $f13
/* A13DC 001A12DC 06750046 */  mov.s      $f20, $f14
/* A13E0 001A12E0 AC85060C */  jal        GetAreaCode__11CEditGroundFfff
/* A13E4 001A12E4 00000000 */   nop
/* A13E8 001A12E8 04004104 */  bgez       $2, .L001A12FC
/* A13EC 001A12EC 00000000 */   nop
/* A13F0 001A12F0 FFFF0224 */  addiu      $2, $0, -0x1
/* A13F4 001A12F4 DC000010 */  b          .L001A1668
/* A13F8 001A12F8 00000000 */   nop
.L001A12FC:
/* A13FC 001A12FC 80100200 */  sll        $2, $2, 2
/* A1400 001A1300 21105600 */  addu       $2, $2, $22
/* A1404 001A1304 0400508C */  lw         $16, 0x4($2)
/* A1408 001A1308 28260072 */  paddub     $4, $16, $0
/* A140C 001A130C 06B30046 */  mov.s      $f12, $f22
/* A1410 001A1310 46AB0046 */  mov.s      $f13, $f21
/* A1414 001A1314 86A30046 */  mov.s      $f14, $f20
/* A1418 001A1318 F8BA050C */  jal        SearchPartsID__9CEditAreaFfff
/* A141C 001A131C 00000000 */   nop
/* A1420 001A1320 288E4070 */  paddub     $17, $2, $0
/* A1424 001A1324 04002106 */  bgez       $17, .L001A1338
/* A1428 001A1328 00000000 */   nop
/* A142C 001A132C FFFF0224 */  addiu      $2, $0, -0x1
/* A1430 001A1330 CD000010 */  b          .L001A1668
/* A1434 001A1334 00000000 */   nop
.L001A1338:
/* A1438 001A1338 C0101100 */  sll        $2, $17, 3
/* A143C 001A133C 23185100 */  subu       $3, $2, $17
/* A1440 001A1340 80100300 */  sll        $2, $3, 2
/* A1444 001A1344 23104300 */  subu       $2, $2, $3
/* A1448 001A1348 40910200 */  sll        $18, $2, 5
/* A144C 001A134C 2110D202 */  addu       $2, $22, $18
/* A1450 001A1350 30005324 */  addiu      $19, $2, 0x30
/* A1454 001A1354 28260072 */  paddub     $4, $16, $0
/* A1458 001A1358 282E6072 */  paddub     $5, $19, $0
/* A145C 001A135C 06B30046 */  mov.s      $f12, $f22
/* A1460 001A1360 46AB0046 */  mov.s      $f13, $f21
/* A1464 001A1364 86A30046 */  mov.s      $f14, $f20
/* A1468 001A1368 C896060C */  jal        CheckDelete__FP9CEditAreaP9CMapPartsfff
/* A146C 001A136C 00000000 */   nop
/* A1470 001A1370 04004010 */  beqz       $2, .L001A1384
/* A1474 001A1374 00000000 */   nop
/* A1478 001A1378 FFFF0224 */  addiu      $2, $0, -0x1
/* A147C 001A137C BA000010 */  b          .L001A1668
/* A1480 001A1380 00000000 */   nop
.L001A1384:
/* A1484 001A1384 1801638E */  lw         $3, 0x118($19)
/* A1488 001A1388 03000224 */  addiu      $2, $0, 0x3
/* A148C 001A138C 04006210 */  beq        $3, $2, .L001A13A0
/* A1490 001A1390 00000000 */   nop
/* A1494 001A1394 05000224 */  addiu      $2, $0, 0x5
/* A1498 001A1398 3A006214 */  bne        $3, $2, .L001A1484
/* A149C 001A139C 00000000 */   nop
.L001A13A0:
/* A14A0 001A13A0 28266072 */  paddub     $4, $19, $0
/* A14A4 001A13A4 2C6A060C */  jal        GetRotY__9CMapPartsFv
/* A14A8 001A13A8 00000000 */   nop
/* A14AC 001A13AC 28964070 */  paddub     $18, $2, $0
/* A14B0 001A13B0 28266072 */  paddub     $4, $19, $0
/* A14B4 001A13B4 B000A527 */  addiu      $5, $sp, 0xB0
/* A14B8 001A13B8 EC69060C */  jal        GetPosition__9CMapPartsFPf
/* A14BC 001A13BC 00000000 */   nop
/* A14C0 001A13C0 F000748E */  lw         $20, 0xF0($19)
/* A14C4 001A13C4 0000F4AE */  sw         $20, 0x0($23)
/* A14C8 001A13C8 0100013C */  lui        $at, (0x15F34 >> 16)
/* A14CC 001A13CC 2108C102 */  addu       $at, $22, $at
/* A14D0 001A13D0 345F228C */  lw         $2, (0x15F34 & 0xFFFF)($at)
/* A14D4 001A13D4 28266072 */  paddub     $4, $19, $0
/* A14D8 001A13D8 A0024524 */  addiu      $5, $2, 0x2A0
/* A14DC 001A13DC A0020624 */  addiu      $6, $0, 0x2A0
/* A14E0 001A13E0 EC0C040C */  jal        memcpy
/* A14E4 001A13E4 00000000 */   nop
/* A14E8 001A13E8 28266072 */  paddub     $4, $19, $0
/* A14EC 001A13EC B000A527 */  addiu      $5, $sp, 0xB0
/* A14F0 001A13F0 A000798E */  lw         $25, 0xA0($19)
/* A14F4 001A13F4 1400398F */  lw         $25, 0x14($25)
/* A14F8 001A13F8 09F82003 */  jalr       $25
/* A14FC 001A13FC 00000000 */   nop
/* A1500 001A1400 28266072 */  paddub     $4, $19, $0
/* A1504 001A1404 282E4072 */  paddub     $5, $18, $0
/* A1508 001A1408 146A060C */  jal        SetRotY__9CMapPartsFi
/* A150C 001A140C 00000000 */   nop
/* A1510 001A1410 28260072 */  paddub     $4, $16, $0
/* A1514 001A1414 282E2072 */  paddub     $5, $17, $0
/* A1518 001A1418 3000C626 */  addiu      $6, $22, 0x30
/* A151C 001A141C 06B30046 */  mov.s      $f12, $f22
/* A1520 001A1420 46AB0046 */  mov.s      $f13, $f21
/* A1524 001A1424 86A30046 */  mov.s      $f14, $f20
/* A1528 001A1428 283E4072 */  paddub     $7, $18, $0
/* A152C 001A142C 04B8050C */  jal        SetMapParts__9CEditAreaFiP9CMapPartsfffi
/* A1530 001A1430 00000000 */   nop
/* A1534 001A1434 0100013C */  lui        $at, (0x15030 >> 16)
/* A1538 001A1438 2108C102 */  addu       $at, $22, $at
/* A153C 001A143C 3050248C */  lw         $4, (0x15030 & 0xFFFF)($at)
/* A1540 001A1440 0D008010 */  beqz       $4, .L001A1478
/* A1544 001A1444 00000000 */   nop
/* A1548 001A1448 282E8072 */  paddub     $5, $20, $0
/* A154C 001A144C F467060C */  jal        GetPartsInfo__14CEditPartsInfoFi
/* A1550 001A1450 00000000 */   nop
/* A1554 001A1454 08004010 */  beqz       $2, .L001A1478
/* A1558 001A1458 00000000 */   nop
/* A155C 001A145C 0C00438C */  lw         $3, 0xC($2)
/* A1560 001A1460 FFFF6324 */  addiu      $3, $3, -0x1
/* A1564 001A1464 0C0043AC */  sw         $3, 0xC($2)
/* A1568 001A1468 0C00438C */  lw         $3, 0xC($2)
/* A156C 001A146C 02006104 */  bgez       $3, .L001A1478
/* A1570 001A1470 00000000 */   nop
/* A1574 001A1474 0C0040AC */  sw         $0, 0xC($2)
.L001A1478:
/* A1578 001A1478 28162072 */  paddub     $2, $17, $0
/* A157C 001A147C 7A000010 */  b          .L001A1668
/* A1580 001A1480 00000000 */   nop
.L001A1484:
/* A1584 001A1484 0100013C */  lui        $at, (0x15030 >> 16)
/* A1588 001A1488 2108C102 */  addu       $at, $22, $at
/* A158C 001A148C 3050248C */  lw         $4, (0x15030 & 0xFFFF)($at)
/* A1590 001A1490 0E008010 */  beqz       $4, .L001A14CC
/* A1594 001A1494 00000000 */   nop
/* A1598 001A1498 21105602 */  addu       $2, $18, $22
/* A159C 001A149C 2001458C */  lw         $5, 0x120($2)
/* A15A0 001A14A0 F467060C */  jal        GetPartsInfo__14CEditPartsInfoFi
/* A15A4 001A14A4 00000000 */   nop
/* A15A8 001A14A8 08004010 */  beqz       $2, .L001A14CC
/* A15AC 001A14AC 00000000 */   nop
/* A15B0 001A14B0 0C00438C */  lw         $3, 0xC($2)
/* A15B4 001A14B4 FFFF6324 */  addiu      $3, $3, -0x1
/* A15B8 001A14B8 0C0043AC */  sw         $3, 0xC($2)
/* A15BC 001A14BC 0C00438C */  lw         $3, 0xC($2)
/* A15C0 001A14C0 02006104 */  bgez       $3, .L001A14CC
/* A15C4 001A14C4 00000000 */   nop
/* A15C8 001A14C8 0C0040AC */  sw         $0, 0xC($2)
.L001A14CC:
/* A15CC 001A14CC 28266072 */  paddub     $4, $19, $0
/* A15D0 001A14D0 C000A527 */  addiu      $5, $sp, 0xC0
/* A15D4 001A14D4 EC69060C */  jal        GetPosition__9CMapPartsFPf
/* A15D8 001A14D8 00000000 */   nop
/* A15DC 001A14DC 803F023C */  lui        $2, (0x3F800000 >> 16)
/* A15E0 001A14E0 00088244 */  mtc1       $2, $f1
/* A15E4 001A14E4 C000A0C7 */  lwc1       $f0, 0xC0($sp)
/* A15E8 001A14E8 000B0046 */  add.s      $f12, $f1, $f0
/* A15EC 001A14EC C800B427 */  addiu      $20, $sp, 0xC8
/* A15F0 001A14F0 000080C6 */  lwc1       $f0, 0x0($20)
/* A15F4 001A14F4 800B0046 */  add.s      $f14, $f1, $f0
/* A15F8 001A14F8 C400B527 */  addiu      $21, $sp, 0xC4
/* A15FC 001A14FC 28260072 */  paddub     $4, $16, $0
/* A1600 001A1500 282E2072 */  paddub     $5, $17, $0
/* A1604 001A1504 3000C626 */  addiu      $6, $22, 0x30
/* A1608 001A1508 0000ADC6 */  lwc1       $f13, 0x0($21)
/* A160C 001A150C 84B8050C */  jal        DeleteMapParts__9CEditAreaFiP9CMapPartsfff
/* A1610 001A1510 00000000 */   nop
/* A1614 001A1514 21105602 */  addu       $2, $18, $22
/* A1618 001A1518 48015024 */  addiu      $16, $2, 0x148
/* A161C 001A151C 4801438C */  lw         $3, 0x148($2)
/* A1620 001A1520 02000224 */  addiu      $2, $0, 0x2
/* A1624 001A1524 21006214 */  bne        $3, $2, .L001A15AC
/* A1628 001A1528 00000000 */   nop
/* A162C 001A152C 2826C072 */  paddub     $4, $22, $0
/* A1630 001A1530 C000ACC7 */  lwc1       $f12, 0xC0($sp)
/* A1634 001A1534 0000ADC6 */  lwc1       $f13, 0x0($21)
/* A1638 001A1538 00008EC6 */  lwc1       $f14, 0x0($20)
/* A163C 001A153C 01000524 */  addiu      $5, $0, 0x1
/* A1640 001A1540 28360070 */  paddub     $6, $0, $0
/* A1644 001A1544 0483060C */  jal        SetRiverParts__11CEditGroundFfffii
/* A1648 001A1548 00000000 */   nop
/* A164C 001A154C 2826C072 */  paddub     $4, $22, $0
/* A1650 001A1550 C000ACC7 */  lwc1       $f12, 0xC0($sp)
/* A1654 001A1554 0000ADC6 */  lwc1       $f13, 0x0($21)
/* A1658 001A1558 00008EC6 */  lwc1       $f14, 0x0($20)
/* A165C 001A155C 282E0070 */  paddub     $5, $0, $0
/* A1660 001A1560 01000624 */  addiu      $6, $0, 0x1
/* A1664 001A1564 0483060C */  jal        SetRiverParts__11CEditGroundFfffii
/* A1668 001A1568 00000000 */   nop
/* A166C 001A156C 2826C072 */  paddub     $4, $22, $0
/* A1670 001A1570 C000ACC7 */  lwc1       $f12, 0xC0($sp)
/* A1674 001A1574 0000ADC6 */  lwc1       $f13, 0x0($21)
/* A1678 001A1578 00008EC6 */  lwc1       $f14, 0x0($20)
/* A167C 001A157C FFFF0524 */  addiu      $5, $0, -0x1
/* A1680 001A1580 28360070 */  paddub     $6, $0, $0
/* A1684 001A1584 0483060C */  jal        SetRiverParts__11CEditGroundFfffii
/* A1688 001A1588 00000000 */   nop
/* A168C 001A158C 2826C072 */  paddub     $4, $22, $0
/* A1690 001A1590 C000ACC7 */  lwc1       $f12, 0xC0($sp)
/* A1694 001A1594 0000ADC6 */  lwc1       $f13, 0x0($21)
/* A1698 001A1598 00008EC6 */  lwc1       $f14, 0x0($20)
/* A169C 001A159C 282E0070 */  paddub     $5, $0, $0
/* A16A0 001A15A0 FFFF0624 */  addiu      $6, $0, -0x1
/* A16A4 001A15A4 0483060C */  jal        SetRiverParts__11CEditGroundFfffii
/* A16A8 001A15A8 00000000 */   nop
.L001A15AC:
/* A16AC 001A15AC 0000028E */  lw         $2, 0x0($16)
/* A16B0 001A15B0 01000524 */  addiu      $5, $0, 0x1
/* A16B4 001A15B4 20004514 */  bne        $2, $5, .L001A1638
/* A16B8 001A15B8 00000000 */   nop
/* A16BC 001A15BC 2826C072 */  paddub     $4, $22, $0
/* A16C0 001A15C0 C000ACC7 */  lwc1       $f12, 0xC0($sp)
/* A16C4 001A15C4 0000ADC6 */  lwc1       $f13, 0x0($21)
/* A16C8 001A15C8 00008EC6 */  lwc1       $f14, 0x0($20)
/* A16CC 001A15CC 28360070 */  paddub     $6, $0, $0
/* A16D0 001A15D0 F883060C */  jal        SetRoadParts__11CEditGroundFfffii
/* A16D4 001A15D4 00000000 */   nop
/* A16D8 001A15D8 2826C072 */  paddub     $4, $22, $0
/* A16DC 001A15DC C000ACC7 */  lwc1       $f12, 0xC0($sp)
/* A16E0 001A15E0 0000ADC6 */  lwc1       $f13, 0x0($21)
/* A16E4 001A15E4 00008EC6 */  lwc1       $f14, 0x0($20)
/* A16E8 001A15E8 282E0070 */  paddub     $5, $0, $0
/* A16EC 001A15EC 01000624 */  addiu      $6, $0, 0x1
/* A16F0 001A15F0 F883060C */  jal        SetRoadParts__11CEditGroundFfffii
/* A16F4 001A15F4 00000000 */   nop
/* A16F8 001A15F8 2826C072 */  paddub     $4, $22, $0
/* A16FC 001A15FC C000ACC7 */  lwc1       $f12, 0xC0($sp)
/* A1700 001A1600 0000ADC6 */  lwc1       $f13, 0x0($21)
/* A1704 001A1604 00008EC6 */  lwc1       $f14, 0x0($20)
/* A1708 001A1608 FFFF0524 */  addiu      $5, $0, -0x1
/* A170C 001A160C 28360070 */  paddub     $6, $0, $0
/* A1710 001A1610 F883060C */  jal        SetRoadParts__11CEditGroundFfffii
/* A1714 001A1614 00000000 */   nop
/* A1718 001A1618 2826C072 */  paddub     $4, $22, $0
/* A171C 001A161C C000ACC7 */  lwc1       $f12, 0xC0($sp)
/* A1720 001A1620 0000ADC6 */  lwc1       $f13, 0x0($21)
/* A1724 001A1624 00008EC6 */  lwc1       $f14, 0x0($20)
/* A1728 001A1628 282E0070 */  paddub     $5, $0, $0
/* A172C 001A162C FFFF0624 */  addiu      $6, $0, -0x1
/* A1730 001A1630 F883060C */  jal        SetRoadParts__11CEditGroundFfffii
/* A1734 001A1634 00000000 */   nop
.L001A1638:
/* A1738 001A1638 21185602 */  addu       $3, $18, $22
/* A173C 001A163C 2001628C */  lw         $2, 0x120($3)
/* A1740 001A1640 0000E2AE */  sw         $2, 0x0($23)
/* A1744 001A1644 2801628C */  lw         $2, 0x128($3)
/* A1748 001A1648 0000C2AF */  sw         $2, 0x0($fp)
/* A174C 001A164C 28266072 */  paddub     $4, $19, $0
/* A1750 001A1650 306A060C */  jal        Initialize__9CMapPartsFv
/* A1754 001A1654 00000000 */   nop
/* A1758 001A1658 FFFF0324 */  addiu      $3, $0, -0x1
/* A175C 001A165C 21105602 */  addu       $2, $18, $22
/* A1760 001A1660 180143AC */  sw         $3, 0x118($2)
/* A1764 001A1664 28162072 */  paddub     $2, $17, $0
.L001A1668:
/* A1768 001A1668 A000BF7B */  lq         $31, 0xA0($sp)
/* A176C 001A166C 9000BE7B */  lq         $fp, 0x90($sp)
/* A1770 001A1670 8000B77B */  lq         $23, 0x80($sp)
/* A1774 001A1674 7000B67B */  lq         $22, 0x70($sp)
/* A1778 001A1678 6000B57B */  lq         $21, 0x60($sp)
/* A177C 001A167C 5000B47B */  lq         $20, 0x50($sp)
/* A1780 001A1680 4000B37B */  lq         $19, 0x40($sp)
/* A1784 001A1684 3000B27B */  lq         $18, 0x30($sp)
/* A1788 001A1688 2000B17B */  lq         $17, 0x20($sp)
/* A178C 001A168C 1000B07B */  lq         $16, 0x10($sp)
/* A1790 001A1690 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* A1794 001A1694 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* A1798 001A1698 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* A179C 001A169C D000BD27 */  addiu      $sp, $sp, 0xD0
/* A17A0 001A16A0 0800E003 */  jr         $31
/* A17A4 001A16A4 00000000 */   nop
/* A17A8 001A16A8 00000000 */  nop
/* A17AC 001A16AC 00000000 */  nop
