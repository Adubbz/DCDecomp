.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndBgmLoadBG__FiPUiPi
/* 59AF0 001599F0 40FFBD27 */  addiu      $sp, $sp, -0xC0
/* 59AF4 001599F4 3000BF7F */  sq         $31, 0x30($sp)
/* 59AF8 001599F8 2000B27F */  sq         $18, 0x20($sp)
/* 59AFC 001599FC 1000B17F */  sq         $17, 0x10($sp)
/* 59B00 00159A00 0000B07F */  sq         $16, 0x0($sp)
/* 59B04 00159A04 28968070 */  paddub     $18, $4, $0
/* 59B08 00159A08 288EA070 */  paddub     $17, $5, $0
/* 59B0C 00159A0C 2886C070 */  paddub     $16, $6, $0
/* 59B10 00159A10 02000012 */  beqz       $16, .L00159A1C
/* 59B14 00159A14 00000000 */   nop
/* 59B18 00159A18 000000AE */  sw         $0, 0x0($16)
.L00159A1C:
/* 59B1C 00159A1C 048E828F */  lw         $2, -0x71FC($gp)
/* 59B20 00159A20 04005214 */  bne        $2, $18, .L00159A34
/* 59B24 00159A24 00000000 */   nop
/* 59B28 00159A28 28160070 */  paddub     $2, $0, $0
/* 59B2C 00159A2C 19000010 */  b          .L00159A94
/* 59B30 00159A30 00000000 */   nop
.L00159A34:
/* 59B34 00159A34 28264072 */  paddub     $4, $18, $0
/* 59B38 00159A38 4000A527 */  addiu      $5, $sp, 0x40
/* 59B3C 00159A3C D001023C */  lui        $2, %hi(bgm_cfg_file)
/* 59B40 00159A40 90B44624 */  addiu      $6, $2, %lo(bgm_cfg_file)
/* 59B44 00159A44 E465050C */  jal        GetBGMFile__FiPcPc
/* 59B48 00159A48 00000000 */   nop
/* 59B4C 00159A4C 2A00023C */  lui        $2, %hi(_384_2)
/* 59B50 00159A50 A89F4424 */  addiu      $4, $2, %lo(_384_2)
/* 59B54 00159A54 282E4072 */  paddub     $5, $18, $0
/* 59B58 00159A58 A611040C */  jal        printf
/* 59B5C 00159A5C 00000000 */   nop
/* 59B60 00159A60 4000A427 */  addiu      $4, $sp, 0x40
/* 59B64 00159A64 282E2072 */  paddub     $5, $17, $0
/* 59B68 00159A68 28360072 */  paddub     $6, $16, $0
/* 59B6C 00159A6C ACFA040C */  jal        LoadFileBG__FPcP1Pi
/* 59B70 00159A70 00000000 */   nop
/* 59B74 00159A74 06004010 */  beqz       $2, .L00159A90
/* 59B78 00159A78 00000000 */   nop
/* 59B7C 00159A7C 388E92AF */  sw         $18, -0x71C8($gp)
/* 59B80 00159A80 3C8E91AF */  sw         $17, -0x71C4($gp)
/* 59B84 00159A84 01000224 */  addiu      $2, $0, 0x1
/* 59B88 00159A88 02000010 */  b          .L00159A94
/* 59B8C 00159A8C 00000000 */   nop
.L00159A90:
/* 59B90 00159A90 28160070 */  paddub     $2, $0, $0
.L00159A94:
/* 59B94 00159A94 3000BF7B */  lq         $31, 0x30($sp)
/* 59B98 00159A98 2000B27B */  lq         $18, 0x20($sp)
/* 59B9C 00159A9C 1000B17B */  lq         $17, 0x10($sp)
/* 59BA0 00159AA0 0000B07B */  lq         $16, 0x0($sp)
/* 59BA4 00159AA4 C000BD27 */  addiu      $sp, $sp, 0xC0
/* 59BA8 00159AA8 0800E003 */  jr         $31
/* 59BAC 00159AAC 00000000 */   nop
