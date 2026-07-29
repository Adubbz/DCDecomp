.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Setsumei__Fv
/* 01B170 01DC6E70 E0FCBD27 */  addiu       $29, $29, -0x320
/* 01B174 01DC6E74 3000BF7F */  sq          $31, 0x30($29)
/* 01B178 01DC6E78 2000B17F */  sq          $17, 0x20($29)
/* 01B17C 01DC6E7C 1000B07F */  sq          $16, 0x10($29)
/* 01B180 01DC6E80 0400B5E7 */  swc1        $f21, 0x4($29)
/* 01B184 01DC6E84 0000B4E7 */  swc1        $f20, 0x0($29)
/* 01B188 01DC6E88 049B8283 */  lb          $2, -0x64FC($28)
/* 01B18C 01DC6E8C 04004014 */  bnez        $2, .L01DC6EA0_2CC6A0
/* 01B190 01DC6E90 00000000 */   nop
/* 01B194 01DC6E94 009B80AF */  sw          $0, -0x6500($28)
/* 01B198 01DC6E98 01000224 */  addiu       $2, $0, 0x1
/* 01B19C 01DC6E9C 049B82A3 */  sb          $2, -0x64FC($28)
.L01DC6EA0_2CC6A0:
/* 01B1A0 01DC6EA0 0C9B8283 */  lb          $2, -0x64F4($28)
/* 01B1A4 01DC6EA4 04004014 */  bnez        $2, .L01DC6EB8_2CC6B8
/* 01B1A8 01DC6EA8 00000000 */   nop
/* 01B1AC 01DC6EAC 089B80AF */  sw          $0, -0x64F8($28)
/* 01B1B0 01DC6EB0 01000224 */  addiu       $2, $0, 0x1
/* 01B1B4 01DC6EB4 0C9B82A3 */  sb          $2, -0x64F4($28)
.L01DC6EB8_2CC6B8:
/* 01B1B8 01DC6EB8 009B828F */  lw          $2, -0x6500($28)
/* 01B1BC 01DC6EBC 01004224 */  addiu       $2, $2, 0x1
/* 01B1C0 01DC6EC0 009B82AF */  sw          $2, -0x6500($28)
/* 01B1C4 01DC6EC4 009B828F */  lw          $2, -0x6500($28)
/* 01B1C8 01DC6EC8 1F004128 */  slti        $1, $2, 0x1F
/* 01B1CC 01DC6ECC 0A002014 */  bnez        $1, .L01DC6EF8_2CC6F8
/* 01B1D0 01DC6ED0 00000000 */   nop
/* 01B1D4 01DC6ED4 009B80AF */  sw          $0, -0x6500($28)
/* 01B1D8 01DC6ED8 089B828F */  lw          $2, -0x64F8($28)
/* 01B1DC 01DC6EDC 01004224 */  addiu       $2, $2, 0x1
/* 01B1E0 01DC6EE0 089B82AF */  sw          $2, -0x64F8($28)
/* 01B1E4 01DC6EE4 089B828F */  lw          $2, -0x64F8($28)
/* 01B1E8 01DC6EE8 02004128 */  slti        $1, $2, 0x2
/* 01B1EC 01DC6EEC 02002014 */  bnez        $1, .L01DC6EF8_2CC6F8
/* 01B1F0 01DC6EF0 00000000 */   nop
/* 01B1F4 01DC6EF4 089B80AF */  sw          $0, -0x64F8($28)
.L01DC6EF8_2CC6F8:
/* 01B1F8 01DC6EF8 149B8283 */  lb          $2, -0x64EC($28)
/* 01B1FC 01DC6EFC 04004014 */  bnez        $2, .L01DC6F10_2CC710
/* 01B200 01DC6F00 00000000 */   nop
/* 01B204 01DC6F04 109B80AF */  sw          $0, -0x64F0($28)
/* 01B208 01DC6F08 01000224 */  addiu       $2, $0, 0x1
/* 01B20C 01DC6F0C 149B82A3 */  sb          $2, -0x64EC($28)
.L01DC6F10_2CC710:
/* 01B210 01DC6F10 1C9B8283 */  lb          $2, -0x64E4($28)
/* 01B214 01DC6F14 04004014 */  bnez        $2, .L01DC6F28_2CC728
/* 01B218 01DC6F18 00000000 */   nop
/* 01B21C 01DC6F1C 189B80AF */  sw          $0, -0x64E8($28)
/* 01B220 01DC6F20 01000224 */  addiu       $2, $0, 0x1
/* 01B224 01DC6F24 1C9B82A3 */  sb          $2, -0x64E4($28)
.L01DC6F28_2CC728:
/* 01B228 01DC6F28 109B828F */  lw          $2, -0x64F0($28)
/* 01B22C 01DC6F2C 01004224 */  addiu       $2, $2, 0x1
/* 01B230 01DC6F30 109B82AF */  sw          $2, -0x64F0($28)
/* 01B234 01DC6F34 109B828F */  lw          $2, -0x64F0($28)
/* 01B238 01DC6F38 1F004128 */  slti        $1, $2, 0x1F
/* 01B23C 01DC6F3C 0A002014 */  bnez        $1, .L01DC6F68_2CC768
/* 01B240 01DC6F40 00000000 */   nop
/* 01B244 01DC6F44 109B80AF */  sw          $0, -0x64F0($28)
/* 01B248 01DC6F48 189B828F */  lw          $2, -0x64E8($28)
/* 01B24C 01DC6F4C 01004224 */  addiu       $2, $2, 0x1
/* 01B250 01DC6F50 189B82AF */  sw          $2, -0x64E8($28)
/* 01B254 01DC6F54 189B828F */  lw          $2, -0x64E8($28)
/* 01B258 01DC6F58 03004128 */  slti        $1, $2, 0x3
/* 01B25C 01DC6F5C 02002014 */  bnez        $1, .L01DC6F68_2CC768
/* 01B260 01DC6F60 00000000 */   nop
/* 01B264 01DC6F64 189B80AF */  sw          $0, -0x64E8($28)
.L01DC6F68_2CC768:
/* 01B268 01DC6F68 249B8283 */  lb          $2, -0x64DC($28)
/* 01B26C 01DC6F6C 05004014 */  bnez        $2, .L01DC6F84_2CC784
/* 01B270 01DC6F70 00000000 */   nop
/* 01B274 01DC6F74 80000224 */  addiu       $2, $0, 0x80
/* 01B278 01DC6F78 209B82AF */  sw          $2, -0x64E0($28)
/* 01B27C 01DC6F7C 01000224 */  addiu       $2, $0, 0x1
/* 01B280 01DC6F80 249B82A3 */  sb          $2, -0x64DC($28)
.L01DC6F84_2CC784:
/* 01B284 01DC6F84 2C9B8283 */  lb          $2, -0x64D4($28)
/* 01B288 01DC6F88 04004014 */  bnez        $2, .L01DC6F9C_2CC79C
/* 01B28C 01DC6F8C 00000000 */   nop
/* 01B290 01DC6F90 289B80AF */  sw          $0, -0x64D8($28)
/* 01B294 01DC6F94 01000224 */  addiu       $2, $0, 0x1
/* 01B298 01DC6F98 2C9B82A3 */  sb          $2, -0x64D4($28)
.L01DC6F9C_2CC79C:
/* 01B29C 01DC6F9C 089B828F */  lw          $2, -0x64F8($28)
/* 01B2A0 01DC6FA0 0A004014 */  bnez        $2, .L01DC6FCC_2CC7CC
/* 01B2A4 01DC6FA4 00000000 */   nop
/* 01B2A8 01DC6FA8 80000224 */  addiu       $2, $0, 0x80
/* 01B2AC 01DC6FAC 209B82AF */  sw          $2, -0x64E0($28)
/* 01B2B0 01DC6FB0 289B828F */  lw          $2, -0x64D8($28)
/* 01B2B4 01DC6FB4 0C004018 */  blez        $2, .L01DC6FE8_2CC7E8
/* 01B2B8 01DC6FB8 00000000 */   nop
/* 01B2BC 01DC6FBC F8FF4224 */  addiu       $2, $2, -0x8
/* 01B2C0 01DC6FC0 289B82AF */  sw          $2, -0x64D8($28)
/* 01B2C4 01DC6FC4 08000010 */  b           .L01DC6FE8_2CC7E8
/* 01B2C8 01DC6FC8 00000000 */   nop
.L01DC6FCC_2CC7CC:
/* 01B2CC 01DC6FCC 80000224 */  addiu       $2, $0, 0x80
/* 01B2D0 01DC6FD0 289B82AF */  sw          $2, -0x64D8($28)
/* 01B2D4 01DC6FD4 209B828F */  lw          $2, -0x64E0($28)
/* 01B2D8 01DC6FD8 03004018 */  blez        $2, .L01DC6FE8_2CC7E8
/* 01B2DC 01DC6FDC 00000000 */   nop
/* 01B2E0 01DC6FE0 F8FF4224 */  addiu       $2, $2, -0x8
/* 01B2E4 01DC6FE4 209B82AF */  sw          $2, -0x64E0($28)
.L01DC6FE8_2CC7E8:
/* 01B2E8 01DC6FE8 349B8283 */  lb          $2, -0x64CC($28)
/* 01B2EC 01DC6FEC 05004014 */  bnez        $2, .L01DC7004_2CC804
/* 01B2F0 01DC6FF0 00000000 */   nop
/* 01B2F4 01DC6FF4 80000224 */  addiu       $2, $0, 0x80
/* 01B2F8 01DC6FF8 309B82AF */  sw          $2, -0x64D0($28)
/* 01B2FC 01DC6FFC 01000224 */  addiu       $2, $0, 0x1
/* 01B300 01DC7000 349B82A3 */  sb          $2, -0x64CC($28)
.L01DC7004_2CC804:
/* 01B304 01DC7004 3C9B8283 */  lb          $2, -0x64C4($28)
/* 01B308 01DC7008 04004014 */  bnez        $2, .L01DC701C_2CC81C
/* 01B30C 01DC700C 00000000 */   nop
/* 01B310 01DC7010 389B80AF */  sw          $0, -0x64C8($28)
/* 01B314 01DC7014 01000224 */  addiu       $2, $0, 0x1
/* 01B318 01DC7018 3C9B82A3 */  sb          $2, -0x64C4($28)
.L01DC701C_2CC81C:
/* 01B31C 01DC701C 449B8283 */  lb          $2, -0x64BC($28)
/* 01B320 01DC7020 04004014 */  bnez        $2, .L01DC7034_2CC834
/* 01B324 01DC7024 00000000 */   nop
/* 01B328 01DC7028 409B80AF */  sw          $0, -0x64C0($28)
/* 01B32C 01DC702C 01000224 */  addiu       $2, $0, 0x1
/* 01B330 01DC7030 449B82A3 */  sb          $2, -0x64BC($28)
.L01DC7034_2CC834:
/* 01B334 01DC7034 189B838F */  lw          $3, -0x64E8($28)
/* 01B338 01DC7038 02000224 */  addiu       $2, $0, 0x2
/* 01B33C 01DC703C 24006210 */  beq         $3, $2, .L01DC70D0_2CC8D0
/* 01B340 01DC7040 00000000 */   nop
/* 01B344 01DC7044 01000224 */  addiu       $2, $0, 0x1
/* 01B348 01DC7048 13006210 */  beq         $3, $2, .L01DC7098_2CC898
/* 01B34C 01DC704C 00000000 */   nop
/* 01B350 01DC7050 03006010 */  beqz        $3, .L01DC7060_2CC860
/* 01B354 01DC7054 00000000 */   nop
/* 01B358 01DC7058 29000010 */  b           .L01DC7100_2CC900
/* 01B35C 01DC705C 00000000 */   nop
.L01DC7060_2CC860:
/* 01B360 01DC7060 80000224 */  addiu       $2, $0, 0x80
/* 01B364 01DC7064 309B82AF */  sw          $2, -0x64D0($28)
/* 01B368 01DC7068 389B828F */  lw          $2, -0x64C8($28)
/* 01B36C 01DC706C 03004018 */  blez        $2, .L01DC707C_2CC87C
/* 01B370 01DC7070 00000000 */   nop
/* 01B374 01DC7074 F8FF4224 */  addiu       $2, $2, -0x8
/* 01B378 01DC7078 389B82AF */  sw          $2, -0x64C8($28)
.L01DC707C_2CC87C:
/* 01B37C 01DC707C 409B828F */  lw          $2, -0x64C0($28)
/* 01B380 01DC7080 1F004018 */  blez        $2, .L01DC7100_2CC900
/* 01B384 01DC7084 00000000 */   nop
/* 01B388 01DC7088 F8FF4224 */  addiu       $2, $2, -0x8
/* 01B38C 01DC708C 409B82AF */  sw          $2, -0x64C0($28)
/* 01B390 01DC7090 1B000010 */  b           .L01DC7100_2CC900
/* 01B394 01DC7094 00000000 */   nop
.L01DC7098_2CC898:
/* 01B398 01DC7098 80000224 */  addiu       $2, $0, 0x80
/* 01B39C 01DC709C 389B82AF */  sw          $2, -0x64C8($28)
/* 01B3A0 01DC70A0 309B828F */  lw          $2, -0x64D0($28)
/* 01B3A4 01DC70A4 03004018 */  blez        $2, .L01DC70B4_2CC8B4
/* 01B3A8 01DC70A8 00000000 */   nop
/* 01B3AC 01DC70AC F8FF4224 */  addiu       $2, $2, -0x8
/* 01B3B0 01DC70B0 309B82AF */  sw          $2, -0x64D0($28)
.L01DC70B4_2CC8B4:
/* 01B3B4 01DC70B4 409B828F */  lw          $2, -0x64C0($28)
/* 01B3B8 01DC70B8 11004018 */  blez        $2, .L01DC7100_2CC900
/* 01B3BC 01DC70BC 00000000 */   nop
/* 01B3C0 01DC70C0 F8FF4224 */  addiu       $2, $2, -0x8
/* 01B3C4 01DC70C4 409B82AF */  sw          $2, -0x64C0($28)
/* 01B3C8 01DC70C8 0D000010 */  b           .L01DC7100_2CC900
/* 01B3CC 01DC70CC 00000000 */   nop
.L01DC70D0_2CC8D0:
/* 01B3D0 01DC70D0 80000224 */  addiu       $2, $0, 0x80
/* 01B3D4 01DC70D4 409B82AF */  sw          $2, -0x64C0($28)
/* 01B3D8 01DC70D8 309B828F */  lw          $2, -0x64D0($28)
/* 01B3DC 01DC70DC 03004018 */  blez        $2, .L01DC70EC_2CC8EC
/* 01B3E0 01DC70E0 00000000 */   nop
/* 01B3E4 01DC70E4 F8FF4224 */  addiu       $2, $2, -0x8
/* 01B3E8 01DC70E8 309B82AF */  sw          $2, -0x64D0($28)
.L01DC70EC_2CC8EC:
/* 01B3EC 01DC70EC 389B828F */  lw          $2, -0x64C8($28)
/* 01B3F0 01DC70F0 03004018 */  blez        $2, .L01DC7100_2CC900
/* 01B3F4 01DC70F4 00000000 */   nop
/* 01B3F8 01DC70F8 F8FF4224 */  addiu       $2, $2, -0x8
/* 01B3FC 01DC70FC 389B82AF */  sw          $2, -0x64C8($28)
.L01DC7100_2CC900:
/* 01B400 01DC7100 5000A0AF */  sw          $0, 0x50($29)
/* 01B404 01DC7104 5400A0AF */  sw          $0, 0x54($29)
/* 01B408 01DC7108 80020324 */  addiu       $3, $0, 0x280
/* 01B40C 01DC710C 5800A3AF */  sw          $3, 0x58($29)
/* 01B410 01DC7110 C0010224 */  addiu       $2, $0, 0x1C0
/* 01B414 01DC7114 5C00A2AF */  sw          $2, 0x5C($29)
/* 01B418 01DC7118 4000A0AF */  sw          $0, 0x40($29)
/* 01B41C 01DC711C 4400A0AF */  sw          $0, 0x44($29)
/* 01B420 01DC7120 4800A3AF */  sw          $3, 0x48($29)
/* 01B424 01DC7124 4C00A2AF */  sw          $2, 0x4C($29)
/* 01B428 01DC7128 A0B8040C */  jal         GetVif1Packet__Fv
/* 01B42C 01DC712C 00000000 */   nop
/* 01B430 01DC7130 28864070 */  paddub      $16, $2, $0
/* 01B434 01DC7134 C701023C */  lui         $2, %hi(TexManager)
/* 01B438 01DC7138 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01B43C 01DC713C DE01023C */  lui         $2, %hi(LIT_1286__2)
/* 01B440 01DC7140 38FE4524 */  addiu       $5, $2, %lo(LIT_1286__2)
/* 01B444 01DC7144 FFFF0624 */  addiu       $6, $0, -0x1
/* 01B448 01DC7148 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 01B44C 01DC714C 00000000 */   nop
/* 01B450 01DC7150 28260072 */  paddub      $4, $16, $0
/* 01B454 01DC7154 282E4070 */  paddub      $5, $2, $0
/* 01B458 01DC7158 4000A627 */  addiu       $6, $29, 0x40
/* 01B45C 01DC715C 5000A727 */  addiu       $7, $29, 0x50
/* 01B460 01DC7160 80000824 */  addiu       $8, $0, 0x80
/* 01B464 01DC7164 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 01B468 01DC7168 00000000 */   nop
/* 01B46C 01DC716C 59000224 */  addiu       $2, $0, 0x59
/* 01B470 01DC7170 7000A2AF */  sw          $2, 0x70($29)
/* 01B474 01DC7174 CE000224 */  addiu       $2, $0, 0xCE
/* 01B478 01DC7178 7400A2AF */  sw          $2, 0x74($29)
/* 01B47C 01DC717C 58000424 */  addiu       $4, $0, 0x58
/* 01B480 01DC7180 7800A4AF */  sw          $4, 0x78($29)
/* 01B484 01DC7184 77000324 */  addiu       $3, $0, 0x77
/* 01B488 01DC7188 7C00A3AF */  sw          $3, 0x7C($29)
/* 01B48C 01DC718C 1C020224 */  addiu       $2, $0, 0x21C
/* 01B490 01DC7190 6000A2AF */  sw          $2, 0x60($29)
/* 01B494 01DC7194 ED000224 */  addiu       $2, $0, 0xED
/* 01B498 01DC7198 6400A2AF */  sw          $2, 0x64($29)
/* 01B49C 01DC719C 6800A4AF */  sw          $4, 0x68($29)
/* 01B4A0 01DC71A0 6C00A3AF */  sw          $3, 0x6C($29)
/* 01B4A4 01DC71A4 A0B8040C */  jal         GetVif1Packet__Fv
/* 01B4A8 01DC71A8 00000000 */   nop
/* 01B4AC 01DC71AC 28864070 */  paddub      $16, $2, $0
/* 01B4B0 01DC71B0 C701023C */  lui         $2, %hi(TexManager)
/* 01B4B4 01DC71B4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01B4B8 01DC71B8 DE01023C */  lui         $2, %hi(LIT_1287__3)
/* 01B4BC 01DC71BC 40FE4524 */  addiu       $5, $2, %lo(LIT_1287__3)
/* 01B4C0 01DC71C0 FFFF0624 */  addiu       $6, $0, -0x1
/* 01B4C4 01DC71C4 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 01B4C8 01DC71C8 00000000 */   nop
/* 01B4CC 01DC71CC 209B8893 */  lbu         $8, -0x64E0($28)
/* 01B4D0 01DC71D0 28260072 */  paddub      $4, $16, $0
/* 01B4D4 01DC71D4 282E4070 */  paddub      $5, $2, $0
/* 01B4D8 01DC71D8 6000A627 */  addiu       $6, $29, 0x60
/* 01B4DC 01DC71DC 7000A727 */  addiu       $7, $29, 0x70
/* 01B4E0 01DC71E0 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 01B4E4 01DC71E4 00000000 */   nop
/* 01B4E8 01DC71E8 9000A0AF */  sw          $0, 0x90($29)
/* 01B4EC 01DC71EC CE000224 */  addiu       $2, $0, 0xCE
/* 01B4F0 01DC71F0 9400A2AF */  sw          $2, 0x94($29)
/* 01B4F4 01DC71F4 58000424 */  addiu       $4, $0, 0x58
/* 01B4F8 01DC71F8 9800A4AF */  sw          $4, 0x98($29)
/* 01B4FC 01DC71FC 77000324 */  addiu       $3, $0, 0x77
/* 01B500 01DC7200 9C00A3AF */  sw          $3, 0x9C($29)
/* 01B504 01DC7204 1C020224 */  addiu       $2, $0, 0x21C
/* 01B508 01DC7208 8000A2AF */  sw          $2, 0x80($29)
/* 01B50C 01DC720C ED000224 */  addiu       $2, $0, 0xED
/* 01B510 01DC7210 8400A2AF */  sw          $2, 0x84($29)
/* 01B514 01DC7214 8800A4AF */  sw          $4, 0x88($29)
/* 01B518 01DC7218 8C00A3AF */  sw          $3, 0x8C($29)
/* 01B51C 01DC721C A0B8040C */  jal         GetVif1Packet__Fv
/* 01B520 01DC7220 00000000 */   nop
/* 01B524 01DC7224 28864070 */  paddub      $16, $2, $0
/* 01B528 01DC7228 C701023C */  lui         $2, %hi(TexManager)
/* 01B52C 01DC722C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01B530 01DC7230 DE01023C */  lui         $2, %hi(LIT_1287__3)
/* 01B534 01DC7234 40FE4524 */  addiu       $5, $2, %lo(LIT_1287__3)
/* 01B538 01DC7238 FFFF0624 */  addiu       $6, $0, -0x1
/* 01B53C 01DC723C B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 01B540 01DC7240 00000000 */   nop
/* 01B544 01DC7244 289B8893 */  lbu         $8, -0x64D8($28)
/* 01B548 01DC7248 28260072 */  paddub      $4, $16, $0
/* 01B54C 01DC724C 282E4070 */  paddub      $5, $2, $0
/* 01B550 01DC7250 8000A627 */  addiu       $6, $29, 0x80
/* 01B554 01DC7254 9000A727 */  addiu       $7, $29, 0x90
/* 01B558 01DC7258 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 01B55C 01DC725C 00000000 */   nop
/* 01B560 01DC7260 75000224 */  addiu       $2, $0, 0x75
/* 01B564 01DC7264 B000A2AF */  sw          $2, 0xB0($29)
/* 01B568 01DC7268 C0010224 */  addiu       $2, $0, 0x1C0
/* 01B56C 01DC726C B400A2AF */  sw          $2, 0xB4($29)
/* 01B570 01DC7270 69000324 */  addiu       $3, $0, 0x69
/* 01B574 01DC7274 B800A3AF */  sw          $3, 0xB8($29)
/* 01B578 01DC7278 BC00A3AF */  sw          $3, 0xBC($29)
/* 01B57C 01DC727C C2010224 */  addiu       $2, $0, 0x1C2
/* 01B580 01DC7280 A000A2AF */  sw          $2, 0xA0($29)
/* 01B584 01DC7284 19000224 */  addiu       $2, $0, 0x19
/* 01B588 01DC7288 A400A2AF */  sw          $2, 0xA4($29)
/* 01B58C 01DC728C A800A3AF */  sw          $3, 0xA8($29)
/* 01B590 01DC7290 AC00A3AF */  sw          $3, 0xAC($29)
/* 01B594 01DC7294 A0B8040C */  jal         GetVif1Packet__Fv
/* 01B598 01DC7298 00000000 */   nop
/* 01B59C 01DC729C 28864070 */  paddub      $16, $2, $0
/* 01B5A0 01DC72A0 C701023C */  lui         $2, %hi(TexManager)
/* 01B5A4 01DC72A4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01B5A8 01DC72A8 DE01023C */  lui         $2, %hi(LIT_1287__3)
/* 01B5AC 01DC72AC 40FE4524 */  addiu       $5, $2, %lo(LIT_1287__3)
/* 01B5B0 01DC72B0 FFFF0624 */  addiu       $6, $0, -0x1
/* 01B5B4 01DC72B4 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 01B5B8 01DC72B8 00000000 */   nop
/* 01B5BC 01DC72BC 309B8893 */  lbu         $8, -0x64D0($28)
/* 01B5C0 01DC72C0 28260072 */  paddub      $4, $16, $0
/* 01B5C4 01DC72C4 282E4070 */  paddub      $5, $2, $0
/* 01B5C8 01DC72C8 A000A627 */  addiu       $6, $29, 0xA0
/* 01B5CC 01DC72CC B000A727 */  addiu       $7, $29, 0xB0
/* 01B5D0 01DC72D0 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 01B5D4 01DC72D4 00000000 */   nop
/* 01B5D8 01DC72D8 DE000224 */  addiu       $2, $0, 0xDE
/* 01B5DC 01DC72DC D000A2AF */  sw          $2, 0xD0($29)
/* 01B5E0 01DC72E0 C0010224 */  addiu       $2, $0, 0x1C0
/* 01B5E4 01DC72E4 D400A2AF */  sw          $2, 0xD4($29)
/* 01B5E8 01DC72E8 69000324 */  addiu       $3, $0, 0x69
/* 01B5EC 01DC72EC D800A3AF */  sw          $3, 0xD8($29)
/* 01B5F0 01DC72F0 DC00A3AF */  sw          $3, 0xDC($29)
/* 01B5F4 01DC72F4 C2010224 */  addiu       $2, $0, 0x1C2
/* 01B5F8 01DC72F8 C000A2AF */  sw          $2, 0xC0($29)
/* 01B5FC 01DC72FC 19000224 */  addiu       $2, $0, 0x19
/* 01B600 01DC7300 C400A2AF */  sw          $2, 0xC4($29)
/* 01B604 01DC7304 C800A3AF */  sw          $3, 0xC8($29)
/* 01B608 01DC7308 CC00A3AF */  sw          $3, 0xCC($29)
/* 01B60C 01DC730C A0B8040C */  jal         GetVif1Packet__Fv
/* 01B610 01DC7310 00000000 */   nop
/* 01B614 01DC7314 28864070 */  paddub      $16, $2, $0
/* 01B618 01DC7318 C701023C */  lui         $2, %hi(TexManager)
/* 01B61C 01DC731C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01B620 01DC7320 DE01023C */  lui         $2, %hi(LIT_1287__3)
/* 01B624 01DC7324 40FE4524 */  addiu       $5, $2, %lo(LIT_1287__3)
/* 01B628 01DC7328 FFFF0624 */  addiu       $6, $0, -0x1
/* 01B62C 01DC732C B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 01B630 01DC7330 00000000 */   nop
/* 01B634 01DC7334 389B8893 */  lbu         $8, -0x64C8($28)
/* 01B638 01DC7338 28260072 */  paddub      $4, $16, $0
/* 01B63C 01DC733C 282E4070 */  paddub      $5, $2, $0
/* 01B640 01DC7340 C000A627 */  addiu       $6, $29, 0xC0
/* 01B644 01DC7344 D000A727 */  addiu       $7, $29, 0xD0
/* 01B648 01DC7348 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 01B64C 01DC734C 00000000 */   nop
/* 01B650 01DC7350 47010224 */  addiu       $2, $0, 0x147
/* 01B654 01DC7354 F000A2AF */  sw          $2, 0xF0($29)
/* 01B658 01DC7358 C0010224 */  addiu       $2, $0, 0x1C0
/* 01B65C 01DC735C F400A2AF */  sw          $2, 0xF4($29)
/* 01B660 01DC7360 69000324 */  addiu       $3, $0, 0x69
/* 01B664 01DC7364 F800A3AF */  sw          $3, 0xF8($29)
/* 01B668 01DC7368 FC00A3AF */  sw          $3, 0xFC($29)
/* 01B66C 01DC736C C2010224 */  addiu       $2, $0, 0x1C2
/* 01B670 01DC7370 E000A2AF */  sw          $2, 0xE0($29)
/* 01B674 01DC7374 19000224 */  addiu       $2, $0, 0x19
/* 01B678 01DC7378 E400A2AF */  sw          $2, 0xE4($29)
/* 01B67C 01DC737C E800A3AF */  sw          $3, 0xE8($29)
/* 01B680 01DC7380 EC00A3AF */  sw          $3, 0xEC($29)
/* 01B684 01DC7384 A0B8040C */  jal         GetVif1Packet__Fv
/* 01B688 01DC7388 00000000 */   nop
/* 01B68C 01DC738C 28864070 */  paddub      $16, $2, $0
/* 01B690 01DC7390 C701023C */  lui         $2, %hi(TexManager)
/* 01B694 01DC7394 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01B698 01DC7398 DE01023C */  lui         $2, %hi(LIT_1287__3)
/* 01B69C 01DC739C 40FE4524 */  addiu       $5, $2, %lo(LIT_1287__3)
/* 01B6A0 01DC73A0 FFFF0624 */  addiu       $6, $0, -0x1
/* 01B6A4 01DC73A4 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 01B6A8 01DC73A8 00000000 */   nop
/* 01B6AC 01DC73AC 409B8893 */  lbu         $8, -0x64C0($28)
/* 01B6B0 01DC73B0 28260072 */  paddub      $4, $16, $0
/* 01B6B4 01DC73B4 282E4070 */  paddub      $5, $2, $0
/* 01B6B8 01DC73B8 E000A627 */  addiu       $6, $29, 0xE0
/* 01B6BC 01DC73BC F000A727 */  addiu       $7, $29, 0xF0
/* 01B6C0 01DC73C0 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 01B6C4 01DC73C4 00000000 */   nop
/* 01B6C8 01DC73C8 B0010224 */  addiu       $2, $0, 0x1B0
/* 01B6CC 01DC73CC 1001A2AF */  sw          $2, 0x110($29)
/* 01B6D0 01DC73D0 C0010224 */  addiu       $2, $0, 0x1C0
/* 01B6D4 01DC73D4 1401A2AF */  sw          $2, 0x114($29)
/* 01B6D8 01DC73D8 D0000424 */  addiu       $4, $0, 0xD0
/* 01B6DC 01DC73DC 1801A4AF */  sw          $4, 0x118($29)
/* 01B6E0 01DC73E0 3A000324 */  addiu       $3, $0, 0x3A
/* 01B6E4 01DC73E4 1C01A3AF */  sw          $3, 0x11C($29)
/* 01B6E8 01DC73E8 5E010224 */  addiu       $2, $0, 0x15E
/* 01B6EC 01DC73EC 0001A2AF */  sw          $2, 0x100($29)
/* 01B6F0 01DC73F0 82000224 */  addiu       $2, $0, 0x82
/* 01B6F4 01DC73F4 0401A2AF */  sw          $2, 0x104($29)
/* 01B6F8 01DC73F8 0801A4AF */  sw          $4, 0x108($29)
/* 01B6FC 01DC73FC 0C01A3AF */  sw          $3, 0x10C($29)
/* 01B700 01DC7400 A0B8040C */  jal         GetVif1Packet__Fv
/* 01B704 01DC7404 00000000 */   nop
/* 01B708 01DC7408 28864070 */  paddub      $16, $2, $0
/* 01B70C 01DC740C C701023C */  lui         $2, %hi(TexManager)
/* 01B710 01DC7410 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01B714 01DC7414 DE01023C */  lui         $2, %hi(LIT_1287__3)
/* 01B718 01DC7418 40FE4524 */  addiu       $5, $2, %lo(LIT_1287__3)
/* 01B71C 01DC741C FFFF0624 */  addiu       $6, $0, -0x1
/* 01B720 01DC7420 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 01B724 01DC7424 00000000 */   nop
/* 01B728 01DC7428 309B8893 */  lbu         $8, -0x64D0($28)
/* 01B72C 01DC742C 28260072 */  paddub      $4, $16, $0
/* 01B730 01DC7430 282E4070 */  paddub      $5, $2, $0
/* 01B734 01DC7434 0001A627 */  addiu       $6, $29, 0x100
/* 01B738 01DC7438 1001A727 */  addiu       $7, $29, 0x110
/* 01B73C 01DC743C C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 01B740 01DC7440 00000000 */   nop
/* 01B744 01DC7444 B0010224 */  addiu       $2, $0, 0x1B0
/* 01B748 01DC7448 3001A2AF */  sw          $2, 0x130($29)
/* 01B74C 01DC744C FA010224 */  addiu       $2, $0, 0x1FA
/* 01B750 01DC7450 3401A2AF */  sw          $2, 0x134($29)
/* 01B754 01DC7454 D0000424 */  addiu       $4, $0, 0xD0
/* 01B758 01DC7458 3801A4AF */  sw          $4, 0x138($29)
/* 01B75C 01DC745C 3A000324 */  addiu       $3, $0, 0x3A
/* 01B760 01DC7460 3C01A3AF */  sw          $3, 0x13C($29)
/* 01B764 01DC7464 5E010224 */  addiu       $2, $0, 0x15E
/* 01B768 01DC7468 2001A2AF */  sw          $2, 0x120($29)
/* 01B76C 01DC746C 82000224 */  addiu       $2, $0, 0x82
/* 01B770 01DC7470 2401A2AF */  sw          $2, 0x124($29)
/* 01B774 01DC7474 2801A4AF */  sw          $4, 0x128($29)
/* 01B778 01DC7478 2C01A3AF */  sw          $3, 0x12C($29)
/* 01B77C 01DC747C A0B8040C */  jal         GetVif1Packet__Fv
/* 01B780 01DC7480 00000000 */   nop
/* 01B784 01DC7484 28864070 */  paddub      $16, $2, $0
/* 01B788 01DC7488 C701023C */  lui         $2, %hi(TexManager)
/* 01B78C 01DC748C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01B790 01DC7490 DE01023C */  lui         $2, %hi(LIT_1287__3)
/* 01B794 01DC7494 40FE4524 */  addiu       $5, $2, %lo(LIT_1287__3)
/* 01B798 01DC7498 FFFF0624 */  addiu       $6, $0, -0x1
/* 01B79C 01DC749C B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 01B7A0 01DC74A0 00000000 */   nop
/* 01B7A4 01DC74A4 389B8893 */  lbu         $8, -0x64C8($28)
/* 01B7A8 01DC74A8 28260072 */  paddub      $4, $16, $0
/* 01B7AC 01DC74AC 282E4070 */  paddub      $5, $2, $0
/* 01B7B0 01DC74B0 2001A627 */  addiu       $6, $29, 0x120
/* 01B7B4 01DC74B4 3001A727 */  addiu       $7, $29, 0x130
/* 01B7B8 01DC74B8 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 01B7BC 01DC74BC 00000000 */   nop
/* 01B7C0 01DC74C0 B0010224 */  addiu       $2, $0, 0x1B0
/* 01B7C4 01DC74C4 5001A2AF */  sw          $2, 0x150($29)
/* 01B7C8 01DC74C8 34020224 */  addiu       $2, $0, 0x234
/* 01B7CC 01DC74CC 5401A2AF */  sw          $2, 0x154($29)
/* 01B7D0 01DC74D0 D0000424 */  addiu       $4, $0, 0xD0
/* 01B7D4 01DC74D4 5801A4AF */  sw          $4, 0x158($29)
/* 01B7D8 01DC74D8 3A000324 */  addiu       $3, $0, 0x3A
/* 01B7DC 01DC74DC 5C01A3AF */  sw          $3, 0x15C($29)
/* 01B7E0 01DC74E0 5E010224 */  addiu       $2, $0, 0x15E
/* 01B7E4 01DC74E4 4001A2AF */  sw          $2, 0x140($29)
/* 01B7E8 01DC74E8 82000224 */  addiu       $2, $0, 0x82
/* 01B7EC 01DC74EC 4401A2AF */  sw          $2, 0x144($29)
/* 01B7F0 01DC74F0 4801A4AF */  sw          $4, 0x148($29)
/* 01B7F4 01DC74F4 4C01A3AF */  sw          $3, 0x14C($29)
/* 01B7F8 01DC74F8 A0B8040C */  jal         GetVif1Packet__Fv
/* 01B7FC 01DC74FC 00000000 */   nop
/* 01B800 01DC7500 28864070 */  paddub      $16, $2, $0
/* 01B804 01DC7504 C701023C */  lui         $2, %hi(TexManager)
/* 01B808 01DC7508 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01B80C 01DC750C DE01023C */  lui         $2, %hi(LIT_1287__3)
/* 01B810 01DC7510 40FE4524 */  addiu       $5, $2, %lo(LIT_1287__3)
/* 01B814 01DC7514 FFFF0624 */  addiu       $6, $0, -0x1
/* 01B818 01DC7518 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 01B81C 01DC751C 00000000 */   nop
/* 01B820 01DC7520 409B8893 */  lbu         $8, -0x64C0($28)
/* 01B824 01DC7524 28260072 */  paddub      $4, $16, $0
/* 01B828 01DC7528 282E4070 */  paddub      $5, $2, $0
/* 01B82C 01DC752C 4001A627 */  addiu       $6, $29, 0x140
/* 01B830 01DC7530 5001A727 */  addiu       $7, $29, 0x150
/* 01B834 01DC7534 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 01B838 01DC7538 00000000 */   nop
/* 01B83C 01DC753C 7001A0AF */  sw          $0, 0x170($29)
/* 01B840 01DC7540 45010224 */  addiu       $2, $0, 0x145
/* 01B844 01DC7544 7401A2AF */  sw          $2, 0x174($29)
/* 01B848 01DC7548 75000424 */  addiu       $4, $0, 0x75
/* 01B84C 01DC754C 7801A4AF */  sw          $4, 0x178($29)
/* 01B850 01DC7550 38000324 */  addiu       $3, $0, 0x38
/* 01B854 01DC7554 7C01A3AF */  sw          $3, 0x17C($29)
/* 01B858 01DC7558 64000224 */  addiu       $2, $0, 0x64
/* 01B85C 01DC755C 6001A2AF */  sw          $2, 0x160($29)
/* 01B860 01DC7560 AF000224 */  addiu       $2, $0, 0xAF
/* 01B864 01DC7564 6401A2AF */  sw          $2, 0x164($29)
/* 01B868 01DC7568 6801A4AF */  sw          $4, 0x168($29)
/* 01B86C 01DC756C 6C01A3AF */  sw          $3, 0x16C($29)
/* 01B870 01DC7570 A0B8040C */  jal         GetVif1Packet__Fv
/* 01B874 01DC7574 00000000 */   nop
/* 01B878 01DC7578 28864070 */  paddub      $16, $2, $0
/* 01B87C 01DC757C C701023C */  lui         $2, %hi(TexManager)
/* 01B880 01DC7580 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01B884 01DC7584 DE01023C */  lui         $2, %hi(LIT_1287__3)
/* 01B888 01DC7588 40FE4524 */  addiu       $5, $2, %lo(LIT_1287__3)
/* 01B88C 01DC758C FFFF0624 */  addiu       $6, $0, -0x1
/* 01B890 01DC7590 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 01B894 01DC7594 00000000 */   nop
/* 01B898 01DC7598 209B8893 */  lbu         $8, -0x64E0($28)
/* 01B89C 01DC759C 28260072 */  paddub      $4, $16, $0
/* 01B8A0 01DC75A0 282E4070 */  paddub      $5, $2, $0
/* 01B8A4 01DC75A4 6001A627 */  addiu       $6, $29, 0x160
/* 01B8A8 01DC75A8 7001A727 */  addiu       $7, $29, 0x170
/* 01B8AC 01DC75AC C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 01B8B0 01DC75B0 00000000 */   nop
/* 01B8B4 01DC75B4 9001A0AF */  sw          $0, 0x190($29)
/* 01B8B8 01DC75B8 7D010224 */  addiu       $2, $0, 0x17D
/* 01B8BC 01DC75BC 9401A2AF */  sw          $2, 0x194($29)
/* 01B8C0 01DC75C0 75000424 */  addiu       $4, $0, 0x75
/* 01B8C4 01DC75C4 9801A4AF */  sw          $4, 0x198($29)
/* 01B8C8 01DC75C8 38000324 */  addiu       $3, $0, 0x38
/* 01B8CC 01DC75CC 9C01A3AF */  sw          $3, 0x19C($29)
/* 01B8D0 01DC75D0 64000224 */  addiu       $2, $0, 0x64
/* 01B8D4 01DC75D4 8001A2AF */  sw          $2, 0x180($29)
/* 01B8D8 01DC75D8 AF000224 */  addiu       $2, $0, 0xAF
/* 01B8DC 01DC75DC 8401A2AF */  sw          $2, 0x184($29)
/* 01B8E0 01DC75E0 8801A4AF */  sw          $4, 0x188($29)
/* 01B8E4 01DC75E4 8C01A3AF */  sw          $3, 0x18C($29)
/* 01B8E8 01DC75E8 A0B8040C */  jal         GetVif1Packet__Fv
/* 01B8EC 01DC75EC 00000000 */   nop
/* 01B8F0 01DC75F0 28864070 */  paddub      $16, $2, $0
/* 01B8F4 01DC75F4 C701023C */  lui         $2, %hi(TexManager)
/* 01B8F8 01DC75F8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01B8FC 01DC75FC DE01023C */  lui         $2, %hi(LIT_1287__3)
/* 01B900 01DC7600 40FE4524 */  addiu       $5, $2, %lo(LIT_1287__3)
/* 01B904 01DC7604 FFFF0624 */  addiu       $6, $0, -0x1
/* 01B908 01DC7608 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 01B90C 01DC760C 00000000 */   nop
/* 01B910 01DC7610 289B8893 */  lbu         $8, -0x64D8($28)
/* 01B914 01DC7614 28260072 */  paddub      $4, $16, $0
/* 01B918 01DC7618 282E4070 */  paddub      $5, $2, $0
/* 01B91C 01DC761C 8001A627 */  addiu       $6, $29, 0x180
/* 01B920 01DC7620 9001A727 */  addiu       $7, $29, 0x190
/* 01B924 01DC7624 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 01B928 01DC7628 00000000 */   nop
/* 01B92C 01DC762C DE01013C */  lui         $1, %hi(CScript__2 + 0x14)
/* 01B930 01DC7630 141B238C */  lw          $3, %lo(CScript__2 + 0x14)($1)
/* 01B934 01DC7634 05000224 */  addiu       $2, $0, 0x5
/* 01B938 01DC7638 B1006214 */  bne         $3, $2, .L01DC7900_2CD100
/* 01B93C 01DC763C 00000000 */   nop
/* 01B940 01DC7640 84010224 */  addiu       $2, $0, 0x184
/* 01B944 01DC7644 B001A2AF */  sw          $2, 0x1B0($29)
/* 01B948 01DC7648 B401A0AF */  sw          $0, 0x1B4($29)
/* 01B94C 01DC764C B2000324 */  addiu       $3, $0, 0xB2
/* 01B950 01DC7650 B801A3AF */  sw          $3, 0x1B8($29)
/* 01B954 01DC7654 BC01A3AF */  sw          $3, 0x1BC($29)
/* 01B958 01DC7658 06000224 */  addiu       $2, $0, 0x6
/* 01B95C 01DC765C A001A2AF */  sw          $2, 0x1A0($29)
/* 01B960 01DC7660 E5000224 */  addiu       $2, $0, 0xE5
/* 01B964 01DC7664 A401A2AF */  sw          $2, 0x1A4($29)
/* 01B968 01DC7668 A801A3AF */  sw          $3, 0x1A8($29)
/* 01B96C 01DC766C AC01A3AF */  sw          $3, 0x1AC($29)
/* 01B970 01DC7670 A0B8040C */  jal         GetVif1Packet__Fv
/* 01B974 01DC7674 00000000 */   nop
/* 01B978 01DC7678 28864070 */  paddub      $16, $2, $0
/* 01B97C 01DC767C C701023C */  lui         $2, %hi(TexManager)
/* 01B980 01DC7680 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01B984 01DC7684 DE01023C */  lui         $2, %hi(LIT_1287__3)
/* 01B988 01DC7688 40FE4524 */  addiu       $5, $2, %lo(LIT_1287__3)
/* 01B98C 01DC768C FFFF0624 */  addiu       $6, $0, -0x1
/* 01B990 01DC7690 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 01B994 01DC7694 00000000 */   nop
/* 01B998 01DC7698 209B8893 */  lbu         $8, -0x64E0($28)
/* 01B99C 01DC769C 28260072 */  paddub      $4, $16, $0
/* 01B9A0 01DC76A0 282E4070 */  paddub      $5, $2, $0
/* 01B9A4 01DC76A4 A001A627 */  addiu       $6, $29, 0x1A0
/* 01B9A8 01DC76A8 B001A727 */  addiu       $7, $29, 0x1B0
/* 01B9AC 01DC76AC C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 01B9B0 01DC76B0 00000000 */   nop
/* 01B9B4 01DC76B4 84010224 */  addiu       $2, $0, 0x184
/* 01B9B8 01DC76B8 D001A2AF */  sw          $2, 0x1D0($29)
/* 01B9BC 01DC76BC D401A0AF */  sw          $0, 0x1D4($29)
/* 01B9C0 01DC76C0 B2000324 */  addiu       $3, $0, 0xB2
/* 01B9C4 01DC76C4 D801A3AF */  sw          $3, 0x1D8($29)
/* 01B9C8 01DC76C8 DC01A3AF */  sw          $3, 0x1DC($29)
/* 01B9CC 01DC76CC B8000224 */  addiu       $2, $0, 0xB8
/* 01B9D0 01DC76D0 C001A2AF */  sw          $2, 0x1C0($29)
/* 01B9D4 01DC76D4 E5000224 */  addiu       $2, $0, 0xE5
/* 01B9D8 01DC76D8 C401A2AF */  sw          $2, 0x1C4($29)
/* 01B9DC 01DC76DC C801A3AF */  sw          $3, 0x1C8($29)
/* 01B9E0 01DC76E0 CC01A3AF */  sw          $3, 0x1CC($29)
/* 01B9E4 01DC76E4 A0B8040C */  jal         GetVif1Packet__Fv
/* 01B9E8 01DC76E8 00000000 */   nop
/* 01B9EC 01DC76EC 28864070 */  paddub      $16, $2, $0
/* 01B9F0 01DC76F0 C701023C */  lui         $2, %hi(TexManager)
/* 01B9F4 01DC76F4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01B9F8 01DC76F8 DE01023C */  lui         $2, %hi(LIT_1287__3)
/* 01B9FC 01DC76FC 40FE4524 */  addiu       $5, $2, %lo(LIT_1287__3)
/* 01BA00 01DC7700 FFFF0624 */  addiu       $6, $0, -0x1
/* 01BA04 01DC7704 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 01BA08 01DC7708 00000000 */   nop
/* 01BA0C 01DC770C 209B8893 */  lbu         $8, -0x64E0($28)
/* 01BA10 01DC7710 28260072 */  paddub      $4, $16, $0
/* 01BA14 01DC7714 282E4070 */  paddub      $5, $2, $0
/* 01BA18 01DC7718 C001A627 */  addiu       $6, $29, 0x1C0
/* 01BA1C 01DC771C D001A727 */  addiu       $7, $29, 0x1D0
/* 01BA20 01DC7720 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 01BA24 01DC7724 00000000 */   nop
/* 01BA28 01DC7728 84010224 */  addiu       $2, $0, 0x184
/* 01BA2C 01DC772C F001A2AF */  sw          $2, 0x1F0($29)
/* 01BA30 01DC7730 F401A0AF */  sw          $0, 0x1F4($29)
/* 01BA34 01DC7734 B2000324 */  addiu       $3, $0, 0xB2
/* 01BA38 01DC7738 F801A3AF */  sw          $3, 0x1F8($29)
/* 01BA3C 01DC773C FC01A3AF */  sw          $3, 0x1FC($29)
/* 01BA40 01DC7740 6A010224 */  addiu       $2, $0, 0x16A
/* 01BA44 01DC7744 E001A2AF */  sw          $2, 0x1E0($29)
/* 01BA48 01DC7748 E5000224 */  addiu       $2, $0, 0xE5
/* 01BA4C 01DC774C E401A2AF */  sw          $2, 0x1E4($29)
/* 01BA50 01DC7750 E801A3AF */  sw          $3, 0x1E8($29)
/* 01BA54 01DC7754 EC01A3AF */  sw          $3, 0x1EC($29)
/* 01BA58 01DC7758 A0B8040C */  jal         GetVif1Packet__Fv
/* 01BA5C 01DC775C 00000000 */   nop
/* 01BA60 01DC7760 28864070 */  paddub      $16, $2, $0
/* 01BA64 01DC7764 C701023C */  lui         $2, %hi(TexManager)
/* 01BA68 01DC7768 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01BA6C 01DC776C DE01023C */  lui         $2, %hi(LIT_1287__3)
/* 01BA70 01DC7770 40FE4524 */  addiu       $5, $2, %lo(LIT_1287__3)
/* 01BA74 01DC7774 FFFF0624 */  addiu       $6, $0, -0x1
/* 01BA78 01DC7778 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 01BA7C 01DC777C 00000000 */   nop
/* 01BA80 01DC7780 209B8893 */  lbu         $8, -0x64E0($28)
/* 01BA84 01DC7784 28260072 */  paddub      $4, $16, $0
/* 01BA88 01DC7788 282E4070 */  paddub      $5, $2, $0
/* 01BA8C 01DC778C E001A627 */  addiu       $6, $29, 0x1E0
/* 01BA90 01DC7790 F001A727 */  addiu       $7, $29, 0x1F0
/* 01BA94 01DC7794 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 01BA98 01DC7798 00000000 */   nop
/* 01BA9C 01DC779C D2000224 */  addiu       $2, $0, 0xD2
/* 01BAA0 01DC77A0 1002A2AF */  sw          $2, 0x210($29)
/* 01BAA4 01DC77A4 1402A0AF */  sw          $0, 0x214($29)
/* 01BAA8 01DC77A8 B2000324 */  addiu       $3, $0, 0xB2
/* 01BAAC 01DC77AC 1802A3AF */  sw          $3, 0x218($29)
/* 01BAB0 01DC77B0 1C02A3AF */  sw          $3, 0x21C($29)
/* 01BAB4 01DC77B4 06000224 */  addiu       $2, $0, 0x6
/* 01BAB8 01DC77B8 0002A2AF */  sw          $2, 0x200($29)
/* 01BABC 01DC77BC E5000224 */  addiu       $2, $0, 0xE5
/* 01BAC0 01DC77C0 0402A2AF */  sw          $2, 0x204($29)
/* 01BAC4 01DC77C4 0802A3AF */  sw          $3, 0x208($29)
/* 01BAC8 01DC77C8 0C02A3AF */  sw          $3, 0x20C($29)
/* 01BACC 01DC77CC A0B8040C */  jal         GetVif1Packet__Fv
/* 01BAD0 01DC77D0 00000000 */   nop
/* 01BAD4 01DC77D4 28864070 */  paddub      $16, $2, $0
/* 01BAD8 01DC77D8 C701023C */  lui         $2, %hi(TexManager)
/* 01BADC 01DC77DC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01BAE0 01DC77E0 DE01023C */  lui         $2, %hi(LIT_1287__3)
/* 01BAE4 01DC77E4 40FE4524 */  addiu       $5, $2, %lo(LIT_1287__3)
/* 01BAE8 01DC77E8 FFFF0624 */  addiu       $6, $0, -0x1
/* 01BAEC 01DC77EC B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 01BAF0 01DC77F0 00000000 */   nop
/* 01BAF4 01DC77F4 289B8893 */  lbu         $8, -0x64D8($28)
/* 01BAF8 01DC77F8 28260072 */  paddub      $4, $16, $0
/* 01BAFC 01DC77FC 282E4070 */  paddub      $5, $2, $0
/* 01BB00 01DC7800 0002A627 */  addiu       $6, $29, 0x200
/* 01BB04 01DC7804 1002A727 */  addiu       $7, $29, 0x210
/* 01BB08 01DC7808 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 01BB0C 01DC780C 00000000 */   nop
/* 01BB10 01DC7810 D2000224 */  addiu       $2, $0, 0xD2
/* 01BB14 01DC7814 3002A2AF */  sw          $2, 0x230($29)
/* 01BB18 01DC7818 3402A0AF */  sw          $0, 0x234($29)
/* 01BB1C 01DC781C B2000324 */  addiu       $3, $0, 0xB2
/* 01BB20 01DC7820 3802A3AF */  sw          $3, 0x238($29)
/* 01BB24 01DC7824 3C02A3AF */  sw          $3, 0x23C($29)
/* 01BB28 01DC7828 B8000224 */  addiu       $2, $0, 0xB8
/* 01BB2C 01DC782C 2002A2AF */  sw          $2, 0x220($29)
/* 01BB30 01DC7830 E5000224 */  addiu       $2, $0, 0xE5
/* 01BB34 01DC7834 2402A2AF */  sw          $2, 0x224($29)
/* 01BB38 01DC7838 2802A3AF */  sw          $3, 0x228($29)
/* 01BB3C 01DC783C 2C02A3AF */  sw          $3, 0x22C($29)
/* 01BB40 01DC7840 A0B8040C */  jal         GetVif1Packet__Fv
/* 01BB44 01DC7844 00000000 */   nop
/* 01BB48 01DC7848 28864070 */  paddub      $16, $2, $0
/* 01BB4C 01DC784C C701023C */  lui         $2, %hi(TexManager)
/* 01BB50 01DC7850 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01BB54 01DC7854 DE01023C */  lui         $2, %hi(LIT_1287__3)
/* 01BB58 01DC7858 40FE4524 */  addiu       $5, $2, %lo(LIT_1287__3)
/* 01BB5C 01DC785C FFFF0624 */  addiu       $6, $0, -0x1
/* 01BB60 01DC7860 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 01BB64 01DC7864 00000000 */   nop
/* 01BB68 01DC7868 289B8893 */  lbu         $8, -0x64D8($28)
/* 01BB6C 01DC786C 28260072 */  paddub      $4, $16, $0
/* 01BB70 01DC7870 282E4070 */  paddub      $5, $2, $0
/* 01BB74 01DC7874 2002A627 */  addiu       $6, $29, 0x220
/* 01BB78 01DC7878 3002A727 */  addiu       $7, $29, 0x230
/* 01BB7C 01DC787C C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 01BB80 01DC7880 00000000 */   nop
/* 01BB84 01DC7884 D2000224 */  addiu       $2, $0, 0xD2
/* 01BB88 01DC7888 5002A2AF */  sw          $2, 0x250($29)
/* 01BB8C 01DC788C 5402A0AF */  sw          $0, 0x254($29)
/* 01BB90 01DC7890 B2000324 */  addiu       $3, $0, 0xB2
/* 01BB94 01DC7894 5802A3AF */  sw          $3, 0x258($29)
/* 01BB98 01DC7898 5C02A3AF */  sw          $3, 0x25C($29)
/* 01BB9C 01DC789C 6A010224 */  addiu       $2, $0, 0x16A
/* 01BBA0 01DC78A0 4002A2AF */  sw          $2, 0x240($29)
/* 01BBA4 01DC78A4 E5000224 */  addiu       $2, $0, 0xE5
/* 01BBA8 01DC78A8 4402A2AF */  sw          $2, 0x244($29)
/* 01BBAC 01DC78AC 4802A3AF */  sw          $3, 0x248($29)
/* 01BBB0 01DC78B0 4C02A3AF */  sw          $3, 0x24C($29)
/* 01BBB4 01DC78B4 A0B8040C */  jal         GetVif1Packet__Fv
/* 01BBB8 01DC78B8 00000000 */   nop
/* 01BBBC 01DC78BC 28864070 */  paddub      $16, $2, $0
/* 01BBC0 01DC78C0 C701023C */  lui         $2, %hi(TexManager)
/* 01BBC4 01DC78C4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01BBC8 01DC78C8 DE01023C */  lui         $2, %hi(LIT_1287__3)
/* 01BBCC 01DC78CC 40FE4524 */  addiu       $5, $2, %lo(LIT_1287__3)
/* 01BBD0 01DC78D0 FFFF0624 */  addiu       $6, $0, -0x1
/* 01BBD4 01DC78D4 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 01BBD8 01DC78D8 00000000 */   nop
/* 01BBDC 01DC78DC 289B8893 */  lbu         $8, -0x64D8($28)
/* 01BBE0 01DC78E0 28260072 */  paddub      $4, $16, $0
/* 01BBE4 01DC78E4 282E4070 */  paddub      $5, $2, $0
/* 01BBE8 01DC78E8 4002A627 */  addiu       $6, $29, 0x240
/* 01BBEC 01DC78EC 5002A727 */  addiu       $7, $29, 0x250
/* 01BBF0 01DC78F0 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 01BBF4 01DC78F4 00000000 */   nop
/* 01BBF8 01DC78F8 FA010010 */  b           .L01DC80E4_2CD8E4
/* 01BBFC 01DC78FC 00000000 */   nop
.L01DC7900_2CD100:
/* 01BC00 01DC7900 4C9B8283 */  lb          $2, -0x64B4($28)
/* 01BC04 01DC7904 05004014 */  bnez        $2, .L01DC791C_2CD11C
/* 01BC08 01DC7908 00000000 */   nop
/* 01BC0C 01DC790C C040023C */  lui         $2, (0x40C00000 >> 16)
/* 01BC10 01DC7910 489B82AF */  sw          $2, -0x64B8($28)
/* 01BC14 01DC7914 01000224 */  addiu       $2, $0, 0x1
/* 01BC18 01DC7918 4C9B82A3 */  sb          $2, -0x64B4($28)
.L01DC791C_2CD11C:
/* 01BC1C 01DC791C 549B8283 */  lb          $2, -0x64AC($28)
/* 01BC20 01DC7920 05004014 */  bnez        $2, .L01DC7938_2CD138
/* 01BC24 01DC7924 00000000 */   nop
/* 01BC28 01DC7928 6543023C */  lui         $2, (0x43650000 >> 16)
/* 01BC2C 01DC792C 509B82AF */  sw          $2, -0x64B0($28)
/* 01BC30 01DC7930 01000224 */  addiu       $2, $0, 0x1
/* 01BC34 01DC7934 549B82A3 */  sb          $2, -0x64AC($28)
.L01DC7938_2CD138:
/* 01BC38 01DC7938 5C9B8283 */  lb          $2, -0x64A4($28)
/* 01BC3C 01DC793C 05004014 */  bnez        $2, .L01DC7954_2CD154
/* 01BC40 01DC7940 00000000 */   nop
/* 01BC44 01DC7944 208480C7 */  lwc1        $f0, -0x7BE0($28)
/* 01BC48 01DC7948 589B80E7 */  swc1        $f0, -0x64A8($28)
/* 01BC4C 01DC794C 01000224 */  addiu       $2, $0, 0x1
/* 01BC50 01DC7950 5C9B82A3 */  sb          $2, -0x64A4($28)
.L01DC7954_2CD154:
/* 01BC54 01DC7954 649B8283 */  lb          $2, -0x649C($28)
/* 01BC58 01DC7958 05004014 */  bnez        $2, .L01DC7970_2CD170
/* 01BC5C 01DC795C 00000000 */   nop
/* 01BC60 01DC7960 3843023C */  lui         $2, (0x43380000 >> 16)
/* 01BC64 01DC7964 609B82AF */  sw          $2, -0x64A0($28)
/* 01BC68 01DC7968 01000224 */  addiu       $2, $0, 0x1
/* 01BC6C 01DC796C 649B82A3 */  sb          $2, -0x649C($28)
.L01DC7970_2CD170:
/* 01BC70 01DC7970 6C9B8283 */  lb          $2, -0x6494($28)
/* 01BC74 01DC7974 05004014 */  bnez        $2, .L01DC798C_2CD18C
/* 01BC78 01DC7978 00000000 */   nop
/* 01BC7C 01DC797C 6543023C */  lui         $2, (0x43650000 >> 16)
/* 01BC80 01DC7980 689B82AF */  sw          $2, -0x6498($28)
/* 01BC84 01DC7984 01000224 */  addiu       $2, $0, 0x1
/* 01BC88 01DC7988 6C9B82A3 */  sb          $2, -0x6494($28)
.L01DC798C_2CD18C:
/* 01BC8C 01DC798C 749B8283 */  lb          $2, -0x648C($28)
/* 01BC90 01DC7990 05004014 */  bnez        $2, .L01DC79A8_2CD1A8
/* 01BC94 01DC7994 00000000 */   nop
/* 01BC98 01DC7998 248480C7 */  lwc1        $f0, -0x7BDC($28)
/* 01BC9C 01DC799C 709B80E7 */  swc1        $f0, -0x6490($28)
/* 01BCA0 01DC79A0 01000224 */  addiu       $2, $0, 0x1
/* 01BCA4 01DC79A4 749B82A3 */  sb          $2, -0x648C($28)
.L01DC79A8_2CD1A8:
/* 01BCA8 01DC79A8 7C9B8283 */  lb          $2, -0x6484($28)
/* 01BCAC 01DC79AC 05004014 */  bnez        $2, .L01DC79C4_2CD1C4
/* 01BCB0 01DC79B0 00000000 */   nop
/* 01BCB4 01DC79B4 B543023C */  lui         $2, (0x43B50000 >> 16)
/* 01BCB8 01DC79B8 789B82AF */  sw          $2, -0x6488($28)
/* 01BCBC 01DC79BC 01000224 */  addiu       $2, $0, 0x1
/* 01BCC0 01DC79C0 7C9B82A3 */  sb          $2, -0x6484($28)
.L01DC79C4_2CD1C4:
/* 01BCC4 01DC79C4 849B8283 */  lb          $2, -0x647C($28)
/* 01BCC8 01DC79C8 05004014 */  bnez        $2, .L01DC79E0_2CD1E0
/* 01BCCC 01DC79CC 00000000 */   nop
/* 01BCD0 01DC79D0 6543023C */  lui         $2, (0x43650000 >> 16)
/* 01BCD4 01DC79D4 809B82AF */  sw          $2, -0x6480($28)
/* 01BCD8 01DC79D8 01000224 */  addiu       $2, $0, 0x1
/* 01BCDC 01DC79DC 849B82A3 */  sb          $2, -0x647C($28)
.L01DC79E0_2CD1E0:
/* 01BCE0 01DC79E0 8C9B8283 */  lb          $2, -0x6474($28)
/* 01BCE4 01DC79E4 05004014 */  bnez        $2, .L01DC79FC_2CD1FC
/* 01BCE8 01DC79E8 00000000 */   nop
/* 01BCEC 01DC79EC 248480C7 */  lwc1        $f0, -0x7BDC($28)
/* 01BCF0 01DC79F0 889B80E7 */  swc1        $f0, -0x6478($28)
/* 01BCF4 01DC79F4 01000224 */  addiu       $2, $0, 0x1
/* 01BCF8 01DC79F8 8C9B82A3 */  sb          $2, -0x6474($28)
.L01DC79FC_2CD1FC:
/* 01BCFC 01DC79FC C8C2023C */  lui         $2, (0xC2C80000 >> 16)
/* 01BD00 01DC7A00 00088244 */  mtc1        $2, $f1
/* 01BD04 01DC7A04 489B80C7 */  lwc1        $f0, -0x64B8($28)
/* 01BD08 01DC7A08 010B0046 */  sub.s       $f12, $f1, $f0
/* 01BD0C 01DC7A0C 509B80C7 */  lwc1        $f0, -0x64B0($28)
/* 01BD10 01DC7A10 410B0046 */  sub.s       $f13, $f1, $f0
/* 01BD14 01DC7A14 5077040C */  jal         atan2f
/* 01BD18 01DC7A18 00000000 */   nop
/* 01BD1C 01DC7A1C 589B82C7 */  lwc1        $f2, -0x64A8($28)
/* 01BD20 01DC7A20 34000246 */  c.lt.s      $f0, $f2
/* 01BD24 01DC7A24 00000000 */  nop
/* 01BD28 01DC7A28 04000045 */  bc1f        .L01DC7A3C_2CD23C
/* 01BD2C 01DC7A2C 00000000 */   nop
/* 01BD30 01DC7A30 E08381C7 */  lwc1        $f1, -0x7C20($28)
/* 01BD34 01DC7A34 41100146 */  sub.s       $f1, $f2, $f1
/* 01BD38 01DC7A38 589B81E7 */  swc1        $f1, -0x64A8($28)
.L01DC7A3C_2CD23C:
/* 01BD3C 01DC7A3C 589B81C7 */  lwc1        $f1, -0x64A8($28)
/* 01BD40 01DC7A40 36000146 */  c.le.s      $f0, $f1
/* 01BD44 01DC7A44 00000000 */  nop
/* 01BD48 01DC7A48 04000145 */  bc1t        .L01DC7A5C_2CD25C
/* 01BD4C 01DC7A4C 00000000 */   nop
/* 01BD50 01DC7A50 E08380C7 */  lwc1        $f0, -0x7C20($28)
/* 01BD54 01DC7A54 00080046 */  add.s       $f0, $f1, $f0
/* 01BD58 01DC7A58 589B80E7 */  swc1        $f0, -0x64A8($28)
.L01DC7A5C_2CD25C:
/* 01BD5C 01DC7A5C 589B8CC7 */  lwc1        $f12, -0x64A8($28)
/* 01BD60 01DC7A60 9044040C */  jal         fptodp
/* 01BD64 01DC7A64 00000000 */   nop
/* 01BD68 01DC7A68 28264070 */  paddub      $4, $2, $0
/* 01BD6C 01DC7A6C C474040C */  jal         sin
/* 01BD70 01DC7A70 00000000 */   nop
/* 01BD74 01DC7A74 1040033C */  lui         $3, (0x40100000 >> 16)
/* 01BD78 01DC7A78 3C200300 */  dsll32      $4, $3, 0
/* 01BD7C 01DC7A7C 282E4070 */  paddub      $5, $2, $0
/* 01BD80 01DC7A80 9E3F040C */  jal         dpmul
/* 01BD84 01DC7A84 00000000 */   nop
/* 01BD88 01DC7A88 28264070 */  paddub      $4, $2, $0
/* 01BD8C 01DC7A8C 9241040C */  jal         dptofp
/* 01BD90 01DC7A90 00000000 */   nop
/* 01BD94 01DC7A94 489B81C7 */  lwc1        $f1, -0x64B8($28)
/* 01BD98 01DC7A98 00080046 */  add.s       $f0, $f1, $f0
/* 01BD9C 01DC7A9C 489B80E7 */  swc1        $f0, -0x64B8($28)
/* 01BDA0 01DC7AA0 589B8CC7 */  lwc1        $f12, -0x64A8($28)
/* 01BDA4 01DC7AA4 9044040C */  jal         fptodp
/* 01BDA8 01DC7AA8 00000000 */   nop
/* 01BDAC 01DC7AAC 28264070 */  paddub      $4, $2, $0
/* 01BDB0 01DC7AB0 F473040C */  jal         cos
/* 01BDB4 01DC7AB4 00000000 */   nop
/* 01BDB8 01DC7AB8 1040033C */  lui         $3, (0x40100000 >> 16)
/* 01BDBC 01DC7ABC 3C200300 */  dsll32      $4, $3, 0
/* 01BDC0 01DC7AC0 282E4070 */  paddub      $5, $2, $0
/* 01BDC4 01DC7AC4 9E3F040C */  jal         dpmul
/* 01BDC8 01DC7AC8 00000000 */   nop
/* 01BDCC 01DC7ACC 28264070 */  paddub      $4, $2, $0
/* 01BDD0 01DC7AD0 9241040C */  jal         dptofp
/* 01BDD4 01DC7AD4 00000000 */   nop
/* 01BDD8 01DC7AD8 509B81C7 */  lwc1        $f1, -0x64B0($28)
/* 01BDDC 01DC7ADC 000D0046 */  add.s       $f20, $f1, $f0
/* 01BDE0 01DC7AE0 509B94E7 */  swc1        $f20, -0x64B0($28)
/* 01BDE4 01DC7AE4 0042023C */  lui         $2, (0x42000000 >> 16)
/* 01BDE8 01DC7AE8 00008244 */  mtc1        $2, $f0
/* 01BDEC 01DC7AEC 00000000 */  nop
/* 01BDF0 01DC7AF0 34A00046 */  c.lt.s      $f20, $f0
/* 01BDF4 01DC7AF4 00000000 */  nop
/* 01BDF8 01DC7AF8 0E000045 */  bc1f        .L01DC7B34_2CD334
/* 01BDFC 01DC7AFC 00000000 */   nop
/* 01BE00 01DC7B00 8040023C */  lui         $2, (0x40800000 >> 16)
/* 01BE04 01DC7B04 00088244 */  mtc1        $2, $f1
/* 01BE08 01DC7B08 00000000 */  nop
/* 01BE0C 01DC7B0C 01001446 */  sub.s       $f0, $f0, $f20
/* 01BE10 01DC7B10 42080046 */  mul.s       $f1, $f1, $f0
/* 01BE14 01DC7B14 0043023C */  lui         $2, (0x43000000 >> 16)
/* 01BE18 01DC7B18 00008244 */  mtc1        $2, $f0
/* 01BE1C 01DC7B1C 00000000 */  nop
/* 01BE20 01DC7B20 01030146 */  sub.s       $f12, $f0, $f1
/* 01BE24 01DC7B24 2C44040C */  jal         fptosi
/* 01BE28 01DC7B28 00000000 */   nop
/* 01BE2C 01DC7B2C 02000010 */  b           .L01DC7B38_2CD338
/* 01BE30 01DC7B30 00000000 */   nop
.L01DC7B34_2CD334:
/* 01BE34 01DC7B34 80000224 */  addiu       $2, $0, 0x80
.L01DC7B38_2CD338:
/* 01BE38 01DC7B38 28864070 */  paddub      $16, $2, $0
/* 01BE3C 01DC7B3C 02000106 */  bgez        $16, .L01DC7B48_2CD348
/* 01BE40 01DC7B40 00000000 */   nop
/* 01BE44 01DC7B44 28860070 */  paddub      $16, $0, $0
.L01DC7B48_2CD348:
/* 01BE48 01DC7B48 00008044 */  mtc1        $0, $f0
/* 01BE4C 01DC7B4C 00000000 */  nop
/* 01BE50 01DC7B50 36A00046 */  c.le.s      $f20, $f0
/* 01BE54 01DC7B54 00000000 */  nop
/* 01BE58 01DC7B58 05000045 */  bc1f        .L01DC7B70_2CD370
/* 01BE5C 01DC7B5C 00000000 */   nop
/* 01BE60 01DC7B60 C040023C */  lui         $2, (0x40C00000 >> 16)
/* 01BE64 01DC7B64 489B82AF */  sw          $2, -0x64B8($28)
/* 01BE68 01DC7B68 6543023C */  lui         $2, (0x43650000 >> 16)
/* 01BE6C 01DC7B6C 509B82AF */  sw          $2, -0x64B0($28)
.L01DC7B70_2CD370:
/* 01BE70 01DC7B70 6543023C */  lui         $2, (0x43650000 >> 16)
/* 01BE74 01DC7B74 00008244 */  mtc1        $2, $f0
/* 01BE78 01DC7B78 509B94C7 */  lwc1        $f20, -0x64B0($28)
/* 01BE7C 01DC7B7C 41001446 */  sub.s       $f1, $f0, $f20
/* 01BE80 01DC7B80 0040023C */  lui         $2, (0x40000000 >> 16)
/* 01BE84 01DC7B84 00008244 */  mtc1        $2, $f0
/* 01BE88 01DC7B88 00000000 */  nop
/* 01BE8C 01DC7B8C 030B0046 */  div.s       $f12, $f1, $f0
/* 01BE90 01DC7B90 2C44040C */  jal         fptosi
/* 01BE94 01DC7B94 00000000 */   nop
/* 01BE98 01DC7B98 288E4070 */  paddub      $17, $2, $0
/* 01BE9C 01DC7B9C D2000224 */  addiu       $2, $0, 0xD2
/* 01BEA0 01DC7BA0 7002A2AF */  sw          $2, 0x270($29)
/* 01BEA4 01DC7BA4 7402A0AF */  sw          $0, 0x274($29)
/* 01BEA8 01DC7BA8 B2000224 */  addiu       $2, $0, 0xB2
/* 01BEAC 01DC7BAC 7802A2AF */  sw          $2, 0x278($29)
/* 01BEB0 01DC7BB0 7C02A2AF */  sw          $2, 0x27C($29)
/* 01BEB4 01DC7BB4 06A30046 */  mov.s       $f12, $f20
/* 01BEB8 01DC7BB8 2C44040C */  jal         fptosi
/* 01BEBC 01DC7BBC 00000000 */   nop
/* 01BEC0 01DC7BC0 489B95C7 */  lwc1        $f21, -0x64B8($28)
/* 01BEC4 01DC7BC4 06AB0046 */  mov.s       $f12, $f21
/* 01BEC8 01DC7BC8 2C44040C */  jal         fptosi
/* 01BECC 01DC7BCC 00000000 */   nop
/* 01BED0 01DC7BD0 06AB0046 */  mov.s       $f12, $f21
/* 01BED4 01DC7BD4 2C44040C */  jal         fptosi
/* 01BED8 01DC7BD8 00000000 */   nop
/* 01BEDC 01DC7BDC 6002A2AF */  sw          $2, 0x260($29)
/* 01BEE0 01DC7BE0 06A30046 */  mov.s       $f12, $f20
/* 01BEE4 01DC7BE4 2C44040C */  jal         fptosi
/* 01BEE8 01DC7BE8 00000000 */   nop
/* 01BEEC 01DC7BEC 6402A2AF */  sw          $2, 0x264($29)
/* 01BEF0 01DC7BF0 B2000224 */  addiu       $2, $0, 0xB2
/* 01BEF4 01DC7BF4 23105100 */  subu        $2, $2, $17
/* 01BEF8 01DC7BF8 6802A2AF */  sw          $2, 0x268($29)
/* 01BEFC 01DC7BFC 6C02A2AF */  sw          $2, 0x26C($29)
/* 01BF00 01DC7C00 A0B8040C */  jal         GetVif1Packet__Fv
/* 01BF04 01DC7C04 00000000 */   nop
/* 01BF08 01DC7C08 288E4070 */  paddub      $17, $2, $0
/* 01BF0C 01DC7C0C C701023C */  lui         $2, %hi(TexManager)
/* 01BF10 01DC7C10 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01BF14 01DC7C14 DE01023C */  lui         $2, %hi(LIT_1287__3)
/* 01BF18 01DC7C18 40FE4524 */  addiu       $5, $2, %lo(LIT_1287__3)
/* 01BF1C 01DC7C1C FFFF0624 */  addiu       $6, $0, -0x1
/* 01BF20 01DC7C20 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 01BF24 01DC7C24 00000000 */   nop
/* 01BF28 01DC7C28 FF000832 */  andi        $8, $16, 0xFF
/* 01BF2C 01DC7C2C 28262072 */  paddub      $4, $17, $0
/* 01BF30 01DC7C30 282E4070 */  paddub      $5, $2, $0
/* 01BF34 01DC7C34 6002A627 */  addiu       $6, $29, 0x260
/* 01BF38 01DC7C38 7002A727 */  addiu       $7, $29, 0x270
/* 01BF3C 01DC7C3C C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 01BF40 01DC7C40 00000000 */   nop
/* 01BF44 01DC7C44 FA43023C */  lui         $2, (0x43FA0000 >> 16)
/* 01BF48 01DC7C48 00088244 */  mtc1        $2, $f1
/* 01BF4C 01DC7C4C 609B80C7 */  lwc1        $f0, -0x64A0($28)
/* 01BF50 01DC7C50 010B0046 */  sub.s       $f12, $f1, $f0
/* 01BF54 01DC7C54 C8C2023C */  lui         $2, (0xC2C80000 >> 16)
/* 01BF58 01DC7C58 00088244 */  mtc1        $2, $f1
/* 01BF5C 01DC7C5C 689B80C7 */  lwc1        $f0, -0x6498($28)
/* 01BF60 01DC7C60 410B0046 */  sub.s       $f13, $f1, $f0
/* 01BF64 01DC7C64 5077040C */  jal         atan2f
/* 01BF68 01DC7C68 00000000 */   nop
/* 01BF6C 01DC7C6C 709B82C7 */  lwc1        $f2, -0x6490($28)
/* 01BF70 01DC7C70 34000246 */  c.lt.s      $f0, $f2
/* 01BF74 01DC7C74 00000000 */  nop
/* 01BF78 01DC7C78 04000045 */  bc1f        .L01DC7C8C_2CD48C
/* 01BF7C 01DC7C7C 00000000 */   nop
/* 01BF80 01DC7C80 E08381C7 */  lwc1        $f1, -0x7C20($28)
/* 01BF84 01DC7C84 41100146 */  sub.s       $f1, $f2, $f1
/* 01BF88 01DC7C88 709B81E7 */  swc1        $f1, -0x6490($28)
.L01DC7C8C_2CD48C:
/* 01BF8C 01DC7C8C 709B81C7 */  lwc1        $f1, -0x6490($28)
/* 01BF90 01DC7C90 36000146 */  c.le.s      $f0, $f1
/* 01BF94 01DC7C94 00000000 */  nop
/* 01BF98 01DC7C98 04000145 */  bc1t        .L01DC7CAC_2CD4AC
/* 01BF9C 01DC7C9C 00000000 */   nop
/* 01BFA0 01DC7CA0 E08380C7 */  lwc1        $f0, -0x7C20($28)
/* 01BFA4 01DC7CA4 00080046 */  add.s       $f0, $f1, $f0
/* 01BFA8 01DC7CA8 709B80E7 */  swc1        $f0, -0x6490($28)
.L01DC7CAC_2CD4AC:
/* 01BFAC 01DC7CAC 709B8CC7 */  lwc1        $f12, -0x6490($28)
/* 01BFB0 01DC7CB0 9044040C */  jal         fptodp
/* 01BFB4 01DC7CB4 00000000 */   nop
/* 01BFB8 01DC7CB8 28264070 */  paddub      $4, $2, $0
/* 01BFBC 01DC7CBC C474040C */  jal         sin
/* 01BFC0 01DC7CC0 00000000 */   nop
/* 01BFC4 01DC7CC4 1040033C */  lui         $3, (0x40100000 >> 16)
/* 01BFC8 01DC7CC8 3C200300 */  dsll32      $4, $3, 0
/* 01BFCC 01DC7CCC 282E4070 */  paddub      $5, $2, $0
/* 01BFD0 01DC7CD0 9E3F040C */  jal         dpmul
/* 01BFD4 01DC7CD4 00000000 */   nop
/* 01BFD8 01DC7CD8 28264070 */  paddub      $4, $2, $0
/* 01BFDC 01DC7CDC 9241040C */  jal         dptofp
/* 01BFE0 01DC7CE0 00000000 */   nop
/* 01BFE4 01DC7CE4 609B81C7 */  lwc1        $f1, -0x64A0($28)
/* 01BFE8 01DC7CE8 00080046 */  add.s       $f0, $f1, $f0
/* 01BFEC 01DC7CEC 609B80E7 */  swc1        $f0, -0x64A0($28)
/* 01BFF0 01DC7CF0 709B8CC7 */  lwc1        $f12, -0x6490($28)
/* 01BFF4 01DC7CF4 9044040C */  jal         fptodp
/* 01BFF8 01DC7CF8 00000000 */   nop
/* 01BFFC 01DC7CFC 28264070 */  paddub      $4, $2, $0
/* 01C000 01DC7D00 F473040C */  jal         cos
/* 01C004 01DC7D04 00000000 */   nop
/* 01C008 01DC7D08 1040033C */  lui         $3, (0x40100000 >> 16)
/* 01C00C 01DC7D0C 3C200300 */  dsll32      $4, $3, 0
/* 01C010 01DC7D10 282E4070 */  paddub      $5, $2, $0
/* 01C014 01DC7D14 9E3F040C */  jal         dpmul
/* 01C018 01DC7D18 00000000 */   nop
/* 01C01C 01DC7D1C 28264070 */  paddub      $4, $2, $0
/* 01C020 01DC7D20 9241040C */  jal         dptofp
/* 01C024 01DC7D24 00000000 */   nop
/* 01C028 01DC7D28 689B81C7 */  lwc1        $f1, -0x6498($28)
/* 01C02C 01DC7D2C 000D0046 */  add.s       $f20, $f1, $f0
/* 01C030 01DC7D30 689B94E7 */  swc1        $f20, -0x6498($28)
/* 01C034 01DC7D34 0042023C */  lui         $2, (0x42000000 >> 16)
/* 01C038 01DC7D38 00008244 */  mtc1        $2, $f0
/* 01C03C 01DC7D3C 00000000 */  nop
/* 01C040 01DC7D40 34A00046 */  c.lt.s      $f20, $f0
/* 01C044 01DC7D44 00000000 */  nop
/* 01C048 01DC7D48 0E000045 */  bc1f        .L01DC7D84_2CD584
/* 01C04C 01DC7D4C 00000000 */   nop
/* 01C050 01DC7D50 8040023C */  lui         $2, (0x40800000 >> 16)
/* 01C054 01DC7D54 00088244 */  mtc1        $2, $f1
/* 01C058 01DC7D58 00000000 */  nop
/* 01C05C 01DC7D5C 01001446 */  sub.s       $f0, $f0, $f20
/* 01C060 01DC7D60 42080046 */  mul.s       $f1, $f1, $f0
/* 01C064 01DC7D64 0043023C */  lui         $2, (0x43000000 >> 16)
/* 01C068 01DC7D68 00008244 */  mtc1        $2, $f0
/* 01C06C 01DC7D6C 00000000 */  nop
/* 01C070 01DC7D70 01030146 */  sub.s       $f12, $f0, $f1
/* 01C074 01DC7D74 2C44040C */  jal         fptosi
/* 01C078 01DC7D78 00000000 */   nop
/* 01C07C 01DC7D7C 02000010 */  b           .L01DC7D88_2CD588
/* 01C080 01DC7D80 00000000 */   nop
.L01DC7D84_2CD584:
/* 01C084 01DC7D84 80000224 */  addiu       $2, $0, 0x80
.L01DC7D88_2CD588:
/* 01C088 01DC7D88 28864070 */  paddub      $16, $2, $0
/* 01C08C 01DC7D8C 02000106 */  bgez        $16, .L01DC7D98_2CD598
/* 01C090 01DC7D90 00000000 */   nop
/* 01C094 01DC7D94 28860070 */  paddub      $16, $0, $0
.L01DC7D98_2CD598:
/* 01C098 01DC7D98 00008044 */  mtc1        $0, $f0
/* 01C09C 01DC7D9C 00000000 */  nop
/* 01C0A0 01DC7DA0 36A00046 */  c.le.s      $f20, $f0
/* 01C0A4 01DC7DA4 00000000 */  nop
/* 01C0A8 01DC7DA8 05000045 */  bc1f        .L01DC7DC0_2CD5C0
/* 01C0AC 01DC7DAC 00000000 */   nop
/* 01C0B0 01DC7DB0 3843023C */  lui         $2, (0x43380000 >> 16)
/* 01C0B4 01DC7DB4 609B82AF */  sw          $2, -0x64A0($28)
/* 01C0B8 01DC7DB8 6543023C */  lui         $2, (0x43650000 >> 16)
/* 01C0BC 01DC7DBC 689B82AF */  sw          $2, -0x6498($28)
.L01DC7DC0_2CD5C0:
/* 01C0C0 01DC7DC0 6543023C */  lui         $2, (0x43650000 >> 16)
/* 01C0C4 01DC7DC4 00008244 */  mtc1        $2, $f0
/* 01C0C8 01DC7DC8 689B94C7 */  lwc1        $f20, -0x6498($28)
/* 01C0CC 01DC7DCC 41001446 */  sub.s       $f1, $f0, $f20
/* 01C0D0 01DC7DD0 0040023C */  lui         $2, (0x40000000 >> 16)
/* 01C0D4 01DC7DD4 00008244 */  mtc1        $2, $f0
/* 01C0D8 01DC7DD8 00000000 */  nop
/* 01C0DC 01DC7DDC 030B0046 */  div.s       $f12, $f1, $f0
/* 01C0E0 01DC7DE0 2C44040C */  jal         fptosi
/* 01C0E4 01DC7DE4 00000000 */   nop
/* 01C0E8 01DC7DE8 288E4070 */  paddub      $17, $2, $0
/* 01C0EC 01DC7DEC D2000224 */  addiu       $2, $0, 0xD2
/* 01C0F0 01DC7DF0 9002A2AF */  sw          $2, 0x290($29)
/* 01C0F4 01DC7DF4 9402A0AF */  sw          $0, 0x294($29)
/* 01C0F8 01DC7DF8 B2000224 */  addiu       $2, $0, 0xB2
/* 01C0FC 01DC7DFC 9802A2AF */  sw          $2, 0x298($29)
/* 01C100 01DC7E00 9C02A2AF */  sw          $2, 0x29C($29)
/* 01C104 01DC7E04 06A30046 */  mov.s       $f12, $f20
/* 01C108 01DC7E08 2C44040C */  jal         fptosi
/* 01C10C 01DC7E0C 00000000 */   nop
/* 01C110 01DC7E10 609B95C7 */  lwc1        $f21, -0x64A0($28)
/* 01C114 01DC7E14 06AB0046 */  mov.s       $f12, $f21
/* 01C118 01DC7E18 2C44040C */  jal         fptosi
/* 01C11C 01DC7E1C 00000000 */   nop
/* 01C120 01DC7E20 06AB0046 */  mov.s       $f12, $f21
/* 01C124 01DC7E24 2C44040C */  jal         fptosi
/* 01C128 01DC7E28 00000000 */   nop
/* 01C12C 01DC7E2C 8002A2AF */  sw          $2, 0x280($29)
/* 01C130 01DC7E30 06A30046 */  mov.s       $f12, $f20
/* 01C134 01DC7E34 2C44040C */  jal         fptosi
/* 01C138 01DC7E38 00000000 */   nop
/* 01C13C 01DC7E3C 8402A2AF */  sw          $2, 0x284($29)
/* 01C140 01DC7E40 B2000224 */  addiu       $2, $0, 0xB2
/* 01C144 01DC7E44 23105100 */  subu        $2, $2, $17
/* 01C148 01DC7E48 8802A2AF */  sw          $2, 0x288($29)
/* 01C14C 01DC7E4C 8C02A2AF */  sw          $2, 0x28C($29)
/* 01C150 01DC7E50 A0B8040C */  jal         GetVif1Packet__Fv
/* 01C154 01DC7E54 00000000 */   nop
/* 01C158 01DC7E58 288E4070 */  paddub      $17, $2, $0
/* 01C15C 01DC7E5C C701023C */  lui         $2, %hi(TexManager)
/* 01C160 01DC7E60 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01C164 01DC7E64 DE01023C */  lui         $2, %hi(LIT_1287__3)
/* 01C168 01DC7E68 40FE4524 */  addiu       $5, $2, %lo(LIT_1287__3)
/* 01C16C 01DC7E6C FFFF0624 */  addiu       $6, $0, -0x1
/* 01C170 01DC7E70 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 01C174 01DC7E74 00000000 */   nop
/* 01C178 01DC7E78 FF000832 */  andi        $8, $16, 0xFF
/* 01C17C 01DC7E7C 28262072 */  paddub      $4, $17, $0
/* 01C180 01DC7E80 282E4070 */  paddub      $5, $2, $0
/* 01C184 01DC7E84 8002A627 */  addiu       $6, $29, 0x280
/* 01C188 01DC7E88 9002A727 */  addiu       $7, $29, 0x290
/* 01C18C 01DC7E8C C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 01C190 01DC7E90 00000000 */   nop
/* 01C194 01DC7E94 6144023C */  lui         $2, (0x44610000 >> 16)
/* 01C198 01DC7E98 00088244 */  mtc1        $2, $f1
/* 01C19C 01DC7E9C 789B80C7 */  lwc1        $f0, -0x6488($28)
/* 01C1A0 01DC7EA0 010B0046 */  sub.s       $f12, $f1, $f0
/* 01C1A4 01DC7EA4 C8C2023C */  lui         $2, (0xC2C80000 >> 16)
/* 01C1A8 01DC7EA8 00088244 */  mtc1        $2, $f1
/* 01C1AC 01DC7EAC 809B80C7 */  lwc1        $f0, -0x6480($28)
/* 01C1B0 01DC7EB0 410B0046 */  sub.s       $f13, $f1, $f0
/* 01C1B4 01DC7EB4 5077040C */  jal         atan2f
/* 01C1B8 01DC7EB8 00000000 */   nop
/* 01C1BC 01DC7EBC 889B82C7 */  lwc1        $f2, -0x6478($28)
/* 01C1C0 01DC7EC0 34000246 */  c.lt.s      $f0, $f2
/* 01C1C4 01DC7EC4 00000000 */  nop
/* 01C1C8 01DC7EC8 04000045 */  bc1f        .L01DC7EDC_2CD6DC
/* 01C1CC 01DC7ECC 00000000 */   nop
/* 01C1D0 01DC7ED0 E08381C7 */  lwc1        $f1, -0x7C20($28)
/* 01C1D4 01DC7ED4 41100146 */  sub.s       $f1, $f2, $f1
/* 01C1D8 01DC7ED8 889B81E7 */  swc1        $f1, -0x6478($28)
.L01DC7EDC_2CD6DC:
/* 01C1DC 01DC7EDC 889B81C7 */  lwc1        $f1, -0x6478($28)
/* 01C1E0 01DC7EE0 36000146 */  c.le.s      $f0, $f1
/* 01C1E4 01DC7EE4 00000000 */  nop
/* 01C1E8 01DC7EE8 04000145 */  bc1t        .L01DC7EFC_2CD6FC
/* 01C1EC 01DC7EEC 00000000 */   nop
/* 01C1F0 01DC7EF0 E08380C7 */  lwc1        $f0, -0x7C20($28)
/* 01C1F4 01DC7EF4 00080046 */  add.s       $f0, $f1, $f0
/* 01C1F8 01DC7EF8 889B80E7 */  swc1        $f0, -0x6478($28)
.L01DC7EFC_2CD6FC:
/* 01C1FC 01DC7EFC 889B8CC7 */  lwc1        $f12, -0x6478($28)
/* 01C200 01DC7F00 9044040C */  jal         fptodp
/* 01C204 01DC7F04 00000000 */   nop
/* 01C208 01DC7F08 28264070 */  paddub      $4, $2, $0
/* 01C20C 01DC7F0C C474040C */  jal         sin
/* 01C210 01DC7F10 00000000 */   nop
/* 01C214 01DC7F14 1040033C */  lui         $3, (0x40100000 >> 16)
/* 01C218 01DC7F18 3C200300 */  dsll32      $4, $3, 0
/* 01C21C 01DC7F1C 282E4070 */  paddub      $5, $2, $0
/* 01C220 01DC7F20 9E3F040C */  jal         dpmul
/* 01C224 01DC7F24 00000000 */   nop
/* 01C228 01DC7F28 28264070 */  paddub      $4, $2, $0
/* 01C22C 01DC7F2C 9241040C */  jal         dptofp
/* 01C230 01DC7F30 00000000 */   nop
/* 01C234 01DC7F34 789B81C7 */  lwc1        $f1, -0x6488($28)
/* 01C238 01DC7F38 00080046 */  add.s       $f0, $f1, $f0
/* 01C23C 01DC7F3C 789B80E7 */  swc1        $f0, -0x6488($28)
/* 01C240 01DC7F40 889B8CC7 */  lwc1        $f12, -0x6478($28)
/* 01C244 01DC7F44 9044040C */  jal         fptodp
/* 01C248 01DC7F48 00000000 */   nop
/* 01C24C 01DC7F4C 28264070 */  paddub      $4, $2, $0
/* 01C250 01DC7F50 F473040C */  jal         cos
/* 01C254 01DC7F54 00000000 */   nop
/* 01C258 01DC7F58 1040033C */  lui         $3, (0x40100000 >> 16)
/* 01C25C 01DC7F5C 3C200300 */  dsll32      $4, $3, 0
/* 01C260 01DC7F60 282E4070 */  paddub      $5, $2, $0
/* 01C264 01DC7F64 9E3F040C */  jal         dpmul
/* 01C268 01DC7F68 00000000 */   nop
/* 01C26C 01DC7F6C 28264070 */  paddub      $4, $2, $0
/* 01C270 01DC7F70 9241040C */  jal         dptofp
/* 01C274 01DC7F74 00000000 */   nop
/* 01C278 01DC7F78 809B81C7 */  lwc1        $f1, -0x6480($28)
/* 01C27C 01DC7F7C 000D0046 */  add.s       $f20, $f1, $f0
/* 01C280 01DC7F80 809B94E7 */  swc1        $f20, -0x6480($28)
/* 01C284 01DC7F84 0042023C */  lui         $2, (0x42000000 >> 16)
/* 01C288 01DC7F88 00008244 */  mtc1        $2, $f0
/* 01C28C 01DC7F8C 00000000 */  nop
/* 01C290 01DC7F90 34A00046 */  c.lt.s      $f20, $f0
/* 01C294 01DC7F94 00000000 */  nop
/* 01C298 01DC7F98 0E000045 */  bc1f        .L01DC7FD4_2CD7D4
/* 01C29C 01DC7F9C 00000000 */   nop
/* 01C2A0 01DC7FA0 8040023C */  lui         $2, (0x40800000 >> 16)
/* 01C2A4 01DC7FA4 00088244 */  mtc1        $2, $f1
/* 01C2A8 01DC7FA8 00000000 */  nop
/* 01C2AC 01DC7FAC 01001446 */  sub.s       $f0, $f0, $f20
/* 01C2B0 01DC7FB0 42080046 */  mul.s       $f1, $f1, $f0
/* 01C2B4 01DC7FB4 0043023C */  lui         $2, (0x43000000 >> 16)
/* 01C2B8 01DC7FB8 00008244 */  mtc1        $2, $f0
/* 01C2BC 01DC7FBC 00000000 */  nop
/* 01C2C0 01DC7FC0 01030146 */  sub.s       $f12, $f0, $f1
/* 01C2C4 01DC7FC4 2C44040C */  jal         fptosi
/* 01C2C8 01DC7FC8 00000000 */   nop
/* 01C2CC 01DC7FCC 02000010 */  b           .L01DC7FD8_2CD7D8
/* 01C2D0 01DC7FD0 00000000 */   nop
.L01DC7FD4_2CD7D4:
/* 01C2D4 01DC7FD4 80000224 */  addiu       $2, $0, 0x80
.L01DC7FD8_2CD7D8:
/* 01C2D8 01DC7FD8 28864070 */  paddub      $16, $2, $0
/* 01C2DC 01DC7FDC 02000106 */  bgez        $16, .L01DC7FE8_2CD7E8
/* 01C2E0 01DC7FE0 00000000 */   nop
/* 01C2E4 01DC7FE4 28860070 */  paddub      $16, $0, $0
.L01DC7FE8_2CD7E8:
/* 01C2E8 01DC7FE8 00008044 */  mtc1        $0, $f0
/* 01C2EC 01DC7FEC 00000000 */  nop
/* 01C2F0 01DC7FF0 36A00046 */  c.le.s      $f20, $f0
/* 01C2F4 01DC7FF4 00000000 */  nop
/* 01C2F8 01DC7FF8 05000045 */  bc1f        .L01DC8010_2CD810
/* 01C2FC 01DC7FFC 00000000 */   nop
/* 01C300 01DC8000 B543023C */  lui         $2, (0x43B50000 >> 16)
/* 01C304 01DC8004 789B82AF */  sw          $2, -0x6488($28)
/* 01C308 01DC8008 6543023C */  lui         $2, (0x43650000 >> 16)
/* 01C30C 01DC800C 809B82AF */  sw          $2, -0x6480($28)
.L01DC8010_2CD810:
/* 01C310 01DC8010 6543023C */  lui         $2, (0x43650000 >> 16)
/* 01C314 01DC8014 00008244 */  mtc1        $2, $f0
/* 01C318 01DC8018 809B94C7 */  lwc1        $f20, -0x6480($28)
/* 01C31C 01DC801C 41001446 */  sub.s       $f1, $f0, $f20
/* 01C320 01DC8020 0040023C */  lui         $2, (0x40000000 >> 16)
/* 01C324 01DC8024 00008244 */  mtc1        $2, $f0
/* 01C328 01DC8028 00000000 */  nop
/* 01C32C 01DC802C 030B0046 */  div.s       $f12, $f1, $f0
/* 01C330 01DC8030 2C44040C */  jal         fptosi
/* 01C334 01DC8034 00000000 */   nop
/* 01C338 01DC8038 288E4070 */  paddub      $17, $2, $0
/* 01C33C 01DC803C D2000224 */  addiu       $2, $0, 0xD2
/* 01C340 01DC8040 B002A2AF */  sw          $2, 0x2B0($29)
/* 01C344 01DC8044 B402A0AF */  sw          $0, 0x2B4($29)
/* 01C348 01DC8048 B2000224 */  addiu       $2, $0, 0xB2
/* 01C34C 01DC804C B802A2AF */  sw          $2, 0x2B8($29)
/* 01C350 01DC8050 BC02A2AF */  sw          $2, 0x2BC($29)
/* 01C354 01DC8054 06A30046 */  mov.s       $f12, $f20
/* 01C358 01DC8058 2C44040C */  jal         fptosi
/* 01C35C 01DC805C 00000000 */   nop
/* 01C360 01DC8060 789B95C7 */  lwc1        $f21, -0x6488($28)
/* 01C364 01DC8064 06AB0046 */  mov.s       $f12, $f21
/* 01C368 01DC8068 2C44040C */  jal         fptosi
/* 01C36C 01DC806C 00000000 */   nop
/* 01C370 01DC8070 06AB0046 */  mov.s       $f12, $f21
/* 01C374 01DC8074 2C44040C */  jal         fptosi
/* 01C378 01DC8078 00000000 */   nop
/* 01C37C 01DC807C A002A2AF */  sw          $2, 0x2A0($29)
/* 01C380 01DC8080 06A30046 */  mov.s       $f12, $f20
/* 01C384 01DC8084 2C44040C */  jal         fptosi
/* 01C388 01DC8088 00000000 */   nop
/* 01C38C 01DC808C A402A2AF */  sw          $2, 0x2A4($29)
/* 01C390 01DC8090 B2000224 */  addiu       $2, $0, 0xB2
/* 01C394 01DC8094 23105100 */  subu        $2, $2, $17
/* 01C398 01DC8098 A802A2AF */  sw          $2, 0x2A8($29)
/* 01C39C 01DC809C AC02A2AF */  sw          $2, 0x2AC($29)
/* 01C3A0 01DC80A0 A0B8040C */  jal         GetVif1Packet__Fv
/* 01C3A4 01DC80A4 00000000 */   nop
/* 01C3A8 01DC80A8 288E4070 */  paddub      $17, $2, $0
/* 01C3AC 01DC80AC C701023C */  lui         $2, %hi(TexManager)
/* 01C3B0 01DC80B0 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01C3B4 01DC80B4 DE01023C */  lui         $2, %hi(LIT_1287__3)
/* 01C3B8 01DC80B8 40FE4524 */  addiu       $5, $2, %lo(LIT_1287__3)
/* 01C3BC 01DC80BC FFFF0624 */  addiu       $6, $0, -0x1
/* 01C3C0 01DC80C0 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 01C3C4 01DC80C4 00000000 */   nop
/* 01C3C8 01DC80C8 FF000832 */  andi        $8, $16, 0xFF
/* 01C3CC 01DC80CC 28262072 */  paddub      $4, $17, $0
/* 01C3D0 01DC80D0 282E4070 */  paddub      $5, $2, $0
/* 01C3D4 01DC80D4 A002A627 */  addiu       $6, $29, 0x2A0
/* 01C3D8 01DC80D8 B002A727 */  addiu       $7, $29, 0x2B0
/* 01C3DC 01DC80DC C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 01C3E0 01DC80E0 00000000 */   nop
.L01DC80E4_2CD8E4:
/* 01C3E4 01DC80E4 949B8283 */  lb          $2, -0x646C($28)
/* 01C3E8 01DC80E8 05004014 */  bnez        $2, .L01DC8100_2CD900
/* 01C3EC 01DC80EC 00000000 */   nop
/* 01C3F0 01DC80F0 D543023C */  lui         $2, (0x43D50000 >> 16)
/* 01C3F4 01DC80F4 909B82AF */  sw          $2, -0x6470($28)
/* 01C3F8 01DC80F8 01000224 */  addiu       $2, $0, 0x1
/* 01C3FC 01DC80FC 949B82A3 */  sb          $2, -0x646C($28)
.L01DC8100_2CD900:
/* 01C400 01DC8100 9C9B8283 */  lb          $2, -0x6464($28)
/* 01C404 01DC8104 05004014 */  bnez        $2, .L01DC811C_2CD91C
/* 01C408 01DC8108 00000000 */   nop
/* 01C40C 01DC810C 4EC3023C */  lui         $2, (0xC34E0000 >> 16)
/* 01C410 01DC8110 989B82AF */  sw          $2, -0x6468($28)
/* 01C414 01DC8114 01000224 */  addiu       $2, $0, 0x1
/* 01C418 01DC8118 9C9B82A3 */  sb          $2, -0x6464($28)
.L01DC811C_2CD91C:
/* 01C41C 01DC811C A49B8283 */  lb          $2, -0x645C($28)
/* 01C420 01DC8120 08004014 */  bnez        $2, .L01DC8144_2CD944
/* 01C424 01DC8124 00000000 */   nop
/* 01C428 01DC8128 D6020224 */  addiu       $2, $0, 0x2D6
/* 01C42C 01DC812C 00008244 */  mtc1        $2, $f0
/* 01C430 01DC8130 00000000 */  nop
/* 01C434 01DC8134 20008046 */  cvt.s.w     $f0, $f0
/* 01C438 01DC8138 A09B80E7 */  swc1        $f0, -0x6460($28)
/* 01C43C 01DC813C 01000224 */  addiu       $2, $0, 0x1
/* 01C440 01DC8140 A49B82A3 */  sb          $2, -0x645C($28)
.L01DC8144_2CD944:
/* 01C444 01DC8144 AC9B8283 */  lb          $2, -0x6454($28)
/* 01C448 01DC8148 05004014 */  bnez        $2, .L01DC8160_2CD960
/* 01C44C 01DC814C 00000000 */   nop
/* 01C450 01DC8150 99C3023C */  lui         $2, (0xC3990000 >> 16)
/* 01C454 01DC8154 A89B82AF */  sw          $2, -0x6458($28)
/* 01C458 01DC8158 01000224 */  addiu       $2, $0, 0x1
/* 01C45C 01DC815C AC9B82A3 */  sb          $2, -0x6454($28)
.L01DC8160_2CD960:
/* 01C460 01DC8160 3443023C */  lui         $2, (0x43340000 >> 16)
/* 01C464 01DC8164 00088244 */  mtc1        $2, $f1
/* 01C468 01DC8168 989B80C7 */  lwc1        $f0, -0x6468($28)
/* 01C46C 01DC816C 410B0046 */  sub.s       $f13, $f1, $f0
/* 01C470 01DC8170 2042023C */  lui         $2, (0x42200000 >> 16)
/* 01C474 01DC8174 00088244 */  mtc1        $2, $f1
/* 01C478 01DC8178 909B80C7 */  lwc1        $f0, -0x6470($28)
/* 01C47C 01DC817C 010B0046 */  sub.s       $f12, $f1, $f0
/* 01C480 01DC8180 5077040C */  jal         atan2f
/* 01C484 01DC8184 00000000 */   nop
/* 01C488 01DC8188 06050046 */  mov.s       $f20, $f0
/* 01C48C 01DC818C 06A30046 */  mov.s       $f12, $f20
/* 01C490 01DC8190 9044040C */  jal         fptodp
/* 01C494 01DC8194 00000000 */   nop
/* 01C498 01DC8198 28264070 */  paddub      $4, $2, $0
/* 01C49C 01DC819C C474040C */  jal         sin
/* 01C4A0 01DC81A0 00000000 */   nop
/* 01C4A4 01DC81A4 0840033C */  lui         $3, (0x40080000 >> 16)
/* 01C4A8 01DC81A8 3C200300 */  dsll32      $4, $3, 0
/* 01C4AC 01DC81AC 282E4070 */  paddub      $5, $2, $0
/* 01C4B0 01DC81B0 9E3F040C */  jal         dpmul
/* 01C4B4 01DC81B4 00000000 */   nop
/* 01C4B8 01DC81B8 28264070 */  paddub      $4, $2, $0
/* 01C4BC 01DC81BC 9241040C */  jal         dptofp
/* 01C4C0 01DC81C0 00000000 */   nop
/* 01C4C4 01DC81C4 909B81C7 */  lwc1        $f1, -0x6470($28)
/* 01C4C8 01DC81C8 00080046 */  add.s       $f0, $f1, $f0
/* 01C4CC 01DC81CC 909B80E7 */  swc1        $f0, -0x6470($28)
/* 01C4D0 01DC81D0 06A30046 */  mov.s       $f12, $f20
/* 01C4D4 01DC81D4 9044040C */  jal         fptodp
/* 01C4D8 01DC81D8 00000000 */   nop
/* 01C4DC 01DC81DC 28264070 */  paddub      $4, $2, $0
/* 01C4E0 01DC81E0 F473040C */  jal         cos
/* 01C4E4 01DC81E4 00000000 */   nop
/* 01C4E8 01DC81E8 0840033C */  lui         $3, (0x40080000 >> 16)
/* 01C4EC 01DC81EC 3C200300 */  dsll32      $4, $3, 0
/* 01C4F0 01DC81F0 282E4070 */  paddub      $5, $2, $0
/* 01C4F4 01DC81F4 9E3F040C */  jal         dpmul
/* 01C4F8 01DC81F8 00000000 */   nop
/* 01C4FC 01DC81FC 28264070 */  paddub      $4, $2, $0
/* 01C500 01DC8200 9241040C */  jal         dptofp
/* 01C504 01DC8204 00000000 */   nop
/* 01C508 01DC8208 989B81C7 */  lwc1        $f1, -0x6468($28)
/* 01C50C 01DC820C 000D0046 */  add.s       $f20, $f1, $f0
/* 01C510 01DC8210 989B94E7 */  swc1        $f20, -0x6468($28)
/* 01C514 01DC8214 1443023C */  lui         $2, (0x43140000 >> 16)
/* 01C518 01DC8218 00008244 */  mtc1        $2, $f0
/* 01C51C 01DC821C 00000000 */  nop
/* 01C520 01DC8220 36A00046 */  c.le.s      $f20, $f0
/* 01C524 01DC8224 00000000 */  nop
/* 01C528 01DC8228 12000145 */  bc1t        .L01DC8274_2CDA74
/* 01C52C 01DC822C 00000000 */   nop
/* 01C530 01DC8230 8040023C */  lui         $2, (0x40800000 >> 16)
/* 01C534 01DC8234 00088244 */  mtc1        $2, $f1
/* 01C538 01DC8238 00000000 */  nop
/* 01C53C 01DC823C 01A00046 */  sub.s       $f0, $f20, $f0
/* 01C540 01DC8240 42080046 */  mul.s       $f1, $f1, $f0
/* 01C544 01DC8244 0043023C */  lui         $2, (0x43000000 >> 16)
/* 01C548 01DC8248 00008244 */  mtc1        $2, $f0
/* 01C54C 01DC824C 00000000 */  nop
/* 01C550 01DC8250 01030146 */  sub.s       $f12, $f0, $f1
/* 01C554 01DC8254 2C44040C */  jal         fptosi
/* 01C558 01DC8258 00000000 */   nop
/* 01C55C 01DC825C 28864070 */  paddub      $16, $2, $0
/* 01C560 01DC8260 05000106 */  bgez        $16, .L01DC8278_2CDA78
/* 01C564 01DC8264 00000000 */   nop
/* 01C568 01DC8268 28860070 */  paddub      $16, $0, $0
/* 01C56C 01DC826C 02000010 */  b           .L01DC8278_2CDA78
/* 01C570 01DC8270 00000000 */   nop
.L01DC8274_2CDA74:
/* 01C574 01DC8274 80001024 */  addiu       $16, $0, 0x80
.L01DC8278_2CDA78:
/* 01C578 01DC8278 3243023C */  lui         $2, (0x43320000 >> 16)
/* 01C57C 01DC827C 00008244 */  mtc1        $2, $f0
/* 01C580 01DC8280 00000000 */  nop
/* 01C584 01DC8284 34A00046 */  c.lt.s      $f20, $f0
/* 01C588 01DC8288 00000000 */  nop
/* 01C58C 01DC828C 05000145 */  bc1t        .L01DC82A4_2CDAA4
/* 01C590 01DC8290 00000000 */   nop
/* 01C594 01DC8294 D543023C */  lui         $2, (0x43D50000 >> 16)
/* 01C598 01DC8298 909B82AF */  sw          $2, -0x6470($28)
/* 01C59C 01DC829C 4EC3023C */  lui         $2, (0xC34E0000 >> 16)
/* 01C5A0 01DC82A0 989B82AF */  sw          $2, -0x6468($28)
.L01DC82A4_2CDAA4:
/* 01C5A4 01DC82A4 D002A0AF */  sw          $0, 0x2D0($29)
/* 01C5A8 01DC82A8 D402A0AF */  sw          $0, 0x2D4($29)
/* 01C5AC 01DC82AC D2000224 */  addiu       $2, $0, 0xD2
/* 01C5B0 01DC82B0 D802A2AF */  sw          $2, 0x2D8($29)
/* 01C5B4 01DC82B4 CE000224 */  addiu       $2, $0, 0xCE
/* 01C5B8 01DC82B8 DC02A2AF */  sw          $2, 0x2DC($29)
/* 01C5BC 01DC82BC 989B95C7 */  lwc1        $f21, -0x6468($28)
/* 01C5C0 01DC82C0 06AB0046 */  mov.s       $f12, $f21
/* 01C5C4 01DC82C4 2C44040C */  jal         fptosi
/* 01C5C8 01DC82C8 00000000 */   nop
/* 01C5CC 01DC82CC 909B94C7 */  lwc1        $f20, -0x6470($28)
/* 01C5D0 01DC82D0 06A30046 */  mov.s       $f12, $f20
/* 01C5D4 01DC82D4 2C44040C */  jal         fptosi
/* 01C5D8 01DC82D8 00000000 */   nop
/* 01C5DC 01DC82DC 06A30046 */  mov.s       $f12, $f20
/* 01C5E0 01DC82E0 2C44040C */  jal         fptosi
/* 01C5E4 01DC82E4 00000000 */   nop
/* 01C5E8 01DC82E8 C002A2AF */  sw          $2, 0x2C0($29)
/* 01C5EC 01DC82EC 06AB0046 */  mov.s       $f12, $f21
/* 01C5F0 01DC82F0 2C44040C */  jal         fptosi
/* 01C5F4 01DC82F4 00000000 */   nop
/* 01C5F8 01DC82F8 C402A2AF */  sw          $2, 0x2C4($29)
/* 01C5FC 01DC82FC D2000224 */  addiu       $2, $0, 0xD2
/* 01C600 01DC8300 C802A2AF */  sw          $2, 0x2C8($29)
/* 01C604 01DC8304 CE000224 */  addiu       $2, $0, 0xCE
/* 01C608 01DC8308 CC02A2AF */  sw          $2, 0x2CC($29)
/* 01C60C 01DC830C A0B8040C */  jal         GetVif1Packet__Fv
/* 01C610 01DC8310 00000000 */   nop
/* 01C614 01DC8314 288E4070 */  paddub      $17, $2, $0
/* 01C618 01DC8318 C701023C */  lui         $2, %hi(TexManager)
/* 01C61C 01DC831C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01C620 01DC8320 DE01023C */  lui         $2, %hi(LIT_1287__3)
/* 01C624 01DC8324 40FE4524 */  addiu       $5, $2, %lo(LIT_1287__3)
/* 01C628 01DC8328 FFFF0624 */  addiu       $6, $0, -0x1
/* 01C62C 01DC832C B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 01C630 01DC8330 00000000 */   nop
/* 01C634 01DC8334 FF000832 */  andi        $8, $16, 0xFF
/* 01C638 01DC8338 28262072 */  paddub      $4, $17, $0
/* 01C63C 01DC833C 282E4070 */  paddub      $5, $2, $0
/* 01C640 01DC8340 C002A627 */  addiu       $6, $29, 0x2C0
/* 01C644 01DC8344 D002A727 */  addiu       $7, $29, 0x2D0
/* 01C648 01DC8348 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 01C64C 01DC834C 00000000 */   nop
/* 01C650 01DC8350 7043023C */  lui         $2, (0x43700000 >> 16)
/* 01C654 01DC8354 00088244 */  mtc1        $2, $f1
/* 01C658 01DC8358 A09B80C7 */  lwc1        $f0, -0x6460($28)
/* 01C65C 01DC835C 010B0046 */  sub.s       $f12, $f1, $f0
/* 01C660 01DC8360 3443023C */  lui         $2, (0x43340000 >> 16)
/* 01C664 01DC8364 00088244 */  mtc1        $2, $f1
/* 01C668 01DC8368 A89B80C7 */  lwc1        $f0, -0x6458($28)
/* 01C66C 01DC836C 410B0046 */  sub.s       $f13, $f1, $f0
/* 01C670 01DC8370 5077040C */  jal         atan2f
/* 01C674 01DC8374 00000000 */   nop
/* 01C678 01DC8378 06050046 */  mov.s       $f20, $f0
/* 01C67C 01DC837C 06A30046 */  mov.s       $f12, $f20
/* 01C680 01DC8380 9044040C */  jal         fptodp
/* 01C684 01DC8384 00000000 */   nop
/* 01C688 01DC8388 28264070 */  paddub      $4, $2, $0
/* 01C68C 01DC838C C474040C */  jal         sin
/* 01C690 01DC8390 00000000 */   nop
/* 01C694 01DC8394 0840033C */  lui         $3, (0x40080000 >> 16)
/* 01C698 01DC8398 3C200300 */  dsll32      $4, $3, 0
/* 01C69C 01DC839C 282E4070 */  paddub      $5, $2, $0
/* 01C6A0 01DC83A0 9E3F040C */  jal         dpmul
/* 01C6A4 01DC83A4 00000000 */   nop
/* 01C6A8 01DC83A8 28264070 */  paddub      $4, $2, $0
/* 01C6AC 01DC83AC 9241040C */  jal         dptofp
/* 01C6B0 01DC83B0 00000000 */   nop
/* 01C6B4 01DC83B4 A09B81C7 */  lwc1        $f1, -0x6460($28)
/* 01C6B8 01DC83B8 00080046 */  add.s       $f0, $f1, $f0
/* 01C6BC 01DC83BC A09B80E7 */  swc1        $f0, -0x6460($28)
/* 01C6C0 01DC83C0 06A30046 */  mov.s       $f12, $f20
/* 01C6C4 01DC83C4 9044040C */  jal         fptodp
/* 01C6C8 01DC83C8 00000000 */   nop
/* 01C6CC 01DC83CC 28264070 */  paddub      $4, $2, $0
/* 01C6D0 01DC83D0 F473040C */  jal         cos
/* 01C6D4 01DC83D4 00000000 */   nop
/* 01C6D8 01DC83D8 0840033C */  lui         $3, (0x40080000 >> 16)
/* 01C6DC 01DC83DC 3C200300 */  dsll32      $4, $3, 0
/* 01C6E0 01DC83E0 282E4070 */  paddub      $5, $2, $0
/* 01C6E4 01DC83E4 9E3F040C */  jal         dpmul
/* 01C6E8 01DC83E8 00000000 */   nop
/* 01C6EC 01DC83EC 28264070 */  paddub      $4, $2, $0
/* 01C6F0 01DC83F0 9241040C */  jal         dptofp
/* 01C6F4 01DC83F4 00000000 */   nop
/* 01C6F8 01DC83F8 A89B81C7 */  lwc1        $f1, -0x6458($28)
/* 01C6FC 01DC83FC 000D0046 */  add.s       $f20, $f1, $f0
/* 01C700 01DC8400 A89B94E7 */  swc1        $f20, -0x6458($28)
/* 01C704 01DC8404 1443023C */  lui         $2, (0x43140000 >> 16)
/* 01C708 01DC8408 00008244 */  mtc1        $2, $f0
/* 01C70C 01DC840C 00000000 */  nop
/* 01C710 01DC8410 36A00046 */  c.le.s      $f20, $f0
/* 01C714 01DC8414 00000000 */  nop
/* 01C718 01DC8418 12000145 */  bc1t        .L01DC8464_2CDC64
/* 01C71C 01DC841C 00000000 */   nop
/* 01C720 01DC8420 8040023C */  lui         $2, (0x40800000 >> 16)
/* 01C724 01DC8424 00088244 */  mtc1        $2, $f1
/* 01C728 01DC8428 00000000 */  nop
/* 01C72C 01DC842C 01A00046 */  sub.s       $f0, $f20, $f0
/* 01C730 01DC8430 42080046 */  mul.s       $f1, $f1, $f0
/* 01C734 01DC8434 0043023C */  lui         $2, (0x43000000 >> 16)
/* 01C738 01DC8438 00008244 */  mtc1        $2, $f0
/* 01C73C 01DC843C 00000000 */  nop
/* 01C740 01DC8440 01030146 */  sub.s       $f12, $f0, $f1
/* 01C744 01DC8444 2C44040C */  jal         fptosi
/* 01C748 01DC8448 00000000 */   nop
/* 01C74C 01DC844C 28864070 */  paddub      $16, $2, $0
/* 01C750 01DC8450 05000106 */  bgez        $16, .L01DC8468_2CDC68
/* 01C754 01DC8454 00000000 */   nop
/* 01C758 01DC8458 28860070 */  paddub      $16, $0, $0
/* 01C75C 01DC845C 02000010 */  b           .L01DC8468_2CDC68
/* 01C760 01DC8460 00000000 */   nop
.L01DC8464_2CDC64:
/* 01C764 01DC8464 80001024 */  addiu       $16, $0, 0x80
.L01DC8468_2CDC68:
/* 01C768 01DC8468 3243023C */  lui         $2, (0x43320000 >> 16)
/* 01C76C 01DC846C 00008244 */  mtc1        $2, $f0
/* 01C770 01DC8470 00000000 */  nop
/* 01C774 01DC8474 34A00046 */  c.lt.s      $f20, $f0
/* 01C778 01DC8478 00000000 */  nop
/* 01C77C 01DC847C 08000145 */  bc1t        .L01DC84A0_2CDCA0
/* 01C780 01DC8480 00000000 */   nop
/* 01C784 01DC8484 D6020224 */  addiu       $2, $0, 0x2D6
/* 01C788 01DC8488 00008244 */  mtc1        $2, $f0
/* 01C78C 01DC848C 00000000 */  nop
/* 01C790 01DC8490 20008046 */  cvt.s.w     $f0, $f0
/* 01C794 01DC8494 A09B80E7 */  swc1        $f0, -0x6460($28)
/* 01C798 01DC8498 99C3023C */  lui         $2, (0xC3990000 >> 16)
/* 01C79C 01DC849C A89B82AF */  sw          $2, -0x6458($28)
.L01DC84A0_2CDCA0:
/* 01C7A0 01DC84A0 F002A0AF */  sw          $0, 0x2F0($29)
/* 01C7A4 01DC84A4 F402A0AF */  sw          $0, 0x2F4($29)
/* 01C7A8 01DC84A8 D2000224 */  addiu       $2, $0, 0xD2
/* 01C7AC 01DC84AC F802A2AF */  sw          $2, 0x2F8($29)
/* 01C7B0 01DC84B0 CE000224 */  addiu       $2, $0, 0xCE
/* 01C7B4 01DC84B4 FC02A2AF */  sw          $2, 0x2FC($29)
/* 01C7B8 01DC84B8 A89B95C7 */  lwc1        $f21, -0x6458($28)
/* 01C7BC 01DC84BC 06AB0046 */  mov.s       $f12, $f21
/* 01C7C0 01DC84C0 2C44040C */  jal         fptosi
/* 01C7C4 01DC84C4 00000000 */   nop
/* 01C7C8 01DC84C8 A09B94C7 */  lwc1        $f20, -0x6460($28)
/* 01C7CC 01DC84CC 06A30046 */  mov.s       $f12, $f20
/* 01C7D0 01DC84D0 2C44040C */  jal         fptosi
/* 01C7D4 01DC84D4 00000000 */   nop
/* 01C7D8 01DC84D8 06A30046 */  mov.s       $f12, $f20
/* 01C7DC 01DC84DC 2C44040C */  jal         fptosi
/* 01C7E0 01DC84E0 00000000 */   nop
/* 01C7E4 01DC84E4 E002A2AF */  sw          $2, 0x2E0($29)
/* 01C7E8 01DC84E8 06AB0046 */  mov.s       $f12, $f21
/* 01C7EC 01DC84EC 2C44040C */  jal         fptosi
/* 01C7F0 01DC84F0 00000000 */   nop
/* 01C7F4 01DC84F4 E402A2AF */  sw          $2, 0x2E4($29)
/* 01C7F8 01DC84F8 D2000224 */  addiu       $2, $0, 0xD2
/* 01C7FC 01DC84FC E802A2AF */  sw          $2, 0x2E8($29)
/* 01C800 01DC8500 CE000224 */  addiu       $2, $0, 0xCE
/* 01C804 01DC8504 EC02A2AF */  sw          $2, 0x2EC($29)
/* 01C808 01DC8508 A0B8040C */  jal         GetVif1Packet__Fv
/* 01C80C 01DC850C 00000000 */   nop
/* 01C810 01DC8510 288E4070 */  paddub      $17, $2, $0
/* 01C814 01DC8514 C701023C */  lui         $2, %hi(TexManager)
/* 01C818 01DC8518 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01C81C 01DC851C DE01023C */  lui         $2, %hi(LIT_1287__3)
/* 01C820 01DC8520 40FE4524 */  addiu       $5, $2, %lo(LIT_1287__3)
/* 01C824 01DC8524 FFFF0624 */  addiu       $6, $0, -0x1
/* 01C828 01DC8528 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 01C82C 01DC852C 00000000 */   nop
/* 01C830 01DC8530 FF000832 */  andi        $8, $16, 0xFF
/* 01C834 01DC8534 28262072 */  paddub      $4, $17, $0
/* 01C838 01DC8538 282E4070 */  paddub      $5, $2, $0
/* 01C83C 01DC853C E002A627 */  addiu       $6, $29, 0x2E0
/* 01C840 01DC8540 F002A727 */  addiu       $7, $29, 0x2F0
/* 01C844 01DC8544 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 01C848 01DC8548 00000000 */   nop
/* 01C84C 01DC854C DE01013C */  lui         $1, %hi(CScript__2 + 0x14)
/* 01C850 01DC8550 141B248C */  lw          $4, %lo(CScript__2 + 0x14)($1)
/* 01C854 01DC8554 06000324 */  addiu       $3, $0, 0x6
/* 01C858 01DC8558 20008314 */  bne         $4, $3, .L01DC85DC_2CDDDC
/* 01C85C 01DC855C 00000000 */   nop
/* 01C860 01DC8560 B1000224 */  addiu       $2, $0, 0xB1
/* 01C864 01DC8564 1003A2AF */  sw          $2, 0x310($29)
/* 01C868 01DC8568 CE000424 */  addiu       $4, $0, 0xCE
/* 01C86C 01DC856C 1403A4AF */  sw          $4, 0x314($29)
/* 01C870 01DC8570 CF010324 */  addiu       $3, $0, 0x1CF
/* 01C874 01DC8574 1803A3AF */  sw          $3, 0x318($29)
/* 01C878 01DC8578 F2000224 */  addiu       $2, $0, 0xF2
/* 01C87C 01DC857C 1C03A2AF */  sw          $2, 0x31C($29)
/* 01C880 01DC8580 28000224 */  addiu       $2, $0, 0x28
/* 01C884 01DC8584 0003A2AF */  sw          $2, 0x300($29)
/* 01C888 01DC8588 B4000224 */  addiu       $2, $0, 0xB4
/* 01C88C 01DC858C 0403A2AF */  sw          $2, 0x304($29)
/* 01C890 01DC8590 0803A3AF */  sw          $3, 0x308($29)
/* 01C894 01DC8594 0C03A4AF */  sw          $4, 0x30C($29)
/* 01C898 01DC8598 A0B8040C */  jal         GetVif1Packet__Fv
/* 01C89C 01DC859C 00000000 */   nop
/* 01C8A0 01DC85A0 28864070 */  paddub      $16, $2, $0
/* 01C8A4 01DC85A4 C701023C */  lui         $2, %hi(TexManager)
/* 01C8A8 01DC85A8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01C8AC 01DC85AC DE01023C */  lui         $2, %hi(LIT_1287__3)
/* 01C8B0 01DC85B0 40FE4524 */  addiu       $5, $2, %lo(LIT_1287__3)
/* 01C8B4 01DC85B4 FFFF0624 */  addiu       $6, $0, -0x1
/* 01C8B8 01DC85B8 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 01C8BC 01DC85BC 00000000 */   nop
/* 01C8C0 01DC85C0 209B8893 */  lbu         $8, -0x64E0($28)
/* 01C8C4 01DC85C4 28260072 */  paddub      $4, $16, $0
/* 01C8C8 01DC85C8 282E4070 */  paddub      $5, $2, $0
/* 01C8CC 01DC85CC 0003A627 */  addiu       $6, $29, 0x300
/* 01C8D0 01DC85D0 1003A727 */  addiu       $7, $29, 0x310
/* 01C8D4 01DC85D4 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 01C8D8 01DC85D8 00000000 */   nop
.L01DC85DC_2CDDDC:
/* 01C8DC 01DC85DC 3000BF7B */  lq          $31, 0x30($29)
/* 01C8E0 01DC85E0 2000B17B */  lq          $17, 0x20($29)
/* 01C8E4 01DC85E4 1000B07B */  lq          $16, 0x10($29)
/* 01C8E8 01DC85E8 0400B5C7 */  lwc1        $f21, 0x4($29)
/* 01C8EC 01DC85EC 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 01C8F0 01DC85F0 2003BD27 */  addiu       $29, $29, 0x320
/* 01C8F4 01DC85F4 0800E003 */  jr          $31
/* 01C8F8 01DC85F8 00000000 */   nop
/* 01C8FC 01DC85FC 00000000 */  nop
