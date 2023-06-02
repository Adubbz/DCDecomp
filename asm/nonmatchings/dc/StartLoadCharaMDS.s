.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StartLoadCharaMDS__FP1ii
/* 10E2A0 0020E1A0 50FFBD27 */  addiu      $sp, $sp, -0xB0
/* 10E2A4 0020E1A4 3000BF7F */  sq         $31, 0x30($sp)
/* 10E2A8 0020E1A8 2000B27F */  sq         $18, 0x20($sp)
/* 10E2AC 0020E1AC 1000B17F */  sq         $17, 0x10($sp)
/* 10E2B0 0020E1B0 0000B07F */  sq         $16, 0x0($sp)
/* 10E2B4 0020E1B4 28968070 */  paddub     $18, $4, $0
/* 10E2B8 0020E1B8 288EA070 */  paddub     $17, $5, $0
/* 10E2BC 0020E1BC 2886C070 */  paddub     $16, $6, $0
/* 10E2C0 0020E1C0 7CAE080C */  jal        GetMenuTextureDir__Fv
/* 10E2C4 0020E1C4 00000000 */   nop
/* 10E2C8 0020E1C8 4000A427 */  addiu      $4, $sp, 0x40
/* 10E2CC 0020E1CC 282E4070 */  paddub     $5, $2, $0
/* 10E2D0 0020E1D0 5A15040C */  jal        strcpy
/* 10E2D4 0020E1D4 00000000 */   nop
/* 10E2D8 0020E1D8 4000A427 */  addiu      $4, $sp, 0x40
/* 10E2DC 0020E1DC 2A00023C */  lui        $2, %hi(_1176)
/* 10E2E0 0020E1E0 50E04524 */  addiu      $5, $2, %lo(_1176)
/* 10E2E4 0020E1E4 BC14040C */  jal        strcat
/* 10E2E8 0020E1E8 00000000 */   nop
/* 10E2EC 0020E1EC 01002626 */  addiu      $6, $17, 0x1
/* 10E2F0 0020E1F0 8000A427 */  addiu      $4, $sp, 0x80
/* 10E2F4 0020E1F4 2A00023C */  lui        $2, %hi(_1177)
/* 10E2F8 0020E1F8 60E04524 */  addiu      $5, $2, %lo(_1177)
/* 10E2FC 0020E1FC 1614040C */  jal        sprintf
/* 10E300 0020E200 00000000 */   nop
/* 10E304 0020E204 4000A427 */  addiu      $4, $sp, 0x40
/* 10E308 0020E208 8000A527 */  addiu      $5, $sp, 0x80
/* 10E30C 0020E20C BC14040C */  jal        strcat
/* 10E310 0020E210 00000000 */   nop
/* 10E314 0020E214 28264072 */  paddub     $4, $18, $0
/* 10E318 0020E218 00AF080C */  jal        MenuCalcBufAlignment__FP1
/* 10E31C 0020E21C 00000000 */   nop
/* 10E320 0020E220 28964070 */  paddub     $18, $2, $0
/* 10E324 0020E224 F49590AF */  sw         $16, -0x6A0C($gp)
/* 10E328 0020E228 03000016 */  bnez       $16, .L0020E238
/* 10E32C 0020E22C 00000000 */   nop
/* 10E330 0020E230 30FB040C */  jal        StartReadBG__Fv
/* 10E334 0020E234 00000000 */   nop
.L0020E238:
/* 10E338 0020E238 4000A427 */  addiu      $4, $sp, 0x40
/* 10E33C 0020E23C 282E4072 */  paddub     $5, $18, $0
/* 10E340 0020E240 AC00A627 */  addiu      $6, $sp, 0xAC
/* 10E344 0020E244 ACFA040C */  jal        LoadFileBG__FPcP1Pi
/* 10E348 0020E248 00000000 */   nop
/* 10E34C 0020E24C 04004014 */  bnez       $2, .L0020E260
/* 10E350 0020E250 00000000 */   nop
/* 10E354 0020E254 01000224 */  addiu      $2, $0, 0x1
/* 10E358 0020E258 02000010 */  b          .L0020E264
/* 10E35C 0020E25C 00000000 */   nop
.L0020E260:
/* 10E360 0020E260 28160070 */  paddub     $2, $0, $0
.L0020E264:
/* 10E364 0020E264 3000BF7B */  lq         $31, 0x30($sp)
/* 10E368 0020E268 2000B27B */  lq         $18, 0x20($sp)
/* 10E36C 0020E26C 1000B17B */  lq         $17, 0x10($sp)
/* 10E370 0020E270 0000B07B */  lq         $16, 0x0($sp)
/* 10E374 0020E274 B000BD27 */  addiu      $sp, $sp, 0xB0
/* 10E378 0020E278 0800E003 */  jr         $31
/* 10E37C 0020E27C 00000000 */   nop
