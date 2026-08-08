.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel MoveChara__Fv__2
/* 004BA0 01DB08A0 F0F8BD27 */  addiu       $29, $29, -0x710
/* 004BA4 01DB08A4 A000BF7F */  sq          $31, 0xA0($29)
/* 004BA8 01DB08A8 9000B77F */  sq          $23, 0x90($29)
/* 004BAC 01DB08AC 8000B67F */  sq          $22, 0x80($29)
/* 004BB0 01DB08B0 7000B57F */  sq          $21, 0x70($29)
/* 004BB4 01DB08B4 6000B47F */  sq          $20, 0x60($29)
/* 004BB8 01DB08B8 5000B37F */  sq          $19, 0x50($29)
/* 004BBC 01DB08BC 4000B27F */  sq          $18, 0x40($29)
/* 004BC0 01DB08C0 3000B17F */  sq          $17, 0x30($29)
/* 004BC4 01DB08C4 2000B07F */  sq          $16, 0x20($29)
/* 004BC8 01DB08C8 1800BAE7 */  swc1        $f26, 0x18($29)
/* 004BCC 01DB08CC 1400B9E7 */  swc1        $f25, 0x14($29)
/* 004BD0 01DB08D0 1000B8E7 */  swc1        $f24, 0x10($29)
/* 004BD4 01DB08D4 0C00B7E7 */  swc1        $f23, 0xC($29)
/* 004BD8 01DB08D8 0800B6E7 */  swc1        $f22, 0x8($29)
/* 004BDC 01DB08DC 0400B5E7 */  swc1        $f21, 0x4($29)
/* 004BE0 01DB08E0 0000B4E7 */  swc1        $f20, 0x0($29)
/* 004BE4 01DB08E4 189E828F */  lw          $2, -0x61E8($28)
/* 004BE8 01DB08E8 13004010 */  beqz        $2, .L01DB0938_2EBF38
/* 004BEC 01DB08EC 00000000 */   nop
/* 004BF0 01DB08F0 D401013C */  lui         $1, %hi(EdEventInfo + 0x3C)
/* 004BF4 01DB08F4 0CD22CC4 */  lwc1        $f12, %lo(EdEventInfo + 0x3C)($1)
/* 004BF8 01DB08F8 00008044 */  mtc1        $0, $f0
/* 004BFC 01DB08FC 00000000 */  nop
/* 004C00 01DB0900 36600046 */  c.le.s      $f12, $f0
/* 004C04 01DB0904 00000000 */  nop
/* 004C08 01DB0908 0B000145 */  bc1t        .L01DB0938_2EBF38
/* 004C0C 01DB090C 00000000 */   nop
/* 004C10 01DB0910 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 004C14 01DB0914 00688244 */  mtc1        $2, $f13
/* 004C18 01DB0918 FFFF0234 */  ori         $2, $0, 0xFFFF
/* 004C1C 01DB091C 00008244 */  mtc1        $2, $f0
/* 004C20 01DB0920 00000000 */  nop
/* 004C24 01DB0924 A0038046 */  cvt.s.w     $f14, $f0
/* 004C28 01DB0928 B8B5040C */  jal         MGSetRenderInfo__Ffff
/* 004C2C 01DB092C 00000000 */   nop
/* 004C30 01DB0930 0B000010 */  b           .L01DB0960_2EBF60
/* 004C34 01DB0934 00000000 */   nop
.L01DB0938_2EBF38:
/* 004C38 01DB0938 4844023C */  lui         $2, (0x44480000 >> 16)
/* 004C3C 01DB093C 00608244 */  mtc1        $2, $f12
/* 004C40 01DB0940 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 004C44 01DB0944 00688244 */  mtc1        $2, $f13
/* 004C48 01DB0948 FFFF0234 */  ori         $2, $0, 0xFFFF
/* 004C4C 01DB094C 00008244 */  mtc1        $2, $f0
/* 004C50 01DB0950 00000000 */  nop
/* 004C54 01DB0954 A0038046 */  cvt.s.w     $f14, $f0
/* 004C58 01DB0958 B8B5040C */  jal         MGSetRenderInfo__Ffff
/* 004C5C 01DB095C 00000000 */   nop
.L01DB0960_2EBF60:
/* 004C60 01DB0960 109D828F */  lw          $2, -0x62F0($28)
/* 004C64 01DB0964 B000A427 */  addiu       $4, $29, 0xB0
/* 004C68 01DB0968 20024524 */  addiu       $5, $2, 0x220
/* 004C6C 01DB096C 0C86040C */  jal         sceVu0CopyVector
/* 004C70 01DB0970 00000000 */   nop
/* 004C74 01DB0974 A89C848F */  lw          $4, -0x6358($28)
/* 004C78 01DB0978 B491040C */  jal         GetAngleH__7CCameraFv
/* 004C7C 01DB097C 00000000 */   nop
/* 004C80 01DB0980 06060046 */  mov.s       $f24, $f0
/* 004C84 01DB0984 A89C828F */  lw          $2, -0x6358($28)
/* 004C88 01DB0988 749C82AF */  sw          $2, -0x638C($28)
/* 004C8C 01DB098C 109D828F */  lw          $2, -0x62F0($28)
/* 004C90 01DB0990 709C82AF */  sw          $2, -0x6390($28)
/* 004C94 01DB0994 CC01023C */  lui         $2, %hi(GamePad)
/* 004C98 01DB0998 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 004C9C 01DB099C C4AD040C */  jal         GetLXf__8CGamePadFv
/* 004CA0 01DB09A0 00000000 */   nop
/* 004CA4 01DB09A4 C6050046 */  mov.s       $f23, $f0
/* 004CA8 01DB09A8 689E80E7 */  swc1        $f0, -0x6198($28)
/* 004CAC 01DB09AC CC01023C */  lui         $2, %hi(GamePad)
/* 004CB0 01DB09B0 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 004CB4 01DB09B4 D4AD040C */  jal         GetLYf__8CGamePadFv
/* 004CB8 01DB09B8 00000000 */   nop
/* 004CBC 01DB09BC 86050046 */  mov.s       $f22, $f0
/* 004CC0 01DB09C0 CC01023C */  lui         $2, %hi(GamePad)
/* 004CC4 01DB09C4 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 004CC8 01DB09C8 A4AD040C */  jal         GetRXf__8CGamePadFv
/* 004CCC 01DB09CC 00000000 */   nop
/* 004CD0 01DB09D0 46060046 */  mov.s       $f25, $f0
/* 004CD4 01DB09D4 CC01023C */  lui         $2, %hi(GamePad)
/* 004CD8 01DB09D8 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 004CDC 01DB09DC B4AD040C */  jal         GetRYf__8CGamePadFv
/* 004CE0 01DB09E0 00000000 */   nop
/* 004CE4 01DB09E4 86060046 */  mov.s       $f26, $f0
/* 004CE8 01DB09E8 DC01023C */  lui         $2, %hi(LIT_1832)
/* 004CEC 01DB09EC 70274224 */  addiu       $2, $2, %lo(LIT_1832)
/* 004CF0 01DB09F0 C000A327 */  addiu       $3, $29, 0xC0
/* 004CF4 01DB09F4 00004278 */  lq          $2, 0x0($2)
/* 004CF8 01DB09F8 0000627C */  sq          $2, 0x0($3)
/* 004CFC 01DB09FC EA01013C */  lui         $1, %hi(CharaMain + 0xBC)
/* 004D00 01DB0A00 DC1D248C */  lw          $4, %lo(CharaMain + 0xBC)($1)
/* 004D04 01DB0A04 D000A527 */  addiu       $5, $29, 0xD0
/* 004D08 01DB0A08 8CA3040C */  jal         GetRotation__6CFrameFPf
/* 004D0C 01DB0A0C 00000000 */   nop
/* 004D10 01DB0A10 F000A427 */  addiu       $4, $29, 0xF0
/* 004D14 01DB0A14 2A86040C */  jal         sceVu0UnitMatrix
/* 004D18 01DB0A18 00000000 */   nop
/* 004D1C 01DB0A1C F000A427 */  addiu       $4, $29, 0xF0
/* 004D20 01DB0A20 282E8070 */  paddub      $5, $4, $0
/* 004D24 01DB0A24 D400ACC7 */  lwc1        $f12, 0xD4($29)
/* 004D28 01DB0A28 A686040C */  jal         sceVu0RotMatrixY
/* 004D2C 01DB0A2C 00000000 */   nop
/* 004D30 01DB0A30 E000A427 */  addiu       $4, $29, 0xE0
/* 004D34 01DB0A34 F000A527 */  addiu       $5, $29, 0xF0
/* 004D38 01DB0A38 C000A627 */  addiu       $6, $29, 0xC0
/* 004D3C 01DB0A3C 6285040C */  jal         sceVu0ApplyMatrix
/* 004D40 01DB0A40 00000000 */   nop
/* 004D44 01DB0A44 DC01023C */  lui         $2, %hi(BtActStatus + 0xC0)
/* 004D48 01DB0A48 40454424 */  addiu       $4, $2, %lo(BtActStatus + 0xC0)
/* 004D4C 01DB0A4C E000A527 */  addiu       $5, $29, 0xE0
/* 004D50 01DB0A50 9285040C */  jal         sceVu0Normalize
/* 004D54 01DB0A54 00000000 */   nop
/* 004D58 01DB0A58 06C30046 */  mov.s       $f12, $f24
/* 004D5C 01DB0A5C 9044040C */  jal         fptodp
/* 004D60 01DB0A60 00000000 */   nop
/* 004D64 01DB0A64 28264070 */  paddub      $4, $2, $0
/* 004D68 01DB0A68 F473040C */  jal         cos
/* 004D6C 01DB0A6C 00000000 */   nop
/* 004D70 01DB0A70 288E4070 */  paddub      $17, $2, $0
/* 004D74 01DB0A74 06BB0046 */  mov.s       $f12, $f23
/* 004D78 01DB0A78 9044040C */  jal         fptodp
/* 004D7C 01DB0A7C 00000000 */   nop
/* 004D80 01DB0A80 28264070 */  paddub      $4, $2, $0
/* 004D84 01DB0A84 282E2072 */  paddub      $5, $17, $0
/* 004D88 01DB0A88 9E3F040C */  jal         dpmul
/* 004D8C 01DB0A8C 00000000 */   nop
/* 004D90 01DB0A90 288E4070 */  paddub      $17, $2, $0
/* 004D94 01DB0A94 06C30046 */  mov.s       $f12, $f24
/* 004D98 01DB0A98 2876040C */  jal         sinf
/* 004D9C 01DB0A9C 00000000 */   nop
/* 004DA0 01DB0AA0 02B30046 */  mul.s       $f12, $f22, $f0
/* 004DA4 01DB0AA4 9044040C */  jal         fptodp
/* 004DA8 01DB0AA8 00000000 */   nop
/* 004DAC 01DB0AAC 28262072 */  paddub      $4, $17, $0
/* 004DB0 01DB0AB0 282E4070 */  paddub      $5, $2, $0
/* 004DB4 01DB0AB4 6E3F040C */  jal         dpadd
/* 004DB8 01DB0AB8 00000000 */   nop
/* 004DBC 01DB0ABC 28264070 */  paddub      $4, $2, $0
/* 004DC0 01DB0AC0 9241040C */  jal         dptofp
/* 004DC4 01DB0AC4 00000000 */   nop
/* 004DC8 01DB0AC8 DC01013C */  lui         $1, %hi(BtActStatus + 0xC0)
/* 004DCC 01DB0ACC 404520E4 */  swc1        $f0, %lo(BtActStatus + 0xC0)($1)
/* 004DD0 01DB0AD0 06C30046 */  mov.s       $f12, $f24
/* 004DD4 01DB0AD4 9044040C */  jal         fptodp
/* 004DD8 01DB0AD8 00000000 */   nop
/* 004DDC 01DB0ADC 28264070 */  paddub      $4, $2, $0
/* 004DE0 01DB0AE0 F473040C */  jal         cos
/* 004DE4 01DB0AE4 00000000 */   nop
/* 004DE8 01DB0AE8 288E4070 */  paddub      $17, $2, $0
/* 004DEC 01DB0AEC 06B30046 */  mov.s       $f12, $f22
/* 004DF0 01DB0AF0 9044040C */  jal         fptodp
/* 004DF4 01DB0AF4 00000000 */   nop
/* 004DF8 01DB0AF8 28264070 */  paddub      $4, $2, $0
/* 004DFC 01DB0AFC 282E2072 */  paddub      $5, $17, $0
/* 004E00 01DB0B00 9E3F040C */  jal         dpmul
/* 004E04 01DB0B04 00000000 */   nop
/* 004E08 01DB0B08 288E4070 */  paddub      $17, $2, $0
/* 004E0C 01DB0B0C 06C30046 */  mov.s       $f12, $f24
/* 004E10 01DB0B10 2876040C */  jal         sinf
/* 004E14 01DB0B14 00000000 */   nop
/* 004E18 01DB0B18 02BB0046 */  mul.s       $f12, $f23, $f0
/* 004E1C 01DB0B1C 9044040C */  jal         fptodp
/* 004E20 01DB0B20 00000000 */   nop
/* 004E24 01DB0B24 28262072 */  paddub      $4, $17, $0
/* 004E28 01DB0B28 282E4070 */  paddub      $5, $2, $0
/* 004E2C 01DB0B2C 843F040C */  jal         dpsub
/* 004E30 01DB0B30 00000000 */   nop
/* 004E34 01DB0B34 28264070 */  paddub      $4, $2, $0
/* 004E38 01DB0B38 9241040C */  jal         dptofp
/* 004E3C 01DB0B3C 00000000 */   nop
/* 004E40 01DB0B40 DC01013C */  lui         $1, %hi(BtActStatus + 0xC8)
/* 004E44 01DB0B44 484520E4 */  swc1        $f0, %lo(BtActStatus + 0xC8)($1)
/* 004E48 01DB0B48 DC01013C */  lui         $1, %hi(BtActStatus + 0xC4)
/* 004E4C 01DB0B4C 444520AC */  sw          $0, %lo(BtActStatus + 0xC4)($1)
/* 004E50 01DB0B50 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 004E54 01DB0B54 DC01013C */  lui         $1, %hi(BtActStatus + 0xCC)
/* 004E58 01DB0B58 4C4522AC */  sw          $2, %lo(BtActStatus + 0xCC)($1)
/* 004E5C 01DB0B5C CC01023C */  lui         $2, %hi(GamePad)
/* 004E60 01DB0B60 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 004E64 01DB0B64 40000524 */  addiu       $5, $0, 0x40
/* 004E68 01DB0B68 2CAE040C */  jal         Down2__8CGamePadFi
/* 004E6C 01DB0B6C 00000000 */   nop
/* 004E70 01DB0B70 04004010 */  beqz        $2, .L01DB0B84_2EC184
/* 004E74 01DB0B74 00000000 */   nop
/* 004E78 01DB0B78 749D828F */  lw          $2, -0x628C($28)
/* 004E7C 01DB0B7C 01004238 */  xori        $2, $2, 0x1
/* 004E80 01DB0B80 749D82AF */  sw          $2, -0x628C($28)
.L01DB0B84_2EC184:
/* 004E84 01DB0B84 CC01023C */  lui         $2, %hi(GamePad)
/* 004E88 01DB0B88 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 004E8C 01DB0B8C 80000524 */  addiu       $5, $0, 0x80
/* 004E90 01DB0B90 2CAE040C */  jal         Down2__8CGamePadFi
/* 004E94 01DB0B94 00000000 */   nop
/* 004E98 01DB0B98 06004010 */  beqz        $2, .L01DB0BB4_2EC1B4
/* 004E9C 01DB0B9C 00000000 */   nop
/* 004EA0 01DB0BA0 8C9C828F */  lw          $2, -0x6374($28)
/* 004EA4 01DB0BA4 01004238 */  xori        $2, $2, 0x1
/* 004EA8 01DB0BA8 8C9C82AF */  sw          $2, -0x6374($28)
/* 004EAC 01DB0BAC 8C9C828F */  lw          $2, -0x6374($28)
/* 004EB0 01DB0BB0 B48D82AF */  sw          $2, -0x724C($28)
.L01DB0BB4_2EC1B4:
/* 004EB4 01DB0BB4 CC01023C */  lui         $2, %hi(GamePad)
/* 004EB8 01DB0BB8 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 004EBC 01DB0BBC 00010524 */  addiu       $5, $0, 0x100
/* 004EC0 01DB0BC0 1CAE040C */  jal         Down__8CGamePadFi
/* 004EC4 01DB0BC4 00000000 */   nop
/* 004EC8 01DB0BC8 FC9D828F */  lw          $2, -0x6204($28)
/* 004ECC 01DB0BCC 13020324 */  addiu       $3, $0, 0x213
/* 004ED0 01DB0BD0 82194310 */  beq         $2, $3, .L01DB71DC_2F27DC
/* 004ED4 01DB0BD4 00000000 */   nop
/* 004ED8 01DB0BD8 12020324 */  addiu       $3, $0, 0x212
/* 004EDC 01DB0BDC 6A194310 */  beq         $2, $3, .L01DB7188_2F2788
/* 004EE0 01DB0BE0 00000000 */   nop
/* 004EE4 01DB0BE4 CA000324 */  addiu       $3, $0, 0xCA
/* 004EE8 01DB0BE8 36194310 */  beq         $2, $3, .L01DB70C4_2F26C4
/* 004EEC 01DB0BEC 00000000 */   nop
/* 004EF0 01DB0BF0 C9000324 */  addiu       $3, $0, 0xC9
/* 004EF4 01DB0BF4 03194310 */  beq         $2, $3, .L01DB7004_2F2604
/* 004EF8 01DB0BF8 00000000 */   nop
/* 004EFC 01DB0BFC C8000324 */  addiu       $3, $0, 0xC8
/* 004F00 01DB0C00 2E184310 */  beq         $2, $3, .L01DB6CBC_2F22BC
/* 004F04 01DB0C04 00000000 */   nop
/* 004F08 01DB0C08 8F000324 */  addiu       $3, $0, 0x8F
/* 004F0C 01DB0C0C 14184310 */  beq         $2, $3, .L01DB6C60_2F2260
/* 004F10 01DB0C10 00000000 */   nop
/* 004F14 01DB0C14 8E000324 */  addiu       $3, $0, 0x8E
/* 004F18 01DB0C18 FE174310 */  beq         $2, $3, .L01DB6C14_2F2214
/* 004F1C 01DB0C1C 00000000 */   nop
/* 004F20 01DB0C20 8D000324 */  addiu       $3, $0, 0x8D
/* 004F24 01DB0C24 F0174310 */  beq         $2, $3, .L01DB6BE8_2F21E8
/* 004F28 01DB0C28 00000000 */   nop
/* 004F2C 01DB0C2C 8C000324 */  addiu       $3, $0, 0x8C
/* 004F30 01DB0C30 E5174310 */  beq         $2, $3, .L01DB6BC8_2F21C8
/* 004F34 01DB0C34 00000000 */   nop
/* 004F38 01DB0C38 83000324 */  addiu       $3, $0, 0x83
/* 004F3C 01DB0C3C DB174310 */  beq         $2, $3, .L01DB6BAC_2F21AC
/* 004F40 01DB0C40 00000000 */   nop
/* 004F44 01DB0C44 82000324 */  addiu       $3, $0, 0x82
/* 004F48 01DB0C48 D0174310 */  beq         $2, $3, .L01DB6B8C_2F218C
/* 004F4C 01DB0C4C 00000000 */   nop
/* 004F50 01DB0C50 79000324 */  addiu       $3, $0, 0x79
/* 004F54 01DB0C54 C6174310 */  beq         $2, $3, .L01DB6B70_2F2170
/* 004F58 01DB0C58 00000000 */   nop
/* 004F5C 01DB0C5C 78000324 */  addiu       $3, $0, 0x78
/* 004F60 01DB0C60 BC174310 */  beq         $2, $3, .L01DB6B54_2F2154
/* 004F64 01DB0C64 00000000 */   nop
/* 004F68 01DB0C68 27010324 */  addiu       $3, $0, 0x127
/* 004F6C 01DB0C6C 7B174310 */  beq         $2, $3, .L01DB6A5C_2F205C
/* 004F70 01DB0C70 00000000 */   nop
/* 004F74 01DB0C74 23010324 */  addiu       $3, $0, 0x123
/* 004F78 01DB0C78 7B194310 */  beq         $2, $3, .L.L01DB7268_2F2868$b
/* 004F7C 01DB0C7C 00000000 */   nop
/* 004F80 01DB0C80 22010324 */  addiu       $3, $0, 0x122
/* 004F84 01DB0C84 2E174310 */  beq         $2, $3, .L01DB6940_2F1F40
/* 004F88 01DB0C88 00000000 */   nop
/* 004F8C 01DB0C8C 22000324 */  addiu       $3, $0, 0x22
/* 004F90 01DB0C90 BA164310 */  beq         $2, $3, .L01DB677C_2F1D7C
/* 004F94 01DB0C94 00000000 */   nop
/* 004F98 01DB0C98 21000324 */  addiu       $3, $0, 0x21
/* 004F9C 01DB0C9C 7F164310 */  beq         $2, $3, .L01DB669C_2F1C9C
/* 004FA0 01DB0CA0 00000000 */   nop
/* 004FA4 01DB0CA4 20000324 */  addiu       $3, $0, 0x20
/* 004FA8 01DB0CA8 78164310 */  beq         $2, $3, .L01DB668C_2F1C8C
/* 004FAC 01DB0CAC 00000000 */   nop
/* 004FB0 01DB0CB0 1F000324 */  addiu       $3, $0, 0x1F
/* 004FB4 01DB0CB4 67164310 */  beq         $2, $3, .L01DB6654_2F1C54
/* 004FB8 01DB0CB8 00000000 */   nop
/* 004FBC 01DB0CBC 1E000324 */  addiu       $3, $0, 0x1E
/* 004FC0 01DB0CC0 3F164310 */  beq         $2, $3, .L01DB65C0_2F1BC0
/* 004FC4 01DB0CC4 00000000 */   nop
/* 004FC8 01DB0CC8 0A000324 */  addiu       $3, $0, 0xA
/* 004FCC 01DB0CCC 0E134310 */  beq         $2, $3, .L01DB5908_2F0F08
/* 004FD0 01DB0CD0 00000000 */   nop
/* 004FD4 01DB0CD4 08020324 */  addiu       $3, $0, 0x208
/* 004FD8 01DB0CD8 04134310 */  beq         $2, $3, .L01DB58EC_2F0EEC
/* 004FDC 01DB0CDC 00000000 */   nop
/* 004FE0 01DB0CE0 FE010324 */  addiu       $3, $0, 0x1FE
/* 004FE4 01DB0CE4 F8124310 */  beq         $2, $3, .L01DB58C8_2F0EC8
/* 004FE8 01DB0CE8 00000000 */   nop
/* 004FEC 01DB0CEC 1C020324 */  addiu       $3, $0, 0x21C
/* 004FF0 01DB0CF0 E0124310 */  beq         $2, $3, .L01DB5874_2F0E74
/* 004FF4 01DB0CF4 00000000 */   nop
/* 004FF8 01DB0CF8 B0000324 */  addiu       $3, $0, 0xB0
/* 004FFC 01DB0CFC AA124310 */  beq         $2, $3, .L01DB57A8_2F0DA8
/* 005000 01DB0D00 00000000 */   nop
/* 005004 01DB0D04 AF000324 */  addiu       $3, $0, 0xAF
/* 005008 01DB0D08 95124310 */  beq         $2, $3, .L01DB5760_2F0D60
/* 00500C 01DB0D0C 00000000 */   nop
/* 005010 01DB0D10 AB000324 */  addiu       $3, $0, 0xAB
/* 005014 01DB0D14 84124310 */  beq         $2, $3, .L01DB5728_2F0D28
/* 005018 01DB0D18 00000000 */   nop
/* 00501C 01DB0D1C AA000324 */  addiu       $3, $0, 0xAA
/* 005020 01DB0D20 7A124310 */  beq         $2, $3, .L01DB570C_2F0D0C
/* 005024 01DB0D24 00000000 */   nop
/* 005028 01DB0D28 98000324 */  addiu       $3, $0, 0x98
/* 00502C 01DB0D2C 62124310 */  beq         $2, $3, .L01DB56B8_2F0CB8
/* 005030 01DB0D30 00000000 */   nop
/* 005034 01DB0D34 97000324 */  addiu       $3, $0, 0x97
/* 005038 01DB0D38 4D124310 */  beq         $2, $3, .L01DB5670_2F0C70
/* 00503C 01DB0D3C 00000000 */   nop
/* 005040 01DB0D40 9B000324 */  addiu       $3, $0, 0x9B
/* 005044 01DB0D44 2D124310 */  beq         $2, $3, .L01DB55FC_2F0BFC
/* 005048 01DB0D48 00000000 */   nop
/* 00504C 01DB0D4C E4000324 */  addiu       $3, $0, 0xE4
/* 005050 01DB0D50 FF114310 */  beq         $2, $3, .L01DB5550_2F0B50
/* 005054 01DB0D54 00000000 */   nop
/* 005058 01DB0D58 E3000324 */  addiu       $3, $0, 0xE3
/* 00505C 01DB0D5C D2114310 */  beq         $2, $3, .L01DB54A8_2F0AA8
/* 005060 01DB0D60 00000000 */   nop
/* 005064 01DB0D64 DE000324 */  addiu       $3, $0, 0xDE
/* 005068 01DB0D68 BE114310 */  beq         $2, $3, .L01DB5464_2F0A64
/* 00506C 01DB0D6C 00000000 */   nop
/* 005070 01DB0D70 DD000324 */  addiu       $3, $0, 0xDD
/* 005074 01DB0D74 F6104310 */  beq         $2, $3, .L01DB5150_2F0750
/* 005078 01DB0D78 00000000 */   nop
/* 00507C 01DB0D7C DC000324 */  addiu       $3, $0, 0xDC
/* 005080 01DB0D80 E1104310 */  beq         $2, $3, .L01DB5108_2F0708
/* 005084 01DB0D84 00000000 */   nop
/* 005088 01DB0D88 A0000324 */  addiu       $3, $0, 0xA0
/* 00508C 01DB0D8C 3A104310 */  beq         $2, $3, .L01DB4E78_2F0478
/* 005090 01DB0D90 00000000 */   nop
/* 005094 01DB0D94 9A010324 */  addiu       $3, $0, 0x19A
/* 005098 01DB0D98 28104310 */  beq         $2, $3, .L01DB4E3C_2F043C
/* 00509C 01DB0D9C 00000000 */   nop
/* 0050A0 01DB0DA0 91010324 */  addiu       $3, $0, 0x191
/* 0050A4 01DB0DA4 6D0F4310 */  beq         $2, $3, .L01DB4B5C_2F015C
/* 0050A8 01DB0DA8 00000000 */   nop
/* 0050AC 01DB0DAC 90010424 */  addiu       $4, $0, 0x190
/* 0050B0 01DB0DB0 DF0E4410 */  beq         $2, $4, .L01DB4930_2EFF30
/* 0050B4 01DB0DB4 00000000 */   nop
/* 0050B8 01DB0DB8 26020324 */  addiu       $3, $0, 0x226
/* 0050BC 01DB0DBC BF0E4310 */  beq         $2, $3, .L01DB48BC_2EFEBC
/* 0050C0 01DB0DC0 00000000 */   nop
/* 0050C4 01DB0DC4 F4010324 */  addiu       $3, $0, 0x1F4
/* 0050C8 01DB0DC8 B90E4310 */  beq         $2, $3, .L01DB48B0_2EFEB0
/* 0050CC 01DB0DCC 00000000 */   nop
/* 0050D0 01DB0DD0 03004010 */  beqz        $2, .L01DB0DE0_2EC3E0
/* 0050D4 01DB0DD4 00000000 */   nop
/* 0050D8 01DB0DD8 23190010 */  b           .L.L01DB7268_2F2868$b
/* 0050DC 01DB0DDC 00000000 */   nop
.L01DB0DE0_2EC3E0:
/* 0050E0 01DB0DE0 200B050C */  jal         CheckTrialEnd__Fv
/* 0050E4 01DB0DE4 00000000 */   nop
/* 0050E8 01DB0DE8 05004010 */  beqz        $2, .L01DB0E00_2EC400
/* 0050EC 01DB0DEC 00000000 */   nop
/* 0050F0 01DB0DF0 01000224 */  addiu       $2, $0, 0x1
/* 0050F4 01DB0DF4 049E82AF */  sw          $2, -0x61FC($28)
/* 0050F8 01DB0DF8 1B190010 */  b           .L.L01DB7268_2F2868$b
/* 0050FC 01DB0DFC 00000000 */   nop
.L01DB0E00_2EC400:
/* 005100 01DB0E00 CC01023C */  lui         $2, %hi(GamePad)
/* 005104 01DB0E04 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 005108 01DB0E08 00080524 */  addiu       $5, $0, 0x800
/* 00510C 01DB0E0C 1CAE040C */  jal         Down__8CGamePadFi
/* 005110 01DB0E10 00000000 */   nop
/* 005114 01DB0E14 16004010 */  beqz        $2, .L01DB0E70_2EC470
/* 005118 01DB0E18 00000000 */   nop
/* 00511C 01DB0E1C DC01023C */  lui         $2, %hi(LIT_4385)
/* 005120 01DB0E20 F82E4424 */  addiu       $4, $2, %lo(LIT_4385)
/* 005124 01DB0E24 A611040C */  jal         printf
/* 005128 01DB0E28 00000000 */   nop
/* 00512C 01DB0E2C 01000224 */  addiu       $2, $0, 0x1
/* 005130 01DB0E30 D49D82AF */  sw          $2, -0x622C($28)
/* 005134 01DB0E34 749D82AF */  sw          $2, -0x628C($28)
/* 005138 01DB0E38 EC9C82AF */  sw          $2, -0x6314($28)
/* 00513C 01DB0E3C E49C82AF */  sw          $2, -0x631C($28)
/* 005140 01DB0E40 28260070 */  paddub      $4, $0, $0
/* 005144 01DB0E44 C803050C */  jal         PlayTimeCountFlag__Fi
/* 005148 01DB0E48 00000000 */   nop
/* 00514C 01DB0E4C 01000424 */  addiu       $4, $0, 0x1
/* 005150 01DB0E50 FFFF0524 */  addiu       $5, $0, -0x1
/* 005154 01DB0E54 28360070 */  paddub      $6, $0, $0
/* 005158 01DB0E58 AC69050C */  jal         SndSePlay__Fiii
/* 00515C 01DB0E5C 00000000 */   nop
/* 005160 01DB0E60 9B000224 */  addiu       $2, $0, 0x9B
/* 005164 01DB0E64 FC9D82AF */  sw          $2, -0x6204($28)
/* 005168 01DB0E68 FF180010 */  b           .L.L01DB7268_2F2868$b
/* 00516C 01DB0E6C 00000000 */   nop
.L01DB0E70_2EC470:
/* 005170 01DB0E70 06C30046 */  mov.s       $f12, $f24
/* 005174 01DB0E74 9044040C */  jal         fptodp
/* 005178 01DB0E78 00000000 */   nop
/* 00517C 01DB0E7C 28264070 */  paddub      $4, $2, $0
/* 005180 01DB0E80 F473040C */  jal         cos
/* 005184 01DB0E84 00000000 */   nop
/* 005188 01DB0E88 28864070 */  paddub      $16, $2, $0
/* 00518C 01DB0E8C 06BB0046 */  mov.s       $f12, $f23
/* 005190 01DB0E90 9044040C */  jal         fptodp
/* 005194 01DB0E94 00000000 */   nop
/* 005198 01DB0E98 28264070 */  paddub      $4, $2, $0
/* 00519C 01DB0E9C 282E0072 */  paddub      $5, $16, $0
/* 0051A0 01DB0EA0 9E3F040C */  jal         dpmul
/* 0051A4 01DB0EA4 00000000 */   nop
/* 0051A8 01DB0EA8 28864070 */  paddub      $16, $2, $0
/* 0051AC 01DB0EAC 06C30046 */  mov.s       $f12, $f24
/* 0051B0 01DB0EB0 2876040C */  jal         sinf
/* 0051B4 01DB0EB4 00000000 */   nop
/* 0051B8 01DB0EB8 02B30046 */  mul.s       $f12, $f22, $f0
/* 0051BC 01DB0EBC 9044040C */  jal         fptodp
/* 0051C0 01DB0EC0 00000000 */   nop
/* 0051C4 01DB0EC4 28260072 */  paddub      $4, $16, $0
/* 0051C8 01DB0EC8 282E4070 */  paddub      $5, $2, $0
/* 0051CC 01DB0ECC 6E3F040C */  jal         dpadd
/* 0051D0 01DB0ED0 00000000 */   nop
/* 0051D4 01DB0ED4 28264070 */  paddub      $4, $2, $0
/* 0051D8 01DB0ED8 9241040C */  jal         dptofp
/* 0051DC 01DB0EDC 00000000 */   nop
/* 0051E0 01DB0EE0 46050046 */  mov.s       $f21, $f0
/* 0051E4 01DB0EE4 DC01013C */  lui         $1, %hi(BtActStatus + 0xB4)
/* 0051E8 01DB0EE8 344520E4 */  swc1        $f0, %lo(BtActStatus + 0xB4)($1)
/* 0051EC 01DB0EEC 06C30046 */  mov.s       $f12, $f24
/* 0051F0 01DB0EF0 9044040C */  jal         fptodp
/* 0051F4 01DB0EF4 00000000 */   nop
/* 0051F8 01DB0EF8 28264070 */  paddub      $4, $2, $0
/* 0051FC 01DB0EFC F473040C */  jal         cos
/* 005200 01DB0F00 00000000 */   nop
/* 005204 01DB0F04 28864070 */  paddub      $16, $2, $0
/* 005208 01DB0F08 06B30046 */  mov.s       $f12, $f22
/* 00520C 01DB0F0C 9044040C */  jal         fptodp
/* 005210 01DB0F10 00000000 */   nop
/* 005214 01DB0F14 28264070 */  paddub      $4, $2, $0
/* 005218 01DB0F18 282E0072 */  paddub      $5, $16, $0
/* 00521C 01DB0F1C 9E3F040C */  jal         dpmul
/* 005220 01DB0F20 00000000 */   nop
/* 005224 01DB0F24 28864070 */  paddub      $16, $2, $0
/* 005228 01DB0F28 06C30046 */  mov.s       $f12, $f24
/* 00522C 01DB0F2C 2876040C */  jal         sinf
/* 005230 01DB0F30 00000000 */   nop
/* 005234 01DB0F34 02BB0046 */  mul.s       $f12, $f23, $f0
/* 005238 01DB0F38 9044040C */  jal         fptodp
/* 00523C 01DB0F3C 00000000 */   nop
/* 005240 01DB0F40 28260072 */  paddub      $4, $16, $0
/* 005244 01DB0F44 282E4070 */  paddub      $5, $2, $0
/* 005248 01DB0F48 843F040C */  jal         dpsub
/* 00524C 01DB0F4C 00000000 */   nop
/* 005250 01DB0F50 28264070 */  paddub      $4, $2, $0
/* 005254 01DB0F54 9241040C */  jal         dptofp
/* 005258 01DB0F58 00000000 */   nop
/* 00525C 01DB0F5C 06050046 */  mov.s       $f20, $f0
/* 005260 01DB0F60 DC01013C */  lui         $1, %hi(BtActStatus + 0xB8)
/* 005264 01DB0F64 384520E4 */  swc1        $f0, %lo(BtActStatus + 0xB8)($1)
/* 005268 01DB0F68 40000424 */  addiu       $4, $0, 0x40
/* 00526C 01DB0F6C 4CC6060C */  jal         StatusErrCheck__Fi
/* 005270 01DB0F70 00000000 */   nop
/* 005274 01DB0F74 06004010 */  beqz        $2, .L01DB0F90_2EC590
/* 005278 01DB0F78 00000000 */   nop
/* 00527C 01DB0F7C 0040023C */  lui         $2, (0x40000000 >> 16)
/* 005280 01DB0F80 00008244 */  mtc1        $2, $f0
/* 005284 01DB0F84 00000000 */  nop
/* 005288 01DB0F88 43AD0046 */  div.s       $f21, $f21, $f0
/* 00528C 01DB0F8C 03A50046 */  div.s       $f20, $f20, $f0
.L01DB0F90_2EC590:
/* 005290 01DB0F90 DC01013C */  lui         $1, %hi(BtActStatus + 0x98)
/* 005294 01DB0F94 184520AC */  sw          $0, %lo(BtActStatus + 0x98)($1)
/* 005298 01DB0F98 04000424 */  addiu       $4, $0, 0x4
/* 00529C 01DB0F9C 4CC6060C */  jal         StatusErrCheck__Fi
/* 0052A0 01DB0FA0 00000000 */   nop
/* 0052A4 01DB0FA4 09004010 */  beqz        $2, .L01DB0FCC_2EC5CC
/* 0052A8 01DB0FA8 00000000 */   nop
/* 0052AC 01DB0FAC 00B88044 */  mtc1        $0, $f23
/* 0052B0 01DB0FB0 00000000 */  nop
/* 0052B4 01DB0FB4 46BD0046 */  mov.s       $f21, $f23
/* 0052B8 01DB0FB8 86BD0046 */  mov.s       $f22, $f23
/* 0052BC 01DB0FBC 06BD0046 */  mov.s       $f20, $f23
/* 0052C0 01DB0FC0 01000224 */  addiu       $2, $0, 0x1
/* 0052C4 01DB0FC4 DC01013C */  lui         $1, %hi(BtActStatus + 0x98)
/* 0052C8 01DB0FC8 184522AC */  sw          $2, %lo(BtActStatus + 0x98)($1)
.L01DB0FCC_2EC5CC:
/* 0052CC 01DB0FCC DC01013C */  lui         $1, %hi(velo__2)
/* 0052D0 01DB0FD0 502535E4 */  swc1        $f21, %lo(velo__2)($1)
/* 0052D4 01DB0FD4 DC01013C */  lui         $1, %hi(velo__2 + 0x8)
/* 0052D8 01DB0FD8 582534E4 */  swc1        $f20, %lo(velo__2 + 0x8)($1)
/* 0052DC 01DB0FDC 06C30046 */  mov.s       $f12, $f24
/* 0052E0 01DB0FE0 9044040C */  jal         fptodp
/* 0052E4 01DB0FE4 00000000 */   nop
/* 0052E8 01DB0FE8 28264070 */  paddub      $4, $2, $0
/* 0052EC 01DB0FEC F473040C */  jal         cos
/* 0052F0 01DB0FF0 00000000 */   nop
/* 0052F4 01DB0FF4 28864070 */  paddub      $16, $2, $0
/* 0052F8 01DB0FF8 06CB0046 */  mov.s       $f12, $f25
/* 0052FC 01DB0FFC 9044040C */  jal         fptodp
/* 005300 01DB1000 00000000 */   nop
/* 005304 01DB1004 28264070 */  paddub      $4, $2, $0
/* 005308 01DB1008 282E0072 */  paddub      $5, $16, $0
/* 00530C 01DB100C 9E3F040C */  jal         dpmul
/* 005310 01DB1010 00000000 */   nop
/* 005314 01DB1014 28864070 */  paddub      $16, $2, $0
/* 005318 01DB1018 06C30046 */  mov.s       $f12, $f24
/* 00531C 01DB101C 2876040C */  jal         sinf
/* 005320 01DB1020 00000000 */   nop
/* 005324 01DB1024 02D30046 */  mul.s       $f12, $f26, $f0
/* 005328 01DB1028 9044040C */  jal         fptodp
/* 00532C 01DB102C 00000000 */   nop
/* 005330 01DB1030 28260072 */  paddub      $4, $16, $0
/* 005334 01DB1034 282E4070 */  paddub      $5, $2, $0
/* 005338 01DB1038 6E3F040C */  jal         dpadd
/* 00533C 01DB103C 00000000 */   nop
/* 005340 01DB1040 28264070 */  paddub      $4, $2, $0
/* 005344 01DB1044 9241040C */  jal         dptofp
/* 005348 01DB1048 00000000 */   nop
/* 00534C 01DB104C DC01013C */  lui         $1, %hi(velo2)
/* 005350 01DB1050 602520E4 */  swc1        $f0, %lo(velo2)($1)
/* 005354 01DB1054 06C30046 */  mov.s       $f12, $f24
/* 005358 01DB1058 9044040C */  jal         fptodp
/* 00535C 01DB105C 00000000 */   nop
/* 005360 01DB1060 28264070 */  paddub      $4, $2, $0
/* 005364 01DB1064 F473040C */  jal         cos
/* 005368 01DB1068 00000000 */   nop
/* 00536C 01DB106C 28864070 */  paddub      $16, $2, $0
/* 005370 01DB1070 06D30046 */  mov.s       $f12, $f26
/* 005374 01DB1074 9044040C */  jal         fptodp
/* 005378 01DB1078 00000000 */   nop
/* 00537C 01DB107C 28264070 */  paddub      $4, $2, $0
/* 005380 01DB1080 282E0072 */  paddub      $5, $16, $0
/* 005384 01DB1084 9E3F040C */  jal         dpmul
/* 005388 01DB1088 00000000 */   nop
/* 00538C 01DB108C 28864070 */  paddub      $16, $2, $0
/* 005390 01DB1090 06C30046 */  mov.s       $f12, $f24
/* 005394 01DB1094 2876040C */  jal         sinf
/* 005398 01DB1098 00000000 */   nop
/* 00539C 01DB109C 02CB0046 */  mul.s       $f12, $f25, $f0
/* 0053A0 01DB10A0 9044040C */  jal         fptodp
/* 0053A4 01DB10A4 00000000 */   nop
/* 0053A8 01DB10A8 28260072 */  paddub      $4, $16, $0
/* 0053AC 01DB10AC 282E4070 */  paddub      $5, $2, $0
/* 0053B0 01DB10B0 843F040C */  jal         dpsub
/* 0053B4 01DB10B4 00000000 */   nop
/* 0053B8 01DB10B8 28264070 */  paddub      $4, $2, $0
/* 0053BC 01DB10BC 9241040C */  jal         dptofp
/* 0053C0 01DB10C0 00000000 */   nop
/* 0053C4 01DB10C4 DC01013C */  lui         $1, %hi(velo2 + 0x8)
/* 0053C8 01DB10C8 682520E4 */  swc1        $f0, %lo(velo2 + 0x8)($1)
/* 0053CC 01DB10CC DC01023C */  lui         $2, %hi(velo__2)
/* 0053D0 01DB10D0 50254424 */  addiu       $4, $2, %lo(velo__2)
/* 0053D4 01DB10D4 588D040C */  jal         DistVector__FPf
/* 0053D8 01DB10D8 00000000 */   nop
/* 0053DC 01DB10DC C89D80E7 */  swc1        $f0, -0x6238($28)
/* 0053E0 01DB10E0 DC01013C */  lui         $1, %hi(BtActStatus + 0xBC)
/* 0053E4 01DB10E4 3C4520E4 */  swc1        $f0, %lo(BtActStatus + 0xBC)($1)
/* 0053E8 01DB10E8 DC01023C */  lui         $2, %hi(velo__2)
/* 0053EC 01DB10EC 50254424 */  addiu       $4, $2, %lo(velo__2)
/* 0053F0 01DB10F0 588D040C */  jal         DistVector__FPf
/* 0053F4 01DB10F4 00000000 */   nop
/* 0053F8 01DB10F8 CC9D80E7 */  swc1        $f0, -0x6234($28)
/* 0053FC 01DB10FC DC01013C */  lui         $1, %hi(BtActStatus + 0x60)
/* 005400 01DB1100 E04420AC */  sw          $0, %lo(BtActStatus + 0x60)($1)
/* 005404 01DB1104 989D828F */  lw          $2, -0x6268($28)
/* 005408 01DB1108 17004010 */  beqz        $2, .L01DB1168_2EC768
/* 00540C 01DB110C 00000000 */   nop
/* 005410 01DB1110 DC01013C */  lui         $1, %hi(velo__2)
/* 005414 01DB1114 502535E4 */  swc1        $f21, %lo(velo__2)($1)
/* 005418 01DB1118 DC01013C */  lui         $1, %hi(velo__2 + 0x8)
/* 00541C 01DB111C 582534E4 */  swc1        $f20, %lo(velo__2 + 0x8)($1)
/* 005420 01DB1120 DC01013C */  lui         $1, %hi(BtActStatus + 0x128)
/* 005424 01DB1124 A845228C */  lw          $2, %lo(BtActStatus + 0x128)($1)
/* 005428 01DB1128 08004018 */  blez        $2, .L01DB114C_2EC74C
/* 00542C 01DB112C 00000000 */   nop
/* 005430 01DB1130 0042023C */  lui         $2, (0x42000000 >> 16)
/* 005434 01DB1134 00608244 */  mtc1        $2, $f12
/* 005438 01DB1138 A89C848F */  lw          $4, -0x6358($28)
/* 00543C 01DB113C 9491040C */  jal         SetSpeed__7CCameraFf
/* 005440 01DB1140 00000000 */   nop
/* 005444 01DB1144 1E000010 */  b           .L01DB11C0_2EC7C0
/* 005448 01DB1148 00000000 */   nop
.L01DB114C_2EC74C:
/* 00544C 01DB114C 6041023C */  lui         $2, (0x41600000 >> 16)
/* 005450 01DB1150 00608244 */  mtc1        $2, $f12
/* 005454 01DB1154 A89C848F */  lw          $4, -0x6358($28)
/* 005458 01DB1158 9491040C */  jal         SetSpeed__7CCameraFf
/* 00545C 01DB115C 00000000 */   nop
/* 005460 01DB1160 17000010 */  b           .L01DB11C0_2EC7C0
/* 005464 01DB1164 00000000 */   nop
.L01DB1168_2EC768:
/* 005468 01DB1168 0041023C */  lui         $2, (0x41000000 >> 16)
/* 00546C 01DB116C 00608244 */  mtc1        $2, $f12
/* 005470 01DB1170 A89C848F */  lw          $4, -0x6358($28)
/* 005474 01DB1174 9491040C */  jal         SetSpeed__7CCameraFf
/* 005478 01DB1178 00000000 */   nop
/* 00547C 01DB117C 309E80AF */  sw          $0, -0x61D0($28)
/* 005480 01DB1180 D09D828F */  lw          $2, -0x6230($28)
/* 005484 01DB1184 05004010 */  beqz        $2, .L01DB119C_2EC79C
/* 005488 01DB1188 00000000 */   nop
/* 00548C 01DB118C 4040023C */  lui         $2, (0x40400000 >> 16)
/* 005490 01DB1190 E08782AF */  sw          $2, -0x7820($28)
/* 005494 01DB1194 03000010 */  b           .L01DB11A4_2EC7A4
/* 005498 01DB1198 00000000 */   nop
.L01DB119C_2EC79C:
/* 00549C 01DB119C 288480C7 */  lwc1        $f0, -0x7BD8($28)
/* 0054A0 01DB11A0 E08780E7 */  swc1        $f0, -0x7820($28)
.L01DB11A4_2EC7A4:
/* 0054A4 01DB11A4 E08781C7 */  lwc1        $f1, -0x7820($28)
/* 0054A8 01DB11A8 02A80146 */  mul.s       $f0, $f21, $f1
/* 0054AC 01DB11AC DC01013C */  lui         $1, %hi(velo__2)
/* 0054B0 01DB11B0 502520E4 */  swc1        $f0, %lo(velo__2)($1)
/* 0054B4 01DB11B4 02A00146 */  mul.s       $f0, $f20, $f1
/* 0054B8 01DB11B8 DC01013C */  lui         $1, %hi(velo__2 + 0x8)
/* 0054BC 01DB11BC 582520E4 */  swc1        $f0, %lo(velo__2 + 0x8)($1)
.L01DB11C0_2EC7C0:
/* 0054C0 01DB11C0 C89D81C7 */  lwc1        $f1, -0x6238($28)
/* 0054C4 01DB11C4 148480C7 */  lwc1        $f0, -0x7BEC($28)
/* 0054C8 01DB11C8 36080046 */  c.le.s      $f1, $f0
/* 0054CC 01DB11CC 00000000 */  nop
/* 0054D0 01DB11D0 08000045 */  bc1f        .L01DB11F4_2EC7F4
/* 0054D4 01DB11D4 00000000 */   nop
/* 0054D8 01DB11D8 789C838F */  lw          $3, -0x6388($28)
/* 0054DC 01DB11DC 01000224 */  addiu       $2, $0, 0x1
/* 0054E0 01DB11E0 0100013C */  lui         $1, (0x10000 >> 16)
/* 0054E4 01DB11E4 21086100 */  addu        $1, $3, $1
/* 0054E8 01DB11E8 088B22AC */  sw          $2, -0x74F8($1)
/* 0054EC 01DB11EC 05000010 */  b           .L01DB1204_2EC804
/* 0054F0 01DB11F0 00000000 */   nop
.L01DB11F4_2EC7F4:
/* 0054F4 01DB11F4 789C828F */  lw          $2, -0x6388($28)
/* 0054F8 01DB11F8 0100013C */  lui         $1, (0x10000 >> 16)
/* 0054FC 01DB11FC 21084100 */  addu        $1, $2, $1
/* 005500 01DB1200 088B20AC */  sw          $0, -0x74F8($1)
.L01DB1204_2EC804:
/* 005504 01DB1204 789C828F */  lw          $2, -0x6388($28)
/* 005508 01DB1208 1C434324 */  addiu       $3, $2, 0x431C
/* 00550C 01DB120C 1C43428C */  lw          $2, 0x431C($2)
/* 005510 01DB1210 14004010 */  beqz        $2, .L01DB1264_2EC864
/* 005514 01DB1214 00000000 */   nop
/* 005518 01DB1218 000060AC */  sw          $0, 0x0($3)
/* 00551C 01DB121C 1E000224 */  addiu       $2, $0, 0x1E
/* 005520 01DB1220 FC9D82AF */  sw          $2, -0x6204($28)
/* 005524 01DB1224 E601013C */  lui         $1, %hi(EnemyLifeGage + 0x14)
/* 005528 01DB1228 348F20AC */  sw          $0, %lo(EnemyLifeGage + 0x14)($1)
/* 00552C 01DB122C 01000224 */  addiu       $2, $0, 0x1
/* 005530 01DB1230 749D82AF */  sw          $2, -0x628C($28)
/* 005534 01DB1234 28260070 */  paddub      $4, $0, $0
/* 005538 01DB1238 B004770C */  jal         SetMIniMapStatus__Fi
/* 00553C 01DB123C 00000000 */   nop
/* 005540 01DB1240 FFFF0524 */  addiu       $5, $0, -0x1
/* 005544 01DB1244 B49D85AF */  sw          $5, -0x624C($28)
/* 005548 01DB1248 1C9D80AF */  sw          $0, -0x62E4($28)
/* 00554C 01DB124C 01000424 */  addiu       $4, $0, 0x1
/* 005550 01DB1250 28360070 */  paddub      $6, $0, $0
/* 005554 01DB1254 AC69050C */  jal         SndSePlay__Fiii
/* 005558 01DB1258 00000000 */   nop
/* 00555C 01DB125C 02180010 */  b           .L.L01DB7268_2F2868$b
/* 005560 01DB1260 00000000 */   nop
.L01DB1264_2EC864:
/* 005564 01DB1264 CC01023C */  lui         $2, %hi(GamePad)
/* 005568 01DB1268 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 00556C 01DB126C 10000524 */  addiu       $5, $0, 0x10
/* 005570 01DB1270 1CAE040C */  jal         Down__8CGamePadFi
/* 005574 01DB1274 00000000 */   nop
/* 005578 01DB1278 33004010 */  beqz        $2, .L01DB1348_2EC948
/* 00557C 01DB127C 00000000 */   nop
/* 005580 01DB1280 281E0070 */  paddub      $3, $0, $0
/* 005584 01DB1284 00008044 */  mtc1        $0, $f0
/* 005588 01DB1288 00000000 */  nop
/* 00558C 01DB128C 32001546 */  c.eq.s      $f0, $f21
/* 005590 01DB1290 00000000 */  nop
/* 005594 01DB1294 0A000045 */  bc1f        .L01DB12C0_2EC8C0
/* 005598 01DB1298 00000000 */   nop
/* 00559C 01DB129C 32001446 */  c.eq.s      $f0, $f20
/* 0055A0 01DB12A0 00000000 */  nop
/* 0055A4 01DB12A4 06000045 */  bc1f        .L01DB12C0_2EC8C0
/* 0055A8 01DB12A8 00000000 */   nop
/* 0055AC 01DB12AC DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 0055B0 01DB12B0 9044228C */  lw          $2, %lo(BtActStatus + 0x10)($1)
/* 0055B4 01DB12B4 02004014 */  bnez        $2, .L01DB12C0_2EC8C0
/* 0055B8 01DB12B8 00000000 */   nop
/* 0055BC 01DB12BC 01000324 */  addiu       $3, $0, 0x1
.L01DB12C0_2EC8C0:
/* 0055C0 01DB12C0 789C848F */  lw          $4, -0x6388($28)
/* 0055C4 01DB12C4 04008280 */  lb          $2, 0x4($4)
/* 0055C8 01DB12C8 40100200 */  sll         $2, $2, 1
/* 0055CC 01DB12CC 21104400 */  addu        $2, $2, $4
/* 0055D0 01DB12D0 12004284 */  lh          $2, 0x12($2)
/* 0055D4 01DB12D4 0200401C */  bgtz        $2, .L01DB12E0_2EC8E0
/* 0055D8 01DB12D8 00000000 */   nop
/* 0055DC 01DB12DC 281E0070 */  paddub      $3, $0, $0
.L01DB12E0_2EC8E0:
/* 0055E0 01DB12E0 DC01013C */  lui         $1, %hi(BtActStatus + 0x98)
/* 0055E4 01DB12E4 1845228C */  lw          $2, %lo(BtActStatus + 0x98)($1)
/* 0055E8 01DB12E8 02004010 */  beqz        $2, .L01DB12F4_2EC8F4
/* 0055EC 01DB12EC 00000000 */   nop
/* 0055F0 01DB12F0 01000324 */  addiu       $3, $0, 0x1
.L01DB12F4_2EC8F4:
/* 0055F4 01DB12F4 14006010 */  beqz        $3, .L01DB1348_2EC948
/* 0055F8 01DB12F8 00000000 */   nop
/* 0055FC 01DB12FC 1C4380AC */  sw          $0, 0x431C($4)
/* 005600 01DB1300 1E000224 */  addiu       $2, $0, 0x1E
/* 005604 01DB1304 FC9D82AF */  sw          $2, -0x6204($28)
/* 005608 01DB1308 E601013C */  lui         $1, %hi(EnemyLifeGage + 0x14)
/* 00560C 01DB130C 348F20AC */  sw          $0, %lo(EnemyLifeGage + 0x14)($1)
/* 005610 01DB1310 01000224 */  addiu       $2, $0, 0x1
/* 005614 01DB1314 749D82AF */  sw          $2, -0x628C($28)
/* 005618 01DB1318 28260070 */  paddub      $4, $0, $0
/* 00561C 01DB131C B004770C */  jal         SetMIniMapStatus__Fi
/* 005620 01DB1320 00000000 */   nop
/* 005624 01DB1324 FFFF0524 */  addiu       $5, $0, -0x1
/* 005628 01DB1328 B49D85AF */  sw          $5, -0x624C($28)
/* 00562C 01DB132C 1C9D80AF */  sw          $0, -0x62E4($28)
/* 005630 01DB1330 01000424 */  addiu       $4, $0, 0x1
/* 005634 01DB1334 28360070 */  paddub      $6, $0, $0
/* 005638 01DB1338 AC69050C */  jal         SndSePlay__Fiii
/* 00563C 01DB133C 00000000 */   nop
/* 005640 01DB1340 C9170010 */  b           .L.L01DB7268_2F2868$b
/* 005644 01DB1344 00000000 */   nop
.L01DB1348_2EC948:
/* 005648 01DB1348 00008044 */  mtc1        $0, $f0
/* 00564C 01DB134C 00000000 */  nop
/* 005650 01DB1350 32001546 */  c.eq.s      $f0, $f21
/* 005654 01DB1354 00000000 */  nop
/* 005658 01DB1358 05000045 */  bc1f        .L01DB1370_2EC970
/* 00565C 01DB135C 00000000 */   nop
/* 005660 01DB1360 32001446 */  c.eq.s      $f0, $f20
/* 005664 01DB1364 00000000 */  nop
/* 005668 01DB1368 19000145 */  bc1t        .L01DB13D0_2EC9D0
/* 00566C 01DB136C 00000000 */   nop
.L01DB1370_2EC970:
/* 005670 01DB1370 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 005674 01DB1374 9044228C */  lw          $2, %lo(BtActStatus + 0x10)($1)
/* 005678 01DB1378 06004010 */  beqz        $2, .L01DB1394_2EC994
/* 00567C 01DB137C 00000000 */   nop
/* 005680 01DB1380 789C828F */  lw          $2, -0x6388($28)
/* 005684 01DB1384 04004380 */  lb          $3, 0x4($2)
/* 005688 01DB1388 05000224 */  addiu       $2, $0, 0x5
/* 00568C 01DB138C 10006214 */  bne         $3, $2, .L01DB13D0_2EC9D0
/* 005690 01DB1390 00000000 */   nop
.L01DB1394_2EC994:
/* 005694 01DB1394 06AB0046 */  mov.s       $f12, $f21
/* 005698 01DB1398 46A30046 */  mov.s       $f13, $f20
/* 00569C 01DB139C 5077040C */  jal         atan2f
/* 0056A0 01DB13A0 00000000 */   nop
/* 0056A4 01DB13A4 109D848F */  lw          $4, -0x62F0($28)
/* 0056A8 01DB13A8 06030046 */  mov.s       $f12, $f0
/* 0056AC 01DB13AC 0402050C */  jal         unitRotation__FP9CFrameVu1f
/* 0056B0 01DB13B0 00000000 */   nop
/* 0056B4 01DB13B4 00608044 */  mtc1        $0, $f12
/* 0056B8 01DB13B8 00000000 */  nop
/* 0056BC 01DB13BC 86630046 */  mov.s       $f14, $f12
/* 0056C0 01DB13C0 109D848F */  lw          $4, -0x62F0($28)
/* 0056C4 01DB13C4 46030046 */  mov.s       $f13, $f0
/* 0056C8 01DB13C8 70A3040C */  jal         SetRotation__6CFrameFfff
/* 0056CC 01DB13CC 00000000 */   nop
.L01DB13D0_2EC9D0:
/* 0056D0 01DB13D0 E08380C7 */  lwc1        $f0, -0x7C20($28)
/* 0056D4 01DB13D4 EA01013C */  lui         $1, %hi(CharaMain + 0x344)
/* 0056D8 01DB13D8 6420228C */  lw          $2, %lo(CharaMain + 0x344)($1)
/* 0056DC 01DB13DC 080040E4 */  swc1        $f0, 0x8($2)
/* 0056E0 01DB13E0 06BB0046 */  mov.s       $f12, $f23
/* 0056E4 01DB13E4 46B30046 */  mov.s       $f13, $f22
/* 0056E8 01DB13E8 EA01013C */  lui         $1, %hi(CharaMain + 0x344)
/* 0056EC 01DB13EC 6420248C */  lw          $4, %lo(CharaMain + 0x344)($1)
/* 0056F0 01DB13F0 5C01050C */  jal         keyCtrl__FffP11MOTION_INFO
/* 0056F4 01DB13F4 00000000 */   nop
/* 0056F8 01DB13F8 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 0056FC 01DB13FC 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
/* 005700 01DB1400 789C838F */  lw          $3, -0x6388($28)
/* 005704 01DB1404 04006424 */  addiu       $4, $3, 0x4
/* 005708 01DB1408 04006280 */  lb          $2, 0x4($3)
/* 00570C 01DB140C 40100200 */  sll         $2, $2, 1
/* 005710 01DB1410 21104300 */  addu        $2, $2, $3
/* 005714 01DB1414 12004284 */  lh          $2, 0x12($2)
/* 005718 01DB1418 0400401C */  bgtz        $2, .L01DB142C_2ECA2C
/* 00571C 01DB141C 00000000 */   nop
/* 005720 01DB1420 17000224 */  addiu       $2, $0, 0x17
/* 005724 01DB1424 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 005728 01DB1428 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
.L01DB142C_2ECA2C:
/* 00572C 01DB142C DC01013C */  lui         $1, %hi(BtActStatus + 0x20)
/* 005730 01DB1430 A044228C */  lw          $2, %lo(BtActStatus + 0x20)($1)
/* 005734 01DB1434 12004010 */  beqz        $2, .L01DB1480_2ECA80
/* 005738 01DB1438 00000000 */   nop
/* 00573C 01DB143C C89D81C7 */  lwc1        $f1, -0x6238($28)
/* 005740 01DB1440 DC8380C7 */  lwc1        $f0, -0x7C24($28)
/* 005744 01DB1444 34080046 */  c.lt.s      $f1, $f0
/* 005748 01DB1448 00000000 */  nop
/* 00574C 01DB144C 07000145 */  bc1t        .L01DB146C_2ECA6C
/* 005750 01DB1450 00000000 */   nop
/* 005754 01DB1454 00008280 */  lb          $2, 0x0($4)
/* 005758 01DB1458 04004014 */  bnez        $2, .L01DB146C_2ECA6C
/* 00575C 01DB145C 00000000 */   nop
/* 005760 01DB1460 1D000224 */  addiu       $2, $0, 0x1D
/* 005764 01DB1464 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 005768 01DB1468 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
.L01DB146C_2ECA6C:
/* 00576C 01DB146C DC01013C */  lui         $1, %hi(BtActStatus + 0x20)
/* 005770 01DB1470 A044228C */  lw          $2, %lo(BtActStatus + 0x20)($1)
/* 005774 01DB1474 FFFF4224 */  addiu       $2, $2, -0x1
/* 005778 01DB1478 DC01013C */  lui         $1, %hi(BtActStatus + 0x20)
/* 00577C 01DB147C A04422AC */  sw          $2, %lo(BtActStatus + 0x20)($1)
.L01DB1480_2ECA80:
/* 005780 01DB1480 DC01013C */  lui         $1, %hi(BtActStatus + 0x24)
/* 005784 01DB1484 A444228C */  lw          $2, %lo(BtActStatus + 0x24)($1)
/* 005788 01DB1488 04004018 */  blez        $2, .L01DB149C_2ECA9C
/* 00578C 01DB148C 00000000 */   nop
/* 005790 01DB1490 FFFF4224 */  addiu       $2, $2, -0x1
/* 005794 01DB1494 DC01013C */  lui         $1, %hi(BtActStatus + 0x24)
/* 005798 01DB1498 A44422AC */  sw          $2, %lo(BtActStatus + 0x24)($1)
.L01DB149C_2ECA9C:
/* 00579C 01DB149C CC01023C */  lui         $2, %hi(GamePad)
/* 0057A0 01DB14A0 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0057A4 01DB14A4 00010524 */  addiu       $5, $0, 0x100
/* 0057A8 01DB14A8 1CAE040C */  jal         Down__8CGamePadFi
/* 0057AC 01DB14AC 00000000 */   nop
/* 0057B0 01DB14B0 26004010 */  beqz        $2, .L01DB154C_2ECB4C
/* 0057B4 01DB14B4 00000000 */   nop
/* 0057B8 01DB14B8 789C828F */  lw          $2, -0x6388($28)
/* 0057BC 01DB14BC 05004280 */  lb          $2, 0x5($2)
/* 0057C0 01DB14C0 02004228 */  slti        $2, $2, 0x2
/* 0057C4 01DB14C4 21004014 */  bnez        $2, .L01DB154C_2ECB4C
/* 0057C8 01DB14C8 00000000 */   nop
/* 0057CC 01DB14CC DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 0057D0 01DB14D0 9044228C */  lw          $2, %lo(BtActStatus + 0x10)($1)
/* 0057D4 01DB14D4 1D004014 */  bnez        $2, .L01DB154C_2ECB4C
/* 0057D8 01DB14D8 00000000 */   nop
/* 0057DC 01DB14DC EA01013C */  lui         $1, %hi(DngMessMan)
/* 0057E0 01DB14E0 907620AC */  sw          $0, %lo(DngMessMan)($1)
/* 0057E4 01DB14E4 FFFF0224 */  addiu       $2, $0, -0x1
/* 0057E8 01DB14E8 EA01013C */  lui         $1, %hi(DngMessMan + 0x24)
/* 0057EC 01DB14EC B47622AC */  sw          $2, %lo(DngMessMan + 0x24)($1)
/* 0057F0 01DB14F0 EA01013C */  lui         $1, %hi(DngMessMan + 0x4)
/* 0057F4 01DB14F4 947620AC */  sw          $0, %lo(DngMessMan + 0x4)($1)
/* 0057F8 01DB14F8 EA01013C */  lui         $1, %hi(DngMessMan + 0x1C)
/* 0057FC 01DB14FC AC7620AC */  sw          $0, %lo(DngMessMan + 0x1C)($1)
/* 005800 01DB1500 EA01013C */  lui         $1, %hi(DngMessMan + 0x20)
/* 005804 01DB1504 B07620AC */  sw          $0, %lo(DngMessMan + 0x20)($1)
/* 005808 01DB1508 EA01013C */  lui         $1, %hi(DngMessMan + 0x8)
/* 00580C 01DB150C 987620AC */  sw          $0, %lo(DngMessMan + 0x8)($1)
/* 005810 01DB1510 349E80AF */  sw          $0, -0x61CC($28)
/* 005814 01DB1514 E601013C */  lui         $1, %hi(EnemyLifeGage + 0x14)
/* 005818 01DB1518 348F20AC */  sw          $0, %lo(EnemyLifeGage + 0x14)($1)
/* 00581C 01DB151C 28260070 */  paddub      $4, $0, $0
/* 005820 01DB1520 A44C070C */  jal         BtMiniChrSelect_Init__Fi
/* 005824 01DB1524 00000000 */   nop
/* 005828 01DB1528 789C828F */  lw          $2, -0x6388($28)
/* 00582C 01DB152C 04004280 */  lb          $2, 0x4($2)
/* 005830 01DB1530 008B82AF */  sw          $2, -0x7500($28)
/* 005834 01DB1534 27010224 */  addiu       $2, $0, 0x127
/* 005838 01DB1538 FC9D82AF */  sw          $2, -0x6204($28)
/* 00583C 01DB153C 5CFA760C */  jal         autoCamTrial__Fv
/* 005840 01DB1540 00000000 */   nop
/* 005844 01DB1544 48170010 */  b           .L.L01DB7268_2F2868$b
/* 005848 01DB1548 00000000 */   nop
.L01DB154C_2ECB4C:
/* 00584C 01DB154C 709E8283 */  lb          $2, -0x6190($28)
/* 005850 01DB1550 04004014 */  bnez        $2, .L01DB1564_2ECB64
/* 005854 01DB1554 00000000 */   nop
/* 005858 01DB1558 6C9E80AF */  sw          $0, -0x6194($28)
/* 00585C 01DB155C 01000224 */  addiu       $2, $0, 0x1
/* 005860 01DB1560 709E82A3 */  sb          $2, -0x6190($28)
.L01DB1564_2ECB64:
/* 005864 01DB1564 109D828F */  lw          $2, -0x62F0($28)
/* 005868 01DB1568 3001A427 */  addiu       $4, $29, 0x130
/* 00586C 01DB156C 20024524 */  addiu       $5, $2, 0x220
/* 005870 01DB1570 0C86040C */  jal         sceVu0CopyVector
/* 005874 01DB1574 00000000 */   nop
/* 005878 01DB1578 6C9E828F */  lw          $2, -0x6194($28)
/* 00587C 01DB157C 05004228 */  slti        $2, $2, 0x5
/* 005880 01DB1580 07004014 */  bnez        $2, .L01DB15A0_2ECBA0
/* 005884 01DB1584 00000000 */   nop
/* 005888 01DB1588 C89C848F */  lw          $4, -0x6338($28)
/* 00588C 01DB158C 3001ACC7 */  lwc1        $f12, 0x130($29)
/* 005890 01DB1590 3801ADC7 */  lwc1        $f13, 0x138($29)
/* 005894 01DB1594 700E070C */  jal         checkMask__11CDungeonMapFff
/* 005898 01DB1598 00000000 */   nop
/* 00589C 01DB159C 6C9E80AF */  sw          $0, -0x6194($28)
.L01DB15A0_2ECBA0:
/* 0058A0 01DB15A0 6C9E828F */  lw          $2, -0x6194($28)
/* 0058A4 01DB15A4 01004224 */  addiu       $2, $2, 0x1
/* 0058A8 01DB15A8 6C9E82AF */  sw          $2, -0x6194($28)
/* 0058AC 01DB15AC DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 0058B0 01DB15B0 9044228C */  lw          $2, %lo(BtActStatus + 0x10)($1)
/* 0058B4 01DB15B4 33004014 */  bnez        $2, .L01DB1684_2ECC84
/* 0058B8 01DB15B8 00000000 */   nop
/* 0058BC 01DB15BC CC01023C */  lui         $2, %hi(GamePad)
/* 0058C0 01DB15C0 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0058C4 01DB15C4 00800534 */  ori         $5, $0, 0x8000
/* 0058C8 01DB15C8 1CAE040C */  jal         Down__8CGamePadFi
/* 0058CC 01DB15CC 00000000 */   nop
/* 0058D0 01DB15D0 13004010 */  beqz        $2, .L01DB1620_2ECC20
/* 0058D4 01DB15D4 00000000 */   nop
/* 0058D8 01DB15D8 28260070 */  paddub      $4, $0, $0
/* 0058DC 01DB15DC FFFF0524 */  addiu       $5, $0, -0x1
/* 0058E0 01DB15E0 28360070 */  paddub      $6, $0, $0
/* 0058E4 01DB15E4 AC69050C */  jal         SndSePlay__Fiii
/* 0058E8 01DB15E8 00000000 */   nop
/* 0058EC 01DB15EC A89D828F */  lw          $2, -0x6258($28)
/* 0058F0 01DB15F0 02004128 */  slti        $1, $2, 0x2
/* 0058F4 01DB15F4 05002010 */  beqz        $1, .L01DB160C_2ECC0C
/* 0058F8 01DB15F8 00000000 */   nop
/* 0058FC 01DB15FC 03000224 */  addiu       $2, $0, 0x3
/* 005900 01DB1600 A89D82AF */  sw          $2, -0x6258($28)
/* 005904 01DB1604 03000010 */  b           .L01DB1614_2ECC14
/* 005908 01DB1608 00000000 */   nop
.L01DB160C_2ECC0C:
/* 00590C 01DB160C FFFF4224 */  addiu       $2, $2, -0x1
/* 005910 01DB1610 A89D82AF */  sw          $2, -0x6258($28)
.L01DB1614_2ECC14:
/* 005914 01DB1614 A89D828F */  lw          $2, -0x6258($28)
/* 005918 01DB1618 EC01013C */  lui         $1, %hi(activeItem)
/* 00591C 01DB161C 707822AC */  sw          $2, %lo(activeItem)($1)
.L01DB1620_2ECC20:
/* 005920 01DB1620 CC01023C */  lui         $2, %hi(GamePad)
/* 005924 01DB1624 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 005928 01DB1628 00200524 */  addiu       $5, $0, 0x2000
/* 00592C 01DB162C 1CAE040C */  jal         Down__8CGamePadFi
/* 005930 01DB1630 00000000 */   nop
/* 005934 01DB1634 13004010 */  beqz        $2, .L01DB1684_2ECC84
/* 005938 01DB1638 00000000 */   nop
/* 00593C 01DB163C 28260070 */  paddub      $4, $0, $0
/* 005940 01DB1640 FFFF0524 */  addiu       $5, $0, -0x1
/* 005944 01DB1644 28360070 */  paddub      $6, $0, $0
/* 005948 01DB1648 AC69050C */  jal         SndSePlay__Fiii
/* 00594C 01DB164C 00000000 */   nop
/* 005950 01DB1650 A89D838F */  lw          $3, -0x6258($28)
/* 005954 01DB1654 03006228 */  slti        $2, $3, 0x3
/* 005958 01DB1658 05004014 */  bnez        $2, .L01DB1670_2ECC70
/* 00595C 01DB165C 00000000 */   nop
/* 005960 01DB1660 01000224 */  addiu       $2, $0, 0x1
/* 005964 01DB1664 A89D82AF */  sw          $2, -0x6258($28)
/* 005968 01DB1668 03000010 */  b           .L01DB1678_2ECC78
/* 00596C 01DB166C 00000000 */   nop
.L01DB1670_2ECC70:
/* 005970 01DB1670 01006224 */  addiu       $2, $3, 0x1
/* 005974 01DB1674 A89D82AF */  sw          $2, -0x6258($28)
.L01DB1678_2ECC78:
/* 005978 01DB1678 A89D828F */  lw          $2, -0x6258($28)
/* 00597C 01DB167C EC01013C */  lui         $1, %hi(activeItem)
/* 005980 01DB1680 707822AC */  sw          $2, %lo(activeItem)($1)
.L01DB1684_2ECC84:
/* 005984 01DB1684 CC01023C */  lui         $2, %hi(GamePad)
/* 005988 01DB1688 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 00598C 01DB168C A09C858F */  lw          $5, -0x6360($28)
/* 005990 01DB1690 1CAE040C */  jal         Down__8CGamePadFi
/* 005994 01DB1694 00000000 */   nop
/* 005998 01DB1698 2F004010 */  beqz        $2, .L01DB1758_2ECD58
/* 00599C 01DB169C 00000000 */   nop
/* 0059A0 01DB16A0 949D838F */  lw          $3, -0x626C($28)
/* 0059A4 01DB16A4 FFFF0524 */  addiu       $5, $0, -0x1
/* 0059A8 01DB16A8 19006514 */  bne         $3, $5, .L01DB1710_2ECD10
/* 0059AC 01DB16AC 00000000 */   nop
/* 0059B0 01DB16B0 109D848F */  lw          $4, -0x62F0($28)
/* 0059B4 01DB16B4 4001A527 */  addiu       $5, $29, 0x140
/* 0059B8 01DB16B8 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 0059BC 01DB16BC 00000000 */   nop
/* 0059C0 01DB16C0 6001ACC7 */  lwc1        $f12, 0x160($29)
/* 0059C4 01DB16C4 6801ADC7 */  lwc1        $f13, 0x168($29)
/* 0059C8 01DB16C8 5077040C */  jal         atan2f
/* 0059CC 01DB16CC 00000000 */   nop
/* 0059D0 01DB16D0 06030046 */  mov.s       $f12, $f0
/* 0059D4 01DB16D4 9044040C */  jal         fptodp
/* 0059D8 01DB16D8 00000000 */   nop
/* 0059DC 01DB16DC 188085DF */  ld          $5, -0x7FE8($28)
/* 0059E0 01DB16E0 28264070 */  paddub      $4, $2, $0
/* 0059E4 01DB16E4 843F040C */  jal         dpsub
/* 0059E8 01DB16E8 00000000 */   nop
/* 0059EC 01DB16EC 28264070 */  paddub      $4, $2, $0
/* 0059F0 01DB16F0 9241040C */  jal         dptofp
/* 0059F4 01DB16F4 00000000 */   nop
/* 0059F8 01DB16F8 A89C848F */  lw          $4, -0x6358($28)
/* 0059FC 01DB16FC 06030046 */  mov.s       $f12, $f0
/* 005A00 01DB1700 C892040C */  jal         SetAngle__13CCameraFollowFf
/* 005A04 01DB1704 00000000 */   nop
/* 005A08 01DB1708 13000010 */  b           .L01DB1758_2ECD58
/* 005A0C 01DB170C 00000000 */   nop
.L01DB1710_2ECD10:
/* 005A10 01DB1710 989D828F */  lw          $2, -0x6268($28)
/* 005A14 01DB1714 0B004014 */  bnez        $2, .L01DB1744_2ECD44
/* 005A18 01DB1718 00000000 */   nop
/* 005A1C 01DB171C 0E006510 */  beq         $3, $5, .L01DB1758_2ECD58
/* 005A20 01DB1720 00000000 */   nop
/* 005A24 01DB1724 01000224 */  addiu       $2, $0, 0x1
/* 005A28 01DB1728 989D82AF */  sw          $2, -0x6268($28)
/* 005A2C 01DB172C 11000424 */  addiu       $4, $0, 0x11
/* 005A30 01DB1730 28360070 */  paddub      $6, $0, $0
/* 005A34 01DB1734 AC69050C */  jal         SndSePlay__Fiii
/* 005A38 01DB1738 00000000 */   nop
/* 005A3C 01DB173C 06000010 */  b           .L01DB1758_2ECD58
/* 005A40 01DB1740 00000000 */   nop
.L01DB1744_2ECD44:
/* 005A44 01DB1744 989D80AF */  sw          $0, -0x6268($28)
/* 005A48 01DB1748 02000424 */  addiu       $4, $0, 0x2
/* 005A4C 01DB174C 28360070 */  paddub      $6, $0, $0
/* 005A50 01DB1750 AC69050C */  jal         SndSePlay__Fiii
/* 005A54 01DB1754 00000000 */   nop
.L01DB1758_2ECD58:
/* 005A58 01DB1758 CC01023C */  lui         $2, %hi(GamePad)
/* 005A5C 01DB175C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 005A60 01DB1760 04000524 */  addiu       $5, $0, 0x4
/* 005A64 01DB1764 1CAE040C */  jal         Down__8CGamePadFi
/* 005A68 01DB1768 00000000 */   nop
/* 005A6C 01DB176C 27004010 */  beqz        $2, .L01DB180C_2ECE0C
/* 005A70 01DB1770 00000000 */   nop
/* 005A74 01DB1774 DC01013C */  lui         $1, %hi(BtActStatus + 0x98)
/* 005A78 01DB1778 1845228C */  lw          $2, %lo(BtActStatus + 0x98)($1)
/* 005A7C 01DB177C 23004014 */  bnez        $2, .L01DB180C_2ECE0C
/* 005A80 01DB1780 00000000 */   nop
/* 005A84 01DB1784 989D828F */  lw          $2, -0x6268($28)
/* 005A88 01DB1788 20004010 */  beqz        $2, .L01DB180C_2ECE0C
/* 005A8C 01DB178C 00000000 */   nop
/* 005A90 01DB1790 9C9D838F */  lw          $3, -0x6264($28)
/* 005A94 01DB1794 A09D828F */  lw          $2, -0x6260($28)
/* 005A98 01DB1798 FFFF4224 */  addiu       $2, $2, -0x1
/* 005A9C 01DB179C 2A106200 */  slt         $2, $3, $2
/* 005AA0 01DB17A0 0E004014 */  bnez        $2, .L01DB17DC_2ECDDC
/* 005AA4 01DB17A4 00000000 */   nop
/* 005AA8 01DB17A8 9C9D80AF */  sw          $0, -0x6264($28)
/* 005AAC 01DB17AC 28260070 */  paddub      $4, $0, $0
/* 005AB0 01DB17B0 282E0070 */  paddub      $5, $0, $0
/* 005AB4 01DB17B4 5800770C */  jal         SetNearLockOnTarget__Fii
/* 005AB8 01DB17B8 00000000 */   nop
/* 005ABC 01DB17BC A09D82AF */  sw          $2, -0x6260($28)
/* 005AC0 01DB17C0 11000424 */  addiu       $4, $0, 0x11
/* 005AC4 01DB17C4 FFFF0524 */  addiu       $5, $0, -0x1
/* 005AC8 01DB17C8 28360070 */  paddub      $6, $0, $0
/* 005ACC 01DB17CC AC69050C */  jal         SndSePlay__Fiii
/* 005AD0 01DB17D0 00000000 */   nop
/* 005AD4 01DB17D4 0D000010 */  b           .L01DB180C_2ECE0C
/* 005AD8 01DB17D8 00000000 */   nop
.L01DB17DC_2ECDDC:
/* 005ADC 01DB17DC 01006224 */  addiu       $2, $3, 0x1
/* 005AE0 01DB17E0 9C9D82AF */  sw          $2, -0x6264($28)
/* 005AE4 01DB17E4 9C9D848F */  lw          $4, -0x6264($28)
/* 005AE8 01DB17E8 282E0070 */  paddub      $5, $0, $0
/* 005AEC 01DB17EC 5800770C */  jal         SetNearLockOnTarget__Fii
/* 005AF0 01DB17F0 00000000 */   nop
/* 005AF4 01DB17F4 A09D82AF */  sw          $2, -0x6260($28)
/* 005AF8 01DB17F8 11000424 */  addiu       $4, $0, 0x11
/* 005AFC 01DB17FC FFFF0524 */  addiu       $5, $0, -0x1
/* 005B00 01DB1800 28360070 */  paddub      $6, $0, $0
/* 005B04 01DB1804 AC69050C */  jal         SndSePlay__Fiii
/* 005B08 01DB1808 00000000 */   nop
.L01DB180C_2ECE0C:
/* 005B0C 01DB180C A49D848F */  lw          $4, -0x625C($28)
/* 005B10 01DB1810 282E0070 */  paddub      $5, $0, $0
/* 005B14 01DB1814 A4BF060C */  jal         SetBattleStyle__Fii
/* 005B18 01DB1818 00000000 */   nop
/* 005B1C 01DB181C 7042023C */  lui         $2, (0x42700000 >> 16)
/* 005B20 01DB1820 00088244 */  mtc1        $2, $f1
/* 005B24 01DB1824 00000000 */  nop
/* 005B28 01DB1828 36000146 */  c.le.s      $f0, $f1
/* 005B2C 01DB182C 00000000 */  nop
/* 005B30 01DB1830 0E000045 */  bc1f        .L01DB186C_2ECE6C
/* 005B34 01DB1834 00000000 */   nop
/* 005B38 01DB1838 00008044 */  mtc1        $0, $f0
/* 005B3C 01DB183C 00000000 */  nop
/* 005B40 01DB1840 32001546 */  c.eq.s      $f0, $f21
/* 005B44 01DB1844 00000000 */  nop
/* 005B48 01DB1848 08000045 */  bc1f        .L01DB186C_2ECE6C
/* 005B4C 01DB184C 00000000 */   nop
/* 005B50 01DB1850 32001446 */  c.eq.s      $f0, $f20
/* 005B54 01DB1854 00000000 */  nop
/* 005B58 01DB1858 04000045 */  bc1f        .L01DB186C_2ECE6C
/* 005B5C 01DB185C 00000000 */   nop
/* 005B60 01DB1860 12000224 */  addiu       $2, $0, 0x12
/* 005B64 01DB1864 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 005B68 01DB1868 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
.L01DB186C_2ECE6C:
/* 005B6C 01DB186C 989D828F */  lw          $2, -0x6268($28)
/* 005B70 01DB1870 A1004010 */  beqz        $2, .L01DB1AF8_2ED0F8
/* 005B74 01DB1874 00000000 */   nop
/* 005B78 01DB1878 949D838F */  lw          $3, -0x626C($28)
/* 005B7C 01DB187C 10350224 */  addiu       $2, $0, 0x3510
/* 005B80 01DB1880 18186200 */  mult        $3, $3, $2
/* 005B84 01DB1884 E09C828F */  lw          $2, -0x6320($28)
/* 005B88 01DB1888 21104300 */  addu        $2, $2, $3
/* 005B8C 01DB188C 0100013C */  lui         $1, (0x1FCD0 >> 16)
/* 005B90 01DB1890 D0FC2134 */  ori         $1, $1, (0x1FCD0 & 0xFFFF)
/* 005B94 01DB1894 21204100 */  addu        $4, $2, $1
/* 005B98 01DB1898 8001A527 */  addiu       $5, $29, 0x180
/* 005B9C 01DB189C A000998C */  lw          $25, 0xA0($4)
/* 005BA0 01DB18A0 A000398F */  lw          $25, 0xA0($25)
/* 005BA4 01DB18A4 09F82003 */  jalr        $25
/* 005BA8 01DB18A8 00000000 */   nop
/* 005BAC 01DB18AC B000A1C7 */  lwc1        $f1, 0xB0($29)
/* 005BB0 01DB18B0 8001A0C7 */  lwc1        $f0, 0x180($29)
/* 005BB4 01DB18B4 010B0046 */  sub.s       $f12, $f1, $f0
/* 005BB8 01DB18B8 B800B027 */  addiu       $16, $29, 0xB8
/* 005BBC 01DB18BC 000001C6 */  lwc1        $f1, 0x0($16)
/* 005BC0 01DB18C0 8801B127 */  addiu       $17, $29, 0x188
/* 005BC4 01DB18C4 000020C6 */  lwc1        $f0, 0x0($17)
/* 005BC8 01DB18C8 410B0046 */  sub.s       $f13, $f1, $f0
/* 005BCC 01DB18CC 5077040C */  jal         atan2f
/* 005BD0 01DB18D0 00000000 */   nop
/* 005BD4 01DB18D4 8001A1C7 */  lwc1        $f1, 0x180($29)
/* 005BD8 01DB18D8 B000A0C7 */  lwc1        $f0, 0xB0($29)
/* 005BDC 01DB18DC 010B0046 */  sub.s       $f12, $f1, $f0
/* 005BE0 01DB18E0 000021C6 */  lwc1        $f1, 0x0($17)
/* 005BE4 01DB18E4 000000C6 */  lwc1        $f0, 0x0($16)
/* 005BE8 01DB18E8 410B0046 */  sub.s       $f13, $f1, $f0
/* 005BEC 01DB18EC 5077040C */  jal         atan2f
/* 005BF0 01DB18F0 00000000 */   nop
/* 005BF4 01DB18F4 C6050046 */  mov.s       $f23, $f0
/* 005BF8 01DB18F8 DC01013C */  lui         $1, %hi(BtActStatus + 0xBC)
/* 005BFC 01DB18FC 3C4520C4 */  lwc1        $f0, %lo(BtActStatus + 0xBC)($1)
/* 005C00 01DB1900 00708044 */  mtc1        $0, $f14
/* 005C04 01DB1904 00000000 */  nop
/* 005C08 01DB1908 36000E46 */  c.le.s      $f0, $f14
/* 005C0C 01DB190C 00000000 */  nop
/* 005C10 01DB1910 08000145 */  bc1t        .L01DB1934_2ECF34
/* 005C14 01DB1914 00000000 */   nop
/* 005C18 01DB1918 06730046 */  mov.s       $f12, $f14
/* 005C1C 01DB191C 109D848F */  lw          $4, -0x62F0($28)
/* 005C20 01DB1920 46BB0046 */  mov.s       $f13, $f23
/* 005C24 01DB1924 70A3040C */  jal         SetRotation__6CFrameFfff
/* 005C28 01DB1928 00000000 */   nop
/* 005C2C 01DB192C 0C000010 */  b           .L01DB1960_2ECF60
/* 005C30 01DB1930 00000000 */   nop
.L01DB1934_2ECF34:
/* 005C34 01DB1934 86750046 */  mov.s       $f22, $f14
/* 005C38 01DB1938 109D848F */  lw          $4, -0x62F0($28)
/* 005C3C 01DB193C 06BB0046 */  mov.s       $f12, $f23
/* 005C40 01DB1940 0402050C */  jal         unitRotation__FP9CFrameVu1f
/* 005C44 01DB1944 00000000 */   nop
/* 005C48 01DB1948 86B30046 */  mov.s       $f14, $f22
/* 005C4C 01DB194C 109D848F */  lw          $4, -0x62F0($28)
/* 005C50 01DB1950 06B30046 */  mov.s       $f12, $f22
/* 005C54 01DB1954 46030046 */  mov.s       $f13, $f0
/* 005C58 01DB1958 70A3040C */  jal         SetRotation__6CFrameFfff
/* 005C5C 01DB195C 00000000 */   nop
.L01DB1960_2ECF60:
/* 005C60 01DB1960 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 005C64 01DB1964 9044228C */  lw          $2, %lo(BtActStatus + 0x10)($1)
/* 005C68 01DB1968 63004014 */  bnez        $2, .L01DB1AF8_2ED0F8
/* 005C6C 01DB196C 00000000 */   nop
/* 005C70 01DB1970 12000224 */  addiu       $2, $0, 0x12
/* 005C74 01DB1974 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 005C78 01DB1978 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
/* 005C7C 01DB197C 608480C7 */  lwc1        $f0, -0x7BA0($28)
/* 005C80 01DB1980 EA01013C */  lui         $1, %hi(CharaMain + 0x344)
/* 005C84 01DB1984 6420228C */  lw          $2, %lo(CharaMain + 0x344)($1)
/* 005C88 01DB1988 280140E4 */  swc1        $f0, 0x128($2)
/* 005C8C 01DB198C 06AB0046 */  mov.s       $f12, $f21
/* 005C90 01DB1990 46A30046 */  mov.s       $f13, $f20
/* 005C94 01DB1994 5077040C */  jal         atan2f
/* 005C98 01DB1998 00000000 */   nop
/* 005C9C 01DB199C 01B80046 */  sub.s       $f0, $f23, $f0
/* 005CA0 01DB19A0 648481C7 */  lwc1        $f1, -0x7B9C($28)
/* 005CA4 01DB19A4 34000146 */  c.lt.s      $f0, $f1
/* 005CA8 01DB19A8 00000000 */  nop
/* 005CAC 01DB19AC 03000045 */  bc1f        .L01DB19BC_2ECFBC
/* 005CB0 01DB19B0 00000000 */   nop
/* 005CB4 01DB19B4 688481C7 */  lwc1        $f1, -0x7B98($28)
/* 005CB8 01DB19B8 00000146 */  add.s       $f0, $f0, $f1
.L01DB19BC_2ECFBC:
/* 005CBC 01DB19BC 448481C7 */  lwc1        $f1, -0x7BBC($28)
/* 005CC0 01DB19C0 36000146 */  c.le.s      $f0, $f1
/* 005CC4 01DB19C4 00000000 */  nop
/* 005CC8 01DB19C8 03000145 */  bc1t        .L01DB19D8_2ECFD8
/* 005CCC 01DB19CC 00000000 */   nop
/* 005CD0 01DB19D0 688481C7 */  lwc1        $f1, -0x7B98($28)
/* 005CD4 01DB19D4 01000146 */  sub.s       $f0, $f0, $f1
.L01DB19D8_2ECFD8:
/* 005CD8 01DB19D8 12000424 */  addiu       $4, $0, 0x12
/* 005CDC 01DB19DC 6C8481C7 */  lwc1        $f1, -0x7B94($28)
/* 005CE0 01DB19E0 36000146 */  c.le.s      $f0, $f1
/* 005CE4 01DB19E4 00000000 */  nop
/* 005CE8 01DB19E8 07000145 */  bc1t        .L01DB1A08_2ED008
/* 005CEC 01DB19EC 00000000 */   nop
/* 005CF0 01DB19F0 088381C7 */  lwc1        $f1, -0x7CF8($28)
/* 005CF4 01DB19F4 34000146 */  c.lt.s      $f0, $f1
/* 005CF8 01DB19F8 00000000 */  nop
/* 005CFC 01DB19FC 02000045 */  bc1f        .L01DB1A08_2ED008
/* 005D00 01DB1A00 00000000 */   nop
/* 005D04 01DB1A04 15000424 */  addiu       $4, $0, 0x15
.L01DB1A08_2ED008:
/* 005D08 01DB1A08 708481C7 */  lwc1        $f1, -0x7B90($28)
/* 005D0C 01DB1A0C 34000146 */  c.lt.s      $f0, $f1
/* 005D10 01DB1A10 00000000 */  nop
/* 005D14 01DB1A14 06000145 */  bc1t        .L01DB1A30_2ED030
/* 005D18 01DB1A18 00000000 */   nop
/* 005D1C 01DB1A1C 748481C7 */  lwc1        $f1, -0x7B8C($28)
/* 005D20 01DB1A20 36000146 */  c.le.s      $f0, $f1
/* 005D24 01DB1A24 00000000 */  nop
/* 005D28 01DB1A28 02000145 */  bc1t        .L01DB1A34_2ED034
/* 005D2C 01DB1A2C 00000000 */   nop
.L01DB1A30_2ED030:
/* 005D30 01DB1A30 16000424 */  addiu       $4, $0, 0x16
.L01DB1A34_2ED034:
/* 005D34 01DB1A34 088381C7 */  lwc1        $f1, -0x7CF8($28)
/* 005D38 01DB1A38 36000146 */  c.le.s      $f0, $f1
/* 005D3C 01DB1A3C 00000000 */  nop
/* 005D40 01DB1A40 07000145 */  bc1t        .L01DB1A60_2ED060
/* 005D44 01DB1A44 00000000 */   nop
/* 005D48 01DB1A48 748481C7 */  lwc1        $f1, -0x7B8C($28)
/* 005D4C 01DB1A4C 34000146 */  c.lt.s      $f0, $f1
/* 005D50 01DB1A50 00000000 */  nop
/* 005D54 01DB1A54 02000045 */  bc1f        .L01DB1A60_2ED060
/* 005D58 01DB1A58 00000000 */   nop
/* 005D5C 01DB1A5C 13000424 */  addiu       $4, $0, 0x13
.L01DB1A60_2ED060:
/* 005D60 01DB1A60 6C8481C7 */  lwc1        $f1, -0x7B94($28)
/* 005D64 01DB1A64 34000146 */  c.lt.s      $f0, $f1
/* 005D68 01DB1A68 00000000 */  nop
/* 005D6C 01DB1A6C 07000045 */  bc1f        .L01DB1A8C_2ED08C
/* 005D70 01DB1A70 00000000 */   nop
/* 005D74 01DB1A74 708481C7 */  lwc1        $f1, -0x7B90($28)
/* 005D78 01DB1A78 36000146 */  c.le.s      $f0, $f1
/* 005D7C 01DB1A7C 00000000 */  nop
/* 005D80 01DB1A80 02000145 */  bc1t        .L01DB1A8C_2ED08C
/* 005D84 01DB1A84 00000000 */   nop
/* 005D88 01DB1A88 14000424 */  addiu       $4, $0, 0x14
.L01DB1A8C_2ED08C:
/* 005D8C 01DB1A8C DC01013C */  lui         $1, %hi(BtActStatus + 0xBC)
/* 005D90 01DB1A90 3C4521C4 */  lwc1        $f1, %lo(BtActStatus + 0xBC)($1)
/* 005D94 01DB1A94 00008044 */  mtc1        $0, $f0
/* 005D98 01DB1A98 00000000 */  nop
/* 005D9C 01DB1A9C 36080046 */  c.le.s      $f1, $f0
/* 005DA0 01DB1AA0 00000000 */  nop
/* 005DA4 01DB1AA4 14000145 */  bc1t        .L01DB1AF8_2ED0F8
/* 005DA8 01DB1AA8 00000000 */   nop
/* 005DAC 01DB1AAC DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 005DB0 01DB1AB0 8C4424AC */  sw          $4, %lo(BtActStatus + 0xC)($1)
/* 005DB4 01DB1AB4 608481C7 */  lwc1        $f1, -0x7BA0($28)
/* 005DB8 01DB1AB8 DC01013C */  lui         $1, %hi(BtActStatus + 0xBC)
/* 005DBC 01DB1ABC 3C4520C4 */  lwc1        $f0, %lo(BtActStatus + 0xBC)($1)
/* 005DC0 01DB1AC0 40080046 */  add.s       $f1, $f1, $f0
/* 005DC4 01DB1AC4 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 005DC8 01DB1AC8 00008244 */  mtc1        $2, $f0
/* 005DCC 01DB1ACC 00000000 */  nop
/* 005DD0 01DB1AD0 34080046 */  c.lt.s      $f1, $f0
/* 005DD4 01DB1AD4 00000000 */  nop
/* 005DD8 01DB1AD8 02000145 */  bc1t        .L01DB1AE4_2ED0E4
/* 005DDC 01DB1ADC 00000000 */   nop
/* 005DE0 01DB1AE0 46000046 */  mov.s       $f1, $f0
.L01DB1AE4_2ED0E4:
/* 005DE4 01DB1AE4 EA01013C */  lui         $1, %hi(CharaMain + 0x344)
/* 005DE8 01DB1AE8 6420238C */  lw          $3, %lo(CharaMain + 0x344)($1)
/* 005DEC 01DB1AEC 00110400 */  sll         $2, $4, 4
/* 005DF0 01DB1AF0 21104300 */  addu        $2, $2, $3
/* 005DF4 01DB1AF4 080041E4 */  swc1        $f1, 0x8($2)
.L01DB1AF8_2ED0F8:
/* 005DF8 01DB1AF8 789C828F */  lw          $2, -0x6388($28)
/* 005DFC 01DB1AFC 04004380 */  lb          $3, 0x4($2)
/* 005E00 01DB1B00 01000224 */  addiu       $2, $0, 0x1
/* 005E04 01DB1B04 1F006214 */  bne         $3, $2, .L01DB1B84_2ED184
/* 005E08 01DB1B08 00000000 */   nop
/* 005E0C 01DB1B0C DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 005E10 01DB1B10 9444238C */  lw          $3, %lo(BtActStatus + 0x14)($1)
/* 005E14 01DB1B14 0C000224 */  addiu       $2, $0, 0xC
/* 005E18 01DB1B18 1A006214 */  bne         $3, $2, .L01DB1B84_2ED184
/* 005E1C 01DB1B1C 00000000 */   nop
/* 005E20 01DB1B20 00008044 */  mtc1        $0, $f0
/* 005E24 01DB1B24 00000000 */  nop
/* 005E28 01DB1B28 32001546 */  c.eq.s      $f0, $f21
/* 005E2C 01DB1B2C 00000000 */  nop
/* 005E30 01DB1B30 05000045 */  bc1f        .L01DB1B48_2ED148
/* 005E34 01DB1B34 00000000 */   nop
/* 005E38 01DB1B38 32001446 */  c.eq.s      $f0, $f20
/* 005E3C 01DB1B3C 00000000 */  nop
/* 005E40 01DB1B40 10000145 */  bc1t        .L01DB1B84_2ED184
/* 005E44 01DB1B44 00000000 */   nop
.L01DB1B48_2ED148:
/* 005E48 01DB1B48 06AB0046 */  mov.s       $f12, $f21
/* 005E4C 01DB1B4C 46A30046 */  mov.s       $f13, $f20
/* 005E50 01DB1B50 5077040C */  jal         atan2f
/* 005E54 01DB1B54 00000000 */   nop
/* 005E58 01DB1B58 109D848F */  lw          $4, -0x62F0($28)
/* 005E5C 01DB1B5C 06030046 */  mov.s       $f12, $f0
/* 005E60 01DB1B60 0402050C */  jal         unitRotation__FP9CFrameVu1f
/* 005E64 01DB1B64 00000000 */   nop
/* 005E68 01DB1B68 00608044 */  mtc1        $0, $f12
/* 005E6C 01DB1B6C 00000000 */  nop
/* 005E70 01DB1B70 86630046 */  mov.s       $f14, $f12
/* 005E74 01DB1B74 109D848F */  lw          $4, -0x62F0($28)
/* 005E78 01DB1B78 46030046 */  mov.s       $f13, $f0
/* 005E7C 01DB1B7C 70A3040C */  jal         SetRotation__6CFrameFfff
/* 005E80 01DB1B80 00000000 */   nop
.L01DB1B84_2ED184:
/* 005E84 01DB1B84 CC01023C */  lui         $2, %hi(GamePad)
/* 005E88 01DB1B88 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 005E8C 01DB1B8C 08000524 */  addiu       $5, $0, 0x8
/* 005E90 01DB1B90 04AE040C */  jal         On__8CGamePadFi
/* 005E94 01DB1B94 00000000 */   nop
/* 005E98 01DB1B98 18004010 */  beqz        $2, .L01DB1BFC_2ED1FC
/* 005E9C 01DB1B9C 00000000 */   nop
/* 005EA0 01DB1BA0 989D828F */  lw          $2, -0x6268($28)
/* 005EA4 01DB1BA4 15004010 */  beqz        $2, .L01DB1BFC_2ED1FC
/* 005EA8 01DB1BA8 00000000 */   nop
/* 005EAC 01DB1BAC DC01013C */  lui         $1, %hi(BtActStatus + 0x98)
/* 005EB0 01DB1BB0 1845228C */  lw          $2, %lo(BtActStatus + 0x98)($1)
/* 005EB4 01DB1BB4 11004014 */  bnez        $2, .L01DB1BFC_2ED1FC
/* 005EB8 01DB1BB8 00000000 */   nop
/* 005EBC 01DB1BBC DC01013C */  lui         $1, %hi(BtActStatus + 0x94)
/* 005EC0 01DB1BC0 14452284 */  lh          $2, %lo(BtActStatus + 0x94)($1)
/* 005EC4 01DB1BC4 0D004014 */  bnez        $2, .L01DB1BFC_2ED1FC
/* 005EC8 01DB1BC8 00000000 */   nop
/* 005ECC 01DB1BCC DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 005ED0 01DB1BD0 9044228C */  lw          $2, %lo(BtActStatus + 0x10)($1)
/* 005ED4 01DB1BD4 09004014 */  bnez        $2, .L01DB1BFC_2ED1FC
/* 005ED8 01DB1BD8 00000000 */   nop
/* 005EDC 01DB1BDC 06000224 */  addiu       $2, $0, 0x6
/* 005EE0 01DB1BE0 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 005EE4 01DB1BE4 904422AC */  sw          $2, %lo(BtActStatus + 0x10)($1)
/* 005EE8 01DB1BE8 08000224 */  addiu       $2, $0, 0x8
/* 005EEC 01DB1BEC DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 005EF0 01DB1BF0 944422AC */  sw          $2, %lo(BtActStatus + 0x14)($1)
/* 005EF4 01DB1BF4 01000224 */  addiu       $2, $0, 0x1
/* 005EF8 01DB1BF8 7C9D82AF */  sw          $2, -0x6284($28)
.L01DB1BFC_2ED1FC:
/* 005EFC 01DB1BFC DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 005F00 01DB1C00 9044238C */  lw          $3, %lo(BtActStatus + 0x10)($1)
/* 005F04 01DB1C04 06000224 */  addiu       $2, $0, 0x6
/* 005F08 01DB1C08 5C006214 */  bne         $3, $2, .L01DB1D7C_2ED37C
/* 005F0C 01DB1C0C 00000000 */   nop
/* 005F10 01DB1C10 989D828F */  lw          $2, -0x6268($28)
/* 005F14 01DB1C14 06004014 */  bnez        $2, .L01DB1C30_2ED230
/* 005F18 01DB1C18 00000000 */   nop
/* 005F1C 01DB1C1C DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 005F20 01DB1C20 904420AC */  sw          $0, %lo(BtActStatus + 0x10)($1)
/* 005F24 01DB1C24 12000224 */  addiu       $2, $0, 0x12
/* 005F28 01DB1C28 DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 005F2C 01DB1C2C 944422AC */  sw          $2, %lo(BtActStatus + 0x14)($1)
.L01DB1C30_2ED230:
/* 005F30 01DB1C30 DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 005F34 01DB1C34 9444238C */  lw          $3, %lo(BtActStatus + 0x14)($1)
/* 005F38 01DB1C38 08000224 */  addiu       $2, $0, 0x8
/* 005F3C 01DB1C3C 1C006214 */  bne         $3, $2, .L01DB1CB0_2ED2B0
/* 005F40 01DB1C40 00000000 */   nop
/* 005F44 01DB1C44 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 005F48 01DB1C48 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
/* 005F4C 01DB1C4C EA01013C */  lui         $1, %hi(CharaMain + 0x344)
/* 005F50 01DB1C50 6420228C */  lw          $2, %lo(CharaMain + 0x344)($1)
/* 005F54 01DB1C54 840040C4 */  lwc1        $f0, 0x84($2)
/* 005F58 01DB1C58 60008046 */  cvt.s.w     $f1, $f0
/* 005F5C 01DB1C5C EA01013C */  lui         $1, %hi(CharaMain + 0x2F0)
/* 005F60 01DB1C60 102022C4 */  lwc1        $f2, %lo(CharaMain + 0x2F0)($1)
/* 005F64 01DB1C64 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 005F68 01DB1C68 00008244 */  mtc1        $2, $f0
/* 005F6C 01DB1C6C 00000000 */  nop
/* 005F70 01DB1C70 01080046 */  sub.s       $f0, $f1, $f0
/* 005F74 01DB1C74 34100046 */  c.lt.s      $f2, $f0
/* 005F78 01DB1C78 00000000 */  nop
/* 005F7C 01DB1C7C 0C000145 */  bc1t        .L01DB1CB0_2ED2B0
/* 005F80 01DB1C80 00000000 */   nop
/* 005F84 01DB1C84 34100146 */  c.lt.s      $f2, $f1
/* 005F88 01DB1C88 00000000 */  nop
/* 005F8C 01DB1C8C 08000045 */  bc1f        .L01DB1CB0_2ED2B0
/* 005F90 01DB1C90 00000000 */   nop
/* 005F94 01DB1C94 09000224 */  addiu       $2, $0, 0x9
/* 005F98 01DB1C98 DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 005F9C 01DB1C9C 944422AC */  sw          $2, %lo(BtActStatus + 0x14)($1)
/* 005FA0 01DB1CA0 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 005FA4 01DB1CA4 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
/* 005FA8 01DB1CA8 01000224 */  addiu       $2, $0, 0x1
/* 005FAC 01DB1CAC 7C9D82AF */  sw          $2, -0x6284($28)
.L01DB1CB0_2ED2B0:
/* 005FB0 01DB1CB0 DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 005FB4 01DB1CB4 9444238C */  lw          $3, %lo(BtActStatus + 0x14)($1)
/* 005FB8 01DB1CB8 09000224 */  addiu       $2, $0, 0x9
/* 005FBC 01DB1CBC 14006214 */  bne         $3, $2, .L01DB1D10_2ED310
/* 005FC0 01DB1CC0 00000000 */   nop
/* 005FC4 01DB1CC4 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 005FC8 01DB1CC8 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
/* 005FCC 01DB1CCC 05000224 */  addiu       $2, $0, 0x5
/* 005FD0 01DB1CD0 DC01013C */  lui         $1, %hi(BtActStatus + 0x60)
/* 005FD4 01DB1CD4 E04422AC */  sw          $2, %lo(BtActStatus + 0x60)($1)
/* 005FD8 01DB1CD8 CC01023C */  lui         $2, %hi(GamePad)
/* 005FDC 01DB1CDC 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 005FE0 01DB1CE0 08000524 */  addiu       $5, $0, 0x8
/* 005FE4 01DB1CE4 04AE040C */  jal         On__8CGamePadFi
/* 005FE8 01DB1CE8 00000000 */   nop
/* 005FEC 01DB1CEC 08004014 */  bnez        $2, .L01DB1D10_2ED310
/* 005FF0 01DB1CF0 00000000 */   nop
/* 005FF4 01DB1CF4 0A000224 */  addiu       $2, $0, 0xA
/* 005FF8 01DB1CF8 DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 005FFC 01DB1CFC 944422AC */  sw          $2, %lo(BtActStatus + 0x14)($1)
/* 006000 01DB1D00 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 006004 01DB1D04 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
/* 006008 01DB1D08 01000224 */  addiu       $2, $0, 0x1
/* 00600C 01DB1D0C 7C9D82AF */  sw          $2, -0x6284($28)
.L01DB1D10_2ED310:
/* 006010 01DB1D10 DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 006014 01DB1D14 9444238C */  lw          $3, %lo(BtActStatus + 0x14)($1)
/* 006018 01DB1D18 0A000224 */  addiu       $2, $0, 0xA
/* 00601C 01DB1D1C 17006214 */  bne         $3, $2, .L01DB1D7C_2ED37C
/* 006020 01DB1D20 00000000 */   nop
/* 006024 01DB1D24 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 006028 01DB1D28 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
/* 00602C 01DB1D2C EA01013C */  lui         $1, %hi(CharaMain + 0x344)
/* 006030 01DB1D30 6420228C */  lw          $2, %lo(CharaMain + 0x344)($1)
/* 006034 01DB1D34 A40040C4 */  lwc1        $f0, 0xA4($2)
/* 006038 01DB1D38 60008046 */  cvt.s.w     $f1, $f0
/* 00603C 01DB1D3C EA01013C */  lui         $1, %hi(CharaMain + 0x2F0)
/* 006040 01DB1D40 102022C4 */  lwc1        $f2, %lo(CharaMain + 0x2F0)($1)
/* 006044 01DB1D44 C03F023C */  lui         $2, (0x3FC00000 >> 16)
/* 006048 01DB1D48 00008244 */  mtc1        $2, $f0
/* 00604C 01DB1D4C 00000000 */  nop
/* 006050 01DB1D50 01080046 */  sub.s       $f0, $f1, $f0
/* 006054 01DB1D54 34100046 */  c.lt.s      $f2, $f0
/* 006058 01DB1D58 00000000 */  nop
/* 00605C 01DB1D5C 07000145 */  bc1t        .L01DB1D7C_2ED37C
/* 006060 01DB1D60 00000000 */   nop
/* 006064 01DB1D64 34100146 */  c.lt.s      $f2, $f1
/* 006068 01DB1D68 00000000 */  nop
/* 00606C 01DB1D6C 03000045 */  bc1f        .L01DB1D7C_2ED37C
/* 006070 01DB1D70 00000000 */   nop
/* 006074 01DB1D74 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 006078 01DB1D78 904420AC */  sw          $0, %lo(BtActStatus + 0x10)($1)
.L01DB1D7C_2ED37C:
/* 00607C 01DB1D7C E09C828F */  lw          $2, -0x6320($28)
/* 006080 01DB1D80 9400438C */  lw          $3, 0x94($2)
/* 006084 01DB1D84 FFFF0224 */  addiu       $2, $0, -0x1
/* 006088 01DB1D88 19006210 */  beq         $3, $2, .L01DB1DF0_2ED3F0
/* 00608C 01DB1D8C 00000000 */   nop
/* 006090 01DB1D90 D501013C */  lui         $1, %hi(BtEventInfo + 0x2C)
/* 006094 01DB1D94 6C6723AC */  sw          $3, %lo(BtEventInfo + 0x2C)($1)
/* 006098 01DB1D98 01000224 */  addiu       $2, $0, 0x1
/* 00609C 01DB1D9C D501013C */  lui         $1, %hi(BtEventInfo + 0x34)
/* 0060A0 01DB1DA0 746722AC */  sw          $2, %lo(BtEventInfo + 0x34)($1)
/* 0060A4 01DB1DA4 C004770C */  jal         ResetStatusInfo__Fv
/* 0060A8 01DB1DA8 00000000 */   nop
/* 0060AC 01DB1DAC 01000224 */  addiu       $2, $0, 0x1
/* 0060B0 01DB1DB0 749D82AF */  sw          $2, -0x628C($28)
/* 0060B4 01DB1DB4 B425060C */  jal         EdFadeInit__Fv
/* 0060B8 01DB1DB8 00000000 */   nop
/* 0060BC 01DB1DBC 00688044 */  mtc1        $0, $f13
/* 0060C0 01DB1DC0 00000000 */  nop
/* 0060C4 01DB1DC4 066B0046 */  mov.s       $f12, $f13
/* 0060C8 01DB1DC8 866B0046 */  mov.s       $f14, $f13
/* 0060CC 01DB1DCC 78000424 */  addiu       $4, $0, 0x78
/* 0060D0 01DB1DD0 E425060C */  jal         EdFadeOut__Fifff
/* 0060D4 01DB1DD4 00000000 */   nop
/* 0060D8 01DB1DD8 D501013C */  lui         $1, %hi(BtEventInfo + 0x90)
/* 0060DC 01DB1DDC D06720AC */  sw          $0, %lo(BtEventInfo + 0x90)($1)
/* 0060E0 01DB1DE0 26020224 */  addiu       $2, $0, 0x226
/* 0060E4 01DB1DE4 FC9D82AF */  sw          $2, -0x6204($28)
/* 0060E8 01DB1DE8 1F150010 */  b           .L.L01DB7268_2F2868$b
/* 0060EC 01DB1DEC 00000000 */   nop
.L01DB1DF0_2ED3F0:
/* 0060F0 01DB1DF0 789C848F */  lw          $4, -0x6388($28)
/* 0060F4 01DB1DF4 24FA060C */  jal         CheckLife__11CUserStatusFv
/* 0060F8 01DB1DF8 00000000 */   nop
/* 0060FC 01DB1DFC 13004010 */  beqz        $2, .L01DB1E4C_2ED44C
/* 006100 01DB1E00 00000000 */   nop
/* 006104 01DB1E04 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 006108 01DB1E08 9044228C */  lw          $2, %lo(BtActStatus + 0x10)($1)
/* 00610C 01DB1E0C 0F004014 */  bnez        $2, .L01DB1E4C_2ED44C
/* 006110 01DB1E10 00000000 */   nop
/* 006114 01DB1E14 E09C848F */  lw          $4, -0x6320($28)
/* 006118 01DB1E18 CC5F070C */  jal         CheckEventFlag2__12CMonstorUnitFv
/* 00611C 01DB1E1C 00000000 */   nop
/* 006120 01DB1E20 FFFF0324 */  addiu       $3, $0, -0x1
/* 006124 01DB1E24 09004310 */  beq         $2, $3, .L01DB1E4C_2ED44C
/* 006128 01DB1E28 00000000 */   nop
/* 00612C 01DB1E2C D501013C */  lui         $1, %hi(BtEventInfo + 0x2C)
/* 006130 01DB1E30 6C6722AC */  sw          $2, %lo(BtEventInfo + 0x2C)($1)
/* 006134 01DB1E34 D501013C */  lui         $1, %hi(BtEventInfo + 0x34)
/* 006138 01DB1E38 746720AC */  sw          $0, %lo(BtEventInfo + 0x34)($1)
/* 00613C 01DB1E3C 90010224 */  addiu       $2, $0, 0x190
/* 006140 01DB1E40 FC9D82AF */  sw          $2, -0x6204($28)
/* 006144 01DB1E44 08150010 */  b           .L.L01DB7268_2F2868$b
/* 006148 01DB1E48 00000000 */   nop
.L01DB1E4C_2ED44C:
/* 00614C 01DB1E4C 789C848F */  lw          $4, -0x6388($28)
/* 006150 01DB1E50 24FA060C */  jal         CheckLife__11CUserStatusFv
/* 006154 01DB1E54 00000000 */   nop
/* 006158 01DB1E58 21004010 */  beqz        $2, .L01DB1EE0_2ED4E0
/* 00615C 01DB1E5C 00000000 */   nop
/* 006160 01DB1E60 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 006164 01DB1E64 9044228C */  lw          $2, %lo(BtActStatus + 0x10)($1)
/* 006168 01DB1E68 1D004014 */  bnez        $2, .L01DB1EE0_2ED4E0
/* 00616C 01DB1E6C 00000000 */   nop
/* 006170 01DB1E70 E09C848F */  lw          $4, -0x6320($28)
/* 006174 01DB1E74 905E070C */  jal         GetMonstorNum__12CMonstorUnitFv
/* 006178 01DB1E78 00000000 */   nop
/* 00617C 01DB1E7C 1800401C */  bgtz        $2, .L01DB1EE0_2ED4E0
/* 006180 01DB1E80 00000000 */   nop
/* 006184 01DB1E84 D501013C */  lui         $1, %hi(BtEventInfo + 0xA0)
/* 006188 01DB1E88 E067228C */  lw          $2, %lo(BtEventInfo + 0xA0)($1)
/* 00618C 01DB1E8C FFFF0324 */  addiu       $3, $0, -0x1
/* 006190 01DB1E90 13004310 */  beq         $2, $3, .L01DB1EE0_2ED4E0
/* 006194 01DB1E94 00000000 */   nop
/* 006198 01DB1E98 D501013C */  lui         $1, %hi(BtEventInfo + 0x2C)
/* 00619C 01DB1E9C 6C6722AC */  sw          $2, %lo(BtEventInfo + 0x2C)($1)
/* 0061A0 01DB1EA0 D501013C */  lui         $1, %hi(BtEventInfo + 0xA4)
/* 0061A4 01DB1EA4 E467228C */  lw          $2, %lo(BtEventInfo + 0xA4)($1)
/* 0061A8 01DB1EA8 D501013C */  lui         $1, %hi(BtEventInfo + 0x34)
/* 0061AC 01DB1EAC 746722AC */  sw          $2, %lo(BtEventInfo + 0x34)($1)
/* 0061B0 01DB1EB0 D501013C */  lui         $1, %hi(BtEventInfo + 0xA0)
/* 0061B4 01DB1EB4 E06723AC */  sw          $3, %lo(BtEventInfo + 0xA0)($1)
/* 0061B8 01DB1EB8 D501013C */  lui         $1, %hi(BtEventInfo + 0xA4)
/* 0061BC 01DB1EBC E46720AC */  sw          $0, %lo(BtEventInfo + 0xA4)($1)
/* 0061C0 01DB1EC0 DC01023C */  lui         $2, %hi(LIT_4395)
/* 0061C4 01DB1EC4 102F4424 */  addiu       $4, $2, %lo(LIT_4395)
/* 0061C8 01DB1EC8 A611040C */  jal         printf
/* 0061CC 01DB1ECC 00000000 */   nop
/* 0061D0 01DB1ED0 90010224 */  addiu       $2, $0, 0x190
/* 0061D4 01DB1ED4 FC9D82AF */  sw          $2, -0x6204($28)
/* 0061D8 01DB1ED8 E3140010 */  b           .L.L01DB7268_2F2868$b
/* 0061DC 01DB1EDC 00000000 */   nop
.L01DB1EE0_2ED4E0:
/* 0061E0 01DB1EE0 C89C848F */  lw          $4, -0x6338($28)
/* 0061E4 01DB1EE4 601F070C */  jal         DistTrapCircle__11CDungeonMapFv
/* 0061E8 01DB1EE8 00000000 */   nop
/* 0061EC 01DB1EEC 0F004010 */  beqz        $2, .L01DB1F2C_2ED52C
/* 0061F0 01DB1EF0 00000000 */   nop
/* 0061F4 01DB1EF4 28264070 */  paddub      $4, $2, $0
/* 0061F8 01DB1EF8 9CFE760C */  jal         Run_TrapCircle__FP15MAP_TRAP_CIRCLE
/* 0061FC 01DB1EFC 00000000 */   nop
/* 006200 01DB1F00 2C014424 */  addiu       $4, $2, 0x12C
/* 006204 01DB1F04 96000524 */  addiu       $5, $0, 0x96
/* 006208 01DB1F08 08000624 */  addiu       $6, $0, 0x8
/* 00620C 01DB1F0C 283E0070 */  paddub      $7, $0, $0
/* 006210 01DB1F10 28460070 */  paddub      $8, $0, $0
/* 006214 01DB1F14 284E0070 */  paddub      $9, $0, $0
/* 006218 01DB1F18 9481050C */  jal         SetSystemMes__FiiiiPiPi
/* 00621C 01DB1F1C 00000000 */   nop
/* 006220 01DB1F20 96000224 */  addiu       $2, $0, 0x96
/* 006224 01DB1F24 EA01013C */  lui         $1, %hi(DngMessMan + 0x8)
/* 006228 01DB1F28 987622AC */  sw          $2, %lo(DngMessMan + 0x8)($1)
.L01DB1F2C_2ED52C:
/* 00622C 01DB1F2C 789C848F */  lw          $4, -0x6388($28)
/* 006230 01DB1F30 24FA060C */  jal         CheckLife__11CUserStatusFv
/* 006234 01DB1F34 00000000 */   nop
/* 006238 01DB1F38 50004010 */  beqz        $2, .L01DB207C_2ED67C
/* 00623C 01DB1F3C 00000000 */   nop
/* 006240 01DB1F40 089D848F */  lw          $4, -0x62F8($28)
/* 006244 01DB1F44 D05B070C */  jal         checkErr__11CRandomItemFv
/* 006248 01DB1F48 00000000 */   nop
/* 00624C 01DB1F4C 28864070 */  paddub      $16, $2, $0
/* 006250 01DB1F50 1E000012 */  beqz        $16, .L01DB1FCC_2ED5CC
/* 006254 01DB1F54 00000000 */   nop
/* 006258 01DB1F58 3480050C */  jal         ClearSystemMes__Fv
/* 00625C 01DB1F5C 00000000 */   nop
/* 006260 01DB1F60 01000224 */  addiu       $2, $0, 0x1
/* 006264 01DB1F64 09000216 */  bne         $16, $2, .L01DB1F8C_2ED58C
/* 006268 01DB1F68 00000000 */   nop
/* 00626C 01DB1F6C 48000424 */  addiu       $4, $0, 0x48
/* 006270 01DB1F70 78000524 */  addiu       $5, $0, 0x78
/* 006274 01DB1F74 08000624 */  addiu       $6, $0, 0x8
/* 006278 01DB1F78 283E0070 */  paddub      $7, $0, $0
/* 00627C 01DB1F7C 28460070 */  paddub      $8, $0, $0
/* 006280 01DB1F80 284E0070 */  paddub      $9, $0, $0
/* 006284 01DB1F84 9481050C */  jal         SetSystemMes__FiiiiPiPi
/* 006288 01DB1F88 00000000 */   nop
.L01DB1F8C_2ED58C:
/* 00628C 01DB1F8C 02000224 */  addiu       $2, $0, 0x2
/* 006290 01DB1F90 09000216 */  bne         $16, $2, .L01DB1FB8_2ED5B8
/* 006294 01DB1F94 00000000 */   nop
/* 006298 01DB1F98 51000424 */  addiu       $4, $0, 0x51
/* 00629C 01DB1F9C 78000524 */  addiu       $5, $0, 0x78
/* 0062A0 01DB1FA0 08000624 */  addiu       $6, $0, 0x8
/* 0062A4 01DB1FA4 283E0070 */  paddub      $7, $0, $0
/* 0062A8 01DB1FA8 28460070 */  paddub      $8, $0, $0
/* 0062AC 01DB1FAC 284E0070 */  paddub      $9, $0, $0
/* 0062B0 01DB1FB0 9481050C */  jal         SetSystemMes__FiiiiPiPi
/* 0062B4 01DB1FB4 00000000 */   nop
.L01DB1FB8_2ED5B8:
/* 0062B8 01DB1FB8 78000224 */  addiu       $2, $0, 0x78
/* 0062BC 01DB1FBC EA01013C */  lui         $1, %hi(DngMessMan + 0x8)
/* 0062C0 01DB1FC0 987622AC */  sw          $2, %lo(DngMessMan + 0x8)($1)
/* 0062C4 01DB1FC4 A8140010 */  b           .L.L01DB7268_2F2868$b
/* 0062C8 01DB1FC8 00000000 */   nop
.L01DB1FCC_2ED5CC:
/* 0062CC 01DB1FCC 089D848F */  lw          $4, -0x62F8($28)
/* 0062D0 01DB1FD0 BC5B070C */  jal         checkEvent__11CRandomItemFv
/* 0062D4 01DB1FD4 00000000 */   nop
/* 0062D8 01DB1FD8 28864070 */  paddub      $16, $2, $0
/* 0062DC 01DB1FDC FFFF0224 */  addiu       $2, $0, -0x1
/* 0062E0 01DB1FE0 26000212 */  beq         $16, $2, .L01DB207C_2ED67C
/* 0062E4 01DB1FE4 00000000 */   nop
/* 0062E8 01DB1FE8 3DFF0422 */  addi        $4, $16, -0xC3 /* handwritten instruction */
/* 0062EC 01DB1FEC 0C00812C */  sltiu       $1, $4, 0xC
/* 0062F0 01DB1FF0 14002010 */  beqz        $1, .L.L01DB2044_2ED644$b
/* 0062F4 01DB1FF4 00000000 */   nop
/* 0062F8 01DB1FF8 DC01023C */  lui         $2, %hi(LIT_4413)
/* 0062FC 01DB1FFC 70304324 */  addiu       $3, $2, %lo(LIT_4413)
/* 006300 01DB2000 80100400 */  sll         $2, $4, 2
/* 006304 01DB2004 21104300 */  addu        $2, $2, $3
/* 006308 01DB2008 0000428C */  lw          $2, 0x0($2)
/* 00630C 01DB200C 08004000 */  jr          $2
/* 006310 01DB2010 00000000 */   nop
jlabel .L01DB2014_2ED614
/* 006314 01DB2014 789C848F */  lw          $4, -0x6388($28)
/* 006318 01DB2018 282E0072 */  paddub      $5, $16, $0
/* 00631C 01DB201C 28360070 */  paddub      $6, $0, $0
/* 006320 01DB2020 18F8060C */  jal         GetItem__14CDngStatusDataFii
/* 006324 01DB2024 00000000 */   nop
/* 006328 01DB2028 28260072 */  paddub      $4, $16, $0
/* 00632C 01DB202C 584D070C */  jal         BtGetGateKey_Init__Fi
/* 006330 01DB2030 00000000 */   nop
/* 006334 01DB2034 FE010224 */  addiu       $2, $0, 0x1FE
/* 006338 01DB2038 FC9D82AF */  sw          $2, -0x6204($28)
/* 00633C 01DB203C 0F000010 */  b           .L01DB207C_2ED67C
/* 006340 01DB2040 00000000 */   nop
jlabel .L01DB2044_2ED644
.L.L01DB2044_2ED644$b:
/* 006344 01DB2044 A49D848F */  lw          $4, -0x625C($28)
/* 006348 01DB2048 282E0072 */  paddub      $5, $16, $0
/* 00634C 01DB204C 9C4E070C */  jal         BtGetAttach_Init__Fii
/* 006350 01DB2050 00000000 */   nop
/* 006354 01DB2054 78000224 */  addiu       $2, $0, 0x78
/* 006358 01DB2058 EA01013C */  lui         $1, %hi(DngMessMan + 0x8)
/* 00635C 01DB205C 987622AC */  sw          $2, %lo(DngMessMan + 0x8)($1)
/* 006360 01DB2060 DF000424 */  addiu       $4, $0, 0xDF
/* 006364 01DB2064 FFFF0524 */  addiu       $5, $0, -0x1
/* 006368 01DB2068 28360070 */  paddub      $6, $0, $0
/* 00636C 01DB206C AC69050C */  jal         SndSePlay__Fiii
/* 006370 01DB2070 00000000 */   nop
/* 006374 01DB2074 5CFA760C */  jal         autoCamTrial__Fv
/* 006378 01DB2078 00000000 */   nop
.L01DB207C_2ED67C:
/* 00637C 01DB207C 789C848F */  lw          $4, -0x6388($28)
/* 006380 01DB2080 24FA060C */  jal         CheckLife__11CUserStatusFv
/* 006384 01DB2084 00000000 */   nop
/* 006388 01DB2088 16004010 */  beqz        $2, .L01DB20E4_2ED6E4
/* 00638C 01DB208C 00000000 */   nop
/* 006390 01DB2090 EB01023C */  lui         $2, %hi(StealItem)
/* 006394 01DB2094 00834424 */  addiu       $4, $2, %lo(StealItem)
/* 006398 01DB2098 785E070C */  jal         checkEvent__10CStealItemFv
/* 00639C 01DB209C 00000000 */   nop
/* 0063A0 01DB20A0 FFFF0324 */  addiu       $3, $0, -0x1
/* 0063A4 01DB20A4 0F004310 */  beq         $2, $3, .L01DB20E4_2ED6E4
/* 0063A8 01DB20A8 00000000 */   nop
/* 0063AC 01DB20AC A49D848F */  lw          $4, -0x625C($28)
/* 0063B0 01DB20B0 282E4070 */  paddub      $5, $2, $0
/* 0063B4 01DB20B4 9C4E070C */  jal         BtGetAttach_Init__Fii
/* 0063B8 01DB20B8 00000000 */   nop
/* 0063BC 01DB20BC 78000224 */  addiu       $2, $0, 0x78
/* 0063C0 01DB20C0 EA01013C */  lui         $1, %hi(DngMessMan + 0x8)
/* 0063C4 01DB20C4 987622AC */  sw          $2, %lo(DngMessMan + 0x8)($1)
/* 0063C8 01DB20C8 DF000424 */  addiu       $4, $0, 0xDF
/* 0063CC 01DB20CC FFFF0524 */  addiu       $5, $0, -0x1
/* 0063D0 01DB20D0 28360070 */  paddub      $6, $0, $0
/* 0063D4 01DB20D4 AC69050C */  jal         SndSePlay__Fiii
/* 0063D8 01DB20D8 00000000 */   nop
/* 0063DC 01DB20DC 5CFA760C */  jal         autoCamTrial__Fv
/* 0063E0 01DB20E0 00000000 */   nop
.L01DB20E4_2ED6E4:
/* 0063E4 01DB20E4 DC01013C */  lui         $1, %hi(BtActStatus + 0x64)
/* 0063E8 01DB20E8 E4442284 */  lh          $2, %lo(BtActStatus + 0x64)($1)
/* 0063EC 01DB20EC 8D004010 */  beqz        $2, .L01DB2324_2ED924
/* 0063F0 01DB20F0 00000000 */   nop
/* 0063F4 01DB20F4 DC01013C */  lui         $1, %hi(BtActStatus + 0x98)
/* 0063F8 01DB20F8 1845228C */  lw          $2, %lo(BtActStatus + 0x98)($1)
/* 0063FC 01DB20FC 89004014 */  bnez        $2, .L01DB2324_2ED924
/* 006400 01DB2100 00000000 */   nop
/* 006404 01DB2104 D09C848F */  lw          $4, -0x6330($28)
/* 006408 01DB2108 B000A527 */  addiu       $5, $29, 0xB0
/* 00640C 01DB210C 7833070C */  jal         SearchDataSlotPos2__16CDungeonEventManFPf
/* 006410 01DB2110 00000000 */   nop
/* 006414 01DB2114 28864070 */  paddub      $16, $2, $0
/* 006418 01DB2118 0C000012 */  beqz        $16, .L01DB214C_2ED74C
/* 00641C 01DB211C 00000000 */   nop
/* 006420 01DB2120 0000028E */  lw          $2, 0x0($16)
/* 006424 01DB2124 2C00438C */  lw          $3, 0x2C($2)
/* 006428 01DB2128 FFFF0224 */  addiu       $2, $0, -0x1
/* 00642C 01DB212C 07006210 */  beq         $3, $2, .L01DB214C_2ED74C
/* 006430 01DB2130 00000000 */   nop
/* 006434 01DB2134 789C828F */  lw          $2, -0x6388($28)
/* 006438 01DB2138 04004280 */  lb          $2, 0x4($2)
/* 00643C 01DB213C 3C00038E */  lw          $3, 0x3C($16)
/* 006440 01DB2140 02006214 */  bne         $3, $2, .L01DB214C_2ED74C
/* 006444 01DB2144 00000000 */   nop
/* 006448 01DB2148 28860070 */  paddub      $16, $0, $0
.L01DB214C_2ED74C:
/* 00644C 01DB214C FFFF0324 */  addiu       $3, $0, -0x1
/* 006450 01DB2150 D501013C */  lui         $1, %hi(BtEventInfo + 0x2C)
/* 006454 01DB2154 6C6723AC */  sw          $3, %lo(BtEventInfo + 0x2C)($1)
/* 006458 01DB2158 22000012 */  beqz        $16, .L01DB21E4_2ED7E4
/* 00645C 01DB215C 00000000 */   nop
/* 006460 01DB2160 0000028E */  lw          $2, 0x0($16)
/* 006464 01DB2164 2000428C */  lw          $2, 0x20($2)
/* 006468 01DB2168 1E004310 */  beq         $2, $3, .L01DB21E4_2ED7E4
/* 00646C 01DB216C 00000000 */   nop
/* 006470 01DB2170 D501013C */  lui         $1, %hi(BtEventInfo + 0x2C)
/* 006474 01DB2174 6C6722AC */  sw          $2, %lo(BtEventInfo + 0x2C)($1)
/* 006478 01DB2178 0000028E */  lw          $2, 0x0($16)
/* 00647C 01DB217C 3800428C */  lw          $2, 0x38($2)
/* 006480 01DB2180 D501013C */  lui         $1, %hi(BtEventInfo + 0x34)
/* 006484 01DB2184 746722AC */  sw          $2, %lo(BtEventInfo + 0x34)($1)
/* 006488 01DB2188 01000224 */  addiu       $2, $0, 0x1
/* 00648C 01DB218C D501013C */  lui         $1, %hi(BtEventInfo + 0x38)
/* 006490 01DB2190 786722AC */  sw          $2, %lo(BtEventInfo + 0x38)($1)
/* 006494 01DB2194 D501013C */  lui         $1, %hi(BtEventInfo + 0x24)
/* 006498 01DB2198 646720AC */  sw          $0, %lo(BtEventInfo + 0x24)($1)
/* 00649C 01DB219C 9001A427 */  addiu       $4, $29, 0x190
/* 0064A0 01DB21A0 10000526 */  addiu       $5, $16, 0x10
/* 0064A4 01DB21A4 0C86040C */  jal         sceVu0CopyVector
/* 0064A8 01DB21A8 00000000 */   nop
/* 0064AC 01DB21AC A001A427 */  addiu       $4, $29, 0x1A0
/* 0064B0 01DB21B0 20000526 */  addiu       $5, $16, 0x20
/* 0064B4 01DB21B4 0C86040C */  jal         sceVu0CopyVector
/* 0064B8 01DB21B8 00000000 */   nop
/* 0064BC 01DB21BC D501023C */  lui         $2, %hi(BtEventInfo)
/* 0064C0 01DB21C0 40674424 */  addiu       $4, $2, %lo(BtEventInfo)
/* 0064C4 01DB21C4 9001A527 */  addiu       $5, $29, 0x190
/* 0064C8 01DB21C8 0C86040C */  jal         sceVu0CopyVector
/* 0064CC 01DB21CC 00000000 */   nop
/* 0064D0 01DB21D0 D501023C */  lui         $2, %hi(BtEventInfo + 0x10)
/* 0064D4 01DB21D4 50674424 */  addiu       $4, $2, %lo(BtEventInfo + 0x10)
/* 0064D8 01DB21D8 A001A527 */  addiu       $5, $29, 0x1A0
/* 0064DC 01DB21DC 0C86040C */  jal         sceVu0CopyVector
/* 0064E0 01DB21E0 00000000 */   nop
.L01DB21E4_2ED7E4:
/* 0064E4 01DB21E4 D501013C */  lui         $1, %hi(BtEventInfo + 0x2C)
/* 0064E8 01DB21E8 6C67228C */  lw          $2, %lo(BtEventInfo + 0x2C)($1)
/* 0064EC 01DB21EC FFFF0324 */  addiu       $3, $0, -0x1
/* 0064F0 01DB21F0 4C004310 */  beq         $2, $3, .L01DB2324_2ED924
/* 0064F4 01DB21F4 00000000 */   nop
/* 0064F8 01DB21F8 0000028E */  lw          $2, 0x0($16)
/* 0064FC 01DB21FC 2C00428C */  lw          $2, 0x2C($2)
/* 006500 01DB2200 16004310 */  beq         $2, $3, .L01DB225C_2ED85C
/* 006504 01DB2204 00000000 */   nop
/* 006508 01DB2208 CC01023C */  lui         $2, %hi(GamePad)
/* 00650C 01DB220C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 006510 01DB2210 9C9C858F */  lw          $5, -0x6364($28)
/* 006514 01DB2214 1CAE040C */  jal         Down__8CGamePadFi
/* 006518 01DB2218 00000000 */   nop
/* 00651C 01DB221C 0F004010 */  beqz        $2, .L01DB225C_2ED85C
/* 006520 01DB2220 00000000 */   nop
/* 006524 01DB2224 789C828F */  lw          $2, -0x6388($28)
/* 006528 01DB2228 04004380 */  lb          $3, 0x4($2)
/* 00652C 01DB222C 0000028E */  lw          $2, 0x0($16)
/* 006530 01DB2230 2C00428C */  lw          $2, 0x2C($2)
/* 006534 01DB2234 02006214 */  bne         $3, $2, .L01DB2240_2ED840
/* 006538 01DB2238 00000000 */   nop
/* 00653C 01DB223C 3C0003AE */  sw          $3, 0x3C($16)
.L01DB2240_2ED840:
/* 006540 01DB2240 90010224 */  addiu       $2, $0, 0x190
/* 006544 01DB2244 FC9D82AF */  sw          $2, -0x6204($28)
/* 006548 01DB2248 D501013C */  lui         $1, %hi(BtEventInfo + 0x24)
/* 00654C 01DB224C 646720AC */  sw          $0, %lo(BtEventInfo + 0x24)($1)
/* 006550 01DB2250 01000224 */  addiu       $2, $0, 0x1
/* 006554 01DB2254 D501013C */  lui         $1, %hi(BtEventInfo + 0xB4)
/* 006558 01DB2258 F46722AC */  sw          $2, %lo(BtEventInfo + 0xB4)($1)
.L01DB225C_2ED85C:
/* 00655C 01DB225C 0000028E */  lw          $2, 0x0($16)
/* 006560 01DB2260 2400428C */  lw          $2, 0x24($2)
/* 006564 01DB2264 10004010 */  beqz        $2, .L01DB22A8_2ED8A8
/* 006568 01DB2268 00000000 */   nop
/* 00656C 01DB226C B425060C */  jal         EdFadeInit__Fv
/* 006570 01DB2270 00000000 */   nop
/* 006574 01DB2274 00608044 */  mtc1        $0, $f12
/* 006578 01DB2278 00000000 */  nop
/* 00657C 01DB227C 46630046 */  mov.s       $f13, $f12
/* 006580 01DB2280 86630046 */  mov.s       $f14, $f12
/* 006584 01DB2284 78000424 */  addiu       $4, $0, 0x78
/* 006588 01DB2288 E425060C */  jal         EdFadeOut__Fifff
/* 00658C 01DB228C 00000000 */   nop
/* 006590 01DB2290 D501013C */  lui         $1, %hi(BtEventInfo + 0x38)
/* 006594 01DB2294 786720AC */  sw          $0, %lo(BtEventInfo + 0x38)($1)
/* 006598 01DB2298 F4010224 */  addiu       $2, $0, 0x1F4
/* 00659C 01DB229C FC9D82AF */  sw          $2, -0x6204($28)
/* 0065A0 01DB22A0 F1130010 */  b           .L.L01DB7268_2F2868$b
/* 0065A4 01DB22A4 00000000 */   nop
.L01DB22A8_2ED8A8:
/* 0065A8 01DB22A8 3000028E */  lw          $2, 0x30($16)
/* 0065AC 01DB22AC 0F004010 */  beqz        $2, .L01DB22EC_2ED8EC
/* 0065B0 01DB22B0 00000000 */   nop
/* 0065B4 01DB22B4 CC01023C */  lui         $2, %hi(GamePad)
/* 0065B8 01DB22B8 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0065BC 01DB22BC 80000524 */  addiu       $5, $0, 0x80
/* 0065C0 01DB22C0 1CAE040C */  jal         Down__8CGamePadFi
/* 0065C4 01DB22C4 00000000 */   nop
/* 0065C8 01DB22C8 08004010 */  beqz        $2, .L01DB22EC_2ED8EC
/* 0065CC 01DB22CC 00000000 */   nop
/* 0065D0 01DB22D0 90010224 */  addiu       $2, $0, 0x190
/* 0065D4 01DB22D4 FC9D82AF */  sw          $2, -0x6204($28)
/* 0065D8 01DB22D8 02000224 */  addiu       $2, $0, 0x2
/* 0065DC 01DB22DC D501013C */  lui         $1, %hi(BtEventInfo + 0x24)
/* 0065E0 01DB22E0 646722AC */  sw          $2, %lo(BtEventInfo + 0x24)($1)
/* 0065E4 01DB22E4 E0130010 */  b           .L.L01DB7268_2F2868$b
/* 0065E8 01DB22E8 00000000 */   nop
.L01DB22EC_2ED8EC:
/* 0065EC 01DB22EC CC01023C */  lui         $2, %hi(GamePad)
/* 0065F0 01DB22F0 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0065F4 01DB22F4 9C9C858F */  lw          $5, -0x6364($28)
/* 0065F8 01DB22F8 1CAE040C */  jal         Down__8CGamePadFi
/* 0065FC 01DB22FC 00000000 */   nop
/* 006600 01DB2300 08004010 */  beqz        $2, .L01DB2324_2ED924
/* 006604 01DB2304 00000000 */   nop
/* 006608 01DB2308 90010224 */  addiu       $2, $0, 0x190
/* 00660C 01DB230C FC9D82AF */  sw          $2, -0x6204($28)
/* 006610 01DB2310 01000224 */  addiu       $2, $0, 0x1
/* 006614 01DB2314 D501013C */  lui         $1, %hi(BtEventInfo + 0x24)
/* 006618 01DB2318 646722AC */  sw          $2, %lo(BtEventInfo + 0x24)($1)
/* 00661C 01DB231C D2130010 */  b           .L.L01DB7268_2F2868$b
/* 006620 01DB2320 00000000 */   nop
.L01DB2324_2ED924:
/* 006624 01DB2324 DC01013C */  lui         $1, %hi(BtActStatus + 0x94)
/* 006628 01DB2328 14452284 */  lh          $2, %lo(BtActStatus + 0x94)($1)
/* 00662C 01DB232C 15004010 */  beqz        $2, .L01DB2384_2ED984
/* 006630 01DB2330 00000000 */   nop
/* 006634 01DB2334 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 006638 01DB2338 904420AC */  sw          $0, %lo(BtActStatus + 0x10)($1)
/* 00663C 01DB233C DC01013C */  lui         $1, %hi(BtActStatus + 0x28)
/* 006640 01DB2340 A84420AC */  sw          $0, %lo(BtActStatus + 0x28)($1)
/* 006644 01DB2344 DC01013C */  lui         $1, %hi(BtActStatus + 0x40)
/* 006648 01DB2348 C04420AC */  sw          $0, %lo(BtActStatus + 0x40)($1)
/* 00664C 01DB234C DC01013C */  lui         $1, %hi(BtActStatus + 0x70)
/* 006650 01DB2350 F04420AC */  sw          $0, %lo(BtActStatus + 0x70)($1)
/* 006654 01DB2354 01000224 */  addiu       $2, $0, 0x1
/* 006658 01DB2358 DC01013C */  lui         $1, %hi(BtActStatus + 0x64)
/* 00665C 01DB235C E44422A4 */  sh          $2, %lo(BtActStatus + 0x64)($1)
/* 006660 01DB2360 DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 006664 01DB2364 944420AC */  sw          $0, %lo(BtActStatus + 0x14)($1)
/* 006668 01DB2368 C842023C */  lui         $2, (0x42C80000 >> 16)
/* 00666C 01DB236C DC01013C */  lui         $1, %hi(BtActStatus + 0x48)
/* 006670 01DB2370 C84422AC */  sw          $2, %lo(BtActStatus + 0x48)($1)
/* 006674 01DB2374 DC01013C */  lui         $1, %hi(BtActStatus + 0xA4)
/* 006678 01DB2378 244520AC */  sw          $0, %lo(BtActStatus + 0xA4)($1)
/* 00667C 01DB237C 0005770C */  jal         ResetMovePower__Fv
/* 006680 01DB2380 00000000 */   nop
.L01DB2384_2ED984:
/* 006684 01DB2384 9C9C828F */  lw          $2, -0x6364($28)
/* 006688 01DB2388 80004534 */  ori         $5, $2, 0x80
/* 00668C 01DB238C CC01023C */  lui         $2, %hi(GamePad)
/* 006690 01DB2390 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 006694 01DB2394 1CAE040C */  jal         Down__8CGamePadFi
/* 006698 01DB2398 00000000 */   nop
/* 00669C 01DB239C 2A004010 */  beqz        $2, .L01DB2448_2EDA48
/* 0066A0 01DB23A0 00000000 */   nop
/* 0066A4 01DB23A4 DC01013C */  lui         $1, %hi(BtActStatus + 0x98)
/* 0066A8 01DB23A8 1845228C */  lw          $2, %lo(BtActStatus + 0x98)($1)
/* 0066AC 01DB23AC 26004014 */  bnez        $2, .L01DB2448_2EDA48
/* 0066B0 01DB23B0 00000000 */   nop
/* 0066B4 01DB23B4 DC01013C */  lui         $1, %hi(BtActStatus + 0x94)
/* 0066B8 01DB23B8 14452284 */  lh          $2, %lo(BtActStatus + 0x94)($1)
/* 0066BC 01DB23BC 22004010 */  beqz        $2, .L01DB2448_2EDA48
/* 0066C0 01DB23C0 00000000 */   nop
/* 0066C4 01DB23C4 47000424 */  addiu       $4, $0, 0x47
/* 0066C8 01DB23C8 5A000524 */  addiu       $5, $0, 0x5A
/* 0066CC 01DB23CC 08000624 */  addiu       $6, $0, 0x8
/* 0066D0 01DB23D0 283E0070 */  paddub      $7, $0, $0
/* 0066D4 01DB23D4 28460070 */  paddub      $8, $0, $0
/* 0066D8 01DB23D8 284E0070 */  paddub      $9, $0, $0
/* 0066DC 01DB23DC 9481050C */  jal         SetSystemMes__FiiiiPiPi
/* 0066E0 01DB23E0 00000000 */   nop
/* 0066E4 01DB23E4 5A000224 */  addiu       $2, $0, 0x5A
/* 0066E8 01DB23E8 EA01013C */  lui         $1, %hi(DngMessMan + 0x8)
/* 0066EC 01DB23EC 987622AC */  sw          $2, %lo(DngMessMan + 0x8)($1)
/* 0066F0 01DB23F0 5CFA760C */  jal         autoCamTrial__Fv
/* 0066F4 01DB23F4 00000000 */   nop
/* 0066F8 01DB23F8 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 0066FC 01DB23FC 904420AC */  sw          $0, %lo(BtActStatus + 0x10)($1)
/* 006700 01DB2400 DC01013C */  lui         $1, %hi(BtActStatus + 0x28)
/* 006704 01DB2404 A84420AC */  sw          $0, %lo(BtActStatus + 0x28)($1)
/* 006708 01DB2408 DC01013C */  lui         $1, %hi(BtActStatus + 0x40)
/* 00670C 01DB240C C04420AC */  sw          $0, %lo(BtActStatus + 0x40)($1)
/* 006710 01DB2410 DC01013C */  lui         $1, %hi(BtActStatus + 0x70)
/* 006714 01DB2414 F04420AC */  sw          $0, %lo(BtActStatus + 0x70)($1)
/* 006718 01DB2418 01000224 */  addiu       $2, $0, 0x1
/* 00671C 01DB241C DC01013C */  lui         $1, %hi(BtActStatus + 0x64)
/* 006720 01DB2420 E44422A4 */  sh          $2, %lo(BtActStatus + 0x64)($1)
/* 006724 01DB2424 C842023C */  lui         $2, (0x42C80000 >> 16)
/* 006728 01DB2428 DC01013C */  lui         $1, %hi(BtActStatus + 0x48)
/* 00672C 01DB242C C84422AC */  sw          $2, %lo(BtActStatus + 0x48)($1)
/* 006730 01DB2430 DC01013C */  lui         $1, %hi(BtActStatus + 0xA4)
/* 006734 01DB2434 244520AC */  sw          $0, %lo(BtActStatus + 0xA4)($1)
/* 006738 01DB2438 0005770C */  jal         ResetMovePower__Fv
/* 00673C 01DB243C 00000000 */   nop
/* 006740 01DB2440 89130010 */  b           .L.L01DB7268_2F2868$b
/* 006744 01DB2444 00000000 */   nop
.L01DB2448_2EDA48:
/* 006748 01DB2448 CC01023C */  lui         $2, %hi(GamePad)
/* 00674C 01DB244C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 006750 01DB2450 9C9C858F */  lw          $5, -0x6364($28)
/* 006754 01DB2454 1CAE040C */  jal         Down__8CGamePadFi
/* 006758 01DB2458 00000000 */   nop
/* 00675C 01DB245C 1E004010 */  beqz        $2, .L01DB24D8_2EDAD8
/* 006760 01DB2460 00000000 */   nop
/* 006764 01DB2464 DC01013C */  lui         $1, %hi(BtActStatus + 0x92)
/* 006768 01DB2468 12452384 */  lh          $3, %lo(BtActStatus + 0x92)($1)
/* 00676C 01DB246C 0A000224 */  addiu       $2, $0, 0xA
/* 006770 01DB2470 19006214 */  bne         $3, $2, .L01DB24D8_2EDAD8
/* 006774 01DB2474 00000000 */   nop
/* 006778 01DB2478 DC01013C */  lui         $1, %hi(BtActStatus + 0x98)
/* 00677C 01DB247C 1845228C */  lw          $2, %lo(BtActStatus + 0x98)($1)
/* 006780 01DB2480 15004014 */  bnez        $2, .L01DB24D8_2EDAD8
/* 006784 01DB2484 00000000 */   nop
/* 006788 01DB2488 789C828F */  lw          $2, -0x6388($28)
/* 00678C 01DB248C 04004380 */  lb          $3, 0x4($2)
/* 006790 01DB2490 05000224 */  addiu       $2, $0, 0x5
/* 006794 01DB2494 10006214 */  bne         $3, $2, .L01DB24D8_2EDAD8
/* 006798 01DB2498 00000000 */   nop
/* 00679C 01DB249C 50000424 */  addiu       $4, $0, 0x50
/* 0067A0 01DB24A0 5A000524 */  addiu       $5, $0, 0x5A
/* 0067A4 01DB24A4 08000624 */  addiu       $6, $0, 0x8
/* 0067A8 01DB24A8 283E0070 */  paddub      $7, $0, $0
/* 0067AC 01DB24AC 28460070 */  paddub      $8, $0, $0
/* 0067B0 01DB24B0 284E0070 */  paddub      $9, $0, $0
/* 0067B4 01DB24B4 9481050C */  jal         SetSystemMes__FiiiiPiPi
/* 0067B8 01DB24B8 00000000 */   nop
/* 0067BC 01DB24BC 5A000224 */  addiu       $2, $0, 0x5A
/* 0067C0 01DB24C0 EA01013C */  lui         $1, %hi(DngMessMan + 0x8)
/* 0067C4 01DB24C4 987622AC */  sw          $2, %lo(DngMessMan + 0x8)($1)
/* 0067C8 01DB24C8 5CFA760C */  jal         autoCamTrial__Fv
/* 0067CC 01DB24CC 00000000 */   nop
/* 0067D0 01DB24D0 65130010 */  b           .L.L01DB7268_2F2868$b
/* 0067D4 01DB24D4 00000000 */   nop
.L01DB24D8_2EDAD8:
/* 0067D8 01DB24D8 FFFF0224 */  addiu       $2, $0, -0x1
/* 0067DC 01DB24DC DC9D82AF */  sw          $2, -0x6224($28)
/* 0067E0 01DB24E0 C89C848F */  lw          $4, -0x6338($28)
/* 0067E4 01DB24E4 109D858F */  lw          $5, -0x62F0($28)
/* 0067E8 01DB24E8 B423070C */  jal         GetActiveIvent__11CDungeonMapFP9CFrameVu1
/* 0067EC 01DB24EC 00000000 */   nop
/* 0067F0 01DB24F0 BC9D82AF */  sw          $2, -0x6244($28)
/* 0067F4 01DB24F4 FFFF0324 */  addiu       $3, $0, -0x1
/* 0067F8 01DB24F8 19004310 */  beq         $2, $3, .L01DB2560_2EDB60
/* 0067FC 01DB24FC 00000000 */   nop
/* 006800 01DB2500 DC01013C */  lui         $1, %hi(BtActStatus + 0x64)
/* 006804 01DB2504 E4442284 */  lh          $2, %lo(BtActStatus + 0x64)($1)
/* 006808 01DB2508 15004010 */  beqz        $2, .L01DB2560_2EDB60
/* 00680C 01DB250C 00000000 */   nop
/* 006810 01DB2510 DC01013C */  lui         $1, %hi(BtActStatus + 0x98)
/* 006814 01DB2514 1845228C */  lw          $2, %lo(BtActStatus + 0x98)($1)
/* 006818 01DB2518 11004014 */  bnez        $2, .L01DB2560_2EDB60
/* 00681C 01DB251C 00000000 */   nop
/* 006820 01DB2520 C89C848F */  lw          $4, -0x6338($28)
/* 006824 01DB2524 BC9D838F */  lw          $3, -0x6244($28)
/* 006828 01DB2528 80100300 */  sll         $2, $3, 2
/* 00682C 01DB252C 21104300 */  addu        $2, $2, $3
/* 006830 01DB2530 00110200 */  sll         $2, $2, 4
/* 006834 01DB2534 21104400 */  addu        $2, $2, $4
/* 006838 01DB2538 0100013C */  lui         $1, (0x10000 >> 16)
/* 00683C 01DB253C 21084100 */  addu        $1, $2, $1
/* 006840 01DB2540 588D228C */  lw          $2, -0x72A8($1)
/* 006844 01DB2544 B49D82AF */  sw          $2, -0x624C($28)
/* 006848 01DB2548 01000224 */  addiu       $2, $0, 0x1
/* 00684C 01DB254C D501013C */  lui         $1, %hi(BtEventInfo + 0x38)
/* 006850 01DB2550 786722AC */  sw          $2, %lo(BtEventInfo + 0x38)($1)
/* 006854 01DB2554 B89D82AF */  sw          $2, -0x6248($28)
/* 006858 01DB2558 05000010 */  b           .L01DB2570_2EDB70
/* 00685C 01DB255C 00000000 */   nop
.L01DB2560_2EDB60:
/* 006860 01DB2560 FFFF0224 */  addiu       $2, $0, -0x1
/* 006864 01DB2564 BC9D82AF */  sw          $2, -0x6244($28)
/* 006868 01DB2568 B49D82AF */  sw          $2, -0x624C($28)
/* 00686C 01DB256C B89D80AF */  sw          $0, -0x6248($28)
.L01DB2570_2EDB70:
/* 006870 01DB2570 CC01023C */  lui         $2, %hi(GamePad)
/* 006874 01DB2574 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 006878 01DB2578 9C9C858F */  lw          $5, -0x6364($28)
/* 00687C 01DB257C 1CAE040C */  jal         Down__8CGamePadFi
/* 006880 01DB2580 00000000 */   nop
/* 006884 01DB2584 0B014010 */  beqz        $2, .L01DB29B4_2EDFB4
/* 006888 01DB2588 00000000 */   nop
/* 00688C 01DB258C DC01013C */  lui         $1, %hi(BtActStatus + 0x98)
/* 006890 01DB2590 1845228C */  lw          $2, %lo(BtActStatus + 0x98)($1)
/* 006894 01DB2594 07014014 */  bnez        $2, .L01DB29B4_2EDFB4
/* 006898 01DB2598 00000000 */   nop
/* 00689C 01DB259C DC01013C */  lui         $1, %hi(BtActStatus + 0x148)
/* 0068A0 01DB25A0 C8452284 */  lh          $2, %lo(BtActStatus + 0x148)($1)
/* 0068A4 01DB25A4 03014014 */  bnez        $2, .L01DB29B4_2EDFB4
/* 0068A8 01DB25A8 00000000 */   nop
/* 0068AC 01DB25AC BC9D838F */  lw          $3, -0x6244($28)
/* 0068B0 01DB25B0 FFFF0524 */  addiu       $5, $0, -0x1
/* 0068B4 01DB25B4 CB006510 */  beq         $3, $5, .L01DB28E4_2EDEE4
/* 0068B8 01DB25B8 00000000 */   nop
/* 0068BC 01DB25BC DC01013C */  lui         $1, %hi(BtActStatus + 0x20)
/* 0068C0 01DB25C0 A044228C */  lw          $2, %lo(BtActStatus + 0x20)($1)
/* 0068C4 01DB25C4 C7004014 */  bnez        $2, .L01DB28E4_2EDEE4
/* 0068C8 01DB25C8 00000000 */   nop
/* 0068CC 01DB25CC 28860070 */  paddub      $16, $0, $0
/* 0068D0 01DB25D0 C89C848F */  lw          $4, -0x6338($28)
/* 0068D4 01DB25D4 80100300 */  sll         $2, $3, 2
/* 0068D8 01DB25D8 21104300 */  addu        $2, $2, $3
/* 0068DC 01DB25DC 00110200 */  sll         $2, $2, 4
/* 0068E0 01DB25E0 21304400 */  addu        $6, $2, $4
/* 0068E4 01DB25E4 0100013C */  lui         $1, (0x10000 >> 16)
/* 0068E8 01DB25E8 2108C100 */  addu        $1, $6, $1
/* 0068EC 01DB25EC 588D238C */  lw          $3, -0x72A8($1)
/* 0068F0 01DB25F0 08000224 */  addiu       $2, $0, 0x8
/* 0068F4 01DB25F4 8F006210 */  beq         $3, $2, .L01DB2834_2EDE34
/* 0068F8 01DB25F8 00000000 */   nop
/* 0068FC 01DB25FC 03000224 */  addiu       $2, $0, 0x3
/* 006900 01DB2600 69006210 */  beq         $3, $2, .L01DB27A8_2EDDA8
/* 006904 01DB2604 00000000 */   nop
/* 006908 01DB2608 02000224 */  addiu       $2, $0, 0x2
/* 00690C 01DB260C 03006210 */  beq         $3, $2, .L01DB261C_2EDC1C
/* 006910 01DB2610 00000000 */   nop
/* 006914 01DB2614 AF000010 */  b           .L01DB28D4_2EDED4
/* 006918 01DB2618 00000000 */   nop
.L01DB261C_2EDC1C:
/* 00691C 01DB261C DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 006920 01DB2620 8C4420AC */  sw          $0, %lo(BtActStatus + 0xC)($1)
/* 006924 01DB2624 0100013C */  lui         $1, (0x10000 >> 16)
/* 006928 01DB2628 2108C100 */  addu        $1, $6, $1
/* 00692C 01DB262C 788D328C */  lw          $18, -0x7288($1)
/* 006930 01DB2630 80111200 */  sll         $2, $18, 6
/* 006934 01DB2634 21184400 */  addu        $3, $2, $4
/* 006938 01DB2638 0100013C */  lui         $1, (0x10000 >> 16)
/* 00693C 01DB263C 21086100 */  addu        $1, $3, $1
/* 006940 01DB2640 88B6228C */  lw          $2, -0x4978($1)
/* 006944 01DB2644 4E004014 */  bnez        $2, .L01DB2780_2EDD80
/* 006948 01DB2648 00000000 */   nop
/* 00694C 01DB264C 0100013C */  lui         $1, (0x10000 >> 16)
/* 006950 01DB2650 21086100 */  addu        $1, $3, $1
/* 006954 01DB2654 90B6238C */  lw          $3, -0x4970($1)
/* 006958 01DB2658 06006014 */  bnez        $3, .L01DB2674_2EDC74
/* 00695C 01DB265C 00000000 */   nop
/* 006960 01DB2660 78000224 */  addiu       $2, $0, 0x78
/* 006964 01DB2664 FC9D82AF */  sw          $2, -0x6204($28)
/* 006968 01DB2668 01001024 */  addiu       $16, $0, 0x1
/* 00696C 01DB266C 47000010 */  b           .L01DB278C_2EDD8C
/* 006970 01DB2670 00000000 */   nop
.L01DB2674_2EDC74:
/* 006974 01DB2674 05000224 */  addiu       $2, $0, 0x5
/* 006978 01DB2678 30006214 */  bne         $3, $2, .L01DB273C_2EDD3C
/* 00697C 01DB267C 00000000 */   nop
/* 006980 01DB2680 DC01023C */  lui         $2, %hi(LIT_2105)
/* 006984 01DB2684 80274224 */  addiu       $2, $2, %lo(LIT_2105)
/* 006988 01DB2688 C001A327 */  addiu       $3, $29, 0x1C0
/* 00698C 01DB268C 00004278 */  lq          $2, 0x0($2)
/* 006990 01DB2690 0000627C */  sq          $2, 0x0($3)
/* 006994 01DB2694 B001A427 */  addiu       $4, $29, 0x1B0
/* 006998 01DB2698 680DC524 */  addiu       $5, $6, 0xD68
/* 00699C 01DB269C F87FA524 */  addiu       $5, $5, 0x7FF8
/* 0069A0 01DB26A0 0C86040C */  jal         sceVu0CopyVector
/* 0069A4 01DB26A4 00000000 */   nop
/* 0069A8 01DB26A8 D501023C */  lui         $2, %hi(BtEventInfo)
/* 0069AC 01DB26AC 40674424 */  addiu       $4, $2, %lo(BtEventInfo)
/* 0069B0 01DB26B0 B001A527 */  addiu       $5, $29, 0x1B0
/* 0069B4 01DB26B4 0C86040C */  jal         sceVu0CopyVector
/* 0069B8 01DB26B8 00000000 */   nop
/* 0069BC 01DB26BC D501023C */  lui         $2, %hi(BtEventInfo + 0x10)
/* 0069C0 01DB26C0 50674424 */  addiu       $4, $2, %lo(BtEventInfo + 0x10)
/* 0069C4 01DB26C4 C001A527 */  addiu       $5, $29, 0x1C0
/* 0069C8 01DB26C8 0C86040C */  jal         sceVu0CopyVector
/* 0069CC 01DB26CC 00000000 */   nop
/* 0069D0 01DB26D0 FFFF0524 */  addiu       $5, $0, -0x1
/* 0069D4 01DB26D4 C89C848F */  lw          $4, -0x6338($28)
/* 0069D8 01DB26D8 BC9D838F */  lw          $3, -0x6244($28)
/* 0069DC 01DB26DC 80100300 */  sll         $2, $3, 2
/* 0069E0 01DB26E0 21104300 */  addu        $2, $2, $3
/* 0069E4 01DB26E4 00110200 */  sll         $2, $2, 4
/* 0069E8 01DB26E8 21104400 */  addu        $2, $2, $4
/* 0069EC 01DB26EC 0100013C */  lui         $1, (0x10000 >> 16)
/* 0069F0 01DB26F0 21084100 */  addu        $1, $2, $1
/* 0069F4 01DB26F4 588D25AC */  sw          $5, -0x72A8($1)
/* 0069F8 01DB26F8 10000224 */  addiu       $2, $0, 0x10
/* 0069FC 01DB26FC D501013C */  lui         $1, %hi(BtEventInfo + 0x2C)
/* 006A00 01DB2700 6C6722AC */  sw          $2, %lo(BtEventInfo + 0x2C)($1)
/* 006A04 01DB2704 D501013C */  lui         $1, %hi(BtEventInfo + 0x34)
/* 006A08 01DB2708 746720AC */  sw          $0, %lo(BtEventInfo + 0x34)($1)
/* 006A0C 01DB270C D501013C */  lui         $1, %hi(BtEventInfo + 0xAC)
/* 006A10 01DB2710 EC6732AC */  sw          $18, %lo(BtEventInfo + 0xAC)($1)
/* 006A14 01DB2714 01000224 */  addiu       $2, $0, 0x1
/* 006A18 01DB2718 D501013C */  lui         $1, %hi(BtEventInfo + 0x24)
/* 006A1C 01DB271C 646722AC */  sw          $2, %lo(BtEventInfo + 0x24)($1)
/* 006A20 01DB2720 90010224 */  addiu       $2, $0, 0x190
/* 006A24 01DB2724 FC9D82AF */  sw          $2, -0x6204($28)
/* 006A28 01DB2728 0005770C */  jal         ResetMovePower__Fv
/* 006A2C 01DB272C 00000000 */   nop
/* 006A30 01DB2730 01001024 */  addiu       $16, $0, 0x1
/* 006A34 01DB2734 67000010 */  b           .L01DB28D4_2EDED4
/* 006A38 01DB2738 00000000 */   nop
.L01DB273C_2EDD3C:
/* 006A3C 01DB273C 0F000224 */  addiu       $2, $0, 0xF
/* 006A40 01DB2740 D501013C */  lui         $1, %hi(BtEventInfo + 0x2C)
/* 006A44 01DB2744 6C6722AC */  sw          $2, %lo(BtEventInfo + 0x2C)($1)
/* 006A48 01DB2748 D501013C */  lui         $1, %hi(BtEventInfo + 0x34)
/* 006A4C 01DB274C 746720AC */  sw          $0, %lo(BtEventInfo + 0x34)($1)
/* 006A50 01DB2750 D501013C */  lui         $1, %hi(BtEventInfo + 0xAC)
/* 006A54 01DB2754 EC6732AC */  sw          $18, %lo(BtEventInfo + 0xAC)($1)
/* 006A58 01DB2758 01000224 */  addiu       $2, $0, 0x1
/* 006A5C 01DB275C D501013C */  lui         $1, %hi(BtEventInfo + 0x24)
/* 006A60 01DB2760 646722AC */  sw          $2, %lo(BtEventInfo + 0x24)($1)
/* 006A64 01DB2764 90010224 */  addiu       $2, $0, 0x190
/* 006A68 01DB2768 FC9D82AF */  sw          $2, -0x6204($28)
/* 006A6C 01DB276C 0005770C */  jal         ResetMovePower__Fv
/* 006A70 01DB2770 00000000 */   nop
/* 006A74 01DB2774 01001024 */  addiu       $16, $0, 0x1
/* 006A78 01DB2778 56000010 */  b           .L01DB28D4_2EDED4
/* 006A7C 01DB277C 00000000 */   nop
.L01DB2780_2EDD80:
/* 006A80 01DB2780 01001024 */  addiu       $16, $0, 0x1
/* 006A84 01DB2784 82000224 */  addiu       $2, $0, 0x82
/* 006A88 01DB2788 FC9D82AF */  sw          $2, -0x6204($28)
.L01DB278C_2EDD8C:
/* 006A8C 01DB278C 01000424 */  addiu       $4, $0, 0x1
/* 006A90 01DB2790 FFFF0524 */  addiu       $5, $0, -0x1
/* 006A94 01DB2794 28360070 */  paddub      $6, $0, $0
/* 006A98 01DB2798 AC69050C */  jal         SndSePlay__Fiii
/* 006A9C 01DB279C 00000000 */   nop
/* 006AA0 01DB27A0 4C000010 */  b           .L01DB28D4_2EDED4
/* 006AA4 01DB27A4 00000000 */   nop
.L01DB27A8_2EDDA8:
/* 006AA8 01DB27A8 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 006AAC 01DB27AC 8C4420AC */  sw          $0, %lo(BtActStatus + 0xC)($1)
/* 006AB0 01DB27B0 0100013C */  lui         $1, (0x10000 >> 16)
/* 006AB4 01DB27B4 2108C100 */  addu        $1, $6, $1
/* 006AB8 01DB27B8 788D328C */  lw          $18, -0x7288($1)
/* 006ABC 01DB27BC 40111200 */  sll         $2, $18, 5
/* 006AC0 01DB27C0 21104400 */  addu        $2, $2, $4
/* 006AC4 01DB27C4 0100013C */  lui         $1, (0x10000 >> 16)
/* 006AC8 01DB27C8 21084100 */  addu        $1, $2, $1
/* 006ACC 01DB27CC 94BC228C */  lw          $2, -0x436C($1)
/* 006AD0 01DB27D0 40004010 */  beqz        $2, .L01DB28D4_2EDED4
/* 006AD4 01DB27D4 00000000 */   nop
/* 006AD8 01DB27D8 789C828F */  lw          $2, -0x6388($28)
/* 006ADC 01DB27DC 04004280 */  lb          $2, 0x4($2)
/* 006AE0 01DB27E0 0A004014 */  bnez        $2, .L01DB280C_2EDE0C
/* 006AE4 01DB27E4 00000000 */   nop
/* 006AE8 01DB27E8 8C000224 */  addiu       $2, $0, 0x8C
/* 006AEC 01DB27EC FC9D82AF */  sw          $2, -0x6204($28)
/* 006AF0 01DB27F0 01001024 */  addiu       $16, $0, 0x1
/* 006AF4 01DB27F4 28260072 */  paddub      $4, $16, $0
/* 006AF8 01DB27F8 28360070 */  paddub      $6, $0, $0
/* 006AFC 01DB27FC AC69050C */  jal         SndSePlay__Fiii
/* 006B00 01DB2800 00000000 */   nop
/* 006B04 01DB2804 33000010 */  b           .L01DB28D4_2EDED4
/* 006B08 01DB2808 00000000 */   nop
.L01DB280C_2EDE0C:
/* 006B0C 01DB280C 3C260200 */  dsll32      $4, $2, 24
/* 006B10 01DB2810 3F260400 */  dsra32      $4, $4, 24
/* 006B14 01DB2814 5A000524 */  addiu       $5, $0, 0x5A
/* 006B18 01DB2818 6481050C */  jal         NotGetAtraMes__Fii
/* 006B1C 01DB281C 00000000 */   nop
/* 006B20 01DB2820 5A000224 */  addiu       $2, $0, 0x5A
/* 006B24 01DB2824 EA01013C */  lui         $1, %hi(DngMessMan + 0x8)
/* 006B28 01DB2828 987622AC */  sw          $2, %lo(DngMessMan + 0x8)($1)
/* 006B2C 01DB282C 29000010 */  b           .L01DB28D4_2EDED4
/* 006B30 01DB2830 00000000 */   nop
.L01DB2834_2EDE34:
/* 006B34 01DB2834 0100013C */  lui         $1, (0x10000 >> 16)
/* 006B38 01DB2838 2108C100 */  addu        $1, $6, $1
/* 006B3C 01DB283C 788D328C */  lw          $18, -0x7288($1)
/* 006B40 01DB2840 80311200 */  sll         $6, $18, 6
/* 006B44 01DB2844 2110C400 */  addu        $2, $6, $4
/* 006B48 01DB2848 0100013C */  lui         $1, (0x10000 >> 16)
/* 006B4C 01DB284C 21084100 */  addu        $1, $2, $1
/* 006B50 01DB2850 80B6238C */  lw          $3, -0x4980($1)
/* 006B54 01DB2854 E09C858F */  lw          $5, -0x6320($28)
/* 006B58 01DB2858 0E006004 */  bltz        $3, .L01DB2894_2EDE94
/* 006B5C 01DB285C 00000000 */   nop
/* 006B60 01DB2860 11006128 */  slti        $1, $3, 0x11
/* 006B64 01DB2864 0B002010 */  beqz        $1, .L01DB2894_2EDE94
/* 006B68 01DB2868 00000000 */   nop
/* 006B6C 01DB286C 01000424 */  addiu       $4, $0, 0x1
/* 006B70 01DB2870 80100300 */  sll         $2, $3, 2
/* 006B74 01DB2874 21184300 */  addu        $3, $2, $3
/* 006B78 01DB2878 80100300 */  sll         $2, $3, 2
/* 006B7C 01DB287C 21106200 */  addu        $2, $3, $2
/* 006B80 01DB2880 00110200 */  sll         $2, $2, 4
/* 006B84 01DB2884 21104500 */  addu        $2, $2, $5
/* 006B88 01DB2888 0200013C */  lui         $1, (0x20000 >> 16)
/* 006B8C 01DB288C 21084100 */  addu        $1, $2, $1
/* 006B90 01DB2890 A4E424A4 */  sh          $4, -0x1B5C($1)
.L01DB2894_2EDE94:
/* 006B94 01DB2894 C89C828F */  lw          $2, -0x6338($28)
/* 006B98 01DB2898 2110C200 */  addu        $2, $6, $2
/* 006B9C 01DB289C 0100013C */  lui         $1, (0x10000 >> 16)
/* 006BA0 01DB28A0 21084100 */  addu        $1, $2, $1
/* 006BA4 01DB28A4 60B620AC */  sw          $0, -0x49A0($1)
/* 006BA8 01DB28A8 FFFF0524 */  addiu       $5, $0, -0x1
/* 006BAC 01DB28AC C89C848F */  lw          $4, -0x6338($28)
/* 006BB0 01DB28B0 BC9D838F */  lw          $3, -0x6244($28)
/* 006BB4 01DB28B4 80100300 */  sll         $2, $3, 2
/* 006BB8 01DB28B8 21104300 */  addu        $2, $2, $3
/* 006BBC 01DB28BC 00110200 */  sll         $2, $2, 4
/* 006BC0 01DB28C0 21104400 */  addu        $2, $2, $4
/* 006BC4 01DB28C4 0100013C */  lui         $1, (0x10000 >> 16)
/* 006BC8 01DB28C8 21084100 */  addu        $1, $2, $1
/* 006BCC 01DB28CC 588D25AC */  sw          $5, -0x72A8($1)
/* 006BD0 01DB28D0 01001024 */  addiu       $16, $0, 0x1
.L01DB28D4_2EDED4:
/* 006BD4 01DB28D4 64120016 */  bnez        $16, .L.L01DB7268_2F2868$b
/* 006BD8 01DB28D8 00000000 */   nop
/* 006BDC 01DB28DC 35000010 */  b           .L01DB29B4_2EDFB4
/* 006BE0 01DB28E0 00000000 */   nop
.L01DB28E4_2EDEE4:
/* 006BE4 01DB28E4 789C828F */  lw          $2, -0x6388($28)
/* 006BE8 01DB28E8 04004480 */  lb          $4, 0x4($2)
/* 006BEC 01DB28EC 0600812C */  sltiu       $1, $4, 0x6
/* 006BF0 01DB28F0 30002010 */  beqz        $1, .L01DB29B4_2EDFB4
/* 006BF4 01DB28F4 00000000 */   nop
/* 006BF8 01DB28F8 DC01023C */  lui         $2, %hi(LIT_4414)
/* 006BFC 01DB28FC 50304324 */  addiu       $3, $2, %lo(LIT_4414)
/* 006C00 01DB2900 80100400 */  sll         $2, $4, 2
/* 006C04 01DB2904 21104300 */  addu        $2, $2, $3
/* 006C08 01DB2908 0000428C */  lw          $2, 0x0($2)
/* 006C0C 01DB290C 08004000 */  jr          $2
/* 006C10 01DB2910 00000000 */   nop
jlabel .L01DB2914_2EDF14
/* 006C14 01DB2914 1405090C */  jal         ToanKey_On__Fv
/* 006C18 01DB2918 00000000 */   nop
/* 006C1C 01DB291C 25000010 */  b           .L01DB29B4_2EDFB4
/* 006C20 01DB2920 00000000 */   nop
jlabel .L01DB2924_2EDF24
/* 006C24 01DB2924 28F2760C */  jal         BattleActionOn_Jinn__Fv
/* 006C28 01DB2928 00000000 */   nop
/* 006C2C 01DB292C 21000010 */  b           .L01DB29B4_2EDFB4
/* 006C30 01DB2930 00000000 */   nop
jlabel .L01DB2934_2EDF34
/* 006C34 01DB2934 1410090C */  jal         GoroKey_On__Fv
/* 006C38 01DB2938 00000000 */   nop
/* 006C3C 01DB293C 1D000010 */  b           .L01DB29B4_2EDFB4
/* 006C40 01DB2940 00000000 */   nop
jlabel .L01DB2944_2EDF44
/* 006C44 01DB2944 C0F3760C */  jal         BattleActionOn_Ruby__Fv
/* 006C48 01DB2948 00000000 */   nop
/* 006C4C 01DB294C 19000010 */  b           .L01DB29B4_2EDFB4
/* 006C50 01DB2950 00000000 */   nop
jlabel .L01DB2954_2EDF54
/* 006C54 01DB2954 380C090C */  jal         UngagaKey_On__Fv
/* 006C58 01DB2958 00000000 */   nop
/* 006C5C 01DB295C 15000010 */  b           .L01DB29B4_2EDFB4
/* 006C60 01DB2960 00000000 */   nop
jlabel .L01DB2964_2EDF64
/* 006C64 01DB2964 DC01013C */  lui         $1, %hi(BtActStatus + 0xA0)
/* 006C68 01DB2968 2045228C */  lw          $2, %lo(BtActStatus + 0xA0)($1)
/* 006C6C 01DB296C 03004014 */  bnez        $2, .L01DB297C_2EDF7C
/* 006C70 01DB2970 00000000 */   nop
/* 006C74 01DB2974 D0F6760C */  jal         BattleActionOn_Ozumond__Fv
/* 006C78 01DB2978 00000000 */   nop
.L01DB297C_2EDF7C:
/* 006C7C 01DB297C DC01013C */  lui         $1, %hi(BtActStatus + 0xA0)
/* 006C80 01DB2980 2045238C */  lw          $3, %lo(BtActStatus + 0xA0)($1)
/* 006C84 01DB2984 01000224 */  addiu       $2, $0, 0x1
/* 006C88 01DB2988 03006214 */  bne         $3, $2, .L01DB2998_2EDF98
/* 006C8C 01DB298C 00000000 */   nop
/* 006C90 01DB2990 F4F6760C */  jal         BattleActionOn_Ozumond_H__Fv
/* 006C94 01DB2994 00000000 */   nop
.L01DB2998_2EDF98:
/* 006C98 01DB2998 DC01013C */  lui         $1, %hi(BtActStatus + 0xA0)
/* 006C9C 01DB299C 2045238C */  lw          $3, %lo(BtActStatus + 0xA0)($1)
/* 006CA0 01DB29A0 02000224 */  addiu       $2, $0, 0x2
/* 006CA4 01DB29A4 03006214 */  bne         $3, $2, .L01DB29B4_2EDFB4
/* 006CA8 01DB29A8 00000000 */   nop
/* 006CAC 01DB29AC 1CF7760C */  jal         BattleActionOn_Ozumond_F__Fv
/* 006CB0 01DB29B0 00000000 */   nop
.L01DB29B4_2EDFB4:
/* 006CB4 01DB29B4 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 006CB8 01DB29B8 9044238C */  lw          $3, %lo(BtActStatus + 0x10)($1)
/* 006CBC 01DB29BC 01000224 */  addiu       $2, $0, 0x1
/* 006CC0 01DB29C0 3E006214 */  bne         $3, $2, .L01DB2ABC_2EE0BC
/* 006CC4 01DB29C4 00000000 */   nop
/* 006CC8 01DB29C8 789C828F */  lw          $2, -0x6388($28)
/* 006CCC 01DB29CC 04004480 */  lb          $4, 0x4($2)
/* 006CD0 01DB29D0 0600812C */  sltiu       $1, $4, 0x6
/* 006CD4 01DB29D4 39002010 */  beqz        $1, .L01DB2ABC_2EE0BC
/* 006CD8 01DB29D8 00000000 */   nop
/* 006CDC 01DB29DC DC01023C */  lui         $2, %hi(LIT_4415)
/* 006CE0 01DB29E0 30304324 */  addiu       $3, $2, %lo(LIT_4415)
/* 006CE4 01DB29E4 80100400 */  sll         $2, $4, 2
/* 006CE8 01DB29E8 21104300 */  addu        $2, $2, $3
/* 006CEC 01DB29EC 0000428C */  lw          $2, 0x0($2)
/* 006CF0 01DB29F0 08004000 */  jr          $2
/* 006CF4 01DB29F4 00000000 */   nop
jlabel .L01DB29F8_2EDFF8
/* 006CF8 01DB29F8 A405090C */  jal         ToanKey_Play__Fv
/* 006CFC 01DB29FC 00000000 */   nop
/* 006D00 01DB2A00 2E000010 */  b           .L01DB2ABC_2EE0BC
/* 006D04 01DB2A04 00000000 */   nop
jlabel .L01DB2A08_2EE008
/* 006D08 01DB2A08 EA01023C */  lui         $2, %hi(CharaMain)
/* 006D0C 01DB2A0C 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 006D10 01DB2A10 282E0070 */  paddub      $5, $0, $0
/* 006D14 01DB2A14 4CF2760C */  jal         BattleActionPlay_Jinn__FP10CCharacteri
/* 006D18 01DB2A18 00000000 */   nop
/* 006D1C 01DB2A1C 27000010 */  b           .L01DB2ABC_2EE0BC
/* 006D20 01DB2A20 00000000 */   nop
jlabel .L01DB2A24_2EE024
/* 006D24 01DB2A24 4C10090C */  jal         GoroKey_Play__Fv
/* 006D28 01DB2A28 00000000 */   nop
/* 006D2C 01DB2A2C 23000010 */  b           .L01DB2ABC_2EE0BC
/* 006D30 01DB2A30 00000000 */   nop
jlabel .L01DB2A34_2EE034
/* 006D34 01DB2A34 EA01023C */  lui         $2, %hi(CharaMain)
/* 006D38 01DB2A38 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 006D3C 01DB2A3C 282E0070 */  paddub      $5, $0, $0
/* 006D40 01DB2A40 D4F4760C */  jal         BattleActionPlay_Ruby__FP10CCharacteri
/* 006D44 01DB2A44 00000000 */   nop
/* 006D48 01DB2A48 1C000010 */  b           .L01DB2ABC_2EE0BC
/* 006D4C 01DB2A4C 00000000 */   nop
jlabel .L01DB2A50_2EE050
/* 006D50 01DB2A50 980C090C */  jal         UngagaKey_Play__Fv
/* 006D54 01DB2A54 00000000 */   nop
/* 006D58 01DB2A58 18000010 */  b           .L01DB2ABC_2EE0BC
/* 006D5C 01DB2A5C 00000000 */   nop
jlabel .L01DB2A60_2EE060
/* 006D60 01DB2A60 DC01013C */  lui         $1, %hi(BtActStatus + 0xA0)
/* 006D64 01DB2A64 2045228C */  lw          $2, %lo(BtActStatus + 0xA0)($1)
/* 006D68 01DB2A68 04004014 */  bnez        $2, .L01DB2A7C_2EE07C
/* 006D6C 01DB2A6C 00000000 */   nop
/* 006D70 01DB2A70 28260070 */  paddub      $4, $0, $0
/* 006D74 01DB2A74 3CF7760C */  jal         OpC_InitProcess5__Fv
/* 006D78 01DB2A78 00000000 */   nop
.L01DB2A7C_2EE07C:
/* 006D7C 01DB2A7C DC01013C */  lui         $1, %hi(BtActStatus + 0xA0)
/* 006D80 01DB2A80 2045238C */  lw          $3, %lo(BtActStatus + 0xA0)($1)
/* 006D84 01DB2A84 01000224 */  addiu       $2, $0, 0x1
/* 006D88 01DB2A88 04006214 */  bne         $3, $2, .L01DB2A9C_2EE09C
/* 006D8C 01DB2A8C 00000000 */   nop
/* 006D90 01DB2A90 28260070 */  paddub      $4, $0, $0
/* 006D94 01DB2A94 30F8760C */  jal         BattleActionPlay_Ozumond_H__Fi
/* 006D98 01DB2A98 00000000 */   nop
.L01DB2A9C_2EE09C:
/* 006D9C 01DB2A9C DC01013C */  lui         $1, %hi(BtActStatus + 0xA0)
/* 006DA0 01DB2AA0 2045238C */  lw          $3, %lo(BtActStatus + 0xA0)($1)
/* 006DA4 01DB2AA4 02000224 */  addiu       $2, $0, 0x2
/* 006DA8 01DB2AA8 04006214 */  bne         $3, $2, .L01DB2ABC_2EE0BC
/* 006DAC 01DB2AAC 00000000 */   nop
/* 006DB0 01DB2AB0 28260070 */  paddub      $4, $0, $0
/* 006DB4 01DB2AB4 E8F8760C */  jal         BattleActionPlay_Ozumond_F__Fi
/* 006DB8 01DB2AB8 00000000 */   nop
.L01DB2ABC_2EE0BC:
/* 006DBC 01DB2ABC D09D80AF */  sw          $0, -0x6230($28)
/* 006DC0 01DB2AC0 CC01023C */  lui         $2, %hi(GamePad)
/* 006DC4 01DB2AC4 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 006DC8 01DB2AC8 80000524 */  addiu       $5, $0, 0x80
/* 006DCC 01DB2ACC 04AE040C */  jal         On__8CGamePadFi
/* 006DD0 01DB2AD0 00000000 */   nop
/* 006DD4 01DB2AD4 46004010 */  beqz        $2, .L01DB2BF0_2EE1F0
/* 006DD8 01DB2AD8 00000000 */   nop
/* 006DDC 01DB2ADC DC01013C */  lui         $1, %hi(BtActStatus + 0x98)
/* 006DE0 01DB2AE0 1845228C */  lw          $2, %lo(BtActStatus + 0x98)($1)
/* 006DE4 01DB2AE4 42004014 */  bnez        $2, .L01DB2BF0_2EE1F0
/* 006DE8 01DB2AE8 00000000 */   nop
/* 006DEC 01DB2AEC 989D828F */  lw          $2, -0x6268($28)
/* 006DF0 01DB2AF0 3F004014 */  bnez        $2, .L01DB2BF0_2EE1F0
/* 006DF4 01DB2AF4 00000000 */   nop
/* 006DF8 01DB2AF8 D501013C */  lui         $1, %hi(DebugStatus + 0x14)
/* 006DFC 01DB2AFC 7464228C */  lw          $2, %lo(DebugStatus + 0x14)($1)
/* 006E00 01DB2B00 03004014 */  bnez        $2, .L01DB2B10_2EE110
/* 006E04 01DB2B04 00000000 */   nop
/* 006E08 01DB2B08 01000224 */  addiu       $2, $0, 0x1
/* 006E0C 01DB2B0C D09D82AF */  sw          $2, -0x6230($28)
.L01DB2B10_2EE110:
/* 006E10 01DB2B10 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 006E14 01DB2B14 9044228C */  lw          $2, %lo(BtActStatus + 0x10)($1)
/* 006E18 01DB2B18 35004014 */  bnez        $2, .L01DB2BF0_2EE1F0
/* 006E1C 01DB2B1C 00000000 */   nop
/* 006E20 01DB2B20 FC9D838F */  lw          $3, -0x6204($28)
/* 006E24 01DB2B24 F0000224 */  addiu       $2, $0, 0xF0
/* 006E28 01DB2B28 31006210 */  beq         $3, $2, .L01DB2BF0_2EE1F0
/* 006E2C 01DB2B2C 00000000 */   nop
/* 006E30 01DB2B30 DC01013C */  lui         $1, %hi(BtActStatus + 0x64)
/* 006E34 01DB2B34 E4442284 */  lh          $2, %lo(BtActStatus + 0x64)($1)
/* 006E38 01DB2B38 2D004010 */  beqz        $2, .L01DB2BF0_2EE1F0
/* 006E3C 01DB2B3C 00000000 */   nop
/* 006E40 01DB2B40 789C828F */  lw          $2, -0x6388($28)
/* 006E44 01DB2B44 60435024 */  addiu       $16, $2, 0x4360
/* 006E48 01DB2B48 EC01023C */  lui         $2, %hi(activeItem)
/* 006E4C 01DB2B4C 70784424 */  addiu       $4, $2, %lo(activeItem)
/* 006E50 01DB2B50 0C55070C */  jal         CheckStatusType__15CActiveItemPackFv
/* 006E54 01DB2B54 00000000 */   nop
/* 006E58 01DB2B58 03000324 */  addiu       $3, $0, 0x3
/* 006E5C 01DB2B5C 24004314 */  bne         $2, $3, .L01DB2BF0_2EE1F0
/* 006E60 01DB2B60 00000000 */   nop
/* 006E64 01DB2B64 A89D838F */  lw          $3, -0x6258($28)
/* 006E68 01DB2B68 40100300 */  sll         $2, $3, 1
/* 006E6C 01DB2B6C 21105000 */  addu        $2, $2, $16
/* 006E70 01DB2B70 06004284 */  lh          $2, 0x6($2)
/* 006E74 01DB2B74 1E004018 */  blez        $2, .L01DB2BF0_2EE1F0
/* 006E78 01DB2B78 00000000 */   nop
/* 006E7C 01DB2B7C 01000224 */  addiu       $2, $0, 0x1
/* 006E80 01DB2B80 D09D82AF */  sw          $2, -0x6230($28)
/* 006E84 01DB2B84 FFFF6224 */  addiu       $2, $3, -0x1
/* 006E88 01DB2B88 789C838F */  lw          $3, -0x6388($28)
/* 006E8C 01DB2B8C 80100200 */  sll         $2, $2, 2
/* 006E90 01DB2B90 21104300 */  addu        $2, $2, $3
/* 006E94 01DB2B94 1C0B4324 */  addiu       $3, $2, 0xB1C
/* 006E98 01DB2B98 F87F6324 */  addiu       $3, $3, 0x7FF8
/* 006E9C 01DB2B9C 0000628C */  lw          $2, 0x0($3)
/* 006EA0 01DB2BA0 FFFF4224 */  addiu       $2, $2, -0x1
/* 006EA4 01DB2BA4 000062AC */  sw          $2, 0x0($3)
/* 006EA8 01DB2BA8 1100401C */  bgtz        $2, .L01DB2BF0_2EE1F0
/* 006EAC 01DB2BAC 00000000 */   nop
/* 006EB0 01DB2BB0 A89D848F */  lw          $4, -0x6258($28)
/* 006EB4 01DB2BB4 74FE760C */  jal         DelActiveItem__Fi
/* 006EB8 01DB2BB8 00000000 */   nop
/* 006EBC 01DB2BBC B6000224 */  addiu       $2, $0, 0xB6
/* 006EC0 01DB2BC0 EA01013C */  lui         $1, %hi(DngMessMan + 0x24)
/* 006EC4 01DB2BC4 B47622AC */  sw          $2, %lo(DngMessMan + 0x24)($1)
/* 006EC8 01DB2BC8 FFFF0424 */  addiu       $4, $0, -0x1
/* 006ECC 01DB2BCC 0044070C */  jal         GetCommonItemDataSystemMsg__Fi
/* 006ED0 01DB2BD0 00000000 */   nop
/* 006ED4 01DB2BD4 EA01013C */  lui         $1, %hi(DngMessMan + 0xC)
/* 006ED8 01DB2BD8 9C7622AC */  sw          $2, %lo(DngMessMan + 0xC)($1)
/* 006EDC 01DB2BDC B4000224 */  addiu       $2, $0, 0xB4
/* 006EE0 01DB2BE0 EA01013C */  lui         $1, %hi(DngMessMan + 0x4)
/* 006EE4 01DB2BE4 947622AC */  sw          $2, %lo(DngMessMan + 0x4)($1)
/* 006EE8 01DB2BE8 EA01013C */  lui         $1, %hi(DngMessMan + 0x1C)
/* 006EEC 01DB2BEC AC7620AC */  sw          $0, %lo(DngMessMan + 0x1C)($1)
.L01DB2BF0_2EE1F0:
/* 006EF0 01DB2BF0 CC01023C */  lui         $2, %hi(GamePad)
/* 006EF4 01DB2BF4 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 006EF8 01DB2BF8 80000524 */  addiu       $5, $0, 0x80
/* 006EFC 01DB2BFC 1CAE040C */  jal         Down__8CGamePadFi
/* 006F00 01DB2C00 00000000 */   nop
/* 006F04 01DB2C04 1A014010 */  beqz        $2, .L01DB3070_2EE670
/* 006F08 01DB2C08 00000000 */   nop
/* 006F0C 01DB2C0C DC01013C */  lui         $1, %hi(BtActStatus + 0x98)
/* 006F10 01DB2C10 1845228C */  lw          $2, %lo(BtActStatus + 0x98)($1)
/* 006F14 01DB2C14 16014014 */  bnez        $2, .L01DB3070_2EE670
/* 006F18 01DB2C18 00000000 */   nop
/* 006F1C 01DB2C1C DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 006F20 01DB2C20 9044228C */  lw          $2, %lo(BtActStatus + 0x10)($1)
/* 006F24 01DB2C24 12014014 */  bnez        $2, .L01DB3070_2EE670
/* 006F28 01DB2C28 00000000 */   nop
/* 006F2C 01DB2C2C FC9D838F */  lw          $3, -0x6204($28)
/* 006F30 01DB2C30 F0000224 */  addiu       $2, $0, 0xF0
/* 006F34 01DB2C34 0E016210 */  beq         $3, $2, .L01DB3070_2EE670
/* 006F38 01DB2C38 00000000 */   nop
/* 006F3C 01DB2C3C DC01013C */  lui         $1, %hi(BtActStatus + 0x64)
/* 006F40 01DB2C40 E4442284 */  lh          $2, %lo(BtActStatus + 0x64)($1)
/* 006F44 01DB2C44 0A014010 */  beqz        $2, .L01DB3070_2EE670
/* 006F48 01DB2C48 00000000 */   nop
/* 006F4C 01DB2C4C 789C828F */  lw          $2, -0x6388($28)
/* 006F50 01DB2C50 60435124 */  addiu       $17, $2, 0x4360
/* 006F54 01DB2C54 A89D828F */  lw          $2, -0x6258($28)
/* 006F58 01DB2C58 FFFF4424 */  addiu       $4, $2, -0x1
/* 006F5C 01DB2C5C 6055070C */  jal         checkItemUsed__Fi
/* 006F60 01DB2C60 00000000 */   nop
/* 006F64 01DB2C64 28864070 */  paddub      $16, $2, $0
/* 006F68 01DB2C68 EC01023C */  lui         $2, %hi(activeItem)
/* 006F6C 01DB2C6C 70784424 */  addiu       $4, $2, %lo(activeItem)
/* 006F70 01DB2C70 0C55070C */  jal         CheckStatusType__15CActiveItemPackFv
/* 006F74 01DB2C74 00000000 */   nop
/* 006F78 01DB2C78 02000324 */  addiu       $3, $0, 0x2
/* 006F7C 01DB2C7C 25004314 */  bne         $2, $3, .L01DB2D14_2EE314
/* 006F80 01DB2C80 00000000 */   nop
/* 006F84 01DB2C84 23000012 */  beqz        $16, .L01DB2D14_2EE314
/* 006F88 01DB2C88 00000000 */   nop
/* 006F8C 01DB2C8C A89D828F */  lw          $2, -0x6258($28)
/* 006F90 01DB2C90 40100200 */  sll         $2, $2, 1
/* 006F94 01DB2C94 21105100 */  addu        $2, $2, $17
/* 006F98 01DB2C98 06004284 */  lh          $2, 0x6($2)
/* 006F9C 01DB2C9C 1D004018 */  blez        $2, .L01DB2D14_2EE314
/* 006FA0 01DB2CA0 00000000 */   nop
/* 006FA4 01DB2CA4 01000324 */  addiu       $3, $0, 0x1
/* 006FA8 01DB2CA8 EC9C83AF */  sw          $3, -0x6314($28)
/* 006FAC 01DB2CAC E49C83AF */  sw          $3, -0x631C($28)
/* 006FB0 01DB2CB0 03000224 */  addiu       $2, $0, 0x3
/* 006FB4 01DB2CB4 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 006FB8 01DB2CB8 904422AC */  sw          $2, %lo(BtActStatus + 0x10)($1)
/* 006FBC 01DB2CBC DC01013C */  lui         $1, %hi(BtActStatus + 0x64)
/* 006FC0 01DB2CC0 E44420A4 */  sh          $0, %lo(BtActStatus + 0x64)($1)
/* 006FC4 01DB2CC4 DC01013C */  lui         $1, %hi(BtActStatus + 0x70)
/* 006FC8 01DB2CC8 F04423AC */  sw          $3, %lo(BtActStatus + 0x70)($1)
/* 006FCC 01DB2CCC EC01013C */  lui         $1, %hi(activeItem + 0x34)
/* 006FD0 01DB2CD0 A478238C */  lw          $3, %lo(activeItem + 0x34)($1)
/* 006FD4 01DB2CD4 FFFF0224 */  addiu       $2, $0, -0x1
/* 006FD8 01DB2CD8 0E006214 */  bne         $3, $2, .L01DB2D14_2EE314
/* 006FDC 01DB2CDC 00000000 */   nop
/* 006FE0 01DB2CE0 EC01013C */  lui         $1, %hi(activeItem)
/* 006FE4 01DB2CE4 7078228C */  lw          $2, %lo(activeItem)($1)
/* 006FE8 01DB2CE8 80180200 */  sll         $3, $2, 2
/* 006FEC 01DB2CEC EC01023C */  lui         $2, %hi(activeItem + 0x14)
/* 006FF0 01DB2CF0 84784224 */  addiu       $2, $2, %lo(activeItem + 0x14)
/* 006FF4 01DB2CF4 21104300 */  addu        $2, $2, $3
/* 006FF8 01DB2CF8 EC01013C */  lui         $1, %hi(activeItem + 0x38)
/* 006FFC 01DB2CFC A878248C */  lw          $4, %lo(activeItem + 0x38)($1)
/* 007000 01DB2D00 0000458C */  lw          $5, 0x0($2)
/* 007004 01DB2D04 0852070C */  jal         SetHandModel__14CMainItemModelFi
/* 007008 01DB2D08 00000000 */   nop
/* 00700C 01DB2D0C EC01013C */  lui         $1, %hi(activeItem + 0x34)
/* 007010 01DB2D10 A47822AC */  sw          $2, %lo(activeItem + 0x34)($1)
.L01DB2D14_2EE314:
/* 007014 01DB2D14 EC01023C */  lui         $2, %hi(activeItem)
/* 007018 01DB2D18 70784424 */  addiu       $4, $2, %lo(activeItem)
/* 00701C 01DB2D1C 0C55070C */  jal         CheckStatusType__15CActiveItemPackFv
/* 007020 01DB2D20 00000000 */   nop
/* 007024 01DB2D24 04000324 */  addiu       $3, $0, 0x4
/* 007028 01DB2D28 4F004314 */  bne         $2, $3, .L01DB2E68_2EE468
/* 00702C 01DB2D2C 00000000 */   nop
/* 007030 01DB2D30 4D000012 */  beqz        $16, .L01DB2E68_2EE468
/* 007034 01DB2D34 00000000 */   nop
/* 007038 01DB2D38 A89D828F */  lw          $2, -0x6258($28)
/* 00703C 01DB2D3C 40100200 */  sll         $2, $2, 1
/* 007040 01DB2D40 21105100 */  addu        $2, $2, $17
/* 007044 01DB2D44 06004284 */  lh          $2, 0x6($2)
/* 007048 01DB2D48 47004018 */  blez        $2, .L01DB2E68_2EE468
/* 00704C 01DB2D4C 00000000 */   nop
/* 007050 01DB2D50 8042023C */  lui         $2, (0x42800000 >> 16)
/* 007054 01DB2D54 00608244 */  mtc1        $2, $f12
/* 007058 01DB2D58 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 00705C 01DB2D5C 00688244 */  mtc1        $2, $f13
/* 007060 01DB2D60 00708044 */  mtc1        $0, $f14
/* 007064 01DB2D64 F442023C */  lui         $2, (0x42F40000 >> 16)
/* 007068 01DB2D68 00788244 */  mtc1        $2, $f15
/* 00706C 01DB2D6C 5043023C */  lui         $2, (0x43500000 >> 16)
/* 007070 01DB2D70 00808244 */  mtc1        $2, $f16
/* 007074 01DB2D74 0004770C */  jal         setUnitAmbientAnime__Ffffff
/* 007078 01DB2D78 00000000 */   nop
/* 00707C 01DB2D7C 13000424 */  addiu       $4, $0, 0x13
/* 007080 01DB2D80 FFFF0524 */  addiu       $5, $0, -0x1
/* 007084 01DB2D84 28360070 */  paddub      $6, $0, $0
/* 007088 01DB2D88 AC69050C */  jal         SndSePlay__Fiii
/* 00708C 01DB2D8C 00000000 */   nop
/* 007090 01DB2D90 EC01013C */  lui         $1, %hi(activeItem)
/* 007094 01DB2D94 7078228C */  lw          $2, %lo(activeItem)($1)
/* 007098 01DB2D98 80180200 */  sll         $3, $2, 2
/* 00709C 01DB2D9C EC01023C */  lui         $2, %hi(activeItem + 0x4)
/* 0070A0 01DB2DA0 74784224 */  addiu       $2, $2, %lo(activeItem + 0x4)
/* 0070A4 01DB2DA4 21104300 */  addu        $2, $2, $3
/* 0070A8 01DB2DA8 0000458C */  lw          $5, 0x0($2)
/* 0070AC 01DB2DAC 789C848F */  lw          $4, -0x6388($28)
/* 0070B0 01DB2DB0 BC55070C */  jal         usedActiveItem__FP11CUserStatusi
/* 0070B4 01DB2DB4 00000000 */   nop
/* 0070B8 01DB2DB8 789C828F */  lw          $2, -0x6388($28)
/* 0070BC 01DB2DBC 60434624 */  addiu       $6, $2, 0x4360
/* 0070C0 01DB2DC0 A89D828F */  lw          $2, -0x6258($28)
/* 0070C4 01DB2DC4 40100200 */  sll         $2, $2, 1
/* 0070C8 01DB2DC8 21284600 */  addu        $5, $2, $6
/* 0070CC 01DB2DCC 0600A424 */  addiu       $4, $5, 0x6
/* 0070D0 01DB2DD0 0600A384 */  lh          $3, 0x6($5)
/* 0070D4 01DB2DD4 01000224 */  addiu       $2, $0, 0x1
/* 0070D8 01DB2DD8 1B006214 */  bne         $3, $2, .L01DB2E48_2EE448
/* 0070DC 01DB2DDC 00000000 */   nop
/* 0070E0 01DB2DE0 FFFF0424 */  addiu       $4, $0, -0x1
/* 0070E4 01DB2DE4 0000A4A4 */  sh          $4, 0x0($5)
/* 0070E8 01DB2DE8 A89D828F */  lw          $2, -0x6258($28)
/* 0070EC 01DB2DEC 40100200 */  sll         $2, $2, 1
/* 0070F0 01DB2DF0 21104600 */  addu        $2, $2, $6
/* 0070F4 01DB2DF4 060040A4 */  sh          $0, 0x6($2)
/* 0070F8 01DB2DF8 A89D828F */  lw          $2, -0x6258($28)
/* 0070FC 01DB2DFC 80180200 */  sll         $3, $2, 2
/* 007100 01DB2E00 EC01023C */  lui         $2, %hi(activeItem + 0x14)
/* 007104 01DB2E04 84784224 */  addiu       $2, $2, %lo(activeItem + 0x14)
/* 007108 01DB2E08 21104300 */  addu        $2, $2, $3
/* 00710C 01DB2E0C 0000428C */  lw          $2, 0x0($2)
/* 007110 01DB2E10 10004410 */  beq         $2, $4, .L01DB2E54_2EE454
/* 007114 01DB2E14 00000000 */   nop
/* 007118 01DB2E18 EC01023C */  lui         $2, %hi(activeItem + 0x14)
/* 00711C 01DB2E1C 84784224 */  addiu       $2, $2, %lo(activeItem + 0x14)
/* 007120 01DB2E20 21904300 */  addu        $18, $2, $3
/* 007124 01DB2E24 EC01013C */  lui         $1, %hi(activeItem + 0x38)
/* 007128 01DB2E28 A878248C */  lw          $4, %lo(activeItem + 0x38)($1)
/* 00712C 01DB2E2C 0000458E */  lw          $5, 0x0($18)
/* 007130 01DB2E30 DC51070C */  jal         DeleteModel__14CMainItemModelFi
/* 007134 01DB2E34 00000000 */   nop
/* 007138 01DB2E38 FFFF0224 */  addiu       $2, $0, -0x1
/* 00713C 01DB2E3C 000042AE */  sw          $2, 0x0($18)
/* 007140 01DB2E40 04000010 */  b           .L01DB2E54_2EE454
/* 007144 01DB2E44 00000000 */   nop
.L01DB2E48_2EE448:
/* 007148 01DB2E48 00008284 */  lh          $2, 0x0($4)
/* 00714C 01DB2E4C FFFF4224 */  addiu       $2, $2, -0x1
/* 007150 01DB2E50 000082A4 */  sh          $2, 0x0($4)
.L01DB2E54_2EE454:
/* 007154 01DB2E54 B8010424 */  addiu       $4, $0, 0x1B8
/* 007158 01DB2E58 FFFF0524 */  addiu       $5, $0, -0x1
/* 00715C 01DB2E5C 28360070 */  paddub      $6, $0, $0
/* 007160 01DB2E60 AC69050C */  jal         SndSePlay__Fiii
/* 007164 01DB2E64 00000000 */   nop
.L01DB2E68_2EE468:
/* 007168 01DB2E68 EC01023C */  lui         $2, %hi(activeItem)
/* 00716C 01DB2E6C 70784424 */  addiu       $4, $2, %lo(activeItem)
/* 007170 01DB2E70 0C55070C */  jal         CheckStatusType__15CActiveItemPackFv
/* 007174 01DB2E74 00000000 */   nop
/* 007178 01DB2E78 01000324 */  addiu       $3, $0, 0x1
/* 00717C 01DB2E7C 7C004314 */  bne         $2, $3, .L01DB3070_2EE670
/* 007180 01DB2E80 00000000 */   nop
/* 007184 01DB2E84 DC01013C */  lui         $1, %hi(BtActStatus + 0x64)
/* 007188 01DB2E88 E4442284 */  lh          $2, %lo(BtActStatus + 0x64)($1)
/* 00718C 01DB2E8C 78004010 */  beqz        $2, .L01DB3070_2EE670
/* 007190 01DB2E90 00000000 */   nop
/* 007194 01DB2E94 76000012 */  beqz        $16, .L01DB3070_2EE670
/* 007198 01DB2E98 00000000 */   nop
/* 00719C 01DB2E9C DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 0071A0 01DB2EA0 9044238C */  lw          $3, %lo(BtActStatus + 0x10)($1)
/* 0071A4 01DB2EA4 02000224 */  addiu       $2, $0, 0x2
/* 0071A8 01DB2EA8 71006210 */  beq         $3, $2, .L01DB3070_2EE670
/* 0071AC 01DB2EAC 00000000 */   nop
/* 0071B0 01DB2EB0 A89D828F */  lw          $2, -0x6258($28)
/* 0071B4 01DB2EB4 40100200 */  sll         $2, $2, 1
/* 0071B8 01DB2EB8 21105100 */  addu        $2, $2, $17
/* 0071BC 01DB2EBC 06004284 */  lh          $2, 0x6($2)
/* 0071C0 01DB2EC0 6B004018 */  blez        $2, .L01DB3070_2EE670
/* 0071C4 01DB2EC4 00000000 */   nop
/* 0071C8 01DB2EC8 DC01023C */  lui         $2, %hi(LIT_4396)
/* 0071CC 01DB2ECC 202F4424 */  addiu       $4, $2, %lo(LIT_4396)
/* 0071D0 01DB2ED0 A611040C */  jal         printf
/* 0071D4 01DB2ED4 00000000 */   nop
/* 0071D8 01DB2ED8 989D828F */  lw          $2, -0x6268($28)
/* 0071DC 01DB2EDC 45004014 */  bnez        $2, .L01DB2FF4_2EE5F4
/* 0071E0 01DB2EE0 00000000 */   nop
/* 0071E4 01DB2EE4 02000224 */  addiu       $2, $0, 0x2
/* 0071E8 01DB2EE8 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 0071EC 01DB2EEC 904422AC */  sw          $2, %lo(BtActStatus + 0x10)($1)
/* 0071F0 01DB2EF0 01000224 */  addiu       $2, $0, 0x1
/* 0071F4 01DB2EF4 EB01013C */  lui         $1, %hi(BombInfo + 0x14)
/* 0071F8 01DB2EF8 046322AC */  sw          $2, %lo(BombInfo + 0x14)($1)
/* 0071FC 01DB2EFC FFFF0224 */  addiu       $2, $0, -0x1
/* 007200 01DB2F00 EB01013C */  lui         $1, %hi(BombInfo + 0x18)
/* 007204 01DB2F04 086322AC */  sw          $2, %lo(BombInfo + 0x18)($1)
/* 007208 01DB2F08 D001A427 */  addiu       $4, $29, 0x1D0
/* 00720C 01DB2F0C EA01023C */  lui         $2, %hi(CharaMain + 0x10)
/* 007210 01DB2F10 301D4524 */  addiu       $5, $2, %lo(CharaMain + 0x10)
/* 007214 01DB2F14 0C86040C */  jal         sceVu0CopyVector
/* 007218 01DB2F18 00000000 */   nop
/* 00721C 01DB2F1C 00608044 */  mtc1        $0, $f12
/* 007220 01DB2F20 EB01023C */  lui         $2, %hi(BombInfo)
/* 007224 01DB2F24 F0624424 */  addiu       $4, $2, %lo(BombInfo)
/* 007228 01DB2F28 6850070C */  jal         getCharacterVector__FPff
/* 00722C 01DB2F2C 00000000 */   nop
/* 007230 01DB2F30 D001A2C7 */  lwc1        $f2, 0x1D0($29)
/* 007234 01DB2F34 F041023C */  lui         $2, (0x41F00000 >> 16)
/* 007238 01DB2F38 00188244 */  mtc1        $2, $f3
/* 00723C 01DB2F3C EB01013C */  lui         $1, %hi(BombInfo)
/* 007240 01DB2F40 F06221C4 */  lwc1        $f1, %lo(BombInfo)($1)
/* 007244 01DB2F44 02180146 */  mul.s       $f0, $f3, $f1
/* 007248 01DB2F48 00100046 */  add.s       $f0, $f2, $f0
/* 00724C 01DB2F4C 00080046 */  add.s       $f0, $f1, $f0
/* 007250 01DB2F50 EB01013C */  lui         $1, %hi(BombInfo)
/* 007254 01DB2F54 F06220E4 */  swc1        $f0, %lo(BombInfo)($1)
/* 007258 01DB2F58 D401A0C7 */  lwc1        $f0, 0x1D4($29)
/* 00725C 01DB2F5C EB01013C */  lui         $1, %hi(BombInfo + 0x4)
/* 007260 01DB2F60 F46220E4 */  swc1        $f0, %lo(BombInfo + 0x4)($1)
/* 007264 01DB2F64 D801A2C7 */  lwc1        $f2, 0x1D8($29)
/* 007268 01DB2F68 EB01013C */  lui         $1, %hi(BombInfo + 0x8)
/* 00726C 01DB2F6C F86221C4 */  lwc1        $f1, %lo(BombInfo + 0x8)($1)
/* 007270 01DB2F70 02180146 */  mul.s       $f0, $f3, $f1
/* 007274 01DB2F74 00100046 */  add.s       $f0, $f2, $f0
/* 007278 01DB2F78 00080046 */  add.s       $f0, $f1, $f0
/* 00727C 01DB2F7C EB01013C */  lui         $1, %hi(BombInfo + 0x8)
/* 007280 01DB2F80 F86220E4 */  swc1        $f0, %lo(BombInfo + 0x8)($1)
/* 007284 01DB2F84 1A000224 */  addiu       $2, $0, 0x1A
/* 007288 01DB2F88 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 00728C 01DB2F8C 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
/* 007290 01DB2F90 DC01013C */  lui         $1, %hi(BtActStatus + 0x64)
/* 007294 01DB2F94 E44420A4 */  sh          $0, %lo(BtActStatus + 0x64)($1)
/* 007298 01DB2F98 01000224 */  addiu       $2, $0, 0x1
/* 00729C 01DB2F9C DC01013C */  lui         $1, %hi(BtActStatus + 0x70)
/* 0072A0 01DB2FA0 F04422AC */  sw          $2, %lo(BtActStatus + 0x70)($1)
/* 0072A4 01DB2FA4 EC01013C */  lui         $1, %hi(activeItem + 0x34)
/* 0072A8 01DB2FA8 A478238C */  lw          $3, %lo(activeItem + 0x34)($1)
/* 0072AC 01DB2FAC FFFF0224 */  addiu       $2, $0, -0x1
/* 0072B0 01DB2FB0 2F006214 */  bne         $3, $2, .L01DB3070_2EE670
/* 0072B4 01DB2FB4 00000000 */   nop
/* 0072B8 01DB2FB8 EC01013C */  lui         $1, %hi(activeItem)
/* 0072BC 01DB2FBC 7078228C */  lw          $2, %lo(activeItem)($1)
/* 0072C0 01DB2FC0 80180200 */  sll         $3, $2, 2
/* 0072C4 01DB2FC4 EC01023C */  lui         $2, %hi(activeItem + 0x14)
/* 0072C8 01DB2FC8 84784224 */  addiu       $2, $2, %lo(activeItem + 0x14)
/* 0072CC 01DB2FCC 21104300 */  addu        $2, $2, $3
/* 0072D0 01DB2FD0 EC01013C */  lui         $1, %hi(activeItem + 0x38)
/* 0072D4 01DB2FD4 A878248C */  lw          $4, %lo(activeItem + 0x38)($1)
/* 0072D8 01DB2FD8 0000458C */  lw          $5, 0x0($2)
/* 0072DC 01DB2FDC 0852070C */  jal         SetHandModel__14CMainItemModelFi
/* 0072E0 01DB2FE0 00000000 */   nop
/* 0072E4 01DB2FE4 EC01013C */  lui         $1, %hi(activeItem + 0x34)
/* 0072E8 01DB2FE8 A47822AC */  sw          $2, %lo(activeItem + 0x34)($1)
/* 0072EC 01DB2FEC 20000010 */  b           .L01DB3070_2EE670
/* 0072F0 01DB2FF0 00000000 */   nop
.L01DB2FF4_2EE5F4:
/* 0072F4 01DB2FF4 01000324 */  addiu       $3, $0, 0x1
/* 0072F8 01DB2FF8 EB01013C */  lui         $1, %hi(BombInfo + 0x18)
/* 0072FC 01DB2FFC 086323AC */  sw          $3, %lo(BombInfo + 0x18)($1)
/* 007300 01DB3000 02000224 */  addiu       $2, $0, 0x2
/* 007304 01DB3004 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 007308 01DB3008 904422AC */  sw          $2, %lo(BtActStatus + 0x10)($1)
/* 00730C 01DB300C 1B000224 */  addiu       $2, $0, 0x1B
/* 007310 01DB3010 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 007314 01DB3014 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
/* 007318 01DB3018 DC01013C */  lui         $1, %hi(BtActStatus + 0x64)
/* 00731C 01DB301C E44420A4 */  sh          $0, %lo(BtActStatus + 0x64)($1)
/* 007320 01DB3020 DC01013C */  lui         $1, %hi(BtActStatus + 0x70)
/* 007324 01DB3024 F04423AC */  sw          $3, %lo(BtActStatus + 0x70)($1)
/* 007328 01DB3028 EC01013C */  lui         $1, %hi(activeItem + 0x34)
/* 00732C 01DB302C A478238C */  lw          $3, %lo(activeItem + 0x34)($1)
/* 007330 01DB3030 FFFF0224 */  addiu       $2, $0, -0x1
/* 007334 01DB3034 0E006214 */  bne         $3, $2, .L01DB3070_2EE670
/* 007338 01DB3038 00000000 */   nop
/* 00733C 01DB303C EC01013C */  lui         $1, %hi(activeItem)
/* 007340 01DB3040 7078228C */  lw          $2, %lo(activeItem)($1)
/* 007344 01DB3044 80180200 */  sll         $3, $2, 2
/* 007348 01DB3048 EC01023C */  lui         $2, %hi(activeItem + 0x14)
/* 00734C 01DB304C 84784224 */  addiu       $2, $2, %lo(activeItem + 0x14)
/* 007350 01DB3050 21104300 */  addu        $2, $2, $3
/* 007354 01DB3054 EC01013C */  lui         $1, %hi(activeItem + 0x38)
/* 007358 01DB3058 A878248C */  lw          $4, %lo(activeItem + 0x38)($1)
/* 00735C 01DB305C 0000458C */  lw          $5, 0x0($2)
/* 007360 01DB3060 0852070C */  jal         SetHandModel__14CMainItemModelFi
/* 007364 01DB3064 00000000 */   nop
/* 007368 01DB3068 EC01013C */  lui         $1, %hi(activeItem + 0x34)
/* 00736C 01DB306C A47822AC */  sw          $2, %lo(activeItem + 0x34)($1)
.L01DB3070_2EE670:
/* 007370 01DB3070 D09C848F */  lw          $4, -0x6330($28)
/* 007374 01DB3074 B000A527 */  addiu       $5, $29, 0xB0
/* 007378 01DB3078 3433070C */  jal         SearchDataSlotPos__16CDungeonEventManFPf
/* 00737C 01DB307C 00000000 */   nop
/* 007380 01DB3080 28864070 */  paddub      $16, $2, $0
/* 007384 01DB3084 38000012 */  beqz        $16, .L01DB3168_2EE768
/* 007388 01DB3088 00000000 */   nop
/* 00738C 01DB308C DC01013C */  lui         $1, %hi(BtActStatus + 0x64)
/* 007390 01DB3090 E4442284 */  lh          $2, %lo(BtActStatus + 0x64)($1)
/* 007394 01DB3094 34004010 */  beqz        $2, .L01DB3168_2EE768
/* 007398 01DB3098 00000000 */   nop
/* 00739C 01DB309C 0000028E */  lw          $2, 0x0($16)
/* 0073A0 01DB30A0 2C00428C */  lw          $2, 0x2C($2)
/* 0073A4 01DB30A4 FFFF0324 */  addiu       $3, $0, -0x1
/* 0073A8 01DB30A8 2F004310 */  beq         $2, $3, .L01DB3168_2EE768
/* 0073AC 01DB30AC 00000000 */   nop
/* 0073B0 01DB30B0 D501013C */  lui         $1, %hi(BtEventInfo + 0x2C)
/* 0073B4 01DB30B4 6C6723AC */  sw          $3, %lo(BtEventInfo + 0x2C)($1)
/* 0073B8 01DB30B8 0000028E */  lw          $2, 0x0($16)
/* 0073BC 01DB30BC 2000428C */  lw          $2, 0x20($2)
/* 0073C0 01DB30C0 1B004310 */  beq         $2, $3, .L01DB3130_2EE730
/* 0073C4 01DB30C4 00000000 */   nop
/* 0073C8 01DB30C8 D501013C */  lui         $1, %hi(BtEventInfo + 0x2C)
/* 0073CC 01DB30CC 6C6722AC */  sw          $2, %lo(BtEventInfo + 0x2C)($1)
/* 0073D0 01DB30D0 0000028E */  lw          $2, 0x0($16)
/* 0073D4 01DB30D4 3800428C */  lw          $2, 0x38($2)
/* 0073D8 01DB30D8 D501013C */  lui         $1, %hi(BtEventInfo + 0x34)
/* 0073DC 01DB30DC 746722AC */  sw          $2, %lo(BtEventInfo + 0x34)($1)
/* 0073E0 01DB30E0 D501013C */  lui         $1, %hi(BtEventInfo + 0x24)
/* 0073E4 01DB30E4 646720AC */  sw          $0, %lo(BtEventInfo + 0x24)($1)
/* 0073E8 01DB30E8 E001A427 */  addiu       $4, $29, 0x1E0
/* 0073EC 01DB30EC 10000526 */  addiu       $5, $16, 0x10
/* 0073F0 01DB30F0 0C86040C */  jal         sceVu0CopyVector
/* 0073F4 01DB30F4 00000000 */   nop
/* 0073F8 01DB30F8 F001A427 */  addiu       $4, $29, 0x1F0
/* 0073FC 01DB30FC 20000526 */  addiu       $5, $16, 0x20
/* 007400 01DB3100 0C86040C */  jal         sceVu0CopyVector
/* 007404 01DB3104 00000000 */   nop
/* 007408 01DB3108 D501023C */  lui         $2, %hi(BtEventInfo)
/* 00740C 01DB310C 40674424 */  addiu       $4, $2, %lo(BtEventInfo)
/* 007410 01DB3110 E001A527 */  addiu       $5, $29, 0x1E0
/* 007414 01DB3114 0C86040C */  jal         sceVu0CopyVector
/* 007418 01DB3118 00000000 */   nop
/* 00741C 01DB311C D501023C */  lui         $2, %hi(BtEventInfo + 0x10)
/* 007420 01DB3120 50674424 */  addiu       $4, $2, %lo(BtEventInfo + 0x10)
/* 007424 01DB3124 F001A527 */  addiu       $5, $29, 0x1F0
/* 007428 01DB3128 0C86040C */  jal         sceVu0CopyVector
/* 00742C 01DB312C 00000000 */   nop
.L01DB3130_2EE730:
/* 007430 01DB3130 D501013C */  lui         $1, %hi(BtEventInfo + 0x2C)
/* 007434 01DB3134 6C67238C */  lw          $3, %lo(BtEventInfo + 0x2C)($1)
/* 007438 01DB3138 FFFF0224 */  addiu       $2, $0, -0x1
/* 00743C 01DB313C 0A006210 */  beq         $3, $2, .L01DB3168_2EE768
/* 007440 01DB3140 00000000 */   nop
/* 007444 01DB3144 90010224 */  addiu       $2, $0, 0x190
/* 007448 01DB3148 FC9D82AF */  sw          $2, -0x6204($28)
/* 00744C 01DB314C 01000224 */  addiu       $2, $0, 0x1
/* 007450 01DB3150 D501013C */  lui         $1, %hi(BtEventInfo + 0x24)
/* 007454 01DB3154 646722AC */  sw          $2, %lo(BtEventInfo + 0x24)($1)
/* 007458 01DB3158 D501013C */  lui         $1, %hi(BtEventInfo + 0xB4)
/* 00745C 01DB315C F46720AC */  sw          $0, %lo(BtEventInfo + 0xB4)($1)
/* 007460 01DB3160 41100010 */  b           .L.L01DB7268_2F2868$b
/* 007464 01DB3164 00000000 */   nop
.L01DB3168_2EE768:
/* 007468 01DB3168 B8EF760C */  jal         BattleActionThlow__Fv
/* 00746C 01DB316C 00000000 */   nop
/* 007470 01DB3170 80F1760C */  jal         BattleActionDrink__Fv
/* 007474 01DB3174 00000000 */   nop
/* 007478 01DB3178 01000424 */  addiu       $4, $0, 0x1
/* 00747C 01DB317C DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 007480 01DB3180 9044228C */  lw          $2, %lo(BtActStatus + 0x10)($1)
/* 007484 01DB3184 02004010 */  beqz        $2, .L01DB3190_2EE790
/* 007488 01DB3188 00000000 */   nop
/* 00748C 01DB318C 28260070 */  paddub      $4, $0, $0
.L01DB3190_2EE790:
/* 007490 01DB3190 DC01013C */  lui         $1, %hi(BtActStatus + 0x68)
/* 007494 01DB3194 E84420AC */  sw          $0, %lo(BtActStatus + 0x68)($1)
/* 007498 01DB3198 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 00749C 01DB319C 9044228C */  lw          $2, %lo(BtActStatus + 0x10)($1)
/* 0074A0 01DB31A0 01000324 */  addiu       $3, $0, 0x1
/* 0074A4 01DB31A4 37004314 */  bne         $2, $3, .L01DB3284_2EE884
/* 0074A8 01DB31A8 00000000 */   nop
/* 0074AC 01DB31AC 282E0070 */  paddub      $5, $0, $0
/* 0074B0 01DB31B0 DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 0074B4 01DB31B4 9444268C */  lw          $6, %lo(BtActStatus + 0x14)($1)
/* 0074B8 01DB31B8 0E000224 */  addiu       $2, $0, 0xE
/* 0074BC 01DB31BC 0600C214 */  bne         $6, $2, .L01DB31D8_2EE7D8
/* 0074C0 01DB31C0 00000000 */   nop
/* 0074C4 01DB31C4 789C828F */  lw          $2, -0x6388($28)
/* 0074C8 01DB31C8 04004280 */  lb          $2, 0x4($2)
/* 0074CC 01DB31CC 02004014 */  bnez        $2, .L01DB31D8_2EE7D8
/* 0074D0 01DB31D0 00000000 */   nop
/* 0074D4 01DB31D4 282E6070 */  paddub      $5, $3, $0
.L01DB31D8_2EE7D8:
/* 0074D8 01DB31D8 0D000224 */  addiu       $2, $0, 0xD
/* 0074DC 01DB31DC 0700C214 */  bne         $6, $2, .L01DB31FC_2EE7FC
/* 0074E0 01DB31E0 00000000 */   nop
/* 0074E4 01DB31E4 789C828F */  lw          $2, -0x6388($28)
/* 0074E8 01DB31E8 04004380 */  lb          $3, 0x4($2)
/* 0074EC 01DB31EC 02000224 */  addiu       $2, $0, 0x2
/* 0074F0 01DB31F0 02006214 */  bne         $3, $2, .L01DB31FC_2EE7FC
/* 0074F4 01DB31F4 00000000 */   nop
/* 0074F8 01DB31F8 01000524 */  addiu       $5, $0, 0x1
.L01DB31FC_2EE7FC:
/* 0074FC 01DB31FC 2100A010 */  beqz        $5, .L01DB3284_2EE884
/* 007500 01DB3200 00000000 */   nop
/* 007504 01DB3204 C89D82C7 */  lwc1        $f2, -0x6238($28)
/* 007508 01DB3208 808080C7 */  lwc1        $f0, -0x7F80($28)
/* 00750C 01DB320C 34100046 */  c.lt.s      $f2, $f0
/* 007510 01DB3210 00000000 */  nop
/* 007514 01DB3214 18000145 */  bc1t        .L01DB3278_2EE878
/* 007518 01DB3218 00000000 */   nop
/* 00751C 01DB321C DC01013C */  lui         $1, %hi(velo__2)
/* 007520 01DB3220 502520C4 */  lwc1        $f0, %lo(velo__2)($1)
/* 007524 01DB3224 6C8381C7 */  lwc1        $f1, -0x7C94($28)
/* 007528 01DB3228 02000146 */  mul.s       $f0, $f0, $f1
/* 00752C 01DB322C DC01013C */  lui         $1, %hi(velo__2)
/* 007530 01DB3230 502520E4 */  swc1        $f0, %lo(velo__2)($1)
/* 007534 01DB3234 DC01013C */  lui         $1, %hi(velo__2 + 0x8)
/* 007538 01DB3238 582520C4 */  lwc1        $f0, %lo(velo__2 + 0x8)($1)
/* 00753C 01DB323C 02000146 */  mul.s       $f0, $f0, $f1
/* 007540 01DB3240 DC01013C */  lui         $1, %hi(velo__2 + 0x8)
/* 007544 01DB3244 582520E4 */  swc1        $f0, %lo(velo__2 + 0x8)($1)
/* 007548 01DB3248 1E000224 */  addiu       $2, $0, 0x1E
/* 00754C 01DB324C DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 007550 01DB3250 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
/* 007554 01DB3254 1C8581C7 */  lwc1        $f1, -0x7AE4($28)
/* 007558 01DB3258 0040023C */  lui         $2, (0x40000000 >> 16)
/* 00755C 01DB325C 00008244 */  mtc1        $2, $f0
/* 007560 01DB3260 00000000 */  nop
/* 007564 01DB3264 03100046 */  div.s       $f0, $f2, $f0
/* 007568 01DB3268 00080046 */  add.s       $f0, $f1, $f0
/* 00756C 01DB326C EA01013C */  lui         $1, %hi(CharaMain + 0x344)
/* 007570 01DB3270 6420228C */  lw          $2, %lo(CharaMain + 0x344)($1)
/* 007574 01DB3274 E80140E4 */  swc1        $f0, 0x1E8($2)
.L01DB3278_2EE878:
/* 007578 01DB3278 01000424 */  addiu       $4, $0, 0x1
/* 00757C 01DB327C DC01013C */  lui         $1, %hi(BtActStatus + 0x68)
/* 007580 01DB3280 E84424AC */  sw          $4, %lo(BtActStatus + 0x68)($1)
.L01DB3284_2EE884:
/* 007584 01DB3284 DC01013C */  lui         $1, %hi(BtActStatus + 0x60)
/* 007588 01DB3288 E044238C */  lw          $3, %lo(BtActStatus + 0x60)($1)
/* 00758C 01DB328C 05000224 */  addiu       $2, $0, 0x5
/* 007590 01DB3290 21006214 */  bne         $3, $2, .L01DB3318_2EE918
/* 007594 01DB3294 00000000 */   nop
/* 007598 01DB3298 C89D82C7 */  lwc1        $f2, -0x6238($28)
/* 00759C 01DB329C 808080C7 */  lwc1        $f0, -0x7F80($28)
/* 0075A0 01DB32A0 34100046 */  c.lt.s      $f2, $f0
/* 0075A4 01DB32A4 00000000 */  nop
/* 0075A8 01DB32A8 18000145 */  bc1t        .L01DB330C_2EE90C
/* 0075AC 01DB32AC 00000000 */   nop
/* 0075B0 01DB32B0 DC01013C */  lui         $1, %hi(velo__2)
/* 0075B4 01DB32B4 502520C4 */  lwc1        $f0, %lo(velo__2)($1)
/* 0075B8 01DB32B8 6C8381C7 */  lwc1        $f1, -0x7C94($28)
/* 0075BC 01DB32BC 02000146 */  mul.s       $f0, $f0, $f1
/* 0075C0 01DB32C0 DC01013C */  lui         $1, %hi(velo__2)
/* 0075C4 01DB32C4 502520E4 */  swc1        $f0, %lo(velo__2)($1)
/* 0075C8 01DB32C8 DC01013C */  lui         $1, %hi(velo__2 + 0x8)
/* 0075CC 01DB32CC 582520C4 */  lwc1        $f0, %lo(velo__2 + 0x8)($1)
/* 0075D0 01DB32D0 02000146 */  mul.s       $f0, $f0, $f1
/* 0075D4 01DB32D4 DC01013C */  lui         $1, %hi(velo__2 + 0x8)
/* 0075D8 01DB32D8 582520E4 */  swc1        $f0, %lo(velo__2 + 0x8)($1)
/* 0075DC 01DB32DC 21000224 */  addiu       $2, $0, 0x21
/* 0075E0 01DB32E0 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 0075E4 01DB32E4 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
/* 0075E8 01DB32E8 1C8581C7 */  lwc1        $f1, -0x7AE4($28)
/* 0075EC 01DB32EC 0040023C */  lui         $2, (0x40000000 >> 16)
/* 0075F0 01DB32F0 00008244 */  mtc1        $2, $f0
/* 0075F4 01DB32F4 00000000 */  nop
/* 0075F8 01DB32F8 03100046 */  div.s       $f0, $f2, $f0
/* 0075FC 01DB32FC 00080046 */  add.s       $f0, $f1, $f0
/* 007600 01DB3300 EA01013C */  lui         $1, %hi(CharaMain + 0x344)
/* 007604 01DB3304 6420228C */  lw          $2, %lo(CharaMain + 0x344)($1)
/* 007608 01DB3308 180240E4 */  swc1        $f0, 0x218($2)
.L01DB330C_2EE90C:
/* 00760C 01DB330C 01000424 */  addiu       $4, $0, 0x1
/* 007610 01DB3310 DC01013C */  lui         $1, %hi(BtActStatus + 0x68)
/* 007614 01DB3314 E84424AC */  sw          $4, %lo(BtActStatus + 0x68)($1)
.L01DB3318_2EE918:
/* 007618 01DB3318 789C828F */  lw          $2, -0x6388($28)
/* 00761C 01DB331C 04004380 */  lb          $3, 0x4($2)
/* 007620 01DB3320 05000224 */  addiu       $2, $0, 0x5
/* 007624 01DB3324 02006214 */  bne         $3, $2, .L01DB3330_2EE930
/* 007628 01DB3328 00000000 */   nop
/* 00762C 01DB332C 01000424 */  addiu       $4, $0, 0x1
.L01DB3330_2EE930:
/* 007630 01DB3330 05008010 */  beqz        $4, .L01DB3348_2EE948
/* 007634 01DB3334 00000000 */   nop
/* 007638 01DB3338 DC01013C */  lui         $1, %hi(BtActStatus + 0x64)
/* 00763C 01DB333C E4442284 */  lh          $2, %lo(BtActStatus + 0x64)($1)
/* 007640 01DB3340 07004014 */  bnez        $2, .L01DB3360_2EE960
/* 007644 01DB3344 00000000 */   nop
.L01DB3348_2EE948:
/* 007648 01DB3348 DC01013C */  lui         $1, %hi(velo__2 + 0x8)
/* 00764C 01DB334C 582520AC */  sw          $0, %lo(velo__2 + 0x8)($1)
/* 007650 01DB3350 DC01013C */  lui         $1, %hi(velo__2 + 0x4)
/* 007654 01DB3354 542520AC */  sw          $0, %lo(velo__2 + 0x4)($1)
/* 007658 01DB3358 DC01013C */  lui         $1, %hi(velo__2)
/* 00765C 01DB335C 502520AC */  sw          $0, %lo(velo__2)($1)
.L01DB3360_2EE960:
/* 007660 01DB3360 F4EB760C */  jal         BtCheckDamageProc__Fv
/* 007664 01DB3364 00000000 */   nop
/* 007668 01DB3368 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 00766C 01DB336C 9044238C */  lw          $3, %lo(BtActStatus + 0x10)($1)
/* 007670 01DB3370 04000224 */  addiu       $2, $0, 0x4
/* 007674 01DB3374 1A006214 */  bne         $3, $2, .L01DB33E0_2EE9E0
/* 007678 01DB3378 00000000 */   nop
/* 00767C 01DB337C EA01013C */  lui         $1, %hi(CharaMain + 0x344)
/* 007680 01DB3380 6420228C */  lw          $2, %lo(CharaMain + 0x344)($1)
/* 007684 01DB3384 440040C4 */  lwc1        $f0, 0x44($2)
/* 007688 01DB3388 60008046 */  cvt.s.w     $f1, $f0
/* 00768C 01DB338C EA01013C */  lui         $1, %hi(CharaMain + 0x2F0)
/* 007690 01DB3390 102022C4 */  lwc1        $f2, %lo(CharaMain + 0x2F0)($1)
/* 007694 01DB3394 0040023C */  lui         $2, (0x40000000 >> 16)
/* 007698 01DB3398 00008244 */  mtc1        $2, $f0
/* 00769C 01DB339C 00000000 */  nop
/* 0076A0 01DB33A0 01080046 */  sub.s       $f0, $f1, $f0
/* 0076A4 01DB33A4 34100046 */  c.lt.s      $f2, $f0
/* 0076A8 01DB33A8 00000000 */  nop
/* 0076AC 01DB33AC 09000145 */  bc1t        .L01DB33D4_2EE9D4
/* 0076B0 01DB33B0 00000000 */   nop
/* 0076B4 01DB33B4 36100146 */  c.le.s      $f2, $f1
/* 0076B8 01DB33B8 00000000 */  nop
/* 0076BC 01DB33BC 05000045 */  bc1f        .L01DB33D4_2EE9D4
/* 0076C0 01DB33C0 00000000 */   nop
/* 0076C4 01DB33C4 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 0076C8 01DB33C8 904420AC */  sw          $0, %lo(BtActStatus + 0x10)($1)
/* 0076CC 01DB33CC 04000010 */  b           .L01DB33E0_2EE9E0
/* 0076D0 01DB33D0 00000000 */   nop
.L01DB33D4_2EE9D4:
/* 0076D4 01DB33D4 04000224 */  addiu       $2, $0, 0x4
/* 0076D8 01DB33D8 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 0076DC 01DB33DC 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
.L01DB33E0_2EE9E0:
/* 0076E0 01DB33E0 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 0076E4 01DB33E4 9044238C */  lw          $3, %lo(BtActStatus + 0x10)($1)
/* 0076E8 01DB33E8 05000224 */  addiu       $2, $0, 0x5
/* 0076EC 01DB33EC 1A006214 */  bne         $3, $2, .L01DB3458_2EEA58
/* 0076F0 01DB33F0 00000000 */   nop
/* 0076F4 01DB33F4 EA01013C */  lui         $1, %hi(CharaMain + 0x344)
/* 0076F8 01DB33F8 6420228C */  lw          $2, %lo(CharaMain + 0x344)($1)
/* 0076FC 01DB33FC 640040C4 */  lwc1        $f0, 0x64($2)
/* 007700 01DB3400 60008046 */  cvt.s.w     $f1, $f0
/* 007704 01DB3404 EA01013C */  lui         $1, %hi(CharaMain + 0x2F0)
/* 007708 01DB3408 102022C4 */  lwc1        $f2, %lo(CharaMain + 0x2F0)($1)
/* 00770C 01DB340C 0040023C */  lui         $2, (0x40000000 >> 16)
/* 007710 01DB3410 00008244 */  mtc1        $2, $f0
/* 007714 01DB3414 00000000 */  nop
/* 007718 01DB3418 01080046 */  sub.s       $f0, $f1, $f0
/* 00771C 01DB341C 34100046 */  c.lt.s      $f2, $f0
/* 007720 01DB3420 00000000 */  nop
/* 007724 01DB3424 09000145 */  bc1t        .L01DB344C_2EEA4C
/* 007728 01DB3428 00000000 */   nop
/* 00772C 01DB342C 36100146 */  c.le.s      $f2, $f1
/* 007730 01DB3430 00000000 */  nop
/* 007734 01DB3434 05000045 */  bc1f        .L01DB344C_2EEA4C
/* 007738 01DB3438 00000000 */   nop
/* 00773C 01DB343C DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 007740 01DB3440 904420AC */  sw          $0, %lo(BtActStatus + 0x10)($1)
/* 007744 01DB3444 04000010 */  b           .L01DB3458_2EEA58
/* 007748 01DB3448 00000000 */   nop
.L01DB344C_2EEA4C:
/* 00774C 01DB344C 06000224 */  addiu       $2, $0, 0x6
/* 007750 01DB3450 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 007754 01DB3454 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
.L01DB3458_2EEA58:
/* 007758 01DB3458 789C848F */  lw          $4, -0x6388($28)
/* 00775C 01DB345C 24FA060C */  jal         CheckLife__11CUserStatusFv
/* 007760 01DB3460 00000000 */   nop
/* 007764 01DB3464 2500401C */  bgtz        $2, .L01DB34FC_2EEAFC
/* 007768 01DB3468 00000000 */   nop
/* 00776C 01DB346C DC01013C */  lui         $1, %hi(BtActStatus + 0x24)
/* 007770 01DB3470 A444228C */  lw          $2, %lo(BtActStatus + 0x24)($1)
/* 007774 01DB3474 21004014 */  bnez        $2, .L01DB34FC_2EEAFC
/* 007778 01DB3478 00000000 */   nop
/* 00777C 01DB347C DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 007780 01DB3480 9044238C */  lw          $3, %lo(BtActStatus + 0x10)($1)
/* 007784 01DB3484 05000224 */  addiu       $2, $0, 0x5
/* 007788 01DB3488 1C006210 */  beq         $3, $2, .L01DB34FC_2EEAFC
/* 00778C 01DB348C 00000000 */   nop
/* 007790 01DB3490 789C838F */  lw          $3, -0x6388($28)
/* 007794 01DB3494 04006280 */  lb          $2, 0x4($3)
/* 007798 01DB3498 40100200 */  sll         $2, $2, 1
/* 00779C 01DB349C 21104300 */  addu        $2, $2, $3
/* 0077A0 01DB34A0 120040A4 */  sh          $0, 0x12($2)
/* 0077A4 01DB34A4 68010224 */  addiu       $2, $0, 0x168
/* 0077A8 01DB34A8 089E82AF */  sw          $2, -0x61F8($28)
/* 0077AC 01DB34AC 3C000224 */  addiu       $2, $0, 0x3C
/* 0077B0 01DB34B0 0C9E82AF */  sw          $2, -0x61F4($28)
/* 0077B4 01DB34B4 DC01013C */  lui         $1, %hi(BtActStatus + 0x98)
/* 0077B8 01DB34B8 184520AC */  sw          $0, %lo(BtActStatus + 0x98)($1)
/* 0077BC 01DB34BC 789C838F */  lw          $3, -0x6388($28)
/* 0077C0 01DB34C0 04006280 */  lb          $2, 0x4($3)
/* 0077C4 01DB34C4 80100200 */  sll         $2, $2, 2
/* 0077C8 01DB34C8 21104300 */  addu        $2, $2, $3
/* 0077CC 01DB34CC C84240AC */  sw          $0, 0x42C8($2)
/* 0077D0 01DB34D0 789C838F */  lw          $3, -0x6388($28)
/* 0077D4 01DB34D4 04006280 */  lb          $2, 0x4($3)
/* 0077D8 01DB34D8 40100200 */  sll         $2, $2, 1
/* 0077DC 01DB34DC 21104300 */  addu        $2, $2, $3
/* 0077E0 01DB34E0 E04240A4 */  sh          $0, 0x42E0($2)
/* 0077E4 01DB34E4 38FF760C */  jal         LockOffTargte__Fv
/* 0077E8 01DB34E8 00000000 */   nop
/* 0077EC 01DB34EC C8000224 */  addiu       $2, $0, 0xC8
/* 0077F0 01DB34F0 FC9D82AF */  sw          $2, -0x6204($28)
/* 0077F4 01DB34F4 5C0F0010 */  b           .L.L01DB7268_2F2868$b
/* 0077F8 01DB34F8 00000000 */   nop
.L01DB34FC_2EEAFC:
/* 0077FC 01DB34FC DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 007800 01DB3500 9044238C */  lw          $3, %lo(BtActStatus + 0x10)($1)
/* 007804 01DB3504 05000224 */  addiu       $2, $0, 0x5
/* 007808 01DB3508 2F006214 */  bne         $3, $2, .L01DB35C8_2EEBC8
/* 00780C 01DB350C 00000000 */   nop
/* 007810 01DB3510 DC01013C */  lui         $1, %hi(blowVelo)
/* 007814 01DB3514 702520C4 */  lwc1        $f0, %lo(blowVelo)($1)
/* 007818 01DB3518 DC01013C */  lui         $1, %hi(velo__2)
/* 00781C 01DB351C 502520E4 */  swc1        $f0, %lo(velo__2)($1)
/* 007820 01DB3520 DC01013C */  lui         $1, %hi(blowVelo + 0x8)
/* 007824 01DB3524 782520C4 */  lwc1        $f0, %lo(blowVelo + 0x8)($1)
/* 007828 01DB3528 DC01013C */  lui         $1, %hi(velo__2 + 0x8)
/* 00782C 01DB352C 582520E4 */  swc1        $f0, %lo(velo__2 + 0x8)($1)
/* 007830 01DB3530 28260070 */  paddub      $4, $0, $0
/* 007834 01DB3534 21000010 */  b           .L01DB35BC_2EEBBC
/* 007838 01DB3538 00000000 */   nop
.L01DB353C_2EEB3C:
/* 00783C 01DB353C 80180400 */  sll         $3, $4, 2
/* 007840 01DB3540 DC01023C */  lui         $2, %hi(blowVelo)
/* 007844 01DB3544 70254224 */  addiu       $2, $2, %lo(blowVelo)
/* 007848 01DB3548 21104300 */  addu        $2, $2, $3
/* 00784C 01DB354C 000041C4 */  lwc1        $f1, 0x0($2)
/* 007850 01DB3550 00008044 */  mtc1        $0, $f0
/* 007854 01DB3554 00000000 */  nop
/* 007858 01DB3558 34080046 */  c.lt.s      $f1, $f0
/* 00785C 01DB355C 00000000 */  nop
/* 007860 01DB3560 0C000045 */  bc1f        .L01DB3594_2EEB94
/* 007864 01DB3564 00000000 */   nop
/* 007868 01DB3568 348580C7 */  lwc1        $f0, -0x7ACC($28)
/* 00786C 01DB356C 40080046 */  add.s       $f1, $f1, $f0
/* 007870 01DB3570 000041E4 */  swc1        $f1, 0x0($2)
/* 007874 01DB3574 388580C7 */  lwc1        $f0, -0x7AC8($28)
/* 007878 01DB3578 34080046 */  c.lt.s      $f1, $f0
/* 00787C 01DB357C 00000000 */  nop
/* 007880 01DB3580 0D000145 */  bc1t        .L01DB35B8_2EEBB8
/* 007884 01DB3584 00000000 */   nop
/* 007888 01DB3588 000040AC */  sw          $0, 0x0($2)
/* 00788C 01DB358C 0A000010 */  b           .L01DB35B8_2EEBB8
/* 007890 01DB3590 00000000 */   nop
.L01DB3594_2EEB94:
/* 007894 01DB3594 348580C7 */  lwc1        $f0, -0x7ACC($28)
/* 007898 01DB3598 41080046 */  sub.s       $f1, $f1, $f0
/* 00789C 01DB359C 000041E4 */  swc1        $f1, 0x0($2)
/* 0078A0 01DB35A0 148480C7 */  lwc1        $f0, -0x7BEC($28)
/* 0078A4 01DB35A4 36080046 */  c.le.s      $f1, $f0
/* 0078A8 01DB35A8 00000000 */  nop
/* 0078AC 01DB35AC 02000045 */  bc1f        .L01DB35B8_2EEBB8
/* 0078B0 01DB35B0 00000000 */   nop
/* 0078B4 01DB35B4 000040AC */  sw          $0, 0x0($2)
.L01DB35B8_2EEBB8:
/* 0078B8 01DB35B8 01008424 */  addiu       $4, $4, 0x1
.L01DB35BC_2EEBBC:
/* 0078BC 01DB35BC 03008228 */  slti        $2, $4, 0x3
/* 0078C0 01DB35C0 DEFF4014 */  bnez        $2, .L01DB353C_2EEB3C
/* 0078C4 01DB35C4 00000000 */   nop
.L01DB35C8_2EEBC8:
/* 0078C8 01DB35C8 DC01013C */  lui         $1, %hi(BtActStatus + 0x40)
/* 0078CC 01DB35CC C044238C */  lw          $3, %lo(BtActStatus + 0x40)($1)
/* 0078D0 01DB35D0 1D006018 */  blez        $3, .L01DB3648_2EEC48
/* 0078D4 01DB35D4 00000000 */   nop
/* 0078D8 01DB35D8 01000224 */  addiu       $2, $0, 0x1
/* 0078DC 01DB35DC 1A006214 */  bne         $3, $2, .L01DB3648_2EEC48
/* 0078E0 01DB35E0 00000000 */   nop
/* 0078E4 01DB35E4 DC01013C */  lui         $1, %hi(velo__2)
/* 0078E8 01DB35E8 502521C4 */  lwc1        $f1, %lo(velo__2)($1)
/* 0078EC 01DB35EC DC01013C */  lui         $1, %hi(BtActStatus + 0x30)
/* 0078F0 01DB35F0 B04420C4 */  lwc1        $f0, %lo(BtActStatus + 0x30)($1)
/* 0078F4 01DB35F4 00080046 */  add.s       $f0, $f1, $f0
/* 0078F8 01DB35F8 DC01013C */  lui         $1, %hi(velo__2)
/* 0078FC 01DB35FC 502520E4 */  swc1        $f0, %lo(velo__2)($1)
/* 007900 01DB3600 DC01013C */  lui         $1, %hi(velo__2 + 0x4)
/* 007904 01DB3604 542520C4 */  lwc1        $f0, %lo(velo__2 + 0x4)($1)
/* 007908 01DB3608 DC01013C */  lui         $1, %hi(BtActStatus + 0x34)
/* 00790C 01DB360C B44422C4 */  lwc1        $f2, %lo(BtActStatus + 0x34)($1)
/* 007910 01DB3610 00000246 */  add.s       $f0, $f0, $f2
/* 007914 01DB3614 DC01013C */  lui         $1, %hi(velo__2 + 0x4)
/* 007918 01DB3618 542520E4 */  swc1        $f0, %lo(velo__2 + 0x4)($1)
/* 00791C 01DB361C DC01013C */  lui         $1, %hi(velo__2 + 0x8)
/* 007920 01DB3620 582521C4 */  lwc1        $f1, %lo(velo__2 + 0x8)($1)
/* 007924 01DB3624 DC01013C */  lui         $1, %hi(BtActStatus + 0x38)
/* 007928 01DB3628 B84420C4 */  lwc1        $f0, %lo(BtActStatus + 0x38)($1)
/* 00792C 01DB362C 00080046 */  add.s       $f0, $f1, $f0
/* 007930 01DB3630 DC01013C */  lui         $1, %hi(velo__2 + 0x8)
/* 007934 01DB3634 582520E4 */  swc1        $f0, %lo(velo__2 + 0x8)($1)
/* 007938 01DB3638 808080C7 */  lwc1        $f0, -0x7F80($28)
/* 00793C 01DB363C 01100046 */  sub.s       $f0, $f2, $f0
/* 007940 01DB3640 DC01013C */  lui         $1, %hi(BtActStatus + 0x34)
/* 007944 01DB3644 B44420E4 */  swc1        $f0, %lo(BtActStatus + 0x34)($1)
.L01DB3648_2EEC48:
/* 007948 01DB3648 DC01013C */  lui         $1, %hi(BtActStatus + 0x110)
/* 00794C 01DB364C 90452CC4 */  lwc1        $f12, %lo(BtActStatus + 0x110)($1)
/* 007950 01DB3650 00008044 */  mtc1        $0, $f0
/* 007954 01DB3654 00000000 */  nop
/* 007958 01DB3658 36600046 */  c.le.s      $f12, $f0
/* 00795C 01DB365C 00000000 */  nop
/* 007960 01DB3660 21000145 */  bc1t        .L01DB36E8_2EECE8
/* 007964 01DB3664 00000000 */   nop
/* 007968 01DB3668 0002A427 */  addiu       $4, $29, 0x200
/* 00796C 01DB366C DC01023C */  lui         $2, %hi(BtActStatus + 0x100)
/* 007970 01DB3670 80454524 */  addiu       $5, $2, %lo(BtActStatus + 0x100)
/* 007974 01DB3674 4688040C */  jal         sceVu0ScaleVectorXYZ
/* 007978 01DB3678 00000000 */   nop
/* 00797C 01DB367C DC01013C */  lui         $1, %hi(velo__2)
/* 007980 01DB3680 502521C4 */  lwc1        $f1, %lo(velo__2)($1)
/* 007984 01DB3684 0002A0C7 */  lwc1        $f0, 0x200($29)
/* 007988 01DB3688 00080046 */  add.s       $f0, $f1, $f0
/* 00798C 01DB368C DC01013C */  lui         $1, %hi(velo__2)
/* 007990 01DB3690 502520E4 */  swc1        $f0, %lo(velo__2)($1)
/* 007994 01DB3694 DC01013C */  lui         $1, %hi(velo__2 + 0x8)
/* 007998 01DB3698 582521C4 */  lwc1        $f1, %lo(velo__2 + 0x8)($1)
/* 00799C 01DB369C 0802A0C7 */  lwc1        $f0, 0x208($29)
/* 0079A0 01DB36A0 00080046 */  add.s       $f0, $f1, $f0
/* 0079A4 01DB36A4 DC01013C */  lui         $1, %hi(velo__2 + 0x8)
/* 0079A8 01DB36A8 582520E4 */  swc1        $f0, %lo(velo__2 + 0x8)($1)
/* 0079AC 01DB36AC DC01013C */  lui         $1, %hi(BtActStatus + 0x110)
/* 0079B0 01DB36B0 904521C4 */  lwc1        $f1, %lo(BtActStatus + 0x110)($1)
/* 0079B4 01DB36B4 DC01013C */  lui         $1, %hi(BtActStatus + 0x114)
/* 0079B8 01DB36B8 944520C4 */  lwc1        $f0, %lo(BtActStatus + 0x114)($1)
/* 0079BC 01DB36BC 41080046 */  sub.s       $f1, $f1, $f0
/* 0079C0 01DB36C0 DC01013C */  lui         $1, %hi(BtActStatus + 0x110)
/* 0079C4 01DB36C4 904521E4 */  swc1        $f1, %lo(BtActStatus + 0x110)($1)
/* 0079C8 01DB36C8 00008044 */  mtc1        $0, $f0
/* 0079CC 01DB36CC 00000000 */  nop
/* 0079D0 01DB36D0 36080046 */  c.le.s      $f1, $f0
/* 0079D4 01DB36D4 00000000 */  nop
/* 0079D8 01DB36D8 03000045 */  bc1f        .L01DB36E8_2EECE8
/* 0079DC 01DB36DC 00000000 */   nop
/* 0079E0 01DB36E0 DC01013C */  lui         $1, %hi(BtActStatus + 0x110)
/* 0079E4 01DB36E4 904520AC */  sw          $0, %lo(BtActStatus + 0x110)($1)
.L01DB36E8_2EECE8:
/* 0079E8 01DB36E8 DC01013C */  lui         $1, %hi(BtActStatus + 0x92)
/* 0079EC 01DB36EC 124520A4 */  sh          $0, %lo(BtActStatus + 0x92)($1)
/* 0079F0 01DB36F0 D501013C */  lui         $1, %hi(DebugStatus + 0x14)
/* 0079F4 01DB36F4 7464228C */  lw          $2, %lo(DebugStatus + 0x14)($1)
/* 0079F8 01DB36F8 2B024010 */  beqz        $2, .L01DB3FA8_2EF5A8
/* 0079FC 01DB36FC 00000000 */   nop
/* 007A00 01DB3700 C89C828F */  lw          $2, -0x6338($28)
/* 007A04 01DB3704 0100013C */  lui         $1, (0x10000 >> 16)
/* 007A08 01DB3708 21084100 */  addu        $1, $2, $1
/* 007A0C 01DB370C ECBD238C */  lw          $3, -0x4214($1)
/* 007A10 01DB3710 01000224 */  addiu       $2, $0, 0x1
/* 007A14 01DB3714 F9006210 */  beq         $3, $2, .L01DB3AFC_2EF0FC
/* 007A18 01DB3718 00000000 */   nop
/* 007A1C 01DB371C 988B828F */  lw          $2, -0x7468($28)
/* 007A20 01DB3720 080040AC */  sw          $0, 0x8($2)
/* 007A24 01DB3724 988B848F */  lw          $4, -0x7468($28)
/* 007A28 01DB3728 D0070524 */  addiu       $5, $0, 0x7D0
/* 007A2C 01DB372C 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 007A30 01DB3730 00000000 */   nop
/* 007A34 01DB3734 28864070 */  paddub      $16, $2, $0
/* 007A38 01DB3738 A041023C */  lui         $2, (0x41A00000 >> 16)
/* 007A3C 01DB373C 00088244 */  mtc1        $2, $f1
/* 007A40 01DB3740 B000A2C7 */  lwc1        $f2, 0xB0($29)
/* 007A44 01DB3744 00080246 */  add.s       $f0, $f1, $f2
/* 007A48 01DB3748 0003A0E7 */  swc1        $f0, 0x300($29)
/* 007A4C 01DB374C B400B427 */  addiu       $20, $29, 0xB4
/* 007A50 01DB3750 000083C6 */  lwc1        $f3, 0x0($20)
/* 007A54 01DB3754 00080346 */  add.s       $f0, $f1, $f3
/* 007A58 01DB3758 0403A0E7 */  swc1        $f0, 0x304($29)
/* 007A5C 01DB375C B800A4C7 */  lwc1        $f4, 0xB8($29)
/* 007A60 01DB3760 00080446 */  add.s       $f0, $f1, $f4
/* 007A64 01DB3764 0803A0E7 */  swc1        $f0, 0x308($29)
/* 007A68 01DB3768 01100146 */  sub.s       $f0, $f2, $f1
/* 007A6C 01DB376C 1003A0E7 */  swc1        $f0, 0x310($29)
/* 007A70 01DB3770 2042023C */  lui         $2, (0x42200000 >> 16)
/* 007A74 01DB3774 00008244 */  mtc1        $2, $f0
/* 007A78 01DB3778 00000000 */  nop
/* 007A7C 01DB377C 01180046 */  sub.s       $f0, $f3, $f0
/* 007A80 01DB3780 1403A0E7 */  swc1        $f0, 0x314($29)
/* 007A84 01DB3784 01200146 */  sub.s       $f0, $f4, $f1
/* 007A88 01DB3788 1803A0E7 */  swc1        $f0, 0x318($29)
/* 007A8C 01DB378C 288E0070 */  paddub      $17, $0, $0
/* 007A90 01DB3790 989C80AF */  sw          $0, -0x6368($28)
/* 007A94 01DB3794 45000010 */  b           .L01DB38AC_2EEEAC
/* 007A98 01DB3798 00000000 */   nop
.L01DB379C_2EED9C:
/* 007A9C 01DB379C FFFF0224 */  addiu       $2, $0, -0x1
/* 007AA0 01DB37A0 04002216 */  bne         $17, $2, .L01DB37B4_2EEDB4
/* 007AA4 01DB37A4 00000000 */   nop
/* 007AA8 01DB37A8 289E0070 */  paddub      $19, $0, $0
/* 007AAC 01DB37AC 04000010 */  b           .L01DB37C0_2EEDC0
/* 007AB0 01DB37B0 00000000 */   nop
.L01DB37B4_2EEDB4:
/* 007AB4 01DB37B4 21104302 */  addu        $2, $18, $3
/* 007AB8 01DB37B8 9C04538C */  lw          $19, 0x49C($2)
/* 007ABC 01DB37BC 00000000 */  nop
.L01DB37C0_2EEDC0:
/* 007AC0 01DB37C0 39006012 */  beqz        $19, .L01DB38A8_2EEEA8
/* 007AC4 01DB37C4 00000000 */   nop
/* 007AC8 01DB37C8 21107200 */  addu        $2, $3, $18
/* 007ACC 01DB37CC 90044224 */  addiu       $2, $2, 0x490
/* 007AD0 01DB37D0 F002A427 */  addiu       $4, $29, 0x2F0
/* 007AD4 01DB37D4 10014524 */  addiu       $5, $2, 0x110
/* 007AD8 01DB37D8 0C86040C */  jal         sceVu0CopyVector
/* 007ADC 01DB37DC 00000000 */   nop
/* 007AE0 01DB37E0 C89C828F */  lw          $2, -0x6338($28)
/* 007AE4 01DB37E4 21105200 */  addu        $2, $2, $18
/* 007AE8 01DB37E8 90045224 */  addiu       $18, $2, 0x490
/* 007AEC 01DB37EC 00064CC4 */  lwc1        $f12, 0x600($2)
/* 007AF0 01DB37F0 2C44040C */  jal         fptosi
/* 007AF4 01DB37F4 00000000 */   nop
/* 007AF8 01DB37F8 10004386 */  lh          $3, 0x10($18)
/* 007AFC 01DB37FC 21104300 */  addu        $2, $2, $3
/* 007B00 01DB3800 04004128 */  slti        $1, $2, 0x4
/* 007B04 01DB3804 02002014 */  bnez        $1, .L01DB3810_2EEE10
/* 007B08 01DB3808 00000000 */   nop
/* 007B0C 01DB380C FDFF4224 */  addiu       $2, $2, -0x3
.L01DB3810_2EEE10:
/* 007B10 01DB3810 03000324 */  addiu       $3, $0, 0x3
/* 007B14 01DB3814 02004314 */  bne         $2, $3, .L01DB3820_2EEE20
/* 007B18 01DB3818 00000000 */   nop
/* 007B1C 01DB381C FFFF0224 */  addiu       $2, $0, -0x1
.L01DB3820_2EEE20:
/* 007B20 01DB3820 B4C2033C */  lui         $3, (0xC2B40000 >> 16)
/* 007B24 01DB3824 00088344 */  mtc1        $3, $f1
/* 007B28 01DB3828 00008244 */  mtc1        $2, $f0
/* 007B2C 01DB382C 00000000 */  nop
/* 007B30 01DB3830 20008046 */  cvt.s.w     $f0, $f0
/* 007B34 01DB3834 42080046 */  mul.s       $f1, $f1, $f0
/* 007B38 01DB3838 B08080C7 */  lwc1        $f0, -0x7F50($28)
/* 007B3C 01DB383C 42000146 */  mul.s       $f1, $f0, $f1
/* 007B40 01DB3840 3443023C */  lui         $2, (0x43340000 >> 16)
/* 007B44 01DB3844 00008244 */  mtc1        $2, $f0
/* 007B48 01DB3848 00000000 */  nop
/* 007B4C 01DB384C 430B0046 */  div.s       $f13, $f1, $f0
/* 007B50 01DB3850 00608044 */  mtc1        $0, $f12
/* 007B54 01DB3854 00000000 */  nop
/* 007B58 01DB3858 86630046 */  mov.s       $f14, $f12
/* 007B5C 01DB385C 28266072 */  paddub      $4, $19, $0
/* 007B60 01DB3860 70A3040C */  jal         SetRotation__6CFrameFfff
/* 007B64 01DB3864 00000000 */   nop
/* 007B68 01DB3868 28266072 */  paddub      $4, $19, $0
/* 007B6C 01DB386C F002A527 */  addiu       $5, $29, 0x2F0
/* 007B70 01DB3870 B89F040C */  jal         SetPosition__6CFrameFPf
/* 007B74 01DB3874 00000000 */   nop
/* 007B78 01DB3878 989C838F */  lw          $3, -0x6368($28)
/* 007B7C 01DB387C 80100300 */  sll         $2, $3, 2
/* 007B80 01DB3880 21104300 */  addu        $2, $2, $3
/* 007B84 01DB3884 00110200 */  sll         $2, $2, 4
/* 007B88 01DB3888 21280202 */  addu        $5, $16, $2
/* 007B8C 01DB388C 28266072 */  paddub      $4, $19, $0
/* 007B90 01DB3890 0003A627 */  addiu       $6, $29, 0x300
/* 007B94 01DB3894 E4A8040C */  jal         PickUpNearPoly__6CFrameFP6CCPolyRC7CBoxVu0
/* 007B98 01DB3898 00000000 */   nop
/* 007B9C 01DB389C 989C838F */  lw          $3, -0x6368($28)
/* 007BA0 01DB38A0 21106200 */  addu        $2, $3, $2
/* 007BA4 01DB38A4 989C82AF */  sw          $2, -0x6368($28)
.L01DB38A8_2EEEA8:
/* 007BA8 01DB38A8 01003126 */  addiu       $17, $17, 0x1
.L01DB38AC_2EEEAC:
/* 007BAC 01DB38AC C89C838F */  lw          $3, -0x6338($28)
/* 007BB0 01DB38B0 C0101100 */  sll         $2, $17, 3
/* 007BB4 01DB38B4 23105100 */  subu        $2, $2, $17
/* 007BB8 01DB38B8 80100200 */  sll         $2, $2, 2
/* 007BBC 01DB38BC 21105100 */  addu        $2, $2, $17
/* 007BC0 01DB38C0 00910200 */  sll         $18, $2, 4
/* 007BC4 01DB38C4 21104302 */  addu        $2, $18, $3
/* 007BC8 01DB38C8 4006428C */  lw          $2, 0x640($2)
/* 007BCC 01DB38CC B3FF4014 */  bnez        $2, .L01DB379C_2EED9C
/* 007BD0 01DB38D0 00000000 */   nop
/* 007BD4 01DB38D4 28960070 */  paddub      $18, $0, $0
/* 007BD8 01DB38D8 1E000010 */  b           .L01DB3954_2EEF54
/* 007BDC 01DB38DC 00000000 */   nop
.L01DB38E0_2EEEE0:
/* 007BE0 01DB38E0 C89C848F */  lw          $4, -0x6338($28)
/* 007BE4 01DB38E4 80111200 */  sll         $2, $18, 6
/* 007BE8 01DB38E8 21184400 */  addu        $3, $2, $4
/* 007BEC 01DB38EC 0100013C */  lui         $1, (0x10000 >> 16)
/* 007BF0 01DB38F0 21086100 */  addu        $1, $3, $1
/* 007BF4 01DB38F4 60B6228C */  lw          $2, -0x49A0($1)
/* 007BF8 01DB38F8 15004010 */  beqz        $2, .L01DB3950_2EEF50
/* 007BFC 01DB38FC 00000000 */   nop
/* 007C00 01DB3900 0100013C */  lui         $1, (0x10000 >> 16)
/* 007C04 01DB3904 21088100 */  addu        $1, $4, $1
/* 007C08 01DB3908 6CBC338C */  lw          $19, -0x4394($1)
/* 007C0C 01DB390C 28266072 */  paddub      $4, $19, $0
/* 007C10 01DB3910 78366524 */  addiu       $5, $3, 0x3678
/* 007C14 01DB3914 F87FA524 */  addiu       $5, $5, 0x7FF8
/* 007C18 01DB3918 B89F040C */  jal         SetPosition__6CFrameFPf
/* 007C1C 01DB391C 00000000 */   nop
/* 007C20 01DB3920 989C838F */  lw          $3, -0x6368($28)
/* 007C24 01DB3924 80100300 */  sll         $2, $3, 2
/* 007C28 01DB3928 21104300 */  addu        $2, $2, $3
/* 007C2C 01DB392C 00110200 */  sll         $2, $2, 4
/* 007C30 01DB3930 21280202 */  addu        $5, $16, $2
/* 007C34 01DB3934 28266072 */  paddub      $4, $19, $0
/* 007C38 01DB3938 0003A627 */  addiu       $6, $29, 0x300
/* 007C3C 01DB393C E4A8040C */  jal         PickUpNearPoly__6CFrameFP6CCPolyRC7CBoxVu0
/* 007C40 01DB3940 00000000 */   nop
/* 007C44 01DB3944 989C838F */  lw          $3, -0x6368($28)
/* 007C48 01DB3948 21106200 */  addu        $2, $3, $2
/* 007C4C 01DB394C 989C82AF */  sw          $2, -0x6368($28)
.L01DB3950_2EEF50:
/* 007C50 01DB3950 01005226 */  addiu       $18, $18, 0x1
.L01DB3954_2EEF54:
/* 007C54 01DB3954 1800422A */  slti        $2, $18, 0x18
/* 007C58 01DB3958 E1FF4014 */  bnez        $2, .L01DB38E0_2EEEE0
/* 007C5C 01DB395C 00000000 */   nop
/* 007C60 01DB3960 C89C848F */  lw          $4, -0x6338($28)
/* 007C64 01DB3964 282E0072 */  paddub      $5, $16, $0
/* 007C68 01DB3968 0003A627 */  addiu       $6, $29, 0x300
/* 007C6C 01DB396C 989C878F */  lw          $7, -0x6368($28)
/* 007C70 01DB3970 9C14070C */  jal         CreateCollision__11CDungeonMapFP6CCPoly7CBoxVu0i
/* 007C74 01DB3974 00000000 */   nop
/* 007C78 01DB3978 989C82AF */  sw          $2, -0x6368($28)
/* 007C7C 01DB397C CC9C848F */  lw          $4, -0x6334($28)
/* 007C80 01DB3980 282E0072 */  paddub      $5, $16, $0
/* 007C84 01DB3984 989C868F */  lw          $6, -0x6368($28)
/* 007C88 01DB3988 0003A727 */  addiu       $7, $29, 0x300
/* 007C8C 01DB398C 4435070C */  jal         AddCollision__13CDranMapFieldFP6CCPolyi7CBoxVu0
/* 007C90 01DB3990 00000000 */   nop
/* 007C94 01DB3994 989C82AF */  sw          $2, -0x6368($28)
/* 007C98 01DB3998 E09C848F */  lw          $4, -0x6320($28)
/* 007C9C 01DB399C B000A527 */  addiu       $5, $29, 0xB0
/* 007CA0 01DB39A0 DC01023C */  lui         $2, %hi(velo__2)
/* 007CA4 01DB39A4 50254624 */  addiu       $6, $2, %lo(velo__2)
/* 007CA8 01DB39A8 989D878F */  lw          $7, -0x6268($28)
/* 007CAC 01DB39AC 0872070C */  jal         MoveCheck__12CMonstorUnitFPfPfi
/* 007CB0 01DB39B0 00000000 */   nop
/* 007CB4 01DB39B4 01000A24 */  addiu       $10, $0, 0x1
/* 007CB8 01DB39B8 789C828F */  lw          $2, -0x6388($28)
/* 007CBC 01DB39BC 04004380 */  lb          $3, 0x4($2)
/* 007CC0 01DB39C0 05000224 */  addiu       $2, $0, 0x5
/* 007CC4 01DB39C4 02006214 */  bne         $3, $2, .L01DB39D0_2EEFD0
/* 007CC8 01DB39C8 00000000 */   nop
/* 007CCC 01DB39CC 08000A24 */  addiu       $10, $0, 0x8
.L01DB39D0_2EEFD0:
/* 007CD0 01DB39D0 B000A427 */  addiu       $4, $29, 0xB0
/* 007CD4 01DB39D4 DC01023C */  lui         $2, %hi(velo__2)
/* 007CD8 01DB39D8 50254524 */  addiu       $5, $2, %lo(velo__2)
/* 007CDC 01DB39DC 1002A627 */  addiu       $6, $29, 0x210
/* 007CE0 01DB39E0 2002A727 */  addiu       $7, $29, 0x220
/* 007CE4 01DB39E4 28460072 */  paddub      $8, $16, $0
/* 007CE8 01DB39E8 989C898F */  lw          $9, -0x6368($28)
/* 007CEC 01DB39EC A029050C */  jal         MoveCheck__FPfPfPfP13MoveCheckInfoP6CCPolyii
/* 007CF0 01DB39F0 00000000 */   nop
/* 007CF4 01DB39F4 989C858F */  lw          $5, -0x6368($28)
/* 007CF8 01DB39F8 9001A228 */  slti        $2, $5, 0x190
/* 007CFC 01DB39FC 05004014 */  bnez        $2, .L01DB3A14_2EF014
/* 007D00 01DB3A00 00000000 */   nop
/* 007D04 01DB3A04 DC01023C */  lui         $2, %hi(LIT_4400)
/* 007D08 01DB3A08 302F4424 */  addiu       $4, $2, %lo(LIT_4400)
/* 007D0C 01DB3A0C A611040C */  jal         printf
/* 007D10 01DB3A10 00000000 */   nop
.L01DB3A14_2EF014:
/* 007D14 01DB3A14 F001023C */  lui         $2, %hi(ref_off)
/* 007D18 01DB3A18 A0684424 */  addiu       $4, $2, %lo(ref_off)
/* 007D1C 01DB3A1C 1002A527 */  addiu       $5, $29, 0x210
/* 007D20 01DB3A20 B000A627 */  addiu       $6, $29, 0xB0
/* 007D24 01DB3A24 EE85040C */  jal         sceVu0SubVector
/* 007D28 01DB3A28 00000000 */   nop
/* 007D2C 01DB3A2C DC01013C */  lui         $1, %hi(velo__2 + 0x4)
/* 007D30 01DB3A30 542521C4 */  lwc1        $f1, %lo(velo__2 + 0x4)($1)
/* 007D34 01DB3A34 F001013C */  lui         $1, %hi(veloOld + 0x4)
/* 007D38 01DB3A38 440121E4 */  swc1        $f1, %lo(veloOld + 0x4)($1)
/* 007D3C 01DB3A3C 808080C7 */  lwc1        $f0, -0x7F80($28)
/* 007D40 01DB3A40 41080046 */  sub.s       $f1, $f1, $f0
/* 007D44 01DB3A44 DC01013C */  lui         $1, %hi(velo__2 + 0x4)
/* 007D48 01DB3A48 542521E4 */  swc1        $f1, %lo(velo__2 + 0x4)($1)
/* 007D4C 01DB3A4C 20C1023C */  lui         $2, (0xC1200000 >> 16)
/* 007D50 01DB3A50 00008244 */  mtc1        $2, $f0
/* 007D54 01DB3A54 00000000 */  nop
/* 007D58 01DB3A58 34080046 */  c.lt.s      $f1, $f0
/* 007D5C 01DB3A5C 00000000 */  nop
/* 007D60 01DB3A60 03000045 */  bc1f        .L01DB3A70_2EF070
/* 007D64 01DB3A64 00000000 */   nop
/* 007D68 01DB3A68 DC01013C */  lui         $1, %hi(velo__2 + 0x4)
/* 007D6C 01DB3A6C 542522AC */  sw          $2, %lo(velo__2 + 0x4)($1)
.L01DB3A70_2EF070:
/* 007D70 01DB3A70 B000A427 */  addiu       $4, $29, 0xB0
/* 007D74 01DB3A74 1002A527 */  addiu       $5, $29, 0x210
/* 007D78 01DB3A78 0C86040C */  jal         sceVu0CopyVector
/* 007D7C 01DB3A7C 00000000 */   nop
/* 007D80 01DB3A80 2002A28F */  lw          $2, 0x220($29)
/* 007D84 01DB3A84 13004010 */  beqz        $2, .L01DB3AD4_2EF0D4
/* 007D88 01DB3A88 00000000 */   nop
/* 007D8C 01DB3A8C DC01013C */  lui         $1, %hi(velo__2 + 0x4)
/* 007D90 01DB3A90 542520AC */  sw          $0, %lo(velo__2 + 0x4)($1)
/* 007D94 01DB3A94 9002A527 */  addiu       $5, $29, 0x290
/* 007D98 01DB3A98 2003A427 */  addiu       $4, $29, 0x320
/* 007D9C 01DB3A9C 05000324 */  addiu       $3, $0, 0x5
.L01DB3AA0_2EF0A0:
/* 007DA0 01DB3AA0 0000A278 */  lq          $2, 0x0($5)
/* 007DA4 01DB3AA4 1000A524 */  addiu       $5, $5, 0x10
/* 007DA8 01DB3AA8 FFFF6324 */  addiu       $3, $3, -0x1
/* 007DAC 01DB3AAC 0000827C */  sq          $2, 0x0($4)
/* 007DB0 01DB3AB0 10008424 */  addiu       $4, $4, 0x10
/* 007DB4 01DB3AB4 FAFF601C */  bgtz        $3, .L01DB3AA0_2EF0A0
/* 007DB8 01DB3AB8 00000000 */   nop
/* 007DBC 01DB3ABC 6203A287 */  lh          $2, 0x362($29)
/* 007DC0 01DB3AC0 DC01013C */  lui         $1, %hi(BtActStatus + 0x90)
/* 007DC4 01DB3AC4 104522A4 */  sh          $2, %lo(BtActStatus + 0x90)($1)
/* 007DC8 01DB3AC8 6003A287 */  lh          $2, 0x360($29)
/* 007DCC 01DB3ACC DC01013C */  lui         $1, %hi(BtActStatus + 0x92)
/* 007DD0 01DB3AD0 124522A4 */  sh          $2, %lo(BtActStatus + 0x92)($1)
.L01DB3AD4_2EF0D4:
/* 007DD4 01DB3AD4 8002A28F */  lw          $2, 0x280($29)
/* 007DD8 01DB3AD8 42014010 */  beqz        $2, .L01DB3FE4_2EF5E4
/* 007DDC 01DB3ADC 00000000 */   nop
/* 007DE0 01DB3AE0 000081C6 */  lwc1        $f1, 0x0($20)
/* 007DE4 01DB3AE4 E402A0C7 */  lwc1        $f0, 0x2E4($29)
/* 007DE8 01DB3AE8 01080046 */  sub.s       $f0, $f1, $f0
/* 007DEC 01DB3AEC DC01013C */  lui         $1, %hi(BtActStatus + 0x44)
/* 007DF0 01DB3AF0 C44420E4 */  swc1        $f0, %lo(BtActStatus + 0x44)($1)
/* 007DF4 01DB3AF4 3B010010 */  b           .L01DB3FE4_2EF5E4
/* 007DF8 01DB3AF8 00000000 */   nop
.L01DB3AFC_2EF0FC:
/* 007DFC 01DB3AFC 988B828F */  lw          $2, -0x7468($28)
/* 007E00 01DB3B00 080040AC */  sw          $0, 0x8($2)
/* 007E04 01DB3B04 988B848F */  lw          $4, -0x7468($28)
/* 007E08 01DB3B08 D0070524 */  addiu       $5, $0, 0x7D0
/* 007E0C 01DB3B0C 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 007E10 01DB3B10 00000000 */   nop
/* 007E14 01DB3B14 28A64070 */  paddub      $20, $2, $0
/* 007E18 01DB3B18 A041023C */  lui         $2, (0x41A00000 >> 16)
/* 007E1C 01DB3B1C 00088244 */  mtc1        $2, $f1
/* 007E20 01DB3B20 B000A2C7 */  lwc1        $f2, 0xB0($29)
/* 007E24 01DB3B24 00080246 */  add.s       $f0, $f1, $f2
/* 007E28 01DB3B28 5004A0E7 */  swc1        $f0, 0x450($29)
/* 007E2C 01DB3B2C B400B127 */  addiu       $17, $29, 0xB4
/* 007E30 01DB3B30 000023C6 */  lwc1        $f3, 0x0($17)
/* 007E34 01DB3B34 00080346 */  add.s       $f0, $f1, $f3
/* 007E38 01DB3B38 5404A0E7 */  swc1        $f0, 0x454($29)
/* 007E3C 01DB3B3C B800A4C7 */  lwc1        $f4, 0xB8($29)
/* 007E40 01DB3B40 00080446 */  add.s       $f0, $f1, $f4
/* 007E44 01DB3B44 5804A0E7 */  swc1        $f0, 0x458($29)
/* 007E48 01DB3B48 01100146 */  sub.s       $f0, $f2, $f1
/* 007E4C 01DB3B4C 6004A0E7 */  swc1        $f0, 0x460($29)
/* 007E50 01DB3B50 2042023C */  lui         $2, (0x42200000 >> 16)
/* 007E54 01DB3B54 00008244 */  mtc1        $2, $f0
/* 007E58 01DB3B58 00000000 */  nop
/* 007E5C 01DB3B5C 01180046 */  sub.s       $f0, $f3, $f0
/* 007E60 01DB3B60 6404A0E7 */  swc1        $f0, 0x464($29)
/* 007E64 01DB3B64 01200146 */  sub.s       $f0, $f4, $f1
/* 007E68 01DB3B68 6804A0E7 */  swc1        $f0, 0x468($29)
/* 007E6C 01DB3B6C 989C80AF */  sw          $0, -0x6368($28)
/* 007E70 01DB3B70 289E0070 */  paddub      $19, $0, $0
/* 007E74 01DB3B74 86000010 */  b           .L01DB3D90_2EF390
/* 007E78 01DB3B78 00000000 */   nop
.L01DB3B7C_2EF17C:
/* 007E7C 01DB3B7C 28960070 */  paddub      $18, $0, $0
/* 007E80 01DB3B80 7F000010 */  b           .L01DB3D80_2EF380
/* 007E84 01DB3B84 00000000 */   nop
.L01DB3B88_2EF188:
/* 007E88 01DB3B88 C89C848F */  lw          $4, -0x6338($28)
/* 007E8C 01DB3B8C 80101300 */  sll         $2, $19, 2
/* 007E90 01DB3B90 21105300 */  addu        $2, $2, $19
/* 007E94 01DB3B94 80100200 */  sll         $2, $2, 2
/* 007E98 01DB3B98 21104202 */  addu        $2, $18, $2
/* 007E9C 01DB3B9C 00310200 */  sll         $6, $2, 4
/* 007EA0 01DB3BA0 2110C400 */  addu        $2, $6, $4
/* 007EA4 01DB3BA4 0100013C */  lui         $1, (0x10000 >> 16)
/* 007EA8 01DB3BA8 21084100 */  addu        $1, $2, $1
/* 007EAC 01DB3BAC 509C228C */  lw          $2, -0x63B0($1)
/* 007EB0 01DB3BB0 FFFF0324 */  addiu       $3, $0, -0x1
/* 007EB4 01DB3BB4 04004314 */  bne         $2, $3, .L01DB3BC8_2EF1C8
/* 007EB8 01DB3BB8 00000000 */   nop
/* 007EBC 01DB3BBC 28860070 */  paddub      $16, $0, $0
/* 007EC0 01DB3BC0 09000010 */  b           .L01DB3BE8_2EF1E8
/* 007EC4 01DB3BC4 00000000 */   nop
.L01DB3BC8_2EF1C8:
/* 007EC8 01DB3BC8 C0180200 */  sll         $3, $2, 3
/* 007ECC 01DB3BCC 23186200 */  subu        $3, $3, $2
/* 007ED0 01DB3BD0 80180300 */  sll         $3, $3, 2
/* 007ED4 01DB3BD4 21186200 */  addu        $3, $3, $2
/* 007ED8 01DB3BD8 00190300 */  sll         $3, $3, 4
/* 007EDC 01DB3BDC 21186400 */  addu        $3, $3, $4
/* 007EE0 01DB3BE0 9C04708C */  lw          $16, 0x49C($3)
/* 007EE4 01DB3BE4 00000000 */  nop
.L01DB3BE8_2EF1E8:
/* 007EE8 01DB3BE8 21188600 */  addu        $3, $4, $6
/* 007EEC 01DB3BEC 581C6524 */  addiu       $5, $3, 0x1C58
/* 007EF0 01DB3BF0 F87FA524 */  addiu       $5, $5, 0x7FF8
/* 007EF4 01DB3BF4 A49D848F */  lw          $4, -0x625C($28)
/* 007EF8 01DB3BF8 05000324 */  addiu       $3, $0, 0x5
/* 007EFC 01DB3BFC 0D008314 */  bne         $4, $3, .L01DB3C34_2EF234
/* 007F00 01DB3C00 00000000 */   nop
/* 007F04 01DB3C04 28004328 */  slti        $3, $2, 0x28
/* 007F08 01DB3C08 0A006014 */  bnez        $3, .L01DB3C34_2EF234
/* 007F0C 01DB3C0C 00000000 */   nop
/* 007F10 01DB3C10 2C004128 */  slti        $1, $2, 0x2C
/* 007F14 01DB3C14 07002010 */  beqz        $1, .L01DB3C34_2EF234
/* 007F18 01DB3C18 00000000 */   nop
/* 007F1C 01DB3C1C 0800A1C4 */  lwc1        $f1, 0x8($5)
/* 007F20 01DB3C20 2043033C */  lui         $3, (0x43200000 >> 16)
/* 007F24 01DB3C24 00008344 */  mtc1        $3, $f0
/* 007F28 01DB3C28 00000000 */  nop
/* 007F2C 01DB3C2C 01080046 */  sub.s       $f0, $f1, $f0
/* 007F30 01DB3C30 0800A0E4 */  swc1        $f0, 0x8($5)
.L01DB3C34_2EF234:
/* 007F34 01DB3C34 51000012 */  beqz        $16, .L01DB3D7C_2EF37C
/* 007F38 01DB3C38 00000000 */   nop
/* 007F3C 01DB3C3C 0800A1C4 */  lwc1        $f1, 0x8($5)
/* 007F40 01DB3C40 7043033C */  lui         $3, (0x43700000 >> 16)
/* 007F44 01DB3C44 00008344 */  mtc1        $3, $f0
/* 007F48 01DB3C48 00000000 */  nop
/* 007F4C 01DB3C4C 36080046 */  c.le.s      $f1, $f0
/* 007F50 01DB3C50 00000000 */  nop
/* 007F54 01DB3C54 49000045 */  bc1f        .L01DB3D7C_2EF37C
/* 007F58 01DB3C58 00000000 */   nop
/* 007F5C 01DB3C5C C89C858F */  lw          $5, -0x6338($28)
/* 007F60 01DB3C60 2118C500 */  addu        $3, $6, $5
/* 007F64 01DB3C64 0100013C */  lui         $1, (0x10000 >> 16)
/* 007F68 01DB3C68 21086100 */  addu        $1, $3, $1
/* 007F6C 01DB3C6C 549C248C */  lw          $4, -0x63AC($1)
/* 007F70 01DB3C70 FFFF0324 */  addiu       $3, $0, -0x1
/* 007F74 01DB3C74 04004314 */  bne         $2, $3, .L01DB3C88_2EF288
/* 007F78 01DB3C78 00000000 */   nop
/* 007F7C 01DB3C7C 28160070 */  paddub      $2, $0, $0
/* 007F80 01DB3C80 09000010 */  b           .L01DB3CA8_2EF2A8
/* 007F84 01DB3C84 00000000 */   nop
.L01DB3C88_2EF288:
/* 007F88 01DB3C88 C0180200 */  sll         $3, $2, 3
/* 007F8C 01DB3C8C 23186200 */  subu        $3, $3, $2
/* 007F90 01DB3C90 80180300 */  sll         $3, $3, 2
/* 007F94 01DB3C94 21106200 */  addu        $2, $3, $2
/* 007F98 01DB3C98 00110200 */  sll         $2, $2, 4
/* 007F9C 01DB3C9C 21104500 */  addu        $2, $2, $5
/* 007FA0 01DB3CA0 A0044284 */  lh          $2, 0x4A0($2)
/* 007FA4 01DB3CA4 00000000 */  nop
.L01DB3CA8_2EF2A8:
/* 007FA8 01DB3CA8 21208200 */  addu        $4, $4, $2
/* 007FAC 01DB3CAC 04008128 */  slti        $1, $4, 0x4
/* 007FB0 01DB3CB0 02002014 */  bnez        $1, .L01DB3CBC_2EF2BC
/* 007FB4 01DB3CB4 00000000 */   nop
/* 007FB8 01DB3CB8 FDFF8424 */  addiu       $4, $4, -0x3
.L01DB3CBC_2EF2BC:
/* 007FBC 01DB3CBC 03000224 */  addiu       $2, $0, 0x3
/* 007FC0 01DB3CC0 02008214 */  bne         $4, $2, .L01DB3CCC_2EF2CC
/* 007FC4 01DB3CC4 00000000 */   nop
/* 007FC8 01DB3CC8 FFFF0424 */  addiu       $4, $0, -0x1
.L01DB3CCC_2EF2CC:
/* 007FCC 01DB3CCC B4C2023C */  lui         $2, (0xC2B40000 >> 16)
/* 007FD0 01DB3CD0 00088244 */  mtc1        $2, $f1
/* 007FD4 01DB3CD4 00008444 */  mtc1        $4, $f0
/* 007FD8 01DB3CD8 00000000 */  nop
/* 007FDC 01DB3CDC 20008046 */  cvt.s.w     $f0, $f0
/* 007FE0 01DB3CE0 42080046 */  mul.s       $f1, $f1, $f0
/* 007FE4 01DB3CE4 B08080C7 */  lwc1        $f0, -0x7F50($28)
/* 007FE8 01DB3CE8 42000146 */  mul.s       $f1, $f0, $f1
/* 007FEC 01DB3CEC 3443023C */  lui         $2, (0x43340000 >> 16)
/* 007FF0 01DB3CF0 00008244 */  mtc1        $2, $f0
/* 007FF4 01DB3CF4 00000000 */  nop
/* 007FF8 01DB3CF8 430B0046 */  div.s       $f13, $f1, $f0
/* 007FFC 01DB3CFC 00608044 */  mtc1        $0, $f12
/* 008000 01DB3D00 00000000 */  nop
/* 008004 01DB3D04 86630046 */  mov.s       $f14, $f12
/* 008008 01DB3D08 28260072 */  paddub      $4, $16, $0
/* 00800C 01DB3D0C 70A3040C */  jal         SetRotation__6CFrameFfff
/* 008010 01DB3D10 00000000 */   nop
/* 008014 01DB3D14 2043023C */  lui         $2, (0x43200000 >> 16)
/* 008018 01DB3D18 00088244 */  mtc1        $2, $f1
/* 00801C 01DB3D1C 00009244 */  mtc1        $18, $f0
/* 008020 01DB3D20 00000000 */  nop
/* 008024 01DB3D24 20008046 */  cvt.s.w     $f0, $f0
/* 008028 01DB3D28 020B0046 */  mul.s       $f12, $f1, $f0
/* 00802C 01DB3D2C 00688044 */  mtc1        $0, $f13
/* 008030 01DB3D30 00009344 */  mtc1        $19, $f0
/* 008034 01DB3D34 00000000 */  nop
/* 008038 01DB3D38 20008046 */  cvt.s.w     $f0, $f0
/* 00803C 01DB3D3C 820B0046 */  mul.s       $f14, $f1, $f0
/* 008040 01DB3D40 28260072 */  paddub      $4, $16, $0
/* 008044 01DB3D44 A09F040C */  jal         SetPosition__6CFrameFfff
/* 008048 01DB3D48 00000000 */   nop
/* 00804C 01DB3D4C 989C838F */  lw          $3, -0x6368($28)
/* 008050 01DB3D50 80100300 */  sll         $2, $3, 2
/* 008054 01DB3D54 21104300 */  addu        $2, $2, $3
/* 008058 01DB3D58 00110200 */  sll         $2, $2, 4
/* 00805C 01DB3D5C 21288202 */  addu        $5, $20, $2
/* 008060 01DB3D60 28260072 */  paddub      $4, $16, $0
/* 008064 01DB3D64 5004A627 */  addiu       $6, $29, 0x450
/* 008068 01DB3D68 E4A8040C */  jal         PickUpNearPoly__6CFrameFP6CCPolyRC7CBoxVu0
/* 00806C 01DB3D6C 00000000 */   nop
/* 008070 01DB3D70 989C838F */  lw          $3, -0x6368($28)
/* 008074 01DB3D74 21106200 */  addu        $2, $3, $2
/* 008078 01DB3D78 989C82AF */  sw          $2, -0x6368($28)
.L01DB3D7C_2EF37C:
/* 00807C 01DB3D7C 01005226 */  addiu       $18, $18, 0x1
.L01DB3D80_2EF380:
/* 008080 01DB3D80 1400422A */  slti        $2, $18, 0x14
/* 008084 01DB3D84 80FF4014 */  bnez        $2, .L01DB3B88_2EF188
/* 008088 01DB3D88 00000000 */   nop
/* 00808C 01DB3D8C 01007326 */  addiu       $19, $19, 0x1
.L01DB3D90_2EF390:
/* 008090 01DB3D90 1400622A */  slti        $2, $19, 0x14
/* 008094 01DB3D94 79FF4014 */  bnez        $2, .L01DB3B7C_2EF17C
/* 008098 01DB3D98 00000000 */   nop
/* 00809C 01DB3D9C 28960070 */  paddub      $18, $0, $0
/* 0080A0 01DB3DA0 1E000010 */  b           .L01DB3E1C_2EF41C
/* 0080A4 01DB3DA4 00000000 */   nop
.L01DB3DA8_2EF3A8:
/* 0080A8 01DB3DA8 C89C848F */  lw          $4, -0x6338($28)
/* 0080AC 01DB3DAC 80111200 */  sll         $2, $18, 6
/* 0080B0 01DB3DB0 21184400 */  addu        $3, $2, $4
/* 0080B4 01DB3DB4 0100013C */  lui         $1, (0x10000 >> 16)
/* 0080B8 01DB3DB8 21086100 */  addu        $1, $3, $1
/* 0080BC 01DB3DBC 60B6228C */  lw          $2, -0x49A0($1)
/* 0080C0 01DB3DC0 15004010 */  beqz        $2, .L01DB3E18_2EF418
/* 0080C4 01DB3DC4 00000000 */   nop
/* 0080C8 01DB3DC8 0100013C */  lui         $1, (0x10000 >> 16)
/* 0080CC 01DB3DCC 21088100 */  addu        $1, $4, $1
/* 0080D0 01DB3DD0 6CBC308C */  lw          $16, -0x4394($1)
/* 0080D4 01DB3DD4 28260072 */  paddub      $4, $16, $0
/* 0080D8 01DB3DD8 78366524 */  addiu       $5, $3, 0x3678
/* 0080DC 01DB3DDC F87FA524 */  addiu       $5, $5, 0x7FF8
/* 0080E0 01DB3DE0 B89F040C */  jal         SetPosition__6CFrameFPf
/* 0080E4 01DB3DE4 00000000 */   nop
/* 0080E8 01DB3DE8 989C838F */  lw          $3, -0x6368($28)
/* 0080EC 01DB3DEC 80100300 */  sll         $2, $3, 2
/* 0080F0 01DB3DF0 21104300 */  addu        $2, $2, $3
/* 0080F4 01DB3DF4 00110200 */  sll         $2, $2, 4
/* 0080F8 01DB3DF8 21288202 */  addu        $5, $20, $2
/* 0080FC 01DB3DFC 28260072 */  paddub      $4, $16, $0
/* 008100 01DB3E00 5004A627 */  addiu       $6, $29, 0x450
/* 008104 01DB3E04 E4A8040C */  jal         PickUpNearPoly__6CFrameFP6CCPolyRC7CBoxVu0
/* 008108 01DB3E08 00000000 */   nop
/* 00810C 01DB3E0C 989C838F */  lw          $3, -0x6368($28)
/* 008110 01DB3E10 21106200 */  addu        $2, $3, $2
/* 008114 01DB3E14 989C82AF */  sw          $2, -0x6368($28)
.L01DB3E18_2EF418:
/* 008118 01DB3E18 01005226 */  addiu       $18, $18, 0x1
.L01DB3E1C_2EF41C:
/* 00811C 01DB3E1C 1800422A */  slti        $2, $18, 0x18
/* 008120 01DB3E20 E1FF4014 */  bnez        $2, .L01DB3DA8_2EF3A8
/* 008124 01DB3E24 00000000 */   nop
/* 008128 01DB3E28 C89C848F */  lw          $4, -0x6338($28)
/* 00812C 01DB3E2C 282E8072 */  paddub      $5, $20, $0
/* 008130 01DB3E30 5004A627 */  addiu       $6, $29, 0x450
/* 008134 01DB3E34 989C878F */  lw          $7, -0x6368($28)
/* 008138 01DB3E38 9C14070C */  jal         CreateCollision__11CDungeonMapFP6CCPoly7CBoxVu0i
/* 00813C 01DB3E3C 00000000 */   nop
/* 008140 01DB3E40 989C82AF */  sw          $2, -0x6368($28)
/* 008144 01DB3E44 E09C848F */  lw          $4, -0x6320($28)
/* 008148 01DB3E48 B000A527 */  addiu       $5, $29, 0xB0
/* 00814C 01DB3E4C DC01023C */  lui         $2, %hi(velo__2)
/* 008150 01DB3E50 50254624 */  addiu       $6, $2, %lo(velo__2)
/* 008154 01DB3E54 989D878F */  lw          $7, -0x6268($28)
/* 008158 01DB3E58 0872070C */  jal         MoveCheck__12CMonstorUnitFPfPfi
/* 00815C 01DB3E5C 00000000 */   nop
/* 008160 01DB3E60 01000A24 */  addiu       $10, $0, 0x1
/* 008164 01DB3E64 789C828F */  lw          $2, -0x6388($28)
/* 008168 01DB3E68 04004380 */  lb          $3, 0x4($2)
/* 00816C 01DB3E6C 05000224 */  addiu       $2, $0, 0x5
/* 008170 01DB3E70 02006214 */  bne         $3, $2, .L01DB3E7C_2EF47C
/* 008174 01DB3E74 00000000 */   nop
/* 008178 01DB3E78 08000A24 */  addiu       $10, $0, 0x8
.L01DB3E7C_2EF47C:
/* 00817C 01DB3E7C B000A427 */  addiu       $4, $29, 0xB0
/* 008180 01DB3E80 DC01023C */  lui         $2, %hi(velo__2)
/* 008184 01DB3E84 50254524 */  addiu       $5, $2, %lo(velo__2)
/* 008188 01DB3E88 7003A627 */  addiu       $6, $29, 0x370
/* 00818C 01DB3E8C 8003A727 */  addiu       $7, $29, 0x380
/* 008190 01DB3E90 28468072 */  paddub      $8, $20, $0
/* 008194 01DB3E94 989C898F */  lw          $9, -0x6368($28)
/* 008198 01DB3E98 A029050C */  jal         MoveCheck__FPfPfPfP13MoveCheckInfoP6CCPolyii
/* 00819C 01DB3E9C 00000000 */   nop
/* 0081A0 01DB3EA0 989C858F */  lw          $5, -0x6368($28)
/* 0081A4 01DB3EA4 9001A228 */  slti        $2, $5, 0x190
/* 0081A8 01DB3EA8 05004014 */  bnez        $2, .L01DB3EC0_2EF4C0
/* 0081AC 01DB3EAC 00000000 */   nop
/* 0081B0 01DB3EB0 DC01023C */  lui         $2, %hi(LIT_4400)
/* 0081B4 01DB3EB4 302F4424 */  addiu       $4, $2, %lo(LIT_4400)
/* 0081B8 01DB3EB8 A611040C */  jal         printf
/* 0081BC 01DB3EBC 00000000 */   nop
.L01DB3EC0_2EF4C0:
/* 0081C0 01DB3EC0 F001023C */  lui         $2, %hi(ref_off)
/* 0081C4 01DB3EC4 A0684424 */  addiu       $4, $2, %lo(ref_off)
/* 0081C8 01DB3EC8 7003A527 */  addiu       $5, $29, 0x370
/* 0081CC 01DB3ECC B000A627 */  addiu       $6, $29, 0xB0
/* 0081D0 01DB3ED0 EE85040C */  jal         sceVu0SubVector
/* 0081D4 01DB3ED4 00000000 */   nop
/* 0081D8 01DB3ED8 DC01013C */  lui         $1, %hi(velo__2 + 0x4)
/* 0081DC 01DB3EDC 542521C4 */  lwc1        $f1, %lo(velo__2 + 0x4)($1)
/* 0081E0 01DB3EE0 F001013C */  lui         $1, %hi(veloOld + 0x4)
/* 0081E4 01DB3EE4 440121E4 */  swc1        $f1, %lo(veloOld + 0x4)($1)
/* 0081E8 01DB3EE8 808080C7 */  lwc1        $f0, -0x7F80($28)
/* 0081EC 01DB3EEC 41080046 */  sub.s       $f1, $f1, $f0
/* 0081F0 01DB3EF0 DC01013C */  lui         $1, %hi(velo__2 + 0x4)
/* 0081F4 01DB3EF4 542521E4 */  swc1        $f1, %lo(velo__2 + 0x4)($1)
/* 0081F8 01DB3EF8 20C1023C */  lui         $2, (0xC1200000 >> 16)
/* 0081FC 01DB3EFC 00008244 */  mtc1        $2, $f0
/* 008200 01DB3F00 00000000 */  nop
/* 008204 01DB3F04 34080046 */  c.lt.s      $f1, $f0
/* 008208 01DB3F08 00000000 */  nop
/* 00820C 01DB3F0C 03000045 */  bc1f        .L01DB3F1C_2EF51C
/* 008210 01DB3F10 00000000 */   nop
/* 008214 01DB3F14 DC01013C */  lui         $1, %hi(velo__2 + 0x4)
/* 008218 01DB3F18 542522AC */  sw          $2, %lo(velo__2 + 0x4)($1)
.L01DB3F1C_2EF51C:
/* 00821C 01DB3F1C B000A427 */  addiu       $4, $29, 0xB0
/* 008220 01DB3F20 7003A527 */  addiu       $5, $29, 0x370
/* 008224 01DB3F24 0C86040C */  jal         sceVu0CopyVector
/* 008228 01DB3F28 00000000 */   nop
/* 00822C 01DB3F2C 8003A28F */  lw          $2, 0x380($29)
/* 008230 01DB3F30 13004010 */  beqz        $2, .L01DB3F80_2EF580
/* 008234 01DB3F34 00000000 */   nop
/* 008238 01DB3F38 DC01013C */  lui         $1, %hi(velo__2 + 0x4)
/* 00823C 01DB3F3C 542520AC */  sw          $0, %lo(velo__2 + 0x4)($1)
/* 008240 01DB3F40 F003A527 */  addiu       $5, $29, 0x3F0
/* 008244 01DB3F44 7004A427 */  addiu       $4, $29, 0x470
/* 008248 01DB3F48 05000324 */  addiu       $3, $0, 0x5
.L01DB3F4C_2EF54C:
/* 00824C 01DB3F4C 0000A278 */  lq          $2, 0x0($5)
/* 008250 01DB3F50 1000A524 */  addiu       $5, $5, 0x10
/* 008254 01DB3F54 FFFF6324 */  addiu       $3, $3, -0x1
/* 008258 01DB3F58 0000827C */  sq          $2, 0x0($4)
/* 00825C 01DB3F5C 10008424 */  addiu       $4, $4, 0x10
/* 008260 01DB3F60 FAFF601C */  bgtz        $3, .L01DB3F4C_2EF54C
/* 008264 01DB3F64 00000000 */   nop
/* 008268 01DB3F68 B204A287 */  lh          $2, 0x4B2($29)
/* 00826C 01DB3F6C DC01013C */  lui         $1, %hi(BtActStatus + 0x90)
/* 008270 01DB3F70 104522A4 */  sh          $2, %lo(BtActStatus + 0x90)($1)
/* 008274 01DB3F74 B004A287 */  lh          $2, 0x4B0($29)
/* 008278 01DB3F78 DC01013C */  lui         $1, %hi(BtActStatus + 0x92)
/* 00827C 01DB3F7C 124522A4 */  sh          $2, %lo(BtActStatus + 0x92)($1)
.L01DB3F80_2EF580:
/* 008280 01DB3F80 E003A28F */  lw          $2, 0x3E0($29)
/* 008284 01DB3F84 17004010 */  beqz        $2, .L01DB3FE4_2EF5E4
/* 008288 01DB3F88 00000000 */   nop
/* 00828C 01DB3F8C 000021C6 */  lwc1        $f1, 0x0($17)
/* 008290 01DB3F90 4404A0C7 */  lwc1        $f0, 0x444($29)
/* 008294 01DB3F94 01080046 */  sub.s       $f0, $f1, $f0
/* 008298 01DB3F98 DC01013C */  lui         $1, %hi(BtActStatus + 0x44)
/* 00829C 01DB3F9C C44420E4 */  swc1        $f0, %lo(BtActStatus + 0x44)($1)
/* 0082A0 01DB3FA0 10000010 */  b           .L01DB3FE4_2EF5E4
/* 0082A4 01DB3FA4 00000000 */   nop
.L01DB3FA8_2EF5A8:
/* 0082A8 01DB3FA8 B000A1C7 */  lwc1        $f1, 0xB0($29)
/* 0082AC 01DB3FAC DC01013C */  lui         $1, %hi(velo__2)
/* 0082B0 01DB3FB0 502520C4 */  lwc1        $f0, %lo(velo__2)($1)
/* 0082B4 01DB3FB4 00080046 */  add.s       $f0, $f1, $f0
/* 0082B8 01DB3FB8 B000A0E7 */  swc1        $f0, 0xB0($29)
/* 0082BC 01DB3FBC B400A1C7 */  lwc1        $f1, 0xB4($29)
/* 0082C0 01DB3FC0 DC01013C */  lui         $1, %hi(velo__2 + 0x4)
/* 0082C4 01DB3FC4 542520C4 */  lwc1        $f0, %lo(velo__2 + 0x4)($1)
/* 0082C8 01DB3FC8 00080046 */  add.s       $f0, $f1, $f0
/* 0082CC 01DB3FCC B400A0E7 */  swc1        $f0, 0xB4($29)
/* 0082D0 01DB3FD0 B800A1C7 */  lwc1        $f1, 0xB8($29)
/* 0082D4 01DB3FD4 DC01013C */  lui         $1, %hi(velo__2 + 0x8)
/* 0082D8 01DB3FD8 582520C4 */  lwc1        $f0, %lo(velo__2 + 0x8)($1)
/* 0082DC 01DB3FDC 00080046 */  add.s       $f0, $f1, $f0
/* 0082E0 01DB3FE0 B800A0E7 */  swc1        $f0, 0xB8($29)
.L01DB3FE4_2EF5E4:
/* 0082E4 01DB3FE4 789C828F */  lw          $2, -0x6388($28)
/* 0082E8 01DB3FE8 04004380 */  lb          $3, 0x4($2)
/* 0082EC 01DB3FEC 05000224 */  addiu       $2, $0, 0x5
/* 0082F0 01DB3FF0 13006210 */  beq         $3, $2, .L01DB4040_2EF640
/* 0082F4 01DB3FF4 00000000 */   nop
/* 0082F8 01DB3FF8 EA01023C */  lui         $2, %hi(CharaMain)
/* 0082FC 01DB3FFC 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 008300 01DB4000 01000524 */  addiu       $5, $0, 0x1
/* 008304 01DB4004 88E0040C */  jal         FootSoundEnable__10CCharacterFi
/* 008308 01DB4008 00000000 */   nop
/* 00830C 01DB400C EA01023C */  lui         $2, %hi(CharaMain)
/* 008310 01DB4010 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 008314 01DB4014 01000524 */  addiu       $5, $0, 0x1
/* 008318 01DB4018 8CE0040C */  jal         EventEnable__10CCharacterFi
/* 00831C 01DB401C 00000000 */   nop
/* 008320 01DB4020 DC01013C */  lui         $1, %hi(BtActStatus + 0x90)
/* 008324 01DB4024 10452584 */  lh          $5, %lo(BtActStatus + 0x90)($1)
/* 008328 01DB4028 EA01023C */  lui         $2, %hi(CharaMain)
/* 00832C 01DB402C 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 008330 01DB4030 84E0040C */  jal         SetFootSoundID__10CCharacterFi
/* 008334 01DB4034 00000000 */   nop
/* 008338 01DB4038 22000010 */  b           .L01DB40C4_2EF6C4
/* 00833C 01DB403C 00000000 */   nop
.L01DB4040_2EF640:
/* 008340 01DB4040 789E8283 */  lb          $2, -0x6188($28)
/* 008344 01DB4044 04004014 */  bnez        $2, .L01DB4058_2EF658
/* 008348 01DB4048 00000000 */   nop
/* 00834C 01DB404C 749E80AF */  sw          $0, -0x618C($28)
/* 008350 01DB4050 01000224 */  addiu       $2, $0, 0x1
/* 008354 01DB4054 789E82A3 */  sb          $2, -0x6188($28)
.L01DB4058_2EF658:
/* 008358 01DB4058 809E8283 */  lb          $2, -0x6180($28)
/* 00835C 01DB405C 04004014 */  bnez        $2, .L01DB4070_2EF670
/* 008360 01DB4060 00000000 */   nop
/* 008364 01DB4064 7C9E80AF */  sw          $0, -0x6184($28)
/* 008368 01DB4068 01000224 */  addiu       $2, $0, 0x1
/* 00836C 01DB406C 809E82A3 */  sb          $2, -0x6180($28)
.L01DB4070_2EF670:
/* 008370 01DB4070 749E828F */  lw          $2, -0x618C($28)
/* 008374 01DB4074 01004224 */  addiu       $2, $2, 0x1
/* 008378 01DB4078 749E82AF */  sw          $2, -0x618C($28)
/* 00837C 01DB407C 749E828F */  lw          $2, -0x618C($28)
/* 008380 01DB4080 05004228 */  slti        $2, $2, 0x5
/* 008384 01DB4084 0F004014 */  bnez        $2, .L01DB40C4_2EF6C4
/* 008388 01DB4088 00000000 */   nop
/* 00838C 01DB408C CC010424 */  addiu       $4, $0, 0x1CC
/* 008390 01DB4090 05000524 */  addiu       $5, $0, 0x5
/* 008394 01DB4094 7C9E868F */  lw          $6, -0x6184($28)
/* 008398 01DB4098 C86B050C */  jal         SndSeSeqPlayStop__Fiii
/* 00839C 01DB409C 00000000 */   nop
/* 0083A0 01DB40A0 749E80AF */  sw          $0, -0x618C($28)
/* 0083A4 01DB40A4 7C9E828F */  lw          $2, -0x6184($28)
/* 0083A8 01DB40A8 01004224 */  addiu       $2, $2, 0x1
/* 0083AC 01DB40AC 7C9E82AF */  sw          $2, -0x6184($28)
/* 0083B0 01DB40B0 7C9E828F */  lw          $2, -0x6184($28)
/* 0083B4 01DB40B4 0A004228 */  slti        $2, $2, 0xA
/* 0083B8 01DB40B8 02004014 */  bnez        $2, .L01DB40C4_2EF6C4
/* 0083BC 01DB40BC 00000000 */   nop
/* 0083C0 01DB40C0 7C9E80AF */  sw          $0, -0x6184($28)
.L01DB40C4_2EF6C4:
/* 0083C4 01DB40C4 B400B127 */  addiu       $17, $29, 0xB4
/* 0083C8 01DB40C8 000021C6 */  lwc1        $f1, 0x0($17)
/* 0083CC 01DB40CC F0C1023C */  lui         $2, (0xC1F00000 >> 16)
/* 0083D0 01DB40D0 00008244 */  mtc1        $2, $f0
/* 0083D4 01DB40D4 00000000 */  nop
/* 0083D8 01DB40D8 36080046 */  c.le.s      $f1, $f0
/* 0083DC 01DB40DC 00000000 */  nop
/* 0083E0 01DB40E0 27000045 */  bc1f        .L01DB4180_2EF780
/* 0083E4 01DB40E4 00000000 */   nop
/* 0083E8 01DB40E8 A49D828F */  lw          $2, -0x625C($28)
/* 0083EC 01DB40EC 24004014 */  bnez        $2, .L01DB4180_2EF780
/* 0083F0 01DB40F0 00000000 */   nop
/* 0083F4 01DB40F4 789C848F */  lw          $4, -0x6388($28)
/* 0083F8 01DB40F8 04008580 */  lb          $5, 0x4($4)
/* 0083FC 01DB40FC 2041023C */  lui         $2, (0x41200000 >> 16)
/* 008400 01DB4100 00608244 */  mtc1        $2, $f12
/* 008404 01DB4104 D8FF0624 */  addiu       $6, $0, -0x28
/* 008408 01DB4108 C4F9060C */  jal         AddNowLife__11CUserStatusFisf
/* 00840C 01DB410C 00000000 */   nop
/* 008410 01DB4110 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 008414 01DB4114 00688244 */  mtc1        $2, $f13
/* 008418 01DB4118 00808044 */  mtc1        $0, $f16
/* 00841C 01DB411C F042023C */  lui         $2, (0x42F00000 >> 16)
/* 008420 01DB4120 00608244 */  mtc1        $2, $f12
/* 008424 01DB4124 7F43023C */  lui         $2, (0x437F0000 >> 16)
/* 008428 01DB4128 00708244 */  mtc1        $2, $f14
/* 00842C 01DB412C C6830046 */  mov.s       $f15, $f16
/* 008430 01DB4130 0004770C */  jal         setUnitAmbientAnime__Ffffff
/* 008434 01DB4134 00000000 */   nop
/* 008438 01DB4138 C004770C */  jal         ResetStatusInfo__Fv
/* 00843C 01DB413C 00000000 */   nop
/* 008440 01DB4140 05000224 */  addiu       $2, $0, 0x5
/* 008444 01DB4144 D501013C */  lui         $1, %hi(BtEventInfo + 0x2C)
/* 008448 01DB4148 6C6722AC */  sw          $2, %lo(BtEventInfo + 0x2C)($1)
/* 00844C 01DB414C D501013C */  lui         $1, %hi(BtEventInfo + 0x34)
/* 008450 01DB4150 746720AC */  sw          $0, %lo(BtEventInfo + 0x34)($1)
/* 008454 01DB4154 00608044 */  mtc1        $0, $f12
/* 008458 01DB4158 00000000 */  nop
/* 00845C 01DB415C 46630046 */  mov.s       $f13, $f12
/* 008460 01DB4160 86630046 */  mov.s       $f14, $f12
/* 008464 01DB4164 78000424 */  addiu       $4, $0, 0x78
/* 008468 01DB4168 E425060C */  jal         EdFadeOut__Fifff
/* 00846C 01DB416C 00000000 */   nop
/* 008470 01DB4170 F4010224 */  addiu       $2, $0, 0x1F4
/* 008474 01DB4174 FC9D82AF */  sw          $2, -0x6204($28)
/* 008478 01DB4178 3B0C0010 */  b           .L.L01DB7268_2F2868$b
/* 00847C 01DB417C 00000000 */   nop
.L01DB4180_2EF780:
/* 008480 01DB4180 EA01013C */  lui         $1, %hi(CharaMain + 0x2F0)
/* 008484 01DB4184 102021C4 */  lwc1        $f1, %lo(CharaMain + 0x2F0)($1)
/* 008488 01DB4188 2F010224 */  addiu       $2, $0, 0x12F
/* 00848C 01DB418C 00008244 */  mtc1        $2, $f0
/* 008490 01DB4190 00000000 */  nop
/* 008494 01DB4194 20008046 */  cvt.s.w     $f0, $f0
/* 008498 01DB4198 34080046 */  c.lt.s      $f1, $f0
/* 00849C 01DB419C 00000000 */  nop
/* 0084A0 01DB41A0 12000145 */  bc1t        .L01DB41EC_2EF7EC
/* 0084A4 01DB41A4 00000000 */   nop
/* 0084A8 01DB41A8 9F43023C */  lui         $2, (0x439F0000 >> 16)
/* 0084AC 01DB41AC 00008244 */  mtc1        $2, $f0
/* 0084B0 01DB41B0 00000000 */  nop
/* 0084B4 01DB41B4 36080046 */  c.le.s      $f1, $f0
/* 0084B8 01DB41B8 00000000 */  nop
/* 0084BC 01DB41BC 0B000045 */  bc1f        .L01DB41EC_2EF7EC
/* 0084C0 01DB41C0 00000000 */   nop
/* 0084C4 01DB41C4 109D828F */  lw          $2, -0x62F0($28)
/* 0084C8 01DB41C8 C004A427 */  addiu       $4, $29, 0x4C0
/* 0084CC 01DB41CC 20024524 */  addiu       $5, $2, 0x220
/* 0084D0 01DB41D0 0C86040C */  jal         sceVu0CopyVector
/* 0084D4 01DB41D4 00000000 */   nop
/* 0084D8 01DB41D8 EB01023C */  lui         $2, %hi(CRunFx__2)
/* 0084DC 01DB41DC 10634424 */  addiu       $4, $2, %lo(CRunFx__2)
/* 0084E0 01DB41E0 C004A527 */  addiu       $5, $29, 0x4C0
/* 0084E4 01DB41E4 3C8E050C */  jal         Set__10CRunEffectFPf
/* 0084E8 01DB41E8 00000000 */   nop
.L01DB41EC_2EF7EC:
/* 0084EC 01DB41EC DC01013C */  lui         $1, %hi(BtActStatus + 0x98)
/* 0084F0 01DB41F0 1845228C */  lw          $2, %lo(BtActStatus + 0x98)($1)
/* 0084F4 01DB41F4 80004014 */  bnez        $2, .L01DB43F8_2EF9F8
/* 0084F8 01DB41F8 00000000 */   nop
/* 0084FC 01DB41FC 28860070 */  paddub      $16, $0, $0
/* 008500 01DB4200 EA01013C */  lui         $1, %hi(CharaMain + 0x2F0)
/* 008504 01DB4204 102034C4 */  lwc1        $f20, %lo(CharaMain + 0x2F0)($1)
/* 008508 01DB4208 9642023C */  lui         $2, (0x42960000 >> 16)
/* 00850C 01DB420C 00008244 */  mtc1        $2, $f0
/* 008510 01DB4210 00000000 */  nop
/* 008514 01DB4214 34A00046 */  c.lt.s      $f20, $f0
/* 008518 01DB4218 00000000 */  nop
/* 00851C 01DB421C 09000145 */  bc1t        .L01DB4244_2EF844
/* 008520 01DB4220 00000000 */   nop
/* 008524 01DB4224 9842023C */  lui         $2, (0x42980000 >> 16)
/* 008528 01DB4228 00008244 */  mtc1        $2, $f0
/* 00852C 01DB422C 00000000 */  nop
/* 008530 01DB4230 36A00046 */  c.le.s      $f20, $f0
/* 008534 01DB4234 00000000 */  nop
/* 008538 01DB4238 02000045 */  bc1f        .L01DB4244_2EF844
/* 00853C 01DB423C 00000000 */   nop
/* 008540 01DB4240 01001024 */  addiu       $16, $0, 0x1
.L01DB4244_2EF844:
/* 008544 01DB4244 9A42023C */  lui         $2, (0x429A0000 >> 16)
/* 008548 01DB4248 00008244 */  mtc1        $2, $f0
/* 00854C 01DB424C 00000000 */  nop
/* 008550 01DB4250 34A00046 */  c.lt.s      $f20, $f0
/* 008554 01DB4254 00000000 */  nop
/* 008558 01DB4258 09000145 */  bc1t        .L01DB4280_2EF880
/* 00855C 01DB425C 00000000 */   nop
/* 008560 01DB4260 9C42023C */  lui         $2, (0x429C0000 >> 16)
/* 008564 01DB4264 00008244 */  mtc1        $2, $f0
/* 008568 01DB4268 00000000 */  nop
/* 00856C 01DB426C 36A00046 */  c.le.s      $f20, $f0
/* 008570 01DB4270 00000000 */  nop
/* 008574 01DB4274 02000045 */  bc1f        .L01DB4280_2EF880
/* 008578 01DB4278 00000000 */   nop
/* 00857C 01DB427C 01001024 */  addiu       $16, $0, 0x1
.L01DB4280_2EF880:
/* 008580 01DB4280 AA42023C */  lui         $2, (0x42AA0000 >> 16)
/* 008584 01DB4284 00008244 */  mtc1        $2, $f0
/* 008588 01DB4288 00000000 */  nop
/* 00858C 01DB428C 34A00046 */  c.lt.s      $f20, $f0
/* 008590 01DB4290 00000000 */  nop
/* 008594 01DB4294 09000145 */  bc1t        .L01DB42BC_2EF8BC
/* 008598 01DB4298 00000000 */   nop
/* 00859C 01DB429C AC42023C */  lui         $2, (0x42AC0000 >> 16)
/* 0085A0 01DB42A0 00008244 */  mtc1        $2, $f0
/* 0085A4 01DB42A4 00000000 */  nop
/* 0085A8 01DB42A8 36A00046 */  c.le.s      $f20, $f0
/* 0085AC 01DB42AC 00000000 */  nop
/* 0085B0 01DB42B0 02000045 */  bc1f        .L01DB42BC_2EF8BC
/* 0085B4 01DB42B4 00000000 */   nop
/* 0085B8 01DB42B8 01001024 */  addiu       $16, $0, 0x1
.L01DB42BC_2EF8BC:
/* 0085BC 01DB42BC AE42023C */  lui         $2, (0x42AE0000 >> 16)
/* 0085C0 01DB42C0 00008244 */  mtc1        $2, $f0
/* 0085C4 01DB42C4 00000000 */  nop
/* 0085C8 01DB42C8 34A00046 */  c.lt.s      $f20, $f0
/* 0085CC 01DB42CC 00000000 */  nop
/* 0085D0 01DB42D0 09000145 */  bc1t        .L01DB42F8_2EF8F8
/* 0085D4 01DB42D4 00000000 */   nop
/* 0085D8 01DB42D8 B042023C */  lui         $2, (0x42B00000 >> 16)
/* 0085DC 01DB42DC 00008244 */  mtc1        $2, $f0
/* 0085E0 01DB42E0 00000000 */  nop
/* 0085E4 01DB42E4 36A00046 */  c.le.s      $f20, $f0
/* 0085E8 01DB42E8 00000000 */  nop
/* 0085EC 01DB42EC 02000045 */  bc1f        .L01DB42F8_2EF8F8
/* 0085F0 01DB42F0 00000000 */   nop
/* 0085F4 01DB42F4 01001024 */  addiu       $16, $0, 0x1
.L01DB42F8_2EF8F8:
/* 0085F8 01DB42F8 EA01013C */  lui         $1, %hi(CharaMain + 0xC68)
/* 0085FC 01DB42FC 8829238C */  lw          $3, %lo(CharaMain + 0xC68)($1)
/* 008600 01DB4300 02000224 */  addiu       $2, $0, 0x2
/* 008604 01DB4304 2B006214 */  bne         $3, $2, .L01DB43B4_2EF9B4
/* 008608 01DB4308 00000000 */   nop
/* 00860C 01DB430C DC01023C */  lui         $2, %hi(velo__2)
/* 008610 01DB4310 50254424 */  addiu       $4, $2, %lo(velo__2)
/* 008614 01DB4314 588D040C */  jal         DistVector__FPf
/* 008618 01DB4318 00000000 */   nop
/* 00861C 01DB431C 6C8381C7 */  lwc1        $f1, -0x7C94($28)
/* 008620 01DB4320 34000146 */  c.lt.s      $f0, $f1
/* 008624 01DB4324 00000000 */  nop
/* 008628 01DB4328 21000145 */  bc1t        .L01DB43B0_2EF9B0
/* 00862C 01DB432C 00000000 */   nop
/* 008630 01DB4330 1842023C */  lui         $2, (0x42180000 >> 16)
/* 008634 01DB4334 00008244 */  mtc1        $2, $f0
/* 008638 01DB4338 00000000 */  nop
/* 00863C 01DB433C 34A00046 */  c.lt.s      $f20, $f0
/* 008640 01DB4340 00000000 */  nop
/* 008644 01DB4344 09000145 */  bc1t        .L01DB436C_2EF96C
/* 008648 01DB4348 00000000 */   nop
/* 00864C 01DB434C 1C42023C */  lui         $2, (0x421C0000 >> 16)
/* 008650 01DB4350 00008244 */  mtc1        $2, $f0
/* 008654 01DB4354 00000000 */  nop
/* 008658 01DB4358 36A00046 */  c.le.s      $f20, $f0
/* 00865C 01DB435C 00000000 */  nop
/* 008660 01DB4360 02000045 */  bc1f        .L01DB436C_2EF96C
/* 008664 01DB4364 00000000 */   nop
/* 008668 01DB4368 01001024 */  addiu       $16, $0, 0x1
.L01DB436C_2EF96C:
/* 00866C 01DB436C 3442023C */  lui         $2, (0x42340000 >> 16)
/* 008670 01DB4370 00008244 */  mtc1        $2, $f0
/* 008674 01DB4374 00000000 */  nop
/* 008678 01DB4378 34A00046 */  c.lt.s      $f20, $f0
/* 00867C 01DB437C 00000000 */  nop
/* 008680 01DB4380 0C000145 */  bc1t        .L01DB43B4_2EF9B4
/* 008684 01DB4384 00000000 */   nop
/* 008688 01DB4388 3842023C */  lui         $2, (0x42380000 >> 16)
/* 00868C 01DB438C 00008244 */  mtc1        $2, $f0
/* 008690 01DB4390 00000000 */  nop
/* 008694 01DB4394 36A00046 */  c.le.s      $f20, $f0
/* 008698 01DB4398 00000000 */  nop
/* 00869C 01DB439C 05000045 */  bc1f        .L01DB43B4_2EF9B4
/* 0086A0 01DB43A0 00000000 */   nop
/* 0086A4 01DB43A4 01001024 */  addiu       $16, $0, 0x1
/* 0086A8 01DB43A8 02000010 */  b           .L01DB43B4_2EF9B4
/* 0086AC 01DB43AC 00000000 */   nop
.L01DB43B0_2EF9B0:
/* 0086B0 01DB43B0 28860070 */  paddub      $16, $0, $0
.L01DB43B4_2EF9B4:
/* 0086B4 01DB43B4 10000012 */  beqz        $16, .L01DB43F8_2EF9F8
/* 0086B8 01DB43B8 00000000 */   nop
/* 0086BC 01DB43BC 109D828F */  lw          $2, -0x62F0($28)
/* 0086C0 01DB43C0 D004A427 */  addiu       $4, $29, 0x4D0
/* 0086C4 01DB43C4 20024524 */  addiu       $5, $2, 0x220
/* 0086C8 01DB43C8 0C86040C */  jal         sceVu0CopyVector
/* 0086CC 01DB43CC 00000000 */   nop
/* 0086D0 01DB43D0 789C828F */  lw          $2, -0x6388($28)
/* 0086D4 01DB43D4 04004380 */  lb          $3, 0x4($2)
/* 0086D8 01DB43D8 05000224 */  addiu       $2, $0, 0x5
/* 0086DC 01DB43DC 06006210 */  beq         $3, $2, .L01DB43F8_2EF9F8
/* 0086E0 01DB43E0 00000000 */   nop
/* 0086E4 01DB43E4 EB01023C */  lui         $2, %hi(CRunFx__2)
/* 0086E8 01DB43E8 10634424 */  addiu       $4, $2, %lo(CRunFx__2)
/* 0086EC 01DB43EC D004A527 */  addiu       $5, $29, 0x4D0
/* 0086F0 01DB43F0 3C8E050C */  jal         Set__10CRunEffectFPf
/* 0086F4 01DB43F4 00000000 */   nop
.L01DB43F8_2EF9F8:
/* 0086F8 01DB43F8 60BE060C */  jal         HealingWater__Fv
/* 0086FC 01DB43FC 00000000 */   nop
/* 008700 01DB4400 CC01023C */  lui         $2, %hi(GamePad)
/* 008704 01DB4404 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 008708 01DB4408 A4AD040C */  jal         GetRXf__8CGamePadFv
/* 00870C 01DB440C 00000000 */   nop
/* 008710 01DB4410 06050046 */  mov.s       $f20, $f0
/* 008714 01DB4414 CC01023C */  lui         $2, %hi(GamePad)
/* 008718 01DB4418 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 00871C 01DB441C B4AD040C */  jal         GetRYf__8CGamePadFv
/* 008720 01DB4420 00000000 */   nop
/* 008724 01DB4424 07030046 */  neg.s       $f12, $f0
/* 008728 01DB4428 A89C848F */  lw          $4, -0x6358($28)
/* 00872C 01DB442C F492040C */  jal         AddHeight__13CCameraFollowFf
/* 008730 01DB4430 00000000 */   nop
/* 008734 01DB4434 A89C848F */  lw          $4, -0x6358($28)
/* 008738 01DB4438 F092040C */  jal         GetHeight__13CCameraFollowFv
/* 00873C 01DB443C 00000000 */   nop
/* 008740 01DB4440 F041023C */  lui         $2, (0x41F00000 >> 16)
/* 008744 01DB4444 00608244 */  mtc1        $2, $f12
/* 008748 01DB4448 00000000 */  nop
/* 00874C 01DB444C 34000C46 */  c.lt.s      $f0, $f12
/* 008750 01DB4450 00000000 */  nop
/* 008754 01DB4454 04000145 */  bc1t        .L01DB4468_2EFA68
/* 008758 01DB4458 00000000 */   nop
/* 00875C 01DB445C A89C848F */  lw          $4, -0x6358($28)
/* 008760 01DB4460 EC92040C */  jal         SetHeight__13CCameraFollowFf
/* 008764 01DB4464 00000000 */   nop
.L01DB4468_2EFA68:
/* 008768 01DB4468 47A00046 */  neg.s       $f1, $f20
/* 00876C 01DB446C 048280C7 */  lwc1        $f0, -0x7DFC($28)
/* 008770 01DB4470 02030146 */  mul.s       $f12, $f0, $f1
/* 008774 01DB4474 A89C848F */  lw          $4, -0x6358($28)
/* 008778 01DB4478 D492040C */  jal         AddAngle__13CCameraFollowFf
/* 00877C 01DB447C 00000000 */   nop
/* 008780 01DB4480 989D828F */  lw          $2, -0x6268($28)
/* 008784 01DB4484 17004014 */  bnez        $2, .L01DB44E4_2EFAE4
/* 008788 01DB4488 00000000 */   nop
/* 00878C 01DB448C CC01023C */  lui         $2, %hi(GamePad)
/* 008790 01DB4490 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 008794 01DB4494 08000524 */  addiu       $5, $0, 0x8
/* 008798 01DB4498 04AE040C */  jal         On__8CGamePadFi
/* 00879C 01DB449C 00000000 */   nop
/* 0087A0 01DB44A0 05004010 */  beqz        $2, .L01DB44B8_2EFAB8
/* 0087A4 01DB44A4 00000000 */   nop
/* 0087A8 01DB44A8 A89C848F */  lw          $4, -0x6358($28)
/* 0087AC 01DB44AC 48858CC7 */  lwc1        $f12, -0x7AB8($28)
/* 0087B0 01DB44B0 D492040C */  jal         AddAngle__13CCameraFollowFf
/* 0087B4 01DB44B4 00000000 */   nop
.L01DB44B8_2EFAB8:
/* 0087B8 01DB44B8 CC01023C */  lui         $2, %hi(GamePad)
/* 0087BC 01DB44BC 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0087C0 01DB44C0 04000524 */  addiu       $5, $0, 0x4
/* 0087C4 01DB44C4 04AE040C */  jal         On__8CGamePadFi
/* 0087C8 01DB44C8 00000000 */   nop
/* 0087CC 01DB44CC 05004010 */  beqz        $2, .L01DB44E4_2EFAE4
/* 0087D0 01DB44D0 00000000 */   nop
/* 0087D4 01DB44D4 A89C848F */  lw          $4, -0x6358($28)
/* 0087D8 01DB44D8 40858CC7 */  lwc1        $f12, -0x7AC0($28)
/* 0087DC 01DB44DC D492040C */  jal         AddAngle__13CCameraFollowFf
/* 0087E0 01DB44E0 00000000 */   nop
.L01DB44E4_2EFAE4:
/* 0087E4 01DB44E4 CC01023C */  lui         $2, %hi(GamePad)
/* 0087E8 01DB44E8 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0087EC 01DB44EC 01000524 */  addiu       $5, $0, 0x1
/* 0087F0 01DB44F0 04AE040C */  jal         On__8CGamePadFi
/* 0087F4 01DB44F4 00000000 */   nop
/* 0087F8 01DB44F8 17004010 */  beqz        $2, .L01DB4558_2EFB58
/* 0087FC 01DB44FC 00000000 */   nop
/* 008800 01DB4500 109D848F */  lw          $4, -0x62F0($28)
/* 008804 01DB4504 E004A527 */  addiu       $5, $29, 0x4E0
/* 008808 01DB4508 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 00880C 01DB450C 00000000 */   nop
/* 008810 01DB4510 0005ACC7 */  lwc1        $f12, 0x500($29)
/* 008814 01DB4514 0805ADC7 */  lwc1        $f13, 0x508($29)
/* 008818 01DB4518 5077040C */  jal         atan2f
/* 00881C 01DB451C 00000000 */   nop
/* 008820 01DB4520 06030046 */  mov.s       $f12, $f0
/* 008824 01DB4524 9044040C */  jal         fptodp
/* 008828 01DB4528 00000000 */   nop
/* 00882C 01DB452C 188085DF */  ld          $5, -0x7FE8($28)
/* 008830 01DB4530 28264070 */  paddub      $4, $2, $0
/* 008834 01DB4534 843F040C */  jal         dpsub
/* 008838 01DB4538 00000000 */   nop
/* 00883C 01DB453C 28264070 */  paddub      $4, $2, $0
/* 008840 01DB4540 9241040C */  jal         dptofp
/* 008844 01DB4544 00000000 */   nop
/* 008848 01DB4548 A89C848F */  lw          $4, -0x6358($28)
/* 00884C 01DB454C 06030046 */  mov.s       $f12, $f0
/* 008850 01DB4550 C892040C */  jal         SetAngle__13CCameraFollowFf
/* 008854 01DB4554 00000000 */   nop
.L01DB4558_2EFB58:
/* 008858 01DB4558 CC01023C */  lui         $2, %hi(GamePad)
/* 00885C 01DB455C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 008860 01DB4560 02000524 */  addiu       $5, $0, 0x2
/* 008864 01DB4564 1CAE040C */  jal         Down__8CGamePadFi
/* 008868 01DB4568 00000000 */   nop
/* 00886C 01DB456C 40004010 */  beqz        $2, .L01DB4670_2EFC70
/* 008870 01DB4570 00000000 */   nop
/* 008874 01DB4574 DC01013C */  lui         $1, %hi(BtActStatus + 0x20)
/* 008878 01DB4578 A044228C */  lw          $2, %lo(BtActStatus + 0x20)($1)
/* 00887C 01DB457C 3C004014 */  bnez        $2, .L01DB4670_2EFC70
/* 008880 01DB4580 00000000 */   nop
/* 008884 01DB4584 DC01013C */  lui         $1, %hi(BtActStatus + 0x70)
/* 008888 01DB4588 F044228C */  lw          $2, %lo(BtActStatus + 0x70)($1)
/* 00888C 01DB458C 38004014 */  bnez        $2, .L01DB4670_2EFC70
/* 008890 01DB4590 00000000 */   nop
/* 008894 01DB4594 A89C848F */  lw          $4, -0x6358($28)
/* 008898 01DB4598 D092040C */  jal         GetAngle__13CCameraFollowFv
/* 00889C 01DB459C 00000000 */   nop
/* 0088A0 01DB45A0 649E80E7 */  swc1        $f0, -0x619C($28)
/* 0088A4 01DB45A4 A89C848F */  lw          $4, -0x6358($28)
/* 0088A8 01DB45A8 F092040C */  jal         GetHeight__13CCameraFollowFv
/* 0088AC 01DB45AC 00000000 */   nop
/* 0088B0 01DB45B0 609E80E7 */  swc1        $f0, -0x61A0($28)
/* 0088B4 01DB45B4 A89C848F */  lw          $4, -0x6358($28)
/* 0088B8 01DB45B8 C492040C */  jal         FollowOff__13CCameraFollowFv
/* 0088BC 01DB45BC 00000000 */   nop
/* 0088C0 01DB45C0 DC01013C */  lui         $1, %hi(BtActStatus)
/* 0088C4 01DB45C4 804420AC */  sw          $0, %lo(BtActStatus)($1)
/* 0088C8 01DB45C8 01000224 */  addiu       $2, $0, 0x1
/* 0088CC 01DB45CC B49C82AF */  sw          $2, -0x634C($28)
/* 0088D0 01DB45D0 E405770C */  jal         InitEyeCamera__Fv
/* 0088D4 01DB45D4 00000000 */   nop
/* 0088D8 01DB45D8 789C828F */  lw          $2, -0x6388($28)
/* 0088DC 01DB45DC 04004280 */  lb          $2, 0x4($2)
/* 0088E0 01DB45E0 01000524 */  addiu       $5, $0, 0x1
/* 0088E4 01DB45E4 04004514 */  bne         $2, $5, .L01DB45F8_2EFBF8
/* 0088E8 01DB45E8 00000000 */   nop
/* 0088EC 01DB45EC 009D848F */  lw          $4, -0x6300($28)
/* 0088F0 01DB45F0 64E5760C */  jal         EquipReAttach__FP10CCharacteri
/* 0088F4 01DB45F4 00000000 */   nop
.L01DB45F8_2EFBF8:
/* 0088F8 01DB45F8 DC01013C */  lui         $1, %hi(BtActStatus + 0x28)
/* 0088FC 01DB45FC A84420AC */  sw          $0, %lo(BtActStatus + 0x28)($1)
/* 008900 01DB4600 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 008904 01DB4604 8C4420AC */  sw          $0, %lo(BtActStatus + 0xC)($1)
/* 008908 01DB4608 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 00890C 01DB460C 904420AC */  sw          $0, %lo(BtActStatus + 0x10)($1)
/* 008910 01DB4610 DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 008914 01DB4614 944420AC */  sw          $0, %lo(BtActStatus + 0x14)($1)
/* 008918 01DB4618 38FF760C */  jal         LockOffTargte__Fv
/* 00891C 01DB461C 00000000 */   nop
/* 008920 01DB4620 0005770C */  jal         ResetMovePower__Fv
/* 008924 01DB4624 00000000 */   nop
/* 008928 01DB4628 A49C858F */  lw          $5, -0x635C($28)
/* 00892C 01DB462C FFFF0224 */  addiu       $2, $0, -0x1
/* 008930 01DB4630 0B00A210 */  beq         $5, $2, .L01DB4660_2EFC60
/* 008934 01DB4634 00000000 */   nop
/* 008938 01DB4638 789C828F */  lw          $2, -0x6388($28)
/* 00893C 01DB463C 04004380 */  lb          $3, 0x4($2)
/* 008940 01DB4640 03000224 */  addiu       $2, $0, 0x3
/* 008944 01DB4644 06006214 */  bne         $3, $2, .L01DB4660_2EFC60
/* 008948 01DB4648 00000000 */   nop
/* 00894C 01DB464C FC9C848F */  lw          $4, -0x6304($28)
/* 008950 01DB4650 04B3060C */  jal         OffEffect__12CSHOT_EFFECTFi
/* 008954 01DB4654 00000000 */   nop
/* 008958 01DB4658 FFFF0224 */  addiu       $2, $0, -0x1
/* 00895C 01DB465C A49C82AF */  sw          $2, -0x635C($28)
.L01DB4660_2EFC60:
/* 008960 01DB4660 0A000224 */  addiu       $2, $0, 0xA
/* 008964 01DB4664 FC9D82AF */  sw          $2, -0x6204($28)
/* 008968 01DB4668 FF0A0010 */  b           .L.L01DB7268_2F2868$b
/* 00896C 01DB466C 00000000 */   nop
.L01DB4670_2EFC70:
/* 008970 01DB4670 000021C6 */  lwc1        $f1, 0x0($17)
/* 008974 01DB4674 C8C2023C */  lui         $2, (0xC2C80000 >> 16)
/* 008978 01DB4678 00008244 */  mtc1        $2, $f0
/* 00897C 01DB467C 00000000 */  nop
/* 008980 01DB4680 34080046 */  c.lt.s      $f1, $f0
/* 008984 01DB4684 00000000 */  nop
/* 008988 01DB4688 06000045 */  bc1f        .L01DB46A4_2EFCA4
/* 00898C 01DB468C 00000000 */   nop
/* 008990 01DB4690 4843023C */  lui         $2, (0x43480000 >> 16)
/* 008994 01DB4694 00008244 */  mtc1        $2, $f0
/* 008998 01DB4698 00000000 */  nop
/* 00899C 01DB469C 00080046 */  add.s       $f0, $f1, $f0
/* 0089A0 01DB46A0 000020E6 */  swc1        $f0, 0x0($17)
.L01DB46A4_2EFCA4:
/* 0089A4 01DB46A4 B800B027 */  addiu       $16, $29, 0xB8
/* 0089A8 01DB46A8 109D848F */  lw          $4, -0x62F0($28)
/* 0089AC 01DB46AC B000ACC7 */  lwc1        $f12, 0xB0($29)
/* 0089B0 01DB46B0 00002DC6 */  lwc1        $f13, 0x0($17)
/* 0089B4 01DB46B4 00000EC6 */  lwc1        $f14, 0x0($16)
/* 0089B8 01DB46B8 A09F040C */  jal         SetPosition__6CFrameFfff
/* 0089BC 01DB46BC 00000000 */   nop
/* 0089C0 01DB46C0 2005A427 */  addiu       $4, $29, 0x520
/* 0089C4 01DB46C4 B000A527 */  addiu       $5, $29, 0xB0
/* 0089C8 01DB46C8 0C86040C */  jal         sceVu0CopyVector
/* 0089CC 01DB46CC 00000000 */   nop
/* 0089D0 01DB46D0 2005A1C7 */  lwc1        $f1, 0x520($29)
/* 0089D4 01DB46D4 E040023C */  lui         $2, (0x40E00000 >> 16)
/* 0089D8 01DB46D8 00108244 */  mtc1        $2, $f2
/* 0089DC 01DB46DC F001013C */  lui         $1, %hi(ref_off)
/* 0089E0 01DB46E0 A06820C4 */  lwc1        $f0, %lo(ref_off)($1)
/* 0089E4 01DB46E4 02100046 */  mul.s       $f0, $f2, $f0
/* 0089E8 01DB46E8 00080046 */  add.s       $f0, $f1, $f0
/* 0089EC 01DB46EC 2005A0E7 */  swc1        $f0, 0x520($29)
/* 0089F0 01DB46F0 0040023C */  lui         $2, (0x40000000 >> 16)
/* 0089F4 01DB46F4 00088244 */  mtc1        $2, $f1
/* 0089F8 01DB46F8 F001013C */  lui         $1, %hi(ref_off + 0x4)
/* 0089FC 01DB46FC A46820C4 */  lwc1        $f0, %lo(ref_off + 0x4)($1)
/* 008A00 01DB4700 42080046 */  mul.s       $f1, $f1, $f0
/* 008A04 01DB4704 DC01013C */  lui         $1, %hi(reference$1831 + 0x4)
/* 008A08 01DB4708 642720C4 */  lwc1        $f0, %lo(reference$1831 + 0x4)($1)
/* 008A0C 01DB470C 40080046 */  add.s       $f1, $f1, $f0
/* 008A10 01DB4710 C040023C */  lui         $2, (0x40C00000 >> 16)
/* 008A14 01DB4714 00008244 */  mtc1        $2, $f0
/* 008A18 01DB4718 00000000 */  nop
/* 008A1C 01DB471C 40000146 */  add.s       $f1, $f0, $f1
/* 008A20 01DB4720 DC01013C */  lui         $1, %hi(BtActStatus + 0x120)
/* 008A24 01DB4724 A04520C4 */  lwc1        $f0, %lo(BtActStatus + 0x120)($1)
/* 008A28 01DB4728 40000146 */  add.s       $f1, $f0, $f1
/* 008A2C 01DB472C 2405A327 */  addiu       $3, $29, 0x524
/* 008A30 01DB4730 000060C4 */  lwc1        $f0, 0x0($3)
/* 008A34 01DB4734 00000146 */  add.s       $f0, $f0, $f1
/* 008A38 01DB4738 000060E4 */  swc1        $f0, 0x0($3)
/* 008A3C 01DB473C 2805A227 */  addiu       $2, $29, 0x528
/* 008A40 01DB4740 000041C4 */  lwc1        $f1, 0x0($2)
/* 008A44 01DB4744 F001013C */  lui         $1, %hi(ref_off + 0x8)
/* 008A48 01DB4748 A86820C4 */  lwc1        $f0, %lo(ref_off + 0x8)($1)
/* 008A4C 01DB474C 02100046 */  mul.s       $f0, $f2, $f0
/* 008A50 01DB4750 00080046 */  add.s       $f0, $f1, $f0
/* 008A54 01DB4754 000040E4 */  swc1        $f0, 0x0($2)
/* 008A58 01DB4758 A89C848F */  lw          $4, -0x6358($28)
/* 008A5C 01DB475C 2005ACC7 */  lwc1        $f12, 0x520($29)
/* 008A60 01DB4760 00006DC4 */  lwc1        $f13, 0x0($3)
/* 008A64 01DB4764 00004EC4 */  lwc1        $f14, 0x0($2)
/* 008A68 01DB4768 B892040C */  jal         SetFollow__13CCameraFollowFfff
/* 008A6C 01DB476C 00000000 */   nop
/* 008A70 01DB4770 989D828F */  lw          $2, -0x6268($28)
/* 008A74 01DB4774 4A004010 */  beqz        $2, .L01DB48A0_2EFEA0
/* 008A78 01DB4778 00000000 */   nop
/* 008A7C 01DB477C 949D838F */  lw          $3, -0x626C($28)
/* 008A80 01DB4780 10350224 */  addiu       $2, $0, 0x3510
/* 008A84 01DB4784 18186200 */  mult        $3, $3, $2
/* 008A88 01DB4788 E09C828F */  lw          $2, -0x6320($28)
/* 008A8C 01DB478C 21104300 */  addu        $2, $2, $3
/* 008A90 01DB4790 0100013C */  lui         $1, (0x1FCD0 >> 16)
/* 008A94 01DB4794 D0FC2134 */  ori         $1, $1, (0x1FCD0 & 0xFFFF)
/* 008A98 01DB4798 21204100 */  addu        $4, $2, $1
/* 008A9C 01DB479C 4005A527 */  addiu       $5, $29, 0x540
/* 008AA0 01DB47A0 A000998C */  lw          $25, 0xA0($4)
/* 008AA4 01DB47A4 A000398F */  lw          $25, 0xA0($25)
/* 008AA8 01DB47A8 09F82003 */  jalr        $25
/* 008AAC 01DB47AC 00000000 */   nop
/* 008AB0 01DB47B0 4005A427 */  addiu       $4, $29, 0x540
/* 008AB4 01DB47B4 B000A527 */  addiu       $5, $29, 0xB0
/* 008AB8 01DB47B8 648D040C */  jal         DistVector__FPfPf
/* 008ABC 01DB47BC 00000000 */   nop
/* 008AC0 01DB47C0 06050046 */  mov.s       $f20, $f0
/* 008AC4 01DB47C4 4005A1C7 */  lwc1        $f1, 0x540($29)
/* 008AC8 01DB47C8 B000A0C7 */  lwc1        $f0, 0xB0($29)
/* 008ACC 01DB47CC 01080046 */  sub.s       $f0, $f1, $f0
/* 008AD0 01DB47D0 3005A0E7 */  swc1        $f0, 0x530($29)
/* 008AD4 01DB47D4 4405A1C7 */  lwc1        $f1, 0x544($29)
/* 008AD8 01DB47D8 000020C6 */  lwc1        $f0, 0x0($17)
/* 008ADC 01DB47DC 01080046 */  sub.s       $f0, $f1, $f0
/* 008AE0 01DB47E0 3405B227 */  addiu       $18, $29, 0x534
/* 008AE4 01DB47E4 000040E6 */  swc1        $f0, 0x0($18)
/* 008AE8 01DB47E8 4805A1C7 */  lwc1        $f1, 0x548($29)
/* 008AEC 01DB47EC 000000C6 */  lwc1        $f0, 0x0($16)
/* 008AF0 01DB47F0 01080046 */  sub.s       $f0, $f1, $f0
/* 008AF4 01DB47F4 3805B327 */  addiu       $19, $29, 0x538
/* 008AF8 01DB47F8 000060E6 */  swc1        $f0, 0x0($19)
/* 008AFC 01DB47FC 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 008B00 01DB4800 3C05A2AF */  sw          $2, 0x53C($29)
/* 008B04 01DB4804 A041023C */  lui         $2, (0x41A00000 >> 16)
/* 008B08 01DB4808 00008244 */  mtc1        $2, $f0
/* 008B0C 01DB480C 00000000 */  nop
/* 008B10 01DB4810 34A00046 */  c.lt.s      $f20, $f0
/* 008B14 01DB4814 00000000 */  nop
/* 008B18 01DB4818 02000145 */  bc1t        .L01DB4824_2EFE24
/* 008B1C 01DB481C 00000000 */   nop
/* 008B20 01DB4820 06050046 */  mov.s       $f20, $f0
.L01DB4824_2EFE24:
/* 008B24 01DB4824 3005A427 */  addiu       $4, $29, 0x530
/* 008B28 01DB4828 282E8070 */  paddub      $5, $4, $0
/* 008B2C 01DB482C 9285040C */  jal         sceVu0Normalize
/* 008B30 01DB4830 00000000 */   nop
/* 008B34 01DB4834 3005A427 */  addiu       $4, $29, 0x530
/* 008B38 01DB4838 282E8070 */  paddub      $5, $4, $0
/* 008B3C 01DB483C 06A30046 */  mov.s       $f12, $f20
/* 008B40 01DB4840 4688040C */  jal         sceVu0ScaleVectorXYZ
/* 008B44 01DB4844 00000000 */   nop
/* 008B48 01DB4848 000040AE */  sw          $0, 0x0($18)
/* 008B4C 01DB484C C040023C */  lui         $2, (0x40C00000 >> 16)
/* 008B50 01DB4850 00088244 */  mtc1        $2, $f1
/* 008B54 01DB4854 000020C6 */  lwc1        $f0, 0x0($17)
/* 008B58 01DB4858 40080046 */  add.s       $f1, $f1, $f0
/* 008B5C 01DB485C DC01013C */  lui         $1, %hi(reference$1831 + 0x4)
/* 008B60 01DB4860 642720C4 */  lwc1        $f0, %lo(reference$1831 + 0x4)($1)
/* 008B64 01DB4864 40080046 */  add.s       $f1, $f1, $f0
/* 008B68 01DB4868 000040C6 */  lwc1        $f0, 0x0($18)
/* 008B6C 01DB486C 40000146 */  add.s       $f1, $f0, $f1
/* 008B70 01DB4870 DC01013C */  lui         $1, %hi(BtActStatus + 0x120)
/* 008B74 01DB4874 A04520C4 */  lwc1        $f0, %lo(BtActStatus + 0x120)($1)
/* 008B78 01DB4878 40030146 */  add.s       $f13, $f0, $f1
/* 008B7C 01DB487C B000A1C7 */  lwc1        $f1, 0xB0($29)
/* 008B80 01DB4880 3005A0C7 */  lwc1        $f0, 0x530($29)
/* 008B84 01DB4884 000B0046 */  add.s       $f12, $f1, $f0
/* 008B88 01DB4888 000001C6 */  lwc1        $f1, 0x0($16)
/* 008B8C 01DB488C 000060C6 */  lwc1        $f0, 0x0($19)
/* 008B90 01DB4890 800B0046 */  add.s       $f14, $f1, $f0
/* 008B94 01DB4894 A89C848F */  lw          $4, -0x6358($28)
/* 008B98 01DB4898 B892040C */  jal         SetFollow__13CCameraFollowFfff
/* 008B9C 01DB489C 00000000 */   nop
.L01DB48A0_2EFEA0:
/* 008BA0 01DB48A0 5CFA760C */  jal         autoCamTrial__Fv
/* 008BA4 01DB48A4 00000000 */   nop
/* 008BA8 01DB48A8 6F0A0010 */  b           .L.L01DB7268_2F2868$b
/* 008BAC 01DB48AC 00000000 */   nop
.L01DB48B0_2EFEB0:
/* 008BB0 01DB48B0 FC9D84AF */  sw          $4, -0x6204($28)
/* 008BB4 01DB48B4 6C0A0010 */  b           .L.L01DB7268_2F2868$b
/* 008BB8 01DB48B8 00000000 */   nop
.L01DB48BC_2EFEBC:
/* 008BBC 01DB48BC 0426060C */  jal         EdFadeOutCheck__Fv
/* 008BC0 01DB48C0 00000000 */   nop
/* 008BC4 01DB48C4 680A4010 */  beqz        $2, .L.L01DB7268_2F2868$b
/* 008BC8 01DB48C8 00000000 */   nop
/* 008BCC 01DB48CC E89D918F */  lw          $17, -0x6218($28)
/* 008BD0 01DB48D0 28860070 */  paddub      $16, $0, $0
/* 008BD4 01DB48D4 07000010 */  b           .L01DB48F4_2EFEF4
/* 008BD8 01DB48D8 00000000 */   nop
.L01DB48DC_2EFEDC:
/* 008BDC 01DB48DC 60A10234 */  ori         $2, $0, 0xA160
/* 008BE0 01DB48E0 18100202 */  mult        $2, $16, $2
/* 008BE4 01DB48E4 21202202 */  addu        $4, $17, $2
/* 008BE8 01DB48E8 10B9060C */  jal         Initialize__12CSHOT_EFFECTFv
/* 008BEC 01DB48EC 00000000 */   nop
/* 008BF0 01DB48F0 01001026 */  addiu       $16, $16, 0x1
.L01DB48F4_2EFEF4:
/* 008BF4 01DB48F4 0500022A */  slti        $2, $16, 0x5
/* 008BF8 01DB48F8 F8FF4014 */  bnez        $2, .L01DB48DC_2EFEDC
/* 008BFC 01DB48FC 00000000 */   nop
/* 008C00 01DB4900 E09C848F */  lw          $4, -0x6320($28)
/* 008C04 01DB4904 C49C858F */  lw          $5, -0x633C($28)
/* 008C08 01DB4908 7C7E070C */  jal         CleanViewMonstor__12CMonstorUnitFi
/* 008C0C 01DB490C 00000000 */   nop
/* 008C10 01DB4910 E09C838F */  lw          $3, -0x6320($28)
/* 008C14 01DB4914 FFFF0224 */  addiu       $2, $0, -0x1
/* 008C18 01DB4918 940062AC */  sw          $2, 0x94($3)
/* 008C1C 01DB491C 749D80AF */  sw          $0, -0x628C($28)
/* 008C20 01DB4920 90010224 */  addiu       $2, $0, 0x190
/* 008C24 01DB4924 FC9D82AF */  sw          $2, -0x6204($28)
/* 008C28 01DB4928 4F0A0010 */  b           .L.L01DB7268_2F2868$b
/* 008C2C 01DB492C 00000000 */   nop
.L01DB4930_2EFF30:
/* 008C30 01DB4930 38FF760C */  jal         LockOffTargte__Fv
/* 008C34 01DB4934 00000000 */   nop
/* 008C38 01DB4938 EA01013C */  lui         $1, %hi(CharaMain + 0xC68)
/* 008C3C 01DB493C 882920AC */  sw          $0, %lo(CharaMain + 0xC68)($1)
/* 008C40 01DB4940 EA01013C */  lui         $1, %hi(CharaMain + 0xC64)
/* 008C44 01DB4944 842920AC */  sw          $0, %lo(CharaMain + 0xC64)($1)
/* 008C48 01DB4948 80BF023C */  lui         $2, (0xBF800000 >> 16)
/* 008C4C 01DB494C EA01013C */  lui         $1, %hi(CharaMain + 0xC60)
/* 008C50 01DB4950 802922AC */  sw          $2, %lo(CharaMain + 0xC60)($1)
/* 008C54 01DB4954 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 008C58 01DB4958 904420AC */  sw          $0, %lo(BtActStatus + 0x10)($1)
/* 008C5C 01DB495C EA01013C */  lui         $1, %hi(DngMessMan)
/* 008C60 01DB4960 907620AC */  sw          $0, %lo(DngMessMan)($1)
/* 008C64 01DB4964 FFFF0324 */  addiu       $3, $0, -0x1
/* 008C68 01DB4968 EA01013C */  lui         $1, %hi(DngMessMan + 0x24)
/* 008C6C 01DB496C B47623AC */  sw          $3, %lo(DngMessMan + 0x24)($1)
/* 008C70 01DB4970 EA01013C */  lui         $1, %hi(DngMessMan + 0x4)
/* 008C74 01DB4974 947620AC */  sw          $0, %lo(DngMessMan + 0x4)($1)
/* 008C78 01DB4978 EA01013C */  lui         $1, %hi(DngMessMan + 0x1C)
/* 008C7C 01DB497C AC7620AC */  sw          $0, %lo(DngMessMan + 0x1C)($1)
/* 008C80 01DB4980 EA01013C */  lui         $1, %hi(DngMessMan + 0x20)
/* 008C84 01DB4984 B07620AC */  sw          $0, %lo(DngMessMan + 0x20)($1)
/* 008C88 01DB4988 EA01013C */  lui         $1, %hi(DngMessMan + 0x8)
/* 008C8C 01DB498C 987620AC */  sw          $0, %lo(DngMessMan + 0x8)($1)
/* 008C90 01DB4990 EB01013C */  lui         $1, %hi(DngMes1 + 0x16BC)
/* 008C94 01DB4994 DC7A23AC */  sw          $3, %lo(DngMes1 + 0x16BC)($1)
/* 008C98 01DB4998 EC01013C */  lui         $1, %hi(DngMes2 + 0x16BC)
/* 008C9C 01DB499C 9C9223AC */  sw          $3, %lo(DngMes2 + 0x16BC)($1)
/* 008CA0 01DB49A0 EC01013C */  lui         $1, %hi(DngMesStb + 0x16BC)
/* 008CA4 01DB49A4 5CAA23AC */  sw          $3, %lo(DngMesStb + 0x16BC)($1)
/* 008CA8 01DB49A8 D501013C */  lui         $1, %hi(BtEventInfo + 0x2C)
/* 008CAC 01DB49AC 6C67228C */  lw          $2, %lo(BtEventInfo + 0x2C)($1)
/* 008CB0 01DB49B0 D501013C */  lui         $1, %hi(BtEventInfo + 0x30)
/* 008CB4 01DB49B4 706722AC */  sw          $2, %lo(BtEventInfo + 0x30)($1)
/* 008CB8 01DB49B8 D501013C */  lui         $1, %hi(BtEventInfo + 0x2C)
/* 008CBC 01DB49BC 6C6723AC */  sw          $3, %lo(BtEventInfo + 0x2C)($1)
/* 008CC0 01DB49C0 0005770C */  jal         ResetMovePower__Fv
/* 008CC4 01DB49C4 00000000 */   nop
/* 008CC8 01DB49C8 C4EC060C */  jal         BtSystemScriptInit__Fv
/* 008CCC 01DB49CC 00000000 */   nop
/* 008CD0 01DB49D0 D501013C */  lui         $1, %hi(BtEventInfo + 0x34)
/* 008CD4 01DB49D4 7467228C */  lw          $2, %lo(BtEventInfo + 0x34)($1)
/* 008CD8 01DB49D8 0F004014 */  bnez        $2, .L01DB4A18_2F0018
/* 008CDC 01DB49DC 00000000 */   nop
/* 008CE0 01DB49E0 DC01023C */  lui         $2, %hi(LIT_4404)
/* 008CE4 01DB49E4 402F4424 */  addiu       $4, $2, %lo(LIT_4404)
/* 008CE8 01DB49E8 A611040C */  jal         printf
/* 008CEC 01DB49EC 00000000 */   nop
/* 008CF0 01DB49F0 F001013C */  lui         $1, %hi(BtScriptWorkBuffer)
/* 008CF4 01DB49F4 4068228C */  lw          $2, %lo(BtScriptWorkBuffer)($1)
/* 008CF8 01DB49F8 F001013C */  lui         $1, %hi(BtCashBuffer)
/* 008CFC 01DB49FC 506822AC */  sw          $2, %lo(BtCashBuffer)($1)
/* 008D00 01DB4A00 0100023C */  lui         $2, (0x186A0 >> 16)
/* 008D04 01DB4A04 A0864234 */  ori         $2, $2, (0x186A0 & 0xFFFF)
/* 008D08 01DB4A08 F001013C */  lui         $1, %hi(BtCashBuffer + 0xC)
/* 008D0C 01DB4A0C 5C6822AC */  sw          $2, %lo(BtCashBuffer + 0xC)($1)
/* 008D10 01DB4A10 F001013C */  lui         $1, %hi(BtCashBuffer + 0x8)
/* 008D14 01DB4A14 586820AC */  sw          $0, %lo(BtCashBuffer + 0x8)($1)
.L01DB4A18_2F0018:
/* 008D18 01DB4A18 D501013C */  lui         $1, %hi(BtEventInfo + 0x34)
/* 008D1C 01DB4A1C 7467228C */  lw          $2, %lo(BtEventInfo + 0x34)($1)
/* 008D20 01DB4A20 3C004010 */  beqz        $2, .L01DB4B14_2F0114
/* 008D24 01DB4A24 00000000 */   nop
/* 008D28 01DB4A28 DC01023C */  lui         $2, %hi(LIT_4405)
/* 008D2C 01DB4A2C 602F4424 */  addiu       $4, $2, %lo(LIT_4405)
/* 008D30 01DB4A30 A611040C */  jal         printf
/* 008D34 01DB4A34 00000000 */   nop
/* 008D38 01DB4A38 C701023C */  lui         $2, %hi(TexManager)
/* 008D3C 01DB4A3C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 008D40 01DB4A40 2A000524 */  addiu       $5, $0, 0x2A
/* 008D44 01DB4A44 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 008D48 01DB4A48 00000000 */   nop
/* 008D4C 01DB4A4C C701023C */  lui         $2, %hi(TexManager)
/* 008D50 01DB4A50 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 008D54 01DB4A54 26000524 */  addiu       $5, $0, 0x26
/* 008D58 01DB4A58 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 008D5C 01DB4A5C 00000000 */   nop
/* 008D60 01DB4A60 C701023C */  lui         $2, %hi(TexManager)
/* 008D64 01DB4A64 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 008D68 01DB4A68 FCCD040C */  jal         CleanUpBuffer__15CTextureManagerFv
/* 008D6C 01DB4A6C 00000000 */   nop
/* 008D70 01DB4A70 C701023C */  lui         $2, %hi(TexManager)
/* 008D74 01DB4A74 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 008D78 01DB4A78 98CE040C */  jal         CleanUpTextureList__15CTextureManagerFv
/* 008D7C 01DB4A7C 00000000 */   nop
/* 008D80 01DB4A80 E89D918F */  lw          $17, -0x6218($28)
/* 008D84 01DB4A84 28860070 */  paddub      $16, $0, $0
/* 008D88 01DB4A88 07000010 */  b           .L01DB4AA8_2F00A8
/* 008D8C 01DB4A8C 00000000 */   nop
.L01DB4A90_2F0090:
/* 008D90 01DB4A90 60A10234 */  ori         $2, $0, 0xA160
/* 008D94 01DB4A94 18100202 */  mult        $2, $16, $2
/* 008D98 01DB4A98 21202202 */  addu        $4, $17, $2
/* 008D9C 01DB4A9C 10B9060C */  jal         Initialize__12CSHOT_EFFECTFv
/* 008DA0 01DB4AA0 00000000 */   nop
/* 008DA4 01DB4AA4 01001026 */  addiu       $16, $16, 0x1
.L01DB4AA8_2F00A8:
/* 008DA8 01DB4AA8 0500022A */  slti        $2, $16, 0x5
/* 008DAC 01DB4AAC F8FF4014 */  bnez        $2, .L01DB4A90_2F0090
/* 008DB0 01DB4AB0 00000000 */   nop
/* 008DB4 01DB4AB4 E001023C */  lui         $2, %hi(MainMonstorUnit)
/* 008DB8 01DB4AB8 D0874424 */  addiu       $4, $2, %lo(MainMonstorUnit)
/* 008DBC 01DB4ABC C49C858F */  lw          $5, -0x633C($28)
/* 008DC0 01DB4AC0 7C7E070C */  jal         CleanViewMonstor__12CMonstorUnitFi
/* 008DC4 01DB4AC4 00000000 */   nop
/* 008DC8 01DB4AC8 F001013C */  lui         $1, %hi(MonstorModelBuffer + 0x8)
/* 008DCC 01DB4ACC D86620AC */  sw          $0, %lo(MonstorModelBuffer + 0x8)($1)
/* 008DD0 01DB4AD0 F001013C */  lui         $1, %hi(MonstorModelBuffer)
/* 008DD4 01DB4AD4 D066238C */  lw          $3, %lo(MonstorModelBuffer)($1)
/* 008DD8 01DB4AD8 F001013C */  lui         $1, %hi(MonstorModelBuffer + 0xC)
/* 008DDC 01DB4ADC DC66228C */  lw          $2, %lo(MonstorModelBuffer + 0xC)($1)
/* 008DE0 01DB4AE0 F001013C */  lui         $1, %hi(BtCashBuffer)
/* 008DE4 01DB4AE4 506823AC */  sw          $3, %lo(BtCashBuffer)($1)
/* 008DE8 01DB4AE8 FF7F4224 */  addiu       $2, $2, 0x7FFF
/* 008DEC 01DB4AEC B9084224 */  addiu       $2, $2, 0x8B9
/* 008DF0 01DB4AF0 F001013C */  lui         $1, %hi(BtCashBuffer + 0xC)
/* 008DF4 01DB4AF4 5C6822AC */  sw          $2, %lo(BtCashBuffer + 0xC)($1)
/* 008DF8 01DB4AF8 F001013C */  lui         $1, %hi(BtCashBuffer + 0x8)
/* 008DFC 01DB4AFC 586820AC */  sw          $0, %lo(BtCashBuffer + 0x8)($1)
/* 008E00 01DB4B00 149E828F */  lw          $2, -0x61EC($28)
/* 008E04 01DB4B04 0800013C */  lui         $1, (0x88B80 >> 16)
/* 008E08 01DB4B08 808B2134 */  ori         $1, $1, (0x88B80 & 0xFFFF)
/* 008E0C 01DB4B0C 21104100 */  addu        $2, $2, $1
/* 008E10 01DB4B10 948B82AF */  sw          $2, -0x746C($28)
.L01DB4B14_2F0114:
/* 008E14 01DB4B14 D501013C */  lui         $1, %hi(BtEventInfo + 0x30)
/* 008E18 01DB4B18 7067248C */  lw          $4, %lo(BtEventInfo + 0x30)($1)
/* 008E1C 01DB4B1C F001023C */  lui         $2, %hi(BtCashBuffer)
/* 008E20 01DB4B20 50684524 */  addiu       $5, $2, %lo(BtCashBuffer)
/* 008E24 01DB4B24 3CEE060C */  jal         BtSystemScriptRun__FiP14CDataAlloc2_1_
/* 008E28 01DB4B28 00000000 */   nop
/* 008E2C 01DB4B2C 06004014 */  bnez        $2, .L01DB4B48_2F0148
/* 008E30 01DB4B30 00000000 */   nop
/* 008E34 01DB4B34 78ED060C */  jal         BtSystemScriptAfter__Fv
/* 008E38 01DB4B38 00000000 */   nop
/* 008E3C 01DB4B3C FC9D80AF */  sw          $0, -0x6204($28)
/* 008E40 01DB4B40 C9090010 */  b           .L.L01DB7268_2F2868$b
/* 008E44 01DB4B44 00000000 */   nop
.L01DB4B48_2F0148:
/* 008E48 01DB4B48 FC9D828F */  lw          $2, -0x6204($28)
/* 008E4C 01DB4B4C 01004224 */  addiu       $2, $2, 0x1
/* 008E50 01DB4B50 FC9D82AF */  sw          $2, -0x6204($28)
/* 008E54 01DB4B54 C4090010 */  b           .L.L01DB7268_2F2868$b
/* 008E58 01DB4B58 00000000 */   nop
.L01DB4B5C_2F015C:
/* 008E5C 01DB4B5C A89C848F */  lw          $4, -0x6358($28)
/* 008E60 01DB4B60 282E0070 */  paddub      $5, $0, $0
/* 008E64 01DB4B64 B45E060C */  jal         EdEventMode__FP13CCameraFollowi
/* 008E68 01DB4B68 00000000 */   nop
/* 008E6C 01DB4B6C 27004018 */  blez        $2, .L01DB4C0C_2F020C
/* 008E70 01DB4B70 00000000 */   nop
/* 008E74 01DB4B74 78ED060C */  jal         BtSystemScriptAfter__Fv
/* 008E78 01DB4B78 00000000 */   nop
/* 008E7C 01DB4B7C 149E828F */  lw          $2, -0x61EC($28)
/* 008E80 01DB4B80 948B82AF */  sw          $2, -0x746C($28)
/* 008E84 01DB4B84 FFFF0324 */  addiu       $3, $0, -0x1
/* 008E88 01DB4B88 EB01013C */  lui         $1, %hi(DngMes1 + 0x16BC)
/* 008E8C 01DB4B8C DC7A23AC */  sw          $3, %lo(DngMes1 + 0x16BC)($1)
/* 008E90 01DB4B90 EC01013C */  lui         $1, %hi(DngMes2 + 0x16BC)
/* 008E94 01DB4B94 9C9223AC */  sw          $3, %lo(DngMes2 + 0x16BC)($1)
/* 008E98 01DB4B98 EC01013C */  lui         $1, %hi(DngMesStb + 0x16BC)
/* 008E9C 01DB4B9C 5CAA23AC */  sw          $3, %lo(DngMesStb + 0x16BC)($1)
/* 008EA0 01DB4BA0 01000224 */  addiu       $2, $0, 0x1
/* 008EA4 01DB4BA4 C88682AF */  sw          $2, -0x7938($28)
/* 008EA8 01DB4BA8 CC8682AF */  sw          $2, -0x7934($28)
/* 008EAC 01DB4BAC EA01013C */  lui         $1, %hi(DngMessMan + 0x24)
/* 008EB0 01DB4BB0 B47623AC */  sw          $3, %lo(DngMessMan + 0x24)($1)
/* 008EB4 01DB4BB4 EA01013C */  lui         $1, %hi(DngMessMan + 0x4)
/* 008EB8 01DB4BB8 947620AC */  sw          $0, %lo(DngMessMan + 0x4)($1)
/* 008EBC 01DB4BBC EA01013C */  lui         $1, %hi(DngMessMan + 0x1C)
/* 008EC0 01DB4BC0 AC7620AC */  sw          $0, %lo(DngMessMan + 0x1C)($1)
/* 008EC4 01DB4BC4 EA01013C */  lui         $1, %hi(DngMessMan + 0x20)
/* 008EC8 01DB4BC8 B07620AC */  sw          $0, %lo(DngMessMan + 0x20)($1)
/* 008ECC 01DB4BCC EA01013C */  lui         $1, %hi(DngMessMan + 0x8)
/* 008ED0 01DB4BD0 987620AC */  sw          $0, %lo(DngMessMan + 0x8)($1)
/* 008ED4 01DB4BD4 EA01013C */  lui         $1, %hi(DngMessMan)
/* 008ED8 01DB4BD8 907622AC */  sw          $2, %lo(DngMessMan)($1)
/* 008EDC 01DB4BDC FC9D80AF */  sw          $0, -0x6204($28)
/* 008EE0 01DB4BE0 DC01023C */  lui         $2, %hi(LIT_4406)
/* 008EE4 01DB4BE4 782F4424 */  addiu       $4, $2, %lo(LIT_4406)
/* 008EE8 01DB4BE8 A611040C */  jal         printf
/* 008EEC 01DB4BEC 00000000 */   nop
/* 008EF0 01DB4BF0 D401013C */  lui         $1, %hi(EdEventInfo + 0x448)
/* 008EF4 01DB4BF4 18D6238C */  lw          $3, %lo(EdEventInfo + 0x448)($1)
/* 008EF8 01DB4BF8 08000224 */  addiu       $2, $0, 0x8
/* 008EFC 01DB4BFC 03006214 */  bne         $3, $2, .L01DB4C0C_2F020C
/* 008F00 01DB4C00 00000000 */   nop
/* 008F04 01DB4C04 01000224 */  addiu       $2, $0, 0x1
/* 008F08 01DB4C08 009E82AF */  sw          $2, -0x6200($28)
.L01DB4C0C_2F020C:
/* 008F0C 01DB4C0C A49D848F */  lw          $4, -0x625C($28)
/* 008F10 01DB4C10 01000524 */  addiu       $5, $0, 0x1
/* 008F14 01DB4C14 A4BF060C */  jal         SetBattleStyle__Fii
/* 008F18 01DB4C18 00000000 */   nop
/* 008F1C 01DB4C1C D501013C */  lui         $1, %hi(BtEventInfo + 0x98)
/* 008F20 01DB4C20 D867248C */  lw          $4, %lo(BtEventInfo + 0x98)($1)
/* 008F24 01DB4C24 0700812C */  sltiu       $1, $4, 0x7
/* 008F28 01DB4C28 8F092010 */  beqz        $1, .L.L01DB7268_2F2868$b
/* 008F2C 01DB4C2C 00000000 */   nop
/* 008F30 01DB4C30 DC01023C */  lui         $2, %hi(LIT_4416)
/* 008F34 01DB4C34 10304324 */  addiu       $3, $2, %lo(LIT_4416)
/* 008F38 01DB4C38 80100400 */  sll         $2, $4, 2
/* 008F3C 01DB4C3C 21104300 */  addu        $2, $2, $3
/* 008F40 01DB4C40 0000428C */  lw          $2, 0x0($2)
/* 008F44 01DB4C44 08004000 */  jr          $2
/* 008F48 01DB4C48 00000000 */   nop
jlabel .L01DB4C4C_2F024C
/* 008F4C 01DB4C4C D501013C */  lui         $1, %hi(BtEventInfo + 0x98)
/* 008F50 01DB4C50 D86720AC */  sw          $0, %lo(BtEventInfo + 0x98)($1)
/* 008F54 01DB4C54 004D070C */  jal         BtMiniItemSelect__Fv
/* 008F58 01DB4C58 00000000 */   nop
/* 008F5C 01DB4C5C 9A010224 */  addiu       $2, $0, 0x19A
/* 008F60 01DB4C60 FC9D82AF */  sw          $2, -0x6204($28)
/* 008F64 01DB4C64 80090010 */  b           .L.L01DB7268_2F2868$b
/* 008F68 01DB4C68 00000000 */   nop
jlabel .L01DB4C6C_2F026C
/* 008F6C 01DB4C6C D501013C */  lui         $1, %hi(BtEventInfo + 0x98)
/* 008F70 01DB4C70 D86720AC */  sw          $0, %lo(BtEventInfo + 0x98)($1)
/* 008F74 01DB4C74 A0000224 */  addiu       $2, $0, 0xA0
/* 008F78 01DB4C78 FC9D82AF */  sw          $2, -0x6204($28)
/* 008F7C 01DB4C7C 7A090010 */  b           .L.L01DB7268_2F2868$b
/* 008F80 01DB4C80 00000000 */   nop
jlabel .L01DB4C84_2F0284
/* 008F84 01DB4C84 D501013C */  lui         $1, %hi(BtEventInfo + 0x98)
/* 008F88 01DB4C88 D86720AC */  sw          $0, %lo(BtEventInfo + 0x98)($1)
/* 008F8C 01DB4C8C 17000424 */  addiu       $4, $0, 0x17
/* 008F90 01DB4C90 A49D858F */  lw          $5, -0x625C($28)
/* 008F94 01DB4C94 FFFF0624 */  addiu       $6, $0, -0x1
/* 008F98 01DB4C98 4498080C */  jal         InitDunEnterMenu__Fiii
/* 008F9C 01DB4C9C 00000000 */   nop
/* 008FA0 01DB4CA0 04000224 */  addiu       $2, $0, 0x4
/* 008FA4 01DB4CA4 6C9D82AF */  sw          $2, -0x6294($28)
/* 008FA8 01DB4CA8 6F090010 */  b           .L.L01DB7268_2F2868$b
/* 008FAC 01DB4CAC 00000000 */   nop
jlabel .L01DB4CB0_2F02B0
/* 008FB0 01DB4CB0 D501013C */  lui         $1, %hi(BtEventInfo + 0x98)
/* 008FB4 01DB4CB4 D86720AC */  sw          $0, %lo(BtEventInfo + 0x98)($1)
/* 008FB8 01DB4CB8 EB01023C */  lui         $2, %hi(DngMes2)
/* 008FBC 01DB4CBC E07B4424 */  addiu       $4, $2, %lo(DngMes2)
/* 008FC0 01DB4CC0 EB01023C */  lui         $2, %hi(DngMes1)
/* 008FC4 01DB4CC4 20644524 */  addiu       $5, $2, %lo(DngMes1)
/* 008FC8 01DB4CC8 28360070 */  paddub      $6, $0, $0
/* 008FCC 01DB4CCC E43B080C */  jal         DngEscapeMsgInit__FP6ClsMesP6ClsMesi
/* 008FD0 01DB4CD0 00000000 */   nop
/* 008FD4 01DB4CD4 07000224 */  addiu       $2, $0, 0x7
/* 008FD8 01DB4CD8 6C9D82AF */  sw          $2, -0x6294($28)
/* 008FDC 01DB4CDC 62090010 */  b           .L.L01DB7268_2F2868$b
/* 008FE0 01DB4CE0 00000000 */   nop
jlabel .L01DB4CE4_2F02E4
/* 008FE4 01DB4CE4 D501013C */  lui         $1, %hi(BtEventInfo + 0x98)
/* 008FE8 01DB4CE8 D86720AC */  sw          $0, %lo(BtEventInfo + 0x98)($1)
/* 008FEC 01DB4CEC 78ED060C */  jal         BtSystemScriptAfter__Fv
/* 008FF0 01DB4CF0 00000000 */   nop
/* 008FF4 01DB4CF4 149E828F */  lw          $2, -0x61EC($28)
/* 008FF8 01DB4CF8 948B82AF */  sw          $2, -0x746C($28)
/* 008FFC 01DB4CFC 90D5060C */  jal         ClearGateKeyStack__Fv
/* 009000 01DB4D00 00000000 */   nop
/* 009004 01DB4D04 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 009008 01DB4D08 00608244 */  mtc1        $2, $f12
/* 00900C 01DB4D0C 1C8D848F */  lw          $4, -0x72E4($28)
/* 009010 01DB4D10 F85E050C */  jal         AddNowTime__9CSaveDataFf
/* 009014 01DB4D14 00000000 */   nop
/* 009018 01DB4D18 FFFF0324 */  addiu       $3, $0, -0x1
/* 00901C 01DB4D1C EB01013C */  lui         $1, %hi(DngMes1 + 0x16BC)
/* 009020 01DB4D20 DC7A23AC */  sw          $3, %lo(DngMes1 + 0x16BC)($1)
/* 009024 01DB4D24 EC01013C */  lui         $1, %hi(DngMes2 + 0x16BC)
/* 009028 01DB4D28 9C9223AC */  sw          $3, %lo(DngMes2 + 0x16BC)($1)
/* 00902C 01DB4D2C EC01013C */  lui         $1, %hi(DngMesStb + 0x16BC)
/* 009030 01DB4D30 5CAA23AC */  sw          $3, %lo(DngMesStb + 0x16BC)($1)
/* 009034 01DB4D34 01000224 */  addiu       $2, $0, 0x1
/* 009038 01DB4D38 C88682AF */  sw          $2, -0x7938($28)
/* 00903C 01DB4D3C CC8682AF */  sw          $2, -0x7934($28)
/* 009040 01DB4D40 EA01013C */  lui         $1, %hi(DngMessMan + 0x24)
/* 009044 01DB4D44 B47623AC */  sw          $3, %lo(DngMessMan + 0x24)($1)
/* 009048 01DB4D48 EA01013C */  lui         $1, %hi(DngMessMan + 0x4)
/* 00904C 01DB4D4C 947620AC */  sw          $0, %lo(DngMessMan + 0x4)($1)
/* 009050 01DB4D50 EA01013C */  lui         $1, %hi(DngMessMan + 0x1C)
/* 009054 01DB4D54 AC7620AC */  sw          $0, %lo(DngMessMan + 0x1C)($1)
/* 009058 01DB4D58 EA01013C */  lui         $1, %hi(DngMessMan + 0x20)
/* 00905C 01DB4D5C B07620AC */  sw          $0, %lo(DngMessMan + 0x20)($1)
/* 009060 01DB4D60 EA01013C */  lui         $1, %hi(DngMessMan + 0x8)
/* 009064 01DB4D64 987620AC */  sw          $0, %lo(DngMessMan + 0x8)($1)
/* 009068 01DB4D68 EA01013C */  lui         $1, %hi(DngMessMan)
/* 00906C 01DB4D6C 907622AC */  sw          $2, %lo(DngMessMan)($1)
/* 009070 01DB4D70 789C828F */  lw          $2, -0x6388($28)
/* 009074 01DB4D74 0100013C */  lui         $1, (0x10000 >> 16)
/* 009078 01DB4D78 21084100 */  addu        $1, $2, $1
/* 00907C 01DB4D7C 108B228C */  lw          $2, -0x74F0($1)
/* 009080 01DB4D80 09004310 */  beq         $2, $3, .L01DB4DA8_2F03A8
/* 009084 01DB4D84 00000000 */   nop
/* 009088 01DB4D88 EA01023C */  lui         $2, %hi(DngMessMan)
/* 00908C 01DB4D8C 90764424 */  addiu       $4, $2, %lo(DngMessMan)
/* 009090 01DB4D90 E4D6060C */  jal         LimmitZone__14CDngMessageManFv
/* 009094 01DB4D94 00000000 */   nop
/* 009098 01DB4D98 1B000424 */  addiu       $4, $0, 0x1B
/* 00909C 01DB4D9C FFFF0524 */  addiu       $5, $0, -0x1
/* 0090A0 01DB4DA0 206E050C */  jal         SndSPSePlay__Fii
/* 0090A4 01DB4DA4 00000000 */   nop
.L01DB4DA8_2F03A8:
/* 0090A8 01DB4DA8 789C848F */  lw          $4, -0x6388($28)
/* 0090AC 01DB4DAC 24FA060C */  jal         CheckLife__11CUserStatusFv
/* 0090B0 01DB4DB0 00000000 */   nop
/* 0090B4 01DB4DB4 0700401C */  bgtz        $2, .L01DB4DD4_2F03D4
/* 0090B8 01DB4DB8 00000000 */   nop
/* 0090BC 01DB4DBC 789C848F */  lw          $4, -0x6388($28)
/* 0090C0 01DB4DC0 04008280 */  lb          $2, 0x4($4)
/* 0090C4 01DB4DC4 01000324 */  addiu       $3, $0, 0x1
/* 0090C8 01DB4DC8 40100200 */  sll         $2, $2, 1
/* 0090CC 01DB4DCC 21104400 */  addu        $2, $2, $4
/* 0090D0 01DB4DD0 120043A4 */  sh          $3, 0x12($2)
.L01DB4DD4_2F03D4:
/* 0090D4 01DB4DD4 01000224 */  addiu       $2, $0, 0x1
/* 0090D8 01DB4DD8 1C9D82AF */  sw          $2, -0x62E4($28)
/* 0090DC 01DB4DDC C09D80AF */  sw          $0, -0x6240($28)
/* 0090E0 01DB4DE0 C49D80AF */  sw          $0, -0x623C($28)
/* 0090E4 01DB4DE4 A0FF0224 */  addiu       $2, $0, -0x60
/* 0090E8 01DB4DE8 249D82AF */  sw          $2, -0x62DC($28)
/* 0090EC 01DB4DEC FC8A80AF */  sw          $0, -0x7504($28)
/* 0090F0 01DB4DF0 FC9D80AF */  sw          $0, -0x6204($28)
/* 0090F4 01DB4DF4 DC01023C */  lui         $2, %hi(LIT_4407)
/* 0090F8 01DB4DF8 882F4424 */  addiu       $4, $2, %lo(LIT_4407)
/* 0090FC 01DB4DFC A611040C */  jal         printf
/* 009100 01DB4E00 00000000 */   nop
/* 009104 01DB4E04 18090010 */  b           .L.L01DB7268_2F2868$b
/* 009108 01DB4E08 00000000 */   nop
jlabel .L01DB4E0C_2F040C
/* 00910C 01DB4E0C D501013C */  lui         $1, %hi(BtEventInfo + 0x98)
/* 009110 01DB4E10 D86720AC */  sw          $0, %lo(BtEventInfo + 0x98)($1)
/* 009114 01DB4E14 78ED060C */  jal         BtSystemScriptAfter__Fv
/* 009118 01DB4E18 00000000 */   nop
/* 00911C 01DB4E1C D501013C */  lui         $1, %hi(BtEventInfo + 0x9C)
/* 009120 01DB4E20 DC67228C */  lw          $2, %lo(BtEventInfo + 0x9C)($1)
/* 009124 01DB4E24 D501013C */  lui         $1, %hi(BtEventInfo + 0x2C)
/* 009128 01DB4E28 6C6722AC */  sw          $2, %lo(BtEventInfo + 0x2C)($1)
/* 00912C 01DB4E2C 90010224 */  addiu       $2, $0, 0x190
/* 009130 01DB4E30 FC9D82AF */  sw          $2, -0x6204($28)
/* 009134 01DB4E34 0C090010 */  b           .L.L01DB7268_2F2868$b
/* 009138 01DB4E38 00000000 */   nop
.L01DB4E3C_2F043C:
/* 00913C 01DB4E3C 104D070C */  jal         BtMiniItemSelect_Loop__Fv
/* 009140 01DB4E40 00000000 */   nop
/* 009144 01DB4E44 08094010 */  beqz        $2, .L.L01DB7268_2F2868$b
/* 009148 01DB4E48 00000000 */   nop
/* 00914C 01DB4E4C 91010224 */  addiu       $2, $0, 0x191
/* 009150 01DB4E50 FC9D82AF */  sw          $2, -0x6204($28)
/* 009154 01DB4E54 FFFF0224 */  addiu       $2, $0, -0x1
/* 009158 01DB4E58 EB01013C */  lui         $1, %hi(DngMes1 + 0x16BC)
/* 00915C 01DB4E5C DC7A22AC */  sw          $2, %lo(DngMes1 + 0x16BC)($1)
/* 009160 01DB4E60 EC01013C */  lui         $1, %hi(DngMes2 + 0x16BC)
/* 009164 01DB4E64 9C9222AC */  sw          $2, %lo(DngMes2 + 0x16BC)($1)
/* 009168 01DB4E68 EC01013C */  lui         $1, %hi(DngMesStb + 0x16BC)
/* 00916C 01DB4E6C 5CAA22AC */  sw          $2, %lo(DngMesStb + 0x16BC)($1)
/* 009170 01DB4E70 FD080010 */  b           .L.L01DB7268_2F2868$b
/* 009174 01DB4E74 00000000 */   nop
.L01DB4E78_2F0478:
/* 009178 01DB4E78 C49C858F */  lw          $5, -0x633C($28)
/* 00917C 01DB4E7C E09C848F */  lw          $4, -0x6320($28)
/* 009180 01DB4E80 480080AC */  sw          $0, 0x48($4)
/* 009184 01DB4E84 900080AC */  sw          $0, 0x90($4)
/* 009188 01DB4E88 28360070 */  paddub      $6, $0, $0
/* 00918C 01DB4E8C 09000010 */  b           .L01DB4EB4_2F04B4
/* 009190 01DB4E90 00000000 */   nop
.L01DB4E94_2F0494:
/* 009194 01DB4E94 00190600 */  sll         $3, $6, 4
/* 009198 01DB4E98 F001023C */  lui         $2, %hi(MonstorScriptBuffer)
/* 00919C 01DB4E9C E0664224 */  addiu       $2, $2, %lo(MonstorScriptBuffer)
/* 0091A0 01DB4EA0 21184300 */  addu        $3, $2, $3
/* 0091A4 01DB4EA4 80100600 */  sll         $2, $6, 2
/* 0091A8 01DB4EA8 21108200 */  addu        $2, $4, $2
/* 0091AC 01DB4EAC 000043AC */  sw          $3, 0x0($2)
/* 0091B0 01DB4EB0 0100C624 */  addiu       $6, $6, 0x1
.L01DB4EB4_2F04B4:
/* 0091B4 01DB4EB4 1000C228 */  slti        $2, $6, 0x10
/* 0091B8 01DB4EB8 F6FF4014 */  bnez        $2, .L01DB4E94_2F0494
/* 0091BC 01DB4EBC 00000000 */   nop
/* 0091C0 01DB4EC0 FFFF0224 */  addiu       $2, $0, -0x1
/* 0091C4 01DB4EC4 940082AC */  sw          $2, 0x94($4)
/* 0091C8 01DB4EC8 7C7E070C */  jal         CleanViewMonstor__12CMonstorUnitFi
/* 0091CC 01DB4ECC 00000000 */   nop
/* 0091D0 01DB4ED0 E899070C */  jal         BtSetEventExtendTable__Fv
/* 0091D4 01DB4ED4 00000000 */   nop
/* 0091D8 01DB4ED8 C49C828F */  lw          $2, -0x633C($28)
/* 0091DC 01DB4EDC 40004014 */  bnez        $2, .L01DB4FE0_2F05E0
/* 0091E0 01DB4EE0 00000000 */   nop
/* 0091E4 01DB4EE4 01000224 */  addiu       $2, $0, 0x1
/* 0091E8 01DB4EE8 C49C82AF */  sw          $2, -0x633C($28)
/* 0091EC 01DB4EEC DD01023C */  lui         $2, %hi(UraDungeonMap)
/* 0091F0 01DB4EF0 F0564224 */  addiu       $2, $2, %lo(UraDungeonMap)
/* 0091F4 01DB4EF4 C89C82AF */  sw          $2, -0x6338($28)
/* 0091F8 01DB4EF8 DF01023C */  lui         $2, %hi(UraEventMan)
/* 0091FC 01DB4EFC B05E4224 */  addiu       $2, $2, %lo(UraEventMan)
/* 009200 01DB4F00 D09C82AF */  sw          $2, -0x6330($28)
/* 009204 01DB4F04 C89C848F */  lw          $4, -0x6338($28)
/* 009208 01DB4F08 9423070C */  jal         RsetMimicEvent__11CDungeonMapFv
/* 00920C 01DB4F0C 00000000 */   nop
/* 009210 01DB4F10 EA01023C */  lui         $2, %hi(SubRandomItem)
/* 009214 01DB4F14 E07C4224 */  addiu       $2, $2, %lo(SubRandomItem)
/* 009218 01DB4F18 089D82AF */  sw          $2, -0x62F8($28)
/* 00921C 01DB4F1C E09C848F */  lw          $4, -0x6320($28)
/* 009220 01DB4F20 C49C858F */  lw          $5, -0x633C($28)
/* 009224 01DB4F24 7C7E070C */  jal         CleanViewMonstor__12CMonstorUnitFi
/* 009228 01DB4F28 00000000 */   nop
/* 00922C 01DB4F2C C49C858F */  lw          $5, -0x633C($28)
/* 009230 01DB4F30 E09C848F */  lw          $4, -0x6320($28)
/* 009234 01DB4F34 480080AC */  sw          $0, 0x48($4)
/* 009238 01DB4F38 900080AC */  sw          $0, 0x90($4)
/* 00923C 01DB4F3C 28360070 */  paddub      $6, $0, $0
/* 009240 01DB4F40 09000010 */  b           .L01DB4F68_2F0568
/* 009244 01DB4F44 00000000 */   nop
.L01DB4F48_2F0548:
/* 009248 01DB4F48 00190600 */  sll         $3, $6, 4
/* 00924C 01DB4F4C F001023C */  lui         $2, %hi(MonstorScriptBuffer)
/* 009250 01DB4F50 E0664224 */  addiu       $2, $2, %lo(MonstorScriptBuffer)
/* 009254 01DB4F54 21184300 */  addu        $3, $2, $3
/* 009258 01DB4F58 80100600 */  sll         $2, $6, 2
/* 00925C 01DB4F5C 21108200 */  addu        $2, $4, $2
/* 009260 01DB4F60 000043AC */  sw          $3, 0x0($2)
/* 009264 01DB4F64 0100C624 */  addiu       $6, $6, 0x1
.L01DB4F68_2F0568:
/* 009268 01DB4F68 1000C228 */  slti        $2, $6, 0x10
/* 00926C 01DB4F6C F6FF4014 */  bnez        $2, .L01DB4F48_2F0548
/* 009270 01DB4F70 00000000 */   nop
/* 009274 01DB4F74 FFFF0224 */  addiu       $2, $0, -0x1
/* 009278 01DB4F78 940082AC */  sw          $2, 0x94($4)
/* 00927C 01DB4F7C 7C7E070C */  jal         CleanViewMonstor__12CMonstorUnitFi
/* 009280 01DB4F80 00000000 */   nop
/* 009284 01DB4F84 E899070C */  jal         BtSetEventExtendTable__Fv
/* 009288 01DB4F88 00000000 */   nop
/* 00928C 01DB4F8C 01000424 */  addiu       $4, $0, 0x1
/* 009290 01DB4F90 CCE4760C */  jal         BtLoadMonstor__Fi
/* 009294 01DB4F94 00000000 */   nop
/* 009298 01DB4F98 E09C848F */  lw          $4, -0x6320($28)
/* 00929C 01DB4F9C DD01023C */  lui         $2, %hi(UraDungeonMap)
/* 0092A0 01DB4FA0 F0564524 */  addiu       $5, $2, %lo(UraDungeonMap)
/* 0092A4 01DB4FA4 08000624 */  addiu       $6, $0, 0x8
/* 0092A8 01DB4FA8 FFFF0724 */  addiu       $7, $0, -0x1
/* 0092AC 01DB4FAC 28460070 */  paddub      $8, $0, $0
/* 0092B0 01DB4FB0 F05F070C */  jal         ArrangementPos__12CMonstorUnitFP11CDungeonMapiii
/* 0092B4 01DB4FB4 00000000 */   nop
/* 0092B8 01DB4FB8 C89C848F */  lw          $4, -0x6338($28)
/* 0092BC 01DB4FBC 0100013C */  lui         $1, (0x10000 >> 16)
/* 0092C0 01DB4FC0 21088100 */  addu        $1, $4, $1
/* 0092C4 01DB4FC4 ECBD258C */  lw          $5, -0x4214($1)
/* 0092C8 01DB4FC8 3009070C */  jal         DrawMapCalc__11CDungeonMapFi
/* 0092CC 01DB4FCC 00000000 */   nop
/* 0092D0 01DB4FD0 01000224 */  addiu       $2, $0, 0x1
/* 0092D4 01DB4FD4 DC9C82AF */  sw          $2, -0x6324($28)
/* 0092D8 01DB4FD8 47000010 */  b           .L01DB50F8_2F06F8
/* 0092DC 01DB4FDC 00000000 */   nop
.L01DB4FE0_2F05E0:
/* 0092E0 01DB4FE0 C49C80AF */  sw          $0, -0x633C($28)
/* 0092E4 01DB4FE4 DC01023C */  lui         $2, %hi(MainDungeonMap)
/* 0092E8 01DB4FE8 E04B4224 */  addiu       $2, $2, %lo(MainDungeonMap)
/* 0092EC 01DB4FEC C89C82AF */  sw          $2, -0x6338($28)
/* 0092F0 01DB4FF0 DF01023C */  lui         $2, %hi(DngEventMan)
/* 0092F4 01DB4FF4 B0364224 */  addiu       $2, $2, %lo(DngEventMan)
/* 0092F8 01DB4FF8 D09C82AF */  sw          $2, -0x6330($28)
/* 0092FC 01DB4FFC E001023C */  lui         $2, %hi(MainMonstorUnit)
/* 009300 01DB5000 D0874224 */  addiu       $2, $2, %lo(MainMonstorUnit)
/* 009304 01DB5004 E09C82AF */  sw          $2, -0x6320($28)
/* 009308 01DB5008 C89C848F */  lw          $4, -0x6338($28)
/* 00930C 01DB500C 9423070C */  jal         RsetMimicEvent__11CDungeonMapFv
/* 009310 01DB5010 00000000 */   nop
/* 009314 01DB5014 EA01023C */  lui         $2, %hi(MainRandomItem)
/* 009318 01DB5018 C0764224 */  addiu       $2, $2, %lo(MainRandomItem)
/* 00931C 01DB501C 089D82AF */  sw          $2, -0x62F8($28)
/* 009320 01DB5020 E001023C */  lui         $2, %hi(MainMonstorUnit)
/* 009324 01DB5024 D0874424 */  addiu       $4, $2, %lo(MainMonstorUnit)
/* 009328 01DB5028 C49C858F */  lw          $5, -0x633C($28)
/* 00932C 01DB502C 7C7E070C */  jal         CleanViewMonstor__12CMonstorUnitFi
/* 009330 01DB5030 00000000 */   nop
/* 009334 01DB5034 C49C858F */  lw          $5, -0x633C($28)
/* 009338 01DB5038 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x48)
/* 00933C 01DB503C 188820AC */  sw          $0, %lo(MainMonstorUnit + 0x48)($1)
/* 009340 01DB5040 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x90)
/* 009344 01DB5044 608820AC */  sw          $0, %lo(MainMonstorUnit + 0x90)($1)
/* 009348 01DB5048 28360070 */  paddub      $6, $0, $0
/* 00934C 01DB504C 0B000010 */  b           .L01DB507C_2F067C
/* 009350 01DB5050 00000000 */   nop
.L01DB5054_2F0654:
/* 009354 01DB5054 00190600 */  sll         $3, $6, 4
/* 009358 01DB5058 F001023C */  lui         $2, %hi(MonstorScriptBuffer)
/* 00935C 01DB505C E0664224 */  addiu       $2, $2, %lo(MonstorScriptBuffer)
/* 009360 01DB5060 21204300 */  addu        $4, $2, $3
/* 009364 01DB5064 80180600 */  sll         $3, $6, 2
/* 009368 01DB5068 E001023C */  lui         $2, %hi(MainMonstorUnit)
/* 00936C 01DB506C D0874224 */  addiu       $2, $2, %lo(MainMonstorUnit)
/* 009370 01DB5070 21104300 */  addu        $2, $2, $3
/* 009374 01DB5074 000044AC */  sw          $4, 0x0($2)
/* 009378 01DB5078 0100C624 */  addiu       $6, $6, 0x1
.L01DB507C_2F067C:
/* 00937C 01DB507C 1000C228 */  slti        $2, $6, 0x10
/* 009380 01DB5080 F4FF4014 */  bnez        $2, .L01DB5054_2F0654
/* 009384 01DB5084 00000000 */   nop
/* 009388 01DB5088 FFFF0224 */  addiu       $2, $0, -0x1
/* 00938C 01DB508C E001013C */  lui         $1, %hi(MainMonstorUnit + 0x94)
/* 009390 01DB5090 648822AC */  sw          $2, %lo(MainMonstorUnit + 0x94)($1)
/* 009394 01DB5094 E001023C */  lui         $2, %hi(MainMonstorUnit)
/* 009398 01DB5098 D0874424 */  addiu       $4, $2, %lo(MainMonstorUnit)
/* 00939C 01DB509C 7C7E070C */  jal         CleanViewMonstor__12CMonstorUnitFi
/* 0093A0 01DB50A0 00000000 */   nop
/* 0093A4 01DB50A4 E899070C */  jal         BtSetEventExtendTable__Fv
/* 0093A8 01DB50A8 00000000 */   nop
/* 0093AC 01DB50AC 28260070 */  paddub      $4, $0, $0
/* 0093B0 01DB50B0 CCE4760C */  jal         BtLoadMonstor__Fi
/* 0093B4 01DB50B4 00000000 */   nop
/* 0093B8 01DB50B8 E001023C */  lui         $2, %hi(MainMonstorUnit)
/* 0093BC 01DB50BC D0874424 */  addiu       $4, $2, %lo(MainMonstorUnit)
/* 0093C0 01DB50C0 DC01023C */  lui         $2, %hi(MainDungeonMap)
/* 0093C4 01DB50C4 E04B4524 */  addiu       $5, $2, %lo(MainDungeonMap)
/* 0093C8 01DB50C8 0F000624 */  addiu       $6, $0, 0xF
/* 0093CC 01DB50CC FFFF0724 */  addiu       $7, $0, -0x1
/* 0093D0 01DB50D0 28460070 */  paddub      $8, $0, $0
/* 0093D4 01DB50D4 F05F070C */  jal         ArrangementPos__12CMonstorUnitFP11CDungeonMapiii
/* 0093D8 01DB50D8 00000000 */   nop
/* 0093DC 01DB50DC C89C848F */  lw          $4, -0x6338($28)
/* 0093E0 01DB50E0 0100013C */  lui         $1, (0x10000 >> 16)
/* 0093E4 01DB50E4 21088100 */  addu        $1, $4, $1
/* 0093E8 01DB50E8 ECBD258C */  lw          $5, -0x4214($1)
/* 0093EC 01DB50EC 3009070C */  jal         DrawMapCalc__11CDungeonMapFi
/* 0093F0 01DB50F0 00000000 */   nop
/* 0093F4 01DB50F4 DC9C80AF */  sw          $0, -0x6324($28)
.L01DB50F8_2F06F8:
/* 0093F8 01DB50F8 91010224 */  addiu       $2, $0, 0x191
/* 0093FC 01DB50FC FC9D82AF */  sw          $2, -0x6204($28)
/* 009400 01DB5100 59080010 */  b           .L.L01DB7268_2F2868$b
/* 009404 01DB5104 00000000 */   nop
.L01DB5108_2F0708:
/* 009408 01DB5108 01000224 */  addiu       $2, $0, 0x1
/* 00940C 01DB510C 749D82AF */  sw          $2, -0x628C($28)
/* 009410 01DB5110 EC9C82AF */  sw          $2, -0x6314($28)
/* 009414 01DB5114 E49C82AF */  sw          $2, -0x631C($28)
/* 009418 01DB5118 D501013C */  lui         $1, %hi(DebugStatus)
/* 00941C 01DB511C 606422AC */  sw          $2, %lo(DebugStatus)($1)
/* 009420 01DB5120 CC01023C */  lui         $2, %hi(GamePad)
/* 009424 01DB5124 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 009428 01DB5128 0FF00534 */  ori         $5, $0, 0xF00F
/* 00942C 01DB512C 14000624 */  addiu       $6, $0, 0x14
/* 009430 01DB5130 03000724 */  addiu       $7, $0, 0x3
/* 009434 01DB5134 58AD040C */  jal         SetAutoRepeat__8CGamePadFiii
/* 009438 01DB5138 00000000 */   nop
/* 00943C 01DB513C FC9D828F */  lw          $2, -0x6204($28)
/* 009440 01DB5140 01004224 */  addiu       $2, $2, 0x1
/* 009444 01DB5144 FC9D82AF */  sw          $2, -0x6204($28)
/* 009448 01DB5148 47080010 */  b           .L.L01DB7268_2F2868$b
/* 00944C 01DB514C 00000000 */   nop
.L01DB5150_2F0750:
/* 009450 01DB5150 F0D1060C */  jal         DebugInfomationIF__Fv
/* 009454 01DB5154 00000000 */   nop
/* 009458 01DB5158 78000324 */  addiu       $3, $0, 0x78
/* 00945C 01DB515C 88004310 */  beq         $2, $3, .L01DB5380_2F0980
/* 009460 01DB5160 00000000 */   nop
/* 009464 01DB5164 5A000324 */  addiu       $3, $0, 0x5A
/* 009468 01DB5168 79004310 */  beq         $2, $3, .L01DB5350_2F0950
/* 00946C 01DB516C 00000000 */   nop
/* 009470 01DB5170 50000324 */  addiu       $3, $0, 0x50
/* 009474 01DB5174 4B004310 */  beq         $2, $3, .L01DB52A4_2F08A4
/* 009478 01DB5178 00000000 */   nop
/* 00947C 01DB517C 01000324 */  addiu       $3, $0, 0x1
/* 009480 01DB5180 3B004310 */  beq         $2, $3, .L01DB5270_2F0870
/* 009484 01DB5184 00000000 */   nop
/* 009488 01DB5188 8C000324 */  addiu       $3, $0, 0x8C
/* 00948C 01DB518C 2E004310 */  beq         $2, $3, .L01DB5248_2F0848
/* 009490 01DB5190 00000000 */   nop
/* 009494 01DB5194 64000324 */  addiu       $3, $0, 0x64
/* 009498 01DB5198 20004310 */  beq         $2, $3, .L01DB521C_2F081C
/* 00949C 01DB519C 00000000 */   nop
/* 0094A0 01DB51A0 3C000324 */  addiu       $3, $0, 0x3C
/* 0094A4 01DB51A4 12004310 */  beq         $2, $3, .L01DB51F0_2F07F0
/* 0094A8 01DB51A8 00000000 */   nop
/* 0094AC 01DB51AC 28000324 */  addiu       $3, $0, 0x28
/* 0094B0 01DB51B0 03004310 */  beq         $2, $3, .L01DB51C0_2F07C0
/* 0094B4 01DB51B4 00000000 */   nop
/* 0094B8 01DB51B8 2B080010 */  b           .L.L01DB7268_2F2868$b
/* 0094BC 01DB51BC 00000000 */   nop
.L01DB51C0_2F07C0:
/* 0094C0 01DB51C0 CC01023C */  lui         $2, %hi(GamePad)
/* 0094C4 01DB51C4 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0094C8 01DB51C8 3CAE040C */  jal         AutoRepeatOff__8CGamePadFv
/* 0094CC 01DB51CC 00000000 */   nop
/* 0094D0 01DB51D0 749D80AF */  sw          $0, -0x628C($28)
/* 0094D4 01DB51D4 EC9C80AF */  sw          $0, -0x6314($28)
/* 0094D8 01DB51D8 E49C80AF */  sw          $0, -0x631C($28)
/* 0094DC 01DB51DC FC9D828F */  lw          $2, -0x6204($28)
/* 0094E0 01DB51E0 01004224 */  addiu       $2, $2, 0x1
/* 0094E4 01DB51E4 FC9D82AF */  sw          $2, -0x6204($28)
/* 0094E8 01DB51E8 1F080010 */  b           .L.L01DB7268_2F2868$b
/* 0094EC 01DB51EC 00000000 */   nop
.L01DB51F0_2F07F0:
/* 0094F0 01DB51F0 CC01023C */  lui         $2, %hi(GamePad)
/* 0094F4 01DB51F4 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0094F8 01DB51F8 3CAE040C */  jal         AutoRepeatOff__8CGamePadFv
/* 0094FC 01DB51FC 00000000 */   nop
/* 009500 01DB5200 749D80AF */  sw          $0, -0x628C($28)
/* 009504 01DB5204 EC9C80AF */  sw          $0, -0x6314($28)
/* 009508 01DB5208 E49C80AF */  sw          $0, -0x631C($28)
/* 00950C 01DB520C E3000224 */  addiu       $2, $0, 0xE3
/* 009510 01DB5210 FC9D82AF */  sw          $2, -0x6204($28)
/* 009514 01DB5214 14080010 */  b           .L.L01DB7268_2F2868$b
/* 009518 01DB5218 00000000 */   nop
.L01DB521C_2F081C:
/* 00951C 01DB521C CC01023C */  lui         $2, %hi(GamePad)
/* 009520 01DB5220 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 009524 01DB5224 3CAE040C */  jal         AutoRepeatOff__8CGamePadFv
/* 009528 01DB5228 00000000 */   nop
/* 00952C 01DB522C 749D80AF */  sw          $0, -0x628C($28)
/* 009530 01DB5230 EC9C80AF */  sw          $0, -0x6314($28)
/* 009534 01DB5234 E49C80AF */  sw          $0, -0x631C($28)
/* 009538 01DB5238 E4000224 */  addiu       $2, $0, 0xE4
/* 00953C 01DB523C FC9D82AF */  sw          $2, -0x6204($28)
/* 009540 01DB5240 09080010 */  b           .L.L01DB7268_2F2868$b
/* 009544 01DB5244 00000000 */   nop
.L01DB5248_2F0848:
/* 009548 01DB5248 CC01023C */  lui         $2, %hi(GamePad)
/* 00954C 01DB524C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 009550 01DB5250 3CAE040C */  jal         AutoRepeatOff__8CGamePadFv
/* 009554 01DB5254 00000000 */   nop
/* 009558 01DB5258 749D80AF */  sw          $0, -0x628C($28)
/* 00955C 01DB525C EC9C80AF */  sw          $0, -0x6314($28)
/* 009560 01DB5260 E49C80AF */  sw          $0, -0x631C($28)
/* 009564 01DB5264 FC9D80AF */  sw          $0, -0x6204($28)
/* 009568 01DB5268 FF070010 */  b           .L.L01DB7268_2F2868$b
/* 00956C 01DB526C 00000000 */   nop
.L01DB5270_2F0870:
/* 009570 01DB5270 CC01023C */  lui         $2, %hi(GamePad)
/* 009574 01DB5274 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 009578 01DB5278 3CAE040C */  jal         AutoRepeatOff__8CGamePadFv
/* 00957C 01DB527C 00000000 */   nop
/* 009580 01DB5280 749D80AF */  sw          $0, -0x628C($28)
/* 009584 01DB5284 EC9C80AF */  sw          $0, -0x6314($28)
/* 009588 01DB5288 E49C80AF */  sw          $0, -0x631C($28)
/* 00958C 01DB528C D501013C */  lui         $1, %hi(DebugStatus + 0x40)
/* 009590 01DB5290 A064228C */  lw          $2, %lo(DebugStatus + 0x40)($1)
/* 009594 01DB5294 DC9C82AF */  sw          $2, -0x6324($28)
/* 009598 01DB5298 FC9D80AF */  sw          $0, -0x6204($28)
/* 00959C 01DB529C F2070010 */  b           .L.L01DB7268_2F2868$b
/* 0095A0 01DB52A0 00000000 */   nop
.L01DB52A4_2F08A4:
/* 0095A4 01DB52A4 CC01023C */  lui         $2, %hi(GamePad)
/* 0095A8 01DB52A8 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0095AC 01DB52AC 3CAE040C */  jal         AutoRepeatOff__8CGamePadFv
/* 0095B0 01DB52B0 00000000 */   nop
/* 0095B4 01DB52B4 28860070 */  paddub      $16, $0, $0
/* 0095B8 01DB52B8 1C000010 */  b           .L01DB532C_2F092C
/* 0095BC 01DB52BC 00000000 */   nop
.L01DB52C0_2F08C0:
/* 0095C0 01DB52C0 C89C838F */  lw          $3, -0x6338($28)
/* 0095C4 01DB52C4 40111000 */  sll         $2, $16, 5
/* 0095C8 01DB52C8 21104300 */  addu        $2, $2, $3
/* 0095CC 01DB52CC 0100013C */  lui         $1, (0x10000 >> 16)
/* 0095D0 01DB52D0 21084100 */  addu        $1, $2, $1
/* 0095D4 01DB52D4 90BC258C */  lw          $5, -0x4370($1)
/* 0095D8 01DB52D8 FFFF0224 */  addiu       $2, $0, -0x1
/* 0095DC 01DB52DC 1200A210 */  beq         $5, $2, .L01DB5328_2F0928
/* 0095E0 01DB52E0 00000000 */   nop
/* 0095E4 01DB52E4 789C868F */  lw          $6, -0x6388($28)
/* 0095E8 01DB52E8 A49D878F */  lw          $7, -0x625C($28)
/* 0095EC 01DB52EC 00110700 */  sll         $2, $7, 4
/* 0095F0 01DB52F0 23184700 */  subu        $3, $2, $7
/* 0095F4 01DB52F4 80100300 */  sll         $2, $3, 2
/* 0095F8 01DB52F8 21106200 */  addu        $2, $3, $2
/* 0095FC 01DB52FC 00110200 */  sll         $2, $2, 4
/* 009600 01DB5300 21184600 */  addu        $3, $2, $6
/* 009604 01DB5304 40100500 */  sll         $2, $5, 1
/* 009608 01DB5308 21104500 */  addu        $2, $2, $5
/* 00960C 01DB530C 80100200 */  sll         $2, $2, 2
/* 009610 01DB5310 21104300 */  addu        $2, $2, $3
/* 009614 01DB5314 7820448C */  lw          $4, 0x2078($2)
/* 009618 01DB5318 0200C880 */  lb          $8, 0x2($6)
/* 00961C 01DB531C 1C8D868F */  lw          $6, -0x72E4($28)
/* 009620 01DB5320 1CDD060C */  jal         getAtraToSaveData__FiiP9CSaveDataii
/* 009624 01DB5324 00000000 */   nop
.L01DB5328_2F0928:
/* 009628 01DB5328 01001026 */  addiu       $16, $16, 0x1
.L01DB532C_2F092C:
/* 00962C 01DB532C 0800022A */  slti        $2, $16, 0x8
/* 009630 01DB5330 E3FF4014 */  bnez        $2, .L01DB52C0_2F08C0
/* 009634 01DB5334 00000000 */   nop
/* 009638 01DB5338 749D80AF */  sw          $0, -0x628C($28)
/* 00963C 01DB533C EC9C80AF */  sw          $0, -0x6314($28)
/* 009640 01DB5340 E49C80AF */  sw          $0, -0x631C($28)
/* 009644 01DB5344 FC9D80AF */  sw          $0, -0x6204($28)
/* 009648 01DB5348 C7070010 */  b           .L.L01DB7268_2F2868$b
/* 00964C 01DB534C 00000000 */   nop
.L01DB5350_2F0950:
/* 009650 01DB5350 CC01023C */  lui         $2, %hi(GamePad)
/* 009654 01DB5354 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 009658 01DB5358 3CAE040C */  jal         AutoRepeatOff__8CGamePadFv
/* 00965C 01DB535C 00000000 */   nop
/* 009660 01DB5360 749D80AF */  sw          $0, -0x628C($28)
/* 009664 01DB5364 EC9C80AF */  sw          $0, -0x6314($28)
/* 009668 01DB5368 E49C80AF */  sw          $0, -0x631C($28)
/* 00966C 01DB536C FC9D828F */  lw          $2, -0x6204($28)
/* 009670 01DB5370 01004224 */  addiu       $2, $2, 0x1
/* 009674 01DB5374 FC9D82AF */  sw          $2, -0x6204($28)
/* 009678 01DB5378 BB070010 */  b           .L.L01DB7268_2F2868$b
/* 00967C 01DB537C 00000000 */   nop
.L01DB5380_2F0980:
/* 009680 01DB5380 CC01023C */  lui         $2, %hi(GamePad)
/* 009684 01DB5384 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 009688 01DB5388 3CAE040C */  jal         AutoRepeatOff__8CGamePadFv
/* 00968C 01DB538C 00000000 */   nop
/* 009690 01DB5390 D501013C */  lui         $1, %hi(DebugStatus + 0x44)
/* 009694 01DB5394 A464248C */  lw          $4, %lo(DebugStatus + 0x44)($1)
/* 009698 01DB5398 0600812C */  sltiu       $1, $4, 0x6
/* 00969C 01DB539C 2B002010 */  beqz        $1, .L01DB544C_2F0A4C
/* 0096A0 01DB53A0 00000000 */   nop
/* 0096A4 01DB53A4 DC01023C */  lui         $2, %hi(LIT_4417)
/* 0096A8 01DB53A8 F02F4324 */  addiu       $3, $2, %lo(LIT_4417)
/* 0096AC 01DB53AC 80100400 */  sll         $2, $4, 2
/* 0096B0 01DB53B0 21104300 */  addu        $2, $2, $3
/* 0096B4 01DB53B4 0000428C */  lw          $2, 0x0($2)
/* 0096B8 01DB53B8 08004000 */  jr          $2
/* 0096BC 01DB53BC 00000000 */   nop
jlabel .L01DB53C0_2F09C0
/* 0096C0 01DB53C0 789C838F */  lw          $3, -0x6388($28)
/* 0096C4 01DB53C4 04006280 */  lb          $2, 0x4($3)
/* 0096C8 01DB53C8 80100200 */  sll         $2, $2, 2
/* 0096CC 01DB53CC 21104300 */  addu        $2, $2, $3
/* 0096D0 01DB53D0 C84240AC */  sw          $0, 0x42C8($2)
/* 0096D4 01DB53D4 789C838F */  lw          $3, -0x6388($28)
/* 0096D8 01DB53D8 04006280 */  lb          $2, 0x4($3)
/* 0096DC 01DB53DC 40100200 */  sll         $2, $2, 1
/* 0096E0 01DB53E0 21104300 */  addu        $2, $2, $3
/* 0096E4 01DB53E4 E04240A4 */  sh          $0, 0x42E0($2)
/* 0096E8 01DB53E8 18000010 */  b           .L01DB544C_2F0A4C
/* 0096EC 01DB53EC 00000000 */   nop
jlabel .L01DB53F0_2F09F0
/* 0096F0 01DB53F0 04000424 */  addiu       $4, $0, 0x4
/* 0096F4 01DB53F4 ECC6060C */  jal         BtSetStatusErr__Fi
/* 0096F8 01DB53F8 00000000 */   nop
/* 0096FC 01DB53FC 13000010 */  b           .L01DB544C_2F0A4C
/* 009700 01DB5400 00000000 */   nop
jlabel .L01DB5404_2F0A04
/* 009704 01DB5404 08000424 */  addiu       $4, $0, 0x8
/* 009708 01DB5408 ECC6060C */  jal         BtSetStatusErr__Fi
/* 00970C 01DB540C 00000000 */   nop
/* 009710 01DB5410 0E000010 */  b           .L01DB544C_2F0A4C
/* 009714 01DB5414 00000000 */   nop
jlabel .L01DB5418_2F0A18
/* 009718 01DB5418 10000424 */  addiu       $4, $0, 0x10
/* 00971C 01DB541C ECC6060C */  jal         BtSetStatusErr__Fi
/* 009720 01DB5420 00000000 */   nop
/* 009724 01DB5424 09000010 */  b           .L01DB544C_2F0A4C
/* 009728 01DB5428 00000000 */   nop
jlabel .L01DB542C_2F0A2C
/* 00972C 01DB542C 20000424 */  addiu       $4, $0, 0x20
/* 009730 01DB5430 ECC6060C */  jal         BtSetStatusErr__Fi
/* 009734 01DB5434 00000000 */   nop
/* 009738 01DB5438 04000010 */  b           .L01DB544C_2F0A4C
/* 00973C 01DB543C 00000000 */   nop
jlabel .L01DB5440_2F0A40
/* 009740 01DB5440 40000424 */  addiu       $4, $0, 0x40
/* 009744 01DB5444 ECC6060C */  jal         BtSetStatusErr__Fi
/* 009748 01DB5448 00000000 */   nop
.L01DB544C_2F0A4C:
/* 00974C 01DB544C 749D80AF */  sw          $0, -0x628C($28)
/* 009750 01DB5450 EC9C80AF */  sw          $0, -0x6314($28)
/* 009754 01DB5454 E49C80AF */  sw          $0, -0x631C($28)
/* 009758 01DB5458 FC9D80AF */  sw          $0, -0x6204($28)
/* 00975C 01DB545C 82070010 */  b           .L.L01DB7268_2F2868$b
/* 009760 01DB5460 00000000 */   nop
.L01DB5464_2F0A64:
/* 009764 01DB5464 D501013C */  lui         $1, %hi(DebugStatus + 0x2C)
/* 009768 01DB5468 8C64228C */  lw          $2, %lo(DebugStatus + 0x2C)($1)
/* 00976C 01DB546C D501013C */  lui         $1, %hi(BtEventInfo + 0x2C)
/* 009770 01DB5470 6C6722AC */  sw          $2, %lo(BtEventInfo + 0x2C)($1)
/* 009774 01DB5474 D501013C */  lui         $1, %hi(DebugStatus + 0x30)
/* 009778 01DB5478 9064228C */  lw          $2, %lo(DebugStatus + 0x30)($1)
/* 00977C 01DB547C D501013C */  lui         $1, %hi(BtEventInfo + 0x34)
/* 009780 01DB5480 746722AC */  sw          $2, %lo(BtEventInfo + 0x34)($1)
/* 009784 01DB5484 D501013C */  lui         $1, %hi(BtEventInfo + 0x24)
/* 009788 01DB5488 646720AC */  sw          $0, %lo(BtEventInfo + 0x24)($1)
/* 00978C 01DB548C A49D848F */  lw          $4, -0x625C($28)
/* 009790 01DB5490 98EC060C */  jal         BtSystemScriptLoad__Fi
/* 009794 01DB5494 00000000 */   nop
/* 009798 01DB5498 90010224 */  addiu       $2, $0, 0x190
/* 00979C 01DB549C FC9D82AF */  sw          $2, -0x6204($28)
/* 0097A0 01DB54A0 71070010 */  b           .L.L01DB7268_2F2868$b
/* 0097A4 01DB54A4 00000000 */   nop
.L01DB54A8_2F0AA8:
/* 0097A8 01DB54A8 C49C858F */  lw          $5, -0x633C($28)
/* 0097AC 01DB54AC E09C848F */  lw          $4, -0x6320($28)
/* 0097B0 01DB54B0 480080AC */  sw          $0, 0x48($4)
/* 0097B4 01DB54B4 900080AC */  sw          $0, 0x90($4)
/* 0097B8 01DB54B8 28360070 */  paddub      $6, $0, $0
/* 0097BC 01DB54BC 09000010 */  b           .L01DB54E4_2F0AE4
/* 0097C0 01DB54C0 00000000 */   nop
.L01DB54C4_2F0AC4:
/* 0097C4 01DB54C4 00190600 */  sll         $3, $6, 4
/* 0097C8 01DB54C8 F001023C */  lui         $2, %hi(MonstorScriptBuffer)
/* 0097CC 01DB54CC E0664224 */  addiu       $2, $2, %lo(MonstorScriptBuffer)
/* 0097D0 01DB54D0 21184300 */  addu        $3, $2, $3
/* 0097D4 01DB54D4 80100600 */  sll         $2, $6, 2
/* 0097D8 01DB54D8 21108200 */  addu        $2, $4, $2
/* 0097DC 01DB54DC 000043AC */  sw          $3, 0x0($2)
/* 0097E0 01DB54E0 0100C624 */  addiu       $6, $6, 0x1
.L01DB54E4_2F0AE4:
/* 0097E4 01DB54E4 1000C228 */  slti        $2, $6, 0x10
/* 0097E8 01DB54E8 F6FF4014 */  bnez        $2, .L01DB54C4_2F0AC4
/* 0097EC 01DB54EC 00000000 */   nop
/* 0097F0 01DB54F0 FFFF0224 */  addiu       $2, $0, -0x1
/* 0097F4 01DB54F4 940082AC */  sw          $2, 0x94($4)
/* 0097F8 01DB54F8 7C7E070C */  jal         CleanViewMonstor__12CMonstorUnitFi
/* 0097FC 01DB54FC 00000000 */   nop
/* 009800 01DB5500 E899070C */  jal         BtSetEventExtendTable__Fv
/* 009804 01DB5504 00000000 */   nop
/* 009808 01DB5508 28260070 */  paddub      $4, $0, $0
/* 00980C 01DB550C CCE4760C */  jal         BtLoadMonstor__Fi
/* 009810 01DB5510 00000000 */   nop
/* 009814 01DB5514 E09C848F */  lw          $4, -0x6320($28)
/* 009818 01DB5518 C49C858F */  lw          $5, -0x633C($28)
/* 00981C 01DB551C 7C7E070C */  jal         CleanViewMonstor__12CMonstorUnitFi
/* 009820 01DB5520 00000000 */   nop
/* 009824 01DB5524 E09C848F */  lw          $4, -0x6320($28)
/* 009828 01DB5528 C89C858F */  lw          $5, -0x6338($28)
/* 00982C 01DB552C D501013C */  lui         $1, %hi(DebugStatus + 0x34)
/* 009830 01DB5530 9464268C */  lw          $6, %lo(DebugStatus + 0x34)($1)
/* 009834 01DB5534 FFFF0724 */  addiu       $7, $0, -0x1
/* 009838 01DB5538 28460070 */  paddub      $8, $0, $0
/* 00983C 01DB553C F05F070C */  jal         ArrangementPos__12CMonstorUnitFP11CDungeonMapiii
/* 009840 01DB5540 00000000 */   nop
/* 009844 01DB5544 FC9D80AF */  sw          $0, -0x6204($28)
/* 009848 01DB5548 47070010 */  b           .L.L01DB7268_2F2868$b
/* 00984C 01DB554C 00000000 */   nop
.L01DB5550_2F0B50:
/* 009850 01DB5550 C49C858F */  lw          $5, -0x633C($28)
/* 009854 01DB5554 E09C848F */  lw          $4, -0x6320($28)
/* 009858 01DB5558 480080AC */  sw          $0, 0x48($4)
/* 00985C 01DB555C 900080AC */  sw          $0, 0x90($4)
/* 009860 01DB5560 28360070 */  paddub      $6, $0, $0
/* 009864 01DB5564 09000010 */  b           .L01DB558C_2F0B8C
/* 009868 01DB5568 00000000 */   nop
.L01DB556C_2F0B6C:
/* 00986C 01DB556C 00190600 */  sll         $3, $6, 4
/* 009870 01DB5570 F001023C */  lui         $2, %hi(MonstorScriptBuffer)
/* 009874 01DB5574 E0664224 */  addiu       $2, $2, %lo(MonstorScriptBuffer)
/* 009878 01DB5578 21184300 */  addu        $3, $2, $3
/* 00987C 01DB557C 80100600 */  sll         $2, $6, 2
/* 009880 01DB5580 21108200 */  addu        $2, $4, $2
/* 009884 01DB5584 000043AC */  sw          $3, 0x0($2)
/* 009888 01DB5588 0100C624 */  addiu       $6, $6, 0x1
.L01DB558C_2F0B8C:
/* 00988C 01DB558C 1000C228 */  slti        $2, $6, 0x10
/* 009890 01DB5590 F6FF4014 */  bnez        $2, .L01DB556C_2F0B6C
/* 009894 01DB5594 00000000 */   nop
/* 009898 01DB5598 FFFF0224 */  addiu       $2, $0, -0x1
/* 00989C 01DB559C 940082AC */  sw          $2, 0x94($4)
/* 0098A0 01DB55A0 7C7E070C */  jal         CleanViewMonstor__12CMonstorUnitFi
/* 0098A4 01DB55A4 00000000 */   nop
/* 0098A8 01DB55A8 E899070C */  jal         BtSetEventExtendTable__Fv
/* 0098AC 01DB55AC 00000000 */   nop
/* 0098B0 01DB55B0 28260070 */  paddub      $4, $0, $0
/* 0098B4 01DB55B4 CCE4760C */  jal         BtLoadMonstor__Fi
/* 0098B8 01DB55B8 00000000 */   nop
/* 0098BC 01DB55BC E09C848F */  lw          $4, -0x6320($28)
/* 0098C0 01DB55C0 C49C858F */  lw          $5, -0x633C($28)
/* 0098C4 01DB55C4 7C7E070C */  jal         CleanViewMonstor__12CMonstorUnitFi
/* 0098C8 01DB55C8 00000000 */   nop
/* 0098CC 01DB55CC E09C848F */  lw          $4, -0x6320($28)
/* 0098D0 01DB55D0 C89C858F */  lw          $5, -0x6338($28)
/* 0098D4 01DB55D4 D501013C */  lui         $1, %hi(DebugStatus + 0x3C)
/* 0098D8 01DB55D8 9C64268C */  lw          $6, %lo(DebugStatus + 0x3C)($1)
/* 0098DC 01DB55DC D501013C */  lui         $1, %hi(DebugStatus + 0x38)
/* 0098E0 01DB55E0 9864278C */  lw          $7, %lo(DebugStatus + 0x38)($1)
/* 0098E4 01DB55E4 28460070 */  paddub      $8, $0, $0
/* 0098E8 01DB55E8 F05F070C */  jal         ArrangementPos__12CMonstorUnitFP11CDungeonMapiii
/* 0098EC 01DB55EC 00000000 */   nop
/* 0098F0 01DB55F0 FC9D80AF */  sw          $0, -0x6204($28)
/* 0098F4 01DB55F4 1C070010 */  b           .L.L01DB7268_2F2868$b
/* 0098F8 01DB55F8 00000000 */   nop
.L01DB55FC_2F0BFC:
/* 0098FC 01DB55FC CC01023C */  lui         $2, %hi(GamePad)
/* 009900 01DB5600 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 009904 01DB5604 00080524 */  addiu       $5, $0, 0x800
/* 009908 01DB5608 1CAE040C */  jal         Down__8CGamePadFi
/* 00990C 01DB560C 00000000 */   nop
/* 009910 01DB5610 15074010 */  beqz        $2, .L.L01DB7268_2F2868$b
/* 009914 01DB5614 00000000 */   nop
/* 009918 01DB5618 749D80AF */  sw          $0, -0x628C($28)
/* 00991C 01DB561C D49D80AF */  sw          $0, -0x622C($28)
/* 009920 01DB5620 EC9C80AF */  sw          $0, -0x6314($28)
/* 009924 01DB5624 E49C80AF */  sw          $0, -0x631C($28)
/* 009928 01DB5628 01000424 */  addiu       $4, $0, 0x1
/* 00992C 01DB562C FFFF0524 */  addiu       $5, $0, -0x1
/* 009930 01DB5630 28360070 */  paddub      $6, $0, $0
/* 009934 01DB5634 AC69050C */  jal         SndSePlay__Fiii
/* 009938 01DB5638 00000000 */   nop
/* 00993C 01DB563C 01000424 */  addiu       $4, $0, 0x1
/* 009940 01DB5640 C803050C */  jal         PlayTimeCountFlag__Fi
/* 009944 01DB5644 00000000 */   nop
/* 009948 01DB5648 B49C828F */  lw          $2, -0x634C($28)
/* 00994C 01DB564C 05004010 */  beqz        $2, .L01DB5664_2F0C64
/* 009950 01DB5650 00000000 */   nop
/* 009954 01DB5654 0A000224 */  addiu       $2, $0, 0xA
/* 009958 01DB5658 FC9D82AF */  sw          $2, -0x6204($28)
/* 00995C 01DB565C 02070010 */  b           .L.L01DB7268_2F2868$b
/* 009960 01DB5660 00000000 */   nop
.L01DB5664_2F0C64:
/* 009964 01DB5664 FC9D80AF */  sw          $0, -0x6204($28)
/* 009968 01DB5668 FF060010 */  b           .L.L01DB7268_2F2868$b
/* 00996C 01DB566C 00000000 */   nop
.L01DB5670_2F0C70:
/* 009970 01DB5670 00608044 */  mtc1        $0, $f12
/* 009974 01DB5674 DC01023C */  lui         $2, %hi(DispFade__3)
/* 009978 01DB5678 D04B4424 */  addiu       $4, $2, %lo(DispFade__3)
/* 00997C 01DB567C 94F9040C */  jal         FadeInit__9CDispCtrlFf
/* 009980 01DB5680 00000000 */   nop
/* 009984 01DB5684 0041023C */  lui         $2, (0x41000000 >> 16)
/* 009988 01DB5688 00608244 */  mtc1        $2, $f12
/* 00998C 01DB568C DC01023C */  lui         $2, %hi(DispFade__3)
/* 009990 01DB5690 D04B4424 */  addiu       $4, $2, %lo(DispFade__3)
/* 009994 01DB5694 84F9040C */  jal         FadeOutStart__9CDispCtrlFf
/* 009998 01DB5698 00000000 */   nop
/* 00999C 01DB569C 5CFA760C */  jal         autoCamTrial__Fv
/* 0099A0 01DB56A0 00000000 */   nop
/* 0099A4 01DB56A4 FC9D828F */  lw          $2, -0x6204($28)
/* 0099A8 01DB56A8 01004224 */  addiu       $2, $2, 0x1
/* 0099AC 01DB56AC FC9D82AF */  sw          $2, -0x6204($28)
/* 0099B0 01DB56B0 ED060010 */  b           .L.L01DB7268_2F2868$b
/* 0099B4 01DB56B4 00000000 */   nop
.L01DB56B8_2F0CB8:
/* 0099B8 01DB56B8 5CFA760C */  jal         autoCamTrial__Fv
/* 0099BC 01DB56BC 00000000 */   nop
/* 0099C0 01DB56C0 DC01023C */  lui         $2, %hi(DispFade__3)
/* 0099C4 01DB56C4 D04B4424 */  addiu       $4, $2, %lo(DispFade__3)
/* 0099C8 01DB56C8 9CF9040C */  jal         GetRate__9CDispCtrlFv
/* 0099CC 01DB56CC 00000000 */   nop
/* 0099D0 01DB56D0 0043023C */  lui         $2, (0x43000000 >> 16)
/* 0099D4 01DB56D4 00088244 */  mtc1        $2, $f1
/* 0099D8 01DB56D8 00000000 */  nop
/* 0099DC 01DB56DC 34000146 */  c.lt.s      $f0, $f1
/* 0099E0 01DB56E0 00000000 */  nop
/* 0099E4 01DB56E4 E0060145 */  bc1t        .L.L01DB7268_2F2868$b
/* 0099E8 01DB56E8 00000000 */   nop
/* 0099EC 01DB56EC 20030424 */  addiu       $4, $0, 0x320
/* 0099F0 01DB56F0 FFFF0524 */  addiu       $5, $0, -0x1
/* 0099F4 01DB56F4 4C07050C */  jal         MapJump__Fii
/* 0099F8 01DB56F8 00000000 */   nop
/* 0099FC 01DB56FC 01000224 */  addiu       $2, $0, 0x1
/* 009A00 01DB5700 009E82AF */  sw          $2, -0x6200($28)
/* 009A04 01DB5704 D8060010 */  b           .L.L01DB7268_2F2868$b
/* 009A08 01DB5708 00000000 */   nop
.L01DB570C_2F0D0C:
/* 009A0C 01DB570C FC4E070C */  jal         BtEscape_Init__Fv
/* 009A10 01DB5710 00000000 */   nop
/* 009A14 01DB5714 FC9D828F */  lw          $2, -0x6204($28)
/* 009A18 01DB5718 01004224 */  addiu       $2, $2, 0x1
/* 009A1C 01DB571C FC9D82AF */  sw          $2, -0x6204($28)
/* 009A20 01DB5720 D1060010 */  b           .L.L01DB7268_2F2868$b
/* 009A24 01DB5724 00000000 */   nop
.L01DB5728_2F0D28:
/* 009A28 01DB5728 504F070C */  jal         BtEscape_Loop__Fv
/* 009A2C 01DB572C 00000000 */   nop
/* 009A30 01DB5730 CD064010 */  beqz        $2, .L.L01DB7268_2F2868$b
/* 009A34 01DB5734 00000000 */   nop
/* 009A38 01DB5738 0043023C */  lui         $2, (0x43000000 >> 16)
/* 009A3C 01DB573C 00608244 */  mtc1        $2, $f12
/* 009A40 01DB5740 DC01023C */  lui         $2, %hi(DispFade__3)
/* 009A44 01DB5744 D04B4424 */  addiu       $4, $2, %lo(DispFade__3)
/* 009A48 01DB5748 94F9040C */  jal         FadeInit__9CDispCtrlFf
/* 009A4C 01DB574C 00000000 */   nop
/* 009A50 01DB5750 B0000224 */  addiu       $2, $0, 0xB0
/* 009A54 01DB5754 FC9D82AF */  sw          $2, -0x6204($28)
/* 009A58 01DB5758 C3060010 */  b           .L.L01DB7268_2F2868$b
/* 009A5C 01DB575C 00000000 */   nop
.L01DB5760_2F0D60:
/* 009A60 01DB5760 00608044 */  mtc1        $0, $f12
/* 009A64 01DB5764 DC01023C */  lui         $2, %hi(DispFade__3)
/* 009A68 01DB5768 D04B4424 */  addiu       $4, $2, %lo(DispFade__3)
/* 009A6C 01DB576C 94F9040C */  jal         FadeInit__9CDispCtrlFf
/* 009A70 01DB5770 00000000 */   nop
/* 009A74 01DB5774 0041023C */  lui         $2, (0x41000000 >> 16)
/* 009A78 01DB5778 00608244 */  mtc1        $2, $f12
/* 009A7C 01DB577C DC01023C */  lui         $2, %hi(DispFade__3)
/* 009A80 01DB5780 D04B4424 */  addiu       $4, $2, %lo(DispFade__3)
/* 009A84 01DB5784 84F9040C */  jal         FadeOutStart__9CDispCtrlFf
/* 009A88 01DB5788 00000000 */   nop
/* 009A8C 01DB578C 5CFA760C */  jal         autoCamTrial__Fv
/* 009A90 01DB5790 00000000 */   nop
/* 009A94 01DB5794 FC9D828F */  lw          $2, -0x6204($28)
/* 009A98 01DB5798 01004224 */  addiu       $2, $2, 0x1
/* 009A9C 01DB579C FC9D82AF */  sw          $2, -0x6204($28)
/* 009AA0 01DB57A0 B1060010 */  b           .L.L01DB7268_2F2868$b
/* 009AA4 01DB57A4 00000000 */   nop
.L01DB57A8_2F0DA8:
/* 009AA8 01DB57A8 5CFA760C */  jal         autoCamTrial__Fv
/* 009AAC 01DB57AC 00000000 */   nop
/* 009AB0 01DB57B0 DC01023C */  lui         $2, %hi(DispFade__3)
/* 009AB4 01DB57B4 D04B4424 */  addiu       $4, $2, %lo(DispFade__3)
/* 009AB8 01DB57B8 9CF9040C */  jal         GetRate__9CDispCtrlFv
/* 009ABC 01DB57BC 00000000 */   nop
/* 009AC0 01DB57C0 0043023C */  lui         $2, (0x43000000 >> 16)
/* 009AC4 01DB57C4 00088244 */  mtc1        $2, $f1
/* 009AC8 01DB57C8 00000000 */  nop
/* 009ACC 01DB57CC 34000146 */  c.lt.s      $f0, $f1
/* 009AD0 01DB57D0 00000000 */  nop
/* 009AD4 01DB57D4 A4060145 */  bc1t        .L.L01DB7268_2F2868$b
/* 009AD8 01DB57D8 00000000 */   nop
/* 009ADC 01DB57DC A49D848F */  lw          $4, -0x625C($28)
/* 009AE0 01DB57E0 0700812C */  sltiu       $1, $4, 0x7
/* 009AE4 01DB57E4 1B002010 */  beqz        $1, .L01DB5854_2F0E54
/* 009AE8 01DB57E8 00000000 */   nop
/* 009AEC 01DB57EC DC01023C */  lui         $2, %hi(LIT_4418)
/* 009AF0 01DB57F0 D02F4324 */  addiu       $3, $2, %lo(LIT_4418)
/* 009AF4 01DB57F4 80100400 */  sll         $2, $4, 2
/* 009AF8 01DB57F8 21104300 */  addu        $2, $2, $3
/* 009AFC 01DB57FC 0000428C */  lw          $2, 0x0($2)
/* 009B00 01DB5800 08004000 */  jr          $2
/* 009B04 01DB5804 00000000 */   nop
jlabel .L01DB5808_2F0E08
/* 009B08 01DB5808 28860070 */  paddub      $16, $0, $0
/* 009B0C 01DB580C 11000010 */  b           .L01DB5854_2F0E54
/* 009B10 01DB5810 00000000 */   nop
jlabel .L01DB5814_2F0E14
/* 009B14 01DB5814 01001024 */  addiu       $16, $0, 0x1
/* 009B18 01DB5818 0E000010 */  b           .L01DB5854_2F0E54
/* 009B1C 01DB581C 00000000 */   nop
jlabel .L01DB5820_2F0E20
/* 009B20 01DB5820 13001024 */  addiu       $16, $0, 0x13
/* 009B24 01DB5824 0B000010 */  b           .L01DB5854_2F0E54
/* 009B28 01DB5828 00000000 */   nop
jlabel .L01DB582C_2F0E2C
/* 009B2C 01DB582C 2A001024 */  addiu       $16, $0, 0x2A
/* 009B30 01DB5830 08000010 */  b           .L01DB5854_2F0E54
/* 009B34 01DB5834 00000000 */   nop
jlabel .L01DB5838_2F0E38
/* 009B38 01DB5838 17001024 */  addiu       $16, $0, 0x17
/* 009B3C 01DB583C 05000010 */  b           .L01DB5854_2F0E54
/* 009B40 01DB5840 00000000 */   nop
jlabel .L01DB5844_2F0E44
/* 009B44 01DB5844 26001024 */  addiu       $16, $0, 0x26
/* 009B48 01DB5848 02000010 */  b           .L01DB5854_2F0E54
/* 009B4C 01DB584C 00000000 */   nop
jlabel .L01DB5850_2F0E50
/* 009B50 01DB5850 3C001024 */  addiu       $16, $0, 0x3C
.L01DB5854_2F0E54:
/* 009B54 01DB5854 28260072 */  paddub      $4, $16, $0
/* 009B58 01DB5858 FFFF0524 */  addiu       $5, $0, -0x1
/* 009B5C 01DB585C 4C07050C */  jal         MapJump__Fii
/* 009B60 01DB5860 00000000 */   nop
/* 009B64 01DB5864 02000224 */  addiu       $2, $0, 0x2
/* 009B68 01DB5868 009E82AF */  sw          $2, -0x6200($28)
/* 009B6C 01DB586C 7E060010 */  b           .L.L01DB7268_2F2868$b
/* 009B70 01DB5870 00000000 */   nop
.L01DB5874_2F0E74:
/* 009B74 01DB5874 9C9C838F */  lw          $3, -0x6364($28)
/* 009B78 01DB5878 A09C828F */  lw          $2, -0x6360($28)
/* 009B7C 01DB587C 25286200 */  or          $5, $3, $2
/* 009B80 01DB5880 CC01023C */  lui         $2, %hi(GamePad)
/* 009B84 01DB5884 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 009B88 01DB5888 1CAE040C */  jal         Down__8CGamePadFi
/* 009B8C 01DB588C 00000000 */   nop
/* 009B90 01DB5890 09004010 */  beqz        $2, .L01DB58B8_2F0EB8
/* 009B94 01DB5894 00000000 */   nop
/* 009B98 01DB5898 3480050C */  jal         ClearSystemMes__Fv
/* 009B9C 01DB589C 00000000 */   nop
/* 009BA0 01DB58A0 749D80AF */  sw          $0, -0x628C($28)
/* 009BA4 01DB58A4 EC9C80AF */  sw          $0, -0x6314($28)
/* 009BA8 01DB58A8 F09C80AF */  sw          $0, -0x6310($28)
/* 009BAC 01DB58AC E49C80AF */  sw          $0, -0x631C($28)
/* 009BB0 01DB58B0 E89C80AF */  sw          $0, -0x6318($28)
/* 009BB4 01DB58B4 FC9D80AF */  sw          $0, -0x6204($28)
.L01DB58B8_2F0EB8:
/* 009BB8 01DB58B8 5CFA760C */  jal         autoCamTrial__Fv
/* 009BBC 01DB58BC 00000000 */   nop
/* 009BC0 01DB58C0 69060010 */  b           .L.L01DB7268_2F2868$b
/* 009BC4 01DB58C4 00000000 */   nop
.L01DB58C8_2F0EC8:
/* 009BC8 01DB58C8 A84D070C */  jal         BtGetGateKey_Loop__Fv
/* 009BCC 01DB58CC 00000000 */   nop
/* 009BD0 01DB58D0 02004010 */  beqz        $2, .L01DB58DC_2F0EDC
/* 009BD4 01DB58D4 00000000 */   nop
/* 009BD8 01DB58D8 FC9D80AF */  sw          $0, -0x6204($28)
.L01DB58DC_2F0EDC:
/* 009BDC 01DB58DC 5CFA760C */  jal         autoCamTrial__Fv
/* 009BE0 01DB58E0 00000000 */   nop
/* 009BE4 01DB58E4 60060010 */  b           .L.L01DB7268_2F2868$b
/* 009BE8 01DB58E8 00000000 */   nop
.L01DB58EC_2F0EEC:
/* 009BEC 01DB58EC C04E070C */  jal         BtGetAttach_Loop__Fv
/* 009BF0 01DB58F0 00000000 */   nop
/* 009BF4 01DB58F4 5C064010 */  beqz        $2, .L.L01DB7268_2F2868$b
/* 009BF8 01DB58F8 00000000 */   nop
/* 009BFC 01DB58FC FC9D80AF */  sw          $0, -0x6204($28)
/* 009C00 01DB5900 59060010 */  b           .L.L01DB7268_2F2868$b
/* 009C04 01DB5904 00000000 */   nop
.L01DB5908_2F0F08:
/* 009C08 01DB5908 F805770C */  jal         EyeCamera__Fv
/* 009C0C 01DB590C 00000000 */   nop
/* 009C10 01DB5910 CC01023C */  lui         $2, %hi(GamePad)
/* 009C14 01DB5914 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 009C18 01DB5918 00080524 */  addiu       $5, $0, 0x800
/* 009C1C 01DB591C 1CAE040C */  jal         Down__8CGamePadFi
/* 009C20 01DB5920 00000000 */   nop
/* 009C24 01DB5924 12004010 */  beqz        $2, .L01DB5970_2F0F70
/* 009C28 01DB5928 00000000 */   nop
/* 009C2C 01DB592C 01000224 */  addiu       $2, $0, 0x1
/* 009C30 01DB5930 D49D82AF */  sw          $2, -0x622C($28)
/* 009C34 01DB5934 749D82AF */  sw          $2, -0x628C($28)
/* 009C38 01DB5938 EC9C82AF */  sw          $2, -0x6314($28)
/* 009C3C 01DB593C E49C82AF */  sw          $2, -0x631C($28)
/* 009C40 01DB5940 28260070 */  paddub      $4, $0, $0
/* 009C44 01DB5944 C803050C */  jal         PlayTimeCountFlag__Fi
/* 009C48 01DB5948 00000000 */   nop
/* 009C4C 01DB594C 01000424 */  addiu       $4, $0, 0x1
/* 009C50 01DB5950 FFFF0524 */  addiu       $5, $0, -0x1
/* 009C54 01DB5954 28360070 */  paddub      $6, $0, $0
/* 009C58 01DB5958 AC69050C */  jal         SndSePlay__Fiii
/* 009C5C 01DB595C 00000000 */   nop
/* 009C60 01DB5960 9B000224 */  addiu       $2, $0, 0x9B
/* 009C64 01DB5964 FC9D82AF */  sw          $2, -0x6204($28)
/* 009C68 01DB5968 3F060010 */  b           .L.L01DB7268_2F2868$b
/* 009C6C 01DB596C 00000000 */   nop
.L01DB5970_2F0F70:
/* 009C70 01DB5970 04000424 */  addiu       $4, $0, 0x4
/* 009C74 01DB5974 4CC6060C */  jal         StatusErrCheck__Fi
/* 009C78 01DB5978 00000000 */   nop
/* 009C7C 01DB597C 04004010 */  beqz        $2, .L01DB5990_2F0F90
/* 009C80 01DB5980 00000000 */   nop
/* 009C84 01DB5984 01000224 */  addiu       $2, $0, 0x1
/* 009C88 01DB5988 DC01013C */  lui         $1, %hi(BtActStatus + 0x98)
/* 009C8C 01DB598C 184522AC */  sw          $2, %lo(BtActStatus + 0x98)($1)
.L01DB5990_2F0F90:
/* 009C90 01DB5990 60BE060C */  jal         HealingWater__Fv
/* 009C94 01DB5994 00000000 */   nop
/* 009C98 01DB5998 789C828F */  lw          $2, -0x6388($28)
/* 009C9C 01DB599C 01001224 */  addiu       $18, $0, 0x1
/* 009CA0 01DB59A0 0100013C */  lui         $1, (0x10000 >> 16)
/* 009CA4 01DB59A4 21084100 */  addu        $1, $2, $1
/* 009CA8 01DB59A8 088B32AC */  sw          $18, -0x74F8($1)
/* 009CAC 01DB59AC 28860070 */  paddub      $16, $0, $0
/* 009CB0 01DB59B0 288E0070 */  paddub      $17, $0, $0
/* 009CB4 01DB59B4 C89C828F */  lw          $2, -0x6338($28)
/* 009CB8 01DB59B8 0100013C */  lui         $1, (0x10000 >> 16)
/* 009CBC 01DB59BC 21084100 */  addu        $1, $2, $1
/* 009CC0 01DB59C0 ECBD228C */  lw          $2, -0x4214($1)
/* 009CC4 01DB59C4 E0005210 */  beq         $2, $18, .L01DB5D48_2F1348
/* 009CC8 01DB59C8 00000000 */   nop
/* 009CCC 01DB59CC A49D828F */  lw          $2, -0x625C($28)
/* 009CD0 01DB59D0 DD004014 */  bnez        $2, .L01DB5D48_2F1348
/* 009CD4 01DB59D4 00000000 */   nop
/* 009CD8 01DB59D8 B000A427 */  addiu       $4, $29, 0xB0
/* 009CDC 01DB59DC EA01023C */  lui         $2, %hi(CharaMain + 0x10)
/* 009CE0 01DB59E0 301D4524 */  addiu       $5, $2, %lo(CharaMain + 0x10)
/* 009CE4 01DB59E4 0C86040C */  jal         sceVu0CopyVector
/* 009CE8 01DB59E8 00000000 */   nop
/* 009CEC 01DB59EC DC01013C */  lui         $1, %hi(velo__2 + 0x8)
/* 009CF0 01DB59F0 582520AC */  sw          $0, %lo(velo__2 + 0x8)($1)
/* 009CF4 01DB59F4 DC01013C */  lui         $1, %hi(velo__2)
/* 009CF8 01DB59F8 502520AC */  sw          $0, %lo(velo__2)($1)
/* 009CFC 01DB59FC 988B828F */  lw          $2, -0x7468($28)
/* 009D00 01DB5A00 080040AC */  sw          $0, 0x8($2)
/* 009D04 01DB5A04 988B848F */  lw          $4, -0x7468($28)
/* 009D08 01DB5A08 D0070524 */  addiu       $5, $0, 0x7D0
/* 009D0C 01DB5A0C 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 009D10 01DB5A10 00000000 */   nop
/* 009D14 01DB5A14 28B64070 */  paddub      $22, $2, $0
/* 009D18 01DB5A18 A041023C */  lui         $2, (0x41A00000 >> 16)
/* 009D1C 01DB5A1C 00088244 */  mtc1        $2, $f1
/* 009D20 01DB5A20 B000A2C7 */  lwc1        $f2, 0xB0($29)
/* 009D24 01DB5A24 00080246 */  add.s       $f0, $f1, $f2
/* 009D28 01DB5A28 4006A0E7 */  swc1        $f0, 0x640($29)
/* 009D2C 01DB5A2C B400B727 */  addiu       $23, $29, 0xB4
/* 009D30 01DB5A30 0000E3C6 */  lwc1        $f3, 0x0($23)
/* 009D34 01DB5A34 00080346 */  add.s       $f0, $f1, $f3
/* 009D38 01DB5A38 4406A0E7 */  swc1        $f0, 0x644($29)
/* 009D3C 01DB5A3C B800A4C7 */  lwc1        $f4, 0xB8($29)
/* 009D40 01DB5A40 00080446 */  add.s       $f0, $f1, $f4
/* 009D44 01DB5A44 4806A0E7 */  swc1        $f0, 0x648($29)
/* 009D48 01DB5A48 01100146 */  sub.s       $f0, $f2, $f1
/* 009D4C 01DB5A4C 5006A0E7 */  swc1        $f0, 0x650($29)
/* 009D50 01DB5A50 2042023C */  lui         $2, (0x42200000 >> 16)
/* 009D54 01DB5A54 00008244 */  mtc1        $2, $f0
/* 009D58 01DB5A58 00000000 */  nop
/* 009D5C 01DB5A5C 01180046 */  sub.s       $f0, $f3, $f0
/* 009D60 01DB5A60 5406A0E7 */  swc1        $f0, 0x654($29)
/* 009D64 01DB5A64 01200146 */  sub.s       $f0, $f4, $f1
/* 009D68 01DB5A68 5806A0E7 */  swc1        $f0, 0x658($29)
/* 009D6C 01DB5A6C 289E0070 */  paddub      $19, $0, $0
/* 009D70 01DB5A70 989C80AF */  sw          $0, -0x6368($28)
/* 009D74 01DB5A74 45000010 */  b           .L01DB5B8C_2F118C
/* 009D78 01DB5A78 00000000 */   nop
.L01DB5A7C_2F107C:
/* 009D7C 01DB5A7C FFFF0224 */  addiu       $2, $0, -0x1
/* 009D80 01DB5A80 04006216 */  bne         $19, $2, .L01DB5A94_2F1094
/* 009D84 01DB5A84 00000000 */   nop
/* 009D88 01DB5A88 28AE0070 */  paddub      $21, $0, $0
/* 009D8C 01DB5A8C 04000010 */  b           .L01DB5AA0_2F10A0
/* 009D90 01DB5A90 00000000 */   nop
.L01DB5A94_2F1094:
/* 009D94 01DB5A94 21108302 */  addu        $2, $20, $3
/* 009D98 01DB5A98 9C04558C */  lw          $21, 0x49C($2)
/* 009D9C 01DB5A9C 00000000 */  nop
.L01DB5AA0_2F10A0:
/* 009DA0 01DB5AA0 3900A012 */  beqz        $21, .L01DB5B88_2F1188
/* 009DA4 01DB5AA4 00000000 */   nop
/* 009DA8 01DB5AA8 21107400 */  addu        $2, $3, $20
/* 009DAC 01DB5AAC 90044224 */  addiu       $2, $2, 0x490
/* 009DB0 01DB5AB0 3006A427 */  addiu       $4, $29, 0x630
/* 009DB4 01DB5AB4 10014524 */  addiu       $5, $2, 0x110
/* 009DB8 01DB5AB8 0C86040C */  jal         sceVu0CopyVector
/* 009DBC 01DB5ABC 00000000 */   nop
/* 009DC0 01DB5AC0 C89C828F */  lw          $2, -0x6338($28)
/* 009DC4 01DB5AC4 21105400 */  addu        $2, $2, $20
/* 009DC8 01DB5AC8 90045424 */  addiu       $20, $2, 0x490
/* 009DCC 01DB5ACC 00064CC4 */  lwc1        $f12, 0x600($2)
/* 009DD0 01DB5AD0 2C44040C */  jal         fptosi
/* 009DD4 01DB5AD4 00000000 */   nop
/* 009DD8 01DB5AD8 10008386 */  lh          $3, 0x10($20)
/* 009DDC 01DB5ADC 21104300 */  addu        $2, $2, $3
/* 009DE0 01DB5AE0 04004128 */  slti        $1, $2, 0x4
/* 009DE4 01DB5AE4 02002014 */  bnez        $1, .L01DB5AF0_2F10F0
/* 009DE8 01DB5AE8 00000000 */   nop
/* 009DEC 01DB5AEC FDFF4224 */  addiu       $2, $2, -0x3
.L01DB5AF0_2F10F0:
/* 009DF0 01DB5AF0 03000324 */  addiu       $3, $0, 0x3
/* 009DF4 01DB5AF4 02004314 */  bne         $2, $3, .L01DB5B00_2F1100
/* 009DF8 01DB5AF8 00000000 */   nop
/* 009DFC 01DB5AFC FFFF0224 */  addiu       $2, $0, -0x1
.L01DB5B00_2F1100:
/* 009E00 01DB5B00 B4C2033C */  lui         $3, (0xC2B40000 >> 16)
/* 009E04 01DB5B04 00088344 */  mtc1        $3, $f1
/* 009E08 01DB5B08 00008244 */  mtc1        $2, $f0
/* 009E0C 01DB5B0C 00000000 */  nop
/* 009E10 01DB5B10 20008046 */  cvt.s.w     $f0, $f0
/* 009E14 01DB5B14 42080046 */  mul.s       $f1, $f1, $f0
/* 009E18 01DB5B18 B08080C7 */  lwc1        $f0, -0x7F50($28)
/* 009E1C 01DB5B1C 42000146 */  mul.s       $f1, $f0, $f1
/* 009E20 01DB5B20 3443023C */  lui         $2, (0x43340000 >> 16)
/* 009E24 01DB5B24 00008244 */  mtc1        $2, $f0
/* 009E28 01DB5B28 00000000 */  nop
/* 009E2C 01DB5B2C 430B0046 */  div.s       $f13, $f1, $f0
/* 009E30 01DB5B30 00608044 */  mtc1        $0, $f12
/* 009E34 01DB5B34 00000000 */  nop
/* 009E38 01DB5B38 86630046 */  mov.s       $f14, $f12
/* 009E3C 01DB5B3C 2826A072 */  paddub      $4, $21, $0
/* 009E40 01DB5B40 70A3040C */  jal         SetRotation__6CFrameFfff
/* 009E44 01DB5B44 00000000 */   nop
/* 009E48 01DB5B48 2826A072 */  paddub      $4, $21, $0
/* 009E4C 01DB5B4C 3006A527 */  addiu       $5, $29, 0x630
/* 009E50 01DB5B50 B89F040C */  jal         SetPosition__6CFrameFPf
/* 009E54 01DB5B54 00000000 */   nop
/* 009E58 01DB5B58 989C838F */  lw          $3, -0x6368($28)
/* 009E5C 01DB5B5C 80100300 */  sll         $2, $3, 2
/* 009E60 01DB5B60 21104300 */  addu        $2, $2, $3
/* 009E64 01DB5B64 00110200 */  sll         $2, $2, 4
/* 009E68 01DB5B68 2128C202 */  addu        $5, $22, $2
/* 009E6C 01DB5B6C 2826A072 */  paddub      $4, $21, $0
/* 009E70 01DB5B70 4006A627 */  addiu       $6, $29, 0x640
/* 009E74 01DB5B74 E4A8040C */  jal         PickUpNearPoly__6CFrameFP6CCPolyRC7CBoxVu0
/* 009E78 01DB5B78 00000000 */   nop
/* 009E7C 01DB5B7C 989C838F */  lw          $3, -0x6368($28)
/* 009E80 01DB5B80 21106200 */  addu        $2, $3, $2
/* 009E84 01DB5B84 989C82AF */  sw          $2, -0x6368($28)
.L01DB5B88_2F1188:
/* 009E88 01DB5B88 01007326 */  addiu       $19, $19, 0x1
.L01DB5B8C_2F118C:
/* 009E8C 01DB5B8C C89C838F */  lw          $3, -0x6338($28)
/* 009E90 01DB5B90 C0101300 */  sll         $2, $19, 3
/* 009E94 01DB5B94 23105300 */  subu        $2, $2, $19
/* 009E98 01DB5B98 80100200 */  sll         $2, $2, 2
/* 009E9C 01DB5B9C 21105300 */  addu        $2, $2, $19
/* 009EA0 01DB5BA0 00A10200 */  sll         $20, $2, 4
/* 009EA4 01DB5BA4 21108302 */  addu        $2, $20, $3
/* 009EA8 01DB5BA8 4006428C */  lw          $2, 0x640($2)
/* 009EAC 01DB5BAC B3FF4014 */  bnez        $2, .L01DB5A7C_2F107C
/* 009EB0 01DB5BB0 00000000 */   nop
/* 009EB4 01DB5BB4 CC9C848F */  lw          $4, -0x6334($28)
/* 009EB8 01DB5BB8 282EC072 */  paddub      $5, $22, $0
/* 009EBC 01DB5BBC 989C868F */  lw          $6, -0x6368($28)
/* 009EC0 01DB5BC0 4006A727 */  addiu       $7, $29, 0x640
/* 009EC4 01DB5BC4 4435070C */  jal         AddCollision__13CDranMapFieldFP6CCPolyi7CBoxVu0
/* 009EC8 01DB5BC8 00000000 */   nop
/* 009ECC 01DB5BCC 989C82AF */  sw          $2, -0x6368($28)
/* 009ED0 01DB5BD0 01000A24 */  addiu       $10, $0, 0x1
/* 009ED4 01DB5BD4 789C828F */  lw          $2, -0x6388($28)
/* 009ED8 01DB5BD8 04004380 */  lb          $3, 0x4($2)
/* 009EDC 01DB5BDC 05000224 */  addiu       $2, $0, 0x5
/* 009EE0 01DB5BE0 02006214 */  bne         $3, $2, .L01DB5BEC_2F11EC
/* 009EE4 01DB5BE4 00000000 */   nop
/* 009EE8 01DB5BE8 08000A24 */  addiu       $10, $0, 0x8
.L01DB5BEC_2F11EC:
/* 009EEC 01DB5BEC B000A427 */  addiu       $4, $29, 0xB0
/* 009EF0 01DB5BF0 DC01023C */  lui         $2, %hi(velo__2)
/* 009EF4 01DB5BF4 50254524 */  addiu       $5, $2, %lo(velo__2)
/* 009EF8 01DB5BF8 5005A627 */  addiu       $6, $29, 0x550
/* 009EFC 01DB5BFC 6005A727 */  addiu       $7, $29, 0x560
/* 009F00 01DB5C00 2846C072 */  paddub      $8, $22, $0
/* 009F04 01DB5C04 989C898F */  lw          $9, -0x6368($28)
/* 009F08 01DB5C08 A029050C */  jal         MoveCheck__FPfPfPfP13MoveCheckInfoP6CCPolyii
/* 009F0C 01DB5C0C 00000000 */   nop
/* 009F10 01DB5C10 989C858F */  lw          $5, -0x6368($28)
/* 009F14 01DB5C14 9001A228 */  slti        $2, $5, 0x190
/* 009F18 01DB5C18 05004014 */  bnez        $2, .L01DB5C30_2F1230
/* 009F1C 01DB5C1C 00000000 */   nop
/* 009F20 01DB5C20 DC01023C */  lui         $2, %hi(LIT_4400)
/* 009F24 01DB5C24 302F4424 */  addiu       $4, $2, %lo(LIT_4400)
/* 009F28 01DB5C28 A611040C */  jal         printf
/* 009F2C 01DB5C2C 00000000 */   nop
.L01DB5C30_2F1230:
/* 009F30 01DB5C30 F001023C */  lui         $2, %hi(ref_off)
/* 009F34 01DB5C34 A0684424 */  addiu       $4, $2, %lo(ref_off)
/* 009F38 01DB5C38 5005A527 */  addiu       $5, $29, 0x550
/* 009F3C 01DB5C3C B000A627 */  addiu       $6, $29, 0xB0
/* 009F40 01DB5C40 EE85040C */  jal         sceVu0SubVector
/* 009F44 01DB5C44 00000000 */   nop
/* 009F48 01DB5C48 DC01013C */  lui         $1, %hi(velo__2 + 0x4)
/* 009F4C 01DB5C4C 542521C4 */  lwc1        $f1, %lo(velo__2 + 0x4)($1)
/* 009F50 01DB5C50 F001013C */  lui         $1, %hi(veloOld + 0x4)
/* 009F54 01DB5C54 440121E4 */  swc1        $f1, %lo(veloOld + 0x4)($1)
/* 009F58 01DB5C58 808080C7 */  lwc1        $f0, -0x7F80($28)
/* 009F5C 01DB5C5C 41080046 */  sub.s       $f1, $f1, $f0
/* 009F60 01DB5C60 DC01013C */  lui         $1, %hi(velo__2 + 0x4)
/* 009F64 01DB5C64 542521E4 */  swc1        $f1, %lo(velo__2 + 0x4)($1)
/* 009F68 01DB5C68 20C1023C */  lui         $2, (0xC1200000 >> 16)
/* 009F6C 01DB5C6C 00008244 */  mtc1        $2, $f0
/* 009F70 01DB5C70 00000000 */  nop
/* 009F74 01DB5C74 34080046 */  c.lt.s      $f1, $f0
/* 009F78 01DB5C78 00000000 */  nop
/* 009F7C 01DB5C7C 03000045 */  bc1f        .L01DB5C8C_2F128C
/* 009F80 01DB5C80 00000000 */   nop
/* 009F84 01DB5C84 DC01013C */  lui         $1, %hi(velo__2 + 0x4)
/* 009F88 01DB5C88 542522AC */  sw          $2, %lo(velo__2 + 0x4)($1)
.L01DB5C8C_2F128C:
/* 009F8C 01DB5C8C B000A427 */  addiu       $4, $29, 0xB0
/* 009F90 01DB5C90 5005A527 */  addiu       $5, $29, 0x550
/* 009F94 01DB5C94 0C86040C */  jal         sceVu0CopyVector
/* 009F98 01DB5C98 00000000 */   nop
/* 009F9C 01DB5C9C 6005A28F */  lw          $2, 0x560($29)
/* 009FA0 01DB5CA0 13004010 */  beqz        $2, .L01DB5CF0_2F12F0
/* 009FA4 01DB5CA4 00000000 */   nop
/* 009FA8 01DB5CA8 DC01013C */  lui         $1, %hi(velo__2 + 0x4)
/* 009FAC 01DB5CAC 542520AC */  sw          $0, %lo(velo__2 + 0x4)($1)
/* 009FB0 01DB5CB0 D005A527 */  addiu       $5, $29, 0x5D0
/* 009FB4 01DB5CB4 6006A427 */  addiu       $4, $29, 0x660
/* 009FB8 01DB5CB8 05000324 */  addiu       $3, $0, 0x5
.L01DB5CBC_2F12BC:
/* 009FBC 01DB5CBC 0000A278 */  lq          $2, 0x0($5)
/* 009FC0 01DB5CC0 1000A524 */  addiu       $5, $5, 0x10
/* 009FC4 01DB5CC4 FFFF6324 */  addiu       $3, $3, -0x1
/* 009FC8 01DB5CC8 0000827C */  sq          $2, 0x0($4)
/* 009FCC 01DB5CCC 10008424 */  addiu       $4, $4, 0x10
/* 009FD0 01DB5CD0 FAFF601C */  bgtz        $3, .L01DB5CBC_2F12BC
/* 009FD4 01DB5CD4 00000000 */   nop
/* 009FD8 01DB5CD8 A206A287 */  lh          $2, 0x6A2($29)
/* 009FDC 01DB5CDC DC01013C */  lui         $1, %hi(BtActStatus + 0x90)
/* 009FE0 01DB5CE0 104522A4 */  sh          $2, %lo(BtActStatus + 0x90)($1)
/* 009FE4 01DB5CE4 A006A287 */  lh          $2, 0x6A0($29)
/* 009FE8 01DB5CE8 DC01013C */  lui         $1, %hi(BtActStatus + 0x92)
/* 009FEC 01DB5CEC 124522A4 */  sh          $2, %lo(BtActStatus + 0x92)($1)
.L01DB5CF0_2F12F0:
/* 009FF0 01DB5CF0 C005A28F */  lw          $2, 0x5C0($29)
/* 009FF4 01DB5CF4 06004010 */  beqz        $2, .L01DB5D10_2F1310
/* 009FF8 01DB5CF8 00000000 */   nop
/* 009FFC 01DB5CFC 0000E1C6 */  lwc1        $f1, 0x0($23)
/* 00A000 01DB5D00 2406A0C7 */  lwc1        $f0, 0x624($29)
/* 00A004 01DB5D04 01080046 */  sub.s       $f0, $f1, $f0
/* 00A008 01DB5D08 DC01013C */  lui         $1, %hi(BtActStatus + 0x44)
/* 00A00C 01DB5D0C C44420E4 */  swc1        $f0, %lo(BtActStatus + 0x44)($1)
.L01DB5D10_2F1310:
/* 00A010 01DB5D10 EA01023C */  lui         $2, %hi(CharaMain)
/* 00A014 01DB5D14 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 00A018 01DB5D18 B000A527 */  addiu       $5, $29, 0xB0
/* 00A01C 01DB5D1C 38E4040C */  jal         SetPosition__10CCharacterFPf
/* 00A020 01DB5D20 00000000 */   nop
/* 00A024 01DB5D24 0000E1C6 */  lwc1        $f1, 0x0($23)
/* 00A028 01DB5D28 F0C1023C */  lui         $2, (0xC1F00000 >> 16)
/* 00A02C 01DB5D2C 00008244 */  mtc1        $2, $f0
/* 00A030 01DB5D30 00000000 */  nop
/* 00A034 01DB5D34 36080046 */  c.le.s      $f1, $f0
/* 00A038 01DB5D38 00000000 */  nop
/* 00A03C 01DB5D3C 02000045 */  bc1f        .L01DB5D48_2F1348
/* 00A040 01DB5D40 00000000 */   nop
/* 00A044 01DB5D44 01001124 */  addiu       $17, $0, 0x1
.L01DB5D48_2F1348:
/* 00A048 01DB5D48 CC01023C */  lui         $2, %hi(GamePad)
/* 00A04C 01DB5D4C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 00A050 01DB5D50 9C9C858F */  lw          $5, -0x6364($28)
/* 00A054 01DB5D54 1CAE040C */  jal         Down__8CGamePadFi
/* 00A058 01DB5D58 00000000 */   nop
/* 00A05C 01DB5D5C 15004010 */  beqz        $2, .L01DB5DB4_2F13B4
/* 00A060 01DB5D60 00000000 */   nop
/* 00A064 01DB5D64 DC01013C */  lui         $1, %hi(BtActStatus + 0x98)
/* 00A068 01DB5D68 1845228C */  lw          $2, %lo(BtActStatus + 0x98)($1)
/* 00A06C 01DB5D6C 11004014 */  bnez        $2, .L01DB5DB4_2F13B4
/* 00A070 01DB5D70 00000000 */   nop
/* 00A074 01DB5D74 DC01013C */  lui         $1, %hi(BtActStatus + 0x94)
/* 00A078 01DB5D78 14452284 */  lh          $2, %lo(BtActStatus + 0x94)($1)
/* 00A07C 01DB5D7C 0D004010 */  beqz        $2, .L01DB5DB4_2F13B4
/* 00A080 01DB5D80 00000000 */   nop
/* 00A084 01DB5D84 47000424 */  addiu       $4, $0, 0x47
/* 00A088 01DB5D88 5A000524 */  addiu       $5, $0, 0x5A
/* 00A08C 01DB5D8C 08000624 */  addiu       $6, $0, 0x8
/* 00A090 01DB5D90 283E0070 */  paddub      $7, $0, $0
/* 00A094 01DB5D94 28460070 */  paddub      $8, $0, $0
/* 00A098 01DB5D98 284E0070 */  paddub      $9, $0, $0
/* 00A09C 01DB5D9C 9481050C */  jal         SetSystemMes__FiiiiPiPi
/* 00A0A0 01DB5DA0 00000000 */   nop
/* 00A0A4 01DB5DA4 5A000224 */  addiu       $2, $0, 0x5A
/* 00A0A8 01DB5DA8 EA01013C */  lui         $1, %hi(DngMessMan + 0x8)
/* 00A0AC 01DB5DAC 987622AC */  sw          $2, %lo(DngMessMan + 0x8)($1)
/* 00A0B0 01DB5DB0 28960070 */  paddub      $18, $0, $0
.L01DB5DB4_2F13B4:
/* 00A0B4 01DB5DB4 CC01023C */  lui         $2, %hi(GamePad)
/* 00A0B8 01DB5DB8 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 00A0BC 01DB5DBC 9C9C858F */  lw          $5, -0x6364($28)
/* 00A0C0 01DB5DC0 1CAE040C */  jal         Down__8CGamePadFi
/* 00A0C4 01DB5DC4 00000000 */   nop
/* 00A0C8 01DB5DC8 1B004010 */  beqz        $2, .L01DB5E38_2F1438
/* 00A0CC 01DB5DCC 00000000 */   nop
/* 00A0D0 01DB5DD0 DC01013C */  lui         $1, %hi(BtActStatus + 0x92)
/* 00A0D4 01DB5DD4 12452384 */  lh          $3, %lo(BtActStatus + 0x92)($1)
/* 00A0D8 01DB5DD8 0A000224 */  addiu       $2, $0, 0xA
/* 00A0DC 01DB5DDC 16006214 */  bne         $3, $2, .L01DB5E38_2F1438
/* 00A0E0 01DB5DE0 00000000 */   nop
/* 00A0E4 01DB5DE4 DC01013C */  lui         $1, %hi(BtActStatus + 0x98)
/* 00A0E8 01DB5DE8 1845228C */  lw          $2, %lo(BtActStatus + 0x98)($1)
/* 00A0EC 01DB5DEC 12004014 */  bnez        $2, .L01DB5E38_2F1438
/* 00A0F0 01DB5DF0 00000000 */   nop
/* 00A0F4 01DB5DF4 789C828F */  lw          $2, -0x6388($28)
/* 00A0F8 01DB5DF8 04004380 */  lb          $3, 0x4($2)
/* 00A0FC 01DB5DFC 05000224 */  addiu       $2, $0, 0x5
/* 00A100 01DB5E00 0D006214 */  bne         $3, $2, .L01DB5E38_2F1438
/* 00A104 01DB5E04 00000000 */   nop
/* 00A108 01DB5E08 50000424 */  addiu       $4, $0, 0x50
/* 00A10C 01DB5E0C 5A000524 */  addiu       $5, $0, 0x5A
/* 00A110 01DB5E10 08000624 */  addiu       $6, $0, 0x8
/* 00A114 01DB5E14 283E0070 */  paddub      $7, $0, $0
/* 00A118 01DB5E18 28460070 */  paddub      $8, $0, $0
/* 00A11C 01DB5E1C 284E0070 */  paddub      $9, $0, $0
/* 00A120 01DB5E20 9481050C */  jal         SetSystemMes__FiiiiPiPi
/* 00A124 01DB5E24 00000000 */   nop
/* 00A128 01DB5E28 5A000224 */  addiu       $2, $0, 0x5A
/* 00A12C 01DB5E2C EA01013C */  lui         $1, %hi(DngMessMan + 0x8)
/* 00A130 01DB5E30 987622AC */  sw          $2, %lo(DngMessMan + 0x8)($1)
/* 00A134 01DB5E34 28960070 */  paddub      $18, $0, $0
.L01DB5E38_2F1438:
/* 00A138 01DB5E38 789C828F */  lw          $2, -0x6388($28)
/* 00A13C 01DB5E3C 04004380 */  lb          $3, 0x4($2)
/* 00A140 01DB5E40 01000224 */  addiu       $2, $0, 0x1
/* 00A144 01DB5E44 09006210 */  beq         $3, $2, .L01DB5E6C_2F146C
/* 00A148 01DB5E48 00000000 */   nop
/* 00A14C 01DB5E4C 3C1E0300 */  dsll32      $3, $3, 24
/* 00A150 01DB5E50 3F1E0300 */  dsra32      $3, $3, 24
/* 00A154 01DB5E54 03000224 */  addiu       $2, $0, 0x3
/* 00A158 01DB5E58 04006210 */  beq         $3, $2, .L01DB5E6C_2F146C
/* 00A15C 01DB5E5C 00000000 */   nop
/* 00A160 01DB5E60 05000224 */  addiu       $2, $0, 0x5
/* 00A164 01DB5E64 87006214 */  bne         $3, $2, .L01DB6084_2F1684
/* 00A168 01DB5E68 00000000 */   nop
.L01DB5E6C_2F146C:
/* 00A16C 01DB5E6C 85004012 */  beqz        $18, .L01DB6084_2F1684
/* 00A170 01DB5E70 00000000 */   nop
/* 00A174 01DB5E74 DC01013C */  lui         $1, %hi(BtActStatus + 0x98)
/* 00A178 01DB5E78 1845228C */  lw          $2, %lo(BtActStatus + 0x98)($1)
/* 00A17C 01DB5E7C 81004014 */  bnez        $2, .L01DB6084_2F1684
/* 00A180 01DB5E80 00000000 */   nop
/* 00A184 01DB5E84 AC9C8DC7 */  lwc1        $f13, -0x6354($28)
/* 00A188 01DB5E88 B08080C7 */  lwc1        $f0, -0x7F50($28)
/* 00A18C 01DB5E8C 41680046 */  sub.s       $f1, $f13, $f0
/* 00A190 01DB5E90 5C8580C7 */  lwc1        $f0, -0x7AA4($28)
/* 00A194 01DB5E94 36080046 */  c.le.s      $f1, $f0
/* 00A198 01DB5E98 00000000 */  nop
/* 00A19C 01DB5E9C 01000045 */  bc1f        .L01DB5EA4_2F14A4
/* 00A1A0 01DB5EA0 00000000 */   nop
.L01DB5EA4_2F14A4:
/* 00A1A4 01DB5EA4 00708044 */  mtc1        $0, $f14
/* 00A1A8 01DB5EA8 EA01023C */  lui         $2, %hi(CharaHand)
/* 00A1AC 01DB5EAC D02E4424 */  addiu       $4, $2, %lo(CharaHand)
/* 00A1B0 01DB5EB0 B09C8CC7 */  lwc1        $f12, -0x6350($28)
/* 00A1B4 01DB5EB4 54E4040C */  jal         SetRotation__10CCharacterFfff
/* 00A1B8 01DB5EB8 00000000 */   nop
/* 00A1BC 01DB5EBC 01000424 */  addiu       $4, $0, 0x1
/* 00A1C0 01DB5EC0 F49C84AF */  sw          $4, -0x630C($28)
/* 00A1C4 01DB5EC4 789C828F */  lw          $2, -0x6388($28)
/* 00A1C8 01DB5EC8 04004380 */  lb          $3, 0x4($2)
/* 00A1CC 01DB5ECC 05000224 */  addiu       $2, $0, 0x5
/* 00A1D0 01DB5ED0 1E006210 */  beq         $3, $2, .L01DB5F4C_2F154C
/* 00A1D4 01DB5ED4 00000000 */   nop
/* 00A1D8 01DB5ED8 03000224 */  addiu       $2, $0, 0x3
/* 00A1DC 01DB5EDC 10006210 */  beq         $3, $2, .L01DB5F20_2F1520
/* 00A1E0 01DB5EE0 00000000 */   nop
/* 00A1E4 01DB5EE4 03006410 */  beq         $3, $4, .L01DB5EF4_2F14F4
/* 00A1E8 01DB5EE8 00000000 */   nop
/* 00A1EC 01DB5EEC 32000010 */  b           .L01DB5FB8_2F15B8
/* 00A1F0 01DB5EF0 00000000 */   nop
.L01DB5EF4_2F14F4:
/* 00A1F4 01DB5EF4 CC01023C */  lui         $2, %hi(GamePad)
/* 00A1F8 01DB5EF8 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 00A1FC 01DB5EFC 9C9C858F */  lw          $5, -0x6364($28)
/* 00A200 01DB5F00 1CAE040C */  jal         Down__8CGamePadFi
/* 00A204 01DB5F04 00000000 */   nop
/* 00A208 01DB5F08 2B004010 */  beqz        $2, .L01DB5FB8_2F15B8
/* 00A20C 01DB5F0C 00000000 */   nop
/* 00A210 01DB5F10 28F2760C */  jal         BattleActionOn_Jinn__Fv
/* 00A214 01DB5F14 00000000 */   nop
/* 00A218 01DB5F18 27000010 */  b           .L01DB5FB8_2F15B8
/* 00A21C 01DB5F1C 00000000 */   nop
.L01DB5F20_2F1520:
/* 00A220 01DB5F20 CC01023C */  lui         $2, %hi(GamePad)
/* 00A224 01DB5F24 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 00A228 01DB5F28 9C9C858F */  lw          $5, -0x6364($28)
/* 00A22C 01DB5F2C 1CAE040C */  jal         Down__8CGamePadFi
/* 00A230 01DB5F30 00000000 */   nop
/* 00A234 01DB5F34 20004010 */  beqz        $2, .L01DB5FB8_2F15B8
/* 00A238 01DB5F38 00000000 */   nop
/* 00A23C 01DB5F3C C0F3760C */  jal         BattleActionOn_Ruby__Fv
/* 00A240 01DB5F40 00000000 */   nop
/* 00A244 01DB5F44 1C000010 */  b           .L01DB5FB8_2F15B8
/* 00A248 01DB5F48 00000000 */   nop
.L01DB5F4C_2F154C:
/* 00A24C 01DB5F4C CC01023C */  lui         $2, %hi(GamePad)
/* 00A250 01DB5F50 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 00A254 01DB5F54 9C9C858F */  lw          $5, -0x6364($28)
/* 00A258 01DB5F58 1CAE040C */  jal         Down__8CGamePadFi
/* 00A25C 01DB5F5C 00000000 */   nop
/* 00A260 01DB5F60 15004010 */  beqz        $2, .L01DB5FB8_2F15B8
/* 00A264 01DB5F64 00000000 */   nop
/* 00A268 01DB5F68 DC01013C */  lui         $1, %hi(BtActStatus + 0xA0)
/* 00A26C 01DB5F6C 2045228C */  lw          $2, %lo(BtActStatus + 0xA0)($1)
/* 00A270 01DB5F70 03004014 */  bnez        $2, .L01DB5F80_2F1580
/* 00A274 01DB5F74 00000000 */   nop
/* 00A278 01DB5F78 D0F6760C */  jal         BattleActionOn_Ozumond__Fv
/* 00A27C 01DB5F7C 00000000 */   nop
.L01DB5F80_2F1580:
/* 00A280 01DB5F80 DC01013C */  lui         $1, %hi(BtActStatus + 0xA0)
/* 00A284 01DB5F84 2045238C */  lw          $3, %lo(BtActStatus + 0xA0)($1)
/* 00A288 01DB5F88 01000224 */  addiu       $2, $0, 0x1
/* 00A28C 01DB5F8C 03006214 */  bne         $3, $2, .L01DB5F9C_2F159C
/* 00A290 01DB5F90 00000000 */   nop
/* 00A294 01DB5F94 F4F6760C */  jal         BattleActionOn_Ozumond_H__Fv
/* 00A298 01DB5F98 00000000 */   nop
.L01DB5F9C_2F159C:
/* 00A29C 01DB5F9C DC01013C */  lui         $1, %hi(BtActStatus + 0xA0)
/* 00A2A0 01DB5FA0 2045238C */  lw          $3, %lo(BtActStatus + 0xA0)($1)
/* 00A2A4 01DB5FA4 02000224 */  addiu       $2, $0, 0x2
/* 00A2A8 01DB5FA8 03006214 */  bne         $3, $2, .L01DB5FB8_2F15B8
/* 00A2AC 01DB5FAC 00000000 */   nop
/* 00A2B0 01DB5FB0 1CF7760C */  jal         BattleActionOn_Ozumond_F__Fv
/* 00A2B4 01DB5FB4 00000000 */   nop
.L01DB5FB8_2F15B8:
/* 00A2B8 01DB5FB8 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 00A2BC 01DB5FBC 9044228C */  lw          $2, %lo(BtActStatus + 0x10)($1)
/* 00A2C0 01DB5FC0 01000524 */  addiu       $5, $0, 0x1
/* 00A2C4 01DB5FC4 2F004514 */  bne         $2, $5, .L01DB6084_2F1684
/* 00A2C8 01DB5FC8 00000000 */   nop
/* 00A2CC 01DB5FCC 789C828F */  lw          $2, -0x6388($28)
/* 00A2D0 01DB5FD0 04004380 */  lb          $3, 0x4($2)
/* 00A2D4 01DB5FD4 05000224 */  addiu       $2, $0, 0x5
/* 00A2D8 01DB5FD8 14006210 */  beq         $3, $2, .L01DB602C_2F162C
/* 00A2DC 01DB5FDC 00000000 */   nop
/* 00A2E0 01DB5FE0 03000224 */  addiu       $2, $0, 0x3
/* 00A2E4 01DB5FE4 0B006210 */  beq         $3, $2, .L01DB6014_2F1614
/* 00A2E8 01DB5FE8 00000000 */   nop
/* 00A2EC 01DB5FEC 03006510 */  beq         $3, $5, .L01DB5FFC_2F15FC
/* 00A2F0 01DB5FF0 00000000 */   nop
/* 00A2F4 01DB5FF4 23000010 */  b           .L01DB6084_2F1684
/* 00A2F8 01DB5FF8 00000000 */   nop
.L01DB5FFC_2F15FC:
/* 00A2FC 01DB5FFC EA01023C */  lui         $2, %hi(CharaHand)
/* 00A300 01DB6000 D02E4424 */  addiu       $4, $2, %lo(CharaHand)
/* 00A304 01DB6004 4CF2760C */  jal         BattleActionPlay_Jinn__FP10CCharacteri
/* 00A308 01DB6008 00000000 */   nop
/* 00A30C 01DB600C 1D000010 */  b           .L01DB6084_2F1684
/* 00A310 01DB6010 00000000 */   nop
.L01DB6014_2F1614:
/* 00A314 01DB6014 EA01023C */  lui         $2, %hi(CharaHand)
/* 00A318 01DB6018 D02E4424 */  addiu       $4, $2, %lo(CharaHand)
/* 00A31C 01DB601C D4F4760C */  jal         BattleActionPlay_Ruby__FP10CCharacteri
/* 00A320 01DB6020 00000000 */   nop
/* 00A324 01DB6024 17000010 */  b           .L01DB6084_2F1684
/* 00A328 01DB6028 00000000 */   nop
.L01DB602C_2F162C:
/* 00A32C 01DB602C DC01013C */  lui         $1, %hi(BtActStatus + 0xA0)
/* 00A330 01DB6030 2045228C */  lw          $2, %lo(BtActStatus + 0xA0)($1)
/* 00A334 01DB6034 04004014 */  bnez        $2, .L01DB6048_2F1648
/* 00A338 01DB6038 00000000 */   nop
/* 00A33C 01DB603C 2826A070 */  paddub      $4, $5, $0
/* 00A340 01DB6040 3CF7760C */  jal         OpC_InitProcess5__Fv
/* 00A344 01DB6044 00000000 */   nop
.L01DB6048_2F1648:
/* 00A348 01DB6048 DC01013C */  lui         $1, %hi(BtActStatus + 0xA0)
/* 00A34C 01DB604C 2045228C */  lw          $2, %lo(BtActStatus + 0xA0)($1)
/* 00A350 01DB6050 01000424 */  addiu       $4, $0, 0x1
/* 00A354 01DB6054 03004414 */  bne         $2, $4, .L01DB6064_2F1664
/* 00A358 01DB6058 00000000 */   nop
/* 00A35C 01DB605C 30F8760C */  jal         BattleActionPlay_Ozumond_H__Fi
/* 00A360 01DB6060 00000000 */   nop
.L01DB6064_2F1664:
/* 00A364 01DB6064 DC01013C */  lui         $1, %hi(BtActStatus + 0xA0)
/* 00A368 01DB6068 2045238C */  lw          $3, %lo(BtActStatus + 0xA0)($1)
/* 00A36C 01DB606C 02000224 */  addiu       $2, $0, 0x2
/* 00A370 01DB6070 04006214 */  bne         $3, $2, .L01DB6084_2F1684
/* 00A374 01DB6074 00000000 */   nop
/* 00A378 01DB6078 01000424 */  addiu       $4, $0, 0x1
/* 00A37C 01DB607C E8F8760C */  jal         BattleActionPlay_Ozumond_F__Fi
/* 00A380 01DB6080 00000000 */   nop
.L01DB6084_2F1684:
/* 00A384 01DB6084 A49D848F */  lw          $4, -0x625C($28)
/* 00A388 01DB6088 282E0070 */  paddub      $5, $0, $0
/* 00A38C 01DB608C A4BF060C */  jal         SetBattleStyle__Fii
/* 00A390 01DB6090 00000000 */   nop
/* 00A394 01DB6094 CC01023C */  lui         $2, %hi(GamePad)
/* 00A398 01DB6098 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 00A39C 01DB609C 10000524 */  addiu       $5, $0, 0x10
/* 00A3A0 01DB60A0 1CAE040C */  jal         Down__8CGamePadFi
/* 00A3A4 01DB60A4 00000000 */   nop
/* 00A3A8 01DB60A8 26004010 */  beqz        $2, .L01DB6144_2F1744
/* 00A3AC 01DB60AC 00000000 */   nop
/* 00A3B0 01DB60B0 01000324 */  addiu       $3, $0, 0x1
/* 00A3B4 01DB60B4 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 00A3B8 01DB60B8 9044228C */  lw          $2, %lo(BtActStatus + 0x10)($1)
/* 00A3BC 01DB60BC 02004010 */  beqz        $2, .L01DB60C8_2F16C8
/* 00A3C0 01DB60C0 00000000 */   nop
/* 00A3C4 01DB60C4 281E0070 */  paddub      $3, $0, $0
.L01DB60C8_2F16C8:
/* 00A3C8 01DB60C8 DC01013C */  lui         $1, %hi(BtActStatus + 0x98)
/* 00A3CC 01DB60CC 1845228C */  lw          $2, %lo(BtActStatus + 0x98)($1)
/* 00A3D0 01DB60D0 02004010 */  beqz        $2, .L01DB60DC_2F16DC
/* 00A3D4 01DB60D4 00000000 */   nop
/* 00A3D8 01DB60D8 01000324 */  addiu       $3, $0, 0x1
.L01DB60DC_2F16DC:
/* 00A3DC 01DB60DC 789C848F */  lw          $4, -0x6388($28)
/* 00A3E0 01DB60E0 04008280 */  lb          $2, 0x4($4)
/* 00A3E4 01DB60E4 40100200 */  sll         $2, $2, 1
/* 00A3E8 01DB60E8 21104400 */  addu        $2, $2, $4
/* 00A3EC 01DB60EC 12004284 */  lh          $2, 0x12($2)
/* 00A3F0 01DB60F0 0200401C */  bgtz        $2, .L01DB60FC_2F16FC
/* 00A3F4 01DB60F4 00000000 */   nop
/* 00A3F8 01DB60F8 281E0070 */  paddub      $3, $0, $0
.L01DB60FC_2F16FC:
/* 00A3FC 01DB60FC 11006010 */  beqz        $3, .L01DB6144_2F1744
/* 00A400 01DB6100 00000000 */   nop
/* 00A404 01DB6104 1E000224 */  addiu       $2, $0, 0x1E
/* 00A408 01DB6108 FC9D82AF */  sw          $2, -0x6204($28)
/* 00A40C 01DB610C 01000224 */  addiu       $2, $0, 0x1
/* 00A410 01DB6110 749D82AF */  sw          $2, -0x628C($28)
/* 00A414 01DB6114 28260070 */  paddub      $4, $0, $0
/* 00A418 01DB6118 B004770C */  jal         SetMIniMapStatus__Fi
/* 00A41C 01DB611C 00000000 */   nop
/* 00A420 01DB6120 FFFF0524 */  addiu       $5, $0, -0x1
/* 00A424 01DB6124 B49D85AF */  sw          $5, -0x624C($28)
/* 00A428 01DB6128 1C9D80AF */  sw          $0, -0x62E4($28)
/* 00A42C 01DB612C 01000424 */  addiu       $4, $0, 0x1
/* 00A430 01DB6130 28360070 */  paddub      $6, $0, $0
/* 00A434 01DB6134 AC69050C */  jal         SndSePlay__Fiii
/* 00A438 01DB6138 00000000 */   nop
/* 00A43C 01DB613C 4A040010 */  b           .L.L01DB7268_2F2868$b
/* 00A440 01DB6140 00000000 */   nop
.L01DB6144_2F1744:
/* 00A444 01DB6144 D09C848F */  lw          $4, -0x6330($28)
/* 00A448 01DB6148 B000A527 */  addiu       $5, $29, 0xB0
/* 00A44C 01DB614C 3433070C */  jal         SearchDataSlotPos__16CDungeonEventManFPf
/* 00A450 01DB6150 00000000 */   nop
/* 00A454 01DB6154 28964070 */  paddub      $18, $2, $0
/* 00A458 01DB6158 34004012 */  beqz        $18, .L01DB622C_2F182C
/* 00A45C 01DB615C 00000000 */   nop
/* 00A460 01DB6160 0000428E */  lw          $2, 0x0($18)
/* 00A464 01DB6164 2C00428C */  lw          $2, 0x2C($2)
/* 00A468 01DB6168 FFFF0324 */  addiu       $3, $0, -0x1
/* 00A46C 01DB616C 2F004310 */  beq         $2, $3, .L01DB622C_2F182C
/* 00A470 01DB6170 00000000 */   nop
/* 00A474 01DB6174 D501013C */  lui         $1, %hi(BtEventInfo + 0x2C)
/* 00A478 01DB6178 6C6723AC */  sw          $3, %lo(BtEventInfo + 0x2C)($1)
/* 00A47C 01DB617C 0000428E */  lw          $2, 0x0($18)
/* 00A480 01DB6180 2000428C */  lw          $2, 0x20($2)
/* 00A484 01DB6184 1E004310 */  beq         $2, $3, .L01DB6200_2F1800
/* 00A488 01DB6188 00000000 */   nop
/* 00A48C 01DB618C D501013C */  lui         $1, %hi(BtEventInfo + 0x2C)
/* 00A490 01DB6190 6C6722AC */  sw          $2, %lo(BtEventInfo + 0x2C)($1)
/* 00A494 01DB6194 0000428E */  lw          $2, 0x0($18)
/* 00A498 01DB6198 3800428C */  lw          $2, 0x38($2)
/* 00A49C 01DB619C D501013C */  lui         $1, %hi(BtEventInfo + 0x34)
/* 00A4A0 01DB61A0 746722AC */  sw          $2, %lo(BtEventInfo + 0x34)($1)
/* 00A4A4 01DB61A4 01000224 */  addiu       $2, $0, 0x1
/* 00A4A8 01DB61A8 D501013C */  lui         $1, %hi(BtEventInfo + 0x38)
/* 00A4AC 01DB61AC 786722AC */  sw          $2, %lo(BtEventInfo + 0x38)($1)
/* 00A4B0 01DB61B0 D501013C */  lui         $1, %hi(BtEventInfo + 0x24)
/* 00A4B4 01DB61B4 646720AC */  sw          $0, %lo(BtEventInfo + 0x24)($1)
/* 00A4B8 01DB61B8 B006A427 */  addiu       $4, $29, 0x6B0
/* 00A4BC 01DB61BC 10004526 */  addiu       $5, $18, 0x10
/* 00A4C0 01DB61C0 0C86040C */  jal         sceVu0CopyVector
/* 00A4C4 01DB61C4 00000000 */   nop
/* 00A4C8 01DB61C8 C006A427 */  addiu       $4, $29, 0x6C0
/* 00A4CC 01DB61CC 20004526 */  addiu       $5, $18, 0x20
/* 00A4D0 01DB61D0 0C86040C */  jal         sceVu0CopyVector
/* 00A4D4 01DB61D4 00000000 */   nop
/* 00A4D8 01DB61D8 D501023C */  lui         $2, %hi(BtEventInfo)
/* 00A4DC 01DB61DC 40674424 */  addiu       $4, $2, %lo(BtEventInfo)
/* 00A4E0 01DB61E0 B006A527 */  addiu       $5, $29, 0x6B0
/* 00A4E4 01DB61E4 0C86040C */  jal         sceVu0CopyVector
/* 00A4E8 01DB61E8 00000000 */   nop
/* 00A4EC 01DB61EC D501023C */  lui         $2, %hi(BtEventInfo + 0x10)
/* 00A4F0 01DB61F0 50674424 */  addiu       $4, $2, %lo(BtEventInfo + 0x10)
/* 00A4F4 01DB61F4 C006A527 */  addiu       $5, $29, 0x6C0
/* 00A4F8 01DB61F8 0C86040C */  jal         sceVu0CopyVector
/* 00A4FC 01DB61FC 00000000 */   nop
.L01DB6200_2F1800:
/* 00A500 01DB6200 D501013C */  lui         $1, %hi(BtEventInfo + 0x2C)
/* 00A504 01DB6204 6C67238C */  lw          $3, %lo(BtEventInfo + 0x2C)($1)
/* 00A508 01DB6208 FFFF0224 */  addiu       $2, $0, -0x1
/* 00A50C 01DB620C 07006210 */  beq         $3, $2, .L01DB622C_2F182C
/* 00A510 01DB6210 00000000 */   nop
/* 00A514 01DB6214 01001124 */  addiu       $17, $0, 0x1
/* 00A518 01DB6218 D501013C */  lui         $1, %hi(BtEventInfo + 0x24)
/* 00A51C 01DB621C 646731AC */  sw          $17, %lo(BtEventInfo + 0x24)($1)
/* 00A520 01DB6220 D501013C */  lui         $1, %hi(BtEventInfo + 0xB4)
/* 00A524 01DB6224 F46720AC */  sw          $0, %lo(BtEventInfo + 0xB4)($1)
/* 00A528 01DB6228 90011024 */  addiu       $16, $0, 0x190
.L01DB622C_2F182C:
/* 00A52C 01DB622C E09C828F */  lw          $2, -0x6320($28)
/* 00A530 01DB6230 9400438C */  lw          $3, 0x94($2)
/* 00A534 01DB6234 FFFF0224 */  addiu       $2, $0, -0x1
/* 00A538 01DB6238 17006210 */  beq         $3, $2, .L01DB6298_2F1898
/* 00A53C 01DB623C 00000000 */   nop
/* 00A540 01DB6240 D501013C */  lui         $1, %hi(BtEventInfo + 0x2C)
/* 00A544 01DB6244 6C6723AC */  sw          $3, %lo(BtEventInfo + 0x2C)($1)
/* 00A548 01DB6248 01000224 */  addiu       $2, $0, 0x1
/* 00A54C 01DB624C D501013C */  lui         $1, %hi(BtEventInfo + 0x34)
/* 00A550 01DB6250 746722AC */  sw          $2, %lo(BtEventInfo + 0x34)($1)
/* 00A554 01DB6254 C004770C */  jal         ResetStatusInfo__Fv
/* 00A558 01DB6258 00000000 */   nop
/* 00A55C 01DB625C 01000224 */  addiu       $2, $0, 0x1
/* 00A560 01DB6260 749D82AF */  sw          $2, -0x628C($28)
/* 00A564 01DB6264 B425060C */  jal         EdFadeInit__Fv
/* 00A568 01DB6268 00000000 */   nop
/* 00A56C 01DB626C 00688044 */  mtc1        $0, $f13
/* 00A570 01DB6270 00000000 */  nop
/* 00A574 01DB6274 066B0046 */  mov.s       $f12, $f13
/* 00A578 01DB6278 866B0046 */  mov.s       $f14, $f13
/* 00A57C 01DB627C 78000424 */  addiu       $4, $0, 0x78
/* 00A580 01DB6280 E425060C */  jal         EdFadeOut__Fifff
/* 00A584 01DB6284 00000000 */   nop
/* 00A588 01DB6288 D501013C */  lui         $1, %hi(BtEventInfo + 0x90)
/* 00A58C 01DB628C D06720AC */  sw          $0, %lo(BtEventInfo + 0x90)($1)
/* 00A590 01DB6290 26021024 */  addiu       $16, $0, 0x226
/* 00A594 01DB6294 01001124 */  addiu       $17, $0, 0x1
.L01DB6298_2F1898:
/* 00A598 01DB6298 789C848F */  lw          $4, -0x6388($28)
/* 00A59C 01DB629C 24FA060C */  jal         CheckLife__11CUserStatusFv
/* 00A5A0 01DB62A0 00000000 */   nop
/* 00A5A4 01DB62A4 0F004010 */  beqz        $2, .L01DB62E4_2F18E4
/* 00A5A8 01DB62A8 00000000 */   nop
/* 00A5AC 01DB62AC E09C848F */  lw          $4, -0x6320($28)
/* 00A5B0 01DB62B0 CC5F070C */  jal         CheckEventFlag2__12CMonstorUnitFv
/* 00A5B4 01DB62B4 00000000 */   nop
/* 00A5B8 01DB62B8 FFFF0324 */  addiu       $3, $0, -0x1
/* 00A5BC 01DB62BC 09004310 */  beq         $2, $3, .L01DB62E4_2F18E4
/* 00A5C0 01DB62C0 00000000 */   nop
/* 00A5C4 01DB62C4 D501013C */  lui         $1, %hi(BtEventInfo + 0x2C)
/* 00A5C8 01DB62C8 6C6722AC */  sw          $2, %lo(BtEventInfo + 0x2C)($1)
/* 00A5CC 01DB62CC D501013C */  lui         $1, %hi(BtEventInfo + 0x34)
/* 00A5D0 01DB62D0 746720AC */  sw          $0, %lo(BtEventInfo + 0x34)($1)
/* 00A5D4 01DB62D4 DC01013C */  lui         $1, %hi(BtActStatus + 0x70)
/* 00A5D8 01DB62D8 F04420AC */  sw          $0, %lo(BtActStatus + 0x70)($1)
/* 00A5DC 01DB62DC 90011024 */  addiu       $16, $0, 0x190
/* 00A5E0 01DB62E0 01001124 */  addiu       $17, $0, 0x1
.L01DB62E4_2F18E4:
/* 00A5E4 01DB62E4 789C848F */  lw          $4, -0x6388($28)
/* 00A5E8 01DB62E8 24FA060C */  jal         CheckLife__11CUserStatusFv
/* 00A5EC 01DB62EC 00000000 */   nop
/* 00A5F0 01DB62F0 1D004010 */  beqz        $2, .L01DB6368_2F1968
/* 00A5F4 01DB62F4 00000000 */   nop
/* 00A5F8 01DB62F8 E09C848F */  lw          $4, -0x6320($28)
/* 00A5FC 01DB62FC 905E070C */  jal         GetMonstorNum__12CMonstorUnitFv
/* 00A600 01DB6300 00000000 */   nop
/* 00A604 01DB6304 1800401C */  bgtz        $2, .L01DB6368_2F1968
/* 00A608 01DB6308 00000000 */   nop
/* 00A60C 01DB630C D501013C */  lui         $1, %hi(BtEventInfo + 0xA0)
/* 00A610 01DB6310 E067228C */  lw          $2, %lo(BtEventInfo + 0xA0)($1)
/* 00A614 01DB6314 FFFF0324 */  addiu       $3, $0, -0x1
/* 00A618 01DB6318 13004310 */  beq         $2, $3, .L01DB6368_2F1968
/* 00A61C 01DB631C 00000000 */   nop
/* 00A620 01DB6320 D501013C */  lui         $1, %hi(BtEventInfo + 0x2C)
/* 00A624 01DB6324 6C6722AC */  sw          $2, %lo(BtEventInfo + 0x2C)($1)
/* 00A628 01DB6328 D501013C */  lui         $1, %hi(BtEventInfo + 0xA4)
/* 00A62C 01DB632C E467228C */  lw          $2, %lo(BtEventInfo + 0xA4)($1)
/* 00A630 01DB6330 D501013C */  lui         $1, %hi(BtEventInfo + 0x34)
/* 00A634 01DB6334 746722AC */  sw          $2, %lo(BtEventInfo + 0x34)($1)
/* 00A638 01DB6338 D501013C */  lui         $1, %hi(BtEventInfo + 0xA0)
/* 00A63C 01DB633C E06723AC */  sw          $3, %lo(BtEventInfo + 0xA0)($1)
/* 00A640 01DB6340 D501013C */  lui         $1, %hi(BtEventInfo + 0xA4)
/* 00A644 01DB6344 E46720AC */  sw          $0, %lo(BtEventInfo + 0xA4)($1)
/* 00A648 01DB6348 DC01013C */  lui         $1, %hi(BtActStatus + 0x70)
/* 00A64C 01DB634C F04420AC */  sw          $0, %lo(BtActStatus + 0x70)($1)
/* 00A650 01DB6350 DC01023C */  lui         $2, %hi(LIT_4395)
/* 00A654 01DB6354 102F4424 */  addiu       $4, $2, %lo(LIT_4395)
/* 00A658 01DB6358 A611040C */  jal         printf
/* 00A65C 01DB635C 00000000 */   nop
/* 00A660 01DB6360 90011024 */  addiu       $16, $0, 0x190
/* 00A664 01DB6364 01001124 */  addiu       $17, $0, 0x1
.L01DB6368_2F1968:
/* 00A668 01DB6368 789C848F */  lw          $4, -0x6388($28)
/* 00A66C 01DB636C 24FA060C */  jal         CheckLife__11CUserStatusFv
/* 00A670 01DB6370 00000000 */   nop
/* 00A674 01DB6374 14004010 */  beqz        $2, .L01DB63C8_2F19C8
/* 00A678 01DB6378 00000000 */   nop
/* 00A67C 01DB637C EB01023C */  lui         $2, %hi(StealItem)
/* 00A680 01DB6380 00834424 */  addiu       $4, $2, %lo(StealItem)
/* 00A684 01DB6384 785E070C */  jal         checkEvent__10CStealItemFv
/* 00A688 01DB6388 00000000 */   nop
/* 00A68C 01DB638C FFFF0324 */  addiu       $3, $0, -0x1
/* 00A690 01DB6390 0D004310 */  beq         $2, $3, .L01DB63C8_2F19C8
/* 00A694 01DB6394 00000000 */   nop
/* 00A698 01DB6398 A49D848F */  lw          $4, -0x625C($28)
/* 00A69C 01DB639C 282E4070 */  paddub      $5, $2, $0
/* 00A6A0 01DB63A0 9C4E070C */  jal         BtGetAttach_Init__Fii
/* 00A6A4 01DB63A4 00000000 */   nop
/* 00A6A8 01DB63A8 78000224 */  addiu       $2, $0, 0x78
/* 00A6AC 01DB63AC EA01013C */  lui         $1, %hi(DngMessMan + 0x8)
/* 00A6B0 01DB63B0 987622AC */  sw          $2, %lo(DngMessMan + 0x8)($1)
/* 00A6B4 01DB63B4 DF000424 */  addiu       $4, $0, 0xDF
/* 00A6B8 01DB63B8 FFFF0524 */  addiu       $5, $0, -0x1
/* 00A6BC 01DB63BC 28360070 */  paddub      $6, $0, $0
/* 00A6C0 01DB63C0 AC69050C */  jal         SndSePlay__Fiii
/* 00A6C4 01DB63C4 00000000 */   nop
.L01DB63C8_2F19C8:
/* 00A6C8 01DB63C8 789C848F */  lw          $4, -0x6388($28)
/* 00A6CC 01DB63CC 24FA060C */  jal         CheckLife__11CUserStatusFv
/* 00A6D0 01DB63D0 00000000 */   nop
/* 00A6D4 01DB63D4 1200401C */  bgtz        $2, .L01DB6420_2F1A20
/* 00A6D8 01DB63D8 00000000 */   nop
/* 00A6DC 01DB63DC DC01013C */  lui         $1, %hi(BtActStatus + 0x24)
/* 00A6E0 01DB63E0 A444228C */  lw          $2, %lo(BtActStatus + 0x24)($1)
/* 00A6E4 01DB63E4 0E004014 */  bnez        $2, .L01DB6420_2F1A20
/* 00A6E8 01DB63E8 00000000 */   nop
/* 00A6EC 01DB63EC 789C838F */  lw          $3, -0x6388($28)
/* 00A6F0 01DB63F0 04006280 */  lb          $2, 0x4($3)
/* 00A6F4 01DB63F4 40100200 */  sll         $2, $2, 1
/* 00A6F8 01DB63F8 21104300 */  addu        $2, $2, $3
/* 00A6FC 01DB63FC 120040A4 */  sh          $0, 0x12($2)
/* 00A700 01DB6400 68010224 */  addiu       $2, $0, 0x168
/* 00A704 01DB6404 089E82AF */  sw          $2, -0x61F8($28)
/* 00A708 01DB6408 3C000224 */  addiu       $2, $0, 0x3C
/* 00A70C 01DB640C 0C9E82AF */  sw          $2, -0x61F4($28)
/* 00A710 01DB6410 38FF760C */  jal         LockOffTargte__Fv
/* 00A714 01DB6414 00000000 */   nop
/* 00A718 01DB6418 C8001024 */  addiu       $16, $0, 0xC8
/* 00A71C 01DB641C 01001124 */  addiu       $17, $0, 0x1
.L01DB6420_2F1A20:
/* 00A720 01DB6420 F4EB760C */  jal         BtCheckDamageProc__Fv
/* 00A724 01DB6424 00000000 */   nop
/* 00A728 01DB6428 28964070 */  paddub      $18, $2, $0
/* 00A72C 01DB642C 02004012 */  beqz        $18, .L01DB6438_2F1A38
/* 00A730 01DB6430 00000000 */   nop
/* 00A734 01DB6434 01001124 */  addiu       $17, $0, 0x1
.L01DB6438_2F1A38:
/* 00A738 01DB6438 CC01023C */  lui         $2, %hi(GamePad)
/* 00A73C 01DB643C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 00A740 01DB6440 02000524 */  addiu       $5, $0, 0x2
/* 00A744 01DB6444 1CAE040C */  jal         Down__8CGamePadFi
/* 00A748 01DB6448 00000000 */   nop
/* 00A74C 01DB644C 11004014 */  bnez        $2, .L01DB6494_2F1A94
/* 00A750 01DB6450 00000000 */   nop
/* 00A754 01DB6454 CC01023C */  lui         $2, %hi(GamePad)
/* 00A758 01DB6458 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 00A75C 01DB645C 04000524 */  addiu       $5, $0, 0x4
/* 00A760 01DB6460 1CAE040C */  jal         Down__8CGamePadFi
/* 00A764 01DB6464 00000000 */   nop
/* 00A768 01DB6468 0A004014 */  bnez        $2, .L01DB6494_2F1A94
/* 00A76C 01DB646C 00000000 */   nop
/* 00A770 01DB6470 CC01023C */  lui         $2, %hi(GamePad)
/* 00A774 01DB6474 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 00A778 01DB6478 A09C858F */  lw          $5, -0x6360($28)
/* 00A77C 01DB647C 1CAE040C */  jal         Down__8CGamePadFi
/* 00A780 01DB6480 00000000 */   nop
/* 00A784 01DB6484 03004014 */  bnez        $2, .L01DB6494_2F1A94
/* 00A788 01DB6488 00000000 */   nop
/* 00A78C 01DB648C 76032012 */  beqz        $17, .L.L01DB7268_2F2868$b
/* 00A790 01DB6490 00000000 */   nop
.L01DB6494_2F1A94:
/* 00A794 01DB6494 F49C80AF */  sw          $0, -0x630C($28)
/* 00A798 01DB6498 A89C848F */  lw          $4, -0x6358($28)
/* 00A79C 01DB649C C092040C */  jal         FollowOn__13CCameraFollowFv
/* 00A7A0 01DB64A0 00000000 */   nop
/* 00A7A4 01DB64A4 A89C848F */  lw          $4, -0x6358($28)
/* 00A7A8 01DB64A8 609E8CC7 */  lwc1        $f12, -0x61A0($28)
/* 00A7AC 01DB64AC EC92040C */  jal         SetHeight__13CCameraFollowFf
/* 00A7B0 01DB64B0 00000000 */   nop
/* 00A7B4 01DB64B4 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 00A7B8 01DB64B8 00608244 */  mtc1        $2, $f12
/* 00A7BC 01DB64BC A89C848F */  lw          $4, -0x6358($28)
/* 00A7C0 01DB64C0 9491040C */  jal         SetSpeed__7CCameraFf
/* 00A7C4 01DB64C4 00000000 */   nop
/* 00A7C8 01DB64C8 A89C848F */  lw          $4, -0x6358($28)
/* 00A7CC 01DB64CC 01000524 */  addiu       $5, $0, 0x1
/* 00A7D0 01DB64D0 B802998C */  lw          $25, 0x2B8($4)
/* 00A7D4 01DB64D4 0800398F */  lw          $25, 0x8($25)
/* 00A7D8 01DB64D8 09F82003 */  jalr        $25
/* 00A7DC 01DB64DC 00000000 */   nop
/* 00A7E0 01DB64E0 0041023C */  lui         $2, (0x41000000 >> 16)
/* 00A7E4 01DB64E4 00608244 */  mtc1        $2, $f12
/* 00A7E8 01DB64E8 A89C848F */  lw          $4, -0x6358($28)
/* 00A7EC 01DB64EC 9491040C */  jal         SetSpeed__7CCameraFf
/* 00A7F0 01DB64F0 00000000 */   nop
/* 00A7F4 01DB64F4 EA01023C */  lui         $2, %hi(CharaMain)
/* 00A7F8 01DB64F8 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 00A7FC 01DB64FC D006A527 */  addiu       $5, $29, 0x6D0
/* 00A800 01DB6500 BC5B050C */  jal         GetRotation__7CObjectFPf
/* 00A804 01DB6504 00000000 */   nop
/* 00A808 01DB6508 AC9C80C7 */  lwc1        $f0, -0x6354($28)
/* 00A80C 01DB650C D406A0E7 */  swc1        $f0, 0x6D4($29)
/* 00A810 01DB6510 EA01023C */  lui         $2, %hi(CharaMain)
/* 00A814 01DB6514 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 00A818 01DB6518 D006A527 */  addiu       $5, $29, 0x6D0
/* 00A81C 01DB651C 78E4040C */  jal         SetRotation__10CCharacterFPf
/* 00A820 01DB6520 00000000 */   nop
/* 00A824 01DB6524 01000324 */  addiu       $3, $0, 0x1
/* 00A828 01DB6528 DC01013C */  lui         $1, %hi(BtActStatus)
/* 00A82C 01DB652C 804423AC */  sw          $3, %lo(BtActStatus)($1)
/* 00A830 01DB6530 B49C80AF */  sw          $0, -0x634C($28)
/* 00A834 01DB6534 C09C828F */  lw          $2, -0x6340($28)
/* 00A838 01DB6538 BC9C82AF */  sw          $2, -0x6344($28)
/* 00A83C 01DB653C 789C828F */  lw          $2, -0x6388($28)
/* 00A840 01DB6540 04004280 */  lb          $2, 0x4($2)
/* 00A844 01DB6544 05004314 */  bne         $2, $3, .L01DB655C_2F1B5C
/* 00A848 01DB6548 00000000 */   nop
/* 00A84C 01DB654C 009D848F */  lw          $4, -0x6300($28)
/* 00A850 01DB6550 282E0070 */  paddub      $5, $0, $0
/* 00A854 01DB6554 64E5760C */  jal         EquipReAttach__FP10CCharacteri
/* 00A858 01DB6558 00000000 */   nop
.L01DB655C_2F1B5C:
/* 00A85C 01DB655C A49C858F */  lw          $5, -0x635C($28)
/* 00A860 01DB6560 FFFF0224 */  addiu       $2, $0, -0x1
/* 00A864 01DB6564 0B00A210 */  beq         $5, $2, .L01DB6594_2F1B94
/* 00A868 01DB6568 00000000 */   nop
/* 00A86C 01DB656C 789C828F */  lw          $2, -0x6388($28)
/* 00A870 01DB6570 04004380 */  lb          $3, 0x4($2)
/* 00A874 01DB6574 03000224 */  addiu       $2, $0, 0x3
/* 00A878 01DB6578 06006214 */  bne         $3, $2, .L01DB6594_2F1B94
/* 00A87C 01DB657C 00000000 */   nop
/* 00A880 01DB6580 FC9C848F */  lw          $4, -0x6304($28)
/* 00A884 01DB6584 04B3060C */  jal         OffEffect__12CSHOT_EFFECTFi
/* 00A888 01DB6588 00000000 */   nop
/* 00A88C 01DB658C FFFF0224 */  addiu       $2, $0, -0x1
/* 00A890 01DB6590 A49C82AF */  sw          $2, -0x635C($28)
.L01DB6594_2F1B94:
/* 00A894 01DB6594 07004016 */  bnez        $18, .L01DB65B4_2F1BB4
/* 00A898 01DB6598 00000000 */   nop
/* 00A89C 01DB659C DC01013C */  lui         $1, %hi(BtActStatus + 0x28)
/* 00A8A0 01DB65A0 A84420AC */  sw          $0, %lo(BtActStatus + 0x28)($1)
/* 00A8A4 01DB65A4 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 00A8A8 01DB65A8 8C4420AC */  sw          $0, %lo(BtActStatus + 0xC)($1)
/* 00A8AC 01DB65AC DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 00A8B0 01DB65B0 904420AC */  sw          $0, %lo(BtActStatus + 0x10)($1)
.L01DB65B4_2F1BB4:
/* 00A8B4 01DB65B4 FC9D90AF */  sw          $16, -0x6204($28)
/* 00A8B8 01DB65B8 2B030010 */  b           .L.L01DB7268_2F2868$b
/* 00A8BC 01DB65BC 00000000 */   nop
.L01DB65C0_2F1BC0:
/* 00A8C0 01DB65C0 249D828F */  lw          $2, -0x62DC($28)
/* 00A8C4 01DB65C4 209D82AF */  sw          $2, -0x62E0($28)
/* 00A8C8 01DB65C8 A0FF0224 */  addiu       $2, $0, -0x60
/* 00A8CC 01DB65CC 249D82AF */  sw          $2, -0x62DC($28)
/* 00A8D0 01DB65D0 FFFF0224 */  addiu       $2, $0, -0x1
/* 00A8D4 01DB65D4 B49D82AF */  sw          $2, -0x624C($28)
/* 00A8D8 01DB65D8 949C82AF */  sw          $2, -0x636C($28)
/* 00A8DC 01DB65DC 909C82AF */  sw          $2, -0x6370($28)
/* 00A8E0 01DB65E0 649D80AF */  sw          $0, -0x629C($28)
/* 00A8E4 01DB65E4 01000224 */  addiu       $2, $0, 0x1
/* 00A8E8 01DB65E8 349E82AF */  sw          $2, -0x61CC($28)
/* 00A8EC 01DB65EC 00608044 */  mtc1        $0, $f12
/* 00A8F0 01DB65F0 A89C848F */  lw          $4, -0x6358($28)
/* 00A8F4 01DB65F4 9491040C */  jal         SetSpeed__7CCameraFf
/* 00A8F8 01DB65F8 00000000 */   nop
/* 00A8FC 01DB65FC EA01013C */  lui         $1, %hi(DngMessMan)
/* 00A900 01DB6600 907620AC */  sw          $0, %lo(DngMessMan)($1)
/* 00A904 01DB6604 FFFF0224 */  addiu       $2, $0, -0x1
/* 00A908 01DB6608 EA01013C */  lui         $1, %hi(DngMessMan + 0x24)
/* 00A90C 01DB660C B47622AC */  sw          $2, %lo(DngMessMan + 0x24)($1)
/* 00A910 01DB6610 EA01013C */  lui         $1, %hi(DngMessMan + 0x4)
/* 00A914 01DB6614 947620AC */  sw          $0, %lo(DngMessMan + 0x4)($1)
/* 00A918 01DB6618 EA01013C */  lui         $1, %hi(DngMessMan + 0x1C)
/* 00A91C 01DB661C AC7620AC */  sw          $0, %lo(DngMessMan + 0x1C)($1)
/* 00A920 01DB6620 EA01013C */  lui         $1, %hi(DngMessMan + 0x20)
/* 00A924 01DB6624 B07620AC */  sw          $0, %lo(DngMessMan + 0x20)($1)
/* 00A928 01DB6628 EA01013C */  lui         $1, %hi(DngMessMan + 0x8)
/* 00A92C 01DB662C 987620AC */  sw          $0, %lo(DngMessMan + 0x8)($1)
/* 00A930 01DB6630 3480050C */  jal         ClearSystemMes__Fv
/* 00A934 01DB6634 00000000 */   nop
/* 00A938 01DB6638 01000224 */  addiu       $2, $0, 0x1
/* 00A93C 01DB663C 749D82AF */  sw          $2, -0x628C($28)
/* 00A940 01DB6640 FC9D828F */  lw          $2, -0x6204($28)
/* 00A944 01DB6644 01004224 */  addiu       $2, $2, 0x1
/* 00A948 01DB6648 FC9D82AF */  sw          $2, -0x6204($28)
/* 00A94C 01DB664C 06030010 */  b           .L.L01DB7268_2F2868$b
/* 00A950 01DB6650 00000000 */   nop
.L01DB6654_2F1C54:
/* 00A954 01DB6654 649D838F */  lw          $3, -0x629C($28)
/* 00A958 01DB6658 03006128 */  slti        $1, $3, 0x3
/* 00A95C 01DB665C 05002010 */  beqz        $1, .L01DB6674_2F1C74
/* 00A960 01DB6660 00000000 */   nop
/* 00A964 01DB6664 01006224 */  addiu       $2, $3, 0x1
/* 00A968 01DB6668 649D82AF */  sw          $2, -0x629C($28)
/* 00A96C 01DB666C FE020010 */  b           .L.L01DB7268_2F2868$b
/* 00A970 01DB6670 00000000 */   nop
.L01DB6674_2F1C74:
/* 00A974 01DB6674 01000324 */  addiu       $3, $0, 0x1
/* 00A978 01DB6678 789D83AF */  sw          $3, -0x6288($28)
/* 00A97C 01DB667C 02004224 */  addiu       $2, $2, 0x2
/* 00A980 01DB6680 FC9D82AF */  sw          $2, -0x6204($28)
/* 00A984 01DB6684 F8020010 */  b           .L.L01DB7268_2F2868$b
/* 00A988 01DB6688 00000000 */   nop
.L01DB668C_2F1C8C:
/* 00A98C 01DB668C 01004224 */  addiu       $2, $2, 0x1
/* 00A990 01DB6690 FC9D82AF */  sw          $2, -0x6204($28)
/* 00A994 01DB6694 F4020010 */  b           .L.L01DB7268_2F2868$b
/* 00A998 01DB6698 00000000 */   nop
.L01DB669C_2F1C9C:
/* 00A99C 01DB669C 789D80AF */  sw          $0, -0x6288($28)
/* 00A9A0 01DB66A0 DC01023C */  lui         $2, %hi(LIT_2646)
/* 00A9A4 01DB66A4 90274224 */  addiu       $2, $2, %lo(LIT_2646)
/* 00A9A8 01DB66A8 E006A427 */  addiu       $4, $29, 0x6E0
/* 00A9AC 01DB66AC 00004378 */  lq          $3, 0x0($2)
/* 00A9B0 01DB66B0 100042C4 */  lwc1        $f2, 0x10($2)
/* 00A9B4 01DB66B4 0000837C */  sq          $3, 0x0($4)
/* 00A9B8 01DB66B8 100082E4 */  swc1        $f2, 0x10($4)
/* 00A9BC 01DB66BC 282E0070 */  paddub      $5, $0, $0
/* 00A9C0 01DB66C0 3CD7070C */  jal         BattleMenuInit__FPii
/* 00A9C4 01DB66C4 00000000 */   nop
/* 00A9C8 01DB66C8 02000224 */  addiu       $2, $0, 0x2
/* 00A9CC 01DB66CC 6C9D82AF */  sw          $2, -0x6294($28)
/* 00A9D0 01DB66D0 809D828F */  lw          $2, -0x6280($28)
/* 00A9D4 01DB66D4 008B82AF */  sw          $2, -0x7500($28)
/* 00A9D8 01DB66D8 0041023C */  lui         $2, (0x41000000 >> 16)
/* 00A9DC 01DB66DC 00608244 */  mtc1        $2, $f12
/* 00A9E0 01DB66E0 A89C848F */  lw          $4, -0x6358($28)
/* 00A9E4 01DB66E4 9491040C */  jal         SetSpeed__7CCameraFf
/* 00A9E8 01DB66E8 00000000 */   nop
/* 00A9EC 01DB66EC 749D80AF */  sw          $0, -0x628C($28)
/* 00A9F0 01DB66F0 20000224 */  addiu       $2, $0, 0x20
/* 00A9F4 01DB66F4 249D82AF */  sw          $2, -0x62DC($28)
/* 00A9F8 01DB66F8 FFFF0224 */  addiu       $2, $0, -0x1
/* 00A9FC 01DB66FC EB01013C */  lui         $1, %hi(DngMes1 + 0x16BC)
/* 00AA00 01DB6700 DC7A22AC */  sw          $2, %lo(DngMes1 + 0x16BC)($1)
/* 00AA04 01DB6704 EC01013C */  lui         $1, %hi(DngMes2 + 0x16BC)
/* 00AA08 01DB6708 9C9222AC */  sw          $2, %lo(DngMes2 + 0x16BC)($1)
/* 00AA0C 01DB670C EC01013C */  lui         $1, %hi(DngMesStb + 0x16BC)
/* 00AA10 01DB6710 5CAA22AC */  sw          $2, %lo(DngMesStb + 0x16BC)($1)
/* 00AA14 01DB6714 01000324 */  addiu       $3, $0, 0x1
/* 00AA18 01DB6718 C88683AF */  sw          $3, -0x7938($28)
/* 00AA1C 01DB671C CC8683AF */  sw          $3, -0x7934($28)
/* 00AA20 01DB6720 EA01013C */  lui         $1, %hi(DngMessMan)
/* 00AA24 01DB6724 907623AC */  sw          $3, %lo(DngMessMan)($1)
/* 00AA28 01DB6728 EA01013C */  lui         $1, %hi(DngMessMan + 0x24)
/* 00AA2C 01DB672C B47622AC */  sw          $2, %lo(DngMessMan + 0x24)($1)
/* 00AA30 01DB6730 EA01013C */  lui         $1, %hi(DngMessMan + 0x4)
/* 00AA34 01DB6734 947620AC */  sw          $0, %lo(DngMessMan + 0x4)($1)
/* 00AA38 01DB6738 EA01013C */  lui         $1, %hi(DngMessMan + 0x1C)
/* 00AA3C 01DB673C AC7620AC */  sw          $0, %lo(DngMessMan + 0x1C)($1)
/* 00AA40 01DB6740 EA01013C */  lui         $1, %hi(DngMessMan + 0x20)
/* 00AA44 01DB6744 B07620AC */  sw          $0, %lo(DngMessMan + 0x20)($1)
/* 00AA48 01DB6748 0A000224 */  addiu       $2, $0, 0xA
/* 00AA4C 01DB674C EA01013C */  lui         $1, %hi(DngMessMan + 0x8)
/* 00AA50 01DB6750 987622AC */  sw          $2, %lo(DngMessMan + 0x8)($1)
/* 00AA54 01DB6754 349E80AF */  sw          $0, -0x61CC($28)
/* 00AA58 01DB6758 E601013C */  lui         $1, %hi(EnemyLifeGage + 0x14)
/* 00AA5C 01DB675C 348F23AC */  sw          $3, %lo(EnemyLifeGage + 0x14)($1)
/* 00AA60 01DB6760 5CFA760C */  jal         autoCamTrial__Fv
/* 00AA64 01DB6764 00000000 */   nop
/* 00AA68 01DB6768 FC9D828F */  lw          $2, -0x6204($28)
/* 00AA6C 01DB676C 01004224 */  addiu       $2, $2, 0x1
/* 00AA70 01DB6770 FC9D82AF */  sw          $2, -0x6204($28)
/* 00AA74 01DB6774 BC020010 */  b           .L.L01DB7268_2F2868$b
/* 00AA78 01DB6778 00000000 */   nop
.L01DB677C_2F1D7C:
/* 00AA7C 01DB677C CC94828F */  lw          $2, -0x6B34($28)
/* 00AA80 01DB6780 07004010 */  beqz        $2, .L01DB67A0_2F1DA0
/* 00AA84 01DB6784 00000000 */   nop
/* 00AA88 01DB6788 AA000224 */  addiu       $2, $0, 0xAA
/* 00AA8C 01DB678C FC9D82AF */  sw          $2, -0x6204($28)
/* 00AA90 01DB6790 5CFA760C */  jal         autoCamTrial__Fv
/* 00AA94 01DB6794 00000000 */   nop
/* 00AA98 01DB6798 B3020010 */  b           .L.L01DB7268_2F2868$b
/* 00AA9C 01DB679C 00000000 */   nop
.L01DB67A0_2F1DA0:
/* 00AAA0 01DB67A0 789C848F */  lw          $4, -0x6388($28)
/* 00AAA4 01DB67A4 3C43838C */  lw          $3, 0x433C($4)
/* 00AAA8 01DB67A8 03000224 */  addiu       $2, $0, 0x3
/* 00AAAC 01DB67AC 06006210 */  beq         $3, $2, .L01DB67C8_2F1DC8
/* 00AAB0 01DB67B0 00000000 */   nop
/* 00AAB4 01DB67B4 01000224 */  addiu       $2, $0, 0x1
/* 00AAB8 01DB67B8 C09D82AF */  sw          $2, -0x6240($28)
/* 00AABC 01DB67BC C49D82AF */  sw          $2, -0x623C($28)
/* 00AAC0 01DB67C0 03000010 */  b           .L01DB67D0_2F1DD0
/* 00AAC4 01DB67C4 00000000 */   nop
.L01DB67C8_2F1DC8:
/* 00AAC8 01DB67C8 C09D80AF */  sw          $0, -0x6240($28)
/* 00AACC 01DB67CC C49D80AF */  sw          $0, -0x623C($28)
.L01DB67D0_2F1DD0:
/* 00AAD0 01DB67D0 04008280 */  lb          $2, 0x4($4)
/* 00AAD4 01DB67D4 809D82AF */  sw          $2, -0x6280($28)
/* 00AAD8 01DB67D8 008B838F */  lw          $3, -0x7500($28)
/* 00AADC 01DB67DC 809D828F */  lw          $2, -0x6280($28)
/* 00AAE0 01DB67E0 3C006210 */  beq         $3, $2, .L01DB68D4_2F1ED4
/* 00AAE4 01DB67E4 00000000 */   nop
/* 00AAE8 01DB67E8 22010224 */  addiu       $2, $0, 0x122
/* 00AAEC 01DB67EC FC9D82AF */  sw          $2, -0x6204($28)
/* 00AAF0 01DB67F0 5CFA760C */  jal         autoCamTrial__Fv
/* 00AAF4 01DB67F4 00000000 */   nop
/* 00AAF8 01DB67F8 B49C828F */  lw          $2, -0x634C($28)
/* 00AAFC 01DB67FC 9A024010 */  beqz        $2, .L.L01DB7268_2F2868$b
/* 00AB00 01DB6800 00000000 */   nop
/* 00AB04 01DB6804 F49C80AF */  sw          $0, -0x630C($28)
/* 00AB08 01DB6808 A89C848F */  lw          $4, -0x6358($28)
/* 00AB0C 01DB680C C092040C */  jal         FollowOn__13CCameraFollowFv
/* 00AB10 01DB6810 00000000 */   nop
/* 00AB14 01DB6814 A89C848F */  lw          $4, -0x6358($28)
/* 00AB18 01DB6818 609E8CC7 */  lwc1        $f12, -0x61A0($28)
/* 00AB1C 01DB681C EC92040C */  jal         SetHeight__13CCameraFollowFf
/* 00AB20 01DB6820 00000000 */   nop
/* 00AB24 01DB6824 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 00AB28 01DB6828 00608244 */  mtc1        $2, $f12
/* 00AB2C 01DB682C A89C848F */  lw          $4, -0x6358($28)
/* 00AB30 01DB6830 9491040C */  jal         SetSpeed__7CCameraFf
/* 00AB34 01DB6834 00000000 */   nop
/* 00AB38 01DB6838 A89C848F */  lw          $4, -0x6358($28)
/* 00AB3C 01DB683C 01000524 */  addiu       $5, $0, 0x1
/* 00AB40 01DB6840 B802998C */  lw          $25, 0x2B8($4)
/* 00AB44 01DB6844 0800398F */  lw          $25, 0x8($25)
/* 00AB48 01DB6848 09F82003 */  jalr        $25
/* 00AB4C 01DB684C 00000000 */   nop
/* 00AB50 01DB6850 0041023C */  lui         $2, (0x41000000 >> 16)
/* 00AB54 01DB6854 00608244 */  mtc1        $2, $f12
/* 00AB58 01DB6858 A89C848F */  lw          $4, -0x6358($28)
/* 00AB5C 01DB685C 9491040C */  jal         SetSpeed__7CCameraFf
/* 00AB60 01DB6860 00000000 */   nop
/* 00AB64 01DB6864 EA01023C */  lui         $2, %hi(CharaMain)
/* 00AB68 01DB6868 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 00AB6C 01DB686C 0007A527 */  addiu       $5, $29, 0x700
/* 00AB70 01DB6870 BC5B050C */  jal         GetRotation__7CObjectFPf
/* 00AB74 01DB6874 00000000 */   nop
/* 00AB78 01DB6878 AC9C80C7 */  lwc1        $f0, -0x6354($28)
/* 00AB7C 01DB687C 0407A0E7 */  swc1        $f0, 0x704($29)
/* 00AB80 01DB6880 EA01023C */  lui         $2, %hi(CharaMain)
/* 00AB84 01DB6884 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 00AB88 01DB6888 0007A527 */  addiu       $5, $29, 0x700
/* 00AB8C 01DB688C 78E4040C */  jal         SetRotation__10CCharacterFPf
/* 00AB90 01DB6890 00000000 */   nop
/* 00AB94 01DB6894 01000324 */  addiu       $3, $0, 0x1
/* 00AB98 01DB6898 DC01013C */  lui         $1, %hi(BtActStatus)
/* 00AB9C 01DB689C 804423AC */  sw          $3, %lo(BtActStatus)($1)
/* 00ABA0 01DB68A0 B49C80AF */  sw          $0, -0x634C($28)
/* 00ABA4 01DB68A4 C09C828F */  lw          $2, -0x6340($28)
/* 00ABA8 01DB68A8 BC9C82AF */  sw          $2, -0x6344($28)
/* 00ABAC 01DB68AC 789C828F */  lw          $2, -0x6388($28)
/* 00ABB0 01DB68B0 04004280 */  lb          $2, 0x4($2)
/* 00ABB4 01DB68B4 6C024314 */  bne         $2, $3, .L.L01DB7268_2F2868$b
/* 00ABB8 01DB68B8 00000000 */   nop
/* 00ABBC 01DB68BC 009D848F */  lw          $4, -0x6300($28)
/* 00ABC0 01DB68C0 282E0070 */  paddub      $5, $0, $0
/* 00ABC4 01DB68C4 64E5760C */  jal         EquipReAttach__FP10CCharacteri
/* 00ABC8 01DB68C8 00000000 */   nop
/* 00ABCC 01DB68CC 66020010 */  b           .L.L01DB7268_2F2868$b
/* 00ABD0 01DB68D0 00000000 */   nop
.L01DB68D4_2F1ED4:
/* 00ABD4 01DB68D4 009D838F */  lw          $3, -0x6300($28)
/* 00ABD8 01DB68D8 E601023C */  lui         $2, %hi(CWeaponFx)
/* 00ABDC 01DB68DC 408F4424 */  addiu       $4, $2, %lo(CWeaponFx)
/* 00ABE0 01DB68E0 BC00658C */  lw          $5, 0xBC($3)
/* 00ABE4 01DB68E4 DC01023C */  lui         $2, %hi(LIT_4408)
/* 00ABE8 01DB68E8 982F4624 */  addiu       $6, $2, %lo(LIT_4408)
/* 00ABEC 01DB68EC DC01023C */  lui         $2, %hi(LIT_4409)
/* 00ABF0 01DB68F0 A02F4724 */  addiu       $7, $2, %lo(LIT_4409)
/* 00ABF4 01DB68F4 7059070C */  jal         InitSet__13CWeaponEffectFP6CFramePcPc
/* 00ABF8 01DB68F8 00000000 */   nop
/* 00ABFC 01DB68FC 049D848F */  lw          $4, -0x62FC($28)
/* 00AC00 01DB6900 A896080C */  jal         SetWeaponAttachStatus__FP11WEAPON_HAVE
/* 00AC04 01DB6904 00000000 */   nop
/* 00AC08 01DB6908 80E7760C */  jal         SetWeaponColor__Fv
/* 00AC0C 01DB690C 00000000 */   nop
/* 00AC10 01DB6910 5CFA760C */  jal         autoCamTrial__Fv
/* 00AC14 01DB6914 00000000 */   nop
/* 00AC18 01DB6918 B49C828F */  lw          $2, -0x634C($28)
/* 00AC1C 01DB691C 05004010 */  beqz        $2, .L01DB6934_2F1F34
/* 00AC20 01DB6920 00000000 */   nop
/* 00AC24 01DB6924 0A000224 */  addiu       $2, $0, 0xA
/* 00AC28 01DB6928 FC9D82AF */  sw          $2, -0x6204($28)
/* 00AC2C 01DB692C 4E020010 */  b           .L.L01DB7268_2F2868$b
/* 00AC30 01DB6930 00000000 */   nop
.L01DB6934_2F1F34:
/* 00AC34 01DB6934 FC9D80AF */  sw          $0, -0x6204($28)
/* 00AC38 01DB6938 4B020010 */  b           .L.L01DB7268_2F2868$b
/* 00AC3C 01DB693C 00000000 */   nop
.L01DB6940_2F1F40:
/* 00AC40 01DB6940 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 00AC44 01DB6944 904420AC */  sw          $0, %lo(BtActStatus + 0x10)($1)
/* 00AC48 01DB6948 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 00AC4C 01DB694C 8C4420AC */  sw          $0, %lo(BtActStatus + 0xC)($1)
/* 00AC50 01DB6950 FC9D80AF */  sw          $0, -0x6204($28)
/* 00AC54 01DB6954 EB01013C */  lui         $1, %hi(NewChangeFx + 0xC68)
/* 00AC58 01DB6958 384720AC */  sw          $0, %lo(NewChangeFx + 0xC68)($1)
/* 00AC5C 01DB695C 06000224 */  addiu       $2, $0, 0x6
/* 00AC60 01DB6960 EB01013C */  lui         $1, %hi(NewChangeFx + 0xC64)
/* 00AC64 01DB6964 344722AC */  sw          $2, %lo(NewChangeFx + 0xC64)($1)
/* 00AC68 01DB6968 80BF023C */  lui         $2, (0xBF800000 >> 16)
/* 00AC6C 01DB696C EB01013C */  lui         $1, %hi(NewChangeFx + 0xC60)
/* 00AC70 01DB6970 304722AC */  sw          $2, %lo(NewChangeFx + 0xC60)($1)
/* 00AC74 01DB6974 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 00AC78 01DB6978 EB01013C */  lui         $1, %hi(NewChangeFx + 0x2F0)
/* 00AC7C 01DB697C C03D22AC */  sw          $2, %lo(NewChangeFx + 0x2F0)($1)
/* 00AC80 01DB6980 01000224 */  addiu       $2, $0, 0x1
/* 00AC84 01DB6984 289D82AF */  sw          $2, -0x62D8($28)
/* 00AC88 01DB6988 186C050C */  jal         SndSeSeqAllStop__Fv
/* 00AC8C 01DB698C 00000000 */   nop
/* 00AC90 01DB6990 DC01023C */  lui         $2, %hi(LIT_4410)
/* 00AC94 01DB6994 A82F4424 */  addiu       $4, $2, %lo(LIT_4410)
/* 00AC98 01DB6998 A611040C */  jal         printf
/* 00AC9C 01DB699C 00000000 */   nop
/* 00ACA0 01DB69A0 DC01013C */  lui         $1, %hi(BtActStatus + 0xE4)
/* 00ACA4 01DB69A4 6445228C */  lw          $2, %lo(BtActStatus + 0xE4)($1)
/* 00ACA8 01DB69A8 16004010 */  beqz        $2, .L01DB6A04_2F2004
/* 00ACAC 01DB69AC 00000000 */   nop
/* 00ACB0 01DB69B0 A0000224 */  addiu       $2, $0, 0xA0
/* 00ACB4 01DB69B4 DC01013C */  lui         $1, %hi(BtActStatus + 0x24)
/* 00ACB8 01DB69B8 A44422AC */  sw          $2, %lo(BtActStatus + 0x24)($1)
/* 00ACBC 01DB69BC 2043023C */  lui         $2, (0x43200000 >> 16)
/* 00ACC0 01DB69C0 00608244 */  mtc1        $2, $f12
/* 00ACC4 01DB69C4 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 00ACC8 01DB69C8 00688244 */  mtc1        $2, $f13
/* 00ACCC 01DB69CC 7F43023C */  lui         $2, (0x437F0000 >> 16)
/* 00ACD0 01DB69D0 00708244 */  mtc1        $2, $f14
/* 00ACD4 01DB69D4 00788044 */  mtc1        $0, $f15
/* 00ACD8 01DB69D8 00000000 */  nop
/* 00ACDC 01DB69DC 067C0046 */  mov.s       $f16, $f15
/* 00ACE0 01DB69E0 0004770C */  jal         setUnitAmbientAnime__Ffffff
/* 00ACE4 01DB69E4 00000000 */   nop
/* 00ACE8 01DB69E8 0F000424 */  addiu       $4, $0, 0xF
/* 00ACEC 01DB69EC FFFF0524 */  addiu       $5, $0, -0x1
/* 00ACF0 01DB69F0 28360070 */  paddub      $6, $0, $0
/* 00ACF4 01DB69F4 AC69050C */  jal         SndSePlay__Fiii
/* 00ACF8 01DB69F8 00000000 */   nop
/* 00ACFC 01DB69FC 11000010 */  b           .L01DB6A44_2F2044
/* 00AD00 01DB6A00 00000000 */   nop
.L01DB6A04_2F2004:
/* 00AD04 01DB6A04 B442023C */  lui         $2, (0x42B40000 >> 16)
/* 00AD08 01DB6A08 00608244 */  mtc1        $2, $f12
/* 00AD0C 01DB6A0C 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 00AD10 01DB6A10 00688244 */  mtc1        $2, $f13
/* 00AD14 01DB6A14 7A43023C */  lui         $2, (0x437A0000 >> 16)
/* 00AD18 01DB6A18 00708244 */  mtc1        $2, $f14
/* 00AD1C 01DB6A1C 00000000 */  nop
/* 00AD20 01DB6A20 C6730046 */  mov.s       $f15, $f14
/* 00AD24 01DB6A24 06740046 */  mov.s       $f16, $f14
/* 00AD28 01DB6A28 0004770C */  jal         setUnitAmbientAnime__Ffffff
/* 00AD2C 01DB6A2C 00000000 */   nop
/* 00AD30 01DB6A30 0F000424 */  addiu       $4, $0, 0xF
/* 00AD34 01DB6A34 FFFF0524 */  addiu       $5, $0, -0x1
/* 00AD38 01DB6A38 28360070 */  paddub      $6, $0, $0
/* 00AD3C 01DB6A3C AC69050C */  jal         SndSePlay__Fiii
/* 00AD40 01DB6A40 00000000 */   nop
.L01DB6A44_2F2044:
/* 00AD44 01DB6A44 DC01013C */  lui         $1, %hi(BtActStatus + 0xE4)
/* 00AD48 01DB6A48 644520AC */  sw          $0, %lo(BtActStatus + 0xE4)($1)
/* 00AD4C 01DB6A4C 5CFA760C */  jal         autoCamTrial__Fv
/* 00AD50 01DB6A50 00000000 */   nop
/* 00AD54 01DB6A54 04020010 */  b           .L.L01DB7268_2F2868$b
/* 00AD58 01DB6A58 00000000 */   nop
.L01DB6A5C_2F205C:
/* 00AD5C 01DB6A5C B44C070C */  jal         BtMiniChrSelect_Loop__Fv
/* 00AD60 01DB6A60 00000000 */   nop
/* 00AD64 01DB6A64 37004010 */  beqz        $2, .L01DB6B44_2F2144
/* 00AD68 01DB6A68 00000000 */   nop
/* 00AD6C 01DB6A6C 5494838F */  lw          $3, -0x6BAC($28)
/* 00AD70 01DB6A70 02000224 */  addiu       $2, $0, 0x2
/* 00AD74 01DB6A74 0C006214 */  bne         $3, $2, .L01DB6AA8_2F20A8
/* 00AD78 01DB6A78 00000000 */   nop
/* 00AD7C 01DB6A7C 3480050C */  jal         ClearSystemMes__Fv
/* 00AD80 01DB6A80 00000000 */   nop
/* 00AD84 01DB6A84 01000224 */  addiu       $2, $0, 0x1
/* 00AD88 01DB6A88 749D82AF */  sw          $2, -0x628C($28)
/* 00AD8C 01DB6A8C AF000224 */  addiu       $2, $0, 0xAF
/* 00AD90 01DB6A90 FC9D82AF */  sw          $2, -0x6204($28)
/* 00AD94 01DB6A94 789C848F */  lw          $4, -0x6388($28)
/* 00AD98 01DB6A98 BCFB060C */  jal         SetDead__14CDngStatusDataFv
/* 00AD9C 01DB6A9C 00000000 */   nop
/* 00ADA0 01DB6AA0 F1010010 */  b           .L.L01DB7268_2F2868$b
/* 00ADA4 01DB6AA4 00000000 */   nop
.L01DB6AA8_2F20A8:
/* 00ADA8 01DB6AA8 008B838F */  lw          $3, -0x7500($28)
/* 00ADAC 01DB6AAC 809D828F */  lw          $2, -0x6280($28)
/* 00ADB0 01DB6AB0 13006214 */  bne         $3, $2, .L01DB6B00_2F2100
/* 00ADB4 01DB6AB4 00000000 */   nop
/* 00ADB8 01DB6AB8 FFFF0224 */  addiu       $2, $0, -0x1
/* 00ADBC 01DB6ABC EB01013C */  lui         $1, %hi(DngMes1 + 0x16BC)
/* 00ADC0 01DB6AC0 DC7A22AC */  sw          $2, %lo(DngMes1 + 0x16BC)($1)
/* 00ADC4 01DB6AC4 EC01013C */  lui         $1, %hi(DngMes2 + 0x16BC)
/* 00ADC8 01DB6AC8 9C9222AC */  sw          $2, %lo(DngMes2 + 0x16BC)($1)
/* 00ADCC 01DB6ACC EC01013C */  lui         $1, %hi(DngMesStb + 0x16BC)
/* 00ADD0 01DB6AD0 5CAA22AC */  sw          $2, %lo(DngMesStb + 0x16BC)($1)
/* 00ADD4 01DB6AD4 01000224 */  addiu       $2, $0, 0x1
/* 00ADD8 01DB6AD8 C88682AF */  sw          $2, -0x7938($28)
/* 00ADDC 01DB6ADC CC8682AF */  sw          $2, -0x7934($28)
/* 00ADE0 01DB6AE0 EA01013C */  lui         $1, %hi(DngMessMan)
/* 00ADE4 01DB6AE4 907622AC */  sw          $2, %lo(DngMessMan)($1)
/* 00ADE8 01DB6AE8 349E80AF */  sw          $0, -0x61CC($28)
/* 00ADEC 01DB6AEC E601013C */  lui         $1, %hi(EnemyLifeGage + 0x14)
/* 00ADF0 01DB6AF0 348F22AC */  sw          $2, %lo(EnemyLifeGage + 0x14)($1)
/* 00ADF4 01DB6AF4 FC9D80AF */  sw          $0, -0x6204($28)
/* 00ADF8 01DB6AF8 12000010 */  b           .L01DB6B44_2F2144
/* 00ADFC 01DB6AFC 00000000 */   nop
.L01DB6B00_2F2100:
/* 00AE00 01DB6B00 FFFF0224 */  addiu       $2, $0, -0x1
/* 00AE04 01DB6B04 EB01013C */  lui         $1, %hi(DngMes1 + 0x16BC)
/* 00AE08 01DB6B08 DC7A22AC */  sw          $2, %lo(DngMes1 + 0x16BC)($1)
/* 00AE0C 01DB6B0C EC01013C */  lui         $1, %hi(DngMes2 + 0x16BC)
/* 00AE10 01DB6B10 9C9222AC */  sw          $2, %lo(DngMes2 + 0x16BC)($1)
/* 00AE14 01DB6B14 EC01013C */  lui         $1, %hi(DngMesStb + 0x16BC)
/* 00AE18 01DB6B18 5CAA22AC */  sw          $2, %lo(DngMesStb + 0x16BC)($1)
/* 00AE1C 01DB6B1C 01000224 */  addiu       $2, $0, 0x1
/* 00AE20 01DB6B20 C88682AF */  sw          $2, -0x7938($28)
/* 00AE24 01DB6B24 CC8682AF */  sw          $2, -0x7934($28)
/* 00AE28 01DB6B28 EA01013C */  lui         $1, %hi(DngMessMan)
/* 00AE2C 01DB6B2C 907622AC */  sw          $2, %lo(DngMessMan)($1)
/* 00AE30 01DB6B30 349E80AF */  sw          $0, -0x61CC($28)
/* 00AE34 01DB6B34 E601013C */  lui         $1, %hi(EnemyLifeGage + 0x14)
/* 00AE38 01DB6B38 348F22AC */  sw          $2, %lo(EnemyLifeGage + 0x14)($1)
/* 00AE3C 01DB6B3C 22010224 */  addiu       $2, $0, 0x122
/* 00AE40 01DB6B40 FC9D82AF */  sw          $2, -0x6204($28)
.L01DB6B44_2F2144:
/* 00AE44 01DB6B44 5CFA760C */  jal         autoCamTrial__Fv
/* 00AE48 01DB6B48 00000000 */   nop
/* 00AE4C 01DB6B4C C6010010 */  b           .L.L01DB7268_2F2868$b
/* 00AE50 01DB6B50 00000000 */   nop
.L01DB6B54_2F2154:
/* 00AE54 01DB6B54 FC44070C */  jal         BtGetTreasureboxBig_Init__Fv
/* 00AE58 01DB6B58 00000000 */   nop
/* 00AE5C 01DB6B5C FC9D828F */  lw          $2, -0x6204($28)
/* 00AE60 01DB6B60 01004224 */  addiu       $2, $2, 0x1
/* 00AE64 01DB6B64 FC9D82AF */  sw          $2, -0x6204($28)
/* 00AE68 01DB6B68 BF010010 */  b           .L.L01DB7268_2F2868$b
/* 00AE6C 01DB6B6C 00000000 */   nop
.L01DB6B70_2F2170:
/* 00AE70 01DB6B70 0446070C */  jal         BtGetTreasureboxBig_Loop__Fv
/* 00AE74 01DB6B74 00000000 */   nop
/* 00AE78 01DB6B78 BB014010 */  beqz        $2, .L.L01DB7268_2F2868$b
/* 00AE7C 01DB6B7C 00000000 */   nop
/* 00AE80 01DB6B80 FC9D80AF */  sw          $0, -0x6204($28)
/* 00AE84 01DB6B84 B8010010 */  b           .L.L01DB7268_2F2868$b
/* 00AE88 01DB6B88 00000000 */   nop
.L01DB6B8C_2F218C:
/* 00AE8C 01DB6B8C A49D848F */  lw          $4, -0x625C($28)
/* 00AE90 01DB6B90 F047070C */  jal         BtGetTreasureboxSmall_Init__Fi
/* 00AE94 01DB6B94 00000000 */   nop
/* 00AE98 01DB6B98 FC9D828F */  lw          $2, -0x6204($28)
/* 00AE9C 01DB6B9C 01004224 */  addiu       $2, $2, 0x1
/* 00AEA0 01DB6BA0 FC9D82AF */  sw          $2, -0x6204($28)
/* 00AEA4 01DB6BA4 B0010010 */  b           .L.L01DB7268_2F2868$b
/* 00AEA8 01DB6BA8 00000000 */   nop
.L01DB6BAC_2F21AC:
/* 00AEAC 01DB6BAC 1849070C */  jal         BtGetTreasureboxSmall_Loop__Fv
/* 00AEB0 01DB6BB0 00000000 */   nop
/* 00AEB4 01DB6BB4 AC014010 */  beqz        $2, .L.L01DB7268_2F2868$b
/* 00AEB8 01DB6BB8 00000000 */   nop
/* 00AEBC 01DB6BBC FC9D80AF */  sw          $0, -0x6204($28)
/* 00AEC0 01DB6BC0 A9010010 */  b           .L.L01DB7268_2F2868$b
/* 00AEC4 01DB6BC4 00000000 */   nop
.L01DB6BC8_2F21C8:
/* 00AEC8 01DB6BC8 BC4A070C */  jal         BtAtraGetShort_Init__Fv
/* 00AECC 01DB6BCC 00000000 */   nop
/* 00AED0 01DB6BD0 B89D80AF */  sw          $0, -0x6248($28)
/* 00AED4 01DB6BD4 FC9D828F */  lw          $2, -0x6204($28)
/* 00AED8 01DB6BD8 01004224 */  addiu       $2, $2, 0x1
/* 00AEDC 01DB6BDC FC9D82AF */  sw          $2, -0x6204($28)
/* 00AEE0 01DB6BE0 A1010010 */  b           .L.L01DB7268_2F2868$b
/* 00AEE4 01DB6BE4 00000000 */   nop
.L01DB6BE8_2F21E8:
/* 00AEE8 01DB6BE8 789C828F */  lw          $2, -0x6388($28)
/* 00AEEC 01DB6BEC 02004580 */  lb          $5, 0x2($2)
/* 00AEF0 01DB6BF0 A49D848F */  lw          $4, -0x625C($28)
/* 00AEF4 01DB6BF4 1C4B070C */  jal         BtAtraGetShort_Loop__Fii
/* 00AEF8 01DB6BF8 00000000 */   nop
/* 00AEFC 01DB6BFC 01000324 */  addiu       $3, $0, 0x1
/* 00AF00 01DB6C00 99014314 */  bne         $2, $3, .L.L01DB7268_2F2868$b
/* 00AF04 01DB6C04 00000000 */   nop
/* 00AF08 01DB6C08 FC9D80AF */  sw          $0, -0x6204($28)
/* 00AF0C 01DB6C0C 96010010 */  b           .L.L01DB7268_2F2868$b
/* 00AF10 01DB6C10 00000000 */   nop
.L01DB6C14_2F2214:
/* 00AF14 01DB6C14 01000224 */  addiu       $2, $0, 0x1
/* 00AF18 01DB6C18 EC9C82AF */  sw          $2, -0x6314($28)
/* 00AF1C 01DB6C1C E49C82AF */  sw          $2, -0x631C($28)
/* 00AF20 01DB6C20 789C838F */  lw          $3, -0x6388($28)
/* 00AF24 01DB6C24 0100013C */  lui         $1, (0x10000 >> 16)
/* 00AF28 01DB6C28 21086100 */  addu        $1, $3, $1
/* 00AF2C 01DB6C2C 0C8B22AC */  sw          $2, -0x74F4($1)
/* 00AF30 01DB6C30 EA01013C */  lui         $1, %hi(DngMessMan)
/* 00AF34 01DB6C34 907620AC */  sw          $0, %lo(DngMessMan)($1)
/* 00AF38 01DB6C38 789C828F */  lw          $2, -0x6388($28)
/* 00AF3C 01DB6C3C 04004480 */  lb          $4, 0x4($2)
/* 00AF40 01DB6C40 FFFF0524 */  addiu       $5, $0, -0x1
/* 00AF44 01DB6C44 6481050C */  jal         NotGetAtraMes__Fii
/* 00AF48 01DB6C48 00000000 */   nop
/* 00AF4C 01DB6C4C FC9D828F */  lw          $2, -0x6204($28)
/* 00AF50 01DB6C50 01004224 */  addiu       $2, $2, 0x1
/* 00AF54 01DB6C54 FC9D82AF */  sw          $2, -0x6204($28)
/* 00AF58 01DB6C58 83010010 */  b           .L.L01DB7268_2F2868$b
/* 00AF5C 01DB6C5C 00000000 */   nop
.L01DB6C60_2F2260:
/* 00AF60 01DB6C60 9C9C838F */  lw          $3, -0x6364($28)
/* 00AF64 01DB6C64 A09C828F */  lw          $2, -0x6360($28)
/* 00AF68 01DB6C68 25286200 */  or          $5, $3, $2
/* 00AF6C 01DB6C6C CC01023C */  lui         $2, %hi(GamePad)
/* 00AF70 01DB6C70 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 00AF74 01DB6C74 1CAE040C */  jal         Down__8CGamePadFi
/* 00AF78 01DB6C78 00000000 */   nop
/* 00AF7C 01DB6C7C 7A014010 */  beqz        $2, .L.L01DB7268_2F2868$b
/* 00AF80 01DB6C80 00000000 */   nop
/* 00AF84 01DB6C84 EC9C80AF */  sw          $0, -0x6314($28)
/* 00AF88 01DB6C88 E49C80AF */  sw          $0, -0x631C($28)
/* 00AF8C 01DB6C8C 789C828F */  lw          $2, -0x6388($28)
/* 00AF90 01DB6C90 0100013C */  lui         $1, (0x10000 >> 16)
/* 00AF94 01DB6C94 21084100 */  addu        $1, $2, $1
/* 00AF98 01DB6C98 0C8B20AC */  sw          $0, -0x74F4($1)
/* 00AF9C 01DB6C9C 01000224 */  addiu       $2, $0, 0x1
/* 00AFA0 01DB6CA0 EA01013C */  lui         $1, %hi(DngMessMan)
/* 00AFA4 01DB6CA4 907622AC */  sw          $2, %lo(DngMessMan)($1)
/* 00AFA8 01DB6CA8 3480050C */  jal         ClearSystemMes__Fv
/* 00AFAC 01DB6CAC 00000000 */   nop
/* 00AFB0 01DB6CB0 FC9D80AF */  sw          $0, -0x6204($28)
/* 00AFB4 01DB6CB4 6C010010 */  b           .L.L01DB7268_2F2868$b
/* 00AFB8 01DB6CB8 00000000 */   nop
.L01DB6CBC_2F22BC:
/* 00AFBC 01DB6CBC 789C838F */  lw          $3, -0x6388($28)
/* 00AFC0 01DB6CC0 01000224 */  addiu       $2, $0, 0x1
/* 00AFC4 01DB6CC4 0100013C */  lui         $1, (0x10000 >> 16)
/* 00AFC8 01DB6CC8 21086100 */  addu        $1, $3, $1
/* 00AFCC 01DB6CCC 0C8B22AC */  sw          $2, -0x74F4($1)
/* 00AFD0 01DB6CD0 DC01013C */  lui         $1, %hi(BtActStatus + 0x6C)
/* 00AFD4 01DB6CD4 EC4422AC */  sw          $2, %lo(BtActStatus + 0x6C)($1)
/* 00AFD8 01DB6CD8 EA01013C */  lui         $1, %hi(DngMessMan)
/* 00AFDC 01DB6CDC 907620AC */  sw          $0, %lo(DngMessMan)($1)
/* 00AFE0 01DB6CE0 A49C858F */  lw          $5, -0x635C($28)
/* 00AFE4 01DB6CE4 FFFF0224 */  addiu       $2, $0, -0x1
/* 00AFE8 01DB6CE8 0B00A210 */  beq         $5, $2, .L01DB6D18_2F2318
/* 00AFEC 01DB6CEC 00000000 */   nop
/* 00AFF0 01DB6CF0 789C828F */  lw          $2, -0x6388($28)
/* 00AFF4 01DB6CF4 04004380 */  lb          $3, 0x4($2)
/* 00AFF8 01DB6CF8 03000224 */  addiu       $2, $0, 0x3
/* 00AFFC 01DB6CFC 06006214 */  bne         $3, $2, .L01DB6D18_2F2318
/* 00B000 01DB6D00 00000000 */   nop
/* 00B004 01DB6D04 FC9C848F */  lw          $4, -0x6304($28)
/* 00B008 01DB6D08 04B3060C */  jal         OffEffect__12CSHOT_EFFECTFi
/* 00B00C 01DB6D0C 00000000 */   nop
/* 00B010 01DB6D10 FFFF0224 */  addiu       $2, $0, -0x1
/* 00B014 01DB6D14 A49C82AF */  sw          $2, -0x635C($28)
.L01DB6D18_2F2318:
/* 00B018 01DB6D18 789C848F */  lw          $4, -0x6388($28)
/* 00B01C 01DB6D1C B0000524 */  addiu       $5, $0, 0xB0
/* 00B020 01DB6D20 18F9060C */  jal         CheckActItemSlot__14CDngStatusDataFi
/* 00B024 01DB6D24 00000000 */   nop
/* 00B028 01DB6D28 28864070 */  paddub      $16, $2, $0
/* 00B02C 01DB6D2C FFFF0524 */  addiu       $5, $0, -0x1
/* 00B030 01DB6D30 53000512 */  beq         $16, $5, .L01DB6E80_2F2480
/* 00B034 01DB6D34 00000000 */   nop
/* 00B038 01DB6D38 8042023C */  lui         $2, (0x42800000 >> 16)
/* 00B03C 01DB6D3C 00608244 */  mtc1        $2, $f12
/* 00B040 01DB6D40 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 00B044 01DB6D44 00688244 */  mtc1        $2, $f13
/* 00B048 01DB6D48 00708044 */  mtc1        $0, $f14
/* 00B04C 01DB6D4C F442023C */  lui         $2, (0x42F40000 >> 16)
/* 00B050 01DB6D50 00788244 */  mtc1        $2, $f15
/* 00B054 01DB6D54 5043023C */  lui         $2, (0x43500000 >> 16)
/* 00B058 01DB6D58 00808244 */  mtc1        $2, $f16
/* 00B05C 01DB6D5C 0004770C */  jal         setUnitAmbientAnime__Ffffff
/* 00B060 01DB6D60 00000000 */   nop
/* 00B064 01DB6D64 789C838F */  lw          $3, -0x6388($28)
/* 00B068 01DB6D68 04006280 */  lb          $2, 0x4($3)
/* 00B06C 01DB6D6C 40100200 */  sll         $2, $2, 1
/* 00B070 01DB6D70 21184300 */  addu        $3, $2, $3
/* 00B074 01DB6D74 06006284 */  lh          $2, 0x6($3)
/* 00B078 01DB6D78 43100200 */  sra         $2, $2, 1
/* 00B07C 01DB6D7C 120062A4 */  sh          $2, 0x12($3)
/* 00B080 01DB6D80 789C838F */  lw          $3, -0x6388($28)
/* 00B084 01DB6D84 04006280 */  lb          $2, 0x4($3)
/* 00B088 01DB6D88 80100200 */  sll         $2, $2, 2
/* 00B08C 01DB6D8C 21104300 */  addu        $2, $2, $3
/* 00B090 01DB6D90 C84240AC */  sw          $0, 0x42C8($2)
/* 00B094 01DB6D94 789C838F */  lw          $3, -0x6388($28)
/* 00B098 01DB6D98 04006280 */  lb          $2, 0x4($3)
/* 00B09C 01DB6D9C 40100200 */  sll         $2, $2, 1
/* 00B0A0 01DB6DA0 21104300 */  addu        $2, $2, $3
/* 00B0A4 01DB6DA4 E04240A4 */  sh          $0, 0x42E0($2)
/* 00B0A8 01DB6DA8 3E000424 */  addiu       $4, $0, 0x3E
/* 00B0AC 01DB6DAC FFFF0524 */  addiu       $5, $0, -0x1
/* 00B0B0 01DB6DB0 08000624 */  addiu       $6, $0, 0x8
/* 00B0B4 01DB6DB4 283E0070 */  paddub      $7, $0, $0
/* 00B0B8 01DB6DB8 28460070 */  paddub      $8, $0, $0
/* 00B0BC 01DB6DBC 284E0070 */  paddub      $9, $0, $0
/* 00B0C0 01DB6DC0 9481050C */  jal         SetSystemMes__FiiiiPiPi
/* 00B0C4 01DB6DC4 00000000 */   nop
/* 00B0C8 01DB6DC8 EB01013C */  lui         $1, %hi(BombInfo + 0x14)
/* 00B0CC 01DB6DCC 046320AC */  sw          $0, %lo(BombInfo + 0x14)($1)
/* 00B0D0 01DB6DD0 FFFF0324 */  addiu       $3, $0, -0x1
/* 00B0D4 01DB6DD4 EB01013C */  lui         $1, %hi(BombInfo + 0x18)
/* 00B0D8 01DB6DD8 086323AC */  sw          $3, %lo(BombInfo + 0x18)($1)
/* 00B0DC 01DB6DDC 01000224 */  addiu       $2, $0, 0x1
/* 00B0E0 01DB6DE0 DC01013C */  lui         $1, %hi(BtActStatus + 0x64)
/* 00B0E4 01DB6DE4 E44422A4 */  sh          $2, %lo(BtActStatus + 0x64)($1)
/* 00B0E8 01DB6DE8 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 00B0EC 01DB6DEC 904420AC */  sw          $0, %lo(BtActStatus + 0x10)($1)
/* 00B0F0 01DB6DF0 DC01013C */  lui         $1, %hi(BtActStatus + 0x70)
/* 00B0F4 01DB6DF4 F04420AC */  sw          $0, %lo(BtActStatus + 0x70)($1)
/* 00B0F8 01DB6DF8 EC01013C */  lui         $1, %hi(activeItem + 0x34)
/* 00B0FC 01DB6DFC A478228C */  lw          $2, %lo(activeItem + 0x34)($1)
/* 00B100 01DB6E00 08004310 */  beq         $2, $3, .L01DB6E24_2F2424
/* 00B104 01DB6E04 00000000 */   nop
/* 00B108 01DB6E08 EC01013C */  lui         $1, %hi(activeItem + 0x38)
/* 00B10C 01DB6E0C A878248C */  lw          $4, %lo(activeItem + 0x38)($1)
/* 00B110 01DB6E10 5052070C */  jal         AllReleasItem__14CMainItemModelFv
/* 00B114 01DB6E14 00000000 */   nop
/* 00B118 01DB6E18 FFFF0224 */  addiu       $2, $0, -0x1
/* 00B11C 01DB6E1C EC01013C */  lui         $1, %hi(activeItem + 0x34)
/* 00B120 01DB6E20 A47822AC */  sw          $2, %lo(activeItem + 0x34)($1)
.L01DB6E24_2F2424:
/* 00B124 01DB6E24 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 00B128 01DB6E28 8C4420AC */  sw          $0, %lo(BtActStatus + 0xC)($1)
/* 00B12C 01DB6E2C DC01013C */  lui         $1, %hi(BtActStatus + 0x6C)
/* 00B130 01DB6E30 EC4420AC */  sw          $0, %lo(BtActStatus + 0x6C)($1)
/* 00B134 01DB6E34 EA01013C */  lui         $1, %hi(DngMessMan)
/* 00B138 01DB6E38 907620AC */  sw          $0, %lo(DngMessMan)($1)
/* 00B13C 01DB6E3C 01000224 */  addiu       $2, $0, 0x1
/* 00B140 01DB6E40 EC9C82AF */  sw          $2, -0x6314($28)
/* 00B144 01DB6E44 E49C82AF */  sw          $2, -0x631C($28)
/* 00B148 01DB6E48 DC01023C */  lui         $2, %hi(LIT_4411)
/* 00B14C 01DB6E4C B82F4424 */  addiu       $4, $2, %lo(LIT_4411)
/* 00B150 01DB6E50 282E0072 */  paddub      $5, $16, $0
/* 00B154 01DB6E54 A611040C */  jal         printf
/* 00B158 01DB6E58 00000000 */   nop
/* 00B15C 01DB6E5C 12020224 */  addiu       $2, $0, 0x212
/* 00B160 01DB6E60 FC9D82AF */  sw          $2, -0x6204($28)
/* 00B164 01DB6E64 01000426 */  addiu       $4, $16, 0x1
/* 00B168 01DB6E68 74FE760C */  jal         DelActiveItem__Fi
/* 00B16C 01DB6E6C 00000000 */   nop
/* 00B170 01DB6E70 5CFA760C */  jal         autoCamTrial__Fv
/* 00B174 01DB6E74 00000000 */   nop
/* 00B178 01DB6E78 FB000010 */  b           .L.L01DB7268_2F2868$b
/* 00B17C 01DB6E7C 00000000 */   nop
.L01DB6E80_2F2480:
/* 00B180 01DB6E80 17000224 */  addiu       $2, $0, 0x17
/* 00B184 01DB6E84 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 00B188 01DB6E88 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
/* 00B18C 01DB6E8C EA01013C */  lui         $1, %hi(CharaMain + 0x344)
/* 00B190 01DB6E90 6420228C */  lw          $2, %lo(CharaMain + 0x344)($1)
/* 00B194 01DB6E94 700140C4 */  lwc1        $f0, 0x170($2)
/* 00B198 01DB6E98 60008046 */  cvt.s.w     $f1, $f0
/* 00B19C 01DB6E9C 740140C4 */  lwc1        $f0, 0x174($2)
/* 00B1A0 01DB6EA0 20058046 */  cvt.s.w     $f20, $f0
/* 00B1A4 01DB6EA4 EA01013C */  lui         $1, %hi(CharaMain + 0x2F0)
/* 00B1A8 01DB6EA8 102022C4 */  lwc1        $f2, %lo(CharaMain + 0x2F0)($1)
/* 00B1AC 01DB6EAC 0040023C */  lui         $2, (0x40000000 >> 16)
/* 00B1B0 01DB6EB0 00008244 */  mtc1        $2, $f0
/* 00B1B4 01DB6EB4 00000000 */  nop
/* 00B1B8 01DB6EB8 00000146 */  add.s       $f0, $f0, $f1
/* 00B1BC 01DB6EBC 34100046 */  c.lt.s      $f2, $f0
/* 00B1C0 01DB6EC0 00000000 */  nop
/* 00B1C4 01DB6EC4 0B000145 */  bc1t        .L01DB6EF4_2F24F4
/* 00B1C8 01DB6EC8 00000000 */   nop
/* 00B1CC 01DB6ECC 748580C7 */  lwc1        $f0, -0x7A8C($28)
/* 00B1D0 01DB6ED0 00000146 */  add.s       $f0, $f0, $f1
/* 00B1D4 01DB6ED4 34100046 */  c.lt.s      $f2, $f0
/* 00B1D8 01DB6ED8 00000000 */  nop
/* 00B1DC 01DB6EDC 05000045 */  bc1f        .L01DB6EF4_2F24F4
/* 00B1E0 01DB6EE0 00000000 */   nop
/* 00B1E4 01DB6EE4 B1010424 */  addiu       $4, $0, 0x1B1
/* 00B1E8 01DB6EE8 28360070 */  paddub      $6, $0, $0
/* 00B1EC 01DB6EEC AC69050C */  jal         SndSePlay__Fiii
/* 00B1F0 01DB6EF0 00000000 */   nop
.L01DB6EF4_2F24F4:
/* 00B1F4 01DB6EF4 EA01013C */  lui         $1, %hi(CharaMain + 0x2F0)
/* 00B1F8 01DB6EF8 102021C4 */  lwc1        $f1, %lo(CharaMain + 0x2F0)($1)
/* 00B1FC 01DB6EFC 0040023C */  lui         $2, (0x40000000 >> 16)
/* 00B200 01DB6F00 00008244 */  mtc1        $2, $f0
/* 00B204 01DB6F04 00000000 */  nop
/* 00B208 01DB6F08 01A00046 */  sub.s       $f0, $f20, $f0
/* 00B20C 01DB6F0C 34080046 */  c.lt.s      $f1, $f0
/* 00B210 01DB6F10 00000000 */  nop
/* 00B214 01DB6F14 37000145 */  bc1t        .L01DB6FF4_2F25F4
/* 00B218 01DB6F18 00000000 */   nop
/* 00B21C 01DB6F1C 36081446 */  c.le.s      $f1, $f20
/* 00B220 01DB6F20 00000000 */  nop
/* 00B224 01DB6F24 33000045 */  bc1f        .L01DB6FF4_2F25F4
/* 00B228 01DB6F28 00000000 */   nop
/* 00B22C 01DB6F2C DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 00B230 01DB6F30 8C44228C */  lw          $2, %lo(BtActStatus + 0xC)($1)
/* 00B234 01DB6F34 EA01013C */  lui         $1, %hi(CharaMain + 0xC68)
/* 00B238 01DB6F38 882922AC */  sw          $2, %lo(CharaMain + 0xC68)($1)
/* 00B23C 01DB6F3C 01000424 */  addiu       $4, $0, 0x1
/* 00B240 01DB6F40 EA01013C */  lui         $1, %hi(CharaMain + 0xC64)
/* 00B244 01DB6F44 842924AC */  sw          $4, %lo(CharaMain + 0xC64)($1)
/* 00B248 01DB6F48 80BF023C */  lui         $2, (0xBF800000 >> 16)
/* 00B24C 01DB6F4C EA01013C */  lui         $1, %hi(CharaMain + 0xC60)
/* 00B250 01DB6F50 802922AC */  sw          $2, %lo(CharaMain + 0xC60)($1)
/* 00B254 01DB6F54 EB01013C */  lui         $1, %hi(BombInfo + 0x14)
/* 00B258 01DB6F58 046320AC */  sw          $0, %lo(BombInfo + 0x14)($1)
/* 00B25C 01DB6F5C FFFF0324 */  addiu       $3, $0, -0x1
/* 00B260 01DB6F60 EB01013C */  lui         $1, %hi(BombInfo + 0x18)
/* 00B264 01DB6F64 086323AC */  sw          $3, %lo(BombInfo + 0x18)($1)
/* 00B268 01DB6F68 DC01013C */  lui         $1, %hi(BtActStatus + 0x64)
/* 00B26C 01DB6F6C E44424A4 */  sh          $4, %lo(BtActStatus + 0x64)($1)
/* 00B270 01DB6F70 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 00B274 01DB6F74 904420AC */  sw          $0, %lo(BtActStatus + 0x10)($1)
/* 00B278 01DB6F78 DC01013C */  lui         $1, %hi(BtActStatus + 0x70)
/* 00B27C 01DB6F7C F04420AC */  sw          $0, %lo(BtActStatus + 0x70)($1)
/* 00B280 01DB6F80 EC01013C */  lui         $1, %hi(activeItem + 0x34)
/* 00B284 01DB6F84 A478228C */  lw          $2, %lo(activeItem + 0x34)($1)
/* 00B288 01DB6F88 08004310 */  beq         $2, $3, .L01DB6FAC_2F25AC
/* 00B28C 01DB6F8C 00000000 */   nop
/* 00B290 01DB6F90 EC01013C */  lui         $1, %hi(activeItem + 0x38)
/* 00B294 01DB6F94 A878248C */  lw          $4, %lo(activeItem + 0x38)($1)
/* 00B298 01DB6F98 5052070C */  jal         AllReleasItem__14CMainItemModelFv
/* 00B29C 01DB6F9C 00000000 */   nop
/* 00B2A0 01DB6FA0 FFFF0224 */  addiu       $2, $0, -0x1
/* 00B2A4 01DB6FA4 EC01013C */  lui         $1, %hi(activeItem + 0x34)
/* 00B2A8 01DB6FA8 A47822AC */  sw          $2, %lo(activeItem + 0x34)($1)
.L01DB6FAC_2F25AC:
/* 00B2AC 01DB6FAC 789C848F */  lw          $4, -0x6388($28)
/* 00B2B0 01DB6FB0 3CF7060C */  jal         GetLiveUnit__14CDngStatusDataFv
/* 00B2B4 01DB6FB4 00000000 */   nop
/* 00B2B8 01DB6FB8 0B004010 */  beqz        $2, .L01DB6FE8_2F25E8
/* 00B2BC 01DB6FBC 00000000 */   nop
/* 00B2C0 01DB6FC0 789C828F */  lw          $2, -0x6388($28)
/* 00B2C4 01DB6FC4 05004280 */  lb          $2, 0x5($2)
/* 00B2C8 01DB6FC8 02004128 */  slti        $1, $2, 0x2
/* 00B2CC 01DB6FCC 06002014 */  bnez        $1, .L01DB6FE8_2F25E8
/* 00B2D0 01DB6FD0 00000000 */   nop
/* 00B2D4 01DB6FD4 FC9D828F */  lw          $2, -0x6204($28)
/* 00B2D8 01DB6FD8 02004224 */  addiu       $2, $2, 0x2
/* 00B2DC 01DB6FDC FC9D82AF */  sw          $2, -0x6204($28)
/* 00B2E0 01DB6FE0 04000010 */  b           .L01DB6FF4_2F25F4
/* 00B2E4 01DB6FE4 00000000 */   nop
.L01DB6FE8_2F25E8:
/* 00B2E8 01DB6FE8 FC9D828F */  lw          $2, -0x6204($28)
/* 00B2EC 01DB6FEC 01004224 */  addiu       $2, $2, 0x1
/* 00B2F0 01DB6FF0 FC9D82AF */  sw          $2, -0x6204($28)
.L01DB6FF4_2F25F4:
/* 00B2F4 01DB6FF4 5CFA760C */  jal         autoCamTrial__Fv
/* 00B2F8 01DB6FF8 00000000 */   nop
/* 00B2FC 01DB6FFC 9A000010 */  b           .L.L01DB7268_2F2868$b
/* 00B300 01DB7000 00000000 */   nop
.L01DB7004_2F2604:
/* 00B304 01DB7004 089E828F */  lw          $2, -0x61F8($28)
/* 00B308 01DB7008 FFFF4224 */  addiu       $2, $2, -0x1
/* 00B30C 01DB700C 089E82AF */  sw          $2, -0x61F8($28)
/* 00B310 01DB7010 0C9E828F */  lw          $2, -0x61F4($28)
/* 00B314 01DB7014 14004018 */  blez        $2, .L01DB7068_2F2668
/* 00B318 01DB7018 00000000 */   nop
/* 00B31C 01DB701C FFFF4224 */  addiu       $2, $2, -0x1
/* 00B320 01DB7020 0C9E82AF */  sw          $2, -0x61F4($28)
/* 00B324 01DB7024 0C9E828F */  lw          $2, -0x61F4($28)
/* 00B328 01DB7028 0F004014 */  bnez        $2, .L01DB7068_2F2668
/* 00B32C 01DB702C 00000000 */   nop
/* 00B330 01DB7030 789C848F */  lw          $4, -0x6388($28)
/* 00B334 01DB7034 05008380 */  lb          $3, 0x5($4)
/* 00B338 01DB7038 01000224 */  addiu       $2, $0, 0x1
/* 00B33C 01DB703C 07006214 */  bne         $3, $2, .L01DB705C_2F265C
/* 00B340 01DB7040 00000000 */   nop
/* 00B344 01DB7044 04008480 */  lb          $4, 0x4($4)
/* 00B348 01DB7048 68010524 */  addiu       $5, $0, 0x168
/* 00B34C 01DB704C 3881050C */  jal         DeadMes__Fii
/* 00B350 01DB7050 00000000 */   nop
/* 00B354 01DB7054 04000010 */  b           .L01DB7068_2F2668
/* 00B358 01DB7058 00000000 */   nop
.L01DB705C_2F265C:
/* 00B35C 01DB705C 68010424 */  addiu       $4, $0, 0x168
/* 00B360 01DB7060 5481050C */  jal         AllDeadMes__Fi
/* 00B364 01DB7064 00000000 */   nop
.L01DB7068_2F2668:
/* 00B368 01DB7068 CC01023C */  lui         $2, %hi(GamePad)
/* 00B36C 01DB706C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 00B370 01DB7070 60000524 */  addiu       $5, $0, 0x60
/* 00B374 01DB7074 1CAE040C */  jal         Down__8CGamePadFi
/* 00B378 01DB7078 00000000 */   nop
/* 00B37C 01DB707C 04004014 */  bnez        $2, .L01DB7090_2F2690
/* 00B380 01DB7080 00000000 */   nop
/* 00B384 01DB7084 089E828F */  lw          $2, -0x61F8($28)
/* 00B388 01DB7088 0A00401C */  bgtz        $2, .L01DB70B4_2F26B4
/* 00B38C 01DB708C 00000000 */   nop
.L01DB7090_2F2690:
/* 00B390 01DB7090 3480050C */  jal         ClearSystemMes__Fv
/* 00B394 01DB7094 00000000 */   nop
/* 00B398 01DB7098 DC01013C */  lui         $1, %hi(BtActStatus + 0x6C)
/* 00B39C 01DB709C EC4420AC */  sw          $0, %lo(BtActStatus + 0x6C)($1)
/* 00B3A0 01DB70A0 AF000224 */  addiu       $2, $0, 0xAF
/* 00B3A4 01DB70A4 FC9D82AF */  sw          $2, -0x6204($28)
/* 00B3A8 01DB70A8 789C848F */  lw          $4, -0x6388($28)
/* 00B3AC 01DB70AC BCFB060C */  jal         SetDead__14CDngStatusDataFv
/* 00B3B0 01DB70B0 00000000 */   nop
.L01DB70B4_2F26B4:
/* 00B3B4 01DB70B4 5CFA760C */  jal         autoCamTrial__Fv
/* 00B3B8 01DB70B8 00000000 */   nop
/* 00B3BC 01DB70BC 6A000010 */  b           .L.L01DB7268_2F2868$b
/* 00B3C0 01DB70C0 00000000 */   nop
.L01DB70C4_2F26C4:
/* 00B3C4 01DB70C4 17000224 */  addiu       $2, $0, 0x17
/* 00B3C8 01DB70C8 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 00B3CC 01DB70CC 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
/* 00B3D0 01DB70D0 0C9E828F */  lw          $2, -0x61F4($28)
/* 00B3D4 01DB70D4 0B004018 */  blez        $2, .L01DB7104_2F2704
/* 00B3D8 01DB70D8 00000000 */   nop
/* 00B3DC 01DB70DC FFFF4224 */  addiu       $2, $2, -0x1
/* 00B3E0 01DB70E0 0C9E82AF */  sw          $2, -0x61F4($28)
/* 00B3E4 01DB70E4 0C9E828F */  lw          $2, -0x61F4($28)
/* 00B3E8 01DB70E8 06004014 */  bnez        $2, .L01DB7104_2F2704
/* 00B3EC 01DB70EC 00000000 */   nop
/* 00B3F0 01DB70F0 789C828F */  lw          $2, -0x6388($28)
/* 00B3F4 01DB70F4 04004480 */  lb          $4, 0x4($2)
/* 00B3F8 01DB70F8 68010524 */  addiu       $5, $0, 0x168
/* 00B3FC 01DB70FC 3881050C */  jal         DeadMes__Fii
/* 00B400 01DB7100 00000000 */   nop
.L01DB7104_2F2704:
/* 00B404 01DB7104 CC01023C */  lui         $2, %hi(GamePad)
/* 00B408 01DB7108 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 00B40C 01DB710C 60000524 */  addiu       $5, $0, 0x60
/* 00B410 01DB7110 1CAE040C */  jal         Down__8CGamePadFi
/* 00B414 01DB7114 00000000 */   nop
/* 00B418 01DB7118 04004014 */  bnez        $2, .L01DB712C_2F272C
/* 00B41C 01DB711C 00000000 */   nop
/* 00B420 01DB7120 089E828F */  lw          $2, -0x61F8($28)
/* 00B424 01DB7124 1400401C */  bgtz        $2, .L01DB7178_2F2778
/* 00B428 01DB7128 00000000 */   nop
.L01DB712C_2F272C:
/* 00B42C 01DB712C 3480050C */  jal         ClearSystemMes__Fv
/* 00B430 01DB7130 00000000 */   nop
/* 00B434 01DB7134 01000424 */  addiu       $4, $0, 0x1
/* 00B438 01DB7138 A44C070C */  jal         BtMiniChrSelect_Init__Fi
/* 00B43C 01DB713C 00000000 */   nop
/* 00B440 01DB7140 789C828F */  lw          $2, -0x6388($28)
/* 00B444 01DB7144 0100013C */  lui         $1, (0x10000 >> 16)
/* 00B448 01DB7148 21084100 */  addu        $1, $2, $1
/* 00B44C 01DB714C 0C8B20AC */  sw          $0, -0x74F4($1)
/* 00B450 01DB7150 789C828F */  lw          $2, -0x6388($28)
/* 00B454 01DB7154 04004280 */  lb          $2, 0x4($2)
/* 00B458 01DB7158 008B82AF */  sw          $2, -0x7500($28)
/* 00B45C 01DB715C DC01013C */  lui         $1, %hi(BtActStatus + 0x6C)
/* 00B460 01DB7160 EC4420AC */  sw          $0, %lo(BtActStatus + 0x6C)($1)
/* 00B464 01DB7164 01000224 */  addiu       $2, $0, 0x1
/* 00B468 01DB7168 DC01013C */  lui         $1, %hi(BtActStatus + 0xE4)
/* 00B46C 01DB716C 644522AC */  sw          $2, %lo(BtActStatus + 0xE4)($1)
/* 00B470 01DB7170 27010224 */  addiu       $2, $0, 0x127
/* 00B474 01DB7174 FC9D82AF */  sw          $2, -0x6204($28)
.L01DB7178_2F2778:
/* 00B478 01DB7178 5CFA760C */  jal         autoCamTrial__Fv
/* 00B47C 01DB717C 00000000 */   nop
/* 00B480 01DB7180 39000010 */  b           .L.L01DB7268_2F2868$b
/* 00B484 01DB7184 00000000 */   nop
.L01DB7188_2F2788:
/* 00B488 01DB7188 789C848F */  lw          $4, -0x6388($28)
/* 00B48C 01DB718C 04008280 */  lb          $2, 0x4($4)
/* 00B490 01DB7190 40100200 */  sll         $2, $2, 1
/* 00B494 01DB7194 21184400 */  addu        $3, $2, $4
/* 00B498 01DB7198 06006284 */  lh          $2, 0x6($3)
/* 00B49C 01DB719C 12006384 */  lh          $3, 0x12($3)
/* 00B4A0 01DB71A0 43100200 */  sra         $2, $2, 1
/* 00B4A4 01DB71A4 2A106200 */  slt         $2, $3, $2
/* 00B4A8 01DB71A8 08004014 */  bnez        $2, .L01DB71CC_2F27CC
/* 00B4AC 01DB71AC 00000000 */   nop
/* 00B4B0 01DB71B0 01000224 */  addiu       $2, $0, 0x1
/* 00B4B4 01DB71B4 0100013C */  lui         $1, (0x10000 >> 16)
/* 00B4B8 01DB71B8 21088100 */  addu        $1, $4, $1
/* 00B4BC 01DB71BC 0C8B22AC */  sw          $2, -0x74F4($1)
/* 00B4C0 01DB71C0 FC9D828F */  lw          $2, -0x6204($28)
/* 00B4C4 01DB71C4 01004224 */  addiu       $2, $2, 0x1
/* 00B4C8 01DB71C8 FC9D82AF */  sw          $2, -0x6204($28)
.L01DB71CC_2F27CC:
/* 00B4CC 01DB71CC 5CFA760C */  jal         autoCamTrial__Fv
/* 00B4D0 01DB71D0 00000000 */   nop
/* 00B4D4 01DB71D4 24000010 */  b           .L.L01DB7268_2F2868$b
/* 00B4D8 01DB71D8 00000000 */   nop
.L01DB71DC_2F27DC:
/* 00B4DC 01DB71DC CC01023C */  lui         $2, %hi(GamePad)
/* 00B4E0 01DB71E0 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 00B4E4 01DB71E4 60000524 */  addiu       $5, $0, 0x60
/* 00B4E8 01DB71E8 1CAE040C */  jal         Down__8CGamePadFi
/* 00B4EC 01DB71EC 00000000 */   nop
/* 00B4F0 01DB71F0 1B004010 */  beqz        $2, .L01DB7260_2F2860
/* 00B4F4 01DB71F4 00000000 */   nop
/* 00B4F8 01DB71F8 3480050C */  jal         ClearSystemMes__Fv
/* 00B4FC 01DB71FC 00000000 */   nop
/* 00B500 01DB7200 789C828F */  lw          $2, -0x6388($28)
/* 00B504 01DB7204 0100013C */  lui         $1, (0x10000 >> 16)
/* 00B508 01DB7208 21084100 */  addu        $1, $2, $1
/* 00B50C 01DB720C 0C8B20AC */  sw          $0, -0x74F4($1)
/* 00B510 01DB7210 01000224 */  addiu       $2, $0, 0x1
/* 00B514 01DB7214 EA01013C */  lui         $1, %hi(DngMessMan)
/* 00B518 01DB7218 907622AC */  sw          $2, %lo(DngMessMan)($1)
/* 00B51C 01DB721C EC9C80AF */  sw          $0, -0x6314($28)
/* 00B520 01DB7220 E49C80AF */  sw          $0, -0x631C($28)
/* 00B524 01DB7224 FC9D80AF */  sw          $0, -0x6204($28)
/* 00B528 01DB7228 A0000224 */  addiu       $2, $0, 0xA0
/* 00B52C 01DB722C DC01013C */  lui         $1, %hi(BtActStatus + 0x24)
/* 00B530 01DB7230 A44422AC */  sw          $2, %lo(BtActStatus + 0x24)($1)
/* 00B534 01DB7234 2043023C */  lui         $2, (0x43200000 >> 16)
/* 00B538 01DB7238 00608244 */  mtc1        $2, $f12
/* 00B53C 01DB723C 00788044 */  mtc1        $0, $f15
/* 00B540 01DB7240 00000000 */  nop
/* 00B544 01DB7244 067C0046 */  mov.s       $f16, $f15
/* 00B548 01DB7248 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 00B54C 01DB724C 00688244 */  mtc1        $2, $f13
/* 00B550 01DB7250 7F43023C */  lui         $2, (0x437F0000 >> 16)
/* 00B554 01DB7254 00708244 */  mtc1        $2, $f14
/* 00B558 01DB7258 0004770C */  jal         setUnitAmbientAnime__Ffffff
/* 00B55C 01DB725C 00000000 */   nop
.L01DB7260_2F2860:
/* 00B560 01DB7260 5CFA760C */  jal         autoCamTrial__Fv
/* 00B564 01DB7264 00000000 */   nop
jlabel .L01DB7268_2F2868
.L.L01DB7268_2F2868$b:
/* 00B568 01DB7268 1C9D828F */  lw          $2, -0x62E4($28)
/* 00B56C 01DB726C 61004010 */  beqz        $2, .L01DB73F4_2F29F4
/* 00B570 01DB7270 00000000 */   nop
/* 00B574 01DB7274 FC8A848F */  lw          $4, -0x7504($28)
/* 00B578 01DB7278 FFFF0324 */  addiu       $3, $0, -0x1
/* 00B57C 01DB727C 51008310 */  beq         $4, $3, .L01DB73C4_2F29C4
/* 00B580 01DB7280 00000000 */   nop
/* 00B584 01DB7284 03000224 */  addiu       $2, $0, 0x3
/* 00B588 01DB7288 4C008210 */  beq         $4, $2, .L01DB73BC_2F29BC
/* 00B58C 01DB728C 00000000 */   nop
/* 00B590 01DB7290 02000224 */  addiu       $2, $0, 0x2
/* 00B594 01DB7294 32008210 */  beq         $4, $2, .L01DB7360_2F2960
/* 00B598 01DB7298 00000000 */   nop
/* 00B59C 01DB729C 01000224 */  addiu       $2, $0, 0x1
/* 00B5A0 01DB72A0 1C008210 */  beq         $4, $2, .L01DB7314_2F2914
/* 00B5A4 01DB72A4 00000000 */   nop
/* 00B5A8 01DB72A8 03008010 */  beqz        $4, .L01DB72B8_2F28B8
/* 00B5AC 01DB72AC 00000000 */   nop
/* 00B5B0 01DB72B0 44000010 */  b           .L01DB73C4_2F29C4
/* 00B5B4 01DB72B4 00000000 */   nop
.L01DB72B8_2F28B8:
/* 00B5B8 01DB72B8 EB01013C */  lui         $1, %hi(rogoAlphaA + 0x8)
/* 00B5BC 01DB72BC B83A228C */  lw          $2, %lo(rogoAlphaA + 0x8)($1)
/* 00B5C0 01DB72C0 80004128 */  slti        $1, $2, 0x80
/* 00B5C4 01DB72C4 06002010 */  beqz        $1, .L01DB72E0_2F28E0
/* 00B5C8 01DB72C8 00000000 */   nop
/* 00B5CC 01DB72CC 04004224 */  addiu       $2, $2, 0x4
/* 00B5D0 01DB72D0 EB01013C */  lui         $1, %hi(rogoAlphaA + 0x8)
/* 00B5D4 01DB72D4 B83A22AC */  sw          $2, %lo(rogoAlphaA + 0x8)($1)
/* 00B5D8 01DB72D8 06000010 */  b           .L01DB72F4_2F28F4
/* 00B5DC 01DB72DC 00000000 */   nop
.L01DB72E0_2F28E0:
/* 00B5E0 01DB72E0 78000224 */  addiu       $2, $0, 0x78
/* 00B5E4 01DB72E4 EB01013C */  lui         $1, %hi(rogoAlphaW + 0x8)
/* 00B5E8 01DB72E8 C83A22AC */  sw          $2, %lo(rogoAlphaW + 0x8)($1)
/* 00B5EC 01DB72EC 01008224 */  addiu       $2, $4, 0x1
/* 00B5F0 01DB72F0 FC8A82AF */  sw          $2, -0x7504($28)
.L01DB72F4_2F28F4:
/* 00B5F4 01DB72F4 249D828F */  lw          $2, -0x62DC($28)
/* 00B5F8 01DB72F8 20004128 */  slti        $1, $2, 0x20
/* 00B5FC 01DB72FC 31002010 */  beqz        $1, .L01DB73C4_2F29C4
/* 00B600 01DB7300 00000000 */   nop
/* 00B604 01DB7304 02004224 */  addiu       $2, $2, 0x2
/* 00B608 01DB7308 249D82AF */  sw          $2, -0x62DC($28)
/* 00B60C 01DB730C 2D000010 */  b           .L01DB73C4_2F29C4
/* 00B610 01DB7310 00000000 */   nop
.L01DB7314_2F2914:
/* 00B614 01DB7314 EB01013C */  lui         $1, %hi(rogoAlphaW + 0x8)
/* 00B618 01DB7318 C83A228C */  lw          $2, %lo(rogoAlphaW + 0x8)($1)
/* 00B61C 01DB731C 06004018 */  blez        $2, .L01DB7338_2F2938
/* 00B620 01DB7320 00000000 */   nop
/* 00B624 01DB7324 FFFF4224 */  addiu       $2, $2, -0x1
/* 00B628 01DB7328 EB01013C */  lui         $1, %hi(rogoAlphaW + 0x8)
/* 00B62C 01DB732C C83A22AC */  sw          $2, %lo(rogoAlphaW + 0x8)($1)
/* 00B630 01DB7330 03000010 */  b           .L01DB7340_2F2940
/* 00B634 01DB7334 00000000 */   nop
.L01DB7338_2F2938:
/* 00B638 01DB7338 01008224 */  addiu       $2, $4, 0x1
/* 00B63C 01DB733C FC8A82AF */  sw          $2, -0x7504($28)
.L01DB7340_2F2940:
/* 00B640 01DB7340 249D828F */  lw          $2, -0x62DC($28)
/* 00B644 01DB7344 20004128 */  slti        $1, $2, 0x20
/* 00B648 01DB7348 1E002010 */  beqz        $1, .L01DB73C4_2F29C4
/* 00B64C 01DB734C 00000000 */   nop
/* 00B650 01DB7350 02004224 */  addiu       $2, $2, 0x2
/* 00B654 01DB7354 249D82AF */  sw          $2, -0x62DC($28)
/* 00B658 01DB7358 1A000010 */  b           .L01DB73C4_2F29C4
/* 00B65C 01DB735C 00000000 */   nop
.L01DB7360_2F2960:
/* 00B660 01DB7360 EB01013C */  lui         $1, %hi(rogoAlphaA + 0x8)
/* 00B664 01DB7364 B83A228C */  lw          $2, %lo(rogoAlphaA + 0x8)($1)
/* 00B668 01DB7368 06004018 */  blez        $2, .L01DB7384_2F2984
/* 00B66C 01DB736C 00000000 */   nop
/* 00B670 01DB7370 FCFF4224 */  addiu       $2, $2, -0x4
/* 00B674 01DB7374 EB01013C */  lui         $1, %hi(rogoAlphaA + 0x8)
/* 00B678 01DB7378 B83A22AC */  sw          $2, %lo(rogoAlphaA + 0x8)($1)
/* 00B67C 01DB737C 07000010 */  b           .L01DB739C_2F299C
/* 00B680 01DB7380 00000000 */   nop
.L01DB7384_2F2984:
/* 00B684 01DB7384 249D828F */  lw          $2, -0x62DC($28)
/* 00B688 01DB7388 20004228 */  slti        $2, $2, 0x20
/* 00B68C 01DB738C 03004014 */  bnez        $2, .L01DB739C_2F299C
/* 00B690 01DB7390 00000000 */   nop
/* 00B694 01DB7394 01008224 */  addiu       $2, $4, 0x1
/* 00B698 01DB7398 FC8A82AF */  sw          $2, -0x7504($28)
.L01DB739C_2F299C:
/* 00B69C 01DB739C 249D828F */  lw          $2, -0x62DC($28)
/* 00B6A0 01DB73A0 20004128 */  slti        $1, $2, 0x20
/* 00B6A4 01DB73A4 07002010 */  beqz        $1, .L01DB73C4_2F29C4
/* 00B6A8 01DB73A8 00000000 */   nop
/* 00B6AC 01DB73AC 02004224 */  addiu       $2, $2, 0x2
/* 00B6B0 01DB73B0 249D82AF */  sw          $2, -0x62DC($28)
/* 00B6B4 01DB73B4 03000010 */  b           .L01DB73C4_2F29C4
/* 00B6B8 01DB73B8 00000000 */   nop
.L01DB73BC_2F29BC:
/* 00B6BC 01DB73BC 1C9D80AF */  sw          $0, -0x62E4($28)
/* 00B6C0 01DB73C0 FC8A83AF */  sw          $3, -0x7504($28)
.L01DB73C4_2F29C4:
/* 00B6C4 01DB73C4 249D828F */  lw          $2, -0x62DC($28)
/* 00B6C8 01DB73C8 20004228 */  slti        $2, $2, 0x20
/* 00B6CC 01DB73CC 09004014 */  bnez        $2, .L01DB73F4_2F29F4
/* 00B6D0 01DB73D0 00000000 */   nop
/* 00B6D4 01DB73D4 789C828F */  lw          $2, -0x6388($28)
/* 00B6D8 01DB73D8 3C43438C */  lw          $3, 0x433C($2)
/* 00B6DC 01DB73DC 03000224 */  addiu       $2, $0, 0x3
/* 00B6E0 01DB73E0 04006210 */  beq         $3, $2, .L01DB73F4_2F29F4
/* 00B6E4 01DB73E4 00000000 */   nop
/* 00B6E8 01DB73E8 01000224 */  addiu       $2, $0, 0x1
/* 00B6EC 01DB73EC C09D82AF */  sw          $2, -0x6240($28)
/* 00B6F0 01DB73F0 C49D82AF */  sw          $2, -0x623C($28)
.L01DB73F4_2F29F4:
/* 00B6F4 01DB73F4 14DD760C */  jal         motionDrive__Fv
/* 00B6F8 01DB73F8 00000000 */   nop
/* 00B6FC 01DB73FC A000BF7B */  lq          $31, 0xA0($29)
/* 00B700 01DB7400 9000B77B */  lq          $23, 0x90($29)
/* 00B704 01DB7404 8000B67B */  lq          $22, 0x80($29)
/* 00B708 01DB7408 7000B57B */  lq          $21, 0x70($29)
/* 00B70C 01DB740C 6000B47B */  lq          $20, 0x60($29)
/* 00B710 01DB7410 5000B37B */  lq          $19, 0x50($29)
/* 00B714 01DB7414 4000B27B */  lq          $18, 0x40($29)
/* 00B718 01DB7418 3000B17B */  lq          $17, 0x30($29)
/* 00B71C 01DB741C 2000B07B */  lq          $16, 0x20($29)
/* 00B720 01DB7420 1800BAC7 */  lwc1        $f26, 0x18($29)
/* 00B724 01DB7424 1400B9C7 */  lwc1        $f25, 0x14($29)
/* 00B728 01DB7428 1000B8C7 */  lwc1        $f24, 0x10($29)
/* 00B72C 01DB742C 0C00B7C7 */  lwc1        $f23, 0xC($29)
/* 00B730 01DB7430 0800B6C7 */  lwc1        $f22, 0x8($29)
/* 00B734 01DB7434 0400B5C7 */  lwc1        $f21, 0x4($29)
/* 00B738 01DB7438 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 00B73C 01DB743C 1007BD27 */  addiu       $29, $29, 0x710
/* 00B740 01DB7440 0800E003 */  jr          $31
/* 00B744 01DB7444 00000000 */   nop
/* 00B748 01DB7448 00000000 */  nop
/* 00B74C 01DB744C 00000000 */  nop
