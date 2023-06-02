.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawMenuVibeItem__Fiiiii
/* 12E280 0022E180 60FFBD27 */  addiu      $sp, $sp, -0xA0
/* 12E284 0022E184 6000BF7F */  sq         $31, 0x60($sp)
/* 12E288 0022E188 5000B57F */  sq         $21, 0x50($sp)
/* 12E28C 0022E18C 4000B47F */  sq         $20, 0x40($sp)
/* 12E290 0022E190 3000B37F */  sq         $19, 0x30($sp)
/* 12E294 0022E194 2000B27F */  sq         $18, 0x20($sp)
/* 12E298 0022E198 1000B17F */  sq         $17, 0x10($sp)
/* 12E29C 0022E19C 0000B07F */  sq         $16, 0x0($sp)
/* 12E2A0 0022E1A0 28AE8070 */  paddub     $21, $4, $0
/* 12E2A4 0022E1A4 28A6A070 */  paddub     $20, $5, $0
/* 12E2A8 0022E1A8 21808600 */  addu       $16, $4, $6
/* 12E2AC 0022E1AC 2188A700 */  addu       $17, $5, $7
/* 12E2B0 0022E1B0 A897828F */  lw         $2, -0x6858($gp)
/* 12E2B4 0022E1B4 40005284 */  lh         $18, 0x40($2)
/* 12E2B8 0022E1B8 80000224 */  addiu      $2, $0, 0x80
/* 12E2BC 0022E1BC 7000A2AF */  sw         $2, 0x70($sp)
/* 12E2C0 0022E1C0 28000224 */  addiu      $2, $0, 0x28
/* 12E2C4 0022E1C4 7400A2AF */  sw         $2, 0x74($sp)
/* 12E2C8 0022E1C8 20000224 */  addiu      $2, $0, 0x20
/* 12E2CC 0022E1CC 7800A2AF */  sw         $2, 0x78($sp)
/* 12E2D0 0022E1D0 7C00A2AF */  sw         $2, 0x7C($sp)
/* 12E2D4 0022E1D4 28264072 */  paddub     $4, $18, $0
/* 12E2D8 0022E1D8 9800A527 */  addiu      $5, $sp, 0x98
/* 12E2DC 0022E1DC 9C00A627 */  addiu      $6, $sp, 0x9C
/* 12E2E0 0022E1E0 64B7080C */  jal        RetCTex__FsRiRi
/* 12E2E4 0022E1E4 00000000 */   nop
/* 12E2E8 0022E1E8 289E4070 */  paddub     $19, $2, $0
/* 12E2EC 0022E1EC 3C006012 */  beqz       $19, .L0022E2E0
/* 12E2F0 0022E1F0 00000000 */   nop
/* 12E2F4 0022E1F4 C701023C */  lui        $2, %hi(TexManager)
/* 12E2F8 0022E1F8 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 12E2FC 0022E1FC 2A00023C */  lui        $2, %hi(_994_2)
/* 12E300 0022E200 C0F14524 */  addiu      $5, $2, %lo(_994_2)
/* 12E304 0022E204 FFFF0624 */  addiu      $6, $0, -0x1
/* 12E308 0022E208 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 12E30C 0022E20C 00000000 */   nop
/* 12E310 0022E210 0400A426 */  addiu      $4, $21, 0x4
/* 12E314 0022E214 02008526 */  addiu      $5, $20, 0x2
/* 12E318 0022E218 28364070 */  paddub     $6, $2, $0
/* 12E31C 0022E21C 7000A727 */  addiu      $7, $sp, 0x70
/* 12E320 0022E220 28460070 */  paddub     $8, $0, $0
/* 12E324 0022E224 50000924 */  addiu      $9, $0, 0x50
/* 12E328 0022E228 645B080C */  jal        DrawObjectVibe__FiiP8CTexture8CRect_i_Uci
/* 12E32C 0022E22C 00000000 */   nop
/* 12E330 0022E230 9C00A38F */  lw         $3, 0x9C($sp)
/* 12E334 0022E234 9800A28F */  lw         $2, 0x98($sp)
/* 12E338 0022E238 8000A2AF */  sw         $2, 0x80($sp)
/* 12E33C 0022E23C 8400A3AF */  sw         $3, 0x84($sp)
/* 12E340 0022E240 20000224 */  addiu      $2, $0, 0x20
/* 12E344 0022E244 8800A2AF */  sw         $2, 0x88($sp)
/* 12E348 0022E248 8C00A2AF */  sw         $2, 0x8C($sp)
/* 12E34C 0022E24C 04000426 */  addiu      $4, $16, 0x4
/* 12E350 0022E250 02002526 */  addiu      $5, $17, 0x2
/* 12E354 0022E254 28366072 */  paddub     $6, $19, $0
/* 12E358 0022E258 8000A727 */  addiu      $7, $sp, 0x80
/* 12E35C 0022E25C 28460070 */  paddub     $8, $0, $0
/* 12E360 0022E260 50000924 */  addiu      $9, $0, 0x50
/* 12E364 0022E264 645B080C */  jal        DrawObjectVibe__FiiP8CTexture8CRect_i_Uci
/* 12E368 0022E268 00000000 */   nop
/* 12E36C 0022E26C 28260072 */  paddub     $4, $16, $0
/* 12E370 0022E270 282E2072 */  paddub     $5, $17, $0
/* 12E374 0022E274 28366072 */  paddub     $6, $19, $0
/* 12E378 0022E278 8000A727 */  addiu      $7, $sp, 0x80
/* 12E37C 0022E27C 80000824 */  addiu      $8, $0, 0x80
/* 12E380 0022E280 284E0071 */  paddub     $9, $8, $0
/* 12E384 0022E284 645B080C */  jal        DrawObjectVibe__FiiP8CTexture8CRect_i_Uci
/* 12E388 0022E288 00000000 */   nop
/* 12E38C 0022E28C A897828F */  lw         $2, -0x6858($gp)
/* 12E390 0022E290 3C014424 */  addiu      $4, $2, 0x13C
/* 12E394 0022E294 2C98080C */  jal        GetAttachVolumeForMsg__FP11ATTACH_LIST
/* 12E398 0022E298 00000000 */   nop
/* 12E39C 0022E29C 3C441200 */  dsll32     $8, $18, 16
/* 12E3A0 0022E2A0 3F440800 */  dsra32     $8, $8, 16
/* 12E3A4 0022E2A4 5A000324 */  addiu      $3, $0, 0x5A
/* 12E3A8 0022E2A8 04000315 */  bne        $8, $3, .L0022E2BC
/* 12E3AC 0022E2AC 00000000 */   nop
/* 12E3B0 0022E2B0 A897828F */  lw         $2, -0x6858($gp)
/* 12E3B4 0022E2B4 3E014284 */  lh         $2, 0x13E($2)
/* 12E3B8 0022E2B8 00000000 */  nop
.L0022E2BC:
/* 12E3BC 0022E2BC 28260072 */  paddub     $4, $16, $0
/* 12E3C0 0022E2C0 282E2072 */  paddub     $5, $17, $0
/* 12E3C4 0022E2C4 28360070 */  paddub     $6, $0, $0
/* 12E3C8 0022E2C8 80020724 */  addiu      $7, $0, 0x280
/* 12E3CC 0022E2CC 284E4070 */  paddub     $9, $2, $0
/* 12E3D0 0022E2D0 80000A24 */  addiu      $10, $0, 0x80
/* 12E3D4 0022E2D4 01000B24 */  addiu      $11, $0, 0x1
/* 12E3D8 0022E2D8 E0B5080C */  jal        DrawAttachNumberOrWeapon__Fiiiiiiii
/* 12E3DC 0022E2DC 00000000 */   nop
.L0022E2E0:
/* 12E3E0 0022E2E0 6000BF7B */  lq         $31, 0x60($sp)
/* 12E3E4 0022E2E4 5000B57B */  lq         $21, 0x50($sp)
/* 12E3E8 0022E2E8 4000B47B */  lq         $20, 0x40($sp)
/* 12E3EC 0022E2EC 3000B37B */  lq         $19, 0x30($sp)
/* 12E3F0 0022E2F0 2000B27B */  lq         $18, 0x20($sp)
/* 12E3F4 0022E2F4 1000B17B */  lq         $17, 0x10($sp)
/* 12E3F8 0022E2F8 0000B07B */  lq         $16, 0x0($sp)
/* 12E3FC 0022E2FC A000BD27 */  addiu      $sp, $sp, 0xA0
/* 12E400 0022E300 0800E003 */  jr         $31
/* 12E404 0022E304 00000000 */   nop
/* 12E408 0022E308 00000000 */  nop
/* 12E40C 0022E30C 00000000 */  nop
