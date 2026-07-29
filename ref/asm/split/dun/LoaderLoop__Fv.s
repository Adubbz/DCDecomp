.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoaderLoop__Fv
/* 015810 01DC1510 70FFBD27 */  addiu       $29, $29, -0x90
/* 015814 01DC1514 2000BF7F */  sq          $31, 0x20($29)
/* 015818 01DC1518 1000B17F */  sq          $17, 0x10($29)
/* 01581C 01DC151C 0000B07F */  sq          $16, 0x0($29)
/* 015820 01DC1520 288E0070 */  paddub      $17, $0, $0
/* 015824 01DC1524 189F8283 */  lb          $2, -0x60E8($28)
/* 015828 01DC1528 04004014 */  bnez        $2, .L01DC153C_2FCB3C
/* 01582C 01DC152C 00000000 */   nop
/* 015830 01DC1530 149F80AF */  sw          $0, -0x60EC($28)
/* 015834 01DC1534 01000224 */  addiu       $2, $0, 0x1
/* 015838 01DC1538 189F82A3 */  sb          $2, -0x60E8($28)
.L01DC153C_2FCB3C:
/* 01583C 01DC153C F001013C */  lui         $1, %hi(CDbgMsg + 0x18)
/* 015840 01DC1540 F868238C */  lw          $3, %lo(CDbgMsg + 0x18)($1)
/* 015844 01DC1544 F001023C */  lui         $2, %hi(CDbgMsg)
/* 015848 01DC1548 E0684224 */  addiu       $2, $2, %lo(CDbgMsg)
/* 01584C 01DC154C 21104300 */  addu        $2, $2, $3
/* 015850 01DC1550 1C004424 */  addiu       $4, $2, 0x1C
/* 015854 01DC1554 DC01023C */  lui         $2, %hi(LIT_6807)
/* 015858 01DC1558 30354524 */  addiu       $5, $2, %lo(LIT_6807)
/* 01585C 01DC155C 1614040C */  jal         sprintf
/* 015860 01DC1560 00000000 */   nop
/* 015864 01DC1564 F001013C */  lui         $1, %hi(CDbgMsg + 0x18)
/* 015868 01DC1568 F86822AC */  sw          $2, %lo(CDbgMsg + 0x18)($1)
/* 01586C 01DC156C 28860070 */  paddub      $16, $0, $0
/* 015870 01DC1570 31000010 */  b           .L01DC1638_2FCC38
/* 015874 01DC1574 00000000 */   nop
.L01DC1578_2FCB78:
/* 015878 01DC1578 80181000 */  sll         $3, $16, 2
/* 01587C 01DC157C DC01023C */  lui         $2, %hi(MapInfoNameArea)
/* 015880 01DC1580 40294224 */  addiu       $2, $2, %lo(MapInfoNameArea)
/* 015884 01DC1584 21104300 */  addu        $2, $2, $3
/* 015888 01DC1588 3000A427 */  addiu       $4, $29, 0x30
/* 01588C 01DC158C 0000458C */  lw          $5, 0x0($2)
/* 015890 01DC1590 5A15040C */  jal         strcpy
/* 015894 01DC1594 00000000 */   nop
/* 015898 01DC1598 149F828F */  lw          $2, -0x60EC($28)
/* 01589C 01DC159C 14005014 */  bne         $2, $16, .L01DC15F0_2FCBF0
/* 0158A0 01DC15A0 00000000 */   nop
/* 0158A4 01DC15A4 F001013C */  lui         $1, %hi(CDbgMsg + 0x18)
/* 0158A8 01DC15A8 F868238C */  lw          $3, %lo(CDbgMsg + 0x18)($1)
/* 0158AC 01DC15AC F001023C */  lui         $2, %hi(CDbgMsg)
/* 0158B0 01DC15B0 E0684224 */  addiu       $2, $2, %lo(CDbgMsg)
/* 0158B4 01DC15B4 21104300 */  addu        $2, $2, $3
/* 0158B8 01DC15B8 01000626 */  addiu       $6, $16, 0x1
/* 0158BC 01DC15BC 1C004424 */  addiu       $4, $2, 0x1C
/* 0158C0 01DC15C0 DC01023C */  lui         $2, %hi(LIT_6808)
/* 0158C4 01DC15C4 50354524 */  addiu       $5, $2, %lo(LIT_6808)
/* 0158C8 01DC15C8 3000A727 */  addiu       $7, $29, 0x30
/* 0158CC 01DC15CC 1614040C */  jal         sprintf
/* 0158D0 01DC15D0 00000000 */   nop
/* 0158D4 01DC15D4 F001013C */  lui         $1, %hi(CDbgMsg + 0x18)
/* 0158D8 01DC15D8 F868238C */  lw          $3, %lo(CDbgMsg + 0x18)($1)
/* 0158DC 01DC15DC 21106200 */  addu        $2, $3, $2
/* 0158E0 01DC15E0 F001013C */  lui         $1, %hi(CDbgMsg + 0x18)
/* 0158E4 01DC15E4 F86822AC */  sw          $2, %lo(CDbgMsg + 0x18)($1)
/* 0158E8 01DC15E8 12000010 */  b           .L01DC1634_2FCC34
/* 0158EC 01DC15EC 00000000 */   nop
.L01DC15F0_2FCBF0:
/* 0158F0 01DC15F0 F001013C */  lui         $1, %hi(CDbgMsg + 0x18)
/* 0158F4 01DC15F4 F868238C */  lw          $3, %lo(CDbgMsg + 0x18)($1)
/* 0158F8 01DC15F8 F001023C */  lui         $2, %hi(CDbgMsg)
/* 0158FC 01DC15FC E0684224 */  addiu       $2, $2, %lo(CDbgMsg)
/* 015900 01DC1600 21104300 */  addu        $2, $2, $3
/* 015904 01DC1604 01000626 */  addiu       $6, $16, 0x1
/* 015908 01DC1608 1C004424 */  addiu       $4, $2, 0x1C
/* 01590C 01DC160C DC01023C */  lui         $2, %hi(LIT_6809)
/* 015910 01DC1610 60354524 */  addiu       $5, $2, %lo(LIT_6809)
/* 015914 01DC1614 3000A727 */  addiu       $7, $29, 0x30
/* 015918 01DC1618 1614040C */  jal         sprintf
/* 01591C 01DC161C 00000000 */   nop
/* 015920 01DC1620 F001013C */  lui         $1, %hi(CDbgMsg + 0x18)
/* 015924 01DC1624 F868238C */  lw          $3, %lo(CDbgMsg + 0x18)($1)
/* 015928 01DC1628 21106200 */  addu        $2, $3, $2
/* 01592C 01DC162C F001013C */  lui         $1, %hi(CDbgMsg + 0x18)
/* 015930 01DC1630 F86822AC */  sw          $2, %lo(CDbgMsg + 0x18)($1)
.L01DC1634_2FCC34:
/* 015934 01DC1634 01001026 */  addiu       $16, $16, 0x1
.L01DC1638_2FCC38:
/* 015938 01DC1638 0700022A */  slti        $2, $16, 0x7
/* 01593C 01DC163C CEFF4014 */  bnez        $2, .L01DC1578_2FCB78
/* 015940 01DC1640 00000000 */   nop
/* 015944 01DC1644 CC01023C */  lui         $2, %hi(GamePad)
/* 015948 01DC1648 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 01594C 01DC164C 00100524 */  addiu       $5, $0, 0x1000
/* 015950 01DC1650 1CAE040C */  jal         Down__8CGamePadFi
/* 015954 01DC1654 00000000 */   nop
/* 015958 01DC1658 06004010 */  beqz        $2, .L01DC1674_2FCC74
/* 01595C 01DC165C 00000000 */   nop
/* 015960 01DC1660 149F828F */  lw          $2, -0x60EC($28)
/* 015964 01DC1664 03004010 */  beqz        $2, .L01DC1674_2FCC74
/* 015968 01DC1668 00000000 */   nop
/* 01596C 01DC166C FFFF4224 */  addiu       $2, $2, -0x1
/* 015970 01DC1670 149F82AF */  sw          $2, -0x60EC($28)
.L01DC1674_2FCC74:
/* 015974 01DC1674 CC01023C */  lui         $2, %hi(GamePad)
/* 015978 01DC1678 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 01597C 01DC167C 00400524 */  addiu       $5, $0, 0x4000
/* 015980 01DC1680 1CAE040C */  jal         Down__8CGamePadFi
/* 015984 01DC1684 00000000 */   nop
/* 015988 01DC1688 07004010 */  beqz        $2, .L01DC16A8_2FCCA8
/* 01598C 01DC168C 00000000 */   nop
/* 015990 01DC1690 149F838F */  lw          $3, -0x60EC($28)
/* 015994 01DC1694 06000224 */  addiu       $2, $0, 0x6
/* 015998 01DC1698 03006210 */  beq         $3, $2, .L01DC16A8_2FCCA8
/* 01599C 01DC169C 00000000 */   nop
/* 0159A0 01DC16A0 01006224 */  addiu       $2, $3, 0x1
/* 0159A4 01DC16A4 149F82AF */  sw          $2, -0x60EC($28)
.L01DC16A8_2FCCA8:
/* 0159A8 01DC16A8 CC01023C */  lui         $2, %hi(GamePad)
/* 0159AC 01DC16AC 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0159B0 01DC16B0 00080524 */  addiu       $5, $0, 0x800
/* 0159B4 01DC16B4 1CAE040C */  jal         Down__8CGamePadFi
/* 0159B8 01DC16B8 00000000 */   nop
/* 0159BC 01DC16BC 08004014 */  bnez        $2, .L01DC16E0_2FCCE0
/* 0159C0 01DC16C0 00000000 */   nop
/* 0159C4 01DC16C4 CC01023C */  lui         $2, %hi(GamePad)
/* 0159C8 01DC16C8 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0159CC 01DC16CC 60000524 */  addiu       $5, $0, 0x60
/* 0159D0 01DC16D0 1CAE040C */  jal         Down__8CGamePadFi
/* 0159D4 01DC16D4 00000000 */   nop
/* 0159D8 01DC16D8 11004010 */  beqz        $2, .L01DC1720_2FCD20
/* 0159DC 01DC16DC 00000000 */   nop
.L01DC16E0_2FCCE0:
/* 0159E0 01DC16E0 149F828F */  lw          $2, -0x60EC($28)
/* 0159E4 01DC16E4 A49D82AF */  sw          $2, -0x625C($28)
/* 0159E8 01DC16E8 248D82AF */  sw          $2, -0x72DC($28)
/* 0159EC 01DC16EC A49D828F */  lw          $2, -0x625C($28)
/* 0159F0 01DC16F0 C8004424 */  addiu       $4, $2, 0xC8
/* 0159F4 01DC16F4 FFFF0524 */  addiu       $5, $0, -0x1
/* 0159F8 01DC16F8 4C07050C */  jal         MapJump__Fii
/* 0159FC 01DC16FC 00000000 */   nop
/* 015A00 01DC1700 00608044 */  mtc1        $0, $f12
/* 015A04 01DC1704 0043023C */  lui         $2, (0x43000000 >> 16)
/* 015A08 01DC1708 00788244 */  mtc1        $2, $f15
/* 015A0C 01DC170C 46630046 */  mov.s       $f13, $f12
/* 015A10 01DC1710 86630046 */  mov.s       $f14, $f12
/* 015A14 01DC1714 24B8040C */  jal         MGSetBGColor__Fffff
/* 015A18 01DC1718 00000000 */   nop
/* 015A1C 01DC171C 01001124 */  addiu       $17, $0, 0x1
.L01DC1720_2FCD20:
/* 015A20 01DC1720 2400023C */  lui         $2, %hi(Vu_prog0f)
/* 015A24 01DC1724 00614524 */  addiu       $5, $2, %lo(Vu_prog0f)
/* 015A28 01DC1728 D48B848F */  lw          $4, -0x742C($28)
/* 015A2C 01DC172C 28360070 */  paddub      $6, $0, $0
/* 015A30 01DC1730 5C83040C */  jal         sceVif1PkCall
/* 015A34 01DC1734 00000000 */   nop
/* 015A38 01DC1738 D48B848F */  lw          $4, -0x742C($28)
/* 015A3C 01DC173C 0A83040C */  jal         sceVif1PkTerminate
/* 015A40 01DC1740 00000000 */   nop
/* 015A44 01DC1744 C701023C */  lui         $2, %hi(TexManager)
/* 015A48 01DC1748 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 015A4C 01DC174C D48B858F */  lw          $5, -0x742C($28)
/* 015A50 01DC1750 0C000624 */  addiu       $6, $0, 0xC
/* 015A54 01DC1754 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 015A58 01DC1758 00000000 */   nop
/* 015A5C 01DC175C F001023C */  lui         $2, %hi(CDbgMsg)
/* 015A60 01DC1760 E0684424 */  addiu       $4, $2, %lo(CDbgMsg)
/* 015A64 01DC1764 D0F7040C */  jal         Draw__10CDebugFontFv
/* 015A68 01DC1768 00000000 */   nop
/* 015A6C 01DC176C 28162072 */  paddub      $2, $17, $0
/* 015A70 01DC1770 2000BF7B */  lq          $31, 0x20($29)
/* 015A74 01DC1774 1000B17B */  lq          $17, 0x10($29)
/* 015A78 01DC1778 0000B07B */  lq          $16, 0x0($29)
/* 015A7C 01DC177C 9000BD27 */  addiu       $29, $29, 0x90
/* 015A80 01DC1780 0800E003 */  jr          $31
/* 015A84 01DC1784 00000000 */   nop
/* 015A88 01DC1788 00000000 */  nop
/* 015A8C 01DC178C 00000000 */  nop
