.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel TitleInit__Fi
/* 025DB0 01DD1AB0 60FEBD27 */  addiu       $29, $29, -0x1A0
/* 025DB4 01DD1AB4 4000BF7F */  sq          $31, 0x40($29)
/* 025DB8 01DD1AB8 3000B37F */  sq          $19, 0x30($29)
/* 025DBC 01DD1ABC 2000B27F */  sq          $18, 0x20($29)
/* 025DC0 01DD1AC0 1000B17F */  sq          $17, 0x10($29)
/* 025DC4 01DD1AC4 0000B07F */  sq          $16, 0x0($29)
/* 025DC8 01DD1AC8 289E8070 */  paddub      $19, $4, $0
/* 025DCC 01DD1ACC 6496040C */  jal         InitializeDataBuffer__Fv
/* 025DD0 01DD1AD0 00000000 */   nop
/* 025DD4 01DD1AD4 2B00023C */  lui         $2, %hi(VisualData)
/* 025DD8 01DD1AD8 10B04424 */  addiu       $4, $2, %lo(VisualData)
/* 025DDC 01DD1ADC 0300023C */  lui         $2, (0x30D40 >> 16)
/* 025DE0 01DD1AE0 400D4534 */  ori         $5, $2, (0x30D40 & 0xFFFF)
/* 025DE4 01DD1AE4 A496040C */  jal         SetDataBuffer__FP14CDataAlloc2_1_i
/* 025DE8 01DD1AE8 00000000 */   nop
/* 025DEC 01DD1AEC 2B00023C */  lui         $2, %hi(MotionData)
/* 025DF0 01DD1AF0 20B04424 */  addiu       $4, $2, %lo(MotionData)
/* 025DF4 01DD1AF4 0700023C */  lui         $2, (0x7A120 >> 16)
/* 025DF8 01DD1AF8 20A14534 */  ori         $5, $2, (0x7A120 & 0xFFFF)
/* 025DFC 01DD1AFC A496040C */  jal         SetDataBuffer__FP14CDataAlloc2_1_i
/* 025E00 01DD1B00 00000000 */   nop
/* 025E04 01DD1B04 2B00023C */  lui         $2, %hi(TextureData)
/* 025E08 01DD1B08 30B04424 */  addiu       $4, $2, %lo(TextureData)
/* 025E0C 01DD1B0C 0400023C */  lui         $2, (0x493E0 >> 16)
/* 025E10 01DD1B10 E0934534 */  ori         $5, $2, (0x493E0 & 0xFFFF)
/* 025E14 01DD1B14 A496040C */  jal         SetDataBuffer__FP14CDataAlloc2_1_i
/* 025E18 01DD1B18 00000000 */   nop
/* 025E1C 01DD1B1C 409C0434 */  ori         $4, $0, 0x9C40
/* 025E20 01DD1B20 0400023C */  lui         $2, (0x493E0 >> 16)
/* 025E24 01DD1B24 E0934534 */  ori         $5, $2, (0x493E0 & 0xFFFF)
/* 025E28 01DD1B28 B896040C */  jal         SetPacketReadBuffer__Fii
/* 025E2C 01DD1B2C 00000000 */   nop
/* 025E30 01DD1B30 EE020224 */  addiu       $2, $0, 0x2EE
/* 025E34 01DD1B34 00008244 */  mtc1        $2, $f0
/* 025E38 01DD1B38 00000000 */  nop
/* 025E3C 01DD1B3C 20038046 */  cvt.s.w     $f12, $f0
/* 025E40 01DD1B40 FFFF0234 */  ori         $2, $0, 0xFFFF
/* 025E44 01DD1B44 00008244 */  mtc1        $2, $f0
/* 025E48 01DD1B48 00000000 */  nop
/* 025E4C 01DD1B4C A0038046 */  cvt.s.w     $f14, $f0
/* 025E50 01DD1B50 8040023C */  lui         $2, (0x40800000 >> 16)
/* 025E54 01DD1B54 00688244 */  mtc1        $2, $f13
/* 025E58 01DD1B58 B8B5040C */  jal         MGSetRenderInfo__Ffff
/* 025E5C 01DD1B5C 00000000 */   nop
/* 025E60 01DD1B60 00608044 */  mtc1        $0, $f12
/* 025E64 01DD1B64 00000000 */  nop
/* 025E68 01DD1B68 86630046 */  mov.s       $f14, $f12
/* 025E6C 01DD1B6C 46630046 */  mov.s       $f13, $f12
/* 025E70 01DD1B70 E501023C */  lui         $2, %hi(Camera)
/* 025E74 01DD1B74 20164424 */  addiu       $4, $2, %lo(Camera)
/* 025E78 01DD1B78 282E0070 */  paddub      $5, $0, $0
/* 025E7C 01DD1B7C BC90040C */  jal         SetRef__7CCameraFP6CFramefff
/* 025E80 01DD1B80 00000000 */   nop
/* 025E84 01DD1B84 00608044 */  mtc1        $0, $f12
/* 025E88 01DD1B88 00000000 */  nop
/* 025E8C 01DD1B8C 46630046 */  mov.s       $f13, $f12
/* 025E90 01DD1B90 86630046 */  mov.s       $f14, $f12
/* 025E94 01DD1B94 E501023C */  lui         $2, %hi(Camera)
/* 025E98 01DD1B98 20164424 */  addiu       $4, $2, %lo(Camera)
/* 025E9C 01DD1B9C 282E0070 */  paddub      $5, $0, $0
/* 025EA0 01DD1BA0 9890040C */  jal         SetPos__7CCameraFP6CFramefff
/* 025EA4 01DD1BA4 00000000 */   nop
/* 025EA8 01DD1BA8 00608044 */  mtc1        $0, $f12
/* 025EAC 01DD1BAC 00000000 */  nop
/* 025EB0 01DD1BB0 86630046 */  mov.s       $f14, $f12
/* 025EB4 01DD1BB4 46630046 */  mov.s       $f13, $f12
/* 025EB8 01DD1BB8 E501023C */  lui         $2, %hi(FCamera)
/* 025EBC 01DD1BBC F0184424 */  addiu       $4, $2, %lo(FCamera)
/* 025EC0 01DD1BC0 B892040C */  jal         SetFollow__13CCameraFollowFfff
/* 025EC4 01DD1BC4 00000000 */   nop
/* 025EC8 01DD1BC8 00608044 */  mtc1        $0, $f12
/* 025ECC 01DD1BCC E501023C */  lui         $2, %hi(FCamera)
/* 025ED0 01DD1BD0 F0184424 */  addiu       $4, $2, %lo(FCamera)
/* 025ED4 01DD1BD4 C892040C */  jal         SetAngle__13CCameraFollowFf
/* 025ED8 01DD1BD8 00000000 */   nop
/* 025EDC 01DD1BDC 3443023C */  lui         $2, (0x43340000 >> 16)
/* 025EE0 01DD1BE0 00608244 */  mtc1        $2, $f12
/* 025EE4 01DD1BE4 E501023C */  lui         $2, %hi(FCamera)
/* 025EE8 01DD1BE8 F0184424 */  addiu       $4, $2, %lo(FCamera)
/* 025EEC 01DD1BEC DC92040C */  jal         SetDistance__13CCameraFollowFf
/* 025EF0 01DD1BF0 00000000 */   nop
/* 025EF4 01DD1BF4 0040023C */  lui         $2, (0x40000000 >> 16)
/* 025EF8 01DD1BF8 00608244 */  mtc1        $2, $f12
/* 025EFC 01DD1BFC E501023C */  lui         $2, %hi(FCamera)
/* 025F00 01DD1C00 F0184424 */  addiu       $4, $2, %lo(FCamera)
/* 025F04 01DD1C04 EC92040C */  jal         SetHeight__13CCameraFollowFf
/* 025F08 01DD1C08 00000000 */   nop
/* 025F0C 01DD1C0C 00688044 */  mtc1        $0, $f13
/* 025F10 01DD1C10 0043023C */  lui         $2, (0x43000000 >> 16)
/* 025F14 01DD1C14 00788244 */  mtc1        $2, $f15
/* 025F18 01DD1C18 066B0046 */  mov.s       $f12, $f13
/* 025F1C 01DD1C1C 866B0046 */  mov.s       $f14, $f13
/* 025F20 01DD1C20 24B8040C */  jal         MGSetBGColor__Fffff
/* 025F24 01DD1C24 00000000 */   nop
/* 025F28 01DD1C28 01000424 */  addiu       $4, $0, 0x1
/* 025F2C 01DD1C2C 046F050C */  jal         setbilinear__Fi
/* 025F30 01DD1C30 00000000 */   nop
/* 025F34 01DD1C34 DE01023C */  lui         $2, %hi(LIT_348__7)
/* 025F38 01DD1C38 C0BA4524 */  addiu       $5, $2, %lo(LIT_348__7)
/* 025F3C 01DD1C3C 5000A427 */  addiu       $4, $29, 0x50
/* 025F40 01DD1C40 05000324 */  addiu       $3, $0, 0x5
.L01DD1C44_2D7444:
/* 025F44 01DD1C44 0000A278 */  lq          $2, 0x0($5)
/* 025F48 01DD1C48 1000A524 */  addiu       $5, $5, 0x10
/* 025F4C 01DD1C4C FFFF6324 */  addiu       $3, $3, -0x1
/* 025F50 01DD1C50 0000827C */  sq          $2, 0x0($4)
/* 025F54 01DD1C54 10008424 */  addiu       $4, $4, 0x10
/* 025F58 01DD1C58 FAFF601C */  bgtz        $3, .L01DD1C44_2D7444
/* 025F5C 01DD1C5C 00000000 */   nop
/* 025F60 01DD1C60 0000A2C4 */  lwc1        $f2, 0x0($5)
/* 025F64 01DD1C64 000082E4 */  swc1        $f2, 0x0($4)
/* 025F68 01DD1C68 C701023C */  lui         $2, %hi(TexManager)
/* 025F6C 01DD1C6C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 025F70 01DD1C70 E03F0524 */  addiu       $5, $0, 0x3FE0
/* 025F74 01DD1C74 F0C3040C */  jal         Initialize__15CTextureManagerFi
/* 025F78 01DD1C78 00000000 */   nop
/* 025F7C 01DD1C7C C701023C */  lui         $2, %hi(TexManager)
/* 025F80 01DD1C80 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 025F84 01DD1C84 FFFF0524 */  addiu       $5, $0, -0x1
/* 025F88 01DD1C88 5000A627 */  addiu       $6, $29, 0x50
/* 025F8C 01DD1C8C 948B878F */  lw          $7, -0x746C($28)
/* 025F90 01DD1C90 58CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP16LOADTEXTURE_INFOPUi
/* 025F94 01DD1C94 00000000 */   nop
/* 025F98 01DD1C98 948B858F */  lw          $5, -0x746C($28)
/* 025F9C 01DD1C9C DE01023C */  lui         $2, %hi(LIT_378__5)
/* 025FA0 01DD1CA0 580D4424 */  addiu       $4, $2, %lo(LIT_378__5)
/* 025FA4 01DD1CA4 D0AE080C */  jal         LoadFileMenuData__FPcPUi
/* 025FA8 01DD1CA8 00000000 */   nop
/* 025FAC 01DD1CAC 948B858F */  lw          $5, -0x746C($28)
/* 025FB0 01DD1CB0 C701023C */  lui         $2, %hi(TexManager)
/* 025FB4 01DD1CB4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 025FB8 01DD1CB8 4CCA040C */  jal         EnterFixTextureZ__15CTextureManagerFPUc
/* 025FBC 01DD1CBC 00000000 */   nop
/* 025FC0 01DD1CC0 948B858F */  lw          $5, -0x746C($28)
/* 025FC4 01DD1CC4 DE01023C */  lui         $2, %hi(LIT_379__4)
/* 025FC8 01DD1CC8 700D4424 */  addiu       $4, $2, %lo(LIT_379__4)
/* 025FCC 01DD1CCC 28360070 */  paddub      $6, $0, $0
/* 025FD0 01DD1CD0 D8FC040C */  jal         LoadFile__FPcPvPi
/* 025FD4 01DD1CD4 00000000 */   nop
/* 025FD8 01DD1CD8 DE01023C */  lui         $2, %hi(LIT_350__5)
/* 025FDC 01DD1CDC 20BB4624 */  addiu       $6, $2, %lo(LIT_350__5)
/* 025FE0 01DD1CE0 B000A527 */  addiu       $5, $29, 0xB0
/* 025FE4 01DD1CE4 05000424 */  addiu       $4, $0, 0x5
.L01DD1CE8_2D74E8:
/* 025FE8 01DD1CE8 0000C378 */  lq          $3, 0x0($6)
/* 025FEC 01DD1CEC 1000C278 */  lq          $2, 0x10($6)
/* 025FF0 01DD1CF0 2000C624 */  addiu       $6, $6, 0x20
/* 025FF4 01DD1CF4 FFFF8424 */  addiu       $4, $4, -0x1
/* 025FF8 01DD1CF8 0000A37C */  sq          $3, 0x0($5)
/* 025FFC 01DD1CFC 1000A27C */  sq          $2, 0x10($5)
/* 026000 01DD1D00 2000A524 */  addiu       $5, $5, 0x20
/* 026004 01DD1D04 F8FF801C */  bgtz        $4, .L01DD1CE8_2D74E8
/* 026008 01DD1D08 00000000 */   nop
/* 02600C 01DD1D0C 0000C2DC */  ld          $2, 0x0($6)
/* 026010 01DD1D10 0000A2FC */  sd          $2, 0x0($5)
/* 026014 01DD1D14 948B848F */  lw          $4, -0x746C($28)
/* 026018 01DD1D18 DE01023C */  lui         $2, %hi(LIT_380__5)
/* 02601C 01DD1D1C 880D4524 */  addiu       $5, $2, %lo(LIT_380__5)
/* 026020 01DD1D20 28360070 */  paddub      $6, $0, $0
/* 026024 01DD1D24 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 026028 01DD1D28 00000000 */   nop
/* 02602C 01DD1D2C E000A2AF */  sw          $2, 0xE0($29)
/* 026030 01DD1D30 948B848F */  lw          $4, -0x746C($28)
/* 026034 01DD1D34 DE01023C */  lui         $2, %hi(LIT_381__6)
/* 026038 01DD1D38 900D4524 */  addiu       $5, $2, %lo(LIT_381__6)
/* 02603C 01DD1D3C 28360070 */  paddub      $6, $0, $0
/* 026040 01DD1D40 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 026044 01DD1D44 00000000 */   nop
/* 026048 01DD1D48 EC00A2AF */  sw          $2, 0xEC($29)
/* 02604C 01DD1D4C 948B848F */  lw          $4, -0x746C($28)
/* 026050 01DD1D50 DE01023C */  lui         $2, %hi(LIT_382__3)
/* 026054 01DD1D54 A00D4524 */  addiu       $5, $2, %lo(LIT_382__3)
/* 026058 01DD1D58 28360070 */  paddub      $6, $0, $0
/* 02605C 01DD1D5C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 026060 01DD1D60 00000000 */   nop
/* 026064 01DD1D64 F800A2AF */  sw          $2, 0xF8($29)
/* 026068 01DD1D68 948B848F */  lw          $4, -0x746C($28)
/* 02606C 01DD1D6C DE01023C */  lui         $2, %hi(LIT_383__3)
/* 026070 01DD1D70 B00D4524 */  addiu       $5, $2, %lo(LIT_383__3)
/* 026074 01DD1D74 28360070 */  paddub      $6, $0, $0
/* 026078 01DD1D78 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 02607C 01DD1D7C 00000000 */   nop
/* 026080 01DD1D80 0401A2AF */  sw          $2, 0x104($29)
/* 026084 01DD1D84 948B848F */  lw          $4, -0x746C($28)
/* 026088 01DD1D88 DE01023C */  lui         $2, %hi(LIT_384__6)
/* 02608C 01DD1D8C C00D4524 */  addiu       $5, $2, %lo(LIT_384__6)
/* 026090 01DD1D90 28360070 */  paddub      $6, $0, $0
/* 026094 01DD1D94 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 026098 01DD1D98 00000000 */   nop
/* 02609C 01DD1D9C 1001A2AF */  sw          $2, 0x110($29)
/* 0260A0 01DD1DA0 948B848F */  lw          $4, -0x746C($28)
/* 0260A4 01DD1DA4 DE01023C */  lui         $2, %hi(LIT_385__5)
/* 0260A8 01DD1DA8 D00D4524 */  addiu       $5, $2, %lo(LIT_385__5)
/* 0260AC 01DD1DAC 28360070 */  paddub      $6, $0, $0
/* 0260B0 01DD1DB0 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0260B4 01DD1DB4 00000000 */   nop
/* 0260B8 01DD1DB8 1C01A2AF */  sw          $2, 0x11C($29)
/* 0260BC 01DD1DBC 948B848F */  lw          $4, -0x746C($28)
/* 0260C0 01DD1DC0 DE01023C */  lui         $2, %hi(LIT_386__6)
/* 0260C4 01DD1DC4 E00D4524 */  addiu       $5, $2, %lo(LIT_386__6)
/* 0260C8 01DD1DC8 28360070 */  paddub      $6, $0, $0
/* 0260CC 01DD1DCC C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0260D0 01DD1DD0 00000000 */   nop
/* 0260D4 01DD1DD4 2801A2AF */  sw          $2, 0x128($29)
/* 0260D8 01DD1DD8 948B848F */  lw          $4, -0x746C($28)
/* 0260DC 01DD1DDC DE01023C */  lui         $2, %hi(LIT_387__7)
/* 0260E0 01DD1DE0 F00D4524 */  addiu       $5, $2, %lo(LIT_387__7)
/* 0260E4 01DD1DE4 28360070 */  paddub      $6, $0, $0
/* 0260E8 01DD1DE8 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0260EC 01DD1DEC 00000000 */   nop
/* 0260F0 01DD1DF0 3401A2AF */  sw          $2, 0x134($29)
/* 0260F4 01DD1DF4 948B848F */  lw          $4, -0x746C($28)
/* 0260F8 01DD1DF8 DE01023C */  lui         $2, %hi(LIT_388__5)
/* 0260FC 01DD1DFC 000E4524 */  addiu       $5, $2, %lo(LIT_388__5)
/* 026100 01DD1E00 28360070 */  paddub      $6, $0, $0
/* 026104 01DD1E04 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 026108 01DD1E08 00000000 */   nop
/* 02610C 01DD1E0C 4001A2AF */  sw          $2, 0x140($29)
/* 026110 01DD1E10 C701023C */  lui         $2, %hi(TexManager)
/* 026114 01DD1E14 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 026118 01DD1E18 FFFF0524 */  addiu       $5, $0, -0x1
/* 02611C 01DD1E1C B000A627 */  addiu       $6, $29, 0xB0
/* 026120 01DD1E20 C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 026124 01DD1E24 00000000 */   nop
/* 026128 01DD1E28 948B848F */  lw          $4, -0x746C($28)
/* 02612C 01DD1E2C DE01023C */  lui         $2, %hi(LIT_389__2)
/* 026130 01DD1E30 100E4524 */  addiu       $5, $2, %lo(LIT_389__2)
/* 026134 01DD1E34 28360070 */  paddub      $6, $0, $0
/* 026138 01DD1E38 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 02613C 01DD1E3C 00000000 */   nop
/* 026140 01DD1E40 28264070 */  paddub      $4, $2, $0
/* 026144 01DD1E44 02000524 */  addiu       $5, $0, 0x2
/* 026148 01DD1E48 28360070 */  paddub      $6, $0, $0
/* 02614C 01DD1E4C 289D040C */  jal         LoadMDSFile__FPUiii
/* 026150 01DD1E50 00000000 */   nop
/* 026154 01DD1E54 2C9C82AF */  sw          $2, -0x63D4($28)
/* 026158 01DD1E58 6001A0AF */  sw          $0, 0x160($29)
/* 02615C 01DD1E5C 6401A0AF */  sw          $0, 0x164($29)
/* 026160 01DD1E60 E0C1023C */  lui         $2, (0xC1E00000 >> 16)
/* 026164 01DD1E64 6801A2AF */  sw          $2, 0x168($29)
/* 026168 01DD1E68 2C9C848F */  lw          $4, -0x63D4($28)
/* 02616C 01DD1E6C 6001A527 */  addiu       $5, $29, 0x160
/* 026170 01DD1E70 B89F040C */  jal         SetPosition__6CFrameFPf
/* 026174 01DD1E74 00000000 */   nop
/* 026178 01DD1E78 E501023C */  lui         $2, %hi(Cloud__2)
/* 02617C 01DD1E7C E01B4424 */  addiu       $4, $2, %lo(Cloud__2)
/* 026180 01DD1E80 948B858F */  lw          $5, -0x746C($28)
/* 026184 01DD1E84 DE01023C */  lui         $2, %hi(LIT_390__2)
/* 026188 01DD1E88 180E4624 */  addiu       $6, $2, %lo(LIT_390__2)
/* 02618C 01DD1E8C 2B00023C */  lui         $2, %hi(MotionData)
/* 026190 01DD1E90 20B04724 */  addiu       $7, $2, %lo(MotionData)
/* 026194 01DD1E94 28460070 */  paddub      $8, $0, $0
/* 026198 01DD1E98 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 02619C 01DD1E9C 00000000 */   nop
/* 0261A0 01DD1EA0 C842023C */  lui         $2, (0x42C80000 >> 16)
/* 0261A4 01DD1EA4 E501013C */  lui         $1, %hi(Cloud__2 + 0x2F0)
/* 0261A8 01DD1EA8 D01E22AC */  sw          $2, %lo(Cloud__2 + 0x2F0)($1)
/* 0261AC 01DD1EAC 808080C7 */  lwc1        $f0, -0x7F80($28)
/* 0261B0 01DD1EB0 E501013C */  lui         $1, %hi(Cloud__2 + 0x2F8)
/* 0261B4 01DD1EB4 D81E20E4 */  swc1        $f0, %lo(Cloud__2 + 0x2F8)($1)
/* 0261B8 01DD1EB8 E501013C */  lui         $1, %hi(Cloud__2 + 0x304)
/* 0261BC 01DD1EBC E41E20AC */  sw          $0, %lo(Cloud__2 + 0x304)($1)
/* 0261C0 01DD1EC0 E501013C */  lui         $1, %hi(Cloud__2 + 0x308)
/* 0261C4 01DD1EC4 E81E20AC */  sw          $0, %lo(Cloud__2 + 0x308)($1)
/* 0261C8 01DD1EC8 E501013C */  lui         $1, %hi(Cloud__2 + 0x30C)
/* 0261CC 01DD1ECC EC1E20AC */  sw          $0, %lo(Cloud__2 + 0x30C)($1)
/* 0261D0 01DD1ED0 E501013C */  lui         $1, %hi(Cloud__2 + 0xC68)
/* 0261D4 01DD1ED4 482820AC */  sw          $0, %lo(Cloud__2 + 0xC68)($1)
/* 0261D8 01DD1ED8 00608044 */  mtc1        $0, $f12
/* 0261DC 01DD1EDC 00000000 */  nop
/* 0261E0 01DD1EE0 46630046 */  mov.s       $f13, $f12
/* 0261E4 01DD1EE4 A0C0023C */  lui         $2, (0xC0A00000 >> 16)
/* 0261E8 01DD1EE8 00708244 */  mtc1        $2, $f14
/* 0261EC 01DD1EEC E501023C */  lui         $2, %hi(Cloud__2)
/* 0261F0 01DD1EF0 E01B4424 */  addiu       $4, $2, %lo(Cloud__2)
/* 0261F4 01DD1EF4 ECE3040C */  jal         SetPosition__10CCharacterFfff
/* 0261F8 01DD1EF8 00000000 */   nop
/* 0261FC 01DD1EFC E501023C */  lui         $2, %hi(Logo)
/* 026200 01DD1F00 902D4424 */  addiu       $4, $2, %lo(Logo)
/* 026204 01DD1F04 948B858F */  lw          $5, -0x746C($28)
/* 026208 01DD1F08 DE01023C */  lui         $2, %hi(LIT_392__2)
/* 02620C 01DD1F0C 280E4624 */  addiu       $6, $2, %lo(LIT_392__2)
/* 026210 01DD1F10 2B00023C */  lui         $2, %hi(MotionData)
/* 026214 01DD1F14 20B04724 */  addiu       $7, $2, %lo(MotionData)
/* 026218 01DD1F18 28460070 */  paddub      $8, $0, $0
/* 02621C 01DD1F1C FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 026220 01DD1F20 00000000 */   nop
/* 026224 01DD1F24 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 026228 01DD1F28 E501013C */  lui         $1, %hi(Logo + 0x2F0)
/* 02622C 01DD1F2C 803022AC */  sw          $2, %lo(Logo + 0x2F0)($1)
/* 026230 01DD1F30 808080C7 */  lwc1        $f0, -0x7F80($28)
/* 026234 01DD1F34 E501013C */  lui         $1, %hi(Logo + 0x2F8)
/* 026238 01DD1F38 883020E4 */  swc1        $f0, %lo(Logo + 0x2F8)($1)
/* 02623C 01DD1F3C E501013C */  lui         $1, %hi(Logo + 0x304)
/* 026240 01DD1F40 943020AC */  sw          $0, %lo(Logo + 0x304)($1)
/* 026244 01DD1F44 E501013C */  lui         $1, %hi(Logo + 0x308)
/* 026248 01DD1F48 983020AC */  sw          $0, %lo(Logo + 0x308)($1)
/* 02624C 01DD1F4C E501013C */  lui         $1, %hi(Logo + 0x30C)
/* 026250 01DD1F50 9C3020AC */  sw          $0, %lo(Logo + 0x30C)($1)
/* 026254 01DD1F54 E501013C */  lui         $1, %hi(Logo + 0xC68)
/* 026258 01DD1F58 F83920AC */  sw          $0, %lo(Logo + 0xC68)($1)
/* 02625C 01DD1F5C DE01023C */  lui         $2, %hi(LIT_360__5)
/* 026260 01DD1F60 D0BB4524 */  addiu       $5, $2, %lo(LIT_360__5)
/* 026264 01DD1F64 7001A427 */  addiu       $4, $29, 0x170
/* 026268 01DD1F68 02000324 */  addiu       $3, $0, 0x2
.L01DD1F6C_2D776C:
/* 02626C 01DD1F6C 0000A278 */  lq          $2, 0x0($5)
/* 026270 01DD1F70 1000A524 */  addiu       $5, $5, 0x10
/* 026274 01DD1F74 FFFF6324 */  addiu       $3, $3, -0x1
/* 026278 01DD1F78 0000827C */  sq          $2, 0x0($4)
/* 02627C 01DD1F7C 10008424 */  addiu       $4, $4, 0x10
/* 026280 01DD1F80 FAFF601C */  bgtz        $3, .L01DD1F6C_2D776C
/* 026284 01DD1F84 00000000 */   nop
/* 026288 01DD1F88 0000A2C4 */  lwc1        $f2, 0x0($5)
/* 02628C 01DD1F8C 000082E4 */  swc1        $f2, 0x0($4)
/* 026290 01DD1F90 28860070 */  paddub      $16, $0, $0
/* 026294 01DD1F94 31000010 */  b           .L01DD205C_2D785C
/* 026298 01DD1F98 00000000 */   nop
.L01DD1F9C_2D779C:
/* 02629C 01DD1F9C B0110224 */  addiu       $2, $0, 0x11B0
/* 0262A0 01DD1FA0 18880202 */  mult        $17, $16, $2
/* 0262A4 01DD1FA4 E501023C */  lui         $2, %hi(Spark)
/* 0262A8 01DD1FA8 403F4224 */  addiu       $2, $2, %lo(Spark)
/* 0262AC 01DD1FAC 21905100 */  addu        $18, $2, $17
/* 0262B0 01DD1FB0 80101000 */  sll         $2, $16, 2
/* 0262B4 01DD1FB4 21105D00 */  addu        $2, $2, $29
/* 0262B8 01DD1FB8 28264072 */  paddub      $4, $18, $0
/* 0262BC 01DD1FBC 948B858F */  lw          $5, -0x746C($28)
/* 0262C0 01DD1FC0 7001468C */  lw          $6, 0x170($2)
/* 0262C4 01DD1FC4 2B00023C */  lui         $2, %hi(MotionData)
/* 0262C8 01DD1FC8 20B04724 */  addiu       $7, $2, %lo(MotionData)
/* 0262CC 01DD1FCC 28460070 */  paddub      $8, $0, $0
/* 0262D0 01DD1FD0 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 0262D4 01DD1FD4 00000000 */   nop
/* 0262D8 01DD1FD8 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 0262DC 01DD1FDC E501023C */  lui         $2, %hi(Spark + 0x2F0)
/* 0262E0 01DD1FE0 30424224 */  addiu       $2, $2, %lo(Spark + 0x2F0)
/* 0262E4 01DD1FE4 21105100 */  addu        $2, $2, $17
/* 0262E8 01DD1FE8 000043AC */  sw          $3, 0x0($2)
/* 0262EC 01DD1FEC 808080C7 */  lwc1        $f0, -0x7F80($28)
/* 0262F0 01DD1FF0 E501023C */  lui         $2, %hi(Spark + 0x2F8)
/* 0262F4 01DD1FF4 38424224 */  addiu       $2, $2, %lo(Spark + 0x2F8)
/* 0262F8 01DD1FF8 21105100 */  addu        $2, $2, $17
/* 0262FC 01DD1FFC 000040E4 */  swc1        $f0, 0x0($2)
/* 026300 01DD2000 E501023C */  lui         $2, %hi(Spark + 0x304)
/* 026304 01DD2004 44424224 */  addiu       $2, $2, %lo(Spark + 0x304)
/* 026308 01DD2008 21105100 */  addu        $2, $2, $17
/* 02630C 01DD200C 000040AC */  sw          $0, 0x0($2)
/* 026310 01DD2010 E501023C */  lui         $2, %hi(Spark + 0x308)
/* 026314 01DD2014 48424224 */  addiu       $2, $2, %lo(Spark + 0x308)
/* 026318 01DD2018 21105100 */  addu        $2, $2, $17
/* 02631C 01DD201C 000040AC */  sw          $0, 0x0($2)
/* 026320 01DD2020 E501023C */  lui         $2, %hi(Spark + 0x30C)
/* 026324 01DD2024 4C424224 */  addiu       $2, $2, %lo(Spark + 0x30C)
/* 026328 01DD2028 21105100 */  addu        $2, $2, $17
/* 02632C 01DD202C 000040AC */  sw          $0, 0x0($2)
/* 026330 01DD2030 E501023C */  lui         $2, %hi(Spark + 0xC68)
/* 026334 01DD2034 A84B4224 */  addiu       $2, $2, %lo(Spark + 0xC68)
/* 026338 01DD2038 21105100 */  addu        $2, $2, $17
/* 02633C 01DD203C 000040AC */  sw          $0, 0x0($2)
/* 026340 01DD2040 00608044 */  mtc1        $0, $f12
/* 026344 01DD2044 28264072 */  paddub      $4, $18, $0
/* 026348 01DD2048 08818DC7 */  lwc1        $f13, -0x7EF8($28)
/* 02634C 01DD204C 0C818EC7 */  lwc1        $f14, -0x7EF4($28)
/* 026350 01DD2050 ECE3040C */  jal         SetPosition__10CCharacterFfff
/* 026354 01DD2054 00000000 */   nop
/* 026358 01DD2058 01001026 */  addiu       $16, $16, 0x1
.L01DD205C_2D785C:
/* 02635C 01DD205C 0900022A */  slti        $2, $16, 0x9
/* 026360 01DD2060 CEFF4014 */  bnez        $2, .L01DD1F9C_2D779C
/* 026364 01DD2064 00000000 */   nop
/* 026368 01DD2068 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 02636C 01DD206C 282E0070 */  paddub      $5, $0, $0
/* 026370 01DD2070 04000624 */  addiu       $6, $0, 0x4
/* 026374 01DD2074 05000724 */  addiu       $7, $0, 0x5
/* 026378 01DD2078 140F050C */  jal         SetReverb__6CSoundFiii
/* 02637C 01DD207C 00000000 */   nop
/* 026380 01DD2080 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 026384 01DD2084 01000524 */  addiu       $5, $0, 0x1
/* 026388 01DD2088 28360070 */  paddub      $6, $0, $0
/* 02638C 01DD208C 283E0070 */  paddub      $7, $0, $0
/* 026390 01DD2090 140F050C */  jal         SetReverb__6CSoundFiii
/* 026394 01DD2094 00000000 */   nop
/* 026398 01DD2098 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 02639C 01DD209C DE01023C */  lui         $2, %hi(LIT_395__5)
/* 0263A0 01DD20A0 380E4524 */  addiu       $5, $2, %lo(LIT_395__5)
/* 0263A4 01DD20A4 948B868F */  lw          $6, -0x746C($28)
/* 0263A8 01DD20A8 3410050C */  jal         LoadSoundFileFromPack__6CSoundFPcPUi
/* 0263AC 01DD20AC 00000000 */   nop
/* 0263B0 01DD20B0 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 0263B4 01DD20B4 0F000524 */  addiu       $5, $0, 0xF
/* 0263B8 01DD20B8 00010624 */  addiu       $6, $0, 0x100
/* 0263BC 01DD20BC 581A050C */  jal         SetVol__6CSoundFii
/* 0263C0 01DD20C0 00000000 */   nop
/* 0263C4 01DD20C4 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 0263C8 01DD20C8 0E000524 */  addiu       $5, $0, 0xE
/* 0263CC 01DD20CC 00010624 */  addiu       $6, $0, 0x100
/* 0263D0 01DD20D0 581A050C */  jal         SetVol__6CSoundFii
/* 0263D4 01DD20D4 00000000 */   nop
/* 0263D8 01DD20D8 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 0263DC 01DD20DC 0D000524 */  addiu       $5, $0, 0xD
/* 0263E0 01DD20E0 00010624 */  addiu       $6, $0, 0x100
/* 0263E4 01DD20E4 581A050C */  jal         SetVol__6CSoundFii
/* 0263E8 01DD20E8 00000000 */   nop
/* 0263EC 01DD20EC 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 0263F0 01DD20F0 0C000524 */  addiu       $5, $0, 0xC
/* 0263F4 01DD20F4 00010624 */  addiu       $6, $0, 0x100
/* 0263F8 01DD20F8 581A050C */  jal         SetVol__6CSoundFii
/* 0263FC 01DD20FC 00000000 */   nop
/* 026400 01DD2100 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 026404 01DD2104 01000524 */  addiu       $5, $0, 0x1
/* 026408 01DD2108 28360070 */  paddub      $6, $0, $0
/* 02640C 01DD210C 8814050C */  jal         SQ_Play__6CSoundFii
/* 026410 01DD2110 00000000 */   nop
/* 026414 01DD2114 4C9C80AF */  sw          $0, -0x63B4($28)
/* 026418 01DD2118 489C80AF */  sw          $0, -0x63B8($28)
/* 02641C 01DD211C 449C80AF */  sw          $0, -0x63BC($28)
/* 026420 01DD2120 409C80AF */  sw          $0, -0x63C0($28)
/* 026424 01DD2124 3C9C80AF */  sw          $0, -0x63C4($28)
/* 026428 01DD2128 509C80AF */  sw          $0, -0x63B0($28)
/* 02642C 01DD212C 549C80AF */  sw          $0, -0x63AC($28)
/* 026430 01DD2130 5C9C80AF */  sw          $0, -0x63A4($28)
/* 026434 01DD2134 589C80A3 */  sb          $0, -0x63A8($28)
/* 026438 01DD2138 609C80AF */  sw          $0, -0x63A0($28)
/* 02643C 01DD213C 309C80AF */  sw          $0, -0x63D0($28)
/* 026440 01DD2140 389C80AF */  sw          $0, -0x63C8($28)
/* 026444 01DD2144 E601023C */  lui         $2, %hi(CSprite)
/* 026448 01DD2148 70DE4424 */  addiu       $4, $2, %lo(CSprite)
/* 02644C 01DD214C 1C51770C */  jal         Init__7CSpriteFv
/* 026450 01DD2150 00000000 */   nop
/* 026454 01DD2154 E601023C */  lui         $2, %hi(CLogo)
/* 026458 01DD2158 E0DE4424 */  addiu       $4, $2, %lo(CLogo)
/* 02645C 01DD215C 904F770C */  jal         Init__5CLogoFv
/* 026460 01DD2160 00000000 */   nop
/* 026464 01DD2164 E601023C */  lui         $2, %hi(CCursol)
/* 026468 01DD2168 40DF4424 */  addiu       $4, $2, %lo(CCursol)
/* 02646C 01DD216C 3C53770C */  jal         Init__7CCursolFv
/* 026470 01DD2170 00000000 */   nop
/* 026474 01DD2174 01000224 */  addiu       $2, $0, 0x1
/* 026478 01DD2178 14006216 */  bne         $19, $2, .L01DD21CC_2D79CC
/* 02647C 01DD217C 00000000 */   nop
/* 026480 01DD2180 E601013C */  lui         $1, %hi(CCursol + 0x1C)
/* 026484 01DD2184 5CDF22AC */  sw          $2, %lo(CCursol + 0x1C)($1)
/* 026488 01DD2188 9E43023C */  lui         $2, (0x439E0000 >> 16)
/* 02648C 01DD218C 00608244 */  mtc1        $2, $f12
/* 026490 01DD2190 E601023C */  lui         $2, %hi(CCursol)
/* 026494 01DD2194 40DF4424 */  addiu       $4, $2, %lo(CCursol)
/* 026498 01DD2198 2C54770C */  jal         Set__7CCursolFf
/* 02649C 01DD219C 00000000 */   nop
/* 0264A0 01DD21A0 28860070 */  paddub      $16, $0, $0
/* 0264A4 01DD21A4 06000010 */  b           .L01DD21C0_2D79C0
/* 0264A8 01DD21A8 00000000 */   nop
.L01DD21AC_2D79AC:
/* 0264AC 01DD21AC E601023C */  lui         $2, %hi(CCursol)
/* 0264B0 01DD21B0 40DF4424 */  addiu       $4, $2, %lo(CCursol)
/* 0264B4 01DD21B4 4853770C */  jal         Move__7CCursolFv
/* 0264B8 01DD21B8 00000000 */   nop
/* 0264BC 01DD21BC 01001026 */  addiu       $16, $16, 0x1
.L01DD21C0_2D79C0:
/* 0264C0 01DD21C0 0A00022A */  slti        $2, $16, 0xA
/* 0264C4 01DD21C4 F9FF4014 */  bnez        $2, .L01DD21AC_2D79AC
/* 0264C8 01DD21C8 00000000 */   nop
.L01DD21CC_2D79CC:
/* 0264CC 01DD21CC CC01023C */  lui         $2, %hi(GamePad)
/* 0264D0 01DD21D0 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0264D4 01DD21D4 00500524 */  addiu       $5, $0, 0x5000
/* 0264D8 01DD21D8 1E000624 */  addiu       $6, $0, 0x1E
/* 0264DC 01DD21DC 09000724 */  addiu       $7, $0, 0x9
/* 0264E0 01DD21E0 58AD040C */  jal         SetAutoRepeat__8CGamePadFiii
/* 0264E4 01DD21E4 00000000 */   nop
/* 0264E8 01DD21E8 CC01023C */  lui         $2, %hi(GamePad)
/* 0264EC 01DD21EC 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0264F0 01DD21F0 78000524 */  addiu       $5, $0, 0x78
/* 0264F4 01DD21F4 48AE040C */  jal         MenuModeOn__8CGamePadFi
/* 0264F8 01DD21F8 00000000 */   nop
/* 0264FC 01DD21FC 4000BF7B */  lq          $31, 0x40($29)
/* 026500 01DD2200 3000B37B */  lq          $19, 0x30($29)
/* 026504 01DD2204 2000B27B */  lq          $18, 0x20($29)
/* 026508 01DD2208 1000B17B */  lq          $17, 0x10($29)
/* 02650C 01DD220C 0000B07B */  lq          $16, 0x0($29)
/* 026510 01DD2210 A001BD27 */  addiu       $29, $29, 0x1A0
/* 026514 01DD2214 0800E003 */  jr          $31
/* 026518 01DD2218 00000000 */   nop
/* 02651C 01DD221C 00000000 */  nop
