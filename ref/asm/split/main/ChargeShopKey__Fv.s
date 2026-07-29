.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ChargeShopKey__Fv
/* 0E8A10 001E8910 40FCBD27 */  addiu       $29, $29, -0x3C0
/* 0E8A14 001E8914 8000BF7F */  sq          $31, 0x80($29)
/* 0E8A18 001E8918 7000B77F */  sq          $23, 0x70($29)
/* 0E8A1C 001E891C 6000B67F */  sq          $22, 0x60($29)
/* 0E8A20 001E8920 5000B57F */  sq          $21, 0x50($29)
/* 0E8A24 001E8924 4000B47F */  sq          $20, 0x40($29)
/* 0E8A28 001E8928 3000B37F */  sq          $19, 0x30($29)
/* 0E8A2C 001E892C 2000B27F */  sq          $18, 0x20($29)
/* 0E8A30 001E8930 1000B17F */  sq          $17, 0x10($29)
/* 0E8A34 001E8934 0000B07F */  sq          $16, 0x0($29)
/* 0E8A38 001E8938 28860070 */  paddub      $16, $0, $0
/* 0E8A3C 001E893C D901013C */  lui         $1, %hi(ShopMenu + 0x188)
/* 0E8A40 001E8940 58022284 */  lh          $2, %lo(ShopMenu + 0x188)($1)
/* 0E8A44 001E8944 0E004014 */  bnez        $2, .L001E8980
/* 0E8A48 001E8948 00000000 */   nop
/* 0E8A4C 001E894C 8CFB040C */  jal         ReadBGSync__Fv
/* 0E8A50 001E8950 00000000 */   nop
/* 0E8A54 001E8954 54054014 */  bnez        $2, .L001E9EA8
/* 0E8A58 001E8958 00000000 */   nop
/* 0E8A5C 001E895C 349F070C */  jal         ShopTextureLoadFix__Fv
/* 0E8A60 001E8960 00000000 */   nop
/* 0E8A64 001E8964 D901013C */  lui         $1, %hi(ShopMenu)
/* 0E8A68 001E8968 D0002584 */  lh          $5, %lo(ShopMenu)($1)
/* 0E8A6C 001E896C 28260070 */  paddub      $4, $0, $0
/* 0E8A70 001E8970 E89F070C */  jal         ShopPersonReadStart__Fii
/* 0E8A74 001E8974 00000000 */   nop
/* 0E8A78 001E8978 4B050010 */  b           .L001E9EA8
/* 0E8A7C 001E897C 00000000 */   nop
.L001E8980:
/* 0E8A80 001E8980 D901013C */  lui         $1, %hi(ShopMenu + 0x180)
/* 0E8A84 001E8984 50022384 */  lh          $3, %lo(ShopMenu + 0x180)($1)
/* 0E8A88 001E8988 6E026010 */  beqz        $3, .L001E9344
/* 0E8A8C 001E898C 00000000 */   nop
/* 0E8A90 001E8990 18000224 */  addiu       $2, $0, 0x18
/* 0E8A94 001E8994 45026210 */  beq         $3, $2, .L001E92AC
/* 0E8A98 001E8998 00000000 */   nop
/* 0E8A9C 001E899C 19000224 */  addiu       $2, $0, 0x19
/* 0E8AA0 001E89A0 2C026210 */  beq         $3, $2, .L001E9254
/* 0E8AA4 001E89A4 00000000 */   nop
/* 0E8AA8 001E89A8 12000224 */  addiu       $2, $0, 0x12
/* 0E8AAC 001E89AC 70016210 */  beq         $3, $2, .L001E8F70
/* 0E8AB0 001E89B0 00000000 */   nop
/* 0E8AB4 001E89B4 11000224 */  addiu       $2, $0, 0x11
/* 0E8AB8 001E89B8 8A006210 */  beq         $3, $2, .L001E8BE4
/* 0E8ABC 001E89BC 00000000 */   nop
/* 0E8AC0 001E89C0 0A000224 */  addiu       $2, $0, 0xA
/* 0E8AC4 001E89C4 72006210 */  beq         $3, $2, .L001E8B90
/* 0E8AC8 001E89C8 00000000 */   nop
/* 0E8ACC 001E89CC 07000224 */  addiu       $2, $0, 0x7
/* 0E8AD0 001E89D0 6F006210 */  beq         $3, $2, .L001E8B90
/* 0E8AD4 001E89D4 00000000 */   nop
/* 0E8AD8 001E89D8 08000224 */  addiu       $2, $0, 0x8
/* 0E8ADC 001E89DC 5B006210 */  beq         $3, $2, .L001E8B4C
/* 0E8AE0 001E89E0 00000000 */   nop
/* 0E8AE4 001E89E4 03000224 */  addiu       $2, $0, 0x3
/* 0E8AE8 001E89E8 3F006210 */  beq         $3, $2, .L001E8AE8
/* 0E8AEC 001E89EC 00000000 */   nop
/* 0E8AF0 001E89F0 02000224 */  addiu       $2, $0, 0x2
/* 0E8AF4 001E89F4 25006210 */  beq         $3, $2, .L001E8A8C
/* 0E8AF8 001E89F8 00000000 */   nop
/* 0E8AFC 001E89FC 01000224 */  addiu       $2, $0, 0x1
/* 0E8B00 001E8A00 03006210 */  beq         $3, $2, .L001E8A10
/* 0E8B04 001E8A04 00000000 */   nop
/* 0E8B08 001E8A08 45040010 */  b           .L001E9B20
/* 0E8B0C 001E8A0C 00000000 */   nop
.L001E8A10:
/* 0E8B10 001E8A10 D901013C */  lui         $1, %hi(ShopMenu + 0x18E)
/* 0E8B14 001E8A14 5E022284 */  lh          $2, %lo(ShopMenu + 0x18E)($1)
/* 0E8B18 001E8A18 08004224 */  addiu       $2, $2, 0x8
/* 0E8B1C 001E8A1C D901013C */  lui         $1, %hi(ShopMenu + 0x18E)
/* 0E8B20 001E8A20 5E0222A4 */  sh          $2, %lo(ShopMenu + 0x18E)($1)
/* 0E8B24 001E8A24 D901013C */  lui         $1, %hi(ShopMenu + 0x18E)
/* 0E8B28 001E8A28 5E022284 */  lh          $2, %lo(ShopMenu + 0x18E)($1)
/* 0E8B2C 001E8A2C 80004228 */  slti        $2, $2, 0x80
/* 0E8B30 001E8A30 04004014 */  bnez        $2, .L001E8A44
/* 0E8B34 001E8A34 00000000 */   nop
/* 0E8B38 001E8A38 80000224 */  addiu       $2, $0, 0x80
/* 0E8B3C 001E8A3C D901013C */  lui         $1, %hi(ShopMenu + 0x18E)
/* 0E8B40 001E8A40 5E0222A4 */  sh          $2, %lo(ShopMenu + 0x18E)($1)
.L001E8A44:
/* 0E8B44 001E8A44 D901013C */  lui         $1, %hi(ShopMenu + 0x184)
/* 0E8B48 001E8A48 5402228C */  lw          $2, %lo(ShopMenu + 0x184)($1)
/* 0E8B4C 001E8A4C 15004128 */  slti        $1, $2, 0x15
/* 0E8B50 001E8A50 33042014 */  bnez        $1, .L001E9B20
/* 0E8B54 001E8A54 00000000 */   nop
/* 0E8B58 001E8A58 D901013C */  lui         $1, %hi(ShopMenu + 0x188)
/* 0E8B5C 001E8A5C 58022284 */  lh          $2, %lo(ShopMenu + 0x188)($1)
/* 0E8B60 001E8A60 2F044010 */  beqz        $2, .L001E9B20
/* 0E8B64 001E8A64 00000000 */   nop
/* 0E8B68 001E8A68 D901013C */  lui         $1, %hi(ShopMenu + 0x18E)
/* 0E8B6C 001E8A6C 5E022284 */  lh          $2, %lo(ShopMenu + 0x18E)($1)
/* 0E8B70 001E8A70 80004228 */  slti        $2, $2, 0x80
/* 0E8B74 001E8A74 2A044014 */  bnez        $2, .L001E9B20
/* 0E8B78 001E8A78 00000000 */   nop
/* 0E8B7C 001E8A7C D901013C */  lui         $1, %hi(ShopMenu + 0x180)
/* 0E8B80 001E8A80 500220A4 */  sh          $0, %lo(ShopMenu + 0x180)($1)
/* 0E8B84 001E8A84 26040010 */  b           .L001E9B20
/* 0E8B88 001E8A88 00000000 */   nop
.L001E8A8C:
/* 0E8B8C 001E8A8C D901013C */  lui         $1, %hi(ShopMenu + 0x18E)
/* 0E8B90 001E8A90 5E022284 */  lh          $2, %lo(ShopMenu + 0x18E)($1)
/* 0E8B94 001E8A94 F8FF4224 */  addiu       $2, $2, -0x8
/* 0E8B98 001E8A98 D901013C */  lui         $1, %hi(ShopMenu + 0x18E)
/* 0E8B9C 001E8A9C 5E0222A4 */  sh          $2, %lo(ShopMenu + 0x18E)($1)
/* 0E8BA0 001E8AA0 D901013C */  lui         $1, %hi(ShopMenu + 0x18E)
/* 0E8BA4 001E8AA4 5E022284 */  lh          $2, %lo(ShopMenu + 0x18E)($1)
/* 0E8BA8 001E8AA8 0300401C */  bgtz        $2, .L001E8AB8
/* 0E8BAC 001E8AAC 00000000 */   nop
/* 0E8BB0 001E8AB0 D901013C */  lui         $1, %hi(ShopMenu + 0x18E)
/* 0E8BB4 001E8AB4 5E0220A4 */  sh          $0, %lo(ShopMenu + 0x18E)($1)
.L001E8AB8:
/* 0E8BB8 001E8AB8 D901013C */  lui         $1, %hi(ShopMenu + 0x184)
/* 0E8BBC 001E8ABC 5402228C */  lw          $2, %lo(ShopMenu + 0x184)($1)
/* 0E8BC0 001E8AC0 1B004128 */  slti        $1, $2, 0x1B
/* 0E8BC4 001E8AC4 16042014 */  bnez        $1, .L001E9B20
/* 0E8BC8 001E8AC8 00000000 */   nop
/* 0E8BCC 001E8ACC D901013C */  lui         $1, %hi(ShopMenu + 0x18E)
/* 0E8BD0 001E8AD0 5E022284 */  lh          $2, %lo(ShopMenu + 0x18E)($1)
/* 0E8BD4 001E8AD4 1204401C */  bgtz        $2, .L001E9B20
/* 0E8BD8 001E8AD8 00000000 */   nop
/* 0E8BDC 001E8ADC 01001024 */  addiu       $16, $0, 0x1
/* 0E8BE0 001E8AE0 0F040010 */  b           .L001E9B20
/* 0E8BE4 001E8AE4 00000000 */   nop
.L001E8AE8:
/* 0E8BE8 001E8AE8 01000224 */  addiu       $2, $0, 0x1
/* 0E8BEC 001E8AEC DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16C4)
/* 0E8BF0 001E8AF0 D45122AC */  sw          $2, %lo(CommonMenuMes3 + 0x16C4)($1)
/* 0E8BF4 001E8AF4 CC01023C */  lui         $2, %hi(GamePad)
/* 0E8BF8 001E8AF8 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0E8BFC 001E8AFC 00F00534 */  ori         $5, $0, 0xF000
/* 0E8C00 001E8B00 1CAE040C */  jal         Down__8CGamePadFi
/* 0E8C04 001E8B04 00000000 */   nop
/* 0E8C08 001E8B08 07004014 */  bnez        $2, .L001E8B28
/* 0E8C0C 001E8B0C 00000000 */   nop
/* 0E8C10 001E8B10 CC01023C */  lui         $2, %hi(GamePad)
/* 0E8C14 001E8B14 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0E8C18 001E8B18 0CAD040C */  jal         AllOn__8CGamePadFv
/* 0E8C1C 001E8B1C 00000000 */   nop
/* 0E8C20 001E8B20 FF034010 */  beqz        $2, .L001E9B20
/* 0E8C24 001E8B24 00000000 */   nop
.L001E8B28:
/* 0E8C28 001E8B28 D901013C */  lui         $1, %hi(ShopMenu + 0x180)
/* 0E8C2C 001E8B2C 500220A4 */  sh          $0, %lo(ShopMenu + 0x180)($1)
/* 0E8C30 001E8B30 02000424 */  addiu       $4, $0, 0x2
/* 0E8C34 001E8B34 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0E8C38 001E8B38 00000000 */   nop
/* 0E8C3C 001E8B3C DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16C4)
/* 0E8C40 001E8B40 D45120AC */  sw          $0, %lo(CommonMenuMes3 + 0x16C4)($1)
/* 0E8C44 001E8B44 F6030010 */  b           .L001E9B20
/* 0E8C48 001E8B48 00000000 */   nop
.L001E8B4C:
/* 0E8C4C 001E8B4C 01000224 */  addiu       $2, $0, 0x1
/* 0E8C50 001E8B50 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16C4)
/* 0E8C54 001E8B54 D45122AC */  sw          $2, %lo(CommonMenuMes3 + 0x16C4)($1)
/* 0E8C58 001E8B58 CC01023C */  lui         $2, %hi(GamePad)
/* 0E8C5C 001E8B5C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0E8C60 001E8B60 00F00534 */  ori         $5, $0, 0xF000
/* 0E8C64 001E8B64 1CAE040C */  jal         Down__8CGamePadFi
/* 0E8C68 001E8B68 00000000 */   nop
/* 0E8C6C 001E8B6C 08004010 */  beqz        $2, .L001E8B90
/* 0E8C70 001E8B70 00000000 */   nop
/* 0E8C74 001E8B74 D901013C */  lui         $1, %hi(ShopMenu + 0x180)
/* 0E8C78 001E8B78 500220A4 */  sh          $0, %lo(ShopMenu + 0x180)($1)
/* 0E8C7C 001E8B7C 02000424 */  addiu       $4, $0, 0x2
/* 0E8C80 001E8B80 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0E8C84 001E8B84 00000000 */   nop
/* 0E8C88 001E8B88 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16C4)
/* 0E8C8C 001E8B8C D45120AC */  sw          $0, %lo(CommonMenuMes3 + 0x16C4)($1)
.L001E8B90:
/* 0E8C90 001E8B90 01000224 */  addiu       $2, $0, 0x1
/* 0E8C94 001E8B94 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16C4)
/* 0E8C98 001E8B98 D45122AC */  sw          $2, %lo(CommonMenuMes3 + 0x16C4)($1)
/* 0E8C9C 001E8B9C CC01023C */  lui         $2, %hi(GamePad)
/* 0E8CA0 001E8BA0 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0E8CA4 001E8BA4 60000524 */  addiu       $5, $0, 0x60
/* 0E8CA8 001E8BA8 1CAE040C */  jal         Down__8CGamePadFi
/* 0E8CAC 001E8BAC 00000000 */   nop
/* 0E8CB0 001E8BB0 DB034010 */  beqz        $2, .L001E9B20
/* 0E8CB4 001E8BB4 00000000 */   nop
/* 0E8CB8 001E8BB8 28260070 */  paddub      $4, $0, $0
/* 0E8CBC 001E8BBC 282E0070 */  paddub      $5, $0, $0
/* 0E8CC0 001E8BC0 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0E8CC4 001E8BC4 00000000 */   nop
/* 0E8CC8 001E8BC8 02000424 */  addiu       $4, $0, 0x2
/* 0E8CCC 001E8BCC BCB3080C */  jal         ComMenuSePlay__Fi
/* 0E8CD0 001E8BD0 00000000 */   nop
/* 0E8CD4 001E8BD4 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16C4)
/* 0E8CD8 001E8BD8 D45120AC */  sw          $0, %lo(CommonMenuMes3 + 0x16C4)($1)
/* 0E8CDC 001E8BDC D0030010 */  b           .L001E9B20
/* 0E8CE0 001E8BE0 00000000 */   nop
.L001E8BE4:
/* 0E8CE4 001E8BE4 CC01023C */  lui         $2, %hi(GamePad)
/* 0E8CE8 001E8BE8 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0E8CEC 001E8BEC 20000524 */  addiu       $5, $0, 0x20
/* 0E8CF0 001E8BF0 1CAE040C */  jal         Down__8CGamePadFi
/* 0E8CF4 001E8BF4 00000000 */   nop
/* 0E8CF8 001E8BF8 08004010 */  beqz        $2, .L001E8C1C
/* 0E8CFC 001E8BFC 00000000 */   nop
/* 0E8D00 001E8C00 D901013C */  lui         $1, %hi(ShopMenu + 0x180)
/* 0E8D04 001E8C04 500220A4 */  sh          $0, %lo(ShopMenu + 0x180)($1)
/* 0E8D08 001E8C08 02000424 */  addiu       $4, $0, 0x2
/* 0E8D0C 001E8C0C BCB3080C */  jal         ComMenuSePlay__Fi
/* 0E8D10 001E8C10 00000000 */   nop
/* 0E8D14 001E8C14 C2030010 */  b           .L001E9B20
/* 0E8D18 001E8C18 00000000 */   nop
.L001E8C1C:
/* 0E8D1C 001E8C1C CC01023C */  lui         $2, %hi(GamePad)
/* 0E8D20 001E8C20 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0E8D24 001E8C24 50000524 */  addiu       $5, $0, 0x50
/* 0E8D28 001E8C28 1CAE040C */  jal         Down__8CGamePadFi
/* 0E8D2C 001E8C2C 00000000 */   nop
/* 0E8D30 001E8C30 BB034010 */  beqz        $2, .L001E9B20
/* 0E8D34 001E8C34 00000000 */   nop
/* 0E8D38 001E8C38 D901013C */  lui         $1, %hi(ShopDataMove + 0x6)
/* 0E8D3C 001E8C3C 86022284 */  lh          $2, %lo(ShopDataMove + 0x6)($1)
/* 0E8D40 001E8C40 1A004004 */  bltz        $2, .L001E8CAC
/* 0E8D44 001E8C44 00000000 */   nop
/* 0E8D48 001E8C48 C4948587 */  lh          $5, -0x6B3C($28)
/* 0E8D4C 001E8C4C D901023C */  lui         $2, %hi(ShopDataMove)
/* 0E8D50 001E8C50 80024424 */  addiu       $4, $2, %lo(ShopDataMove)
/* 0E8D54 001E8C54 01000624 */  addiu       $6, $0, 0x1
/* 0E8D58 001E8C58 689A070C */  jal         IconAutoMove__12ShopIconMoveFii
/* 0E8D5C 001E8C5C 00000000 */   nop
/* 0E8D60 001E8C60 FFFF0224 */  addiu       $2, $0, -0x1
/* 0E8D64 001E8C64 D901013C */  lui         $1, %hi(ShopDataMove + 0x2)
/* 0E8D68 001E8C68 820222A4 */  sh          $2, %lo(ShopDataMove + 0x2)($1)
/* 0E8D6C 001E8C6C D901013C */  lui         $1, %hi(ShopDataMove + 0x4)
/* 0E8D70 001E8C70 840222A4 */  sh          $2, %lo(ShopDataMove + 0x4)($1)
/* 0E8D74 001E8C74 D901013C */  lui         $1, %hi(ShopDataMove + 0x6)
/* 0E8D78 001E8C78 860222A4 */  sh          $2, %lo(ShopDataMove + 0x6)($1)
/* 0E8D7C 001E8C7C D901013C */  lui         $1, %hi(ShopDataMove + 0x10)
/* 0E8D80 001E8C80 900222A4 */  sh          $2, %lo(ShopDataMove + 0x10)($1)
/* 0E8D84 001E8C84 D901013C */  lui         $1, %hi(ShopDataMove + 0xC)
/* 0E8D88 001E8C88 8C0220AC */  sw          $0, %lo(ShopDataMove + 0xC)($1)
/* 0E8D8C 001E8C8C D901013C */  lui         $1, %hi(ShopDataMove + 0x8)
/* 0E8D90 001E8C90 880220AC */  sw          $0, %lo(ShopDataMove + 0x8)($1)
/* 0E8D94 001E8C94 D901023C */  lui         $2, %hi(ShopDataMove + 0x14)
/* 0E8D98 001E8C98 94024424 */  addiu       $4, $2, %lo(ShopDataMove + 0x14)
/* 0E8D9C 001E8C9C 282E0070 */  paddub      $5, $0, $0
/* 0E8DA0 001E8CA0 F8000624 */  addiu       $6, $0, 0xF8
/* 0E8DA4 001E8CA4 5A0D040C */  jal         memset
/* 0E8DA8 001E8CA8 00000000 */   nop
.L001E8CAC:
/* 0E8DAC 001E8CAC 8C94848F */  lw          $4, -0x6B74($28)
/* 0E8DB0 001E8CB0 D901013C */  lui         $1, %hi(ShopMenu + 0xC)
/* 0E8DB4 001E8CB4 DC00258C */  lw          $5, %lo(ShopMenu + 0xC)($1)
/* 0E8DB8 001E8CB8 E4FF080C */  jal         GetNowModeSpace__10CStockItemFi
/* 0E8DBC 001E8CBC 00000000 */   nop
/* 0E8DC0 001E8CC0 288E4070 */  paddub      $17, $2, $0
/* 0E8DC4 001E8CC4 D901013C */  lui         $1, %hi(ShopMenu + 0x176)
/* 0E8DC8 001E8CC8 46022390 */  lbu         $3, %lo(ShopMenu + 0x176)($1)
/* 0E8DCC 001E8CCC 80100300 */  sll         $2, $3, 2
/* 0E8DD0 001E8CD0 21104300 */  addu        $2, $2, $3
/* 0E8DD4 001E8CD4 23902202 */  subu        $18, $17, $2
/* 0E8DD8 001E8CD8 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0E8DDC 001E8CDC E4002484 */  lh          $4, %lo(ShopMenu + 0x14)($1)
/* 0E8DE0 001E8CE0 D901013C */  lui         $1, %hi(ShopMenu + 0xC)
/* 0E8DE4 001E8CE4 DC00238C */  lw          $3, %lo(ShopMenu + 0xC)($1)
/* 0E8DE8 001E8CE8 01000224 */  addiu       $2, $0, 0x1
/* 0E8DEC 001E8CEC 31006210 */  beq         $3, $2, .L001E8DB4
/* 0E8DF0 001E8CF0 00000000 */   nop
/* 0E8DF4 001E8CF4 02000224 */  addiu       $2, $0, 0x2
/* 0E8DF8 001E8CF8 1A006210 */  beq         $3, $2, .L001E8D64
/* 0E8DFC 001E8CFC 00000000 */   nop
/* 0E8E00 001E8D00 03006010 */  beqz        $3, .L001E8D10
/* 0E8E04 001E8D04 00000000 */   nop
/* 0E8E08 001E8D08 4B000010 */  b           .L001E8E38
/* 0E8E0C 001E8D0C 00000000 */   nop
.L001E8D10:
/* 0E8E10 001E8D10 8494828F */  lw          $2, -0x6B7C($28)
/* 0E8E14 001E8D14 60434324 */  addiu       $3, $2, 0x4360
/* 0E8E18 001E8D18 3C140400 */  dsll32      $2, $4, 16
/* 0E8E1C 001E8D1C 3F140200 */  dsra32      $2, $2, 16
/* 0E8E20 001E8D20 40100200 */  sll         $2, $2, 1
/* 0E8E24 001E8D24 21104300 */  addu        $2, $2, $3
/* 0E8E28 001E8D28 0E005424 */  addiu       $20, $2, 0xE
/* 0E8E2C 001E8D2C 0E005384 */  lh          $19, 0xE($2)
/* 0E8E30 001E8D30 DC005524 */  addiu       $21, $2, 0xDC
/* 0E8E34 001E8D34 DC004284 */  lh          $2, 0xDC($2)
/* 0E8E38 001E8D38 9000A2AF */  sw          $2, 0x90($29)
/* 0E8E3C 001E8D3C 2A00023C */  lui         $2, %hi(LIT_1180)
/* 0E8E40 001E8D40 30D24424 */  addiu       $4, $2, %lo(LIT_1180)
/* 0E8E44 001E8D44 9000A58F */  lw          $5, 0x90($29)
/* 0E8E48 001E8D48 A611040C */  jal         printf
/* 0E8E4C 001E8D4C 00000000 */   nop
/* 0E8E50 001E8D50 FFFF0224 */  addiu       $2, $0, -0x1
/* 0E8E54 001E8D54 000082A6 */  sh          $2, 0x0($20)
/* 0E8E58 001E8D58 0000A0A6 */  sh          $0, 0x0($21)
/* 0E8E5C 001E8D5C 36000010 */  b           .L001E8E38
/* 0E8E60 001E8D60 00000000 */   nop
.L001E8D64:
/* 0E8E64 001E8D64 8494828F */  lw          $2, -0x6B7C($28)
/* 0E8E68 001E8D68 04054324 */  addiu       $3, $2, 0x504
/* 0E8E6C 001E8D6C F87F6324 */  addiu       $3, $3, 0x7FF8
/* 0E8E70 001E8D70 3C140400 */  dsll32      $2, $4, 16
/* 0E8E74 001E8D74 3F140200 */  dsra32      $2, $2, 16
/* 0E8E78 001E8D78 40110200 */  sll         $2, $2, 5
/* 0E8E7C 001E8D7C 21A06200 */  addu        $20, $3, $2
/* 0E8E80 001E8D80 00009386 */  lh          $19, 0x0($20)
/* 0E8E84 001E8D84 9000A427 */  addiu       $4, $29, 0x90
/* 0E8E88 001E8D88 282E8072 */  paddub      $5, $20, $0
/* 0E8E8C 001E8D8C 20000624 */  addiu       $6, $0, 0x20
/* 0E8E90 001E8D90 EC0C040C */  jal         memcpy
/* 0E8E94 001E8D94 00000000 */   nop
/* 0E8E98 001E8D98 28268072 */  paddub      $4, $20, $0
/* 0E8E9C 001E8D9C 282E0070 */  paddub      $5, $0, $0
/* 0E8EA0 001E8DA0 20000624 */  addiu       $6, $0, 0x20
/* 0E8EA4 001E8DA4 5A0D040C */  jal         memset
/* 0E8EA8 001E8DA8 00000000 */   nop
/* 0E8EAC 001E8DAC 22000010 */  b           .L001E8E38
/* 0E8EB0 001E8DB0 00000000 */   nop
.L001E8DB4:
/* 0E8EB4 001E8DB4 8494858F */  lw          $5, -0x6B7C($28)
/* 0E8EB8 001E8DB8 3C340400 */  dsll32      $6, $4, 16
/* 0E8EBC 001E8DBC 3F340600 */  dsra32      $6, $6, 16
/* 0E8EC0 001E8DC0 0A000224 */  addiu       $2, $0, 0xA
/* 0E8EC4 001E8DC4 1A00C200 */  div         $0, $6, $2
/* 0E8EC8 001E8DC8 02004014 */  bnez        $2, .L001E8DD4
/* 0E8ECC 001E8DCC 00000000 */   nop
/* 0E8ED0 001E8DD0 CD010000 */  break       0, 7
.L001E8DD4:
/* 0E8ED4 001E8DD4 12180000 */  mflo        $3
/* 0E8ED8 001E8DD8 A80A0224 */  addiu       $2, $0, 0xAA8
/* 0E8EDC 001E8DDC 18106200 */  mult        $2, $3, $2
/* 0E8EE0 001E8DE0 2110A200 */  addu        $2, $5, $2
/* 0E8EE4 001E8DE4 0C454424 */  addiu       $4, $2, 0x450C
/* 0E8EE8 001E8DE8 0A000224 */  addiu       $2, $0, 0xA
/* 0E8EEC 001E8DEC 1A00C200 */  div         $0, $6, $2
/* 0E8EF0 001E8DF0 00000000 */  nop
/* 0E8EF4 001E8DF4 00000000 */  nop
/* 0E8EF8 001E8DF8 10180000 */  mfhi        $3
/* 0E8EFC 001E8DFC 40110300 */  sll         $2, $3, 5
/* 0E8F00 001E8E00 23104300 */  subu        $2, $2, $3
/* 0E8F04 001E8E04 C0100200 */  sll         $2, $2, 3
/* 0E8F08 001E8E08 21A08200 */  addu        $20, $4, $2
/* 0E8F0C 001E8E0C 00009386 */  lh          $19, 0x0($20)
/* 0E8F10 001E8E10 9000A427 */  addiu       $4, $29, 0x90
/* 0E8F14 001E8E14 282E8072 */  paddub      $5, $20, $0
/* 0E8F18 001E8E18 F8000624 */  addiu       $6, $0, 0xF8
/* 0E8F1C 001E8E1C EC0C040C */  jal         memcpy
/* 0E8F20 001E8E20 00000000 */   nop
/* 0E8F24 001E8E24 28268072 */  paddub      $4, $20, $0
/* 0E8F28 001E8E28 282E0070 */  paddub      $5, $0, $0
/* 0E8F2C 001E8E2C F8000624 */  addiu       $6, $0, 0xF8
/* 0E8F30 001E8E30 5A0D040C */  jal         memset
/* 0E8F34 001E8E34 00000000 */   nop
.L001E8E38:
/* 0E8F38 001E8E38 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0E8F3C 001E8E3C E400248C */  lw          $4, %lo(ShopMenu + 0x14)($1)
/* 0E8F40 001E8E40 05000224 */  addiu       $2, $0, 0x5
/* 0E8F44 001E8E44 1A008200 */  div         $0, $4, $2
/* 0E8F48 001E8E48 02004014 */  bnez        $2, .L001E8E54
/* 0E8F4C 001E8E4C 00000000 */   nop
/* 0E8F50 001E8E50 CD010000 */  break       0, 7
.L001E8E54:
/* 0E8F54 001E8E54 12180000 */  mflo        $3
/* 0E8F58 001E8E58 D901013C */  lui         $1, %hi(ShopMenu + 0x20)
/* 0E8F5C 001E8E5C F000228C */  lw          $2, %lo(ShopMenu + 0x20)($1)
/* 0E8F60 001E8E60 23286200 */  subu        $5, $3, $2
/* 0E8F64 001E8E64 05000224 */  addiu       $2, $0, 0x5
/* 0E8F68 001E8E68 1A008200 */  div         $0, $4, $2
/* 0E8F6C 001E8E6C 00000000 */  nop
/* 0E8F70 001E8E70 00000000 */  nop
/* 0E8F74 001E8E74 10180000 */  mfhi        $3
/* 0E8F78 001E8E78 80100300 */  sll         $2, $3, 2
/* 0E8F7C 001E8E7C 21104300 */  addu        $2, $2, $3
/* 0E8F80 001E8E80 C0100200 */  sll         $2, $2, 3
/* 0E8F84 001E8E84 56014324 */  addiu       $3, $2, 0x156
/* 0E8F88 001E8E88 80100500 */  sll         $2, $5, 2
/* 0E8F8C 001E8E8C 21104500 */  addu        $2, $2, $5
/* 0E8F90 001E8E90 C0100200 */  sll         $2, $2, 3
/* 0E8F94 001E8E94 94004224 */  addiu       $2, $2, 0x94
/* 0E8F98 001E8E98 00008344 */  mtc1        $3, $f0
/* 0E8F9C 001E8E9C 00000000 */  nop
/* 0E8FA0 001E8EA0 20038046 */  cvt.s.w     $f12, $f0
/* 0E8FA4 001E8EA4 00008244 */  mtc1        $2, $f0
/* 0E8FA8 001E8EA8 00000000 */  nop
/* 0E8FAC 001E8EAC 60038046 */  cvt.s.w     $f13, $f0
/* 0E8FB0 001E8EB0 D901023C */  lui         $2, %hi(ShopDataMove)
/* 0E8FB4 001E8EB4 80024424 */  addiu       $4, $2, %lo(ShopDataMove)
/* 0E8FB8 001E8EB8 282E2072 */  paddub      $5, $17, $0
/* 0E8FBC 001E8EBC 28364072 */  paddub      $6, $18, $0
/* 0E8FC0 001E8EC0 283E6072 */  paddub      $7, $19, $0
/* 0E8FC4 001E8EC4 9000A827 */  addiu       $8, $29, 0x90
/* 0E8FC8 001E8EC8 01000924 */  addiu       $9, $0, 0x1
/* 0E8FCC 001E8ECC 4C9A070C */  jal         IconMoveTarSet__12ShopIconMoveFiiiP13MENU_ITEMDATAffi
/* 0E8FD0 001E8ED0 00000000 */   nop
/* 0E8FD4 001E8ED4 04004006 */  bltz        $18, .L001E8EE8
/* 0E8FD8 001E8ED8 00000000 */   nop
/* 0E8FDC 001E8EDC 1400422A */  slti        $2, $18, 0x14
/* 0E8FE0 001E8EE0 1A004014 */  bnez        $2, .L001E8F4C
/* 0E8FE4 001E8EE4 00000000 */   nop
.L001E8EE8:
/* 0E8FE8 001E8EE8 C4948587 */  lh          $5, -0x6B3C($28)
/* 0E8FEC 001E8EEC D901023C */  lui         $2, %hi(ShopDataMove)
/* 0E8FF0 001E8EF0 80024424 */  addiu       $4, $2, %lo(ShopDataMove)
/* 0E8FF4 001E8EF4 01000624 */  addiu       $6, $0, 0x1
/* 0E8FF8 001E8EF8 689A070C */  jal         IconAutoMove__12ShopIconMoveFii
/* 0E8FFC 001E8EFC 00000000 */   nop
/* 0E9000 001E8F00 FFFF0224 */  addiu       $2, $0, -0x1
/* 0E9004 001E8F04 D901013C */  lui         $1, %hi(ShopDataMove + 0x2)
/* 0E9008 001E8F08 820222A4 */  sh          $2, %lo(ShopDataMove + 0x2)($1)
/* 0E900C 001E8F0C D901013C */  lui         $1, %hi(ShopDataMove + 0x4)
/* 0E9010 001E8F10 840222A4 */  sh          $2, %lo(ShopDataMove + 0x4)($1)
/* 0E9014 001E8F14 D901013C */  lui         $1, %hi(ShopDataMove + 0x6)
/* 0E9018 001E8F18 860222A4 */  sh          $2, %lo(ShopDataMove + 0x6)($1)
/* 0E901C 001E8F1C D901013C */  lui         $1, %hi(ShopDataMove + 0x10)
/* 0E9020 001E8F20 900222A4 */  sh          $2, %lo(ShopDataMove + 0x10)($1)
/* 0E9024 001E8F24 D901013C */  lui         $1, %hi(ShopDataMove + 0xC)
/* 0E9028 001E8F28 8C0220AC */  sw          $0, %lo(ShopDataMove + 0xC)($1)
/* 0E902C 001E8F2C D901013C */  lui         $1, %hi(ShopDataMove + 0x8)
/* 0E9030 001E8F30 880220AC */  sw          $0, %lo(ShopDataMove + 0x8)($1)
/* 0E9034 001E8F34 D901023C */  lui         $2, %hi(ShopDataMove + 0x14)
/* 0E9038 001E8F38 94024424 */  addiu       $4, $2, %lo(ShopDataMove + 0x14)
/* 0E903C 001E8F3C 282E0070 */  paddub      $5, $0, $0
/* 0E9040 001E8F40 F8000624 */  addiu       $6, $0, 0xF8
/* 0E9044 001E8F44 5A0D040C */  jal         memset
/* 0E9048 001E8F48 00000000 */   nop
.L001E8F4C:
/* 0E904C 001E8F4C 28260070 */  paddub      $4, $0, $0
/* 0E9050 001E8F50 282E0070 */  paddub      $5, $0, $0
/* 0E9054 001E8F54 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0E9058 001E8F58 00000000 */   nop
/* 0E905C 001E8F5C 01000424 */  addiu       $4, $0, 0x1
/* 0E9060 001E8F60 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0E9064 001E8F64 00000000 */   nop
/* 0E9068 001E8F68 ED020010 */  b           .L001E9B20
/* 0E906C 001E8F6C 00000000 */   nop
.L001E8F70:
/* 0E9070 001E8F70 CC01023C */  lui         $2, %hi(GamePad)
/* 0E9074 001E8F74 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0E9078 001E8F78 50000524 */  addiu       $5, $0, 0x50
/* 0E907C 001E8F7C 1CAE040C */  jal         Down__8CGamePadFi
/* 0E9080 001E8F80 00000000 */   nop
/* 0E9084 001E8F84 A5004010 */  beqz        $2, .L001E921C
/* 0E9088 001E8F88 00000000 */   nop
/* 0E908C 001E8F8C D901013C */  lui         $1, %hi(ShopDataMove + 0x6)
/* 0E9090 001E8F90 86022284 */  lh          $2, %lo(ShopDataMove + 0x6)($1)
/* 0E9094 001E8F94 1A004004 */  bltz        $2, .L001E9000
/* 0E9098 001E8F98 00000000 */   nop
/* 0E909C 001E8F9C C4948587 */  lh          $5, -0x6B3C($28)
/* 0E90A0 001E8FA0 D901023C */  lui         $2, %hi(ShopDataMove)
/* 0E90A4 001E8FA4 80024424 */  addiu       $4, $2, %lo(ShopDataMove)
/* 0E90A8 001E8FA8 01000624 */  addiu       $6, $0, 0x1
/* 0E90AC 001E8FAC 689A070C */  jal         IconAutoMove__12ShopIconMoveFii
/* 0E90B0 001E8FB0 00000000 */   nop
/* 0E90B4 001E8FB4 FFFF0224 */  addiu       $2, $0, -0x1
/* 0E90B8 001E8FB8 D901013C */  lui         $1, %hi(ShopDataMove + 0x2)
/* 0E90BC 001E8FBC 820222A4 */  sh          $2, %lo(ShopDataMove + 0x2)($1)
/* 0E90C0 001E8FC0 D901013C */  lui         $1, %hi(ShopDataMove + 0x4)
/* 0E90C4 001E8FC4 840222A4 */  sh          $2, %lo(ShopDataMove + 0x4)($1)
/* 0E90C8 001E8FC8 D901013C */  lui         $1, %hi(ShopDataMove + 0x6)
/* 0E90CC 001E8FCC 860222A4 */  sh          $2, %lo(ShopDataMove + 0x6)($1)
/* 0E90D0 001E8FD0 D901013C */  lui         $1, %hi(ShopDataMove + 0x10)
/* 0E90D4 001E8FD4 900222A4 */  sh          $2, %lo(ShopDataMove + 0x10)($1)
/* 0E90D8 001E8FD8 D901013C */  lui         $1, %hi(ShopDataMove + 0xC)
/* 0E90DC 001E8FDC 8C0220AC */  sw          $0, %lo(ShopDataMove + 0xC)($1)
/* 0E90E0 001E8FE0 D901013C */  lui         $1, %hi(ShopDataMove + 0x8)
/* 0E90E4 001E8FE4 880220AC */  sw          $0, %lo(ShopDataMove + 0x8)($1)
/* 0E90E8 001E8FE8 D901023C */  lui         $2, %hi(ShopDataMove + 0x14)
/* 0E90EC 001E8FEC 94024424 */  addiu       $4, $2, %lo(ShopDataMove + 0x14)
/* 0E90F0 001E8FF0 282E0070 */  paddub      $5, $0, $0
/* 0E90F4 001E8FF4 F8000624 */  addiu       $6, $0, 0xF8
/* 0E90F8 001E8FF8 5A0D040C */  jal         memset
/* 0E90FC 001E8FFC 00000000 */   nop
.L001E9000:
/* 0E9100 001E9000 BC03A0A7 */  sh          $0, 0x3BC($29)
/* 0E9104 001E9004 9001A427 */  addiu       $4, $29, 0x190
/* 0E9108 001E9008 282E0070 */  paddub      $5, $0, $0
/* 0E910C 001E900C F8000624 */  addiu       $6, $0, 0xF8
/* 0E9110 001E9010 5A0D040C */  jal         memset
/* 0E9114 001E9014 00000000 */   nop
/* 0E9118 001E9018 D901013C */  lui         $1, %hi(ShopMenu + 0xC)
/* 0E911C 001E901C DC00238C */  lw          $3, %lo(ShopMenu + 0xC)($1)
/* 0E9120 001E9020 01000224 */  addiu       $2, $0, 0x1
/* 0E9124 001E9024 1E006210 */  beq         $3, $2, .L001E90A0
/* 0E9128 001E9028 00000000 */   nop
/* 0E912C 001E902C 02000224 */  addiu       $2, $0, 0x2
/* 0E9130 001E9030 11006210 */  beq         $3, $2, .L001E9078
/* 0E9134 001E9034 00000000 */   nop
/* 0E9138 001E9038 03006010 */  beqz        $3, .L001E9048
/* 0E913C 001E903C 00000000 */   nop
/* 0E9140 001E9040 1F000010 */  b           .L001E90C0
/* 0E9144 001E9044 00000000 */   nop
.L001E9048:
/* 0E9148 001E9048 BE03A0A7 */  sh          $0, 0x3BE($29)
/* 0E914C 001E904C 8C94848F */  lw          $4, -0x6B74($28)
/* 0E9150 001E9050 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0E9154 001E9054 E400258C */  lw          $5, %lo(ShopMenu + 0x14)($1)
/* 0E9158 001E9058 BC03A627 */  addiu       $6, $29, 0x3BC
/* 0E915C 001E905C BE03A727 */  addiu       $7, $29, 0x3BE
/* 0E9160 001E9060 B0FD080C */  jal         SetItemToPos__10CStockItemFiPsPs
/* 0E9164 001E9064 00000000 */   nop
/* 0E9168 001E9068 BE03A287 */  lh          $2, 0x3BE($29)
/* 0E916C 001E906C 9001A2AF */  sw          $2, 0x190($29)
/* 0E9170 001E9070 13000010 */  b           .L001E90C0
/* 0E9174 001E9074 00000000 */   nop
.L001E9078:
/* 0E9178 001E9078 8C94848F */  lw          $4, -0x6B74($28)
/* 0E917C 001E907C D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0E9180 001E9080 E400258C */  lw          $5, %lo(ShopMenu + 0x14)($1)
/* 0E9184 001E9084 9001A627 */  addiu       $6, $29, 0x190
/* 0E9188 001E9088 F4FD080C */  jal         SetAttachToPos__10CStockItemFiP11ATTACH_LIST
/* 0E918C 001E908C 00000000 */   nop
/* 0E9190 001E9090 9001A287 */  lh          $2, 0x190($29)
/* 0E9194 001E9094 BC03A2A7 */  sh          $2, 0x3BC($29)
/* 0E9198 001E9098 09000010 */  b           .L001E90C0
/* 0E919C 001E909C 00000000 */   nop
.L001E90A0:
/* 0E91A0 001E90A0 8C94848F */  lw          $4, -0x6B74($28)
/* 0E91A4 001E90A4 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0E91A8 001E90A8 E400258C */  lw          $5, %lo(ShopMenu + 0x14)($1)
/* 0E91AC 001E90AC 9001A627 */  addiu       $6, $29, 0x190
/* 0E91B0 001E90B0 C4FD080C */  jal         SetWepToPos__10CStockItemFiP11WEAPON_HAVE
/* 0E91B4 001E90B4 00000000 */   nop
/* 0E91B8 001E90B8 9001A287 */  lh          $2, 0x190($29)
/* 0E91BC 001E90BC BC03A2A7 */  sh          $2, 0x3BC($29)
.L001E90C0:
/* 0E91C0 001E90C0 BC03A487 */  lh          $4, 0x3BC($29)
/* 0E91C4 001E90C4 B803A527 */  addiu       $5, $29, 0x3B8
/* 0E91C8 001E90C8 70C5080C */  jal         GetBoardSpace__FiPi
/* 0E91CC 001E90CC 00000000 */   nop
/* 0E91D0 001E90D0 D901013C */  lui         $1, %hi(ShopMenu + 0x20)
/* 0E91D4 001E90D4 F000248C */  lw          $4, %lo(ShopMenu + 0x20)($1)
/* 0E91D8 001E90D8 80180400 */  sll         $3, $4, 2
/* 0E91DC 001E90DC 21186400 */  addu        $3, $3, $4
/* 0E91E0 001E90E0 23884300 */  subu        $17, $2, $3
/* 0E91E4 001E90E4 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0E91E8 001E90E8 E400258C */  lw          $5, %lo(ShopMenu + 0x14)($1)
/* 0E91EC 001E90EC 05000324 */  addiu       $3, $0, 0x5
/* 0E91F0 001E90F0 1A00A300 */  div         $0, $5, $3
/* 0E91F4 001E90F4 02006014 */  bnez        $3, .L001E9100
/* 0E91F8 001E90F8 00000000 */   nop
/* 0E91FC 001E90FC CD010000 */  break       0, 7
.L001E9100:
/* 0E9200 001E9100 12200000 */  mflo        $4
/* 0E9204 001E9104 D901013C */  lui         $1, %hi(ShopMenu + 0x176)
/* 0E9208 001E9108 46022390 */  lbu         $3, %lo(ShopMenu + 0x176)($1)
/* 0E920C 001E910C 23308300 */  subu        $6, $4, $3
/* 0E9210 001E9110 05000324 */  addiu       $3, $0, 0x5
/* 0E9214 001E9114 1A00A300 */  div         $0, $5, $3
/* 0E9218 001E9118 00000000 */  nop
/* 0E921C 001E911C 00000000 */  nop
/* 0E9220 001E9120 10200000 */  mfhi        $4
/* 0E9224 001E9124 80180400 */  sll         $3, $4, 2
/* 0E9228 001E9128 21186400 */  addu        $3, $3, $4
/* 0E922C 001E912C C0180300 */  sll         $3, $3, 3
/* 0E9230 001E9130 34006424 */  addiu       $4, $3, 0x34
/* 0E9234 001E9134 80180600 */  sll         $3, $6, 2
/* 0E9238 001E9138 21186600 */  addu        $3, $3, $6
/* 0E923C 001E913C C0180300 */  sll         $3, $3, 3
/* 0E9240 001E9140 94006324 */  addiu       $3, $3, 0x94
/* 0E9244 001E9144 00008444 */  mtc1        $4, $f0
/* 0E9248 001E9148 00000000 */  nop
/* 0E924C 001E914C 20038046 */  cvt.s.w     $f12, $f0
/* 0E9250 001E9150 00008344 */  mtc1        $3, $f0
/* 0E9254 001E9154 00000000 */  nop
/* 0E9258 001E9158 60038046 */  cvt.s.w     $f13, $f0
/* 0E925C 001E915C BC03A787 */  lh          $7, 0x3BC($29)
/* 0E9260 001E9160 D901033C */  lui         $3, %hi(ShopDataMove)
/* 0E9264 001E9164 80026424 */  addiu       $4, $3, %lo(ShopDataMove)
/* 0E9268 001E9168 282E4070 */  paddub      $5, $2, $0
/* 0E926C 001E916C 28362072 */  paddub      $6, $17, $0
/* 0E9270 001E9170 9001A827 */  addiu       $8, $29, 0x190
/* 0E9274 001E9174 284E0070 */  paddub      $9, $0, $0
/* 0E9278 001E9178 4C9A070C */  jal         IconMoveTarSet__12ShopIconMoveFiiiP13MENU_ITEMDATAffi
/* 0E927C 001E917C 00000000 */   nop
/* 0E9280 001E9180 04002006 */  bltz        $17, .L001E9194
/* 0E9284 001E9184 00000000 */   nop
/* 0E9288 001E9188 1400222A */  slti        $2, $17, 0x14
/* 0E928C 001E918C 1A004014 */  bnez        $2, .L001E91F8
/* 0E9290 001E9190 00000000 */   nop
.L001E9194:
/* 0E9294 001E9194 C4948587 */  lh          $5, -0x6B3C($28)
/* 0E9298 001E9198 D901023C */  lui         $2, %hi(ShopDataMove)
/* 0E929C 001E919C 80024424 */  addiu       $4, $2, %lo(ShopDataMove)
/* 0E92A0 001E91A0 01000624 */  addiu       $6, $0, 0x1
/* 0E92A4 001E91A4 689A070C */  jal         IconAutoMove__12ShopIconMoveFii
/* 0E92A8 001E91A8 00000000 */   nop
/* 0E92AC 001E91AC FFFF0224 */  addiu       $2, $0, -0x1
/* 0E92B0 001E91B0 D901013C */  lui         $1, %hi(ShopDataMove + 0x2)
/* 0E92B4 001E91B4 820222A4 */  sh          $2, %lo(ShopDataMove + 0x2)($1)
/* 0E92B8 001E91B8 D901013C */  lui         $1, %hi(ShopDataMove + 0x4)
/* 0E92BC 001E91BC 840222A4 */  sh          $2, %lo(ShopDataMove + 0x4)($1)
/* 0E92C0 001E91C0 D901013C */  lui         $1, %hi(ShopDataMove + 0x6)
/* 0E92C4 001E91C4 860222A4 */  sh          $2, %lo(ShopDataMove + 0x6)($1)
/* 0E92C8 001E91C8 D901013C */  lui         $1, %hi(ShopDataMove + 0x10)
/* 0E92CC 001E91CC 900222A4 */  sh          $2, %lo(ShopDataMove + 0x10)($1)
/* 0E92D0 001E91D0 D901013C */  lui         $1, %hi(ShopDataMove + 0xC)
/* 0E92D4 001E91D4 8C0220AC */  sw          $0, %lo(ShopDataMove + 0xC)($1)
/* 0E92D8 001E91D8 D901013C */  lui         $1, %hi(ShopDataMove + 0x8)
/* 0E92DC 001E91DC 880220AC */  sw          $0, %lo(ShopDataMove + 0x8)($1)
/* 0E92E0 001E91E0 D901023C */  lui         $2, %hi(ShopDataMove + 0x14)
/* 0E92E4 001E91E4 94024424 */  addiu       $4, $2, %lo(ShopDataMove + 0x14)
/* 0E92E8 001E91E8 282E0070 */  paddub      $5, $0, $0
/* 0E92EC 001E91EC F8000624 */  addiu       $6, $0, 0xF8
/* 0E92F0 001E91F0 5A0D040C */  jal         memset
/* 0E92F4 001E91F4 00000000 */   nop
.L001E91F8:
/* 0E92F8 001E91F8 28260070 */  paddub      $4, $0, $0
/* 0E92FC 001E91FC 282E0070 */  paddub      $5, $0, $0
/* 0E9300 001E9200 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0E9304 001E9204 00000000 */   nop
/* 0E9308 001E9208 01000424 */  addiu       $4, $0, 0x1
/* 0E930C 001E920C BCB3080C */  jal         ComMenuSePlay__Fi
/* 0E9310 001E9210 00000000 */   nop
/* 0E9314 001E9214 42020010 */  b           .L001E9B20
/* 0E9318 001E9218 00000000 */   nop
.L001E921C:
/* 0E931C 001E921C CC01023C */  lui         $2, %hi(GamePad)
/* 0E9320 001E9220 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0E9324 001E9224 20000524 */  addiu       $5, $0, 0x20
/* 0E9328 001E9228 1CAE040C */  jal         Down__8CGamePadFi
/* 0E932C 001E922C 00000000 */   nop
/* 0E9330 001E9230 3B024010 */  beqz        $2, .L001E9B20
/* 0E9334 001E9234 00000000 */   nop
/* 0E9338 001E9238 D901013C */  lui         $1, %hi(ShopMenu + 0x180)
/* 0E933C 001E923C 500220A4 */  sh          $0, %lo(ShopMenu + 0x180)($1)
/* 0E9340 001E9240 02000424 */  addiu       $4, $0, 0x2
/* 0E9344 001E9244 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0E9348 001E9248 00000000 */   nop
/* 0E934C 001E924C 34020010 */  b           .L001E9B20
/* 0E9350 001E9250 00000000 */   nop
.L001E9254:
/* 0E9354 001E9254 01000224 */  addiu       $2, $0, 0x1
/* 0E9358 001E9258 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16C4)
/* 0E935C 001E925C D45122AC */  sw          $2, %lo(CommonMenuMes3 + 0x16C4)($1)
/* 0E9360 001E9260 CC01023C */  lui         $2, %hi(GamePad)
/* 0E9364 001E9264 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0E9368 001E9268 60000524 */  addiu       $5, $0, 0x60
/* 0E936C 001E926C 1CAE040C */  jal         Down__8CGamePadFi
/* 0E9370 001E9270 00000000 */   nop
/* 0E9374 001E9274 2A024010 */  beqz        $2, .L001E9B20
/* 0E9378 001E9278 00000000 */   nop
/* 0E937C 001E927C 02000224 */  addiu       $2, $0, 0x2
/* 0E9380 001E9280 D901013C */  lui         $1, %hi(ShopMenu + 0x180)
/* 0E9384 001E9284 500222A4 */  sh          $2, %lo(ShopMenu + 0x180)($1)
/* 0E9388 001E9288 D901013C */  lui         $1, %hi(ShopMenu + 0x184)
/* 0E938C 001E928C 540220AC */  sw          $0, %lo(ShopMenu + 0x184)($1)
/* 0E9390 001E9290 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16C4)
/* 0E9394 001E9294 D45120AC */  sw          $0, %lo(CommonMenuMes3 + 0x16C4)($1)
/* 0E9398 001E9298 01000424 */  addiu       $4, $0, 0x1
/* 0E939C 001E929C BCB3080C */  jal         ComMenuSePlay__Fi
/* 0E93A0 001E92A0 00000000 */   nop
/* 0E93A4 001E92A4 1E020010 */  b           .L001E9B20
/* 0E93A8 001E92A8 00000000 */   nop
.L001E92AC:
/* 0E93AC 001E92AC DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16C4)
/* 0E93B0 001E92B0 D45120AC */  sw          $0, %lo(CommonMenuMes3 + 0x16C4)($1)
/* 0E93B4 001E92B4 CC01023C */  lui         $2, %hi(GamePad)
/* 0E93B8 001E92B8 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0E93BC 001E92BC 40000524 */  addiu       $5, $0, 0x40
/* 0E93C0 001E92C0 1CAE040C */  jal         Down__8CGamePadFi
/* 0E93C4 001E92C4 00000000 */   nop
/* 0E93C8 001E92C8 0C004010 */  beqz        $2, .L001E92FC
/* 0E93CC 001E92CC 00000000 */   nop
/* 0E93D0 001E92D0 28260070 */  paddub      $4, $0, $0
/* 0E93D4 001E92D4 282E0070 */  paddub      $5, $0, $0
/* 0E93D8 001E92D8 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0E93DC 001E92DC 00000000 */   nop
/* 0E93E0 001E92E0 01000424 */  addiu       $4, $0, 0x1
/* 0E93E4 001E92E4 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0E93E8 001E92E8 00000000 */   nop
/* 0E93EC 001E92EC DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16C4)
/* 0E93F0 001E92F0 D45120AC */  sw          $0, %lo(CommonMenuMes3 + 0x16C4)($1)
/* 0E93F4 001E92F4 0A020010 */  b           .L001E9B20
/* 0E93F8 001E92F8 00000000 */   nop
.L001E92FC:
/* 0E93FC 001E92FC CC01023C */  lui         $2, %hi(GamePad)
/* 0E9400 001E9300 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0E9404 001E9304 20000524 */  addiu       $5, $0, 0x20
/* 0E9408 001E9308 1CAE040C */  jal         Down__8CGamePadFi
/* 0E940C 001E930C 00000000 */   nop
/* 0E9410 001E9310 03024010 */  beqz        $2, .L001E9B20
/* 0E9414 001E9314 00000000 */   nop
/* 0E9418 001E9318 19000424 */  addiu       $4, $0, 0x19
/* 0E941C 001E931C 01000524 */  addiu       $5, $0, 0x1
/* 0E9420 001E9320 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0E9424 001E9324 00000000 */   nop
/* 0E9428 001E9328 02000424 */  addiu       $4, $0, 0x2
/* 0E942C 001E932C BCB3080C */  jal         ComMenuSePlay__Fi
/* 0E9430 001E9330 00000000 */   nop
/* 0E9434 001E9334 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16C4)
/* 0E9438 001E9338 D45120AC */  sw          $0, %lo(CommonMenuMes3 + 0x16C4)($1)
/* 0E943C 001E933C F8010010 */  b           .L001E9B20
/* 0E9440 001E9340 00000000 */   nop
.L001E9344:
/* 0E9444 001E9344 D901013C */  lui         $1, %hi(ShopMenu + 0x194)
/* 0E9448 001E9348 64022284 */  lh          $2, %lo(ShopMenu + 0x194)($1)
/* 0E944C 001E934C 08004014 */  bnez        $2, .L001E9370
/* 0E9450 001E9350 00000000 */   nop
/* 0E9454 001E9354 D901013C */  lui         $1, %hi(ShopMenu)
/* 0E9458 001E9358 D0002584 */  lh          $5, %lo(ShopMenu)($1)
/* 0E945C 001E935C 28260070 */  paddub      $4, $0, $0
/* 0E9460 001E9360 10A0070C */  jal         ShopPersonBuild__Fii
/* 0E9464 001E9364 00000000 */   nop
/* 0E9468 001E9368 D901013C */  lui         $1, %hi(ShopMenu + 0x194)
/* 0E946C 001E936C 640222A4 */  sh          $2, %lo(ShopMenu + 0x194)($1)
.L001E9370:
/* 0E9470 001E9370 D901013C */  lui         $1, %hi(ShopMenu + 0xC)
/* 0E9474 001E9374 DC00378C */  lw          $23, %lo(ShopMenu + 0xC)($1)
/* 0E9478 001E9378 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0E947C 001E937C E400368C */  lw          $22, %lo(ShopMenu + 0x14)($1)
/* 0E9480 001E9380 288E0070 */  paddub      $17, $0, $0
/* 0E9484 001E9384 D901013C */  lui         $1, %hi(ShopMenu + 0x2)
/* 0E9488 001E9388 D2002384 */  lh          $3, %lo(ShopMenu + 0x2)($1)
/* 0E948C 001E938C 01000224 */  addiu       $2, $0, 0x1
/* 0E9490 001E9390 0A006210 */  beq         $3, $2, .L001E93BC
/* 0E9494 001E9394 00000000 */   nop
/* 0E9498 001E9398 03006010 */  beqz        $3, .L001E93A8
/* 0E949C 001E939C 00000000 */   nop
/* 0E94A0 001E93A0 0F010010 */  b           .L001E97E0
/* 0E94A4 001E93A4 00000000 */   nop
.L001E93A8:
/* 0E94A8 001E93A8 B8A7070C */  jal         ChargeSelectKey__Fv
/* 0E94AC 001E93AC 00000000 */   nop
/* 0E94B0 001E93B0 288E4070 */  paddub      $17, $2, $0
/* 0E94B4 001E93B4 0A010010 */  b           .L001E97E0
/* 0E94B8 001E93B8 00000000 */   nop
.L001E93BC:
/* 0E94BC 001E93BC B894828F */  lw          $2, -0x6B48($28)
/* 0E94C0 001E93C0 10004284 */  lh          $2, 0x10($2)
/* 0E94C4 001E93C4 51004128 */  slti        $1, $2, 0x51
/* 0E94C8 001E93C8 07002010 */  beqz        $1, .L001E93E8
/* 0E94CC 001E93CC 00000000 */   nop
/* 0E94D0 001E93D0 6CBA080C */  jal         BoardModeChangeKey__Fv
/* 0E94D4 001E93D4 00000000 */   nop
/* 0E94D8 001E93D8 B8BA080C */  jal         PersonalBoardLimmitCheck__Fv
/* 0E94DC 001E93DC 00000000 */   nop
/* 0E94E0 001E93E0 88A1070C */  jal         ChargeShopLimmitCheck__Fv
/* 0E94E4 001E93E4 00000000 */   nop
.L001E93E8:
/* 0E94E8 001E93E8 20BB080C */  jal         PersonalBoardKeySub__Fv
/* 0E94EC 001E93EC 00000000 */   nop
/* 0E94F0 001E93F0 288E4070 */  paddub      $17, $2, $0
/* 0E94F4 001E93F4 4B002016 */  bnez        $17, .L001E9524
/* 0E94F8 001E93F8 00000000 */   nop
/* 0E94FC 001E93FC CC01023C */  lui         $2, %hi(GamePad)
/* 0E9500 001E9400 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0E9504 001E9404 40000524 */  addiu       $5, $0, 0x40
/* 0E9508 001E9408 1CAE040C */  jal         Down__8CGamePadFi
/* 0E950C 001E940C 00000000 */   nop
/* 0E9510 001E9410 44004010 */  beqz        $2, .L001E9524
/* 0E9514 001E9414 00000000 */   nop
/* 0E9518 001E9418 B894828F */  lw          $2, -0x6B48($28)
/* 0E951C 001E941C 10004484 */  lh          $4, 0x10($2)
/* 0E9520 001E9420 D901023C */  lui         $2, %hi(ShopMenu + 0x8)
/* 0E9524 001E9424 D8005224 */  addiu       $18, $2, %lo(ShopMenu + 0x8)
/* 0E9528 001E9428 0800438E */  lw          $3, 0x8($18)
/* 0E952C 001E942C 01000224 */  addiu       $2, $0, 0x1
/* 0E9530 001E9430 1E006210 */  beq         $3, $2, .L001E94AC
/* 0E9534 001E9434 00000000 */   nop
/* 0E9538 001E9438 02000224 */  addiu       $2, $0, 0x2
/* 0E953C 001E943C 03006210 */  beq         $3, $2, .L001E944C
/* 0E9540 001E9440 00000000 */   nop
/* 0E9544 001E9444 E6000010 */  b           .L001E97E0
/* 0E9548 001E9448 00000000 */   nop
.L001E944C:
/* 0E954C 001E944C 3C240400 */  dsll32      $4, $4, 16
/* 0E9550 001E9450 3F240400 */  dsra32      $4, $4, 16
/* 0E9554 001E9454 51008128 */  slti        $1, $4, 0x51
/* 0E9558 001E9458 06002010 */  beqz        $1, .L001E9474
/* 0E955C 001E945C 00000000 */   nop
/* 0E9560 001E9460 28264070 */  paddub      $4, $2, $0
/* 0E9564 001E9464 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0E9568 001E9468 00000000 */   nop
/* 0E956C 001E946C DC000010 */  b           .L001E97E0
/* 0E9570 001E9470 00000000 */   nop
.L001E9474:
/* 0E9574 001E9474 68C4080C */  jal         IsEnableTrushThrow__Fi
/* 0E9578 001E9478 00000000 */   nop
/* 0E957C 001E947C 06004010 */  beqz        $2, .L001E9498
/* 0E9580 001E9480 00000000 */   nop
/* 0E9584 001E9484 01000224 */  addiu       $2, $0, 0x1
/* 0E9588 001E9488 1C0042A6 */  sh          $2, 0x1C($18)
/* 0E958C 001E948C 200040AE */  sw          $0, 0x20($18)
/* 0E9590 001E9490 F49B070C */  jal         InitAllHaveData__Fv
/* 0E9594 001E9494 00000000 */   nop
.L001E9498:
/* 0E9598 001E9498 02000424 */  addiu       $4, $0, 0x2
/* 0E959C 001E949C BCB3080C */  jal         ComMenuSePlay__Fi
/* 0E95A0 001E94A0 00000000 */   nop
/* 0E95A4 001E94A4 CE000010 */  b           .L001E97E0
/* 0E95A8 001E94A8 00000000 */   nop
.L001E94AC:
/* 0E95AC 001E94AC D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0E95B0 001E94B0 E400248C */  lw          $4, %lo(ShopMenu + 0x14)($1)
/* 0E95B4 001E94B4 34BD080C */  jal         PersonalBoardItemGetorSwap__Fi
/* 0E95B8 001E94B8 00000000 */   nop
/* 0E95BC 001E94BC 14004010 */  beqz        $2, .L001E9510
/* 0E95C0 001E94C0 00000000 */   nop
/* 0E95C4 001E94C4 B894838F */  lw          $3, -0x6B48($28)
/* 0E95C8 001E94C8 10006284 */  lh          $2, 0x10($3)
/* 0E95CC 001E94CC 51004228 */  slti        $2, $2, 0x51
/* 0E95D0 001E94D0 05004014 */  bnez        $2, .L001E94E8
/* 0E95D4 001E94D4 00000000 */   nop
/* 0E95D8 001E94D8 01000224 */  addiu       $2, $0, 0x1
/* 0E95DC 001E94DC 000062AC */  sw          $2, 0x0($3)
/* 0E95E0 001E94E0 06000010 */  b           .L001E94FC
/* 0E95E4 001E94E4 00000000 */   nop
.L001E94E8:
/* 0E95E8 001E94E8 F49B070C */  jal         InitAllHaveData__Fv
/* 0E95EC 001E94EC 00000000 */   nop
/* 0E95F0 001E94F0 FFFF0224 */  addiu       $2, $0, -0x1
/* 0E95F4 001E94F4 D901013C */  lui         $1, %hi(ShopMenu + 0x164)
/* 0E95F8 001E94F8 340222AC */  sw          $2, %lo(ShopMenu + 0x164)($1)
.L001E94FC:
/* 0E95FC 001E94FC 01000424 */  addiu       $4, $0, 0x1
/* 0E9600 001E9500 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0E9604 001E9504 00000000 */   nop
/* 0E9608 001E9508 B5000010 */  b           .L001E97E0
/* 0E960C 001E950C 00000000 */   nop
.L001E9510:
/* 0E9610 001E9510 02000424 */  addiu       $4, $0, 0x2
/* 0E9614 001E9514 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0E9618 001E9518 00000000 */   nop
/* 0E961C 001E951C B0000010 */  b           .L001E97E0
/* 0E9620 001E9520 00000000 */   nop
.L001E9524:
/* 0E9624 001E9524 25002016 */  bnez        $17, .L001E95BC
/* 0E9628 001E9528 00000000 */   nop
/* 0E962C 001E952C CC01023C */  lui         $2, %hi(GamePad)
/* 0E9630 001E9530 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0E9634 001E9534 80000524 */  addiu       $5, $0, 0x80
/* 0E9638 001E9538 1CAE040C */  jal         Down__8CGamePadFi
/* 0E963C 001E953C 00000000 */   nop
/* 0E9640 001E9540 1E004010 */  beqz        $2, .L001E95BC
/* 0E9644 001E9544 00000000 */   nop
/* 0E9648 001E9548 D901013C */  lui         $1, %hi(ShopMenu + 0xC)
/* 0E964C 001E954C DC00238C */  lw          $3, %lo(ShopMenu + 0xC)($1)
/* 0E9650 001E9550 02000224 */  addiu       $2, $0, 0x2
/* 0E9654 001E9554 0F006210 */  beq         $3, $2, .L001E9594
/* 0E9658 001E9558 00000000 */   nop
/* 0E965C 001E955C 03006010 */  beqz        $3, .L001E956C
/* 0E9660 001E9560 00000000 */   nop
/* 0E9664 001E9564 10000010 */  b           .L001E95A8
/* 0E9668 001E9568 00000000 */   nop
.L001E956C:
/* 0E966C 001E956C 8494828F */  lw          $2, -0x6B7C($28)
/* 0E9670 001E9570 60434424 */  addiu       $4, $2, 0x4360
/* 0E9674 001E9574 90C6080C */  jal         SeitonItemBoard__FP9ITEM_PACK
/* 0E9678 001E9578 00000000 */   nop
/* 0E967C 001E957C 8494828F */  lw          $2, -0x6B7C($28)
/* 0E9680 001E9580 60434424 */  addiu       $4, $2, 0x4360
/* 0E9684 001E9584 98B9080C */  jal         SetMenuTrushMark__FP9ITEM_PACK
/* 0E9688 001E9588 00000000 */   nop
/* 0E968C 001E958C 06000010 */  b           .L001E95A8
/* 0E9690 001E9590 00000000 */   nop
.L001E9594:
/* 0E9694 001E9594 8494828F */  lw          $2, -0x6B7C($28)
/* 0E9698 001E9598 04054424 */  addiu       $4, $2, 0x504
/* 0E969C 001E959C F87F8424 */  addiu       $4, $4, 0x7FF8
/* 0E96A0 001E95A0 64C7080C */  jal         SeitonAttachBoard__FP11ATTACH_LIST
/* 0E96A4 001E95A4 00000000 */   nop
.L001E95A8:
/* 0E96A8 001E95A8 01000424 */  addiu       $4, $0, 0x1
/* 0E96AC 001E95AC BCB3080C */  jal         ComMenuSePlay__Fi
/* 0E96B0 001E95B0 00000000 */   nop
/* 0E96B4 001E95B4 8A000010 */  b           .L001E97E0
/* 0E96B8 001E95B8 00000000 */   nop
.L001E95BC:
/* 0E96BC 001E95BC 88002016 */  bnez        $17, .L001E97E0
/* 0E96C0 001E95C0 00000000 */   nop
/* 0E96C4 001E95C4 CC01023C */  lui         $2, %hi(GamePad)
/* 0E96C8 001E95C8 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0E96CC 001E95CC 10000524 */  addiu       $5, $0, 0x10
/* 0E96D0 001E95D0 1CAE040C */  jal         Down__8CGamePadFi
/* 0E96D4 001E95D4 00000000 */   nop
/* 0E96D8 001E95D8 81004010 */  beqz        $2, .L001E97E0
/* 0E96DC 001E95DC 00000000 */   nop
/* 0E96E0 001E95E0 01001224 */  addiu       $18, $0, 0x1
/* 0E96E4 001E95E4 D901013C */  lui         $1, %hi(ShopMenu + 0x10)
/* 0E96E8 001E95E8 E000228C */  lw          $2, %lo(ShopMenu + 0x10)($1)
/* 0E96EC 001E95EC 02000424 */  addiu       $4, $0, 0x2
/* 0E96F0 001E95F0 05004414 */  bne         $2, $4, .L001E9608
/* 0E96F4 001E95F4 00000000 */   nop
/* 0E96F8 001E95F8 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0E96FC 001E95FC 00000000 */   nop
/* 0E9700 001E9600 77000010 */  b           .L001E97E0
/* 0E9704 001E9604 00000000 */   nop
.L001E9608:
/* 0E9708 001E9608 B894828F */  lw          $2, -0x6B48($28)
/* 0E970C 001E960C 10004284 */  lh          $2, 0x10($2)
/* 0E9710 001E9610 51004228 */  slti        $2, $2, 0x51
/* 0E9714 001E9614 05004014 */  bnez        $2, .L001E962C
/* 0E9718 001E9618 00000000 */   nop
/* 0E971C 001E961C BCB3080C */  jal         ComMenuSePlay__Fi
/* 0E9720 001E9620 00000000 */   nop
/* 0E9724 001E9624 6E000010 */  b           .L001E97E0
/* 0E9728 001E9628 00000000 */   nop
.L001E962C:
/* 0E972C 001E962C D901013C */  lui         $1, %hi(ShopMenu + 0xC)
/* 0E9730 001E9630 DC00248C */  lw          $4, %lo(ShopMenu + 0xC)($1)
/* 0E9734 001E9634 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0E9738 001E9638 E400258C */  lw          $5, %lo(ShopMenu + 0x14)($1)
/* 0E973C 001E963C 38C5080C */  jal         SearchBoardNowPosItemExist__Fii
/* 0E9740 001E9640 00000000 */   nop
/* 0E9744 001E9644 3C9C0200 */  dsll32      $19, $2, 16
/* 0E9748 001E9648 3F9C1300 */  dsra32      $19, $19, 16
/* 0E974C 001E964C D901013C */  lui         $1, %hi(ShopMenu + 0xC)
/* 0E9750 001E9650 DC00238C */  lw          $3, %lo(ShopMenu + 0xC)($1)
/* 0E9754 001E9654 28164072 */  paddub      $2, $18, $0
/* 0E9758 001E9658 08006210 */  beq         $3, $2, .L001E967C
/* 0E975C 001E965C 00000000 */   nop
/* 0E9760 001E9660 02000224 */  addiu       $2, $0, 0x2
/* 0E9764 001E9664 2E006210 */  beq         $3, $2, .L001E9720
/* 0E9768 001E9668 00000000 */   nop
/* 0E976C 001E966C 2C006010 */  beqz        $3, .L001E9720
/* 0E9770 001E9670 00000000 */   nop
/* 0E9774 001E9674 2A000010 */  b           .L001E9720
/* 0E9778 001E9678 00000000 */   nop
.L001E967C:
/* 0E977C 001E967C 3CAC1300 */  dsll32      $21, $19, 16
/* 0E9780 001E9680 3FAC1500 */  dsra32      $21, $21, 16
/* 0E9784 001E9684 2826A072 */  paddub      $4, $21, $0
/* 0E9788 001E9688 A4C7080C */  jal         WhoIsWeaponEquip__Fi
/* 0E978C 001E968C 00000000 */   nop
/* 0E9790 001E9690 28A64070 */  paddub      $20, $2, $0
/* 0E9794 001E9694 0101A12A */  slti        $1, $21, 0x101
/* 0E9798 001E9698 06002010 */  beqz        $1, .L001E96B4
/* 0E979C 001E969C 00000000 */   nop
/* 0E97A0 001E96A0 02000424 */  addiu       $4, $0, 0x2
/* 0E97A4 001E96A4 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0E97A8 001E96A8 00000000 */   nop
/* 0E97AC 001E96AC 1C000010 */  b           .L001E9720
/* 0E97B0 001E96B0 00000000 */   nop
.L001E96B4:
/* 0E97B4 001E96B4 2826A072 */  paddub      $4, $21, $0
/* 0E97B8 001E96B8 70CF070C */  jal         IsDefaultWeapon__Fi
/* 0E97BC 001E96BC 00000000 */   nop
/* 0E97C0 001E96C0 06008216 */  bne         $20, $2, .L001E96DC
/* 0E97C4 001E96C4 00000000 */   nop
/* 0E97C8 001E96C8 07000424 */  addiu       $4, $0, 0x7
/* 0E97CC 001E96CC 282E4072 */  paddub      $5, $18, $0
/* 0E97D0 001E96D0 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0E97D4 001E96D4 00000000 */   nop
/* 0E97D8 001E96D8 28960070 */  paddub      $18, $0, $0
.L001E96DC:
/* 0E97DC 001E96DC 8494828F */  lw          $2, -0x6B7C($28)
/* 0E97E0 001E96E0 21108202 */  addu        $2, $20, $2
/* 0E97E4 001E96E4 40434480 */  lb          $4, 0x4340($2)
/* 0E97E8 001E96E8 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0E97EC 001E96EC E400238C */  lw          $3, %lo(ShopMenu + 0x14)($1)
/* 0E97F0 001E96F0 0A000224 */  addiu       $2, $0, 0xA
/* 0E97F4 001E96F4 1A006200 */  div         $0, $3, $2
/* 0E97F8 001E96F8 00000000 */  nop
/* 0E97FC 001E96FC 00000000 */  nop
/* 0E9800 001E9700 10100000 */  mfhi        $2
/* 0E9804 001E9704 06004414 */  bne         $2, $4, .L001E9720
/* 0E9808 001E9708 00000000 */   nop
/* 0E980C 001E970C 07000424 */  addiu       $4, $0, 0x7
/* 0E9810 001E9710 01000524 */  addiu       $5, $0, 0x1
/* 0E9814 001E9714 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0E9818 001E9718 00000000 */   nop
/* 0E981C 001E971C 28960070 */  paddub      $18, $0, $0
.L001E9720:
/* 0E9820 001E9720 0C004012 */  beqz        $18, .L001E9754
/* 0E9824 001E9724 00000000 */   nop
/* 0E9828 001E9728 3C241300 */  dsll32      $4, $19, 16
/* 0E982C 001E972C 3F240400 */  dsra32      $4, $4, 16
/* 0E9830 001E9730 109E070C */  jal         IsEnableCharge__Fi
/* 0E9834 001E9734 00000000 */   nop
/* 0E9838 001E9738 28964070 */  paddub      $18, $2, $0
/* 0E983C 001E973C 05004016 */  bnez        $18, .L001E9754
/* 0E9840 001E9740 00000000 */   nop
/* 0E9844 001E9744 07000424 */  addiu       $4, $0, 0x7
/* 0E9848 001E9748 01000524 */  addiu       $5, $0, 0x1
/* 0E984C 001E974C 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0E9850 001E9750 00000000 */   nop
.L001E9754:
/* 0E9854 001E9754 8C94848F */  lw          $4, -0x6B74($28)
/* 0E9858 001E9758 D901013C */  lui         $1, %hi(ShopMenu + 0xC)
/* 0E985C 001E975C DC00258C */  lw          $5, %lo(ShopMenu + 0xC)($1)
/* 0E9860 001E9760 E4FF080C */  jal         GetNowModeSpace__10CStockItemFi
/* 0E9864 001E9764 00000000 */   nop
/* 0E9868 001E9768 06004104 */  bgez        $2, .L001E9784
/* 0E986C 001E976C 00000000 */   nop
/* 0E9870 001E9770 28960070 */  paddub      $18, $0, $0
/* 0E9874 001E9774 08000424 */  addiu       $4, $0, 0x8
/* 0E9878 001E9778 01000524 */  addiu       $5, $0, 0x1
/* 0E987C 001E977C 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0E9880 001E9780 00000000 */   nop
.L001E9784:
/* 0E9884 001E9784 3C141300 */  dsll32      $2, $19, 16
/* 0E9888 001E9788 3F140200 */  dsra32      $2, $2, 16
/* 0E988C 001E978C 51004128 */  slti        $1, $2, 0x51
/* 0E9890 001E9790 06002010 */  beqz        $1, .L001E97AC
/* 0E9894 001E9794 00000000 */   nop
/* 0E9898 001E9798 28260070 */  paddub      $4, $0, $0
/* 0E989C 001E979C 282E0070 */  paddub      $5, $0, $0
/* 0E98A0 001E97A0 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0E98A4 001E97A4 00000000 */   nop
/* 0E98A8 001E97A8 28960070 */  paddub      $18, $0, $0
.L001E97AC:
/* 0E98AC 001E97AC 09004012 */  beqz        $18, .L001E97D4
/* 0E98B0 001E97B0 00000000 */   nop
/* 0E98B4 001E97B4 11000224 */  addiu       $2, $0, 0x11
/* 0E98B8 001E97B8 D901013C */  lui         $1, %hi(ShopMenu + 0x180)
/* 0E98BC 001E97BC 500222A4 */  sh          $2, %lo(ShopMenu + 0x180)($1)
/* 0E98C0 001E97C0 01000424 */  addiu       $4, $0, 0x1
/* 0E98C4 001E97C4 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0E98C8 001E97C8 00000000 */   nop
/* 0E98CC 001E97CC 04000010 */  b           .L001E97E0
/* 0E98D0 001E97D0 00000000 */   nop
.L001E97D4:
/* 0E98D4 001E97D4 02000424 */  addiu       $4, $0, 0x2
/* 0E98D8 001E97D8 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0E98DC 001E97DC 00000000 */   nop
.L001E97E0:
/* 0E98E0 001E97E0 CC01023C */  lui         $2, %hi(GamePad)
/* 0E98E4 001E97E4 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0E98E8 001E97E8 20000524 */  addiu       $5, $0, 0x20
/* 0E98EC 001E97EC 1CAE040C */  jal         Down__8CGamePadFi
/* 0E98F0 001E97F0 00000000 */   nop
/* 0E98F4 001E97F4 53004010 */  beqz        $2, .L001E9944
/* 0E98F8 001E97F8 00000000 */   nop
/* 0E98FC 001E97FC 02000424 */  addiu       $4, $0, 0x2
/* 0E9900 001E9800 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0E9904 001E9804 00000000 */   nop
/* 0E9908 001E9808 B894878F */  lw          $7, -0x6B48($28)
/* 0E990C 001E980C 1000E624 */  addiu       $6, $7, 0x10
/* 0E9910 001E9810 1000E284 */  lh          $2, 0x10($7)
/* 0E9914 001E9814 51004128 */  slti        $1, $2, 0x51
/* 0E9918 001E9818 07002010 */  beqz        $1, .L001E9838
/* 0E991C 001E981C 00000000 */   nop
/* 0E9920 001E9820 18000424 */  addiu       $4, $0, 0x18
/* 0E9924 001E9824 01000524 */  addiu       $5, $0, 0x1
/* 0E9928 001E9828 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0E992C 001E982C 00000000 */   nop
/* 0E9930 001E9830 44000010 */  b           .L001E9944
/* 0E9934 001E9834 00000000 */   nop
.L001E9838:
/* 0E9938 001E9838 0000E38C */  lw          $3, 0x0($7)
/* 0E993C 001E983C 0A006010 */  beqz        $3, .L001E9868
/* 0E9940 001E9840 00000000 */   nop
/* 0E9944 001E9844 01000224 */  addiu       $2, $0, 0x1
/* 0E9948 001E9848 03006210 */  beq         $3, $2, .L001E9858
/* 0E994C 001E984C 00000000 */   nop
/* 0E9950 001E9850 3C000010 */  b           .L001E9944
/* 0E9954 001E9854 00000000 */   nop
.L001E9858:
/* 0E9958 001E9858 54BD080C */  jal         PersonalBoardItemCancel__Fv
/* 0E995C 001E985C 00000000 */   nop
/* 0E9960 001E9860 38000010 */  b           .L001E9944
/* 0E9964 001E9864 00000000 */   nop
.L001E9868:
/* 0E9968 001E9868 0400E38C */  lw          $3, 0x4($7)
/* 0E996C 001E986C 02000224 */  addiu       $2, $0, 0x2
/* 0E9970 001E9870 1F006210 */  beq         $3, $2, .L001E98F0
/* 0E9974 001E9874 00000000 */   nop
/* 0E9978 001E9878 01000224 */  addiu       $2, $0, 0x1
/* 0E997C 001E987C 0C006210 */  beq         $3, $2, .L001E98B0
/* 0E9980 001E9880 00000000 */   nop
/* 0E9984 001E9884 03006010 */  beqz        $3, .L001E9894
/* 0E9988 001E9888 00000000 */   nop
/* 0E998C 001E988C 26000010 */  b           .L001E9928
/* 0E9990 001E9890 00000000 */   nop
.L001E9894:
/* 0E9994 001E9894 8C94848F */  lw          $4, -0x6B74($28)
/* 0E9998 001E9898 0C00E58C */  lw          $5, 0xC($7)
/* 0E999C 001E989C 1200E724 */  addiu       $7, $7, 0x12
/* 0E99A0 001E98A0 B0FD080C */  jal         SetItemToPos__10CStockItemFiPsPs
/* 0E99A4 001E98A4 00000000 */   nop
/* 0E99A8 001E98A8 1F000010 */  b           .L001E9928
/* 0E99AC 001E98AC 00000000 */   nop
.L001E98B0:
/* 0E99B0 001E98B0 8C94848F */  lw          $4, -0x6B74($28)
/* 0E99B4 001E98B4 0C00E58C */  lw          $5, 0xC($7)
/* 0E99B8 001E98B8 9002A627 */  addiu       $6, $29, 0x290
/* 0E99BC 001E98BC E4FD080C */  jal         GetWeaponInfo__10CStockItemFiP11WEAPON_HAVE
/* 0E99C0 001E98C0 00000000 */   nop
/* 0E99C4 001E98C4 9002B287 */  lh          $18, 0x290($29)
/* 0E99C8 001E98C8 B894828F */  lw          $2, -0x6B48($28)
/* 0E99CC 001E98CC 8C94848F */  lw          $4, -0x6B74($28)
/* 0E99D0 001E98D0 0C00458C */  lw          $5, 0xC($2)
/* 0E99D4 001E98D4 BC94868F */  lw          $6, -0x6B44($28)
/* 0E99D8 001E98D8 C4FD080C */  jal         SetWepToPos__10CStockItemFiP11WEAPON_HAVE
/* 0E99DC 001E98DC 00000000 */   nop
/* 0E99E0 001E98E0 B894828F */  lw          $2, -0x6B48($28)
/* 0E99E4 001E98E4 100052A4 */  sh          $18, 0x10($2)
/* 0E99E8 001E98E8 0F000010 */  b           .L001E9928
/* 0E99EC 001E98EC 00000000 */   nop
.L001E98F0:
/* 0E99F0 001E98F0 8C94848F */  lw          $4, -0x6B74($28)
/* 0E99F4 001E98F4 0C00E58C */  lw          $5, 0xC($7)
/* 0E99F8 001E98F8 9003A627 */  addiu       $6, $29, 0x390
/* 0E99FC 001E98FC 14FE080C */  jal         GetAttachInfo__10CStockItemFiP11ATTACH_LIST
/* 0E9A00 001E9900 00000000 */   nop
/* 0E9A04 001E9904 9003B287 */  lh          $18, 0x390($29)
/* 0E9A08 001E9908 B894828F */  lw          $2, -0x6B48($28)
/* 0E9A0C 001E990C 8C94848F */  lw          $4, -0x6B74($28)
/* 0E9A10 001E9910 0C00458C */  lw          $5, 0xC($2)
/* 0E9A14 001E9914 C094868F */  lw          $6, -0x6B40($28)
/* 0E9A18 001E9918 F4FD080C */  jal         SetAttachToPos__10CStockItemFiP11ATTACH_LIST
/* 0E9A1C 001E991C 00000000 */   nop
/* 0E9A20 001E9920 B894828F */  lw          $2, -0x6B48($28)
/* 0E9A24 001E9924 100052A4 */  sh          $18, 0x10($2)
.L001E9928:
/* 0E9A28 001E9928 B894828F */  lw          $2, -0x6B48($28)
/* 0E9A2C 001E992C 10004284 */  lh          $2, 0x10($2)
/* 0E9A30 001E9930 51004128 */  slti        $1, $2, 0x51
/* 0E9A34 001E9934 03002010 */  beqz        $1, .L001E9944
/* 0E9A38 001E9938 00000000 */   nop
/* 0E9A3C 001E993C F49B070C */  jal         InitAllHaveData__Fv
/* 0E9A40 001E9940 00000000 */   nop
.L001E9944:
/* 0E9A44 001E9944 01000224 */  addiu       $2, $0, 0x1
/* 0E9A48 001E9948 05002212 */  beq         $17, $2, .L001E9960
/* 0E9A4C 001E994C 00000000 */   nop
/* 0E9A50 001E9950 18002012 */  beqz        $17, .L001E99B4
/* 0E9A54 001E9954 00000000 */   nop
/* 0E9A58 001E9958 16000010 */  b           .L001E99B4
/* 0E9A5C 001E995C 00000000 */   nop
.L001E9960:
/* 0E9A60 001E9960 D901013C */  lui         $1, %hi(ShopMenu + 0x2)
/* 0E9A64 001E9964 D20020A4 */  sh          $0, %lo(ShopMenu + 0x2)($1)
/* 0E9A68 001E9968 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0E9A6C 001E996C E400238C */  lw          $3, %lo(ShopMenu + 0x14)($1)
/* 0E9A70 001E9970 05000224 */  addiu       $2, $0, 0x5
/* 0E9A74 001E9974 1A006200 */  div         $0, $3, $2
/* 0E9A78 001E9978 02004014 */  bnez        $2, .L001E9984
/* 0E9A7C 001E997C 00000000 */   nop
/* 0E9A80 001E9980 CD010000 */  break       0, 7
.L001E9984:
/* 0E9A84 001E9984 12180000 */  mflo        $3
/* 0E9A88 001E9988 D901013C */  lui         $1, %hi(ShopMenu + 0x20)
/* 0E9A8C 001E998C F000228C */  lw          $2, %lo(ShopMenu + 0x20)($1)
/* 0E9A90 001E9990 23186200 */  subu        $3, $3, $2
/* 0E9A94 001E9994 D901013C */  lui         $1, %hi(ShopMenu + 0x176)
/* 0E9A98 001E9998 46022290 */  lbu         $2, %lo(ShopMenu + 0x176)($1)
/* 0E9A9C 001E999C 21184300 */  addu        $3, $2, $3
/* 0E9AA0 001E99A0 80100300 */  sll         $2, $3, 2
/* 0E9AA4 001E99A4 21104300 */  addu        $2, $2, $3
/* 0E9AA8 001E99A8 04004224 */  addiu       $2, $2, 0x4
/* 0E9AAC 001E99AC D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0E9AB0 001E99B0 E40022AC */  sw          $2, %lo(ShopMenu + 0x14)($1)
.L001E99B4:
/* 0E9AB4 001E99B4 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0E9AB8 001E99B8 E400268C */  lw          $6, %lo(ShopMenu + 0x14)($1)
/* 0E9ABC 001E99BC 0500C616 */  bne         $22, $6, .L001E99D4
/* 0E9AC0 001E99C0 00000000 */   nop
/* 0E9AC4 001E99C4 D901013C */  lui         $1, %hi(ShopMenu + 0xC)
/* 0E9AC8 001E99C8 DC00228C */  lw          $2, %lo(ShopMenu + 0xC)($1)
/* 0E9ACC 001E99CC 5400E212 */  beq         $23, $2, .L001E9B20
/* 0E9AD0 001E99D0 00000000 */   nop
.L001E99D4:
/* 0E9AD4 001E99D4 D901013C */  lui         $1, %hi(ShopMenu + 0xC)
/* 0E9AD8 001E99D8 DC00228C */  lw          $2, %lo(ShopMenu + 0xC)($1)
/* 0E9ADC 001E99DC 40180200 */  sll         $3, $2, 1
/* 0E9AE0 001E99E0 00888227 */  addiu       $2, $28, -0x7800
/* 0E9AE4 001E99E4 21104300 */  addu        $2, $2, $3
/* 0E9AE8 001E99E8 00004384 */  lh          $3, 0x0($2)
/* 0E9AEC 001E99EC D901013C */  lui         $1, %hi(ShopMenu + 0x176)
/* 0E9AF0 001E99F0 46022490 */  lbu         $4, %lo(ShopMenu + 0x176)($1)
/* 0E9AF4 001E99F4 05000224 */  addiu       $2, $0, 0x5
/* 0E9AF8 001E99F8 1A006200 */  div         $0, $3, $2
/* 0E9AFC 001E99FC 02004014 */  bnez        $2, .L001E9A08
/* 0E9B00 001E9A00 00000000 */   nop
/* 0E9B04 001E9A04 CD010000 */  break       0, 7
.L001E9A08:
/* 0E9B08 001E9A08 12280000 */  mflo        $5
/* 0E9B0C 001E9A0C FCFFA224 */  addiu       $2, $5, -0x4
/* 0E9B10 001E9A10 02004104 */  bgez        $2, .L001E9A1C
/* 0E9B14 001E9A14 00000000 */   nop
/* 0E9B18 001E9A18 28160070 */  paddub      $2, $0, $0
.L001E9A1C:
/* 0E9B1C 001E9A1C 2A084400 */  slt         $1, $2, $4
/* 0E9B20 001E9A20 3C002010 */  beqz        $1, .L001E9B14
/* 0E9B24 001E9A24 00000000 */   nop
/* 0E9B28 001E9A28 05000224 */  addiu       $2, $0, 0x5
/* 0E9B2C 001E9A2C 1A00C200 */  div         $0, $6, $2
/* 0E9B30 001E9A30 02004014 */  bnez        $2, .L001E9A3C
/* 0E9B34 001E9A34 00000000 */   nop
/* 0E9B38 001E9A38 CD010000 */  break       0, 7
.L001E9A3C:
/* 0E9B3C 001E9A3C 12100000 */  mflo        $2
/* 0E9B40 001E9A40 FDFF4224 */  addiu       $2, $2, -0x3
/* 0E9B44 001E9A44 D901013C */  lui         $1, %hi(ShopMenu + 0x176)
/* 0E9B48 001E9A48 460222A0 */  sb          $2, %lo(ShopMenu + 0x176)($1)
/* 0E9B4C 001E9A4C D901013C */  lui         $1, %hi(ShopMenu + 0x176)
/* 0E9B50 001E9A50 46022290 */  lbu         $2, %lo(ShopMenu + 0x176)($1)
/* 0E9B54 001E9A54 03004104 */  bgez        $2, .L001E9A64
/* 0E9B58 001E9A58 00000000 */   nop
/* 0E9B5C 001E9A5C D901013C */  lui         $1, %hi(ShopMenu + 0x176)
/* 0E9B60 001E9A60 460220A0 */  sb          $0, %lo(ShopMenu + 0x176)($1)
.L001E9A64:
/* 0E9B64 001E9A64 D901013C */  lui         $1, %hi(ShopMenu + 0x176)
/* 0E9B68 001E9A68 46022390 */  lbu         $3, %lo(ShopMenu + 0x176)($1)
/* 0E9B6C 001E9A6C 80100300 */  sll         $2, $3, 2
/* 0E9B70 001E9A70 21104300 */  addu        $2, $2, $3
/* 0E9B74 001E9A74 C0180200 */  sll         $3, $2, 3
/* 0E9B78 001E9A78 8A000224 */  addiu       $2, $0, 0x8A
/* 0E9B7C 001E9A7C 23104300 */  subu        $2, $2, $3
/* 0E9B80 001E9A80 00008244 */  mtc1        $2, $f0
/* 0E9B84 001E9A84 00000000 */  nop
/* 0E9B88 001E9A88 20008046 */  cvt.s.w     $f0, $f0
/* 0E9B8C 001E9A8C D901013C */  lui         $1, %hi(ShopMenu + 0x16C)
/* 0E9B90 001E9A90 3C0220E4 */  swc1        $f0, %lo(ShopMenu + 0x16C)($1)
/* 0E9B94 001E9A94 0200A01C */  bgtz        $5, .L001E9AA0
/* 0E9B98 001E9A98 00000000 */   nop
/* 0E9B9C 001E9A9C 04000524 */  addiu       $5, $0, 0x4
.L001E9AA0:
/* 0E9BA0 001E9AA0 E442023C */  lui         $2, (0x42E40000 >> 16)
/* 0E9BA4 001E9AA4 00088244 */  mtc1        $2, $f1
/* 0E9BA8 001E9AA8 D901013C */  lui         $1, %hi(ShopMenu + 0x176)
/* 0E9BAC 001E9AAC 46022290 */  lbu         $2, %lo(ShopMenu + 0x176)($1)
/* 0E9BB0 001E9AB0 06004004 */  bltz        $2, .L001E9ACC
/* 0E9BB4 001E9AB4 00000000 */   nop
/* 0E9BB8 001E9AB8 00008244 */  mtc1        $2, $f0
/* 0E9BBC 001E9ABC 00000000 */  nop
/* 0E9BC0 001E9AC0 20008046 */  cvt.s.w     $f0, $f0
/* 0E9BC4 001E9AC4 08000010 */  b           .L001E9AE8
/* 0E9BC8 001E9AC8 00000000 */   nop
.L001E9ACC:
/* 0E9BCC 001E9ACC 42180200 */  srl         $3, $2, 1
/* 0E9BD0 001E9AD0 01004230 */  andi        $2, $2, 0x1
/* 0E9BD4 001E9AD4 25186200 */  or          $3, $3, $2
/* 0E9BD8 001E9AD8 00008344 */  mtc1        $3, $f0
/* 0E9BDC 001E9ADC 00000000 */  nop
/* 0E9BE0 001E9AE0 20008046 */  cvt.s.w     $f0, $f0
/* 0E9BE4 001E9AE4 00000046 */  add.s       $f0, $f0, $f0
.L001E9AE8:
/* 0E9BE8 001E9AE8 42080046 */  mul.s       $f1, $f1, $f0
/* 0E9BEC 001E9AEC 00008544 */  mtc1        $5, $f0
/* 0E9BF0 001E9AF0 00000000 */  nop
/* 0E9BF4 001E9AF4 20008046 */  cvt.s.w     $f0, $f0
/* 0E9BF8 001E9AF8 43080046 */  div.s       $f1, $f1, $f0
/* 0E9BFC 001E9AFC 0E43023C */  lui         $2, (0x430E0000 >> 16)
/* 0E9C00 001E9B00 00008244 */  mtc1        $2, $f0
/* 0E9C04 001E9B04 00000000 */  nop
/* 0E9C08 001E9B08 00000146 */  add.s       $f0, $f0, $f1
/* 0E9C0C 001E9B0C D901013C */  lui         $1, %hi(ShopMenu + 0x170)
/* 0E9C10 001E9B10 400220E4 */  swc1        $f0, %lo(ShopMenu + 0x170)($1)
.L001E9B14:
/* 0E9C14 001E9B14 28260070 */  paddub      $4, $0, $0
/* 0E9C18 001E9B18 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0E9C1C 001E9B1C 00000000 */   nop
.L001E9B20:
/* 0E9C20 001E9B20 288E0070 */  paddub      $17, $0, $0
/* 0E9C24 001E9B24 28960070 */  paddub      $18, $0, $0
/* 0E9C28 001E9B28 289E0070 */  paddub      $19, $0, $0
/* 0E9C2C 001E9B2C FFFF1424 */  addiu       $20, $0, -0x1
/* 0E9C30 001E9B30 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0E9C34 001E9B34 E400358C */  lw          $21, %lo(ShopMenu + 0x14)($1)
/* 0E9C38 001E9B38 B894828F */  lw          $2, -0x6B48($28)
/* 0E9C3C 001E9B3C 10004484 */  lh          $4, 0x10($2)
/* 0E9C40 001E9B40 51008228 */  slti        $2, $4, 0x51
/* 0E9C44 001E9B44 16004014 */  bnez        $2, .L001E9BA0
/* 0E9C48 001E9B48 00000000 */   nop
/* 0E9C4C 001E9B4C 28968070 */  paddub      $18, $4, $0
/* 0E9C50 001E9B50 7443070C */  jal         GetCommonItemInfo__Fi
/* 0E9C54 001E9B54 00000000 */   nop
/* 0E9C58 001E9B58 05004010 */  beqz        $2, .L001E9B70
/* 0E9C5C 001E9B5C 00000000 */   nop
/* 0E9C60 001E9B60 06004284 */  lh          $2, 0x6($2)
/* 0E9C64 001E9B64 F4015124 */  addiu       $17, $2, 0x1F4
/* 0E9C68 001E9B68 01000010 */  b           .L001E9B70
/* 0E9C6C 001E9B6C 00000000 */   nop
.L001E9B70:
/* 0E9C70 001E9B70 C094848F */  lw          $4, -0x6B40($28)
/* 0E9C74 001E9B74 2C98080C */  jal         GetAttachVolumeForMsg__FP11ATTACH_LIST
/* 0E9C78 001E9B78 00000000 */   nop
/* 0E9C7C 001E9B7C 289E4070 */  paddub      $19, $2, $0
/* 0E9C80 001E9B80 B894828F */  lw          $2, -0x6B48($28)
/* 0E9C84 001E9B84 10004384 */  lh          $3, 0x10($2)
/* 0E9C88 001E9B88 5A000224 */  addiu       $2, $0, 0x5A
/* 0E9C8C 001E9B8C 04006214 */  bne         $3, $2, .L001E9BA0
/* 0E9C90 001E9B90 00000000 */   nop
/* 0E9C94 001E9B94 C094828F */  lw          $2, -0x6B40($28)
/* 0E9C98 001E9B98 02004284 */  lh          $2, 0x2($2)
/* 0E9C9C 001E9B9C 64005424 */  addiu       $20, $2, 0x64
.L001E9BA0:
/* 0E9CA0 001E9BA0 D901013C */  lui         $1, %hi(ShopMenu + 0x2)
/* 0E9CA4 001E9BA4 D2002284 */  lh          $2, %lo(ShopMenu + 0x2)($1)
/* 0E9CA8 001E9BA8 01000424 */  addiu       $4, $0, 0x1
/* 0E9CAC 001E9BAC 41004410 */  beq         $2, $4, .L001E9CB4
/* 0E9CB0 001E9BB0 00000000 */   nop
/* 0E9CB4 001E9BB4 03004010 */  beqz        $2, .L001E9BC4
/* 0E9CB8 001E9BB8 00000000 */   nop
/* 0E9CBC 001E9BBC 8F000010 */  b           .L001E9DFC
/* 0E9CC0 001E9BC0 00000000 */   nop
.L001E9BC4:
/* 0E9CC4 001E9BC4 D901013C */  lui         $1, %hi(ShopMenu + 0xC)
/* 0E9CC8 001E9BC8 DC00238C */  lw          $3, %lo(ShopMenu + 0xC)($1)
/* 0E9CCC 001E9BCC 02000224 */  addiu       $2, $0, 0x2
/* 0E9CD0 001E9BD0 23006210 */  beq         $3, $2, .L001E9C60
/* 0E9CD4 001E9BD4 00000000 */   nop
/* 0E9CD8 001E9BD8 0B006410 */  beq         $3, $4, .L001E9C08
/* 0E9CDC 001E9BDC 00000000 */   nop
/* 0E9CE0 001E9BE0 03006010 */  beqz        $3, .L001E9BF0
/* 0E9CE4 001E9BE4 00000000 */   nop
/* 0E9CE8 001E9BE8 84000010 */  b           .L001E9DFC
/* 0E9CEC 001E9BEC 00000000 */   nop
.L001E9BF0:
/* 0E9CF0 001E9BF0 40181500 */  sll         $3, $21, 1
/* 0E9CF4 001E9BF4 8C94828F */  lw          $2, -0x6B74($28)
/* 0E9CF8 001E9BF8 21104300 */  addu        $2, $2, $3
/* 0E9CFC 001E9BFC 00005284 */  lh          $18, 0x0($2)
/* 0E9D00 001E9C00 7E000010 */  b           .L001E9DFC
/* 0E9D04 001E9C04 00000000 */   nop
.L001E9C08:
/* 0E9D08 001E9C08 8C94838F */  lw          $3, -0x6B74($28)
/* 0E9D0C 001E9C0C 40111500 */  sll         $2, $21, 5
/* 0E9D10 001E9C10 23105500 */  subu        $2, $2, $21
/* 0E9D14 001E9C14 C0A80200 */  sll         $21, $2, 3
/* 0E9D18 001E9C18 2110A302 */  addu        $2, $21, $3
/* 0E9D1C 001E9C1C F0004484 */  lh          $4, 0xF0($2)
/* 0E9D20 001E9C20 7443070C */  jal         GetCommonItemInfo__Fi
/* 0E9D24 001E9C24 00000000 */   nop
/* 0E9D28 001E9C28 04004010 */  beqz        $2, .L001E9C3C
/* 0E9D2C 001E9C2C 00000000 */   nop
/* 0E9D30 001E9C30 06005284 */  lh          $18, 0x6($2)
/* 0E9D34 001E9C34 02000010 */  b           .L001E9C40
/* 0E9D38 001E9C38 00000000 */   nop
.L001E9C3C:
/* 0E9D3C 001E9C3C FFFF1224 */  addiu       $18, $0, -0x1
.L001E9C40:
/* 0E9D40 001E9C40 0101422A */  slti        $2, $18, 0x101
/* 0E9D44 001E9C44 6D004014 */  bnez        $2, .L001E9DFC
/* 0E9D48 001E9C48 00000000 */   nop
/* 0E9D4C 001E9C4C 8C94828F */  lw          $2, -0x6B74($28)
/* 0E9D50 001E9C50 2110A202 */  addu        $2, $21, $2
/* 0E9D54 001E9C54 F2005384 */  lh          $19, 0xF2($2)
/* 0E9D58 001E9C58 68000010 */  b           .L001E9DFC
/* 0E9D5C 001E9C5C 00000000 */   nop
.L001E9C60:
/* 0E9D60 001E9C60 8C94828F */  lw          $2, -0x6B74($28)
/* 0E9D64 001E9C64 40A91500 */  sll         $21, $21, 5
/* 0E9D68 001E9C68 2118A202 */  addu        $3, $21, $2
/* 0E9D6C 001E9C6C 001E7284 */  lh          $18, 0x1E00($3)
/* 0E9D70 001E9C70 5100422A */  slti        $2, $18, 0x51
/* 0E9D74 001E9C74 61004014 */  bnez        $2, .L001E9DFC
/* 0E9D78 001E9C78 00000000 */   nop
/* 0E9D7C 001E9C7C F4015126 */  addiu       $17, $18, 0x1F4
/* 0E9D80 001E9C80 001E6424 */  addiu       $4, $3, 0x1E00
/* 0E9D84 001E9C84 2C98080C */  jal         GetAttachVolumeForMsg__FP11ATTACH_LIST
/* 0E9D88 001E9C88 00000000 */   nop
/* 0E9D8C 001E9C8C 289E4070 */  paddub      $19, $2, $0
/* 0E9D90 001E9C90 5A000224 */  addiu       $2, $0, 0x5A
/* 0E9D94 001E9C94 59004216 */  bne         $18, $2, .L001E9DFC
/* 0E9D98 001E9C98 00000000 */   nop
/* 0E9D9C 001E9C9C 8C94828F */  lw          $2, -0x6B74($28)
/* 0E9DA0 001E9CA0 2110A202 */  addu        $2, $21, $2
/* 0E9DA4 001E9CA4 021E4284 */  lh          $2, 0x1E02($2)
/* 0E9DA8 001E9CA8 64005424 */  addiu       $20, $2, 0x64
/* 0E9DAC 001E9CAC 53000010 */  b           .L001E9DFC
/* 0E9DB0 001E9CB0 00000000 */   nop
.L001E9CB4:
/* 0E9DB4 001E9CB4 D901013C */  lui         $1, %hi(ShopMenu + 0xC)
/* 0E9DB8 001E9CB8 DC00238C */  lw          $3, %lo(ShopMenu + 0xC)($1)
/* 0E9DBC 001E9CBC 02000224 */  addiu       $2, $0, 0x2
/* 0E9DC0 001E9CC0 35006210 */  beq         $3, $2, .L001E9D98
/* 0E9DC4 001E9CC4 00000000 */   nop
/* 0E9DC8 001E9CC8 10006410 */  beq         $3, $4, .L001E9D0C
/* 0E9DCC 001E9CCC 00000000 */   nop
/* 0E9DD0 001E9CD0 03006010 */  beqz        $3, .L001E9CE0
/* 0E9DD4 001E9CD4 00000000 */   nop
/* 0E9DD8 001E9CD8 42000010 */  b           .L001E9DE4
/* 0E9DDC 001E9CDC 00000000 */   nop
.L001E9CE0:
/* 0E9DE0 001E9CE0 8494828F */  lw          $2, -0x6B7C($28)
/* 0E9DE4 001E9CE4 60434324 */  addiu       $3, $2, 0x4360
/* 0E9DE8 001E9CE8 40101500 */  sll         $2, $21, 1
/* 0E9DEC 001E9CEC 21104300 */  addu        $2, $2, $3
/* 0E9DF0 001E9CF0 0E005284 */  lh          $18, 0xE($2)
/* 0E9DF4 001E9CF4 8400422A */  slti        $2, $18, 0x84
/* 0E9DF8 001E9CF8 3A004014 */  bnez        $2, .L001E9DE4
/* 0E9DFC 001E9CFC 00000000 */   nop
/* 0E9E00 001E9D00 F4015126 */  addiu       $17, $18, 0x1F4
/* 0E9E04 001E9D04 37000010 */  b           .L001E9DE4
/* 0E9E08 001E9D08 00000000 */   nop
.L001E9D0C:
/* 0E9E0C 001E9D0C 8494848F */  lw          $4, -0x6B7C($28)
/* 0E9E10 001E9D10 0A000224 */  addiu       $2, $0, 0xA
/* 0E9E14 001E9D14 1A00A202 */  div         $0, $21, $2
/* 0E9E18 001E9D18 02004014 */  bnez        $2, .L001E9D24
/* 0E9E1C 001E9D1C 00000000 */   nop
/* 0E9E20 001E9D20 CD010000 */  break       0, 7
.L001E9D24:
/* 0E9E24 001E9D24 12180000 */  mflo        $3
/* 0E9E28 001E9D28 A80A0224 */  addiu       $2, $0, 0xAA8
/* 0E9E2C 001E9D2C 18106200 */  mult        $2, $3, $2
/* 0E9E30 001E9D30 21108200 */  addu        $2, $4, $2
/* 0E9E34 001E9D34 0C454424 */  addiu       $4, $2, 0x450C
/* 0E9E38 001E9D38 0A000224 */  addiu       $2, $0, 0xA
/* 0E9E3C 001E9D3C 1A00A202 */  div         $0, $21, $2
/* 0E9E40 001E9D40 00000000 */  nop
/* 0E9E44 001E9D44 00000000 */  nop
/* 0E9E48 001E9D48 10180000 */  mfhi        $3
/* 0E9E4C 001E9D4C 40110300 */  sll         $2, $3, 5
/* 0E9E50 001E9D50 23104300 */  subu        $2, $2, $3
/* 0E9E54 001E9D54 C0100200 */  sll         $2, $2, 3
/* 0E9E58 001E9D58 21A88200 */  addu        $21, $4, $2
/* 0E9E5C 001E9D5C 0000A486 */  lh          $4, 0x0($21)
/* 0E9E60 001E9D60 7443070C */  jal         GetCommonItemInfo__Fi
/* 0E9E64 001E9D64 00000000 */   nop
/* 0E9E68 001E9D68 04004010 */  beqz        $2, .L001E9D7C
/* 0E9E6C 001E9D6C 00000000 */   nop
/* 0E9E70 001E9D70 06005284 */  lh          $18, 0x6($2)
/* 0E9E74 001E9D74 02000010 */  b           .L001E9D80
/* 0E9E78 001E9D78 00000000 */   nop
.L001E9D7C:
/* 0E9E7C 001E9D7C FFFF1224 */  addiu       $18, $0, -0x1
.L001E9D80:
/* 0E9E80 001E9D80 18004006 */  bltz        $18, .L001E9DE4
/* 0E9E84 001E9D84 00000000 */   nop
/* 0E9E88 001E9D88 F4015126 */  addiu       $17, $18, 0x1F4
/* 0E9E8C 001E9D8C 0200B386 */  lh          $19, 0x2($21)
/* 0E9E90 001E9D90 14000010 */  b           .L001E9DE4
/* 0E9E94 001E9D94 00000000 */   nop
.L001E9D98:
/* 0E9E98 001E9D98 8494828F */  lw          $2, -0x6B7C($28)
/* 0E9E9C 001E9D9C 04054324 */  addiu       $3, $2, 0x504
/* 0E9EA0 001E9DA0 F87F6324 */  addiu       $3, $3, 0x7FF8
/* 0E9EA4 001E9DA4 40111500 */  sll         $2, $21, 5
/* 0E9EA8 001E9DA8 21A86200 */  addu        $21, $3, $2
/* 0E9EAC 001E9DAC 0000B286 */  lh          $18, 0x0($21)
/* 0E9EB0 001E9DB0 5100422A */  slti        $2, $18, 0x51
/* 0E9EB4 001E9DB4 0B004014 */  bnez        $2, .L001E9DE4
/* 0E9EB8 001E9DB8 00000000 */   nop
/* 0E9EBC 001E9DBC F4015126 */  addiu       $17, $18, 0x1F4
/* 0E9EC0 001E9DC0 2826A072 */  paddub      $4, $21, $0
/* 0E9EC4 001E9DC4 2C98080C */  jal         GetAttachVolumeForMsg__FP11ATTACH_LIST
/* 0E9EC8 001E9DC8 00000000 */   nop
/* 0E9ECC 001E9DCC 289E4070 */  paddub      $19, $2, $0
/* 0E9ED0 001E9DD0 5A000224 */  addiu       $2, $0, 0x5A
/* 0E9ED4 001E9DD4 03004216 */  bne         $18, $2, .L001E9DE4
/* 0E9ED8 001E9DD8 00000000 */   nop
/* 0E9EDC 001E9DDC 0200A286 */  lh          $2, 0x2($21)
/* 0E9EE0 001E9DE0 64005424 */  addiu       $20, $2, 0x64
.L001E9DE4:
/* 0E9EE4 001E9DE4 D901013C */  lui         $1, %hi(ShopMenu + 0x10)
/* 0E9EE8 001E9DE8 E000238C */  lw          $3, %lo(ShopMenu + 0x10)($1)
/* 0E9EEC 001E9DEC 02000224 */  addiu       $2, $0, 0x2
/* 0E9EF0 001E9DF0 02006214 */  bne         $3, $2, .L001E9DFC
/* 0E9EF4 001E9DF4 00000000 */   nop
/* 0E9EF8 001E9DF8 E8031124 */  addiu       $17, $0, 0x3E8
.L001E9DFC:
/* 0E9EFC 001E9DFC 0200401A */  blez        $18, .L001E9E08
/* 0E9F00 001E9E00 00000000 */   nop
/* 0E9F04 001E9E04 F4015126 */  addiu       $17, $18, 0x1F4
.L001E9E08:
/* 0E9F08 001E9E08 DA01013C */  lui         $1, %hi(CommonMenuMes2 + 0x16BC)
/* 0E9F0C 001E9E0C 0C3A228C */  lw          $2, %lo(CommonMenuMes2 + 0x16BC)($1)
/* 0E9F10 001E9E10 0B005114 */  bne         $2, $17, .L001E9E40
/* 0E9F14 001E9E14 00000000 */   nop
/* 0E9F18 001E9E18 0500801A */  blez        $20, .L001E9E30
/* 0E9F1C 001E9E1C 00000000 */   nop
/* 0E9F20 001E9E20 DA01013C */  lui         $1, %hi(CommonMenuMes2 + 0x16E0)
/* 0E9F24 001E9E24 303A228C */  lw          $2, %lo(CommonMenuMes2 + 0x16E0)($1)
/* 0E9F28 001E9E28 05005414 */  bne         $2, $20, .L001E9E40
/* 0E9F2C 001E9E2C 00000000 */   nop
.L001E9E30:
/* 0E9F30 001E9E30 DA01013C */  lui         $1, %hi(CommonMenuMes2 + 0x1728)
/* 0E9F34 001E9E34 783A228C */  lw          $2, %lo(CommonMenuMes2 + 0x1728)($1)
/* 0E9F38 001E9E38 1B005310 */  beq         $2, $19, .L001E9EA8
/* 0E9F3C 001E9E3C 00000000 */   nop
.L001E9E40:
/* 0E9F40 001E9E40 01000224 */  addiu       $2, $0, 0x1
/* 0E9F44 001E9E44 DA01013C */  lui         $1, %hi(CommonMenuMes2 + 0x172C)
/* 0E9F48 001E9E48 7C3A22AC */  sw          $2, %lo(CommonMenuMes2 + 0x172C)($1)
/* 0E9F4C 001E9E4C DA01013C */  lui         $1, %hi(CommonMenuMes2 + 0x1728)
/* 0E9F50 001E9E50 783A33AC */  sw          $19, %lo(CommonMenuMes2 + 0x1728)($1)
/* 0E9F54 001E9E54 0300801A */  blez        $20, .L001E9E64
/* 0E9F58 001E9E58 00000000 */   nop
/* 0E9F5C 001E9E5C DA01013C */  lui         $1, %hi(CommonMenuMes2 + 0x16E0)
/* 0E9F60 001E9E60 303A34AC */  sw          $20, %lo(CommonMenuMes2 + 0x16E0)($1)
.L001E9E64:
/* 0E9F64 001E9E64 F501212A */  slti        $1, $17, 0x1F5
/* 0E9F68 001E9E68 02002010 */  beqz        $1, .L001E9E74
/* 0E9F6C 001E9E6C 00000000 */   nop
/* 0E9F70 001E9E70 288E0070 */  paddub      $17, $0, $0
.L001E9E74:
/* 0E9F74 001E9E74 2A00023C */  lui         $2, %hi(LIT_1181)
/* 0E9F78 001E9E78 48D24424 */  addiu       $4, $2, %lo(LIT_1181)
/* 0E9F7C 001E9E7C 282E2072 */  paddub      $5, $17, $0
/* 0E9F80 001E9E80 A611040C */  jal         printf
/* 0E9F84 001E9E84 00000000 */   nop
/* 0E9F88 001E9E88 FFFF0224 */  addiu       $2, $0, -0x1
/* 0E9F8C 001E9E8C DA01013C */  lui         $1, %hi(CommonMenuMes2 + 0x16BC)
/* 0E9F90 001E9E90 0C3A22AC */  sw          $2, %lo(CommonMenuMes2 + 0x16BC)($1)
/* 0E9F94 001E9E94 DA01023C */  lui         $2, %hi(CommonMenuMes2)
/* 0E9F98 001E9E98 50234424 */  addiu       $4, $2, %lo(CommonMenuMes2)
/* 0E9F9C 001E9E9C 282E2072 */  paddub      $5, $17, $0
/* 0E9FA0 001E9EA0 5441050C */  jal         MakeMesWin__6ClsMesFi
/* 0E9FA4 001E9EA4 00000000 */   nop
.L001E9EA8:
/* 0E9FA8 001E9EA8 28160072 */  paddub      $2, $16, $0
/* 0E9FAC 001E9EAC 8000BF7B */  lq          $31, 0x80($29)
/* 0E9FB0 001E9EB0 7000B77B */  lq          $23, 0x70($29)
/* 0E9FB4 001E9EB4 6000B67B */  lq          $22, 0x60($29)
/* 0E9FB8 001E9EB8 5000B57B */  lq          $21, 0x50($29)
/* 0E9FBC 001E9EBC 4000B47B */  lq          $20, 0x40($29)
/* 0E9FC0 001E9EC0 3000B37B */  lq          $19, 0x30($29)
/* 0E9FC4 001E9EC4 2000B27B */  lq          $18, 0x20($29)
/* 0E9FC8 001E9EC8 1000B17B */  lq          $17, 0x10($29)
/* 0E9FCC 001E9ECC 0000B07B */  lq          $16, 0x0($29)
/* 0E9FD0 001E9ED0 C003BD27 */  addiu       $29, $29, 0x3C0
/* 0E9FD4 001E9ED4 0800E003 */  jr          $31
/* 0E9FD8 001E9ED8 00000000 */   nop
/* 0E9FDC 001E9EDC 00000000 */  nop
