.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel RushInit__Fv
/* 01CF50 01DC8C50 F0FFBD27 */  addiu       $29, $29, -0x10
/* 01CF54 01DC8C54 0000BF7F */  sq          $31, 0x0($29)
/* 01CF58 01DC8C58 DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 01CF5C 01DC8C5C 00000000 */   nop
/* 01CF60 01DC8C60 6496040C */  jal         InitializeDataBuffer__Fv
/* 01CF64 01DC8C64 00000000 */   nop
/* 01CF68 01DC8C68 E401023C */  lui         $2, %hi(CharaDataBuffer)
/* 01CF6C 01DC8C6C 20D04424 */  addiu       $4, $2, %lo(CharaDataBuffer)
/* 01CF70 01DC8C70 0700023C */  lui         $2, (0x77A10 >> 16)
/* 01CF74 01DC8C74 107A4534 */  ori         $5, $2, (0x77A10 & 0xFFFF)
/* 01CF78 01DC8C78 A496040C */  jal         SetDataBuffer__FP14CDataAlloc2_1_i
/* 01CF7C 01DC8C7C 00000000 */   nop
/* 01CF80 01DC8C80 E501023C */  lui         $2, %hi(PathDataBuffer)
/* 01CF84 01DC8C84 C00A4424 */  addiu       $4, $2, %lo(PathDataBuffer)
/* 01CF88 01DC8C88 30750524 */  addiu       $5, $0, 0x7530
/* 01CF8C 01DC8C8C A496040C */  jal         SetDataBuffer__FP14CDataAlloc2_1_i
/* 01CF90 01DC8C90 00000000 */   nop
/* 01CF94 01DC8C94 DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 01CF98 01DC8C98 B0FE4424 */  addiu       $4, $2, %lo(MapDataBuffer)
/* 01CF9C 01DC8C9C 0300023C */  lui         $2, (0x3F7A0 >> 16)
/* 01CFA0 01DC8CA0 A0F74534 */  ori         $5, $2, (0x3F7A0 & 0xFFFF)
/* 01CFA4 01DC8CA4 A496040C */  jal         SetDataBuffer__FP14CDataAlloc2_1_i
/* 01CFA8 01DC8CA8 00000000 */   nop
/* 01CFAC 01DC8CAC E501023C */  lui         $2, %hi(WaterBuffer)
/* 01CFB0 01DC8CB0 D00A4424 */  addiu       $4, $2, %lo(WaterBuffer)
/* 01CFB4 01DC8CB4 30750524 */  addiu       $5, $0, 0x7530
/* 01CFB8 01DC8CB8 A496040C */  jal         SetDataBuffer__FP14CDataAlloc2_1_i
/* 01CFBC 01DC8CBC 00000000 */   nop
/* 01CFC0 01DC8CC0 E501023C */  lui         $2, %hi(DummyDataBuffer)
/* 01CFC4 01DC8CC4 E00A4424 */  addiu       $4, $2, %lo(DummyDataBuffer)
/* 01CFC8 01DC8CC8 10270524 */  addiu       $5, $0, 0x2710
/* 01CFCC 01DC8CCC A496040C */  jal         SetDataBuffer__FP14CDataAlloc2_1_i
/* 01CFD0 01DC8CD0 00000000 */   nop
/* 01CFD4 01DC8CD4 2B00023C */  lui         $2, %hi(TextureData)
/* 01CFD8 01DC8CD8 30B04424 */  addiu       $4, $2, %lo(TextureData)
/* 01CFDC 01DC8CDC 0300023C */  lui         $2, (0x3D090 >> 16)
/* 01CFE0 01DC8CE0 90D04534 */  ori         $5, $2, (0x3D090 & 0xFFFF)
/* 01CFE4 01DC8CE4 A496040C */  jal         SetDataBuffer__FP14CDataAlloc2_1_i
/* 01CFE8 01DC8CE8 00000000 */   nop
/* 01CFEC 01DC8CEC 50C30434 */  ori         $4, $0, 0xC350
/* 01CFF0 01DC8CF0 0500023C */  lui         $2, (0x57E40 >> 16)
/* 01CFF4 01DC8CF4 407E4534 */  ori         $5, $2, (0x57E40 & 0xFFFF)
/* 01CFF8 01DC8CF8 B896040C */  jal         SetPacketReadBuffer__Fii
/* 01CFFC 01DC8CFC 00000000 */   nop
/* 01D000 01DC8D00 A042023C */  lui         $2, (0x42A00000 >> 16)
/* 01D004 01DC8D04 00608244 */  mtc1        $2, $f12
/* 01D008 01DC8D08 E301023C */  lui         $2, %hi(MainCamera__3)
/* 01D00C 01DC8D0C 80E64424 */  addiu       $4, $2, %lo(MainCamera__3)
/* 01D010 01DC8D10 DC92040C */  jal         SetDistance__13CCameraFollowFf
/* 01D014 01DC8D14 00000000 */   nop
/* 01D018 01DC8D18 00608044 */  mtc1        $0, $f12
/* 01D01C 01DC8D1C E301023C */  lui         $2, %hi(MainCamera__3)
/* 01D020 01DC8D20 80E64424 */  addiu       $4, $2, %lo(MainCamera__3)
/* 01D024 01DC8D24 EC92040C */  jal         SetHeight__13CCameraFollowFf
/* 01D028 01DC8D28 00000000 */   nop
/* 01D02C 01DC8D2C 00608044 */  mtc1        $0, $f12
/* 01D030 01DC8D30 00000000 */  nop
/* 01D034 01DC8D34 46630046 */  mov.s       $f13, $f12
/* 01D038 01DC8D38 86630046 */  mov.s       $f14, $f12
/* 01D03C 01DC8D3C E301023C */  lui         $2, %hi(MainCamera__3)
/* 01D040 01DC8D40 80E64424 */  addiu       $4, $2, %lo(MainCamera__3)
/* 01D044 01DC8D44 B892040C */  jal         SetFollow__13CCameraFollowFfff
/* 01D048 01DC8D48 00000000 */   nop
/* 01D04C 01DC8D4C E301023C */  lui         $2, %hi(MainCamera__3)
/* 01D050 01DC8D50 80E64424 */  addiu       $4, $2, %lo(MainCamera__3)
/* 01D054 01DC8D54 282E0070 */  paddub      $5, $0, $0
/* 01D058 01DC8D58 F491040C */  jal         Step__13CCameraFollowFi
/* 01D05C 01DC8D5C 00000000 */   nop
/* 01D060 01DC8D60 4844023C */  lui         $2, (0x44480000 >> 16)
/* 01D064 01DC8D64 00608244 */  mtc1        $2, $f12
/* 01D068 01DC8D68 C040023C */  lui         $2, (0x40C00000 >> 16)
/* 01D06C 01DC8D6C 00688244 */  mtc1        $2, $f13
/* 01D070 01DC8D70 FFFF0234 */  ori         $2, $0, 0xFFFF
/* 01D074 01DC8D74 00008244 */  mtc1        $2, $f0
/* 01D078 01DC8D78 00000000 */  nop
/* 01D07C 01DC8D7C A0038046 */  cvt.s.w     $f14, $f0
/* 01D080 01DC8D80 B8B5040C */  jal         MGSetRenderInfo__Ffff
/* 01D084 01DC8D84 00000000 */   nop
/* 01D088 01DC8D88 DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 01D08C 01DC8D8C 00000000 */   nop
/* 01D090 01DC8D90 04000424 */  addiu       $4, $0, 0x4
/* 01D094 01DC8D94 1E000524 */  addiu       $5, $0, 0x1E
/* 01D098 01DC8D98 28368070 */  paddub      $6, $4, $0
/* 01D09C 01DC8D9C 05000724 */  addiu       $7, $0, 0x5
/* 01D0A0 01DC8DA0 8064050C */  jal         SndInitialize__Fiiii
/* 01D0A4 01DC8DA4 00000000 */   nop
/* 01D0A8 01DC8DA8 948B848F */  lw          $4, -0x746C($28)
/* 01D0AC 01DC8DAC 8C65050C */  jal         SndSetReadBuffer__FPUi
/* 01D0B0 01DC8DB0 00000000 */   nop
/* 01D0B4 01DC8DB4 35010424 */  addiu       $4, $0, 0x135
/* 01D0B8 01DC8DB8 3C69050C */  jal         SndSoundLoad__Fi
/* 01D0BC 01DC8DBC 00000000 */   nop
/* 01D0C0 01DC8DC0 28260070 */  paddub      $4, $0, $0
/* 01D0C4 01DC8DC4 446C050C */  jal         SndAmbientPlay__Fi
/* 01D0C8 01DC8DC8 00000000 */   nop
/* 01D0CC 01DC8DCC 28260070 */  paddub      $4, $0, $0
/* 01D0D0 01DC8DD0 FC6C050C */  jal         SndVoiceLoad__Fi
/* 01D0D4 01DC8DD4 00000000 */   nop
/* 01D0D8 01DC8DD8 4C66050C */  jal         SndBgmInit__Fv
/* 01D0DC 01DC8DDC 00000000 */   nop
/* 01D0E0 01DC8DE0 19000424 */  addiu       $4, $0, 0x19
/* 01D0E4 01DC8DE4 5866050C */  jal         SndBgmLoad__Fi
/* 01D0E8 01DC8DE8 00000000 */   nop
/* 01D0EC 01DC8DEC DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 01D0F0 01DC8DF0 00000000 */   nop
/* 01D0F4 01DC8DF4 30FB040C */  jal         StartReadBG__Fv
/* 01D0F8 01DC8DF8 00000000 */   nop
/* 01D0FC 01DC8DFC E301013C */  lui         $1, %hi(CScript + 0x1C)
/* 01D100 01DC8E00 DCE920AC */  sw          $0, %lo(CScript + 0x1C)($1)
/* 01D104 01DC8E04 E301013C */  lui         $1, %hi(CScript + 0x20)
/* 01D108 01DC8E08 E0E920AC */  sw          $0, %lo(CScript + 0x20)($1)
/* 01D10C 01DC8E0C AC2C770C */  jal         DataLoad__Fv
/* 01D110 01DC8E10 00000000 */   nop
/* 01D114 01DC8E14 DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 01D118 01DC8E18 00000000 */   nop
/* 01D11C 01DC8E1C E301023C */  lui         $2, %hi(CScript)
/* 01D120 01DC8E20 C0E94424 */  addiu       $4, $2, %lo(CScript)
/* 01D124 01DC8E24 DE01023C */  lui         $2, %hi(LIT_364__4)
/* 01D128 01DC8E28 60FE4524 */  addiu       $5, $2, %lo(LIT_364__4)
/* 01D12C 01DC8E2C 60AF760C */  jal         LoadBaseTexture__Fv
/* 01D130 01DC8E30 00000000 */   nop
/* 01D134 01DC8E34 0043023C */  lui         $2, (0x43000000 >> 16)
/* 01D138 01DC8E38 00608244 */  mtc1        $2, $f12
/* 01D13C 01DC8E3C E301023C */  lui         $2, %hi(DispFade__2)
/* 01D140 01DC8E40 70E94424 */  addiu       $4, $2, %lo(DispFade__2)
/* 01D144 01DC8E44 88B4760C */  jal         FadeInit__9CDispFadeFf
/* 01D148 01DC8E48 00000000 */   nop
/* 01D14C 01DC8E4C 0043023C */  lui         $2, (0x43000000 >> 16)
/* 01D150 01DC8E50 00608244 */  mtc1        $2, $f12
/* 01D154 01DC8E54 E301023C */  lui         $2, %hi(DispFade__2)
/* 01D158 01DC8E58 70E94424 */  addiu       $4, $2, %lo(DispFade__2)
/* 01D15C 01DC8E5C 282E0070 */  paddub      $5, $0, $0
/* 01D160 01DC8E60 78B4760C */  jal         FadeOutStart__9CDispFadeFfi
/* 01D164 01DC8E64 00000000 */   nop
/* 01D168 01DC8E68 B49B80A3 */  sb          $0, -0x644C($28)
/* 01D16C 01DC8E6C B89B80AF */  sw          $0, -0x6448($28)
/* 01D170 01DC8E70 01000324 */  addiu       $3, $0, 0x1
/* 01D174 01DC8E74 BC9B83AF */  sw          $3, -0x6444($28)
/* 01D178 01DC8E78 148180C7 */  lwc1        $f0, -0x7EEC($28)
/* 01D17C 01DC8E7C C49B80E7 */  swc1        $f0, -0x643C($28)
/* 01D180 01DC8E80 C89B83AF */  sw          $3, -0x6438($28)
/* 01D184 01DC8E84 CC9B80AF */  sw          $0, -0x6434($28)
/* 01D188 01DC8E88 D09B80AF */  sw          $0, -0x6430($28)
/* 01D18C 01DC8E8C D89B80AF */  sw          $0, -0x6428($28)
/* 01D190 01DC8E90 D49B80AF */  sw          $0, -0x642C($28)
/* 01D194 01DC8E94 0000BF7B */  lq          $31, 0x0($29)
/* 01D198 01DC8E98 1000BD27 */  addiu       $29, $29, 0x10
/* 01D19C 01DC8E9C 0800E003 */  jr          $31
/* 01D1A0 01DC8EA0 00000000 */   nop
/* 01D1A4 01DC8EA4 00000000 */  nop
/* 01D1A8 01DC8EA8 00000000 */  nop
/* 01D1AC 01DC8EAC 00000000 */  nop
