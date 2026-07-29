.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawProcI__Fv
/* 0257C0 01DD14C0 50FFBD27 */  addiu       $29, $29, -0xB0
/* 0257C4 01DD14C4 1000BF7F */  sq          $31, 0x10($29)
/* 0257C8 01DD14C8 C701023C */  lui         $2, %hi(TexManager)
/* 0257CC 01DD14CC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0257D0 01DD14D0 D48B858F */  lw          $5, -0x742C($28)
/* 0257D4 01DD14D4 0A000624 */  addiu       $6, $0, 0xA
/* 0257D8 01DD14D8 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 0257DC 01DD14DC 00000000 */   nop
/* 0257E0 01DD14E0 E201023C */  lui         $2, %hi(OP_GroundMap)
/* 0257E4 01DD14E4 30BA4424 */  addiu       $4, $2, %lo(OP_GroundMap)
/* 0257E8 01DD14E8 700E050C */  jal         Draw__4CMapFv
/* 0257EC 01DD14EC 00000000 */   nop
/* 0257F0 01DD14F0 E201023C */  lui         $2, %hi(OP_BuildingMap)
/* 0257F4 01DD14F4 50A44424 */  addiu       $4, $2, %lo(OP_BuildingMap)
/* 0257F8 01DD14F8 700E050C */  jal         Draw__4CMapFv
/* 0257FC 01DD14FC 00000000 */   nop
/* 025800 01DD1500 E301013C */  lui         $1, %hi(CScript)
/* 025804 01DD1504 C0E9238C */  lw          $3, %lo(CScript)($1)
/* 025808 01DD1508 12000224 */  addiu       $2, $0, 0x12
/* 02580C 01DD150C 05006214 */  bne         $3, $2, .L01DD1524_2D6D24
/* 025810 01DD1510 00000000 */   nop
/* 025814 01DD1514 E201023C */  lui         $2, %hi(OP_BuildingMap2)
/* 025818 01DD1518 40AF4424 */  addiu       $4, $2, %lo(OP_BuildingMap2)
/* 02581C 01DD151C 700E050C */  jal         Draw__4CMapFv
/* 025820 01DD1520 00000000 */   nop
.L01DD1524_2D6D24:
/* 025824 01DD1524 E301013C */  lui         $1, %hi(CScript + 0x64)
/* 025828 01DD1528 24EA2290 */  lbu         $2, %lo(CScript + 0x64)($1)
/* 02582C 01DD152C 10004010 */  beqz        $2, .L01DD1570_2D6D70
/* 025830 01DD1530 00000000 */   nop
/* 025834 01DD1534 E401013C */  lui         $1, %hi(CharaTex + 0x1)
/* 025838 01DD1538 11D02680 */  lb          $6, %lo(CharaTex + 0x1)($1)
/* 02583C 01DD153C C701023C */  lui         $2, %hi(TexManager)
/* 025840 01DD1540 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 025844 01DD1544 D48B858F */  lw          $5, -0x742C($28)
/* 025848 01DD1548 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 02584C 01DD154C 00000000 */   nop
/* 025850 01DD1550 DF01023C */  lui         $2, %hi(Chara__3 + 0x11B0)
/* 025854 01DD1554 90104424 */  addiu       $4, $2, %lo(Chara__3 + 0x11B0)
/* 025858 01DD1558 4CE1040C */  jal         Step__10CCharacterFv
/* 02585C 01DD155C 00000000 */   nop
/* 025860 01DD1560 DF01023C */  lui         $2, %hi(Chara__3 + 0x11B0)
/* 025864 01DD1564 90104424 */  addiu       $4, $2, %lo(Chara__3 + 0x11B0)
/* 025868 01DD1568 C4E4040C */  jal         Draw__10CCharacterFv
/* 02586C 01DD156C 00000000 */   nop
.L01DD1570_2D6D70:
/* 025870 01DD1570 E301013C */  lui         $1, %hi(CScript + 0x98)
/* 025874 01DD1574 58EA2290 */  lbu         $2, %lo(CScript + 0x98)($1)
/* 025878 01DD1578 10004010 */  beqz        $2, .L01DD15BC_2D6DBC
/* 02587C 01DD157C 00000000 */   nop
/* 025880 01DD1580 E401013C */  lui         $1, %hi(CharaTex + 0x2)
/* 025884 01DD1584 12D02680 */  lb          $6, %lo(CharaTex + 0x2)($1)
/* 025888 01DD1588 C701023C */  lui         $2, %hi(TexManager)
/* 02588C 01DD158C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 025890 01DD1590 D48B858F */  lw          $5, -0x742C($28)
/* 025894 01DD1594 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 025898 01DD1598 00000000 */   nop
/* 02589C 01DD159C DF01023C */  lui         $2, %hi(Chara__3 + 0x2360)
/* 0258A0 01DD15A0 40224424 */  addiu       $4, $2, %lo(Chara__3 + 0x2360)
/* 0258A4 01DD15A4 4CE1040C */  jal         Step__10CCharacterFv
/* 0258A8 01DD15A8 00000000 */   nop
/* 0258AC 01DD15AC DF01023C */  lui         $2, %hi(Chara__3 + 0x2360)
/* 0258B0 01DD15B0 40224424 */  addiu       $4, $2, %lo(Chara__3 + 0x2360)
/* 0258B4 01DD15B4 C4E4040C */  jal         Draw__10CCharacterFv
/* 0258B8 01DD15B8 00000000 */   nop
.L01DD15BC_2D6DBC:
/* 0258BC 01DD15BC E301013C */  lui         $1, %hi(CScript + 0x30)
/* 0258C0 01DD15C0 F0E92290 */  lbu         $2, %lo(CScript + 0x30)($1)
/* 0258C4 01DD15C4 53004010 */  beqz        $2, .L01DD1714_2D6F14
/* 0258C8 01DD15C8 00000000 */   nop
/* 0258CC 01DD15CC 2000A427 */  addiu       $4, $29, 0x20
/* 0258D0 01DD15D0 2500023C */  lui         $2, %hi(light)
/* 0258D4 01DD15D4 801B4524 */  addiu       $5, $2, %lo(light)
/* 0258D8 01DD15D8 1086040C */  jal         sceVu0CopyMatrix
/* 0258DC 01DD15DC 00000000 */   nop
/* 0258E0 01DD15E0 6000A427 */  addiu       $4, $29, 0x60
/* 0258E4 01DD15E4 2500023C */  lui         $2, %hi(lightcolor)
/* 0258E8 01DD15E8 C01B4524 */  addiu       $5, $2, %lo(lightcolor)
/* 0258EC 01DD15EC 1086040C */  jal         sceVu0CopyMatrix
/* 0258F0 01DD15F0 00000000 */   nop
/* 0258F4 01DD15F4 D08180C7 */  lwc1        $f0, -0x7E30($28)
/* 0258F8 01DD15F8 2500013C */  lui         $1, %hi(light + 0x10)
/* 0258FC 01DD15FC 901B20E4 */  swc1        $f0, %lo(light + 0x10)($1)
/* 025900 01DD1600 2500023C */  lui         $2, %hi(light)
/* 025904 01DD1604 801B4424 */  addiu       $4, $2, %lo(light)
/* 025908 01DD1608 2500023C */  lui         $2, %hi(lightcolor)
/* 02590C 01DD160C C01B4524 */  addiu       $5, $2, %lo(lightcolor)
/* 025910 01DD1610 08B7040C */  jal         MGSetPLight__FPA4_fPA4_f
/* 025914 01DD1614 00000000 */   nop
/* 025918 01DD1618 C701023C */  lui         $2, %hi(TexManager)
/* 02591C 01DD161C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 025920 01DD1620 D48B858F */  lw          $5, -0x742C($28)
/* 025924 01DD1624 17000624 */  addiu       $6, $0, 0x17
/* 025928 01DD1628 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 02592C 01DD162C 00000000 */   nop
/* 025930 01DD1630 C701023C */  lui         $2, %hi(TexManager)
/* 025934 01DD1634 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 025938 01DD1638 DE01023C */  lui         $2, %hi(LIT_1137)
/* 02593C 01DD163C 88044524 */  addiu       $5, $2, %lo(LIT_1137)
/* 025940 01DD1640 FFFF0624 */  addiu       $6, $0, -0x1
/* 025944 01DD1644 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 025948 01DD1648 00000000 */   nop
/* 02594C 01DD164C 280044DC */  ld          $4, 0x28($2)
/* 025950 01DD1650 28C2040C */  jal         MGBeginDrawShadow__F9sceGsTex0
/* 025954 01DD1654 00000000 */   nop
/* 025958 01DD1658 DF01023C */  lui         $2, %hi(Chara__3)
/* 02595C 01DD165C E0FE4424 */  addiu       $4, $2, %lo(Chara__3)
/* 025960 01DD1660 24E3040C */  jal         ShadowStep__10CCharacterFv
/* 025964 01DD1664 00000000 */   nop
/* 025968 01DD1668 DF01023C */  lui         $2, %hi(Chara__3)
/* 02596C 01DD166C E0FE4424 */  addiu       $4, $2, %lo(Chara__3)
/* 025970 01DD1670 C0E5040C */  jal         DrawShadow__10CCharacterFv
/* 025974 01DD1674 00000000 */   nop
/* 025978 01DD1678 34000424 */  addiu       $4, $0, 0x34
/* 02597C 01DD167C CCC2040C */  jal         MGEndDrawShadow__FUc
/* 025980 01DD1680 00000000 */   nop
/* 025984 01DD1684 2500023C */  lui         $2, %hi(light)
/* 025988 01DD1688 801B4424 */  addiu       $4, $2, %lo(light)
/* 02598C 01DD168C 2000A527 */  addiu       $5, $29, 0x20
/* 025990 01DD1690 1086040C */  jal         sceVu0CopyMatrix
/* 025994 01DD1694 00000000 */   nop
/* 025998 01DD1698 2500023C */  lui         $2, %hi(lightcolor)
/* 02599C 01DD169C C01B4424 */  addiu       $4, $2, %lo(lightcolor)
/* 0259A0 01DD16A0 6000A527 */  addiu       $5, $29, 0x60
/* 0259A4 01DD16A4 1086040C */  jal         sceVu0CopyMatrix
/* 0259A8 01DD16A8 00000000 */   nop
/* 0259AC 01DD16AC 2500023C */  lui         $2, %hi(light)
/* 0259B0 01DD16B0 801B4424 */  addiu       $4, $2, %lo(light)
/* 0259B4 01DD16B4 2500023C */  lui         $2, %hi(lightcolor)
/* 0259B8 01DD16B8 C01B4524 */  addiu       $5, $2, %lo(lightcolor)
/* 0259BC 01DD16BC 08B7040C */  jal         MGSetPLight__FPA4_fPA4_f
/* 0259C0 01DD16C0 00000000 */   nop
/* 0259C4 01DD16C4 E401013C */  lui         $1, %hi(CharaTex)
/* 0259C8 01DD16C8 10D02680 */  lb          $6, %lo(CharaTex)($1)
/* 0259CC 01DD16CC C701023C */  lui         $2, %hi(TexManager)
/* 0259D0 01DD16D0 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0259D4 01DD16D4 D48B858F */  lw          $5, -0x742C($28)
/* 0259D8 01DD16D8 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 0259DC 01DD16DC 00000000 */   nop
/* 0259E0 01DD16E0 DF01023C */  lui         $2, %hi(Chara__3)
/* 0259E4 01DD16E4 E0FE4424 */  addiu       $4, $2, %lo(Chara__3)
/* 0259E8 01DD16E8 4CE1040C */  jal         Step__10CCharacterFv
/* 0259EC 01DD16EC 00000000 */   nop
/* 0259F0 01DD16F0 DF01023C */  lui         $2, %hi(Chara__3)
/* 0259F4 01DD16F4 E0FE4424 */  addiu       $4, $2, %lo(Chara__3)
/* 0259F8 01DD16F8 282E0070 */  paddub      $5, $0, $0
/* 0259FC 01DD16FC 94E3040C */  jal         ClothStep__10CCharacterFi
/* 025A00 01DD1700 00000000 */   nop
/* 025A04 01DD1704 DF01023C */  lui         $2, %hi(Chara__3)
/* 025A08 01DD1708 E0FE4424 */  addiu       $4, $2, %lo(Chara__3)
/* 025A0C 01DD170C C4E4040C */  jal         Draw__10CCharacterFv
/* 025A10 01DD1710 00000000 */   nop
.L01DD1714_2D6F14:
/* 025A14 01DD1714 C701023C */  lui         $2, %hi(TexManager)
/* 025A18 01DD1718 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 025A1C 01DD171C D48B858F */  lw          $5, -0x742C($28)
/* 025A20 01DD1720 16000624 */  addiu       $6, $0, 0x16
/* 025A24 01DD1724 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 025A28 01DD1728 00000000 */   nop
/* 025A2C 01DD172C A800A427 */  addiu       $4, $29, 0xA8
/* 025A30 01DD1730 D88A82DF */  ld          $2, -0x7528($28)
/* 025A34 01DD1734 000082FC */  sd          $2, 0x0($4)
/* 025A38 01DD1738 02000524 */  addiu       $5, $0, 0x2
/* 025A3C 01DD173C 20000624 */  addiu       $6, $0, 0x20
/* 025A40 01DD1740 283E0070 */  paddub      $7, $0, $0
/* 025A44 01DD1744 B094050C */  jal         DepthOfField__FPfiii
/* 025A48 01DD1748 00000000 */   nop
/* 025A4C 01DD174C 1000BF7B */  lq          $31, 0x10($29)
/* 025A50 01DD1750 B000BD27 */  addiu       $29, $29, 0xB0
/* 025A54 01DD1754 0800E003 */  jr          $31
/* 025A58 01DD1758 00000000 */   nop
/* 025A5C 01DD175C 00000000 */  nop
