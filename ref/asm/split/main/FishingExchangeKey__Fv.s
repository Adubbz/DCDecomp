.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FishingExchangeKey__Fv
/* 0F1980 001F1880 70FFBD27 */  addiu       $29, $29, -0x90
/* 0F1984 001F1884 8000BF7F */  sq          $31, 0x80($29)
/* 0F1988 001F1888 7000B77F */  sq          $23, 0x70($29)
/* 0F198C 001F188C 6000B67F */  sq          $22, 0x60($29)
/* 0F1990 001F1890 5000B57F */  sq          $21, 0x50($29)
/* 0F1994 001F1894 4000B47F */  sq          $20, 0x40($29)
/* 0F1998 001F1898 3000B37F */  sq          $19, 0x30($29)
/* 0F199C 001F189C 2000B27F */  sq          $18, 0x20($29)
/* 0F19A0 001F18A0 1000B17F */  sq          $17, 0x10($29)
/* 0F19A4 001F18A4 0000B07F */  sq          $16, 0x0($29)
/* 0F19A8 001F18A8 28860070 */  paddub      $16, $0, $0
/* 0F19AC 001F18AC 38FB040C */  jal         ReadBG__Fv
/* 0F19B0 001F18B0 00000000 */   nop
/* 0F19B4 001F18B4 E8C4070C */  jal         AlreadyGetMardanWeapon__Fv
/* 0F19B8 001F18B8 00000000 */   nop
/* 0F19BC 001F18BC 288E4070 */  paddub      $17, $2, $0
/* 0F19C0 001F18C0 1C8D848F */  lw          $4, -0x72E4($28)
/* 0F19C4 001F18C4 7860050C */  jal         GetDngStatus__9CSaveDataFv
/* 0F19C8 001F18C8 00000000 */   nop
/* 0F19CC 001F18CC 05004280 */  lb          $2, 0x5($2)
/* 0F19D0 001F18D0 0200401C */  bgtz        $2, .L001F18DC
/* 0F19D4 001F18D4 00000000 */   nop
/* 0F19D8 001F18D8 01000224 */  addiu       $2, $0, 0x1
.L001F18DC:
/* 0F19DC 001F18DC 19005224 */  addiu       $18, $2, 0x19
/* 0F19E0 001F18E0 16005324 */  addiu       $19, $2, 0x16
/* 0F19E4 001F18E4 01000224 */  addiu       $2, $0, 0x1
/* 0F19E8 001F18E8 03002216 */  bne         $17, $2, .L001F18F8
/* 0F19EC 001F18EC 00000000 */   nop
/* 0F19F0 001F18F0 01005226 */  addiu       $18, $18, 0x1
/* 0F19F4 001F18F4 01007326 */  addiu       $19, $19, 0x1
.L001F18F8:
/* 0F19F8 001F18F8 D901013C */  lui         $1, %hi(FishMenu + 0x16)
/* 0F19FC 001F18FC A6032484 */  lh          $4, %lo(FishMenu + 0x16)($1)
/* 0F1A00 001F1900 05000224 */  addiu       $2, $0, 0x5
/* 0F1A04 001F1904 94028210 */  beq         $4, $2, .L001F2358
/* 0F1A08 001F1908 00000000 */   nop
/* 0F1A0C 001F190C 04000224 */  addiu       $2, $0, 0x4
/* 0F1A10 001F1910 C9018210 */  beq         $4, $2, .L001F2038
/* 0F1A14 001F1914 00000000 */   nop
/* 0F1A18 001F1918 03000224 */  addiu       $2, $0, 0x3
/* 0F1A1C 001F191C 2A008210 */  beq         $4, $2, .L001F19C8
/* 0F1A20 001F1920 00000000 */   nop
/* 0F1A24 001F1924 01000324 */  addiu       $3, $0, 0x1
/* 0F1A28 001F1928 1A008310 */  beq         $4, $3, .L001F1994
/* 0F1A2C 001F192C 00000000 */   nop
/* 0F1A30 001F1930 03008010 */  beqz        $4, .L001F1940
/* 0F1A34 001F1934 00000000 */   nop
/* 0F1A38 001F1938 9F020010 */  b           .L001F23B8
/* 0F1A3C 001F193C 00000000 */   nop
.L001F1940:
/* 0F1A40 001F1940 74C5070C */  jal         FishMenuTextureLoad__Fv
/* 0F1A44 001F1944 00000000 */   nop
/* 0F1A48 001F1948 D901013C */  lui         $1, %hi(FishMenu + 0x20)
/* 0F1A4C 001F194C B003228C */  lw          $2, %lo(FishMenu + 0x20)($1)
/* 0F1A50 001F1950 01004224 */  addiu       $2, $2, 0x1
/* 0F1A54 001F1954 D901013C */  lui         $1, %hi(FishMenu + 0x20)
/* 0F1A58 001F1958 B00322AC */  sw          $2, %lo(FishMenu + 0x20)($1)
/* 0F1A5C 001F195C D901013C */  lui         $1, %hi(FishMenu + 0x4)
/* 0F1A60 001F1960 94032284 */  lh          $2, %lo(FishMenu + 0x4)($1)
/* 0F1A64 001F1964 94024010 */  beqz        $2, .L001F23B8
/* 0F1A68 001F1968 00000000 */   nop
/* 0F1A6C 001F196C D901013C */  lui         $1, %hi(FishMenu + 0x20)
/* 0F1A70 001F1970 B003228C */  lw          $2, %lo(FishMenu + 0x20)($1)
/* 0F1A74 001F1974 21004128 */  slti        $1, $2, 0x21
/* 0F1A78 001F1978 8F022014 */  bnez        $1, .L001F23B8
/* 0F1A7C 001F197C 00000000 */   nop
/* 0F1A80 001F1980 03000224 */  addiu       $2, $0, 0x3
/* 0F1A84 001F1984 D901013C */  lui         $1, %hi(FishMenu + 0x16)
/* 0F1A88 001F1988 A60322A4 */  sh          $2, %lo(FishMenu + 0x16)($1)
/* 0F1A8C 001F198C 8A020010 */  b           .L001F23B8
/* 0F1A90 001F1990 00000000 */   nop
.L001F1994:
/* 0F1A94 001F1994 D901013C */  lui         $1, %hi(FishMenu + 0x20)
/* 0F1A98 001F1998 B003228C */  lw          $2, %lo(FishMenu + 0x20)($1)
/* 0F1A9C 001F199C 01004224 */  addiu       $2, $2, 0x1
/* 0F1AA0 001F19A0 D901013C */  lui         $1, %hi(FishMenu + 0x20)
/* 0F1AA4 001F19A4 B00322AC */  sw          $2, %lo(FishMenu + 0x20)($1)
/* 0F1AA8 001F19A8 D901013C */  lui         $1, %hi(FishMenu + 0x20)
/* 0F1AAC 001F19AC B003228C */  lw          $2, %lo(FishMenu + 0x20)($1)
/* 0F1AB0 001F19B0 21004128 */  slti        $1, $2, 0x21
/* 0F1AB4 001F19B4 80022014 */  bnez        $1, .L001F23B8
/* 0F1AB8 001F19B8 00000000 */   nop
/* 0F1ABC 001F19BC 28866070 */  paddub      $16, $3, $0
/* 0F1AC0 001F19C0 7D020010 */  b           .L001F23B8
/* 0F1AC4 001F19C4 00000000 */   nop
.L001F19C8:
/* 0F1AC8 001F19C8 D901013C */  lui         $1, %hi(FishMenu + 0x14)
/* 0F1ACC 001F19CC A4033484 */  lh          $20, %lo(FishMenu + 0x14)($1)
/* 0F1AD0 001F19D0 D901013C */  lui         $1, %hi(FishMenu + 0x18)
/* 0F1AD4 001F19D4 A8033784 */  lh          $23, %lo(FishMenu + 0x18)($1)
/* 0F1AD8 001F19D8 CC01023C */  lui         $2, %hi(GamePad)
/* 0F1ADC 001F19DC 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0F1AE0 001F19E0 0A200524 */  addiu       $5, $0, 0x200A
/* 0F1AE4 001F19E4 1CAE040C */  jal         Down__8CGamePadFi
/* 0F1AE8 001F19E8 00000000 */   nop
/* 0F1AEC 001F19EC 0B004010 */  beqz        $2, .L001F1A1C
/* 0F1AF0 001F19F0 00000000 */   nop
/* 0F1AF4 001F19F4 D901013C */  lui         $1, %hi(FishMenu + 0x18)
/* 0F1AF8 001F19F8 A8032284 */  lh          $2, %lo(FishMenu + 0x18)($1)
/* 0F1AFC 001F19FC 05004224 */  addiu       $2, $2, 0x5
/* 0F1B00 001F1A00 D901013C */  lui         $1, %hi(FishMenu + 0x18)
/* 0F1B04 001F1A04 A80322A4 */  sh          $2, %lo(FishMenu + 0x18)($1)
/* 0F1B08 001F1A08 D901013C */  lui         $1, %hi(FishMenu + 0x14)
/* 0F1B0C 001F1A0C A4032284 */  lh          $2, %lo(FishMenu + 0x14)($1)
/* 0F1B10 001F1A10 05004224 */  addiu       $2, $2, 0x5
/* 0F1B14 001F1A14 D901013C */  lui         $1, %hi(FishMenu + 0x14)
/* 0F1B18 001F1A18 A40322A4 */  sh          $2, %lo(FishMenu + 0x14)($1)
.L001F1A1C:
/* 0F1B1C 001F1A1C CC01023C */  lui         $2, %hi(GamePad)
/* 0F1B20 001F1A20 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0F1B24 001F1A24 05800534 */  ori         $5, $0, 0x8005
/* 0F1B28 001F1A28 1CAE040C */  jal         Down__8CGamePadFi
/* 0F1B2C 001F1A2C 00000000 */   nop
/* 0F1B30 001F1A30 17004010 */  beqz        $2, .L001F1A90
/* 0F1B34 001F1A34 00000000 */   nop
/* 0F1B38 001F1A38 D901013C */  lui         $1, %hi(FishMenu + 0x18)
/* 0F1B3C 001F1A3C A8032284 */  lh          $2, %lo(FishMenu + 0x18)($1)
/* 0F1B40 001F1A40 FBFF4224 */  addiu       $2, $2, -0x5
/* 0F1B44 001F1A44 D901013C */  lui         $1, %hi(FishMenu + 0x18)
/* 0F1B48 001F1A48 A80322A4 */  sh          $2, %lo(FishMenu + 0x18)($1)
/* 0F1B4C 001F1A4C D901013C */  lui         $1, %hi(FishMenu + 0x14)
/* 0F1B50 001F1A50 A4032284 */  lh          $2, %lo(FishMenu + 0x14)($1)
/* 0F1B54 001F1A54 FBFF4224 */  addiu       $2, $2, -0x5
/* 0F1B58 001F1A58 D901013C */  lui         $1, %hi(FishMenu + 0x14)
/* 0F1B5C 001F1A5C A40322A4 */  sh          $2, %lo(FishMenu + 0x14)($1)
/* 0F1B60 001F1A60 D901013C */  lui         $1, %hi(FishMenu + 0x14)
/* 0F1B64 001F1A64 A4032284 */  lh          $2, %lo(FishMenu + 0x14)($1)
/* 0F1B68 001F1A68 05004004 */  bltz        $2, .L001F1A80
/* 0F1B6C 001F1A6C 00000000 */   nop
/* 0F1B70 001F1A70 D901013C */  lui         $1, %hi(FishMenu + 0x18)
/* 0F1B74 001F1A74 A8032284 */  lh          $2, %lo(FishMenu + 0x18)($1)
/* 0F1B78 001F1A78 05004104 */  bgez        $2, .L001F1A90
/* 0F1B7C 001F1A7C 00000000 */   nop
.L001F1A80:
/* 0F1B80 001F1A80 D901013C */  lui         $1, %hi(FishMenu + 0x14)
/* 0F1B84 001F1A84 A40320A4 */  sh          $0, %lo(FishMenu + 0x14)($1)
/* 0F1B88 001F1A88 D901013C */  lui         $1, %hi(FishMenu + 0x18)
/* 0F1B8C 001F1A8C A80320A4 */  sh          $0, %lo(FishMenu + 0x18)($1)
.L001F1A90:
/* 0F1B90 001F1A90 CC01023C */  lui         $2, %hi(GamePad)
/* 0F1B94 001F1A94 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0F1B98 001F1A98 00100524 */  addiu       $5, $0, 0x1000
/* 0F1B9C 001F1A9C 1CAE040C */  jal         Down__8CGamePadFi
/* 0F1BA0 001F1AA0 00000000 */   nop
/* 0F1BA4 001F1AA4 1E004010 */  beqz        $2, .L001F1B20
/* 0F1BA8 001F1AA8 00000000 */   nop
/* 0F1BAC 001F1AAC D901013C */  lui         $1, %hi(FishMenu + 0x14)
/* 0F1BB0 001F1AB0 A4032284 */  lh          $2, %lo(FishMenu + 0x14)($1)
/* 0F1BB4 001F1AB4 FFFF4224 */  addiu       $2, $2, -0x1
/* 0F1BB8 001F1AB8 D901013C */  lui         $1, %hi(FishMenu + 0x14)
/* 0F1BBC 001F1ABC A40322A4 */  sh          $2, %lo(FishMenu + 0x14)($1)
/* 0F1BC0 001F1AC0 D901013C */  lui         $1, %hi(FishMenu + 0x14)
/* 0F1BC4 001F1AC4 A4032284 */  lh          $2, %lo(FishMenu + 0x14)($1)
/* 0F1BC8 001F1AC8 03004104 */  bgez        $2, .L001F1AD8
/* 0F1BCC 001F1ACC 00000000 */   nop
/* 0F1BD0 001F1AD0 D901013C */  lui         $1, %hi(FishMenu + 0x14)
/* 0F1BD4 001F1AD4 A40320A4 */  sh          $0, %lo(FishMenu + 0x14)($1)
.L001F1AD8:
/* 0F1BD8 001F1AD8 D901013C */  lui         $1, %hi(FishMenu + 0x14)
/* 0F1BDC 001F1ADC A4032384 */  lh          $3, %lo(FishMenu + 0x14)($1)
/* 0F1BE0 001F1AE0 D901013C */  lui         $1, %hi(FishMenu + 0x18)
/* 0F1BE4 001F1AE4 A8032284 */  lh          $2, %lo(FishMenu + 0x18)($1)
/* 0F1BE8 001F1AE8 2A086200 */  slt         $1, $3, $2
/* 0F1BEC 001F1AEC 04002010 */  beqz        $1, .L001F1B00
/* 0F1BF0 001F1AF0 00000000 */   nop
/* 0F1BF4 001F1AF4 FFFF4224 */  addiu       $2, $2, -0x1
/* 0F1BF8 001F1AF8 D901013C */  lui         $1, %hi(FishMenu + 0x18)
/* 0F1BFC 001F1AFC A80322A4 */  sh          $2, %lo(FishMenu + 0x18)($1)
.L001F1B00:
/* 0F1C00 001F1B00 D901013C */  lui         $1, %hi(FishMenu + 0x18)
/* 0F1C04 001F1B04 A8032284 */  lh          $2, %lo(FishMenu + 0x18)($1)
/* 0F1C08 001F1B08 05004104 */  bgez        $2, .L001F1B20
/* 0F1C0C 001F1B0C 00000000 */   nop
/* 0F1C10 001F1B10 D901013C */  lui         $1, %hi(FishMenu + 0x18)
/* 0F1C14 001F1B14 A80320A4 */  sh          $0, %lo(FishMenu + 0x18)($1)
/* 0F1C18 001F1B18 D901013C */  lui         $1, %hi(FishMenu + 0x14)
/* 0F1C1C 001F1B1C A40320A4 */  sh          $0, %lo(FishMenu + 0x14)($1)
.L001F1B20:
/* 0F1C20 001F1B20 CC01023C */  lui         $2, %hi(GamePad)
/* 0F1C24 001F1B24 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0F1C28 001F1B28 00400524 */  addiu       $5, $0, 0x4000
/* 0F1C2C 001F1B2C 1CAE040C */  jal         Down__8CGamePadFi
/* 0F1C30 001F1B30 00000000 */   nop
/* 0F1C34 001F1B34 20004010 */  beqz        $2, .L001F1BB8
/* 0F1C38 001F1B38 00000000 */   nop
/* 0F1C3C 001F1B3C D901013C */  lui         $1, %hi(FishMenu + 0x14)
/* 0F1C40 001F1B40 A4032284 */  lh          $2, %lo(FishMenu + 0x14)($1)
/* 0F1C44 001F1B44 01004224 */  addiu       $2, $2, 0x1
/* 0F1C48 001F1B48 D901013C */  lui         $1, %hi(FishMenu + 0x14)
/* 0F1C4C 001F1B4C A40322A4 */  sh          $2, %lo(FishMenu + 0x14)($1)
/* 0F1C50 001F1B50 D901013C */  lui         $1, %hi(FishMenu + 0x14)
/* 0F1C54 001F1B54 A4032284 */  lh          $2, %lo(FishMenu + 0x14)($1)
/* 0F1C58 001F1B58 2A084202 */  slt         $1, $18, $2
/* 0F1C5C 001F1B5C 03002010 */  beqz        $1, .L001F1B6C
/* 0F1C60 001F1B60 00000000 */   nop
/* 0F1C64 001F1B64 D901013C */  lui         $1, %hi(FishMenu + 0x14)
/* 0F1C68 001F1B68 A40332A4 */  sh          $18, %lo(FishMenu + 0x14)($1)
.L001F1B6C:
/* 0F1C6C 001F1B6C D901013C */  lui         $1, %hi(FishMenu + 0x18)
/* 0F1C70 001F1B70 A8032384 */  lh          $3, %lo(FishMenu + 0x18)($1)
/* 0F1C74 001F1B74 D901013C */  lui         $1, %hi(FishMenu + 0x14)
/* 0F1C78 001F1B78 A4032284 */  lh          $2, %lo(FishMenu + 0x14)($1)
/* 0F1C7C 001F1B7C FCFF4224 */  addiu       $2, $2, -0x4
/* 0F1C80 001F1B80 2A086200 */  slt         $1, $3, $2
/* 0F1C84 001F1B84 0C002010 */  beqz        $1, .L001F1BB8
/* 0F1C88 001F1B88 00000000 */   nop
/* 0F1C8C 001F1B8C 01006224 */  addiu       $2, $3, 0x1
/* 0F1C90 001F1B90 D901013C */  lui         $1, %hi(FishMenu + 0x18)
/* 0F1C94 001F1B94 A80322A4 */  sh          $2, %lo(FishMenu + 0x18)($1)
/* 0F1C98 001F1B98 D901013C */  lui         $1, %hi(FishMenu + 0x18)
/* 0F1C9C 001F1B9C A8032284 */  lh          $2, %lo(FishMenu + 0x18)($1)
/* 0F1CA0 001F1BA0 2A086202 */  slt         $1, $19, $2
/* 0F1CA4 001F1BA4 04002010 */  beqz        $1, .L001F1BB8
/* 0F1CA8 001F1BA8 00000000 */   nop
/* 0F1CAC 001F1BAC FFFF6226 */  addiu       $2, $19, -0x1
/* 0F1CB0 001F1BB0 D901013C */  lui         $1, %hi(FishMenu + 0x18)
/* 0F1CB4 001F1BB4 A80322A4 */  sh          $2, %lo(FishMenu + 0x18)($1)
.L001F1BB8:
/* 0F1CB8 001F1BB8 D901013C */  lui         $1, %hi(FishMenu + 0x14)
/* 0F1CBC 001F1BBC A4032284 */  lh          $2, %lo(FishMenu + 0x14)($1)
/* 0F1CC0 001F1BC0 2A084202 */  slt         $1, $18, $2
/* 0F1CC4 001F1BC4 03002010 */  beqz        $1, .L001F1BD4
/* 0F1CC8 001F1BC8 00000000 */   nop
/* 0F1CCC 001F1BCC D901013C */  lui         $1, %hi(FishMenu + 0x14)
/* 0F1CD0 001F1BD0 A40332A4 */  sh          $18, %lo(FishMenu + 0x14)($1)
.L001F1BD4:
/* 0F1CD4 001F1BD4 D901013C */  lui         $1, %hi(FishMenu + 0x18)
/* 0F1CD8 001F1BD8 A8032284 */  lh          $2, %lo(FishMenu + 0x18)($1)
/* 0F1CDC 001F1BDC 2A086202 */  slt         $1, $19, $2
/* 0F1CE0 001F1BE0 04002010 */  beqz        $1, .L001F1BF4
/* 0F1CE4 001F1BE4 00000000 */   nop
/* 0F1CE8 001F1BE8 FFFF6226 */  addiu       $2, $19, -0x1
/* 0F1CEC 001F1BEC D901013C */  lui         $1, %hi(FishMenu + 0x18)
/* 0F1CF0 001F1BF0 A80322A4 */  sh          $2, %lo(FishMenu + 0x18)($1)
.L001F1BF4:
/* 0F1CF4 001F1BF4 D901013C */  lui         $1, %hi(FishMenu + 0x14)
/* 0F1CF8 001F1BF8 A4032284 */  lh          $2, %lo(FishMenu + 0x14)($1)
/* 0F1CFC 001F1BFC 04008212 */  beq         $20, $2, .L001F1C10
/* 0F1D00 001F1C00 00000000 */   nop
/* 0F1D04 001F1C04 28260070 */  paddub      $4, $0, $0
/* 0F1D08 001F1C08 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0F1D0C 001F1C0C 00000000 */   nop
.L001F1C10:
/* 0F1D10 001F1C10 D901013C */  lui         $1, %hi(FishMenu + 0x14)
/* 0F1D14 001F1C14 A4032484 */  lh          $4, %lo(FishMenu + 0x14)($1)
/* 0F1D18 001F1C18 94C4070C */  jal         GetExchangeItemList__Fi
/* 0F1D1C 001F1C1C 00000000 */   nop
/* 0F1D20 001F1C20 289E4070 */  paddub      $19, $2, $0
/* 0F1D24 001F1C24 01000224 */  addiu       $2, $0, 0x1
/* 0F1D28 001F1C28 09002216 */  bne         $17, $2, .L001F1C50
/* 0F1D2C 001F1C2C 00000000 */   nop
/* 0F1D30 001F1C30 D901013C */  lui         $1, %hi(FishMenu + 0x14)
/* 0F1D34 001F1C34 A4032284 */  lh          $2, %lo(FishMenu + 0x14)($1)
/* 0F1D38 001F1C38 05005214 */  bne         $2, $18, .L001F1C50
/* 0F1D3C 001F1C3C 00000000 */   nop
/* 0F1D40 001F1C40 20000424 */  addiu       $4, $0, 0x20
/* 0F1D44 001F1C44 94C4070C */  jal         GetExchangeItemList__Fi
/* 0F1D48 001F1C48 00000000 */   nop
/* 0F1D4C 001F1C4C 289E4070 */  paddub      $19, $2, $0
.L001F1C50:
/* 0F1D50 001F1C50 10006012 */  beqz        $19, .L001F1C94
/* 0F1D54 001F1C54 00000000 */   nop
/* 0F1D58 001F1C58 00006486 */  lh          $4, 0x0($19)
/* 0F1D5C 001F1C5C 7443070C */  jal         GetCommonItemInfo__Fi
/* 0F1D60 001F1C60 00000000 */   nop
/* 0F1D64 001F1C64 0B004010 */  beqz        $2, .L001F1C94
/* 0F1D68 001F1C68 00000000 */   nop
/* 0F1D6C 001F1C6C 06004284 */  lh          $2, 0x6($2)
/* 0F1D70 001F1C70 F4014524 */  addiu       $5, $2, 0x1F4
/* 0F1D74 001F1C74 DA01013C */  lui         $1, %hi(CommonMenuMes2 + 0x16BC)
/* 0F1D78 001F1C78 0C3A228C */  lw          $2, %lo(CommonMenuMes2 + 0x16BC)($1)
/* 0F1D7C 001F1C7C 05004510 */  beq         $2, $5, .L001F1C94
/* 0F1D80 001F1C80 00000000 */   nop
/* 0F1D84 001F1C84 DA01023C */  lui         $2, %hi(CommonMenuMes2)
/* 0F1D88 001F1C88 50234424 */  addiu       $4, $2, %lo(CommonMenuMes2)
/* 0F1D8C 001F1C8C 5441050C */  jal         MakeMesWin__6ClsMesFi
/* 0F1D90 001F1C90 00000000 */   nop
.L001F1C94:
/* 0F1D94 001F1C94 CC01023C */  lui         $2, %hi(GamePad)
/* 0F1D98 001F1C98 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0F1D9C 001F1C9C 40000524 */  addiu       $5, $0, 0x40
/* 0F1DA0 001F1CA0 1CAE040C */  jal         Down__8CGamePadFi
/* 0F1DA4 001F1CA4 00000000 */   nop
/* 0F1DA8 001F1CA8 97004010 */  beqz        $2, .L001F1F08
/* 0F1DAC 001F1CAC 00000000 */   nop
/* 0F1DB0 001F1CB0 1C8D848F */  lw          $4, -0x72E4($28)
/* 0F1DB4 001F1CB4 7860050C */  jal         GetDngStatus__9CSaveDataFv
/* 0F1DB8 001F1CB8 00000000 */   nop
/* 0F1DBC 001F1CBC 28A64070 */  paddub      $20, $2, $0
/* 0F1DC0 001F1CC0 28AE0070 */  paddub      $21, $0, $0
/* 0F1DC4 001F1CC4 00006486 */  lh          $4, 0x0($19)
/* 0F1DC8 001F1CC8 88C7080C */  jal         WhatIsKindofItem__Fi
/* 0F1DCC 001F1CCC 00000000 */   nop
/* 0F1DD0 001F1CD0 28B64070 */  paddub      $22, $2, $0
/* 0F1DD4 001F1CD4 28260070 */  paddub      $4, $0, $0
/* 0F1DD8 001F1CD8 02000224 */  addiu       $2, $0, 0x2
/* 0F1DDC 001F1CDC 4700C212 */  beq         $22, $2, .L001F1DFC
/* 0F1DE0 001F1CE0 00000000 */   nop
/* 0F1DE4 001F1CE4 01000224 */  addiu       $2, $0, 0x1
/* 0F1DE8 001F1CE8 2600C212 */  beq         $22, $2, .L001F1D84
/* 0F1DEC 001F1CEC 00000000 */   nop
/* 0F1DF0 001F1CF0 0300C012 */  beqz        $22, .L001F1D00
/* 0F1DF4 001F1CF4 00000000 */   nop
/* 0F1DF8 001F1CF8 54000010 */  b           .L001F1E4C
/* 0F1DFC 001F1CFC 00000000 */   nop
.L001F1D00:
/* 0F1E00 001F1D00 60438626 */  addiu       $6, $20, 0x4360
/* 0F1E04 001F1D04 281E0070 */  paddub      $3, $0, $0
/* 0F1E08 001F1D08 06000010 */  b           .L001F1D24
/* 0F1E0C 001F1D0C 00000000 */   nop
.L001F1D10:
/* 0F1E10 001F1D10 40100300 */  sll         $2, $3, 1
/* 0F1E14 001F1D14 21104600 */  addu        $2, $2, $6
/* 0F1E18 001F1D18 08004284 */  lh          $2, 0x8($2)
/* 0F1E1C 001F1D1C 21208200 */  addu        $4, $4, $2
/* 0F1E20 001F1D20 01006324 */  addiu       $3, $3, 0x1
.L001F1D24:
/* 0F1E24 001F1D24 03006228 */  slti        $2, $3, 0x3
/* 0F1E28 001F1D28 F9FF4014 */  bnez        $2, .L001F1D10
/* 0F1E2C 001F1D2C 00000000 */   nop
/* 0F1E30 001F1D30 282E0070 */  paddub      $5, $0, $0
/* 0F1E34 001F1D34 09000010 */  b           .L001F1D5C
/* 0F1E38 001F1D38 00000000 */   nop
.L001F1D3C:
/* 0F1E3C 001F1D3C 40100500 */  sll         $2, $5, 1
/* 0F1E40 001F1D40 21104600 */  addu        $2, $2, $6
/* 0F1E44 001F1D44 0E004284 */  lh          $2, 0xE($2)
/* 0F1E48 001F1D48 84004228 */  slti        $2, $2, 0x84
/* 0F1E4C 001F1D4C 02004014 */  bnez        $2, .L001F1D58
/* 0F1E50 001F1D50 00000000 */   nop
/* 0F1E54 001F1D54 01008424 */  addiu       $4, $4, 0x1
.L001F1D58:
/* 0F1E58 001F1D58 0100A524 */  addiu       $5, $5, 0x1
.L001F1D5C:
/* 0F1E5C 001F1D5C 0000C380 */  lb          $3, 0x0($6)
/* 0F1E60 001F1D60 2A10A300 */  slt         $2, $5, $3
/* 0F1E64 001F1D64 F5FF4014 */  bnez        $2, .L001F1D3C
/* 0F1E68 001F1D68 00000000 */   nop
/* 0F1E6C 001F1D6C 2A108300 */  slt         $2, $4, $3
/* 0F1E70 001F1D70 36004014 */  bnez        $2, .L001F1E4C
/* 0F1E74 001F1D74 00000000 */   nop
/* 0F1E78 001F1D78 01001524 */  addiu       $21, $0, 0x1
/* 0F1E7C 001F1D7C 33000010 */  b           .L001F1E4C
/* 0F1E80 001F1D80 00000000 */   nop
.L001F1D84:
/* 0F1E84 001F1D84 00006486 */  lh          $4, 0x0($19)
/* 0F1E88 001F1D88 A4C7080C */  jal         WhoIsWeaponEquip__Fi
/* 0F1E8C 001F1D8C 00000000 */   nop
/* 0F1E90 001F1D90 28260070 */  paddub      $4, $0, $0
/* 0F1E94 001F1D94 A80A0324 */  addiu       $3, $0, 0xAA8
/* 0F1E98 001F1D98 18104300 */  mult        $2, $2, $3
/* 0F1E9C 001F1D9C 21108202 */  addu        $2, $20, $2
/* 0F1EA0 001F1DA0 0C454524 */  addiu       $5, $2, 0x450C
/* 0F1EA4 001F1DA4 281E0070 */  paddub      $3, $0, $0
/* 0F1EA8 001F1DA8 0B000010 */  b           .L001F1DD8
/* 0F1EAC 001F1DAC 00000000 */   nop
.L001F1DB0:
/* 0F1EB0 001F1DB0 40110300 */  sll         $2, $3, 5
/* 0F1EB4 001F1DB4 23104300 */  subu        $2, $2, $3
/* 0F1EB8 001F1DB8 C0100200 */  sll         $2, $2, 3
/* 0F1EBC 001F1DBC 2110A200 */  addu        $2, $5, $2
/* 0F1EC0 001F1DC0 00004284 */  lh          $2, 0x0($2)
/* 0F1EC4 001F1DC4 01014228 */  slti        $2, $2, 0x101
/* 0F1EC8 001F1DC8 02004014 */  bnez        $2, .L001F1DD4
/* 0F1ECC 001F1DCC 00000000 */   nop
/* 0F1ED0 001F1DD0 01008424 */  addiu       $4, $4, 0x1
.L001F1DD4:
/* 0F1ED4 001F1DD4 01006324 */  addiu       $3, $3, 0x1
.L001F1DD8:
/* 0F1ED8 001F1DD8 0A006228 */  slti        $2, $3, 0xA
/* 0F1EDC 001F1DDC F4FF4014 */  bnez        $2, .L001F1DB0
/* 0F1EE0 001F1DE0 00000000 */   nop
/* 0F1EE4 001F1DE4 0A008228 */  slti        $2, $4, 0xA
/* 0F1EE8 001F1DE8 18004014 */  bnez        $2, .L001F1E4C
/* 0F1EEC 001F1DEC 00000000 */   nop
/* 0F1EF0 001F1DF0 01001524 */  addiu       $21, $0, 0x1
/* 0F1EF4 001F1DF4 15000010 */  b           .L001F1E4C
/* 0F1EF8 001F1DF8 00000000 */   nop
.L001F1DFC:
/* 0F1EFC 001F1DFC 04058526 */  addiu       $5, $20, 0x504
/* 0F1F00 001F1E00 F87FA524 */  addiu       $5, $5, 0x7FF8
/* 0F1F04 001F1E04 281E0070 */  paddub      $3, $0, $0
/* 0F1F08 001F1E08 09000010 */  b           .L001F1E30
/* 0F1F0C 001F1E0C 00000000 */   nop
.L001F1E10:
/* 0F1F10 001F1E10 40110400 */  sll         $2, $4, 5
/* 0F1F14 001F1E14 2110A200 */  addu        $2, $5, $2
/* 0F1F18 001F1E18 00004284 */  lh          $2, 0x0($2)
/* 0F1F1C 001F1E1C 51004228 */  slti        $2, $2, 0x51
/* 0F1F20 001F1E20 02004014 */  bnez        $2, .L001F1E2C
/* 0F1F24 001F1E24 00000000 */   nop
/* 0F1F28 001F1E28 01006324 */  addiu       $3, $3, 0x1
.L001F1E2C:
/* 0F1F2C 001F1E2C 01008424 */  addiu       $4, $4, 0x1
.L001F1E30:
/* 0F1F30 001F1E30 28008228 */  slti        $2, $4, 0x28
/* 0F1F34 001F1E34 F6FF4014 */  bnez        $2, .L001F1E10
/* 0F1F38 001F1E38 00000000 */   nop
/* 0F1F3C 001F1E3C 28006228 */  slti        $2, $3, 0x28
/* 0F1F40 001F1E40 02004014 */  bnez        $2, .L001F1E4C
/* 0F1F44 001F1E44 00000000 */   nop
/* 0F1F48 001F1E48 01001524 */  addiu       $21, $0, 0x1
.L001F1E4C:
/* 0F1F4C 001F1E4C 02006386 */  lh          $3, 0x2($19)
/* 0F1F50 001F1E50 D901013C */  lui         $1, %hi(FishMenu + 0x8)
/* 0F1F54 001F1E54 9803228C */  lw          $2, %lo(FishMenu + 0x8)($1)
/* 0F1F58 001F1E58 2A084300 */  slt         $1, $2, $3
/* 0F1F5C 001F1E5C 0C002010 */  beqz        $1, .L001F1E90
/* 0F1F60 001F1E60 00000000 */   nop
/* 0F1F64 001F1E64 05000224 */  addiu       $2, $0, 0x5
/* 0F1F68 001F1E68 D901013C */  lui         $1, %hi(FishMenu + 0x16)
/* 0F1F6C 001F1E6C A60322A4 */  sh          $2, %lo(FishMenu + 0x16)($1)
/* 0F1F70 001F1E70 0E000224 */  addiu       $2, $0, 0xE
/* 0F1F74 001F1E74 D901013C */  lui         $1, %hi(FishMenu + 0x6)
/* 0F1F78 001F1E78 960322A4 */  sh          $2, %lo(FishMenu + 0x6)($1)
/* 0F1F7C 001F1E7C 02000424 */  addiu       $4, $0, 0x2
/* 0F1F80 001F1E80 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0F1F84 001F1E84 00000000 */   nop
/* 0F1F88 001F1E88 2E000010 */  b           .L001F1F44
/* 0F1F8C 001F1E8C 00000000 */   nop
.L001F1E90:
/* 0F1F90 001F1E90 0B00A012 */  beqz        $21, .L001F1EC0
/* 0F1F94 001F1E94 00000000 */   nop
/* 0F1F98 001F1E98 D901013C */  lui         $1, %hi(FishMenu + 0x6)
/* 0F1F9C 001F1E9C 960336A4 */  sh          $22, %lo(FishMenu + 0x6)($1)
/* 0F1FA0 001F1EA0 05000224 */  addiu       $2, $0, 0x5
/* 0F1FA4 001F1EA4 D901013C */  lui         $1, %hi(FishMenu + 0x16)
/* 0F1FA8 001F1EA8 A60322A4 */  sh          $2, %lo(FishMenu + 0x16)($1)
/* 0F1FAC 001F1EAC 02000424 */  addiu       $4, $0, 0x2
/* 0F1FB0 001F1EB0 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0F1FB4 001F1EB4 00000000 */   nop
/* 0F1FB8 001F1EB8 22000010 */  b           .L001F1F44
/* 0F1FBC 001F1EBC 00000000 */   nop
.L001F1EC0:
/* 0F1FC0 001F1EC0 01000424 */  addiu       $4, $0, 0x1
/* 0F1FC4 001F1EC4 D901013C */  lui         $1, %hi(FishMenu + 0x12)
/* 0F1FC8 001F1EC8 A20324A4 */  sh          $4, %lo(FishMenu + 0x12)($1)
/* 0F1FCC 001F1ECC D901013C */  lui         $1, %hi(FishMenu + 0x12)
/* 0F1FD0 001F1ED0 A2032384 */  lh          $3, %lo(FishMenu + 0x12)($1)
/* 0F1FD4 001F1ED4 C0100300 */  sll         $2, $3, 3
/* 0F1FD8 001F1ED8 21104300 */  addu        $2, $2, $3
/* 0F1FDC 001F1EDC 80100200 */  sll         $2, $2, 2
/* 0F1FE0 001F1EE0 02014224 */  addiu       $2, $2, 0x102
/* 0F1FE4 001F1EE4 D901013C */  lui         $1, %hi(FishMenu + 0xC)
/* 0F1FE8 001F1EE8 9C0322AC */  sw          $2, %lo(FishMenu + 0xC)($1)
/* 0F1FEC 001F1EEC 04000224 */  addiu       $2, $0, 0x4
/* 0F1FF0 001F1EF0 D901013C */  lui         $1, %hi(FishMenu + 0x16)
/* 0F1FF4 001F1EF4 A60322A4 */  sh          $2, %lo(FishMenu + 0x16)($1)
/* 0F1FF8 001F1EF8 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0F1FFC 001F1EFC 00000000 */   nop
/* 0F2000 001F1F00 10000010 */  b           .L001F1F44
/* 0F2004 001F1F04 00000000 */   nop
.L001F1F08:
/* 0F2008 001F1F08 CC01023C */  lui         $2, %hi(GamePad)
/* 0F200C 001F1F0C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0F2010 001F1F10 20000524 */  addiu       $5, $0, 0x20
/* 0F2014 001F1F14 1CAE040C */  jal         Down__8CGamePadFi
/* 0F2018 001F1F18 00000000 */   nop
/* 0F201C 001F1F1C 09004010 */  beqz        $2, .L001F1F44
/* 0F2020 001F1F20 00000000 */   nop
/* 0F2024 001F1F24 01000224 */  addiu       $2, $0, 0x1
/* 0F2028 001F1F28 D901013C */  lui         $1, %hi(FishMenu + 0x16)
/* 0F202C 001F1F2C A60322A4 */  sh          $2, %lo(FishMenu + 0x16)($1)
/* 0F2030 001F1F30 D901013C */  lui         $1, %hi(FishMenu + 0x20)
/* 0F2034 001F1F34 B00320AC */  sw          $0, %lo(FishMenu + 0x20)($1)
/* 0F2038 001F1F38 02000424 */  addiu       $4, $0, 0x2
/* 0F203C 001F1F3C BCB3080C */  jal         ComMenuSePlay__Fi
/* 0F2040 001F1F40 00000000 */   nop
.L001F1F44:
/* 0F2044 001F1F44 D901013C */  lui         $1, %hi(FishMenu + 0x18)
/* 0F2048 001F1F48 A8032484 */  lh          $4, %lo(FishMenu + 0x18)($1)
/* 0F204C 001F1F4C 1A01E412 */  beq         $23, $4, .L001F23B8
/* 0F2050 001F1F50 00000000 */   nop
/* 0F2054 001F1F54 94C4070C */  jal         GetExchangeItemList__Fi
/* 0F2058 001F1F58 00000000 */   nop
/* 0F205C 001F1F5C 289E4070 */  paddub      $19, $2, $0
/* 0F2060 001F1F60 28A60070 */  paddub      $20, $0, $0
/* 0F2064 001F1F64 27000010 */  b           .L001F2004
/* 0F2068 001F1F68 00000000 */   nop
.L001F1F6C:
/* 0F206C 001F1F6C 01000224 */  addiu       $2, $0, 0x1
/* 0F2070 001F1F70 0E002216 */  bne         $17, $2, .L001F1FAC
/* 0F2074 001F1F74 00000000 */   nop
/* 0F2078 001F1F78 D901013C */  lui         $1, %hi(FishMenu + 0x14)
/* 0F207C 001F1F7C A4032384 */  lh          $3, %lo(FishMenu + 0x14)($1)
/* 0F2080 001F1F80 D901013C */  lui         $1, %hi(FishMenu + 0x18)
/* 0F2084 001F1F84 A8032284 */  lh          $2, %lo(FishMenu + 0x18)($1)
/* 0F2088 001F1F88 21105400 */  addu        $2, $2, $20
/* 0F208C 001F1F8C 07006214 */  bne         $3, $2, .L001F1FAC
/* 0F2090 001F1F90 00000000 */   nop
/* 0F2094 001F1F94 05007214 */  bne         $3, $18, .L001F1FAC
/* 0F2098 001F1F98 00000000 */   nop
/* 0F209C 001F1F9C 20000424 */  addiu       $4, $0, 0x20
/* 0F20A0 001F1FA0 94C4070C */  jal         GetExchangeItemList__Fi
/* 0F20A4 001F1FA4 00000000 */   nop
/* 0F20A8 001F1FA8 289E4070 */  paddub      $19, $2, $0
.L001F1FAC:
/* 0F20AC 001F1FAC 07006016 */  bnez        $19, .L001F1FCC
/* 0F20B0 001F1FB0 00000000 */   nop
/* 0F20B4 001F1FB4 2A00023C */  lui         $2, %hi(LIT_3159)
/* 0F20B8 001F1FB8 50D44424 */  addiu       $4, $2, %lo(LIT_3159)
/* 0F20BC 001F1FBC A611040C */  jal         printf
/* 0F20C0 001F1FC0 00000000 */   nop
/* 0F20C4 001F1FC4 0E000010 */  b           .L001F2000
/* 0F20C8 001F1FC8 00000000 */   nop
.L001F1FCC:
/* 0F20CC 001F1FCC 00006486 */  lh          $4, 0x0($19)
/* 0F20D0 001F1FD0 7443070C */  jal         GetCommonItemInfo__Fi
/* 0F20D4 001F1FD4 00000000 */   nop
/* 0F20D8 001F1FD8 09004010 */  beqz        $2, .L001F2000
/* 0F20DC 001F1FDC 00000000 */   nop
/* 0F20E0 001F1FE0 06004284 */  lh          $2, 0x6($2)
/* 0F20E4 001F1FE4 64004424 */  addiu       $4, $2, 0x64
/* 0F20E8 001F1FE8 80181400 */  sll         $3, $20, 2
/* 0F20EC 001F1FEC DA01023C */  lui         $2, %hi(AtoraNameMes + 0x16E0)
/* 0F20F0 001F1FF0 B0694224 */  addiu       $2, $2, %lo(AtoraNameMes + 0x16E0)
/* 0F20F4 001F1FF4 21104300 */  addu        $2, $2, $3
/* 0F20F8 001F1FF8 000044AC */  sw          $4, 0x0($2)
/* 0F20FC 001F1FFC 04007326 */  addiu       $19, $19, 0x4
.L001F2000:
/* 0F2100 001F2000 01009426 */  addiu       $20, $20, 0x1
.L001F2004:
/* 0F2104 001F2004 0500822A */  slti        $2, $20, 0x5
/* 0F2108 001F2008 D8FF4014 */  bnez        $2, .L001F1F6C
/* 0F210C 001F200C 00000000 */   nop
/* 0F2110 001F2010 FFFF0224 */  addiu       $2, $0, -0x1
/* 0F2114 001F2014 DA01013C */  lui         $1, %hi(AtoraNameMes + 0x16BC)
/* 0F2118 001F2018 8C6922AC */  sw          $2, %lo(AtoraNameMes + 0x16BC)($1)
/* 0F211C 001F201C DA01023C */  lui         $2, %hi(AtoraNameMes)
/* 0F2120 001F2020 D0524424 */  addiu       $4, $2, %lo(AtoraNameMes)
/* 0F2124 001F2024 C8000524 */  addiu       $5, $0, 0xC8
/* 0F2128 001F2028 5441050C */  jal         MakeMesWin__6ClsMesFi
/* 0F212C 001F202C 00000000 */   nop
/* 0F2130 001F2030 E1000010 */  b           .L001F23B8
/* 0F2134 001F2034 00000000 */   nop
.L001F2038:
/* 0F2138 001F2038 CC01023C */  lui         $2, %hi(GamePad)
/* 0F213C 001F203C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0F2140 001F2040 00500524 */  addiu       $5, $0, 0x5000
/* 0F2144 001F2044 1CAE040C */  jal         Down__8CGamePadFi
/* 0F2148 001F2048 00000000 */   nop
/* 0F214C 001F204C 0F004010 */  beqz        $2, .L001F208C
/* 0F2150 001F2050 00000000 */   nop
/* 0F2154 001F2054 D901013C */  lui         $1, %hi(FishMenu + 0x12)
/* 0F2158 001F2058 A2032284 */  lh          $2, %lo(FishMenu + 0x12)($1)
/* 0F215C 001F205C 05004010 */  beqz        $2, .L001F2074
/* 0F2160 001F2060 00000000 */   nop
/* 0F2164 001F2064 D901013C */  lui         $1, %hi(FishMenu + 0x12)
/* 0F2168 001F2068 A20320A4 */  sh          $0, %lo(FishMenu + 0x12)($1)
/* 0F216C 001F206C 04000010 */  b           .L001F2080
/* 0F2170 001F2070 00000000 */   nop
.L001F2074:
/* 0F2174 001F2074 01000224 */  addiu       $2, $0, 0x1
/* 0F2178 001F2078 D901013C */  lui         $1, %hi(FishMenu + 0x12)
/* 0F217C 001F207C A20322A4 */  sh          $2, %lo(FishMenu + 0x12)($1)
.L001F2080:
/* 0F2180 001F2080 28260070 */  paddub      $4, $0, $0
/* 0F2184 001F2084 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0F2188 001F2088 00000000 */   nop
.L001F208C:
/* 0F218C 001F208C CC01023C */  lui         $2, %hi(GamePad)
/* 0F2190 001F2090 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0F2194 001F2094 40000524 */  addiu       $5, $0, 0x40
/* 0F2198 001F2098 1CAE040C */  jal         Down__8CGamePadFi
/* 0F219C 001F209C 00000000 */   nop
/* 0F21A0 001F20A0 69004010 */  beqz        $2, .L001F2248
/* 0F21A4 001F20A4 00000000 */   nop
/* 0F21A8 001F20A8 01000524 */  addiu       $5, $0, 0x1
/* 0F21AC 001F20AC D901013C */  lui         $1, %hi(FishMenu + 0x14)
/* 0F21B0 001F20B0 A4032484 */  lh          $4, %lo(FishMenu + 0x14)($1)
/* 0F21B4 001F20B4 94C4070C */  jal         GetExchangeItemList__Fi
/* 0F21B8 001F20B8 00000000 */   nop
/* 0F21BC 001F20BC 289E4070 */  paddub      $19, $2, $0
/* 0F21C0 001F20C0 2816A070 */  paddub      $2, $5, $0
/* 0F21C4 001F20C4 09002216 */  bne         $17, $2, .L001F20EC
/* 0F21C8 001F20C8 00000000 */   nop
/* 0F21CC 001F20CC D901013C */  lui         $1, %hi(FishMenu + 0x14)
/* 0F21D0 001F20D0 A4032284 */  lh          $2, %lo(FishMenu + 0x14)($1)
/* 0F21D4 001F20D4 05005214 */  bne         $2, $18, .L001F20EC
/* 0F21D8 001F20D8 00000000 */   nop
/* 0F21DC 001F20DC 20000424 */  addiu       $4, $0, 0x20
/* 0F21E0 001F20E0 94C4070C */  jal         GetExchangeItemList__Fi
/* 0F21E4 001F20E4 00000000 */   nop
/* 0F21E8 001F20E8 289E4070 */  paddub      $19, $2, $0
.L001F20EC:
/* 0F21EC 001F20EC 06006016 */  bnez        $19, .L001F2108
/* 0F21F0 001F20F0 00000000 */   nop
/* 0F21F4 001F20F4 02000424 */  addiu       $4, $0, 0x2
/* 0F21F8 001F20F8 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0F21FC 001F20FC 00000000 */   nop
/* 0F2200 001F2100 AD000010 */  b           .L001F23B8
/* 0F2204 001F2104 00000000 */   nop
.L001F2108:
/* 0F2208 001F2108 02007486 */  lh          $20, 0x2($19)
/* 0F220C 001F210C D901013C */  lui         $1, %hi(FishMenu + 0x8)
/* 0F2210 001F2110 9803228C */  lw          $2, %lo(FishMenu + 0x8)($1)
/* 0F2214 001F2114 2A085400 */  slt         $1, $2, $20
/* 0F2218 001F2118 02002010 */  beqz        $1, .L001F2124
/* 0F221C 001F211C 00000000 */   nop
/* 0F2220 001F2120 282E0070 */  paddub      $5, $0, $0
.L001F2124:
/* 0F2224 001F2124 D901013C */  lui         $1, %hi(FishMenu + 0x12)
/* 0F2228 001F2128 A2032284 */  lh          $2, %lo(FishMenu + 0x12)($1)
/* 0F222C 001F212C 33004014 */  bnez        $2, .L001F21FC
/* 0F2230 001F2130 00000000 */   nop
/* 0F2234 001F2134 2C00A010 */  beqz        $5, .L001F21E8
/* 0F2238 001F2138 00000000 */   nop
/* 0F223C 001F213C 9A000424 */  addiu       $4, $0, 0x9A
/* 0F2240 001F2140 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0F2244 001F2144 00000000 */   nop
/* 0F2248 001F2148 1C8D848F */  lw          $4, -0x72E4($28)
/* 0F224C 001F214C 7860050C */  jal         GetDngStatus__9CSaveDataFv
/* 0F2250 001F2150 00000000 */   nop
/* 0F2254 001F2154 00006586 */  lh          $5, 0x0($19)
/* 0F2258 001F2158 28264070 */  paddub      $4, $2, $0
/* 0F225C 001F215C 28360070 */  paddub      $6, $0, $0
/* 0F2260 001F2160 18F8060C */  jal         GetItem__14CDngStatusDataFii
/* 0F2264 001F2164 00000000 */   nop
/* 0F2268 001F2168 D901013C */  lui         $1, %hi(FishMenu + 0x8)
/* 0F226C 001F216C 9803228C */  lw          $2, %lo(FishMenu + 0x8)($1)
/* 0F2270 001F2170 23105400 */  subu        $2, $2, $20
/* 0F2274 001F2174 D901013C */  lui         $1, %hi(FishMenu + 0x8)
/* 0F2278 001F2178 980322AC */  sw          $2, %lo(FishMenu + 0x8)($1)
/* 0F227C 001F217C 00006386 */  lh          $3, 0x0($19)
/* 0F2280 001F2180 16010224 */  addiu       $2, $0, 0x116
/* 0F2284 001F2184 10006214 */  bne         $3, $2, .L001F21C8
/* 0F2288 001F2188 00000000 */   nop
/* 0F228C 001F218C 01000424 */  addiu       $4, $0, 0x1
/* 0F2290 001F2190 A4C4070C */  jal         SetAlreadyGetMardanWeapon__Fi
/* 0F2294 001F2194 00000000 */   nop
/* 0F2298 001F2198 DCC4070C */  jal         ClearFishMardanGarayanNum__Fv
/* 0F229C 001F219C 00000000 */   nop
/* 0F22A0 001F21A0 D901013C */  lui         $1, %hi(FishMenu + 0x18)
/* 0F22A4 001F21A4 A8032284 */  lh          $2, %lo(FishMenu + 0x18)($1)
/* 0F22A8 001F21A8 FFFF4224 */  addiu       $2, $2, -0x1
/* 0F22AC 001F21AC D901013C */  lui         $1, %hi(FishMenu + 0x18)
/* 0F22B0 001F21B0 A80322A4 */  sh          $2, %lo(FishMenu + 0x18)($1)
/* 0F22B4 001F21B4 D901013C */  lui         $1, %hi(FishMenu + 0x14)
/* 0F22B8 001F21B8 A4032284 */  lh          $2, %lo(FishMenu + 0x14)($1)
/* 0F22BC 001F21BC FFFF4224 */  addiu       $2, $2, -0x1
/* 0F22C0 001F21C0 D901013C */  lui         $1, %hi(FishMenu + 0x14)
/* 0F22C4 001F21C4 A40322A4 */  sh          $2, %lo(FishMenu + 0x14)($1)
.L001F21C8:
/* 0F22C8 001F21C8 D901013C */  lui         $1, %hi(FishMenu + 0x8)
/* 0F22CC 001F21CC 9803228C */  lw          $2, %lo(FishMenu + 0x8)($1)
/* 0F22D0 001F21D0 0D004104 */  bgez        $2, .L001F2208
/* 0F22D4 001F21D4 00000000 */   nop
/* 0F22D8 001F21D8 D901013C */  lui         $1, %hi(FishMenu + 0x8)
/* 0F22DC 001F21DC 980320AC */  sw          $0, %lo(FishMenu + 0x8)($1)
/* 0F22E0 001F21E0 09000010 */  b           .L001F2208
/* 0F22E4 001F21E4 00000000 */   nop
.L001F21E8:
/* 0F22E8 001F21E8 02000424 */  addiu       $4, $0, 0x2
/* 0F22EC 001F21EC BCB3080C */  jal         ComMenuSePlay__Fi
/* 0F22F0 001F21F0 00000000 */   nop
/* 0F22F4 001F21F4 04000010 */  b           .L001F2208
/* 0F22F8 001F21F8 00000000 */   nop
.L001F21FC:
/* 0F22FC 001F21FC 02000424 */  addiu       $4, $0, 0x2
/* 0F2300 001F2200 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0F2304 001F2204 00000000 */   nop
.L001F2208:
/* 0F2308 001F2208 D901013C */  lui         $1, %hi(FishMenu + 0x14)
/* 0F230C 001F220C A4032384 */  lh          $3, %lo(FishMenu + 0x14)($1)
/* 0F2310 001F2210 D901013C */  lui         $1, %hi(FishMenu + 0x18)
/* 0F2314 001F2214 A8032284 */  lh          $2, %lo(FishMenu + 0x18)($1)
/* 0F2318 001F2218 23186200 */  subu        $3, $3, $2
/* 0F231C 001F221C 00110300 */  sll         $2, $3, 4
/* 0F2320 001F2220 21104300 */  addu        $2, $2, $3
/* 0F2324 001F2224 40100200 */  sll         $2, $2, 1
/* 0F2328 001F2228 7E004224 */  addiu       $2, $2, 0x7E
/* 0F232C 001F222C D901013C */  lui         $1, %hi(FishMenu + 0xC)
/* 0F2330 001F2230 9C0322AC */  sw          $2, %lo(FishMenu + 0xC)($1)
/* 0F2334 001F2234 03000224 */  addiu       $2, $0, 0x3
/* 0F2338 001F2238 D901013C */  lui         $1, %hi(FishMenu + 0x16)
/* 0F233C 001F223C A60322A4 */  sh          $2, %lo(FishMenu + 0x16)($1)
/* 0F2340 001F2240 0E000010 */  b           .L001F227C
/* 0F2344 001F2244 00000000 */   nop
.L001F2248:
/* 0F2348 001F2248 CC01023C */  lui         $2, %hi(GamePad)
/* 0F234C 001F224C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0F2350 001F2250 20000524 */  addiu       $5, $0, 0x20
/* 0F2354 001F2254 1CAE040C */  jal         Down__8CGamePadFi
/* 0F2358 001F2258 00000000 */   nop
/* 0F235C 001F225C 07004010 */  beqz        $2, .L001F227C
/* 0F2360 001F2260 00000000 */   nop
/* 0F2364 001F2264 02000424 */  addiu       $4, $0, 0x2
/* 0F2368 001F2268 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0F236C 001F226C 00000000 */   nop
/* 0F2370 001F2270 03000224 */  addiu       $2, $0, 0x3
/* 0F2374 001F2274 D901013C */  lui         $1, %hi(FishMenu + 0x16)
/* 0F2378 001F2278 A60322A4 */  sh          $2, %lo(FishMenu + 0x16)($1)
.L001F227C:
/* 0F237C 001F227C D901013C */  lui         $1, %hi(FishMenu + 0x14)
/* 0F2380 001F2280 A4032484 */  lh          $4, %lo(FishMenu + 0x14)($1)
/* 0F2384 001F2284 94C4070C */  jal         GetExchangeItemList__Fi
/* 0F2388 001F2288 00000000 */   nop
/* 0F238C 001F228C 289E4070 */  paddub      $19, $2, $0
/* 0F2390 001F2290 01000224 */  addiu       $2, $0, 0x1
/* 0F2394 001F2294 09002216 */  bne         $17, $2, .L001F22BC
/* 0F2398 001F2298 00000000 */   nop
/* 0F239C 001F229C D901013C */  lui         $1, %hi(FishMenu + 0x14)
/* 0F23A0 001F22A0 A4032284 */  lh          $2, %lo(FishMenu + 0x14)($1)
/* 0F23A4 001F22A4 05005214 */  bne         $2, $18, .L001F22BC
/* 0F23A8 001F22A8 00000000 */   nop
/* 0F23AC 001F22AC 20000424 */  addiu       $4, $0, 0x20
/* 0F23B0 001F22B0 94C4070C */  jal         GetExchangeItemList__Fi
/* 0F23B4 001F22B4 00000000 */   nop
/* 0F23B8 001F22B8 289E4070 */  paddub      $19, $2, $0
.L001F22BC:
/* 0F23BC 001F22BC 3E006012 */  beqz        $19, .L001F23B8
/* 0F23C0 001F22C0 00000000 */   nop
/* 0F23C4 001F22C4 00006486 */  lh          $4, 0x0($19)
/* 0F23C8 001F22C8 7443070C */  jal         GetCommonItemInfo__Fi
/* 0F23CC 001F22CC 00000000 */   nop
/* 0F23D0 001F22D0 39004010 */  beqz        $2, .L001F23B8
/* 0F23D4 001F22D4 00000000 */   nop
/* 0F23D8 001F22D8 06004484 */  lh          $4, 0x6($2)
/* 0F23DC 001F22DC DA01013C */  lui         $1, %hi(CommonMenuMes1 + 0x16BC)
/* 0F23E0 001F22E0 4C22238C */  lw          $3, %lo(CommonMenuMes1 + 0x16BC)($1)
/* 0F23E4 001F22E4 CA000224 */  addiu       $2, $0, 0xCA
/* 0F23E8 001F22E8 0B006214 */  bne         $3, $2, .L001F2318
/* 0F23EC 001F22EC 00000000 */   nop
/* 0F23F0 001F22F0 DA01013C */  lui         $1, %hi(CommonMenuMes1 + 0x16E0)
/* 0F23F4 001F22F4 7022238C */  lw          $3, %lo(CommonMenuMes1 + 0x16E0)($1)
/* 0F23F8 001F22F8 64008224 */  addiu       $2, $4, 0x64
/* 0F23FC 001F22FC 06006214 */  bne         $3, $2, .L001F2318
/* 0F2400 001F2300 00000000 */   nop
/* 0F2404 001F2304 DA01013C */  lui         $1, %hi(CommonMenuMes1 + 0x1708)
/* 0F2408 001F2308 9822238C */  lw          $3, %lo(CommonMenuMes1 + 0x1708)($1)
/* 0F240C 001F230C 02006286 */  lh          $2, 0x2($19)
/* 0F2410 001F2310 29006210 */  beq         $3, $2, .L001F23B8
/* 0F2414 001F2314 00000000 */   nop
.L001F2318:
/* 0F2418 001F2318 FFFF0224 */  addiu       $2, $0, -0x1
/* 0F241C 001F231C DA01013C */  lui         $1, %hi(CommonMenuMes1 + 0x16BC)
/* 0F2420 001F2320 4C2222AC */  sw          $2, %lo(CommonMenuMes1 + 0x16BC)($1)
/* 0F2424 001F2324 64008224 */  addiu       $2, $4, 0x64
/* 0F2428 001F2328 DA01013C */  lui         $1, %hi(CommonMenuMes1 + 0x16E0)
/* 0F242C 001F232C 702222AC */  sw          $2, %lo(CommonMenuMes1 + 0x16E0)($1)
/* 0F2430 001F2330 02006286 */  lh          $2, 0x2($19)
/* 0F2434 001F2334 DA01013C */  lui         $1, %hi(CommonMenuMes1 + 0x1708)
/* 0F2438 001F2338 982222AC */  sw          $2, %lo(CommonMenuMes1 + 0x1708)($1)
/* 0F243C 001F233C DA01023C */  lui         $2, %hi(CommonMenuMes1)
/* 0F2440 001F2340 900B4424 */  addiu       $4, $2, %lo(CommonMenuMes1)
/* 0F2444 001F2344 CA000524 */  addiu       $5, $0, 0xCA
/* 0F2448 001F2348 5441050C */  jal         MakeMesWin__6ClsMesFi
/* 0F244C 001F234C 00000000 */   nop
/* 0F2450 001F2350 19000010 */  b           .L001F23B8
/* 0F2454 001F2354 00000000 */   nop
.L001F2358:
/* 0F2458 001F2358 CC01023C */  lui         $2, %hi(GamePad)
/* 0F245C 001F235C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0F2460 001F2360 60000524 */  addiu       $5, $0, 0x60
/* 0F2464 001F2364 1CAE040C */  jal         Down__8CGamePadFi
/* 0F2468 001F2368 00000000 */   nop
/* 0F246C 001F236C 07004010 */  beqz        $2, .L001F238C
/* 0F2470 001F2370 00000000 */   nop
/* 0F2474 001F2374 03000224 */  addiu       $2, $0, 0x3
/* 0F2478 001F2378 D901013C */  lui         $1, %hi(FishMenu + 0x16)
/* 0F247C 001F237C A60322A4 */  sh          $2, %lo(FishMenu + 0x16)($1)
/* 0F2480 001F2380 02000424 */  addiu       $4, $0, 0x2
/* 0F2484 001F2384 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0F2488 001F2388 00000000 */   nop
.L001F238C:
/* 0F248C 001F238C DA01013C */  lui         $1, %hi(CommonMenuMes1 + 0x16BC)
/* 0F2490 001F2390 4C22238C */  lw          $3, %lo(CommonMenuMes1 + 0x16BC)($1)
/* 0F2494 001F2394 D901013C */  lui         $1, %hi(FishMenu + 0x6)
/* 0F2498 001F2398 96032284 */  lh          $2, %lo(FishMenu + 0x6)($1)
/* 0F249C 001F239C CB004524 */  addiu       $5, $2, 0xCB
/* 0F24A0 001F23A0 05006510 */  beq         $3, $5, .L001F23B8
/* 0F24A4 001F23A4 00000000 */   nop
/* 0F24A8 001F23A8 DA01023C */  lui         $2, %hi(CommonMenuMes1)
/* 0F24AC 001F23AC 900B4424 */  addiu       $4, $2, %lo(CommonMenuMes1)
/* 0F24B0 001F23B0 5441050C */  jal         MakeMesWin__6ClsMesFi
/* 0F24B4 001F23B4 00000000 */   nop
.L001F23B8:
/* 0F24B8 001F23B8 F896828F */  lw          $2, -0x6908($28)
/* 0F24BC 001F23BC 01004224 */  addiu       $2, $2, 0x1
/* 0F24C0 001F23C0 F89682AF */  sw          $2, -0x6908($28)
/* 0F24C4 001F23C4 F896838F */  lw          $3, -0x6908($28)
/* 0F24C8 001F23C8 6F06023C */  lui         $2, (0x66FF300 >> 16)
/* 0F24CC 001F23CC 00F34234 */  ori         $2, $2, (0x66FF300 & 0xFFFF)
/* 0F24D0 001F23D0 2A106200 */  slt         $2, $3, $2
/* 0F24D4 001F23D4 02004014 */  bnez        $2, .L001F23E0
/* 0F24D8 001F23D8 00000000 */   nop
/* 0F24DC 001F23DC F89680AF */  sw          $0, -0x6908($28)
.L001F23E0:
/* 0F24E0 001F23E0 28160072 */  paddub      $2, $16, $0
/* 0F24E4 001F23E4 8000BF7B */  lq          $31, 0x80($29)
/* 0F24E8 001F23E8 7000B77B */  lq          $23, 0x70($29)
/* 0F24EC 001F23EC 6000B67B */  lq          $22, 0x60($29)
/* 0F24F0 001F23F0 5000B57B */  lq          $21, 0x50($29)
/* 0F24F4 001F23F4 4000B47B */  lq          $20, 0x40($29)
/* 0F24F8 001F23F8 3000B37B */  lq          $19, 0x30($29)
/* 0F24FC 001F23FC 2000B27B */  lq          $18, 0x20($29)
/* 0F2500 001F2400 1000B17B */  lq          $17, 0x10($29)
/* 0F2504 001F2404 0000B07B */  lq          $16, 0x0($29)
/* 0F2508 001F2408 9000BD27 */  addiu       $29, $29, 0x90
/* 0F250C 001F240C 0800E003 */  jr          $31
/* 0F2510 001F2410 00000000 */   nop
/* 0F2514 001F2414 00000000 */  nop
/* 0F2518 001F2418 00000000 */  nop
/* 0F251C 001F241C 00000000 */  nop
