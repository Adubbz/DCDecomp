.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawProcess__Fv__2
/* 01E170 01DC9E70 70FEBD27 */  addiu       $29, $29, -0x190
/* 01E174 01DC9E74 1000BF7F */  sq          $31, 0x10($29)
/* 01E178 01DC9E78 0000B07F */  sq          $16, 0x0($29)
/* 01E17C 01DC9E7C E301023C */  lui         $2, %hi(DispFade__2)
/* 01E180 01DC9E80 70E94424 */  addiu       $4, $2, %lo(DispFade__2)
/* 01E184 01DC9E84 90B4760C */  jal         GetRate__9CDispFadeFv
/* 01E188 01DC9E88 00000000 */   nop
/* 01E18C 01DC9E8C 06030046 */  mov.s       $f12, $f0
/* 01E190 01DC9E90 9044040C */  jal         fptodp
/* 01E194 01DC9E94 00000000 */   nop
/* 01E198 01DC9E98 6040033C */  lui         $3, (0x40600000 >> 16)
/* 01E19C 01DC9E9C 3C200300 */  dsll32      $4, $3, 0
/* 01E1A0 01DC9EA0 282E4070 */  paddub      $5, $2, $0
/* 01E1A4 01DC9EA4 3000040C */  jal         _dpfeq
/* 01E1A8 01DC9EA8 00000000 */   nop
/* 01E1AC 01DC9EAC BC004014 */  bnez        $2, .L01DCA1A0_2CF9A0
/* 01E1B0 01DC9EB0 00000000 */   nop
/* 01E1B4 01DC9EB4 E301023C */  lui         $2, %hi(MainCamera__3)
/* 01E1B8 01DC9EB8 80E64424 */  addiu       $4, $2, %lo(MainCamera__3)
/* 01E1BC 01DC9EBC 2000A527 */  addiu       $5, $29, 0x20
/* 01E1C0 01DC9EC0 9C91040C */  jal         GetPos__7CCameraFPf
/* 01E1C4 01DC9EC4 00000000 */   nop
/* 01E1C8 01DC9EC8 E301023C */  lui         $2, %hi(MainCamera__3)
/* 01E1CC 01DC9ECC 80E64424 */  addiu       $4, $2, %lo(MainCamera__3)
/* 01E1D0 01DC9ED0 BC65050C */  jal         SndSetCamera__FP7CCamera
/* 01E1D4 01DC9ED4 00000000 */   nop
/* 01E1D8 01DC9ED8 E301023C */  lui         $2, %hi(MainCamera__3)
/* 01E1DC 01DC9EDC 80E64424 */  addiu       $4, $2, %lo(MainCamera__3)
/* 01E1E0 01DC9EE0 3000A527 */  addiu       $5, $29, 0x30
/* 01E1E4 01DC9EE4 F890040C */  jal         GetCameraMatrix__7CCameraFPA4_f
/* 01E1E8 01DC9EE8 00000000 */   nop
/* 01E1EC 01DC9EEC E301023C */  lui         $2, %hi(MainCamera__3)
/* 01E1F0 01DC9EF0 80E64424 */  addiu       $4, $2, %lo(MainCamera__3)
/* 01E1F4 01DC9EF4 01000524 */  addiu       $5, $0, 0x1
/* 01E1F8 01DC9EF8 F491040C */  jal         Step__13CCameraFollowFi
/* 01E1FC 01DC9EFC 00000000 */   nop
/* 01E200 01DC9F00 B000A427 */  addiu       $4, $29, 0xB0
/* 01E204 01DC9F04 2A86040C */  jal         sceVu0UnitMatrix
/* 01E208 01DC9F08 00000000 */   nop
/* 01E20C 01DC9F0C 7000A427 */  addiu       $4, $29, 0x70
/* 01E210 01DC9F10 B000A527 */  addiu       $5, $29, 0xB0
/* 01E214 01DC9F14 3000A627 */  addiu       $6, $29, 0x30
/* 01E218 01DC9F18 6E85040C */  jal         sceVu0MulMatrix
/* 01E21C 01DC9F1C 00000000 */   nop
/* 01E220 01DC9F20 7000A427 */  addiu       $4, $29, 0x70
/* 01E224 01DC9F24 2000A527 */  addiu       $5, $29, 0x20
/* 01E228 01DC9F28 E8B7040C */  jal         MGSetViewMatrix__FPA4_fPf
/* 01E22C 01DC9F2C 00000000 */   nop
/* 01E230 01DC9F30 2400023C */  lui         $2, %hi(Vu_prog0f)
/* 01E234 01DC9F34 00614524 */  addiu       $5, $2, %lo(Vu_prog0f)
/* 01E238 01DC9F38 D48B848F */  lw          $4, -0x742C($28)
/* 01E23C 01DC9F3C 28360070 */  paddub      $6, $0, $0
/* 01E240 01DC9F40 5C83040C */  jal         sceVif1PkCall
/* 01E244 01DC9F44 00000000 */   nop
/* 01E248 01DC9F48 D48B848F */  lw          $4, -0x742C($28)
/* 01E24C 01DC9F4C 0A83040C */  jal         sceVif1PkTerminate
/* 01E250 01DC9F50 00000000 */   nop
/* 01E254 01DC9F54 E301013C */  lui         $1, %hi(CScript + 0x18)
/* 01E258 01DC9F58 D8E9248C */  lw          $4, %lo(CScript + 0x18)($1)
/* 01E25C 01DC9F5C 0A00812C */  sltiu       $1, $4, 0xA
/* 01E260 01DC9F60 2E002010 */  beqz        $1, .L01DCA01C_2CF81C
/* 01E264 01DC9F64 00000000 */   nop
/* 01E268 01DC9F68 DE01023C */  lui         $2, %hi(LIT_640__6)
/* 01E26C 01DC9F6C 30FF4324 */  addiu       $3, $2, %lo(LIT_640__6)
/* 01E270 01DC9F70 80100400 */  sll         $2, $4, 2
/* 01E274 01DC9F74 21104300 */  addu        $2, $2, $3
/* 01E278 01DC9F78 0000428C */  lw          $2, 0x0($2)
/* 01E27C 01DC9F7C 08004000 */  jr          $2
/* 01E280 01DC9F80 00000000 */   nop
/* 01E284 01DC9F84 642F770C */  jal         DrawProcA__Fv
/* 01E288 01DC9F88 00000000 */   nop
/* 01E28C 01DC9F8C 23000010 */  b           .L01DCA01C_2CF81C
/* 01E290 01DC9F90 00000000 */   nop
/* 01E294 01DC9F94 4833770C */  jal         DrawProcB__Fv
/* 01E298 01DC9F98 00000000 */   nop
/* 01E29C 01DC9F9C 1F000010 */  b           .L01DCA01C_2CF81C
/* 01E2A0 01DC9FA0 00000000 */   nop
/* 01E2A4 01DC9FA4 B836770C */  jal         DrawProcC__Fv
/* 01E2A8 01DC9FA8 00000000 */   nop
/* 01E2AC 01DC9FAC 1B000010 */  b           .L01DCA01C_2CF81C
/* 01E2B0 01DC9FB0 00000000 */   nop
/* 01E2B4 01DC9FB4 2039770C */  jal         DrawProcD__Fv
/* 01E2B8 01DC9FB8 00000000 */   nop
/* 01E2BC 01DC9FBC 17000010 */  b           .L01DCA01C_2CF81C
/* 01E2C0 01DC9FC0 00000000 */   nop
/* 01E2C4 01DC9FC4 F83A770C */  jal         DrawProcE__Fv
/* 01E2C8 01DC9FC8 00000000 */   nop
/* 01E2CC 01DC9FCC 13000010 */  b           .L01DCA01C_2CF81C
/* 01E2D0 01DC9FD0 00000000 */   nop
/* 01E2D4 01DC9FD4 283D770C */  jal         DrawProcF__Fv
/* 01E2D8 01DC9FD8 00000000 */   nop
/* 01E2DC 01DC9FDC 0F000010 */  b           .L01DCA01C_2CF81C
/* 01E2E0 01DC9FE0 00000000 */   nop
/* 01E2E4 01DC9FE4 3C3F770C */  jal         DrawProcG__Fv
/* 01E2E8 01DC9FE8 00000000 */   nop
/* 01E2EC 01DC9FEC 0B000010 */  b           .L01DCA01C_2CF81C
/* 01E2F0 01DC9FF0 00000000 */   nop
/* 01E2F4 01DC9FF4 3842770C */  jal         DrawProcH__Fv
/* 01E2F8 01DC9FF8 00000000 */   nop
/* 01E2FC 01DC9FFC 07000010 */  b           .L01DCA01C_2CF81C
/* 01E300 01DCA000 00000000 */   nop
/* 01E304 01DCA004 3045770C */  jal         DrawProcI__Fv
/* 01E308 01DCA008 00000000 */   nop
/* 01E30C 01DCA00C 03000010 */  b           .L01DCA01C_2CF81C
/* 01E310 01DCA010 00000000 */   nop
/* 01E314 01DCA014 0046770C */  jal         DrawProcTitle__Fv
/* 01E318 01DCA018 00000000 */   nop
.L01DCA01C_2CF81C:
/* 01E31C 01DCA01C E301013C */  lui         $1, %hi(CScript + 0x18)
/* 01E320 01DCA020 D8E9238C */  lw          $3, %lo(CScript + 0x18)($1)
/* 01E324 01DCA024 09000224 */  addiu       $2, $0, 0x9
/* 01E328 01DCA028 3F006210 */  beq         $3, $2, .L01DCA128_2CF928
/* 01E32C 01DCA02C 00000000 */   nop
/* 01E330 01DCA030 F09B8283 */  lb          $2, -0x6410($28)
/* 01E334 01DCA034 04004014 */  bnez        $2, .L01DCA048_2CF848
/* 01E338 01DCA038 00000000 */   nop
/* 01E33C 01DCA03C EC9B80AF */  sw          $0, -0x6414($28)
/* 01E340 01DCA040 01000224 */  addiu       $2, $0, 0x1
/* 01E344 01DCA044 F09B82A3 */  sb          $2, -0x6410($28)
.L01DCA048_2CF848:
/* 01E348 01DCA048 C89B828F */  lw          $2, -0x6438($28)
/* 01E34C 01DCA04C 28004010 */  beqz        $2, .L01DCA0F0_2CF8F0
/* 01E350 01DCA050 00000000 */   nop
/* 01E354 01DCA054 C701023C */  lui         $2, %hi(TexManager)
/* 01E358 01DCA058 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01E35C 01DCA05C D48B858F */  lw          $5, -0x742C($28)
/* 01E360 01DCA060 14000624 */  addiu       $6, $0, 0x14
/* 01E364 01DCA064 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 01E368 01DCA068 00000000 */   nop
/* 01E36C 01DCA06C 5001A0AF */  sw          $0, 0x150($29)
/* 01E370 01DCA070 5401A0AF */  sw          $0, 0x154($29)
/* 01E374 01DCA074 00010424 */  addiu       $4, $0, 0x100
/* 01E378 01DCA078 5801A4AF */  sw          $4, 0x158($29)
/* 01E37C 01DCA07C 20000324 */  addiu       $3, $0, 0x20
/* 01E380 01DCA080 5C01A3AF */  sw          $3, 0x15C($29)
/* 01E384 01DCA084 C0000224 */  addiu       $2, $0, 0xC0
/* 01E388 01DCA088 4001A2AF */  sw          $2, 0x140($29)
/* 01E38C 01DCA08C 68010224 */  addiu       $2, $0, 0x168
/* 01E390 01DCA090 4401A2AF */  sw          $2, 0x144($29)
/* 01E394 01DCA094 4801A4AF */  sw          $4, 0x148($29)
/* 01E398 01DCA098 4C01A3AF */  sw          $3, 0x14C($29)
/* 01E39C 01DCA09C A0B8040C */  jal         GetVif1Packet__Fv
/* 01E3A0 01DCA0A0 00000000 */   nop
/* 01E3A4 01DCA0A4 28864070 */  paddub      $16, $2, $0
/* 01E3A8 01DCA0A8 C701023C */  lui         $2, %hi(TexManager)
/* 01E3AC 01DCA0AC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01E3B0 01DCA0B0 DE01023C */  lui         $2, %hi(LIT_639__8)
/* 01E3B4 01DCA0B4 28FF4524 */  addiu       $5, $2, %lo(LIT_639__8)
/* 01E3B8 01DCA0B8 FFFF0624 */  addiu       $6, $0, -0x1
/* 01E3BC 01DCA0BC B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 01E3C0 01DCA0C0 00000000 */   nop
/* 01E3C4 01DCA0C4 EC9B8893 */  lbu         $8, -0x6414($28)
/* 01E3C8 01DCA0C8 28260072 */  paddub      $4, $16, $0
/* 01E3CC 01DCA0CC 282E4070 */  paddub      $5, $2, $0
/* 01E3D0 01DCA0D0 4001A627 */  addiu       $6, $29, 0x140
/* 01E3D4 01DCA0D4 5001A727 */  addiu       $7, $29, 0x150
/* 01E3D8 01DCA0D8 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 01E3DC 01DCA0DC 00000000 */   nop
/* 01E3E0 01DCA0E0 EC9B828F */  lw          $2, -0x6414($28)
/* 01E3E4 01DCA0E4 02004224 */  addiu       $2, $2, 0x2
/* 01E3E8 01DCA0E8 7F004230 */  andi        $2, $2, 0x7F
/* 01E3EC 01DCA0EC EC9B82AF */  sw          $2, -0x6414($28)
.L01DCA0F0_2CF8F0:
/* 01E3F0 01DCA0F0 CC01023C */  lui         $2, %hi(GamePad)
/* 01E3F4 01DCA0F4 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 01E3F8 01DCA0F8 F0000524 */  addiu       $5, $0, 0xF0
/* 01E3FC 01DCA0FC 1CAE040C */  jal         Down__8CGamePadFi
/* 01E400 01DCA100 00000000 */   nop
/* 01E404 01DCA104 04004010 */  beqz        $2, .L01DCA118_2CF918
/* 01E408 01DCA108 00000000 */   nop
/* 01E40C 01DCA10C C89B828F */  lw          $2, -0x6438($28)
/* 01E410 01DCA110 01004238 */  xori        $2, $2, 0x1
/* 01E414 01DCA114 C89B82AF */  sw          $2, -0x6438($28)
.L01DCA118_2CF918:
/* 01E418 01DCA118 C89B828F */  lw          $2, -0x6438($28)
/* 01E41C 01DCA11C 02004014 */  bnez        $2, .L01DCA128_2CF928
/* 01E420 01DCA120 00000000 */   nop
/* 01E424 01DCA124 EC9B80AF */  sw          $0, -0x6414($28)
.L01DCA128_2CF928:
/* 01E428 01DCA128 8801A427 */  addiu       $4, $29, 0x188
/* 01E42C 01DCA12C 68BC040C */  jal         MGGetFBuffBackTex__FP9sceGsTex0
/* 01E430 01DCA130 00000000 */   nop
/* 01E434 01DCA134 F000A427 */  addiu       $4, $29, 0xF0
/* 01E438 01DCA138 BCC3040C */  jal         __ct__8CTextureFv
/* 01E43C 01DCA13C 00000000 */   nop
/* 01E440 01DCA140 8801A227 */  addiu       $2, $29, 0x188
/* 01E444 01DCA144 000042DC */  ld          $2, 0x0($2)
/* 01E448 01DCA148 1801A2FF */  sd          $2, 0x118($29)
/* 01E44C 01DCA14C 7001A0AF */  sw          $0, 0x170($29)
/* 01E450 01DCA150 7401A0AF */  sw          $0, 0x174($29)
/* 01E454 01DCA154 80020324 */  addiu       $3, $0, 0x280
/* 01E458 01DCA158 7801A3AF */  sw          $3, 0x178($29)
/* 01E45C 01DCA15C E0000224 */  addiu       $2, $0, 0xE0
/* 01E460 01DCA160 7C01A2AF */  sw          $2, 0x17C($29)
/* 01E464 01DCA164 6001A0AF */  sw          $0, 0x160($29)
/* 01E468 01DCA168 6401A0AF */  sw          $0, 0x164($29)
/* 01E46C 01DCA16C 6801A3AF */  sw          $3, 0x168($29)
/* 01E470 01DCA170 C0010224 */  addiu       $2, $0, 0x1C0
/* 01E474 01DCA174 6C01A2AF */  sw          $2, 0x16C($29)
/* 01E478 01DCA178 D48B848F */  lw          $4, -0x742C($28)
/* 01E47C 01DCA17C F000A527 */  addiu       $5, $29, 0xF0
/* 01E480 01DCA180 6001A627 */  addiu       $6, $29, 0x160
/* 01E484 01DCA184 7001A727 */  addiu       $7, $29, 0x170
/* 01E488 01DCA188 80000824 */  addiu       $8, $0, 0x80
/* 01E48C 01DCA18C 284E0071 */  paddub      $9, $8, $0
/* 01E490 01DCA190 28560071 */  paddub      $10, $8, $0
/* 01E494 01DCA194 23000B24 */  addiu       $11, $0, 0x23
/* 01E498 01DCA198 8C71050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_UcUcUcUc
/* 01E49C 01DCA19C 00000000 */   nop
.L01DCA1A0_2CF9A0:
/* 01E4A0 01DCA1A0 1000BF7B */  lq          $31, 0x10($29)
/* 01E4A4 01DCA1A4 0000B07B */  lq          $16, 0x0($29)
/* 01E4A8 01DCA1A8 9001BD27 */  addiu       $29, $29, 0x190
/* 01E4AC 01DCA1AC 0800E003 */  jr          $31
/* 01E4B0 01DCA1B0 00000000 */   nop
/* 01E4B4 01DCA1B4 00000000 */  nop
/* 01E4B8 01DCA1B8 00000000 */  nop
/* 01E4BC 01DCA1BC 00000000 */  nop
