.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel OpD_InitProcess2__Fv
/* 018BE0 01DC48E0 10FDBD27 */  addiu       $29, $29, -0x2F0
/* 018BE4 01DC48E4 5000BF7F */  sq          $31, 0x50($29)
/* 018BE8 01DC48E8 4000B47F */  sq          $20, 0x40($29)
/* 018BEC 01DC48EC 3000B37F */  sq          $19, 0x30($29)
/* 018BF0 01DC48F0 2000B27F */  sq          $18, 0x20($29)
/* 018BF4 01DC48F4 1000B17F */  sq          $17, 0x10($29)
/* 018BF8 01DC48F8 0000B07F */  sq          $16, 0x0($29)
.L01DC48FC_2CA0FC:
/* 018BFC 01DC48FC 8CFB040C */  jal         ReadBGSync__Fv
/* 018C00 01DC4900 00000000 */   nop
/* 018C04 01DC4904 FDFF4014 */  bnez        $2, .L01DC48FC_2CA0FC
/* 018C08 01DC4908 00000000 */   nop
/* 018C0C 01DC490C DE01023C */  lui         $2, %hi(LIT_446__3)
/* 018C10 01DC4910 90AE4624 */  addiu       $6, $2, %lo(LIT_446__3)
/* 018C14 01DC4914 6000A527 */  addiu       $5, $29, 0x60
/* 018C18 01DC4918 03000424 */  addiu       $4, $0, 0x3
.L01DC491C_2CA11C:
/* 018C1C 01DC491C 0000C378 */  lq          $3, 0x0($6)
/* 018C20 01DC4920 1000C278 */  lq          $2, 0x10($6)
/* 018C24 01DC4924 2000C624 */  addiu       $6, $6, 0x20
/* 018C28 01DC4928 FFFF8424 */  addiu       $4, $4, -0x1
/* 018C2C 01DC492C 0000A37C */  sq          $3, 0x0($5)
/* 018C30 01DC4930 1000A27C */  sq          $2, 0x10($5)
/* 018C34 01DC4934 2000A524 */  addiu       $5, $5, 0x20
/* 018C38 01DC4938 F8FF801C */  bgtz        $4, .L01DC491C_2CA11C
/* 018C3C 01DC493C 00000000 */   nop
/* 018C40 01DC4940 0000C3DC */  ld          $3, 0x0($6)
/* 018C44 01DC4944 0800C2C4 */  lwc1        $f2, 0x8($6)
/* 018C48 01DC4948 0000A3FC */  sd          $3, 0x0($5)
/* 018C4C 01DC494C 0800A2E4 */  swc1        $f2, 0x8($5)
/* 018C50 01DC4950 948B848F */  lw          $4, -0x746C($28)
/* 018C54 01DC4954 DE01023C */  lui         $2, %hi(LIT_495__6)
/* 018C58 01DC4958 08FD4524 */  addiu       $5, $2, %lo(LIT_495__6)
/* 018C5C 01DC495C 28360070 */  paddub      $6, $0, $0
/* 018C60 01DC4960 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 018C64 01DC4964 00000000 */   nop
/* 018C68 01DC4968 6000A2AF */  sw          $2, 0x60($29)
/* 018C6C 01DC496C 948B848F */  lw          $4, -0x746C($28)
/* 018C70 01DC4970 DE01023C */  lui         $2, %hi(LIT_496__8)
/* 018C74 01DC4974 18FD4524 */  addiu       $5, $2, %lo(LIT_496__8)
/* 018C78 01DC4978 28360070 */  paddub      $6, $0, $0
/* 018C7C 01DC497C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 018C80 01DC4980 00000000 */   nop
/* 018C84 01DC4984 6C00A2AF */  sw          $2, 0x6C($29)
/* 018C88 01DC4988 948B848F */  lw          $4, -0x746C($28)
/* 018C8C 01DC498C DE01023C */  lui         $2, %hi(LIT_497__9)
/* 018C90 01DC4990 28FD4524 */  addiu       $5, $2, %lo(LIT_497__9)
/* 018C94 01DC4994 28360070 */  paddub      $6, $0, $0
/* 018C98 01DC4998 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 018C9C 01DC499C 00000000 */   nop
/* 018CA0 01DC49A0 7800A2AF */  sw          $2, 0x78($29)
/* 018CA4 01DC49A4 948B848F */  lw          $4, -0x746C($28)
/* 018CA8 01DC49A8 DE01023C */  lui         $2, %hi(LIT_498__8)
/* 018CAC 01DC49AC 38FD4524 */  addiu       $5, $2, %lo(LIT_498__8)
/* 018CB0 01DC49B0 28360070 */  paddub      $6, $0, $0
/* 018CB4 01DC49B4 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 018CB8 01DC49B8 00000000 */   nop
/* 018CBC 01DC49BC 8400A2AF */  sw          $2, 0x84($29)
/* 018CC0 01DC49C0 948B848F */  lw          $4, -0x746C($28)
/* 018CC4 01DC49C4 DE01023C */  lui         $2, %hi(LIT_499__7)
/* 018CC8 01DC49C8 48FD4524 */  addiu       $5, $2, %lo(LIT_499__7)
/* 018CCC 01DC49CC 28360070 */  paddub      $6, $0, $0
/* 018CD0 01DC49D0 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 018CD4 01DC49D4 00000000 */   nop
/* 018CD8 01DC49D8 9000A2AF */  sw          $2, 0x90($29)
/* 018CDC 01DC49DC 948B848F */  lw          $4, -0x746C($28)
/* 018CE0 01DC49E0 DE01023C */  lui         $2, %hi(LIT_500__6)
/* 018CE4 01DC49E4 58FD4524 */  addiu       $5, $2, %lo(LIT_500__6)
/* 018CE8 01DC49E8 28360070 */  paddub      $6, $0, $0
/* 018CEC 01DC49EC C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 018CF0 01DC49F0 00000000 */   nop
/* 018CF4 01DC49F4 9C00A2AF */  sw          $2, 0x9C($29)
/* 018CF8 01DC49F8 948B848F */  lw          $4, -0x746C($28)
/* 018CFC 01DC49FC DE01023C */  lui         $2, %hi(LIT_501__6)
/* 018D00 01DC4A00 68FD4524 */  addiu       $5, $2, %lo(LIT_501__6)
/* 018D04 01DC4A04 28360070 */  paddub      $6, $0, $0
/* 018D08 01DC4A08 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 018D0C 01DC4A0C 00000000 */   nop
/* 018D10 01DC4A10 A800A2AF */  sw          $2, 0xA8($29)
/* 018D14 01DC4A14 948B848F */  lw          $4, -0x746C($28)
/* 018D18 01DC4A18 DE01023C */  lui         $2, %hi(LIT_502__5)
/* 018D1C 01DC4A1C 78FD4524 */  addiu       $5, $2, %lo(LIT_502__5)
/* 018D20 01DC4A20 28360070 */  paddub      $6, $0, $0
/* 018D24 01DC4A24 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 018D28 01DC4A28 00000000 */   nop
/* 018D2C 01DC4A2C B400A2AF */  sw          $2, 0xB4($29)
/* 018D30 01DC4A30 C701023C */  lui         $2, %hi(TexManager)
/* 018D34 01DC4A34 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 018D38 01DC4A38 FFFF0524 */  addiu       $5, $0, -0x1
/* 018D3C 01DC4A3C 6000A627 */  addiu       $6, $29, 0x60
/* 018D40 01DC4A40 C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 018D44 01DC4A44 00000000 */   nop
/* 018D48 01DC4A48 DE01023C */  lui         $2, %hi(LIT_457__3)
/* 018D4C 01DC4A4C 00AF4624 */  addiu       $6, $2, %lo(LIT_457__3)
/* 018D50 01DC4A50 D000A527 */  addiu       $5, $29, 0xD0
/* 018D54 01DC4A54 0A000424 */  addiu       $4, $0, 0xA
.L01DC4A58_2CA258:
/* 018D58 01DC4A58 0000C378 */  lq          $3, 0x0($6)
/* 018D5C 01DC4A5C 1000C278 */  lq          $2, 0x10($6)
/* 018D60 01DC4A60 2000C624 */  addiu       $6, $6, 0x20
/* 018D64 01DC4A64 FFFF8424 */  addiu       $4, $4, -0x1
/* 018D68 01DC4A68 0000A37C */  sq          $3, 0x0($5)
/* 018D6C 01DC4A6C 1000A27C */  sq          $2, 0x10($5)
/* 018D70 01DC4A70 2000A524 */  addiu       $5, $5, 0x20
/* 018D74 01DC4A74 F8FF801C */  bgtz        $4, .L01DC4A58_2CA258
/* 018D78 01DC4A78 00000000 */   nop
/* 018D7C 01DC4A7C 1002A427 */  addiu       $4, $29, 0x210
/* 018D80 01DC4A80 509F040C */  jal         __ct__10CFrameAttrFv
/* 018D84 01DC4A84 00000000 */   nop
/* 018D88 01DC4A88 01001124 */  addiu       $17, $0, 0x1
/* 018D8C 01DC4A8C 1C02B1A3 */  sb          $17, 0x21C($29)
/* 018D90 01DC4A90 B1000010 */  b           .L01DC4D58_2CA558
/* 018D94 01DC4A94 00000000 */   nop
.L01DC4A98_2CA298:
/* 018D98 01DC4A98 40A11100 */  sll         $20, $17, 5
/* 018D9C 01DC4A9C 21109D02 */  addu        $2, $20, $29
/* 018DA0 01DC4AA0 948B848F */  lw          $4, -0x746C($28)
/* 018DA4 01DC4AA4 B000458C */  lw          $5, 0xB0($2)
/* 018DA8 01DC4AA8 28360070 */  paddub      $6, $0, $0
/* 018DAC 01DC4AAC C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 018DB0 01DC4AB0 00000000 */   nop
/* 018DB4 01DC4AB4 28264070 */  paddub      $4, $2, $0
/* 018DB8 01DC4AB8 DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 018DBC 01DC4ABC B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 018DC0 01DC4AC0 02000624 */  addiu       $6, $0, 0x2
/* 018DC4 01DC4AC4 283E0070 */  paddub      $7, $0, $0
/* 018DC8 01DC4AC8 28460070 */  paddub      $8, $0, $0
/* 018DCC 01DC4ACC AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 018DD0 01DC4AD0 00000000 */   nop
/* 018DD4 01DC4AD4 28864070 */  paddub      $16, $2, $0
/* 018DD8 01DC4AD8 07000224 */  addiu       $2, $0, 0x7
/* 018DDC 01DC4ADC 09002216 */  bne         $17, $2, .L01DC4B04_2CA304
/* 018DE0 01DC4AE0 00000000 */   nop
/* 018DE4 01DC4AE4 01000224 */  addiu       $2, $0, 0x1
/* 018DE8 01DC4AE8 2402A2A3 */  sb          $2, 0x224($29)
/* 018DEC 01DC4AEC 28260072 */  paddub      $4, $16, $0
/* 018DF0 01DC4AF0 1002A527 */  addiu       $5, $29, 0x210
/* 018DF4 01DC4AF4 00020624 */  addiu       $6, $0, 0x200
/* 018DF8 01DC4AF8 283E0070 */  paddub      $7, $0, $0
/* 018DFC 01DC4AFC D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 018E00 01DC4B00 00000000 */   nop
.L01DC4B04_2CA304:
/* 018E04 01DC4B04 0800212A */  slti        $1, $17, 0x8
/* 018E08 01DC4B08 0B002010 */  beqz        $1, .L01DC4B38_2CA338
/* 018E0C 01DC4B0C 00000000 */   nop
/* 018E10 01DC4B10 28260072 */  paddub      $4, $16, $0
/* 018E14 01DC4B14 1002A527 */  addiu       $5, $29, 0x210
/* 018E18 01DC4B18 01000624 */  addiu       $6, $0, 0x1
/* 018E1C 01DC4B1C 40000724 */  addiu       $7, $0, 0x40
/* 018E20 01DC4B20 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 018E24 01DC4B24 00000000 */   nop
/* 018E28 01DC4B28 28260072 */  paddub      $4, $16, $0
/* 018E2C 01DC4B2C 01000524 */  addiu       $5, $0, 0x1
/* 018E30 01DC4B30 BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 018E34 01DC4B34 00000000 */   nop
.L01DC4B38_2CA338:
/* 018E38 01DC4B38 08000224 */  addiu       $2, $0, 0x8
/* 018E3C 01DC4B3C 04002216 */  bne         $17, $2, .L01DC4B50_2CA350
/* 018E40 01DC4B40 00000000 */   nop
/* 018E44 01DC4B44 28260072 */  paddub      $4, $16, $0
/* 018E48 01DC4B48 CC13770C */  jal         SkyColor__FP9CFrameVu1
/* 018E4C 01DC4B4C 00000000 */   nop
.L01DC4B50_2CA350:
/* 018E50 01DC4B50 0A000224 */  addiu       $2, $0, 0xA
/* 018E54 01DC4B54 02002216 */  bne         $17, $2, .L01DC4B60_2CA360
/* 018E58 01DC4B58 00000000 */   nop
/* 018E5C 01DC4B5C 849A90AF */  sw          $16, -0x657C($28)
.L01DC4B60_2CA360:
/* 018E60 01DC4B60 00111100 */  sll         $2, $17, 4
/* 018E64 01DC4B64 23105100 */  subu        $2, $2, $17
/* 018E68 01DC4B68 00990200 */  sll         $19, $2, 4
/* 018E6C 01DC4B6C E201023C */  lui         $2, %hi(OP_NornMapObj)
/* 018E70 01DC4B70 B0F64224 */  addiu       $2, $2, %lo(OP_NornMapObj)
/* 018E74 01DC4B74 21905300 */  addu        $18, $2, $19
/* 018E78 01DC4B78 28264072 */  paddub      $4, $18, $0
/* 018E7C 01DC4B7C 445E050C */  jal         Initialize__10CMapObjectFv
/* 018E80 01DC4B80 00000000 */   nop
/* 018E84 01DC4B84 28264072 */  paddub      $4, $18, $0
/* 018E88 01DC4B88 282E0072 */  paddub      $5, $16, $0
/* 018E8C 01DC4B8C 28360070 */  paddub      $6, $0, $0
/* 018E90 01DC4B90 305C050C */  jal         SetFrame__12CObjectFrameFP9CFrameVu1i
/* 018E94 01DC4B94 00000000 */   nop
/* 018E98 01DC4B98 E201023C */  lui         $2, %hi(OP_NornMapObj + 0xE8)
/* 018E9C 01DC4B9C 98F74224 */  addiu       $2, $2, %lo(OP_NornMapObj + 0xE8)
/* 018EA0 01DC4BA0 21105300 */  addu        $2, $2, $19
/* 018EA4 01DC4BA4 000040AC */  sw          $0, 0x0($2)
/* 018EA8 01DC4BA8 E201023C */  lui         $2, %hi(OP_NornMapObj + 0xE4)
/* 018EAC 01DC4BAC 94F74224 */  addiu       $2, $2, %lo(OP_NornMapObj + 0xE4)
/* 018EB0 01DC4BB0 21105300 */  addu        $2, $2, $19
/* 018EB4 01DC4BB4 000040AC */  sw          $0, 0x0($2)
/* 018EB8 01DC4BB8 07000224 */  addiu       $2, $0, 0x7
/* 018EBC 01DC4BBC 09002216 */  bne         $17, $2, .L01DC4BE4_2CA3E4
/* 018EC0 01DC4BC0 00000000 */   nop
/* 018EC4 01DC4BC4 28264072 */  paddub      $4, $18, $0
/* 018EC8 01DC4BC8 DE01023C */  lui         $2, %hi(LIT_503__5)
/* 018ECC 01DC4BCC 88FD4524 */  addiu       $5, $2, %lo(LIT_503__5)
/* 018ED0 01DC4BD0 28360070 */  paddub      $6, $0, $0
/* 018ED4 01DC4BD4 A000598E */  lw          $25, 0xA0($18)
/* 018ED8 01DC4BD8 9000398F */  lw          $25, 0x90($25)
/* 018EDC 01DC4BDC 09F82003 */  jalr        $25
/* 018EE0 01DC4BE0 00000000 */   nop
.L01DC4BE4_2CA3E4:
/* 018EE4 01DC4BE4 21189D02 */  addu        $3, $20, $29
/* 018EE8 01DC4BE8 2041023C */  lui         $2, (0x41200000 >> 16)
/* 018EEC 01DC4BEC 00088244 */  mtc1        $2, $f1
/* 018EF0 01DC4BF0 C00060C4 */  lwc1        $f0, 0xC0($3)
/* 018EF4 01DC4BF4 C2080046 */  mul.s       $f3, $f1, $f0
/* 018EF8 01DC4BF8 BC0060C4 */  lwc1        $f0, 0xBC($3)
/* 018EFC 01DC4BFC 82080046 */  mul.s       $f2, $f1, $f0
/* 018F00 01DC4C00 B80060C4 */  lwc1        $f0, 0xB8($3)
/* 018F04 01DC4C04 02080046 */  mul.s       $f0, $f1, $f0
/* 018F08 01DC4C08 D002A0E7 */  swc1        $f0, 0x2D0($29)
/* 018F0C 01DC4C0C D402A2E7 */  swc1        $f2, 0x2D4($29)
/* 018F10 01DC4C10 D802A3E7 */  swc1        $f3, 0x2D8($29)
/* 018F14 01DC4C14 28264072 */  paddub      $4, $18, $0
/* 018F18 01DC4C18 D002A527 */  addiu       $5, $29, 0x2D0
/* 018F1C 01DC4C1C A000598E */  lw          $25, 0xA0($18)
/* 018F20 01DC4C20 1000398F */  lw          $25, 0x10($25)
/* 018F24 01DC4C24 09F82003 */  jalr        $25
/* 018F28 01DC4C28 00000000 */   nop
/* 018F2C 01DC4C2C 21109D02 */  addu        $2, $20, $29
/* 018F30 01DC4C30 CC004CC4 */  lwc1        $f12, 0xCC($2)
/* 018F34 01DC4C34 9044040C */  jal         fptodp
/* 018F38 01DC4C38 00000000 */   nop
/* 018F3C 01DC4C3C 188084DF */  ld          $4, -0x7FE8($28)
/* 018F40 01DC4C40 282E4070 */  paddub      $5, $2, $0
/* 018F44 01DC4C44 9E3F040C */  jal         dpmul
/* 018F48 01DC4C48 00000000 */   nop
/* 018F4C 01DC4C4C 28864070 */  paddub      $16, $2, $0
/* 018F50 01DC4C50 B4000424 */  addiu       $4, $0, 0xB4
/* 018F54 01DC4C54 FC40040C */  jal         litodp
/* 018F58 01DC4C58 00000000 */   nop
/* 018F5C 01DC4C5C 28260072 */  paddub      $4, $16, $0
/* 018F60 01DC4C60 282E4070 */  paddub      $5, $2, $0
/* 018F64 01DC4C64 4840040C */  jal         dpdiv
/* 018F68 01DC4C68 00000000 */   nop
/* 018F6C 01DC4C6C 289E4070 */  paddub      $19, $2, $0
/* 018F70 01DC4C70 28264070 */  paddub      $4, $2, $0
/* 018F74 01DC4C74 9241040C */  jal         dptofp
/* 018F78 01DC4C78 00000000 */   nop
/* 018F7C 01DC4C7C 21109D02 */  addu        $2, $20, $29
/* 018F80 01DC4C80 C8004CC4 */  lwc1        $f12, 0xC8($2)
/* 018F84 01DC4C84 9044040C */  jal         fptodp
/* 018F88 01DC4C88 00000000 */   nop
/* 018F8C 01DC4C8C 188084DF */  ld          $4, -0x7FE8($28)
/* 018F90 01DC4C90 282E4070 */  paddub      $5, $2, $0
/* 018F94 01DC4C94 9E3F040C */  jal         dpmul
/* 018F98 01DC4C98 00000000 */   nop
/* 018F9C 01DC4C9C 28864070 */  paddub      $16, $2, $0
/* 018FA0 01DC4CA0 B4000424 */  addiu       $4, $0, 0xB4
/* 018FA4 01DC4CA4 FC40040C */  jal         litodp
/* 018FA8 01DC4CA8 00000000 */   nop
/* 018FAC 01DC4CAC 28260072 */  paddub      $4, $16, $0
/* 018FB0 01DC4CB0 282E4070 */  paddub      $5, $2, $0
/* 018FB4 01DC4CB4 4840040C */  jal         dpdiv
/* 018FB8 01DC4CB8 00000000 */   nop
/* 018FBC 01DC4CBC 28864070 */  paddub      $16, $2, $0
/* 018FC0 01DC4CC0 28264070 */  paddub      $4, $2, $0
/* 018FC4 01DC4CC4 9241040C */  jal         dptofp
/* 018FC8 01DC4CC8 00000000 */   nop
/* 018FCC 01DC4CCC 21109D02 */  addu        $2, $20, $29
/* 018FD0 01DC4CD0 C4004CC4 */  lwc1        $f12, 0xC4($2)
/* 018FD4 01DC4CD4 9044040C */  jal         fptodp
/* 018FD8 01DC4CD8 00000000 */   nop
/* 018FDC 01DC4CDC 188084DF */  ld          $4, -0x7FE8($28)
/* 018FE0 01DC4CE0 282E4070 */  paddub      $5, $2, $0
/* 018FE4 01DC4CE4 9E3F040C */  jal         dpmul
/* 018FE8 01DC4CE8 00000000 */   nop
/* 018FEC 01DC4CEC 28A64070 */  paddub      $20, $2, $0
/* 018FF0 01DC4CF0 B4000424 */  addiu       $4, $0, 0xB4
/* 018FF4 01DC4CF4 FC40040C */  jal         litodp
/* 018FF8 01DC4CF8 00000000 */   nop
/* 018FFC 01DC4CFC 28268072 */  paddub      $4, $20, $0
/* 019000 01DC4D00 282E4070 */  paddub      $5, $2, $0
/* 019004 01DC4D04 4840040C */  jal         dpdiv
/* 019008 01DC4D08 00000000 */   nop
/* 01900C 01DC4D0C 28264070 */  paddub      $4, $2, $0
/* 019010 01DC4D10 9241040C */  jal         dptofp
/* 019014 01DC4D14 00000000 */   nop
/* 019018 01DC4D18 E002A0E7 */  swc1        $f0, 0x2E0($29)
/* 01901C 01DC4D1C 28260072 */  paddub      $4, $16, $0
/* 019020 01DC4D20 9241040C */  jal         dptofp
/* 019024 01DC4D24 00000000 */   nop
/* 019028 01DC4D28 E402A0E7 */  swc1        $f0, 0x2E4($29)
/* 01902C 01DC4D2C 28266072 */  paddub      $4, $19, $0
/* 019030 01DC4D30 9241040C */  jal         dptofp
/* 019034 01DC4D34 00000000 */   nop
/* 019038 01DC4D38 E802A0E7 */  swc1        $f0, 0x2E8($29)
/* 01903C 01DC4D3C 28264072 */  paddub      $4, $18, $0
/* 019040 01DC4D40 E002A527 */  addiu       $5, $29, 0x2E0
/* 019044 01DC4D44 A000598E */  lw          $25, 0xA0($18)
/* 019048 01DC4D48 2C00398F */  lw          $25, 0x2C($25)
/* 01904C 01DC4D4C 09F82003 */  jalr        $25
/* 019050 01DC4D50 00000000 */   nop
/* 019054 01DC4D54 01003126 */  addiu       $17, $17, 0x1
.L01DC4D58_2CA558:
/* 019058 01DC4D58 0B00222A */  slti        $2, $17, 0xB
/* 01905C 01DC4D5C 4EFF4014 */  bnez        $2, .L01DC4A98_2CA298
/* 019060 01DC4D60 00000000 */   nop
/* 019064 01DC4D64 E101023C */  lui         $2, %hi(MainMonstorUnit + 0xFC30)
/* 019068 01DC4D68 00844424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0xFC30)
/* 01906C 01DC4D6C 948B858F */  lw          $5, -0x746C($28)
/* 019070 01DC4D70 DE01023C */  lui         $2, %hi(LIT_505__7)
/* 019074 01DC4D74 90FD4624 */  addiu       $6, $2, %lo(LIT_505__7)
/* 019078 01DC4D78 DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x60)
/* 01907C 01DC4D7C 60FE4724 */  addiu       $7, $2, %lo(CharaDataBuffer__2 + 0x60)
/* 019080 01DC4D80 28460070 */  paddub      $8, $0, $0
/* 019084 01DC4D84 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 019088 01DC4D88 00000000 */   nop
/* 01908C 01DC4D8C 7002A427 */  addiu       $4, $29, 0x270
/* 019090 01DC4D90 509F040C */  jal         __ct__10CFrameAttrFv
/* 019094 01DC4D94 00000000 */   nop
/* 019098 01DC4D98 7802B027 */  addiu       $16, $29, 0x278
/* 01909C 01DC4D9C 000000A2 */  sb          $0, 0x0($16)
/* 0190A0 01DC4DA0 E101013C */  lui         $1, %hi(MainMonstorUnit + 0xFCEC)
/* 0190A4 01DC4DA4 BC84248C */  lw          $4, %lo(MainMonstorUnit + 0xFCEC)($1)
/* 0190A8 01DC4DA8 7002A527 */  addiu       $5, $29, 0x270
/* 0190AC 01DC4DAC 01000624 */  addiu       $6, $0, 0x1
/* 0190B0 01DC4DB0 04000724 */  addiu       $7, $0, 0x4
/* 0190B4 01DC4DB4 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 0190B8 01DC4DB8 00000000 */   nop
/* 0190BC 01DC4DBC 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0190C0 01DC4DC0 E101013C */  lui         $1, %hi(MainMonstorUnit + 0xFF20)
/* 0190C4 01DC4DC4 F08622AC */  sw          $2, %lo(MainMonstorUnit + 0xFF20)($1)
/* 0190C8 01DC4DC8 948280C7 */  lwc1        $f0, -0x7D6C($28)
/* 0190CC 01DC4DCC E101013C */  lui         $1, %hi(MainMonstorUnit + 0xFF28)
/* 0190D0 01DC4DD0 F88620E4 */  swc1        $f0, %lo(MainMonstorUnit + 0xFF28)($1)
/* 0190D4 01DC4DD4 E101013C */  lui         $1, %hi(MainMonstorUnit + 0xFF34)
/* 0190D8 01DC4DD8 048720AC */  sw          $0, %lo(MainMonstorUnit + 0xFF34)($1)
/* 0190DC 01DC4DDC E101013C */  lui         $1, %hi(MainMonstorUnit + 0xFF38)
/* 0190E0 01DC4DE0 088720AC */  sw          $0, %lo(MainMonstorUnit + 0xFF38)($1)
/* 0190E4 01DC4DE4 03000224 */  addiu       $2, $0, 0x3
/* 0190E8 01DC4DE8 E101013C */  lui         $1, %hi(CharaTex__2 + 0x16)
/* 0190EC 01DC4DEC C69522A0 */  sb          $2, %lo(CharaTex__2 + 0x16)($1)
/* 0190F0 01DC4DF0 DF01023C */  lui         $2, %hi(DngEventMan + 0x20A0)
/* 0190F4 01DC4DF4 50574424 */  addiu       $4, $2, %lo(DngEventMan + 0x20A0)
/* 0190F8 01DC4DF8 948B858F */  lw          $5, -0x746C($28)
/* 0190FC 01DC4DFC DE01023C */  lui         $2, %hi(LIT_505__7)
/* 019100 01DC4E00 90FD4624 */  addiu       $6, $2, %lo(LIT_505__7)
/* 019104 01DC4E04 DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x60)
/* 019108 01DC4E08 60FE4724 */  addiu       $7, $2, %lo(CharaDataBuffer__2 + 0x60)
/* 01910C 01DC4E0C 28460070 */  paddub      $8, $0, $0
/* 019110 01DC4E10 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 019114 01DC4E14 00000000 */   nop
/* 019118 01DC4E18 000000A2 */  sb          $0, 0x0($16)
/* 01911C 01DC4E1C DF01013C */  lui         $1, %hi(DngEventMan + 0x215C)
/* 019120 01DC4E20 0C58248C */  lw          $4, %lo(DngEventMan + 0x215C)($1)
/* 019124 01DC4E24 7002A527 */  addiu       $5, $29, 0x270
/* 019128 01DC4E28 01000624 */  addiu       $6, $0, 0x1
/* 01912C 01DC4E2C 04000724 */  addiu       $7, $0, 0x4
/* 019130 01DC4E30 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 019134 01DC4E34 00000000 */   nop
/* 019138 01DC4E38 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 01913C 01DC4E3C DF01013C */  lui         $1, %hi(DngEventMan + 0x2390)
/* 019140 01DC4E40 405A22AC */  sw          $2, %lo(DngEventMan + 0x2390)($1)
/* 019144 01DC4E44 948280C7 */  lwc1        $f0, -0x7D6C($28)
/* 019148 01DC4E48 DF01013C */  lui         $1, %hi(DngEventMan + 0x2398)
/* 01914C 01DC4E4C 485A20E4 */  swc1        $f0, %lo(DngEventMan + 0x2398)($1)
/* 019150 01DC4E50 DF01013C */  lui         $1, %hi(DngEventMan + 0x23A4)
/* 019154 01DC4E54 545A20AC */  sw          $0, %lo(DngEventMan + 0x23A4)($1)
/* 019158 01DC4E58 DF01013C */  lui         $1, %hi(DngEventMan + 0x23A8)
/* 01915C 01DC4E5C 585A20AC */  sw          $0, %lo(DngEventMan + 0x23A8)($1)
/* 019160 01DC4E60 03000224 */  addiu       $2, $0, 0x3
/* 019164 01DC4E64 E101013C */  lui         $1, %hi(CharaTex__2 + 0x5)
/* 019168 01DC4E68 B59522A0 */  sb          $2, %lo(CharaTex__2 + 0x5)($1)
/* 01916C 01DC4E6C 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 019170 01DC4E70 282E0070 */  paddub      $5, $0, $0
/* 019174 01DC4E74 04000624 */  addiu       $6, $0, 0x4
/* 019178 01DC4E78 1E000724 */  addiu       $7, $0, 0x1E
/* 01917C 01DC4E7C 140F050C */  jal         SetReverb__6CSoundFiii
/* 019180 01DC4E80 00000000 */   nop
/* 019184 01DC4E84 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 019188 01DC4E88 01000524 */  addiu       $5, $0, 0x1
/* 01918C 01DC4E8C 02000624 */  addiu       $6, $0, 0x2
/* 019190 01DC4E90 05000724 */  addiu       $7, $0, 0x5
/* 019194 01DC4E94 140F050C */  jal         SetReverb__6CSoundFiii
/* 019198 01DC4E98 00000000 */   nop
/* 01919C 01DC4E9C 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 0191A0 01DC4EA0 DE01023C */  lui         $2, %hi(LIT_506__6)
/* 0191A4 01DC4EA4 A0FD4524 */  addiu       $5, $2, %lo(LIT_506__6)
/* 0191A8 01DC4EA8 948B868F */  lw          $6, -0x746C($28)
/* 0191AC 01DC4EAC 3410050C */  jal         LoadSoundFileFromPack__6CSoundFPcPUi
/* 0191B0 01DC4EB0 00000000 */   nop
/* 0191B4 01DC4EB4 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 0191B8 01DC4EB8 0F000524 */  addiu       $5, $0, 0xF
/* 0191BC 01DC4EBC 00010624 */  addiu       $6, $0, 0x100
/* 0191C0 01DC4EC0 581A050C */  jal         SetVol__6CSoundFii
/* 0191C4 01DC4EC4 00000000 */   nop
/* 0191C8 01DC4EC8 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 0191CC 01DC4ECC 0E000524 */  addiu       $5, $0, 0xE
/* 0191D0 01DC4ED0 00010624 */  addiu       $6, $0, 0x100
/* 0191D4 01DC4ED4 581A050C */  jal         SetVol__6CSoundFii
/* 0191D8 01DC4ED8 00000000 */   nop
/* 0191DC 01DC4EDC 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 0191E0 01DC4EE0 0D000524 */  addiu       $5, $0, 0xD
/* 0191E4 01DC4EE4 00010624 */  addiu       $6, $0, 0x100
/* 0191E8 01DC4EE8 581A050C */  jal         SetVol__6CSoundFii
/* 0191EC 01DC4EEC 00000000 */   nop
/* 0191F0 01DC4EF0 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 0191F4 01DC4EF4 0C000524 */  addiu       $5, $0, 0xC
/* 0191F8 01DC4EF8 00010624 */  addiu       $6, $0, 0x100
/* 0191FC 01DC4EFC 581A050C */  jal         SetVol__6CSoundFii
/* 019200 01DC4F00 00000000 */   nop
/* 019204 01DC4F04 DE01013C */  lui         $1, %hi(CScript__2 + 0x20)
/* 019208 01DC4F08 201B20AC */  sw          $0, %lo(CScript__2 + 0x20)($1)
/* 01920C 01DC4F0C 5000BF7B */  lq          $31, 0x50($29)
/* 019210 01DC4F10 4000B47B */  lq          $20, 0x40($29)
/* 019214 01DC4F14 3000B37B */  lq          $19, 0x30($29)
/* 019218 01DC4F18 2000B27B */  lq          $18, 0x20($29)
/* 01921C 01DC4F1C 1000B17B */  lq          $17, 0x10($29)
/* 019220 01DC4F20 0000B07B */  lq          $16, 0x0($29)
/* 019224 01DC4F24 F002BD27 */  addiu       $29, $29, 0x2F0
/* 019228 01DC4F28 0800E003 */  jr          $31
/* 01922C 01DC4F2C 00000000 */   nop
