.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitCDFile__Fv
/* 3F310 0013F210 FBFF013C */  lui        $at, (0xFFFB4FB0 >> 16)
/* 3F314 0013F214 B04F2134 */  ori        $at, $at, (0xFFFB4FB0 & 0xFFFF)
/* 3F318 0013F218 21E8A103 */  addu       $sp, $sp, $at
/* 3F31C 0013F21C 2000BF7F */  sq         $31, 0x20($sp)
/* 3F320 0013F220 1000B17F */  sq         $17, 0x10($sp)
/* 3F324 0013F224 0000B07F */  sq         $16, 0x0($sp)
/* 3F328 0013F228 F88C80AF */  sw         $0, -0x7308($gp)
.L0013F22C:
/* 3F32C 0013F22C 0400013C */  lui        $at, (0x4B030 >> 16)
/* 3F330 0013F230 30B02134 */  ori        $at, $at, (0x4B030 & 0xFFFF)
/* 3F334 0013F234 2120A103 */  addu       $4, $sp, $at
/* 3F338 0013F238 2A00023C */  lui        $2, %hi(_387)
/* 3F33C 0013F23C E8904524 */  addiu      $5, $2, %lo(_387)
/* 3F340 0013F240 2A27040C */  jal        sceCdSearchFile
/* 3F344 0013F244 00000000 */   nop
/* 3F348 0013F248 F8FF4010 */  beqz       $2, .L0013F22C
/* 3F34C 0013F24C 00000000 */   nop
/* 3F350 0013F250 28260070 */  paddub     $4, $0, $0
/* 3F354 0013F254 662B040C */  jal        sceCdSync
/* 3F358 0013F258 00000000 */   nop
/* 3F35C 0013F25C BE2D040C */  jal        sceCdGetError
/* 3F360 0013F260 00000000 */   nop
/* 3F364 0013F264 F1FF4014 */  bnez       $2, .L0013F22C
/* 3F368 0013F268 00000000 */   nop
/* 3F36C 0013F26C 0500013C */  lui        $at, (0x50000 >> 16)
/* 3F370 0013F270 2108A103 */  addu       $at, $sp, $at
/* 3F374 0013F274 30B0228C */  lw         $2, -0x4FD0($at)
/* 3F378 0013F278 008D82AF */  sw         $2, -0x7300($gp)
/* 3F37C 0013F27C 2A00023C */  lui        $2, %hi(_388)
/* 3F380 0013F280 00914424 */  addiu      $4, $2, %lo(_388)
/* 3F384 0013F284 01000524 */  addiu      $5, $0, 0x1
/* 3F388 0013F288 865F040C */  jal        sceOpen
/* 3F38C 0013F28C 00000000 */   nop
/* 3F390 0013F290 28864070 */  paddub     $16, $2, $0
/* 3F394 0013F294 0C000106 */  bgez       $16, .L0013F2C8
/* 3F398 0013F298 00000000 */   nop
/* 3F39C 0013F29C 2A00023C */  lui        $2, %hi(_389)
/* 3F3A0 0013F2A0 20914424 */  addiu      $4, $2, %lo(_389)
/* 3F3A4 0013F2A4 A611040C */  jal        printf
/* 3F3A8 0013F2A8 00000000 */   nop
/* 3F3AC 0013F2AC 2A00023C */  lui        $2, %hi(_390)
/* 3F3B0 0013F2B0 38914424 */  addiu      $4, $2, %lo(_390)
/* 3F3B4 0013F2B4 2C020524 */  addiu      $5, $0, 0x22C
/* 3F3B8 0013F2B8 2A00023C */  lui        $2, %hi(_391)
/* 3F3BC 0013F2BC 40914624 */  addiu      $6, $2, %lo(_391)
/* 3F3C0 0013F2C0 7800040C */  jal        __assert
/* 3F3C4 0013F2C4 00000000 */   nop
.L0013F2C8:
/* 3F3C8 0013F2C8 28260072 */  paddub     $4, $16, $0
/* 3F3CC 0013F2CC 282E0070 */  paddub     $5, $0, $0
/* 3F3D0 0013F2D0 02000624 */  addiu      $6, $0, 0x2
/* 3F3D4 0013F2D4 3460040C */  jal        sceLseek
/* 3F3D8 0013F2D8 00000000 */   nop
/* 3F3DC 0013F2DC 288E4070 */  paddub     $17, $2, $0
/* 3F3E0 0013F2E0 28260072 */  paddub     $4, $16, $0
/* 3F3E4 0013F2E4 282E0070 */  paddub     $5, $0, $0
/* 3F3E8 0013F2E8 28360070 */  paddub     $6, $0, $0
/* 3F3EC 0013F2EC 3460040C */  jal        sceLseek
/* 3F3F0 0013F2F0 00000000 */   nop
/* 3F3F4 0013F2F4 28260072 */  paddub     $4, $16, $0
/* 3F3F8 0013F2F8 3000A527 */  addiu      $5, $sp, 0x30
/* 3F3FC 0013F2FC 28362072 */  paddub     $6, $17, $0
/* 3F400 0013F300 AE60040C */  jal        sceRead
/* 3F404 0013F304 00000000 */   nop
/* 3F408 0013F308 28260072 */  paddub     $4, $16, $0
/* 3F40C 0013F30C F65F040C */  jal        sceClose
/* 3F410 0013F310 00000000 */   nop
/* 3F414 0013F314 C801023C */  lui        $2, %hi(header_buff)
/* 3F418 0013F318 C0B04624 */  addiu      $6, $2, %lo(header_buff)
/* 3F41C 0013F31C 3000A427 */  addiu      $4, $sp, 0x30
/* 3F420 0013F320 0400053C */  lui        $5, (0x40000 >> 16)
/* 3F424 0013F324 F4FB040C */  jal        create_word_tree__FPciPc
/* 3F428 0013F328 00000000 */   nop
/* 3F42C 0013F32C 2000BF7B */  lq         $31, 0x20($sp)
/* 3F430 0013F330 1000B17B */  lq         $17, 0x10($sp)
/* 3F434 0013F334 0000B07B */  lq         $16, 0x0($sp)
/* 3F438 0013F338 0400013C */  lui        $at, (0x4B050 >> 16)
/* 3F43C 0013F33C 50B02134 */  ori        $at, $at, (0x4B050 & 0xFFFF)
/* 3F440 0013F340 21E8A103 */  addu       $sp, $sp, $at
/* 3F444 0013F344 0800E003 */  jr         $31
/* 3F448 0013F348 00000000 */   nop
/* 3F44C 0013F34C 00000000 */  nop
