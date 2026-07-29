.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawProcTitle__Fv
/* 025B00 01DD1800 50FFBD27 */  addiu       $29, $29, -0xB0
/* 025B04 01DD1804 1000BF7F */  sq          $31, 0x10($29)
/* 025B08 01DD1808 0000B07F */  sq          $16, 0x0($29)
/* 025B0C 01DD180C C701023C */  lui         $2, %hi(TexManager)
/* 025B10 01DD1810 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 025B14 01DD1814 D48B858F */  lw          $5, -0x742C($28)
/* 025B18 01DD1818 01000624 */  addiu       $6, $0, 0x1
/* 025B1C 01DD181C 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 025B20 01DD1820 00000000 */   nop
/* 025B24 01DD1824 3000A0AF */  sw          $0, 0x30($29)
/* 025B28 01DD1828 3400A0AF */  sw          $0, 0x34($29)
/* 025B2C 01DD182C 00030324 */  addiu       $3, $0, 0x300
/* 025B30 01DD1830 3800A3AF */  sw          $3, 0x38($29)
/* 025B34 01DD1834 3C00A3AF */  sw          $3, 0x3C($29)
/* 025B38 01DD1838 40010224 */  addiu       $2, $0, 0x140
/* 025B3C 01DD183C 2000A2AF */  sw          $2, 0x20($29)
/* 025B40 01DD1840 E0000224 */  addiu       $2, $0, 0xE0
/* 025B44 01DD1844 2400A2AF */  sw          $2, 0x24($29)
/* 025B48 01DD1848 2800A3AF */  sw          $3, 0x28($29)
/* 025B4C 01DD184C 2C00A3AF */  sw          $3, 0x2C($29)
/* 025B50 01DD1850 A0B8040C */  jal         GetVif1Packet__Fv
/* 025B54 01DD1854 00000000 */   nop
/* 025B58 01DD1858 28864070 */  paddub      $16, $2, $0
/* 025B5C 01DD185C C701023C */  lui         $2, %hi(TexManager)
/* 025B60 01DD1860 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 025B64 01DD1864 DE01023C */  lui         $2, %hi(LIT_1699__2)
/* 025B68 01DD1868 D80B4524 */  addiu       $5, $2, %lo(LIT_1699__2)
/* 025B6C 01DD186C FFFF0624 */  addiu       $6, $0, -0x1
/* 025B70 01DD1870 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 025B74 01DD1874 00000000 */   nop
/* 025B78 01DD1878 28260072 */  paddub      $4, $16, $0
/* 025B7C 01DD187C 282E4070 */  paddub      $5, $2, $0
/* 025B80 01DD1880 2000A627 */  addiu       $6, $29, 0x20
/* 025B84 01DD1884 3000A727 */  addiu       $7, $29, 0x30
/* 025B88 01DD1888 80010824 */  addiu       $8, $0, 0x180
/* 025B8C 01DD188C 284E0071 */  paddub      $9, $8, $0
/* 025B90 01DD1890 C49B8CC7 */  lwc1        $f12, -0x643C($28)
/* 025B94 01DD1894 5079050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_iif
/* 025B98 01DD1898 00000000 */   nop
/* 025B9C 01DD189C C49B81C7 */  lwc1        $f1, -0x643C($28)
/* 025BA0 01DD18A0 F48180C7 */  lwc1        $f0, -0x7E0C($28)
/* 025BA4 01DD18A4 01080046 */  sub.s       $f0, $f1, $f0
/* 025BA8 01DD18A8 C49B80E7 */  swc1        $f0, -0x643C($28)
/* 025BAC 01DD18AC 5000A0AF */  sw          $0, 0x50($29)
/* 025BB0 01DD18B0 5400A0AF */  sw          $0, 0x54($29)
/* 025BB4 01DD18B4 20010424 */  addiu       $4, $0, 0x120
/* 025BB8 01DD18B8 5800A4AF */  sw          $4, 0x58($29)
/* 025BBC 01DD18BC A0000324 */  addiu       $3, $0, 0xA0
/* 025BC0 01DD18C0 5C00A3AF */  sw          $3, 0x5C($29)
/* 025BC4 01DD18C4 4000A0AF */  sw          $0, 0x40($29)
/* 025BC8 01DD18C8 50000224 */  addiu       $2, $0, 0x50
/* 025BCC 01DD18CC 4400A2AF */  sw          $2, 0x44($29)
/* 025BD0 01DD18D0 4800A4AF */  sw          $4, 0x48($29)
/* 025BD4 01DD18D4 4C00A3AF */  sw          $3, 0x4C($29)
/* 025BD8 01DD18D8 A0B8040C */  jal         GetVif1Packet__Fv
/* 025BDC 01DD18DC 00000000 */   nop
/* 025BE0 01DD18E0 28864070 */  paddub      $16, $2, $0
/* 025BE4 01DD18E4 C701023C */  lui         $2, %hi(TexManager)
/* 025BE8 01DD18E8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 025BEC 01DD18EC DE01023C */  lui         $2, %hi(LIT_1701__2)
/* 025BF0 01DD18F0 E00B4524 */  addiu       $5, $2, %lo(LIT_1701__2)
/* 025BF4 01DD18F4 FFFF0624 */  addiu       $6, $0, -0x1
/* 025BF8 01DD18F8 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 025BFC 01DD18FC 00000000 */   nop
/* 025C00 01DD1900 28260072 */  paddub      $4, $16, $0
/* 025C04 01DD1904 282E4070 */  paddub      $5, $2, $0
/* 025C08 01DD1908 4000A627 */  addiu       $6, $29, 0x40
/* 025C0C 01DD190C 5000A727 */  addiu       $7, $29, 0x50
/* 025C10 01DD1910 80000824 */  addiu       $8, $0, 0x80
/* 025C14 01DD1914 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 025C18 01DD1918 00000000 */   nop
/* 025C1C 01DD191C 20010524 */  addiu       $5, $0, 0x120
/* 025C20 01DD1920 7000A5AF */  sw          $5, 0x70($29)
/* 025C24 01DD1924 31000224 */  addiu       $2, $0, 0x31
/* 025C28 01DD1928 7400A2AF */  sw          $2, 0x74($29)
/* 025C2C 01DD192C 60010424 */  addiu       $4, $0, 0x160
/* 025C30 01DD1930 7800A4AF */  sw          $4, 0x78($29)
/* 025C34 01DD1934 A0000324 */  addiu       $3, $0, 0xA0
/* 025C38 01DD1938 7C00A3AF */  sw          $3, 0x7C($29)
/* 025C3C 01DD193C 6000A5AF */  sw          $5, 0x60($29)
/* 025C40 01DD1940 81000224 */  addiu       $2, $0, 0x81
/* 025C44 01DD1944 6400A2AF */  sw          $2, 0x64($29)
/* 025C48 01DD1948 6800A4AF */  sw          $4, 0x68($29)
/* 025C4C 01DD194C 6C00A3AF */  sw          $3, 0x6C($29)
/* 025C50 01DD1950 A0B8040C */  jal         GetVif1Packet__Fv
/* 025C54 01DD1954 00000000 */   nop
/* 025C58 01DD1958 28864070 */  paddub      $16, $2, $0
/* 025C5C 01DD195C C701023C */  lui         $2, %hi(TexManager)
/* 025C60 01DD1960 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 025C64 01DD1964 DE01023C */  lui         $2, %hi(LIT_1701__2)
/* 025C68 01DD1968 E00B4524 */  addiu       $5, $2, %lo(LIT_1701__2)
/* 025C6C 01DD196C FFFF0624 */  addiu       $6, $0, -0x1
/* 025C70 01DD1970 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 025C74 01DD1974 00000000 */   nop
/* 025C78 01DD1978 28260072 */  paddub      $4, $16, $0
/* 025C7C 01DD197C 282E4070 */  paddub      $5, $2, $0
/* 025C80 01DD1980 6000A627 */  addiu       $6, $29, 0x60
/* 025C84 01DD1984 7000A727 */  addiu       $7, $29, 0x70
/* 025C88 01DD1988 80000824 */  addiu       $8, $0, 0x80
/* 025C8C 01DD198C C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 025C90 01DD1990 00000000 */   nop
/* 025C94 01DD1994 9000A0AF */  sw          $0, 0x90($29)
/* 025C98 01DD1998 D0000224 */  addiu       $2, $0, 0xD0
/* 025C9C 01DD199C 9400A2AF */  sw          $2, 0x94($29)
/* 025CA0 01DD19A0 80020424 */  addiu       $4, $0, 0x280
/* 025CA4 01DD19A4 9800A4AF */  sw          $4, 0x98($29)
/* 025CA8 01DD19A8 30000324 */  addiu       $3, $0, 0x30
/* 025CAC 01DD19AC 9C00A3AF */  sw          $3, 0x9C($29)
/* 025CB0 01DD19B0 8000A0AF */  sw          $0, 0x80($29)
/* 025CB4 01DD19B4 6E010224 */  addiu       $2, $0, 0x16E
/* 025CB8 01DD19B8 8400A2AF */  sw          $2, 0x84($29)
/* 025CBC 01DD19BC 8800A4AF */  sw          $4, 0x88($29)
/* 025CC0 01DD19C0 8C00A3AF */  sw          $3, 0x8C($29)
/* 025CC4 01DD19C4 A0B8040C */  jal         GetVif1Packet__Fv
/* 025CC8 01DD19C8 00000000 */   nop
/* 025CCC 01DD19CC 28864070 */  paddub      $16, $2, $0
/* 025CD0 01DD19D0 C701023C */  lui         $2, %hi(TexManager)
/* 025CD4 01DD19D4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 025CD8 01DD19D8 DE01023C */  lui         $2, %hi(LIT_1701__2)
/* 025CDC 01DD19DC E00B4524 */  addiu       $5, $2, %lo(LIT_1701__2)
/* 025CE0 01DD19E0 FFFF0624 */  addiu       $6, $0, -0x1
/* 025CE4 01DD19E4 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 025CE8 01DD19E8 00000000 */   nop
/* 025CEC 01DD19EC CC9B8893 */  lbu         $8, -0x6434($28)
/* 025CF0 01DD19F0 28260072 */  paddub      $4, $16, $0
/* 025CF4 01DD19F4 282E4070 */  paddub      $5, $2, $0
/* 025CF8 01DD19F8 8000A627 */  addiu       $6, $29, 0x80
/* 025CFC 01DD19FC 9000A727 */  addiu       $7, $29, 0x90
/* 025D00 01DD1A00 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 025D04 01DD1A04 00000000 */   nop
/* 025D08 01DD1A08 D09B828F */  lw          $2, -0x6430($28)
/* 025D0C 01DD1A0C 01004224 */  addiu       $2, $2, 0x1
/* 025D10 01DD1A10 D09B82AF */  sw          $2, -0x6430($28)
/* 025D14 01DD1A14 D09B828F */  lw          $2, -0x6430($28)
/* 025D18 01DD1A18 3C004228 */  slti        $2, $2, 0x3C
/* 025D1C 01DD1A1C 0A004014 */  bnez        $2, .L01DD1A48_2D7248
/* 025D20 01DD1A20 00000000 */   nop
/* 025D24 01DD1A24 CC9B828F */  lw          $2, -0x6434($28)
/* 025D28 01DD1A28 01004224 */  addiu       $2, $2, 0x1
/* 025D2C 01DD1A2C CC9B82AF */  sw          $2, -0x6434($28)
/* 025D30 01DD1A30 CC9B828F */  lw          $2, -0x6434($28)
/* 025D34 01DD1A34 80004228 */  slti        $2, $2, 0x80
/* 025D38 01DD1A38 03004014 */  bnez        $2, .L01DD1A48_2D7248
/* 025D3C 01DD1A3C 00000000 */   nop
/* 025D40 01DD1A40 80000224 */  addiu       $2, $0, 0x80
/* 025D44 01DD1A44 CC9B82AF */  sw          $2, -0x6434($28)
.L01DD1A48_2D7248:
/* 025D48 01DD1A48 C701023C */  lui         $2, %hi(TexManager)
/* 025D4C 01DD1A4C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 025D50 01DD1A50 D48B858F */  lw          $5, -0x742C($28)
/* 025D54 01DD1A54 16000624 */  addiu       $6, $0, 0x16
/* 025D58 01DD1A58 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 025D5C 01DD1A5C 00000000 */   nop
/* 025D60 01DD1A60 DE01023C */  lui         $2, %hi(LIT_1681)
/* 025D64 01DD1A64 B0BA4324 */  addiu       $3, $2, %lo(LIT_1681)
/* 025D68 01DD1A68 A000A427 */  addiu       $4, $29, 0xA0
/* 025D6C 01DD1A6C 000062DC */  ld          $2, 0x0($3)
/* 025D70 01DD1A70 080060C4 */  lwc1        $f0, 0x8($3)
/* 025D74 01DD1A74 000082FC */  sd          $2, 0x0($4)
/* 025D78 01DD1A78 080080E4 */  swc1        $f0, 0x8($4)
/* 025D7C 01DD1A7C 03000524 */  addiu       $5, $0, 0x3
/* 025D80 01DD1A80 20000624 */  addiu       $6, $0, 0x20
/* 025D84 01DD1A84 283E0070 */  paddub      $7, $0, $0
/* 025D88 01DD1A88 B094050C */  jal         DepthOfField__FPfiii
/* 025D8C 01DD1A8C 00000000 */   nop
/* 025D90 01DD1A90 1000BF7B */  lq          $31, 0x10($29)
/* 025D94 01DD1A94 0000B07B */  lq          $16, 0x0($29)
/* 025D98 01DD1A98 B000BD27 */  addiu       $29, $29, 0xB0
/* 025D9C 01DD1A9C 0800E003 */  jr          $31
/* 025DA0 01DD1AA0 00000000 */   nop
/* 025DA4 01DD1AA4 00000000 */  nop
/* 025DA8 01DD1AA8 00000000 */  nop
/* 025DAC 01DD1AAC 00000000 */  nop
