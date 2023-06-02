.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndBgmLoad__Fi
/* 59A60 00159960 50FFBD27 */  addiu      $sp, $sp, -0xB0
/* 59A64 00159964 1000BF7F */  sq         $31, 0x10($sp)
/* 59A68 00159968 0000B07F */  sq         $16, 0x0($sp)
/* 59A6C 0015996C 28868070 */  paddub     $16, $4, $0
/* 59A70 00159970 048E828F */  lw         $2, -0x71FC($gp)
/* 59A74 00159974 04005014 */  bne        $2, $16, .L00159988
/* 59A78 00159978 00000000 */   nop
/* 59A7C 0015997C 28160070 */  paddub     $2, $0, $0
/* 59A80 00159980 16000010 */  b          .L001599DC
/* 59A84 00159984 00000000 */   nop
.L00159988:
/* 59A88 00159988 2000A527 */  addiu      $5, $sp, 0x20
/* 59A8C 0015998C A000A627 */  addiu      $6, $sp, 0xA0
/* 59A90 00159990 E465050C */  jal        GetBGMFile__FiPcPc
/* 59A94 00159994 00000000 */   nop
/* 59A98 00159998 2000A427 */  addiu      $4, $sp, 0x20
/* 59A9C 0015999C F08D858F */  lw         $5, -0x7210($gp)
/* 59AA0 001599A0 28360070 */  paddub     $6, $0, $0
/* 59AA4 001599A4 283E0070 */  paddub     $7, $0, $0
/* 59AA8 001599A8 F4FC040C */  jal        LoadFile2__FPcPvPii
/* 59AAC 001599AC 00000000 */   nop
/* 59AB0 001599B0 09004010 */  beqz       $2, .L001599D8
/* 59AB4 001599B4 00000000 */   nop
/* 59AB8 001599B8 28260072 */  paddub     $4, $16, $0
/* 59ABC 001599BC F08D858F */  lw         $5, -0x7210($gp)
/* 59AC0 001599C0 A000A627 */  addiu      $6, $sp, 0xA0
/* 59AC4 001599C4 0466050C */  jal        SetBGMFile__FiPUiPc
/* 59AC8 001599C8 00000000 */   nop
/* 59ACC 001599CC 01000224 */  addiu      $2, $0, 0x1
/* 59AD0 001599D0 02000010 */  b          .L001599DC
/* 59AD4 001599D4 00000000 */   nop
.L001599D8:
/* 59AD8 001599D8 28160070 */  paddub     $2, $0, $0
.L001599DC:
/* 59ADC 001599DC 1000BF7B */  lq         $31, 0x10($sp)
/* 59AE0 001599E0 0000B07B */  lq         $16, 0x0($sp)
/* 59AE4 001599E4 B000BD27 */  addiu      $sp, $sp, 0xB0
/* 59AE8 001599E8 0800E003 */  jr         $31
/* 59AEC 001599EC 00000000 */   nop
