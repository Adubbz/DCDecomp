.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BtGetTreasureboxBig_Loop__Fv
/* 0D1910 001D1810 B0FFBD27 */  addiu       $29, $29, -0x50
/* 0D1914 001D1814 2000BF7F */  sq          $31, 0x20($29)
/* 0D1918 001D1818 1000B17F */  sq          $17, 0x10($29)
/* 0D191C 001D181C 0000B07F */  sq          $16, 0x0($29)
/* 0D1920 001D1820 28860070 */  paddub      $16, $0, $0
/* 0D1924 001D1824 2894838F */  lw          $3, -0x6BD8($28)
/* 0D1928 001D1828 0A000224 */  addiu       $2, $0, 0xA
/* 0D192C 001D182C B4016210 */  beq         $3, $2, .L001D1F00
/* 0D1930 001D1830 00000000 */   nop
/* 0D1934 001D1834 03000224 */  addiu       $2, $0, 0x3
/* 0D1938 001D1838 5B016210 */  beq         $3, $2, .L001D1DA8
/* 0D193C 001D183C 00000000 */   nop
/* 0D1940 001D1840 02000224 */  addiu       $2, $0, 0x2
/* 0D1944 001D1844 01016210 */  beq         $3, $2, .L001D1C4C
/* 0D1948 001D1848 00000000 */   nop
/* 0D194C 001D184C 01000224 */  addiu       $2, $0, 0x1
/* 0D1950 001D1850 2E006210 */  beq         $3, $2, .L001D190C
/* 0D1954 001D1854 00000000 */   nop
/* 0D1958 001D1858 03006010 */  beqz        $3, .L001D1868
/* 0D195C 001D185C 00000000 */   nop
/* 0D1960 001D1860 CE010010 */  b           .L001D1F9C
/* 0D1964 001D1864 00000000 */   nop
.L001D1868:
/* 0D1968 001D1868 006E050C */  jal         SndSPSeSyncBG__Fv
/* 0D196C 001D186C 00000000 */   nop
/* 0D1970 001D1870 22004014 */  bnez        $2, .L001D18FC
/* 0D1974 001D1874 00000000 */   nop
/* 0D1978 001D1878 8CFB040C */  jal         ReadBGSync__Fv
/* 0D197C 001D187C 00000000 */   nop
/* 0D1980 001D1880 1E004014 */  bnez        $2, .L001D18FC
/* 0D1984 001D1884 00000000 */   nop
/* 0D1988 001D1888 509D858F */  lw          $5, -0x62B0($28)
/* 0D198C 001D188C 1C000424 */  addiu       $4, $0, 0x1C
/* 0D1990 001D1890 FCAF760C */  jal         SetTempTexture__FiPc
/* 0D1994 001D1894 00000000 */   nop
/* 0D1998 001D1898 4C9D848F */  lw          $4, -0x62B4($28)
/* 0D199C 001D189C F001023C */  lui         $2, %hi(BtCashBuffer)
/* 0D19A0 001D18A0 50684524 */  addiu       $5, $2, %lo(BtCashBuffer)
/* 0D19A4 001D18A4 28360070 */  paddub      $6, $0, $0
/* 0D19A8 001D18A8 283E0070 */  paddub      $7, $0, $0
/* 0D19AC 001D18AC 28460070 */  paddub      $8, $0, $0
/* 0D19B0 001D18B0 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 0D19B4 001D18B4 00000000 */   nop
/* 0D19B8 001D18B8 589D82AF */  sw          $2, -0x62A8($28)
/* 0D19BC 001D18BC 549D858F */  lw          $5, -0x62AC($28)
/* 0D19C0 001D18C0 EA01023C */  lui         $2, %hi(CharaMain)
/* 0D19C4 001D18C4 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 0D19C8 001D18C8 2A00023C */  lui         $2, %hi(LIT_747)
/* 0D19CC 001D18CC 70C64624 */  addiu       $6, $2, %lo(LIT_747)
/* 0D19D0 001D18D0 F001023C */  lui         $2, %hi(BtCashBuffer)
/* 0D19D4 001D18D4 50684724 */  addiu       $7, $2, %lo(BtCashBuffer)
/* 0D19D8 001D18D8 F001023C */  lui         $2, %hi(BtCashBuffer)
/* 0D19DC 001D18DC 50684824 */  addiu       $8, $2, %lo(BtCashBuffer)
/* 0D19E0 001D18E0 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 0D19E4 001D18E4 00000000 */   nop
/* 0D19E8 001D18E8 DC01013C */  lui         $1, %hi(BtActStatus + 0x54)
/* 0D19EC 001D18EC D44420AC */  sw          $0, %lo(BtActStatus + 0x54)($1)
/* 0D19F0 001D18F0 2894828F */  lw          $2, -0x6BD8($28)
/* 0D19F4 001D18F4 01004224 */  addiu       $2, $2, 0x1
/* 0D19F8 001D18F8 289482AF */  sw          $2, -0x6BD8($28)
.L001D18FC:
/* 0D19FC 001D18FC 5CFA760C */  jal         autoCamTrial__Fv
/* 0D1A00 001D1900 00000000 */   nop
/* 0D1A04 001D1904 A5010010 */  b           .L001D1F9C
/* 0D1A08 001D1908 00000000 */   nop
.L001D190C:
/* 0D1A0C 001D190C 28260070 */  paddub      $4, $0, $0
/* 0D1A10 001D1910 B004770C */  jal         SetMIniMapStatus__Fi
/* 0D1A14 001D1914 00000000 */   nop
/* 0D1A18 001D1918 FFFF0224 */  addiu       $2, $0, -0x1
/* 0D1A1C 001D191C B49D82AF */  sw          $2, -0x624C($28)
/* 0D1A20 001D1920 01000224 */  addiu       $2, $0, 0x1
/* 0D1A24 001D1924 EC9C82AF */  sw          $2, -0x6314($28)
/* 0D1A28 001D1928 F09C82AF */  sw          $2, -0x6310($28)
/* 0D1A2C 001D192C E49C82AF */  sw          $2, -0x631C($28)
/* 0D1A30 001D1930 E89C82AF */  sw          $2, -0x6318($28)
/* 0D1A34 001D1934 C89C848F */  lw          $4, -0x6338($28)
/* 0D1A38 001D1938 BC9D838F */  lw          $3, -0x6244($28)
/* 0D1A3C 001D193C 80100300 */  sll         $2, $3, 2
/* 0D1A40 001D1940 21104300 */  addu        $2, $2, $3
/* 0D1A44 001D1944 00110200 */  sll         $2, $2, 4
/* 0D1A48 001D1948 21104400 */  addu        $2, $2, $4
/* 0D1A4C 001D194C 0100013C */  lui         $1, (0x10000 >> 16)
/* 0D1A50 001D1950 21084100 */  addu        $1, $2, $1
/* 0D1A54 001D1954 788D228C */  lw          $2, -0x7288($1)
/* 0D1A58 001D1958 80890200 */  sll         $17, $2, 6
/* 0D1A5C 001D195C 21109100 */  addu        $2, $4, $17
/* 0D1A60 001D1960 3000A427 */  addiu       $4, $29, 0x30
/* 0D1A64 001D1964 78364524 */  addiu       $5, $2, 0x3678
/* 0D1A68 001D1968 F87FA524 */  addiu       $5, $5, 0x7FF8
/* 0D1A6C 001D196C 0C86040C */  jal         sceVu0CopyVector
/* 0D1A70 001D1970 00000000 */   nop
/* 0D1A74 001D1974 F0C1033C */  lui         $3, (0xC1F00000 >> 16)
/* 0D1A78 001D1978 C89C828F */  lw          $2, -0x6338($28)
/* 0D1A7C 001D197C 21102202 */  addu        $2, $17, $2
/* 0D1A80 001D1980 0100013C */  lui         $1, (0x10000 >> 16)
/* 0D1A84 001D1984 21084100 */  addu        $1, $2, $1
/* 0D1A88 001D1988 8CB623AC */  sw          $3, -0x4974($1)
/* 0D1A8C 001D198C C89C828F */  lw          $2, -0x6338($28)
/* 0D1A90 001D1990 21102202 */  addu        $2, $17, $2
/* 0D1A94 001D1994 0100013C */  lui         $1, (0x10000 >> 16)
/* 0D1A98 001D1998 21084100 */  addu        $1, $2, $1
/* 0D1A9C 001D199C 84B620AC */  sw          $0, -0x497C($1)
/* 0D1AA0 001D19A0 EB01013C */  lui         $1, %hi(itemOpenBig)
/* 0D1AA4 001D19A4 905F248C */  lw          $4, %lo(itemOpenBig)($1)
/* 0D1AA8 001D19A8 3000A527 */  addiu       $5, $29, 0x30
/* 0D1AAC 001D19AC B89F040C */  jal         SetPosition__6CFrameFPf
/* 0D1AB0 001D19B0 00000000 */   nop
/* 0D1AB4 001D19B4 EB01013C */  lui         $1, %hi(itemOpenBigFx)
/* 0D1AB8 001D19B8 3060248C */  lw          $4, %lo(itemOpenBigFx)($1)
/* 0D1ABC 001D19BC 3000A527 */  addiu       $5, $29, 0x30
/* 0D1AC0 001D19C0 B89F040C */  jal         SetPosition__6CFrameFPf
/* 0D1AC4 001D19C4 00000000 */   nop
/* 0D1AC8 001D19C8 00608044 */  mtc1        $0, $f12
/* 0D1ACC 001D19CC 00000000 */  nop
/* 0D1AD0 001D19D0 46630046 */  mov.s       $f13, $f12
/* 0D1AD4 001D19D4 86630046 */  mov.s       $f14, $f12
/* 0D1AD8 001D19D8 EB01013C */  lui         $1, %hi(itemOpenBigFx)
/* 0D1ADC 001D19DC 3060248C */  lw          $4, %lo(itemOpenBigFx)($1)
/* 0D1AE0 001D19E0 70A3040C */  jal         SetRotation__6CFrameFfff
/* 0D1AE4 001D19E4 00000000 */   nop
/* 0D1AE8 001D19E8 4000A427 */  addiu       $4, $29, 0x40
/* 0D1AEC 001D19EC 3000A527 */  addiu       $5, $29, 0x30
/* 0D1AF0 001D19F0 0C86040C */  jal         sceVu0CopyVector
/* 0D1AF4 001D19F4 00000000 */   nop
/* 0D1AF8 001D19F8 4000A1C7 */  lwc1        $f1, 0x40($29)
/* 0D1AFC 001D19FC A040023C */  lui         $2, (0x40A00000 >> 16)
/* 0D1B00 001D1A00 00008244 */  mtc1        $2, $f0
/* 0D1B04 001D1A04 00000000 */  nop
/* 0D1B08 001D1A08 01080046 */  sub.s       $f0, $f1, $f0
/* 0D1B0C 001D1A0C 4000A0E7 */  swc1        $f0, 0x40($29)
/* 0D1B10 001D1A10 4400A1C7 */  lwc1        $f1, 0x44($29)
/* 0D1B14 001D1A14 5041023C */  lui         $2, (0x41500000 >> 16)
/* 0D1B18 001D1A18 00008244 */  mtc1        $2, $f0
/* 0D1B1C 001D1A1C 00000000 */  nop
/* 0D1B20 001D1A20 00080046 */  add.s       $f0, $f1, $f0
/* 0D1B24 001D1A24 4400A0E7 */  swc1        $f0, 0x44($29)
/* 0D1B28 001D1A28 3494838F */  lw          $3, -0x6BCC($28)
/* 0D1B2C 001D1A2C 03000224 */  addiu       $2, $0, 0x3
/* 0D1B30 001D1A30 41006210 */  beq         $3, $2, .L001D1B38
/* 0D1B34 001D1A34 00000000 */   nop
/* 0D1B38 001D1A38 02000224 */  addiu       $2, $0, 0x2
/* 0D1B3C 001D1A3C 2A006210 */  beq         $3, $2, .L001D1AE8
/* 0D1B40 001D1A40 00000000 */   nop
/* 0D1B44 001D1A44 01000224 */  addiu       $2, $0, 0x1
/* 0D1B48 001D1A48 13006210 */  beq         $3, $2, .L001D1A98
/* 0D1B4C 001D1A4C 00000000 */   nop
/* 0D1B50 001D1A50 03006010 */  beqz        $3, .L001D1A60
/* 0D1B54 001D1A54 00000000 */   nop
/* 0D1B58 001D1A58 4A000010 */  b           .L001D1B84
/* 0D1B5C 001D1A5C 00000000 */   nop
.L001D1A60:
/* 0D1B60 001D1A60 00688044 */  mtc1        $0, $f13
/* 0D1B64 001D1A64 589D848F */  lw          $4, -0x62A8($28)
/* 0D1B68 001D1A68 C8808CC7 */  lwc1        $f12, -0x7F38($28)
/* 0D1B6C 001D1A6C 86630046 */  mov.s       $f14, $f12
/* 0D1B70 001D1A70 70A3040C */  jal         SetRotation__6CFrameFfff
/* 0D1B74 001D1A74 00000000 */   nop
/* 0D1B78 001D1A78 589D848F */  lw          $4, -0x62A8($28)
/* 0D1B7C 001D1A7C 4000A527 */  addiu       $5, $29, 0x40
/* 0D1B80 001D1A80 B89F040C */  jal         SetPosition__6CFrameFPf
/* 0D1B84 001D1A84 00000000 */   nop
/* 0D1B88 001D1A88 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0D1B8C 001D1A8C 389482AF */  sw          $2, -0x6BC8($28)
/* 0D1B90 001D1A90 3C000010 */  b           .L001D1B84
/* 0D1B94 001D1A94 00000000 */   nop
.L001D1A98:
/* 0D1B98 001D1A98 00708044 */  mtc1        $0, $f14
/* 0D1B9C 001D1A9C 589D848F */  lw          $4, -0x62A8($28)
/* 0D1BA0 001D1AA0 64858CC7 */  lwc1        $f12, -0x7A9C($28)
/* 0D1BA4 001D1AA4 46630046 */  mov.s       $f13, $f12
/* 0D1BA8 001D1AA8 70A3040C */  jal         SetRotation__6CFrameFfff
/* 0D1BAC 001D1AAC 00000000 */   nop
/* 0D1BB0 001D1AB0 4000A1C7 */  lwc1        $f1, 0x40($29)
/* 0D1BB4 001D1AB4 6040023C */  lui         $2, (0x40600000 >> 16)
/* 0D1BB8 001D1AB8 00008244 */  mtc1        $2, $f0
/* 0D1BBC 001D1ABC 00000000 */  nop
/* 0D1BC0 001D1AC0 00080046 */  add.s       $f0, $f1, $f0
/* 0D1BC4 001D1AC4 4000A0E7 */  swc1        $f0, 0x40($29)
/* 0D1BC8 001D1AC8 589D848F */  lw          $4, -0x62A8($28)
/* 0D1BCC 001D1ACC 4000A527 */  addiu       $5, $29, 0x40
/* 0D1BD0 001D1AD0 B89F040C */  jal         SetPosition__6CFrameFPf
/* 0D1BD4 001D1AD4 00000000 */   nop
/* 0D1BD8 001D1AD8 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0D1BDC 001D1ADC 389482AF */  sw          $2, -0x6BC8($28)
/* 0D1BE0 001D1AE0 28000010 */  b           .L001D1B84
/* 0D1BE4 001D1AE4 00000000 */   nop
.L001D1AE8:
/* 0D1BE8 001D1AE8 00708044 */  mtc1        $0, $f14
/* 0D1BEC 001D1AEC 589D848F */  lw          $4, -0x62A8($28)
/* 0D1BF0 001D1AF0 64858CC7 */  lwc1        $f12, -0x7A9C($28)
/* 0D1BF4 001D1AF4 44848DC7 */  lwc1        $f13, -0x7BBC($28)
/* 0D1BF8 001D1AF8 70A3040C */  jal         SetRotation__6CFrameFfff
/* 0D1BFC 001D1AFC 00000000 */   nop
/* 0D1C00 001D1B00 4000A1C7 */  lwc1        $f1, 0x40($29)
/* 0D1C04 001D1B04 2040023C */  lui         $2, (0x40200000 >> 16)
/* 0D1C08 001D1B08 00008244 */  mtc1        $2, $f0
/* 0D1C0C 001D1B0C 00000000 */  nop
/* 0D1C10 001D1B10 00080046 */  add.s       $f0, $f1, $f0
/* 0D1C14 001D1B14 4000A0E7 */  swc1        $f0, 0x40($29)
/* 0D1C18 001D1B18 589D848F */  lw          $4, -0x62A8($28)
/* 0D1C1C 001D1B1C 4000A527 */  addiu       $5, $29, 0x40
/* 0D1C20 001D1B20 B89F040C */  jal         SetPosition__6CFrameFPf
/* 0D1C24 001D1B24 00000000 */   nop
/* 0D1C28 001D1B28 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0D1C2C 001D1B2C 389482AF */  sw          $2, -0x6BC8($28)
/* 0D1C30 001D1B30 14000010 */  b           .L001D1B84
/* 0D1C34 001D1B34 00000000 */   nop
.L001D1B38:
/* 0D1C38 001D1B38 00708044 */  mtc1        $0, $f14
/* 0D1C3C 001D1B3C 00000000 */  nop
/* 0D1C40 001D1B40 06730046 */  mov.s       $f12, $f14
/* 0D1C44 001D1B44 589D848F */  lw          $4, -0x62A8($28)
/* 0D1C48 001D1B48 58848DC7 */  lwc1        $f13, -0x7BA8($28)
/* 0D1C4C 001D1B4C 70A3040C */  jal         SetRotation__6CFrameFfff
/* 0D1C50 001D1B50 00000000 */   nop
/* 0D1C54 001D1B54 4000A1C7 */  lwc1        $f1, 0x40($29)
/* 0D1C58 001D1B58 6040023C */  lui         $2, (0x40600000 >> 16)
/* 0D1C5C 001D1B5C 00008244 */  mtc1        $2, $f0
/* 0D1C60 001D1B60 00000000 */  nop
/* 0D1C64 001D1B64 00080046 */  add.s       $f0, $f1, $f0
/* 0D1C68 001D1B68 4000A0E7 */  swc1        $f0, 0x40($29)
/* 0D1C6C 001D1B6C 589D848F */  lw          $4, -0x62A8($28)
/* 0D1C70 001D1B70 4000A527 */  addiu       $5, $29, 0x40
/* 0D1C74 001D1B74 B89F040C */  jal         SetPosition__6CFrameFPf
/* 0D1C78 001D1B78 00000000 */   nop
/* 0D1C7C 001D1B7C 0040023C */  lui         $2, (0x40000000 >> 16)
/* 0D1C80 001D1B80 389482AF */  sw          $2, -0x6BC8($28)
.L001D1B84:
/* 0D1C84 001D1B84 589D848F */  lw          $4, -0x62A8($28)
/* 0D1C88 001D1B88 14848CC7 */  lwc1        $f12, -0x7BEC($28)
/* 0D1C8C 001D1B8C 46630046 */  mov.s       $f13, $f12
/* 0D1C90 001D1B90 86630046 */  mov.s       $f14, $f12
/* 0D1C94 001D1B94 D49F040C */  jal         SetScale__6CFrameFfff
/* 0D1C98 001D1B98 00000000 */   nop
/* 0D1C9C 001D1B9C 808080C7 */  lwc1        $f0, -0x7F80($28)
/* 0D1CA0 001D1BA0 5C9D80E7 */  swc1        $f0, -0x62A4($28)
/* 0D1CA4 001D1BA4 EA01023C */  lui         $2, %hi(CharaMain)
/* 0D1CA8 001D1BA8 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 0D1CAC 001D1BAC 3000A527 */  addiu       $5, $29, 0x30
/* 0D1CB0 001D1BB0 38E4040C */  jal         SetPosition__10CCharacterFPf
/* 0D1CB4 001D1BB4 00000000 */   nop
/* 0D1CB8 001D1BB8 00688044 */  mtc1        $0, $f13
/* 0D1CBC 001D1BBC 00000000 */  nop
/* 0D1CC0 001D1BC0 866B0046 */  mov.s       $f14, $f13
/* 0D1CC4 001D1BC4 066B0046 */  mov.s       $f12, $f13
/* 0D1CC8 001D1BC8 EA01023C */  lui         $2, %hi(CharaMain)
/* 0D1CCC 001D1BCC 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 0D1CD0 001D1BD0 54E4040C */  jal         SetRotation__10CCharacterFfff
/* 0D1CD4 001D1BD4 00000000 */   nop
/* 0D1CD8 001D1BD8 2C000224 */  addiu       $2, $0, 0x2C
/* 0D1CDC 001D1BDC DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 0D1CE0 001D1BE0 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
/* 0D1CE4 001D1BE4 2041023C */  lui         $2, (0x41200000 >> 16)
/* 0D1CE8 001D1BE8 EB01013C */  lui         $1, %hi(itemOpenBig + 0x88)
/* 0D1CEC 001D1BEC 186022AC */  sw          $2, %lo(itemOpenBig + 0x88)($1)
/* 0D1CF0 001D1BF0 EB01013C */  lui         $1, %hi(itemOpenBigFx + 0x20)
/* 0D1CF4 001D1BF4 506022AC */  sw          $2, %lo(itemOpenBigFx + 0x20)($1)
/* 0D1CF8 001D1BF8 01000224 */  addiu       $2, $0, 0x1
/* 0D1CFC 001D1BFC 609D82AF */  sw          $2, -0x62A0($28)
/* 0D1D00 001D1C00 DC01023C */  lui         $2, %hi(SubCamera)
/* 0D1D04 001D1C04 E0484424 */  addiu       $4, $2, %lo(SubCamera)
/* 0D1D08 001D1C08 DC01023C */  lui         $2, %hi(MainCamera__4)
/* 0D1D0C 001D1C0C E0454524 */  addiu       $5, $2, %lo(MainCamera__4)
/* 0D1D10 001D1C10 A892040C */  jal         __as__13CCameraFollowFRC13CCameraFollow
/* 0D1D14 001D1C14 00000000 */   nop
/* 0D1D18 001D1C18 DC01023C */  lui         $2, %hi(SubCamera)
/* 0D1D1C 001D1C1C E0484224 */  addiu       $2, $2, %lo(SubCamera)
/* 0D1D20 001D1C20 A89C82AF */  sw          $2, -0x6358($28)
/* 0D1D24 001D1C24 A89C848F */  lw          $4, -0x6358($28)
/* 0D1D28 001D1C28 C492040C */  jal         FollowOff__13CCameraFollowFv
/* 0D1D2C 001D1C2C 00000000 */   nop
/* 0D1D30 001D1C30 5CFA760C */  jal         autoCamTrial__Fv
/* 0D1D34 001D1C34 00000000 */   nop
/* 0D1D38 001D1C38 2894828F */  lw          $2, -0x6BD8($28)
/* 0D1D3C 001D1C3C 01004224 */  addiu       $2, $2, 0x1
/* 0D1D40 001D1C40 289482AF */  sw          $2, -0x6BD8($28)
/* 0D1D44 001D1C44 D5000010 */  b           .L001D1F9C
/* 0D1D48 001D1C48 00000000 */   nop
.L001D1C4C:
/* 0D1D4C 001D1C4C A89C858F */  lw          $5, -0x6358($28)
/* 0D1D50 001D1C50 EB01013C */  lui         $1, %hi(itemOpenBigFx)
/* 0D1D54 001D1C54 3060248C */  lw          $4, %lo(itemOpenBigFx)($1)
/* 0D1D58 001D1C58 2A00023C */  lui         $2, %hi(LIT_754)
/* 0D1D5C 001D1C5C 80C64624 */  addiu       $6, $2, %lo(LIT_754)
/* 0D1D60 001D1C60 2A00023C */  lui         $2, %hi(LIT_755)
/* 0D1D64 001D1C64 88C64724 */  addiu       $7, $2, %lo(LIT_755)
/* 0D1D68 001D1C68 A0DB060C */  jal         setCameraPassData__FP9CFrameVu1P7CCameraPcPc
/* 0D1D6C 001D1C6C 00000000 */   nop
/* 0D1D70 001D1C70 EB01013C */  lui         $1, %hi(itemOpenBigFx + 0x20)
/* 0D1D74 001D1C74 506021C4 */  lwc1        $f1, %lo(itemOpenBigFx + 0x20)($1)
/* 0D1D78 001D1C78 6041023C */  lui         $2, (0x41600000 >> 16)
/* 0D1D7C 001D1C7C 00008244 */  mtc1        $2, $f0
/* 0D1D80 001D1C80 00000000 */  nop
/* 0D1D84 001D1C84 36080046 */  c.le.s      $f1, $f0
/* 0D1D88 001D1C88 00000000 */  nop
/* 0D1D8C 001D1C8C 11000145 */  bc1t        .L001D1CD4
/* 0D1D90 001D1C90 00000000 */   nop
/* 0D1D94 001D1C94 7041023C */  lui         $2, (0x41700000 >> 16)
/* 0D1D98 001D1C98 00008244 */  mtc1        $2, $f0
/* 0D1D9C 001D1C9C 00000000 */  nop
/* 0D1DA0 001D1CA0 34080046 */  c.lt.s      $f1, $f0
/* 0D1DA4 001D1CA4 00000000 */  nop
/* 0D1DA8 001D1CA8 0A000045 */  bc1f        .L001D1CD4
/* 0D1DAC 001D1CAC 00000000 */   nop
/* 0D1DB0 001D1CB0 CE000424 */  addiu       $4, $0, 0xCE
/* 0D1DB4 001D1CB4 FFFF0524 */  addiu       $5, $0, -0x1
/* 0D1DB8 001D1CB8 28360070 */  paddub      $6, $0, $0
/* 0D1DBC 001D1CBC AC69050C */  jal         SndSePlay__Fiii
/* 0D1DC0 001D1CC0 00000000 */   nop
/* 0D1DC4 001D1CC4 02000424 */  addiu       $4, $0, 0x2
/* 0D1DC8 001D1CC8 FFFF0524 */  addiu       $5, $0, -0x1
/* 0D1DCC 001D1CCC 206E050C */  jal         SndSPSePlay__Fii
/* 0D1DD0 001D1CD0 00000000 */   nop
.L001D1CD4:
/* 0D1DD4 001D1CD4 EB01013C */  lui         $1, %hi(itemOpenBigFx + 0x20)
/* 0D1DD8 001D1CD8 506023C4 */  lwc1        $f3, %lo(itemOpenBigFx + 0x20)($1)
/* 0D1DDC 001D1CDC 4842023C */  lui         $2, (0x42480000 >> 16)
/* 0D1DE0 001D1CE0 00108244 */  mtc1        $2, $f2
/* 0D1DE4 001D1CE4 00000000 */  nop
/* 0D1DE8 001D1CE8 36180246 */  c.le.s      $f3, $f2
/* 0D1DEC 001D1CEC 00000000 */  nop
/* 0D1DF0 001D1CF0 14000145 */  bc1t        .L001D1D44
/* 0D1DF4 001D1CF4 00000000 */   nop
/* 0D1DF8 001D1CF8 5C42023C */  lui         $2, (0x425C0000 >> 16)
/* 0D1DFC 001D1CFC 00008244 */  mtc1        $2, $f0
/* 0D1E00 001D1D00 00000000 */  nop
/* 0D1E04 001D1D04 36180046 */  c.le.s      $f3, $f0
/* 0D1E08 001D1D08 00000000 */  nop
/* 0D1E0C 001D1D0C 0D000045 */  bc1f        .L001D1D44
/* 0D1E10 001D1D10 00000000 */   nop
/* 0D1E14 001D1D14 A040023C */  lui         $2, (0x40A00000 >> 16)
/* 0D1E18 001D1D18 00088244 */  mtc1        $2, $f1
/* 0D1E1C 001D1D1C 389480C7 */  lwc1        $f0, -0x6BC8($28)
/* 0D1E20 001D1D20 43000146 */  div.s       $f1, $f0, $f1
/* 0D1E24 001D1D24 01180246 */  sub.s       $f0, $f3, $f2
/* 0D1E28 001D1D28 020B0046 */  mul.s       $f12, $f1, $f0
/* 0D1E2C 001D1D2C 5C9D8CE7 */  swc1        $f12, -0x62A4($28)
/* 0D1E30 001D1D30 589D848F */  lw          $4, -0x62A8($28)
/* 0D1E34 001D1D34 46630046 */  mov.s       $f13, $f12
/* 0D1E38 001D1D38 86630046 */  mov.s       $f14, $f12
/* 0D1E3C 001D1D3C D49F040C */  jal         SetScale__6CFrameFfff
/* 0D1E40 001D1D40 00000000 */   nop
.L001D1D44:
/* 0D1E44 001D1D44 EB01013C */  lui         $1, %hi(itemOpenBigFx + 0x20)
/* 0D1E48 001D1D48 506021C4 */  lwc1        $f1, %lo(itemOpenBigFx + 0x20)($1)
/* 0D1E4C 001D1D4C 9E42023C */  lui         $2, (0x429E0000 >> 16)
/* 0D1E50 001D1D50 00008244 */  mtc1        $2, $f0
/* 0D1E54 001D1D54 00000000 */  nop
/* 0D1E58 001D1D58 34080046 */  c.lt.s      $f1, $f0
/* 0D1E5C 001D1D5C 00000000 */  nop
/* 0D1E60 001D1D60 8E000145 */  bc1t        .L001D1F9C
/* 0D1E64 001D1D64 00000000 */   nop
/* 0D1E68 001D1D68 02000224 */  addiu       $2, $0, 0x2
/* 0D1E6C 001D1D6C 609D82AF */  sw          $2, -0x62A0($28)
/* 0D1E70 001D1D70 2D000224 */  addiu       $2, $0, 0x2D
/* 0D1E74 001D1D74 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 0D1E78 001D1D78 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
/* 0D1E7C 001D1D7C 2894828F */  lw          $2, -0x6BD8($28)
/* 0D1E80 001D1D80 01004224 */  addiu       $2, $2, 0x1
/* 0D1E84 001D1D84 289482AF */  sw          $2, -0x6BD8($28)
/* 0D1E88 001D1D88 3094848F */  lw          $4, -0x6BD0($28)
/* 0D1E8C 001D1D8C FFFF0524 */  addiu       $5, $0, -0x1
/* 0D1E90 001D1D90 28000624 */  addiu       $6, $0, 0x28
/* 0D1E94 001D1D94 01000724 */  addiu       $7, $0, 0x1
/* 0D1E98 001D1D98 A480050C */  jal         ItemGetMes__Fiiii
/* 0D1E9C 001D1D9C 00000000 */   nop
/* 0D1EA0 001D1DA0 7E000010 */  b           .L001D1F9C
/* 0D1EA4 001D1DA4 00000000 */   nop
.L001D1DA8:
/* 0D1EA8 001D1DA8 A89C858F */  lw          $5, -0x6358($28)
/* 0D1EAC 001D1DAC EB01013C */  lui         $1, %hi(itemOpenBigFx)
/* 0D1EB0 001D1DB0 3060248C */  lw          $4, %lo(itemOpenBigFx)($1)
/* 0D1EB4 001D1DB4 2A00023C */  lui         $2, %hi(LIT_754)
/* 0D1EB8 001D1DB8 80C64624 */  addiu       $6, $2, %lo(LIT_754)
/* 0D1EBC 001D1DBC 2A00023C */  lui         $2, %hi(LIT_755)
/* 0D1EC0 001D1DC0 88C64724 */  addiu       $7, $2, %lo(LIT_755)
/* 0D1EC4 001D1DC4 A0DB060C */  jal         setCameraPassData__FP9CFrameVu1P7CCameraPcPc
/* 0D1EC8 001D1DC8 00000000 */   nop
/* 0D1ECC 001D1DCC CC01023C */  lui         $2, %hi(GamePad)
/* 0D1ED0 001D1DD0 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0D1ED4 001D1DD4 60000524 */  addiu       $5, $0, 0x60
/* 0D1ED8 001D1DD8 1CAE040C */  jal         Down__8CGamePadFi
/* 0D1EDC 001D1DDC 00000000 */   nop
/* 0D1EE0 001D1DE0 6E004010 */  beqz        $2, .L001D1F9C
/* 0D1EE4 001D1DE4 00000000 */   nop
/* 0D1EE8 001D1DE8 01000224 */  addiu       $2, $0, 0x1
/* 0D1EEC 001D1DEC DC01013C */  lui         $1, %hi(BtActStatus + 0x54)
/* 0D1EF0 001D1DF0 D44422AC */  sw          $2, %lo(BtActStatus + 0x54)($1)
/* 0D1EF4 001D1DF4 C701023C */  lui         $2, %hi(TexManager)
/* 0D1EF8 001D1DF8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0D1EFC 001D1DFC 1C000524 */  addiu       $5, $0, 0x1C
/* 0D1F00 001D1E00 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 0D1F04 001D1E04 00000000 */   nop
/* 0D1F08 001D1E08 C701023C */  lui         $2, %hi(TexManager)
/* 0D1F0C 001D1E0C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0D1F10 001D1E10 98CE040C */  jal         CleanUpTextureList__15CTextureManagerFv
/* 0D1F14 001D1E14 00000000 */   nop
/* 0D1F18 001D1E18 789C848F */  lw          $4, -0x6388($28)
/* 0D1F1C 001D1E1C 3094858F */  lw          $5, -0x6BD0($28)
/* 0D1F20 001D1E20 28360070 */  paddub      $6, $0, $0
/* 0D1F24 001D1E24 18F8060C */  jal         GetItem__14CDngStatusDataFii
/* 0D1F28 001D1E28 00000000 */   nop
/* 0D1F2C 001D1E2C A89C848F */  lw          $4, -0x6358($28)
/* 0D1F30 001D1E30 C092040C */  jal         FollowOn__13CCameraFollowFv
/* 0D1F34 001D1E34 00000000 */   nop
/* 0D1F38 001D1E38 3000A427 */  addiu       $4, $29, 0x30
/* 0D1F3C 001D1E3C EA01023C */  lui         $2, %hi(CharaMain + 0x10)
/* 0D1F40 001D1E40 301D4524 */  addiu       $5, $2, %lo(CharaMain + 0x10)
/* 0D1F44 001D1E44 0C86040C */  jal         sceVu0CopyVector
/* 0D1F48 001D1E48 00000000 */   nop
/* 0D1F4C 001D1E4C 3800A1C7 */  lwc1        $f1, 0x38($29)
/* 0D1F50 001D1E50 2041023C */  lui         $2, (0x41200000 >> 16)
/* 0D1F54 001D1E54 00008244 */  mtc1        $2, $f0
/* 0D1F58 001D1E58 00000000 */  nop
/* 0D1F5C 001D1E5C 00080046 */  add.s       $f0, $f1, $f0
/* 0D1F60 001D1E60 3800A0E7 */  swc1        $f0, 0x38($29)
/* 0D1F64 001D1E64 EA01023C */  lui         $2, %hi(CharaMain)
/* 0D1F68 001D1E68 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 0D1F6C 001D1E6C 3000A527 */  addiu       $5, $29, 0x30
/* 0D1F70 001D1E70 38E4040C */  jal         SetPosition__10CCharacterFPf
/* 0D1F74 001D1E74 00000000 */   nop
/* 0D1F78 001D1E78 00608044 */  mtc1        $0, $f12
/* 0D1F7C 001D1E7C 00000000 */  nop
/* 0D1F80 001D1E80 86630046 */  mov.s       $f14, $f12
/* 0D1F84 001D1E84 EA01023C */  lui         $2, %hi(CharaMain)
/* 0D1F88 001D1E88 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 0D1F8C 001D1E8C 68858DC7 */  lwc1        $f13, -0x7A98($28)
/* 0D1F90 001D1E90 54E4040C */  jal         SetRotation__10CCharacterFfff
/* 0D1F94 001D1E94 00000000 */   nop
/* 0D1F98 001D1E98 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 0D1F9C 001D1E9C 8C4420AC */  sw          $0, %lo(BtActStatus + 0xC)($1)
/* 0D1FA0 001D1EA0 01000424 */  addiu       $4, $0, 0x1
/* 0D1FA4 001D1EA4 EA01013C */  lui         $1, %hi(DngMessMan)
/* 0D1FA8 001D1EA8 907624AC */  sw          $4, %lo(DngMessMan)($1)
/* 0D1FAC 001D1EAC 789C828F */  lw          $2, -0x6388($28)
/* 0D1FB0 001D1EB0 0100013C */  lui         $1, (0x10000 >> 16)
/* 0D1FB4 001D1EB4 21084100 */  addu        $1, $2, $1
/* 0D1FB8 001D1EB8 0C8B20AC */  sw          $0, -0x74F4($1)
/* 0D1FBC 001D1EBC B004770C */  jal         SetMIniMapStatus__Fi
/* 0D1FC0 001D1EC0 00000000 */   nop
/* 0D1FC4 001D1EC4 EC9C80AF */  sw          $0, -0x6314($28)
/* 0D1FC8 001D1EC8 F09C80AF */  sw          $0, -0x6310($28)
/* 0D1FCC 001D1ECC E49C80AF */  sw          $0, -0x631C($28)
/* 0D1FD0 001D1ED0 E89C80AF */  sw          $0, -0x6318($28)
/* 0D1FD4 001D1ED4 609D80AF */  sw          $0, -0x62A0($28)
/* 0D1FD8 001D1ED8 DC01013C */  lui         $1, %hi(BtActStatus + 0x9C)
/* 0D1FDC 001D1EDC 1C4520AC */  sw          $0, %lo(BtActStatus + 0x9C)($1)
/* 0D1FE0 001D1EE0 3480050C */  jal         ClearSystemMes__Fv
/* 0D1FE4 001D1EE4 00000000 */   nop
/* 0D1FE8 001D1EE8 DC01023C */  lui         $2, %hi(MainCamera__4)
/* 0D1FEC 001D1EEC E0454224 */  addiu       $2, $2, %lo(MainCamera__4)
/* 0D1FF0 001D1EF0 A89C82AF */  sw          $2, -0x6358($28)
/* 0D1FF4 001D1EF4 01001024 */  addiu       $16, $0, 0x1
/* 0D1FF8 001D1EF8 28000010 */  b           .L001D1F9C
/* 0D1FFC 001D1EFC 00000000 */   nop
.L001D1F00:
/* 0D2000 001D1F00 CC01023C */  lui         $2, %hi(GamePad)
/* 0D2004 001D1F04 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0D2008 001D1F08 60000524 */  addiu       $5, $0, 0x60
/* 0D200C 001D1F0C 1CAE040C */  jal         Down__8CGamePadFi
/* 0D2010 001D1F10 00000000 */   nop
/* 0D2014 001D1F14 21004010 */  beqz        $2, .L001D1F9C
/* 0D2018 001D1F18 00000000 */   nop
/* 0D201C 001D1F1C 3480050C */  jal         ClearSystemMes__Fv
/* 0D2020 001D1F20 00000000 */   nop
/* 0D2024 001D1F24 01000424 */  addiu       $4, $0, 0x1
/* 0D2028 001D1F28 EA01013C */  lui         $1, %hi(DngMessMan)
/* 0D202C 001D1F2C 907624AC */  sw          $4, %lo(DngMessMan)($1)
/* 0D2030 001D1F30 789C828F */  lw          $2, -0x6388($28)
/* 0D2034 001D1F34 0100013C */  lui         $1, (0x10000 >> 16)
/* 0D2038 001D1F38 21084100 */  addu        $1, $2, $1
/* 0D203C 001D1F3C 0C8B20AC */  sw          $0, -0x74F4($1)
/* 0D2040 001D1F40 DC01013C */  lui         $1, %hi(BtActStatus + 0x9C)
/* 0D2044 001D1F44 1C4520AC */  sw          $0, %lo(BtActStatus + 0x9C)($1)
/* 0D2048 001D1F48 C89C858F */  lw          $5, -0x6338($28)
/* 0D204C 001D1F4C BC9D838F */  lw          $3, -0x6244($28)
/* 0D2050 001D1F50 80100300 */  sll         $2, $3, 2
/* 0D2054 001D1F54 21104300 */  addu        $2, $2, $3
/* 0D2058 001D1F58 00110200 */  sll         $2, $2, 4
/* 0D205C 001D1F5C 21104500 */  addu        $2, $2, $5
/* 0D2060 001D1F60 0100013C */  lui         $1, (0x10000 >> 16)
/* 0D2064 001D1F64 21084100 */  addu        $1, $2, $1
/* 0D2068 001D1F68 788D228C */  lw          $2, -0x7288($1)
/* 0D206C 001D1F6C 80110200 */  sll         $2, $2, 6
/* 0D2070 001D1F70 21104500 */  addu        $2, $2, $5
/* 0D2074 001D1F74 0100013C */  lui         $1, (0x10000 >> 16)
/* 0D2078 001D1F78 21084100 */  addu        $1, $2, $1
/* 0D207C 001D1F7C 8CB620AC */  sw          $0, -0x4974($1)
/* 0D2080 001D1F80 B004770C */  jal         SetMIniMapStatus__Fi
/* 0D2084 001D1F84 00000000 */   nop
/* 0D2088 001D1F88 EC9C80AF */  sw          $0, -0x6314($28)
/* 0D208C 001D1F8C F09C80AF */  sw          $0, -0x6310($28)
/* 0D2090 001D1F90 E49C80AF */  sw          $0, -0x631C($28)
/* 0D2094 001D1F94 E89C80AF */  sw          $0, -0x6318($28)
/* 0D2098 001D1F98 01001024 */  addiu       $16, $0, 0x1
.L001D1F9C:
/* 0D209C 001D1F9C 28160072 */  paddub      $2, $16, $0
/* 0D20A0 001D1FA0 2000BF7B */  lq          $31, 0x20($29)
/* 0D20A4 001D1FA4 1000B17B */  lq          $17, 0x10($29)
/* 0D20A8 001D1FA8 0000B07B */  lq          $16, 0x0($29)
/* 0D20AC 001D1FAC 5000BD27 */  addiu       $29, $29, 0x50
/* 0D20B0 001D1FB0 0800E003 */  jr          $31
/* 0D20B4 001D1FB4 00000000 */   nop
/* 0D20B8 001D1FB8 00000000 */  nop
/* 0D20BC 001D1FBC 00000000 */  nop
