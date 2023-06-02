.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FrameImageDraw__Fii
/* 12D3B0 0022D2B0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 12D3B4 0022D2B4 3000BF7F */  sq         $31, 0x30($sp)
/* 12D3B8 0022D2B8 2000B27F */  sq         $18, 0x20($sp)
/* 12D3BC 0022D2BC 1000B17F */  sq         $17, 0x10($sp)
/* 12D3C0 0022D2C0 0000B07F */  sq         $16, 0x0($sp)
/* 12D3C4 0022D2C4 28968070 */  paddub     $18, $4, $0
/* 12D3C8 0022D2C8 288EA070 */  paddub     $17, $5, $0
/* 12D3CC 0022D2CC C701023C */  lui        $2, %hi(TexManager)
/* 12D3D0 0022D2D0 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 12D3D4 0022D2D4 2A00023C */  lui        $2, %hi(_764_3)
/* 12D3D8 0022D2D8 98F14524 */  addiu      $5, $2, %lo(_764_3)
/* 12D3DC 0022D2DC FFFF0624 */  addiu      $6, $0, -0x1
/* 12D3E0 0022D2E0 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 12D3E4 0022D2E4 00000000 */   nop
/* 12D3E8 0022D2E8 28864070 */  paddub     $16, $2, $0
/* 12D3EC 0022D2EC 2E000012 */  beqz       $16, .L0022D3A8
/* 12D3F0 0022D2F0 00000000 */   nop
/* 12D3F4 0022D2F4 A0B8040C */  jal        GetVif1Packet__Fv
/* 12D3F8 0022D2F8 00000000 */   nop
/* 12D3FC 0022D2FC 00000686 */  lh         $6, 0x0($16)
/* 12D400 0022D300 C701033C */  lui        $3, %hi(TexManager)
/* 12D404 0022D304 70586424 */  addiu      $4, $3, %lo(TexManager)
/* 12D408 0022D308 282E4070 */  paddub     $5, $2, $0
/* 12D40C 0022D30C 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 12D410 0022D310 00000000 */   nop
/* 12D414 0022D314 2C000492 */  lbu        $4, 0x2C($16)
/* 12D418 0022D318 01000230 */  andi       $2, $0, 0x1
/* 12D41C 0022D31C 80180200 */  sll        $3, $2, 2
/* 12D420 0022D320 FBFF0224 */  addiu      $2, $0, -0x5
/* 12D424 0022D324 24108200 */  and        $2, $4, $2
/* 12D428 0022D328 25104300 */  or         $2, $2, $3
/* 12D42C 0022D32C 2C0002A2 */  sb         $2, 0x2C($16)
/* 12D430 0022D330 4800A427 */  addiu      $4, $sp, 0x48
/* 12D434 0022D334 008C82DF */  ld         $2, -0x7400($gp)
/* 12D438 0022D338 000082FC */  sd         $2, 0x0($4)
/* 12D43C 0022D33C 4900A593 */  lbu        $5, 0x49($sp)
/* 12D440 0022D340 80000364 */  daddiu     $3, $0, 0x80
/* 12D444 0022D344 7FFF0224 */  addiu      $2, $0, -0x81
/* 12D448 0022D348 2410A200 */  and        $2, $5, $2
/* 12D44C 0022D34C 25104300 */  or         $2, $2, $3
/* 12D450 0022D350 4900A2A3 */  sb         $2, 0x49($sp)
/* 12D454 0022D354 80000224 */  addiu      $2, $0, 0x80
/* 12D458 0022D358 4800A2A3 */  sb         $2, 0x48($sp)
/* 12D45C 0022D35C 18BC040C */  jal        MGSetGsTEXA__FP9sceGsTexa
/* 12D460 0022D360 00000000 */   nop
/* 12D464 0022D364 A0B8040C */  jal        GetVif1Packet__Fv
/* 12D468 0022D368 00000000 */   nop
/* 12D46C 0022D36C FF004832 */  andi       $8, $18, 0xFF
/* 12D470 0022D370 284E0071 */  paddub     $9, $8, $0
/* 12D474 0022D374 28560071 */  paddub     $10, $8, $0
/* 12D478 0022D378 FF002B32 */  andi       $11, $17, 0xFF
/* 12D47C 0022D37C 28264070 */  paddub     $4, $2, $0
/* 12D480 0022D380 282E0072 */  paddub     $5, $16, $0
/* 12D484 0022D384 DA01023C */  lui        $2, %hi(MenuDispRc)
/* 12D488 0022D388 906A4624 */  addiu      $6, $2, %lo(MenuDispRc)
/* 12D48C 0022D38C DA01023C */  lui        $2, %hi(MenuDispRc)
/* 12D490 0022D390 906A4724 */  addiu      $7, $2, %lo(MenuDispRc)
/* 12D494 0022D394 8C71050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_UcUcUcUc
/* 12D498 0022D398 00000000 */   nop
/* 12D49C 0022D39C 28260070 */  paddub     $4, $0, $0
/* 12D4A0 0022D3A0 18BC040C */  jal        MGSetGsTEXA__FP9sceGsTexa
/* 12D4A4 0022D3A4 00000000 */   nop
.L0022D3A8:
/* 12D4A8 0022D3A8 3000BF7B */  lq         $31, 0x30($sp)
/* 12D4AC 0022D3AC 2000B27B */  lq         $18, 0x20($sp)
/* 12D4B0 0022D3B0 1000B17B */  lq         $17, 0x10($sp)
/* 12D4B4 0022D3B4 0000B07B */  lq         $16, 0x0($sp)
/* 12D4B8 0022D3B8 5000BD27 */  addiu      $sp, $sp, 0x50
/* 12D4BC 0022D3BC 0800E003 */  jr         $31
/* 12D4C0 0022D3C0 00000000 */   nop
/* 12D4C4 0022D3C4 00000000 */  nop
/* 12D4C8 0022D3C8 00000000 */  nop
/* 12D4CC 0022D3CC 00000000 */  nop
