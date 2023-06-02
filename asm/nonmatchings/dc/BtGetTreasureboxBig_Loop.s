.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BtGetTreasureboxBig_Loop__Fv
/* D1910 001D1810 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* D1914 001D1814 2000BF7F */  sq         $31, 0x20($sp)
/* D1918 001D1818 1000B17F */  sq         $17, 0x10($sp)
/* D191C 001D181C 0000B07F */  sq         $16, 0x0($sp)
/* D1920 001D1820 28860070 */  paddub     $16, $0, $0
/* D1924 001D1824 2894838F */  lw         $3, -0x6BD8($gp)
/* D1928 001D1828 0A000224 */  addiu      $2, $0, 0xA
/* D192C 001D182C B4016210 */  beq        $3, $2, .L001D1F00
/* D1930 001D1830 00000000 */   nop
/* D1934 001D1834 03000224 */  addiu      $2, $0, 0x3
/* D1938 001D1838 5B016210 */  beq        $3, $2, .L001D1DA8
/* D193C 001D183C 00000000 */   nop
/* D1940 001D1840 02000224 */  addiu      $2, $0, 0x2
/* D1944 001D1844 01016210 */  beq        $3, $2, .L001D1C4C
/* D1948 001D1848 00000000 */   nop
/* D194C 001D184C 01000224 */  addiu      $2, $0, 0x1
/* D1950 001D1850 2E006210 */  beq        $3, $2, .L001D190C
/* D1954 001D1854 00000000 */   nop
/* D1958 001D1858 03006010 */  beqz       $3, .L001D1868
/* D195C 001D185C 00000000 */   nop
/* D1960 001D1860 CE010010 */  b          .L001D1F9C
/* D1964 001D1864 00000000 */   nop
.L001D1868:
/* D1968 001D1868 006E050C */  jal        SndSPSeSyncBG__Fv
/* D196C 001D186C 00000000 */   nop
/* D1970 001D1870 22004014 */  bnez       $2, .L001D18FC
/* D1974 001D1874 00000000 */   nop
/* D1978 001D1878 8CFB040C */  jal        ReadBGSync__Fv
/* D197C 001D187C 00000000 */   nop
/* D1980 001D1880 1E004014 */  bnez       $2, .L001D18FC
/* D1984 001D1884 00000000 */   nop
/* D1988 001D1888 509D858F */  lw         $5, -0x62B0($gp)
/* D198C 001D188C 1C000424 */  addiu      $4, $0, 0x1C
/* D1990 001D1890 FCAF760C */  jal        func_1DABFF0
/* D1994 001D1894 00000000 */   nop
/* D1998 001D1898 4C9D848F */  lw         $4, -0x62B4($gp)
/* D199C 001D189C F001023C */  lui        $2, %hi(D_1F06850)
/* D19A0 001D18A0 50684524 */  addiu      $5, $2, %lo(D_1F06850)
/* D19A4 001D18A4 28360070 */  paddub     $6, $0, $0
/* D19A8 001D18A8 283E0070 */  paddub     $7, $0, $0
/* D19AC 001D18AC 28460070 */  paddub     $8, $0, $0
/* D19B0 001D18B0 AC98040C */  jal        LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* D19B4 001D18B4 00000000 */   nop
/* D19B8 001D18B8 589D82AF */  sw         $2, -0x62A8($gp)
/* D19BC 001D18BC 549D858F */  lw         $5, -0x62AC($gp)
/* D19C0 001D18C0 EA01023C */  lui        $2, %hi(D_1EA1D20)
/* D19C4 001D18C4 201D4424 */  addiu      $4, $2, %lo(D_1EA1D20)
/* D19C8 001D18C8 2A00023C */  lui        $2, %hi(_747)
/* D19CC 001D18CC 70C64624 */  addiu      $6, $2, %lo(_747)
/* D19D0 001D18D0 F001023C */  lui        $2, %hi(D_1F06850)
/* D19D4 001D18D4 50684724 */  addiu      $7, $2, %lo(D_1F06850)
/* D19D8 001D18D8 F001023C */  lui        $2, %hi(D_1F06850)
/* D19DC 001D18DC 50684824 */  addiu      $8, $2, %lo(D_1F06850)
/* D19E0 001D18E0 FCE5040C */  jal        LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* D19E4 001D18E4 00000000 */   nop
/* D19E8 001D18E8 DC01013C */  lui        $at, (0x1DC44D4 >> 16)
/* D19EC 001D18EC D44420AC */  sw         $0, (0x1DC44D4 & 0xFFFF)($at)
/* D19F0 001D18F0 2894828F */  lw         $2, -0x6BD8($gp)
/* D19F4 001D18F4 01004224 */  addiu      $2, $2, 0x1
/* D19F8 001D18F8 289482AF */  sw         $2, -0x6BD8($gp)
.L001D18FC:
/* D19FC 001D18FC 5CFA760C */  jal        func_1DBE970
/* D1A00 001D1900 00000000 */   nop
/* D1A04 001D1904 A5010010 */  b          .L001D1F9C
/* D1A08 001D1908 00000000 */   nop
.L001D190C:
/* D1A0C 001D190C 28260070 */  paddub     $4, $0, $0
/* D1A10 001D1910 B004770C */  jal        func_1DC12C0
/* D1A14 001D1914 00000000 */   nop
/* D1A18 001D1918 FFFF0224 */  addiu      $2, $0, -0x1
/* D1A1C 001D191C B49D82AF */  sw         $2, -0x624C($gp)
/* D1A20 001D1920 01000224 */  addiu      $2, $0, 0x1
/* D1A24 001D1924 EC9C82AF */  sw         $2, -0x6314($gp)
/* D1A28 001D1928 F09C82AF */  sw         $2, -0x6310($gp)
/* D1A2C 001D192C E49C82AF */  sw         $2, -0x631C($gp)
/* D1A30 001D1930 E89C82AF */  sw         $2, -0x6318($gp)
/* D1A34 001D1934 C89C848F */  lw         $4, -0x6338($gp)
/* D1A38 001D1938 BC9D838F */  lw         $3, -0x6244($gp)
/* D1A3C 001D193C 80100300 */  sll        $2, $3, 2
/* D1A40 001D1940 21104300 */  addu       $2, $2, $3
/* D1A44 001D1944 00110200 */  sll        $2, $2, 4
/* D1A48 001D1948 21104400 */  addu       $2, $2, $4
/* D1A4C 001D194C 0100013C */  lui        $at, (0x10000 >> 16)
/* D1A50 001D1950 21084100 */  addu       $at, $2, $at
/* D1A54 001D1954 788D228C */  lw         $2, -0x7288($at)
/* D1A58 001D1958 80890200 */  sll        $17, $2, 6
/* D1A5C 001D195C 21109100 */  addu       $2, $4, $17
/* D1A60 001D1960 3000A427 */  addiu      $4, $sp, 0x30
/* D1A64 001D1964 78364524 */  addiu      $5, $2, 0x3678
/* D1A68 001D1968 F87FA524 */  addiu      $5, $5, 0x7FF8
/* D1A6C 001D196C 0C86040C */  jal        sceVu0CopyVector
/* D1A70 001D1970 00000000 */   nop
/* D1A74 001D1974 F0C1033C */  lui        $3, (0xC1F00000 >> 16)
/* D1A78 001D1978 C89C828F */  lw         $2, -0x6338($gp)
/* D1A7C 001D197C 21102202 */  addu       $2, $17, $2
/* D1A80 001D1980 0100013C */  lui        $at, (0x10000 >> 16)
/* D1A84 001D1984 21084100 */  addu       $at, $2, $at
/* D1A88 001D1988 8CB623AC */  sw         $3, -0x4974($at)
/* D1A8C 001D198C C89C828F */  lw         $2, -0x6338($gp)
/* D1A90 001D1990 21102202 */  addu       $2, $17, $2
/* D1A94 001D1994 0100013C */  lui        $at, (0x10000 >> 16)
/* D1A98 001D1998 21084100 */  addu       $at, $2, $at
/* D1A9C 001D199C 84B620AC */  sw         $0, -0x497C($at)
/* D1AA0 001D19A0 EB01013C */  lui        $at, (0x1EB5F90 >> 16)
/* D1AA4 001D19A4 905F248C */  lw         $4, (0x1EB5F90 & 0xFFFF)($at)
/* D1AA8 001D19A8 3000A527 */  addiu      $5, $sp, 0x30
/* D1AAC 001D19AC B89F040C */  jal        SetPosition__6CFrameFPf
/* D1AB0 001D19B0 00000000 */   nop
/* D1AB4 001D19B4 EB01013C */  lui        $at, (0x1EB6030 >> 16)
/* D1AB8 001D19B8 3060248C */  lw         $4, (0x1EB6030 & 0xFFFF)($at)
/* D1ABC 001D19BC 3000A527 */  addiu      $5, $sp, 0x30
/* D1AC0 001D19C0 B89F040C */  jal        SetPosition__6CFrameFPf
/* D1AC4 001D19C4 00000000 */   nop
/* D1AC8 001D19C8 00608044 */  mtc1       $0, $f12
/* D1ACC 001D19CC 00000000 */  nop
/* D1AD0 001D19D0 46630046 */  mov.s      $f13, $f12
/* D1AD4 001D19D4 86630046 */  mov.s      $f14, $f12
/* D1AD8 001D19D8 EB01013C */  lui        $at, (0x1EB6030 >> 16)
/* D1ADC 001D19DC 3060248C */  lw         $4, (0x1EB6030 & 0xFFFF)($at)
/* D1AE0 001D19E0 70A3040C */  jal        SetRotation__6CFrameFfff
/* D1AE4 001D19E4 00000000 */   nop
/* D1AE8 001D19E8 4000A427 */  addiu      $4, $sp, 0x40
/* D1AEC 001D19EC 3000A527 */  addiu      $5, $sp, 0x30
/* D1AF0 001D19F0 0C86040C */  jal        sceVu0CopyVector
/* D1AF4 001D19F4 00000000 */   nop
/* D1AF8 001D19F8 4000A1C7 */  lwc1       $f1, 0x40($sp)
/* D1AFC 001D19FC A040023C */  lui        $2, (0x40A00000 >> 16)
/* D1B00 001D1A00 00008244 */  mtc1       $2, $f0
/* D1B04 001D1A04 00000000 */  nop
/* D1B08 001D1A08 01080046 */  sub.s      $f0, $f1, $f0
/* D1B0C 001D1A0C 4000A0E7 */  swc1       $f0, 0x40($sp)
/* D1B10 001D1A10 4400A1C7 */  lwc1       $f1, 0x44($sp)
/* D1B14 001D1A14 5041023C */  lui        $2, (0x41500000 >> 16)
/* D1B18 001D1A18 00008244 */  mtc1       $2, $f0
/* D1B1C 001D1A1C 00000000 */  nop
/* D1B20 001D1A20 00080046 */  add.s      $f0, $f1, $f0
/* D1B24 001D1A24 4400A0E7 */  swc1       $f0, 0x44($sp)
/* D1B28 001D1A28 3494838F */  lw         $3, -0x6BCC($gp)
/* D1B2C 001D1A2C 03000224 */  addiu      $2, $0, 0x3
/* D1B30 001D1A30 41006210 */  beq        $3, $2, .L001D1B38
/* D1B34 001D1A34 00000000 */   nop
/* D1B38 001D1A38 02000224 */  addiu      $2, $0, 0x2
/* D1B3C 001D1A3C 2A006210 */  beq        $3, $2, .L001D1AE8
/* D1B40 001D1A40 00000000 */   nop
/* D1B44 001D1A44 01000224 */  addiu      $2, $0, 0x1
/* D1B48 001D1A48 13006210 */  beq        $3, $2, .L001D1A98
/* D1B4C 001D1A4C 00000000 */   nop
/* D1B50 001D1A50 03006010 */  beqz       $3, .L001D1A60
/* D1B54 001D1A54 00000000 */   nop
/* D1B58 001D1A58 4A000010 */  b          .L001D1B84
/* D1B5C 001D1A5C 00000000 */   nop
.L001D1A60:
/* D1B60 001D1A60 00688044 */  mtc1       $0, $f13
/* D1B64 001D1A64 589D848F */  lw         $4, -0x62A8($gp)
/* D1B68 001D1A68 C8808CC7 */  lwc1       $f12, -0x7F38($gp)
/* D1B6C 001D1A6C 86630046 */  mov.s      $f14, $f12
/* D1B70 001D1A70 70A3040C */  jal        SetRotation__6CFrameFfff
/* D1B74 001D1A74 00000000 */   nop
/* D1B78 001D1A78 589D848F */  lw         $4, -0x62A8($gp)
/* D1B7C 001D1A7C 4000A527 */  addiu      $5, $sp, 0x40
/* D1B80 001D1A80 B89F040C */  jal        SetPosition__6CFrameFPf
/* D1B84 001D1A84 00000000 */   nop
/* D1B88 001D1A88 803F023C */  lui        $2, (0x3F800000 >> 16)
/* D1B8C 001D1A8C 389482AF */  sw         $2, -0x6BC8($gp)
/* D1B90 001D1A90 3C000010 */  b          .L001D1B84
/* D1B94 001D1A94 00000000 */   nop
.L001D1A98:
/* D1B98 001D1A98 00708044 */  mtc1       $0, $f14
/* D1B9C 001D1A9C 589D848F */  lw         $4, -0x62A8($gp)
/* D1BA0 001D1AA0 64858CC7 */  lwc1       $f12, -0x7A9C($gp)
/* D1BA4 001D1AA4 46630046 */  mov.s      $f13, $f12
/* D1BA8 001D1AA8 70A3040C */  jal        SetRotation__6CFrameFfff
/* D1BAC 001D1AAC 00000000 */   nop
/* D1BB0 001D1AB0 4000A1C7 */  lwc1       $f1, 0x40($sp)
/* D1BB4 001D1AB4 6040023C */  lui        $2, (0x40600000 >> 16)
/* D1BB8 001D1AB8 00008244 */  mtc1       $2, $f0
/* D1BBC 001D1ABC 00000000 */  nop
/* D1BC0 001D1AC0 00080046 */  add.s      $f0, $f1, $f0
/* D1BC4 001D1AC4 4000A0E7 */  swc1       $f0, 0x40($sp)
/* D1BC8 001D1AC8 589D848F */  lw         $4, -0x62A8($gp)
/* D1BCC 001D1ACC 4000A527 */  addiu      $5, $sp, 0x40
/* D1BD0 001D1AD0 B89F040C */  jal        SetPosition__6CFrameFPf
/* D1BD4 001D1AD4 00000000 */   nop
/* D1BD8 001D1AD8 803F023C */  lui        $2, (0x3F800000 >> 16)
/* D1BDC 001D1ADC 389482AF */  sw         $2, -0x6BC8($gp)
/* D1BE0 001D1AE0 28000010 */  b          .L001D1B84
/* D1BE4 001D1AE4 00000000 */   nop
.L001D1AE8:
/* D1BE8 001D1AE8 00708044 */  mtc1       $0, $f14
/* D1BEC 001D1AEC 589D848F */  lw         $4, -0x62A8($gp)
/* D1BF0 001D1AF0 64858CC7 */  lwc1       $f12, -0x7A9C($gp)
/* D1BF4 001D1AF4 44848DC7 */  lwc1       $f13, -0x7BBC($gp)
/* D1BF8 001D1AF8 70A3040C */  jal        SetRotation__6CFrameFfff
/* D1BFC 001D1AFC 00000000 */   nop
/* D1C00 001D1B00 4000A1C7 */  lwc1       $f1, 0x40($sp)
/* D1C04 001D1B04 2040023C */  lui        $2, (0x40200000 >> 16)
/* D1C08 001D1B08 00008244 */  mtc1       $2, $f0
/* D1C0C 001D1B0C 00000000 */  nop
/* D1C10 001D1B10 00080046 */  add.s      $f0, $f1, $f0
/* D1C14 001D1B14 4000A0E7 */  swc1       $f0, 0x40($sp)
/* D1C18 001D1B18 589D848F */  lw         $4, -0x62A8($gp)
/* D1C1C 001D1B1C 4000A527 */  addiu      $5, $sp, 0x40
/* D1C20 001D1B20 B89F040C */  jal        SetPosition__6CFrameFPf
/* D1C24 001D1B24 00000000 */   nop
/* D1C28 001D1B28 803F023C */  lui        $2, (0x3F800000 >> 16)
/* D1C2C 001D1B2C 389482AF */  sw         $2, -0x6BC8($gp)
/* D1C30 001D1B30 14000010 */  b          .L001D1B84
/* D1C34 001D1B34 00000000 */   nop
.L001D1B38:
/* D1C38 001D1B38 00708044 */  mtc1       $0, $f14
/* D1C3C 001D1B3C 00000000 */  nop
/* D1C40 001D1B40 06730046 */  mov.s      $f12, $f14
/* D1C44 001D1B44 589D848F */  lw         $4, -0x62A8($gp)
/* D1C48 001D1B48 58848DC7 */  lwc1       $f13, -0x7BA8($gp)
/* D1C4C 001D1B4C 70A3040C */  jal        SetRotation__6CFrameFfff
/* D1C50 001D1B50 00000000 */   nop
/* D1C54 001D1B54 4000A1C7 */  lwc1       $f1, 0x40($sp)
/* D1C58 001D1B58 6040023C */  lui        $2, (0x40600000 >> 16)
/* D1C5C 001D1B5C 00008244 */  mtc1       $2, $f0
/* D1C60 001D1B60 00000000 */  nop
/* D1C64 001D1B64 00080046 */  add.s      $f0, $f1, $f0
/* D1C68 001D1B68 4000A0E7 */  swc1       $f0, 0x40($sp)
/* D1C6C 001D1B6C 589D848F */  lw         $4, -0x62A8($gp)
/* D1C70 001D1B70 4000A527 */  addiu      $5, $sp, 0x40
/* D1C74 001D1B74 B89F040C */  jal        SetPosition__6CFrameFPf
/* D1C78 001D1B78 00000000 */   nop
/* D1C7C 001D1B7C 0040023C */  lui        $2, (0x40000000 >> 16)
/* D1C80 001D1B80 389482AF */  sw         $2, -0x6BC8($gp)
.L001D1B84:
/* D1C84 001D1B84 589D848F */  lw         $4, -0x62A8($gp)
/* D1C88 001D1B88 14848CC7 */  lwc1       $f12, -0x7BEC($gp)
/* D1C8C 001D1B8C 46630046 */  mov.s      $f13, $f12
/* D1C90 001D1B90 86630046 */  mov.s      $f14, $f12
/* D1C94 001D1B94 D49F040C */  jal        SetScale__6CFrameFfff
/* D1C98 001D1B98 00000000 */   nop
/* D1C9C 001D1B9C 808080C7 */  lwc1       $f0, -0x7F80($gp)
/* D1CA0 001D1BA0 5C9D80E7 */  swc1       $f0, -0x62A4($gp)
/* D1CA4 001D1BA4 EA01023C */  lui        $2, %hi(D_1EA1D20)
/* D1CA8 001D1BA8 201D4424 */  addiu      $4, $2, %lo(D_1EA1D20)
/* D1CAC 001D1BAC 3000A527 */  addiu      $5, $sp, 0x30
/* D1CB0 001D1BB0 38E4040C */  jal        SetPosition__10CCharacterFPf
/* D1CB4 001D1BB4 00000000 */   nop
/* D1CB8 001D1BB8 00688044 */  mtc1       $0, $f13
/* D1CBC 001D1BBC 00000000 */  nop
/* D1CC0 001D1BC0 866B0046 */  mov.s      $f14, $f13
/* D1CC4 001D1BC4 066B0046 */  mov.s      $f12, $f13
/* D1CC8 001D1BC8 EA01023C */  lui        $2, %hi(D_1EA1D20)
/* D1CCC 001D1BCC 201D4424 */  addiu      $4, $2, %lo(D_1EA1D20)
/* D1CD0 001D1BD0 54E4040C */  jal        SetRotation__10CCharacterFfff
/* D1CD4 001D1BD4 00000000 */   nop
/* D1CD8 001D1BD8 2C000224 */  addiu      $2, $0, 0x2C
/* D1CDC 001D1BDC DC01013C */  lui        $at, (0x1DC448C >> 16)
/* D1CE0 001D1BE0 8C4422AC */  sw         $2, (0x1DC448C & 0xFFFF)($at)
/* D1CE4 001D1BE4 2041023C */  lui        $2, (0x41200000 >> 16)
/* D1CE8 001D1BE8 EB01013C */  lui        $at, (0x1EB6018 >> 16)
/* D1CEC 001D1BEC 186022AC */  sw         $2, (0x1EB6018 & 0xFFFF)($at)
/* D1CF0 001D1BF0 EB01013C */  lui        $at, (0x1EB6050 >> 16)
/* D1CF4 001D1BF4 506022AC */  sw         $2, (0x1EB6050 & 0xFFFF)($at)
/* D1CF8 001D1BF8 01000224 */  addiu      $2, $0, 0x1
/* D1CFC 001D1BFC 609D82AF */  sw         $2, -0x62A0($gp)
/* D1D00 001D1C00 DC01023C */  lui        $2, %hi(D_1DC48E0)
/* D1D04 001D1C04 E0484424 */  addiu      $4, $2, %lo(D_1DC48E0)
/* D1D08 001D1C08 DC01023C */  lui        $2, %hi(D_1DC45E0)
/* D1D0C 001D1C0C E0454524 */  addiu      $5, $2, %lo(D_1DC45E0)
/* D1D10 001D1C10 A892040C */  jal        __as__13CCameraFollowFRC13CCameraFollow
/* D1D14 001D1C14 00000000 */   nop
/* D1D18 001D1C18 DC01023C */  lui        $2, %hi(D_1DC48E0)
/* D1D1C 001D1C1C E0484224 */  addiu      $2, $2, %lo(D_1DC48E0)
/* D1D20 001D1C20 A89C82AF */  sw         $2, -0x6358($gp)
/* D1D24 001D1C24 A89C848F */  lw         $4, -0x6358($gp)
/* D1D28 001D1C28 C492040C */  jal        FollowOff__13CCameraFollowFv
/* D1D2C 001D1C2C 00000000 */   nop
/* D1D30 001D1C30 5CFA760C */  jal        func_1DBE970
/* D1D34 001D1C34 00000000 */   nop
/* D1D38 001D1C38 2894828F */  lw         $2, -0x6BD8($gp)
/* D1D3C 001D1C3C 01004224 */  addiu      $2, $2, 0x1
/* D1D40 001D1C40 289482AF */  sw         $2, -0x6BD8($gp)
/* D1D44 001D1C44 D5000010 */  b          .L001D1F9C
/* D1D48 001D1C48 00000000 */   nop
.L001D1C4C:
/* D1D4C 001D1C4C A89C858F */  lw         $5, -0x6358($gp)
/* D1D50 001D1C50 EB01013C */  lui        $at, (0x1EB6030 >> 16)
/* D1D54 001D1C54 3060248C */  lw         $4, (0x1EB6030 & 0xFFFF)($at)
/* D1D58 001D1C58 2A00023C */  lui        $2, %hi(_754)
/* D1D5C 001D1C5C 80C64624 */  addiu      $6, $2, %lo(_754)
/* D1D60 001D1C60 2A00023C */  lui        $2, %hi(_755)
/* D1D64 001D1C64 88C64724 */  addiu      $7, $2, %lo(_755)
/* D1D68 001D1C68 A0DB060C */  jal        setCameraPassData__FP9CFrameVu1P7CCameraPcPc
/* D1D6C 001D1C6C 00000000 */   nop
/* D1D70 001D1C70 EB01013C */  lui        $at, (0x1EB6050 >> 16)
/* D1D74 001D1C74 506021C4 */  lwc1       $f1, (0x1EB6050 & 0xFFFF)($at)
/* D1D78 001D1C78 6041023C */  lui        $2, (0x41600000 >> 16)
/* D1D7C 001D1C7C 00008244 */  mtc1       $2, $f0
/* D1D80 001D1C80 00000000 */  nop
/* D1D84 001D1C84 36080046 */  c.le.s     $f1, $f0
/* D1D88 001D1C88 00000000 */  nop
/* D1D8C 001D1C8C 11000145 */  bc1t       .L001D1CD4
/* D1D90 001D1C90 00000000 */   nop
/* D1D94 001D1C94 7041023C */  lui        $2, (0x41700000 >> 16)
/* D1D98 001D1C98 00008244 */  mtc1       $2, $f0
/* D1D9C 001D1C9C 00000000 */  nop
/* D1DA0 001D1CA0 34080046 */  c.lt.s     $f1, $f0
/* D1DA4 001D1CA4 00000000 */  nop
/* D1DA8 001D1CA8 0A000045 */  bc1f       .L001D1CD4
/* D1DAC 001D1CAC 00000000 */   nop
/* D1DB0 001D1CB0 CE000424 */  addiu      $4, $0, 0xCE
/* D1DB4 001D1CB4 FFFF0524 */  addiu      $5, $0, -0x1
/* D1DB8 001D1CB8 28360070 */  paddub     $6, $0, $0
/* D1DBC 001D1CBC AC69050C */  jal        SndSePlay__Fiii
/* D1DC0 001D1CC0 00000000 */   nop
/* D1DC4 001D1CC4 02000424 */  addiu      $4, $0, 0x2
/* D1DC8 001D1CC8 FFFF0524 */  addiu      $5, $0, -0x1
/* D1DCC 001D1CCC 206E050C */  jal        SndSPSePlay__Fii
/* D1DD0 001D1CD0 00000000 */   nop
.L001D1CD4:
/* D1DD4 001D1CD4 EB01013C */  lui        $at, (0x1EB6050 >> 16)
/* D1DD8 001D1CD8 506023C4 */  lwc1       $f3, (0x1EB6050 & 0xFFFF)($at)
/* D1DDC 001D1CDC 4842023C */  lui        $2, (0x42480000 >> 16)
/* D1DE0 001D1CE0 00108244 */  mtc1       $2, $f2
/* D1DE4 001D1CE4 00000000 */  nop
/* D1DE8 001D1CE8 36180246 */  c.le.s     $f3, $f2
/* D1DEC 001D1CEC 00000000 */  nop
/* D1DF0 001D1CF0 14000145 */  bc1t       .L001D1D44
/* D1DF4 001D1CF4 00000000 */   nop
/* D1DF8 001D1CF8 5C42023C */  lui        $2, (0x425C0000 >> 16)
/* D1DFC 001D1CFC 00008244 */  mtc1       $2, $f0
/* D1E00 001D1D00 00000000 */  nop
/* D1E04 001D1D04 36180046 */  c.le.s     $f3, $f0
/* D1E08 001D1D08 00000000 */  nop
/* D1E0C 001D1D0C 0D000045 */  bc1f       .L001D1D44
/* D1E10 001D1D10 00000000 */   nop
/* D1E14 001D1D14 A040023C */  lui        $2, (0x40A00000 >> 16)
/* D1E18 001D1D18 00088244 */  mtc1       $2, $f1
/* D1E1C 001D1D1C 389480C7 */  lwc1       $f0, -0x6BC8($gp)
/* D1E20 001D1D20 43000146 */  div.s      $f1, $f0, $f1
/* D1E24 001D1D24 01180246 */  sub.s      $f0, $f3, $f2
/* D1E28 001D1D28 020B0046 */  mul.s      $f12, $f1, $f0
/* D1E2C 001D1D2C 5C9D8CE7 */  swc1       $f12, -0x62A4($gp)
/* D1E30 001D1D30 589D848F */  lw         $4, -0x62A8($gp)
/* D1E34 001D1D34 46630046 */  mov.s      $f13, $f12
/* D1E38 001D1D38 86630046 */  mov.s      $f14, $f12
/* D1E3C 001D1D3C D49F040C */  jal        SetScale__6CFrameFfff
/* D1E40 001D1D40 00000000 */   nop
.L001D1D44:
/* D1E44 001D1D44 EB01013C */  lui        $at, (0x1EB6050 >> 16)
/* D1E48 001D1D48 506021C4 */  lwc1       $f1, (0x1EB6050 & 0xFFFF)($at)
/* D1E4C 001D1D4C 9E42023C */  lui        $2, (0x429E0000 >> 16)
/* D1E50 001D1D50 00008244 */  mtc1       $2, $f0
/* D1E54 001D1D54 00000000 */  nop
/* D1E58 001D1D58 34080046 */  c.lt.s     $f1, $f0
/* D1E5C 001D1D5C 00000000 */  nop
/* D1E60 001D1D60 8E000145 */  bc1t       .L001D1F9C
/* D1E64 001D1D64 00000000 */   nop
/* D1E68 001D1D68 02000224 */  addiu      $2, $0, 0x2
/* D1E6C 001D1D6C 609D82AF */  sw         $2, -0x62A0($gp)
/* D1E70 001D1D70 2D000224 */  addiu      $2, $0, 0x2D
/* D1E74 001D1D74 DC01013C */  lui        $at, (0x1DC448C >> 16)
/* D1E78 001D1D78 8C4422AC */  sw         $2, (0x1DC448C & 0xFFFF)($at)
/* D1E7C 001D1D7C 2894828F */  lw         $2, -0x6BD8($gp)
/* D1E80 001D1D80 01004224 */  addiu      $2, $2, 0x1
/* D1E84 001D1D84 289482AF */  sw         $2, -0x6BD8($gp)
/* D1E88 001D1D88 3094848F */  lw         $4, -0x6BD0($gp)
/* D1E8C 001D1D8C FFFF0524 */  addiu      $5, $0, -0x1
/* D1E90 001D1D90 28000624 */  addiu      $6, $0, 0x28
/* D1E94 001D1D94 01000724 */  addiu      $7, $0, 0x1
/* D1E98 001D1D98 A480050C */  jal        ItemGetMes__Fiiii
/* D1E9C 001D1D9C 00000000 */   nop
/* D1EA0 001D1DA0 7E000010 */  b          .L001D1F9C
/* D1EA4 001D1DA4 00000000 */   nop
.L001D1DA8:
/* D1EA8 001D1DA8 A89C858F */  lw         $5, -0x6358($gp)
/* D1EAC 001D1DAC EB01013C */  lui        $at, (0x1EB6030 >> 16)
/* D1EB0 001D1DB0 3060248C */  lw         $4, (0x1EB6030 & 0xFFFF)($at)
/* D1EB4 001D1DB4 2A00023C */  lui        $2, %hi(_754)
/* D1EB8 001D1DB8 80C64624 */  addiu      $6, $2, %lo(_754)
/* D1EBC 001D1DBC 2A00023C */  lui        $2, %hi(_755)
/* D1EC0 001D1DC0 88C64724 */  addiu      $7, $2, %lo(_755)
/* D1EC4 001D1DC4 A0DB060C */  jal        setCameraPassData__FP9CFrameVu1P7CCameraPcPc
/* D1EC8 001D1DC8 00000000 */   nop
/* D1ECC 001D1DCC CC01023C */  lui        $2, %hi(GamePad)
/* D1ED0 001D1DD0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* D1ED4 001D1DD4 60000524 */  addiu      $5, $0, 0x60
/* D1ED8 001D1DD8 1CAE040C */  jal        Down__8CGamePadFi
/* D1EDC 001D1DDC 00000000 */   nop
/* D1EE0 001D1DE0 6E004010 */  beqz       $2, .L001D1F9C
/* D1EE4 001D1DE4 00000000 */   nop
/* D1EE8 001D1DE8 01000224 */  addiu      $2, $0, 0x1
/* D1EEC 001D1DEC DC01013C */  lui        $at, (0x1DC44D4 >> 16)
/* D1EF0 001D1DF0 D44422AC */  sw         $2, (0x1DC44D4 & 0xFFFF)($at)
/* D1EF4 001D1DF4 C701023C */  lui        $2, %hi(TexManager)
/* D1EF8 001D1DF8 70584424 */  addiu      $4, $2, %lo(TexManager)
/* D1EFC 001D1DFC 1C000524 */  addiu      $5, $0, 0x1C
/* D1F00 001D1E00 C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* D1F04 001D1E04 00000000 */   nop
/* D1F08 001D1E08 C701023C */  lui        $2, %hi(TexManager)
/* D1F0C 001D1E0C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* D1F10 001D1E10 98CE040C */  jal        CleanUpTextureList__15CTextureManagerFv
/* D1F14 001D1E14 00000000 */   nop
/* D1F18 001D1E18 789C848F */  lw         $4, -0x6388($gp)
/* D1F1C 001D1E1C 3094858F */  lw         $5, -0x6BD0($gp)
/* D1F20 001D1E20 28360070 */  paddub     $6, $0, $0
/* D1F24 001D1E24 18F8060C */  jal        GetItem__14CDngStatusDataFii
/* D1F28 001D1E28 00000000 */   nop
/* D1F2C 001D1E2C A89C848F */  lw         $4, -0x6358($gp)
/* D1F30 001D1E30 C092040C */  jal        FollowOn__13CCameraFollowFv
/* D1F34 001D1E34 00000000 */   nop
/* D1F38 001D1E38 3000A427 */  addiu      $4, $sp, 0x30
/* D1F3C 001D1E3C EA01023C */  lui        $2, %hi(D_1EA1D30)
/* D1F40 001D1E40 301D4524 */  addiu      $5, $2, %lo(D_1EA1D30)
/* D1F44 001D1E44 0C86040C */  jal        sceVu0CopyVector
/* D1F48 001D1E48 00000000 */   nop
/* D1F4C 001D1E4C 3800A1C7 */  lwc1       $f1, 0x38($sp)
/* D1F50 001D1E50 2041023C */  lui        $2, (0x41200000 >> 16)
/* D1F54 001D1E54 00008244 */  mtc1       $2, $f0
/* D1F58 001D1E58 00000000 */  nop
/* D1F5C 001D1E5C 00080046 */  add.s      $f0, $f1, $f0
/* D1F60 001D1E60 3800A0E7 */  swc1       $f0, 0x38($sp)
/* D1F64 001D1E64 EA01023C */  lui        $2, %hi(D_1EA1D20)
/* D1F68 001D1E68 201D4424 */  addiu      $4, $2, %lo(D_1EA1D20)
/* D1F6C 001D1E6C 3000A527 */  addiu      $5, $sp, 0x30
/* D1F70 001D1E70 38E4040C */  jal        SetPosition__10CCharacterFPf
/* D1F74 001D1E74 00000000 */   nop
/* D1F78 001D1E78 00608044 */  mtc1       $0, $f12
/* D1F7C 001D1E7C 00000000 */  nop
/* D1F80 001D1E80 86630046 */  mov.s      $f14, $f12
/* D1F84 001D1E84 EA01023C */  lui        $2, %hi(D_1EA1D20)
/* D1F88 001D1E88 201D4424 */  addiu      $4, $2, %lo(D_1EA1D20)
/* D1F8C 001D1E8C 68858DC7 */  lwc1       $f13, -0x7A98($gp)
/* D1F90 001D1E90 54E4040C */  jal        SetRotation__10CCharacterFfff
/* D1F94 001D1E94 00000000 */   nop
/* D1F98 001D1E98 DC01013C */  lui        $at, (0x1DC448C >> 16)
/* D1F9C 001D1E9C 8C4420AC */  sw         $0, (0x1DC448C & 0xFFFF)($at)
/* D1FA0 001D1EA0 01000424 */  addiu      $4, $0, 0x1
/* D1FA4 001D1EA4 EA01013C */  lui        $at, (0x1EA7690 >> 16)
/* D1FA8 001D1EA8 907624AC */  sw         $4, (0x1EA7690 & 0xFFFF)($at)
/* D1FAC 001D1EAC 789C828F */  lw         $2, -0x6388($gp)
/* D1FB0 001D1EB0 0100013C */  lui        $at, (0x10000 >> 16)
/* D1FB4 001D1EB4 21084100 */  addu       $at, $2, $at
/* D1FB8 001D1EB8 0C8B20AC */  sw         $0, -0x74F4($at)
/* D1FBC 001D1EBC B004770C */  jal        func_1DC12C0
/* D1FC0 001D1EC0 00000000 */   nop
/* D1FC4 001D1EC4 EC9C80AF */  sw         $0, -0x6314($gp)
/* D1FC8 001D1EC8 F09C80AF */  sw         $0, -0x6310($gp)
/* D1FCC 001D1ECC E49C80AF */  sw         $0, -0x631C($gp)
/* D1FD0 001D1ED0 E89C80AF */  sw         $0, -0x6318($gp)
/* D1FD4 001D1ED4 609D80AF */  sw         $0, -0x62A0($gp)
/* D1FD8 001D1ED8 DC01013C */  lui        $at, (0x1DC451C >> 16)
/* D1FDC 001D1EDC 1C4520AC */  sw         $0, (0x1DC451C & 0xFFFF)($at)
/* D1FE0 001D1EE0 3480050C */  jal        ClearSystemMes__Fv
/* D1FE4 001D1EE4 00000000 */   nop
/* D1FE8 001D1EE8 DC01023C */  lui        $2, %hi(D_1DC45E0)
/* D1FEC 001D1EEC E0454224 */  addiu      $2, $2, %lo(D_1DC45E0)
/* D1FF0 001D1EF0 A89C82AF */  sw         $2, -0x6358($gp)
/* D1FF4 001D1EF4 01001024 */  addiu      $16, $0, 0x1
/* D1FF8 001D1EF8 28000010 */  b          .L001D1F9C
/* D1FFC 001D1EFC 00000000 */   nop
.L001D1F00:
/* D2000 001D1F00 CC01023C */  lui        $2, %hi(GamePad)
/* D2004 001D1F04 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* D2008 001D1F08 60000524 */  addiu      $5, $0, 0x60
/* D200C 001D1F0C 1CAE040C */  jal        Down__8CGamePadFi
/* D2010 001D1F10 00000000 */   nop
/* D2014 001D1F14 21004010 */  beqz       $2, .L001D1F9C
/* D2018 001D1F18 00000000 */   nop
/* D201C 001D1F1C 3480050C */  jal        ClearSystemMes__Fv
/* D2020 001D1F20 00000000 */   nop
/* D2024 001D1F24 01000424 */  addiu      $4, $0, 0x1
/* D2028 001D1F28 EA01013C */  lui        $at, (0x1EA7690 >> 16)
/* D202C 001D1F2C 907624AC */  sw         $4, (0x1EA7690 & 0xFFFF)($at)
/* D2030 001D1F30 789C828F */  lw         $2, -0x6388($gp)
/* D2034 001D1F34 0100013C */  lui        $at, (0x10000 >> 16)
/* D2038 001D1F38 21084100 */  addu       $at, $2, $at
/* D203C 001D1F3C 0C8B20AC */  sw         $0, -0x74F4($at)
/* D2040 001D1F40 DC01013C */  lui        $at, (0x1DC451C >> 16)
/* D2044 001D1F44 1C4520AC */  sw         $0, (0x1DC451C & 0xFFFF)($at)
/* D2048 001D1F48 C89C858F */  lw         $5, -0x6338($gp)
/* D204C 001D1F4C BC9D838F */  lw         $3, -0x6244($gp)
/* D2050 001D1F50 80100300 */  sll        $2, $3, 2
/* D2054 001D1F54 21104300 */  addu       $2, $2, $3
/* D2058 001D1F58 00110200 */  sll        $2, $2, 4
/* D205C 001D1F5C 21104500 */  addu       $2, $2, $5
/* D2060 001D1F60 0100013C */  lui        $at, (0x10000 >> 16)
/* D2064 001D1F64 21084100 */  addu       $at, $2, $at
/* D2068 001D1F68 788D228C */  lw         $2, -0x7288($at)
/* D206C 001D1F6C 80110200 */  sll        $2, $2, 6
/* D2070 001D1F70 21104500 */  addu       $2, $2, $5
/* D2074 001D1F74 0100013C */  lui        $at, (0x10000 >> 16)
/* D2078 001D1F78 21084100 */  addu       $at, $2, $at
/* D207C 001D1F7C 8CB620AC */  sw         $0, -0x4974($at)
/* D2080 001D1F80 B004770C */  jal        func_1DC12C0
/* D2084 001D1F84 00000000 */   nop
/* D2088 001D1F88 EC9C80AF */  sw         $0, -0x6314($gp)
/* D208C 001D1F8C F09C80AF */  sw         $0, -0x6310($gp)
/* D2090 001D1F90 E49C80AF */  sw         $0, -0x631C($gp)
/* D2094 001D1F94 E89C80AF */  sw         $0, -0x6318($gp)
/* D2098 001D1F98 01001024 */  addiu      $16, $0, 0x1
.L001D1F9C:
/* D209C 001D1F9C 28160072 */  paddub     $2, $16, $0
/* D20A0 001D1FA0 2000BF7B */  lq         $31, 0x20($sp)
/* D20A4 001D1FA4 1000B17B */  lq         $17, 0x10($sp)
/* D20A8 001D1FA8 0000B07B */  lq         $16, 0x0($sp)
/* D20AC 001D1FAC 5000BD27 */  addiu      $sp, $sp, 0x50
/* D20B0 001D1FB0 0800E003 */  jr         $31
/* D20B4 001D1FB4 00000000 */   nop
/* D20B8 001D1FB8 00000000 */  nop
/* D20BC 001D1FBC 00000000 */  nop
