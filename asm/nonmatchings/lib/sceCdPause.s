.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceCdPause
/* ADD8 0010ACD8 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* ADDC 0010ACDC 3000BFFF */  sd         $31, 0x30($sp)
/* ADE0 0010ACE0 2000B1FF */  sd         $17, 0x20($sp)
/* ADE4 0010ACE4 4228040C */  jal        sceCdNcmdDiskReady
/* ADE8 0010ACE8 1000B0FF */   sd        $16, 0x10($sp)
/* ADEC 0010ACEC 06000324 */  addiu      $3, $0, 0x6
/* ADF0 0010ACF0 24004310 */  beq        $2, $3, .L0010AD84
/* ADF4 0010ACF4 2D100000 */   daddu     $2, $0, $0
/* ADF8 0010ACF8 E627040C */  jal        ncmd_prechk
/* ADFC 0010ACFC 0C000424 */   addiu     $4, $0, 0xC
/* AE00 0010AD00 1A004010 */  beqz       $2, .L0010AD6C
/* AE04 0010AD04 2500103C */   lui       $16, (0x2502C0 >> 16)
/* AE08 0010AD08 07000224 */  addiu      $2, $0, 0x7
/* AE0C 0010AD0C C00202AE */  sw         $2, (0x2502C0 & 0xFFFF)($16)
/* AE10 0010AD10 C0020326 */  addiu      $3, $16, %lo(sceCdCbfunc_num)
/* AE14 0010AD14 2500113C */  lui        $17, (0x25028C >> 16)
/* AE18 0010AD18 01000224 */  addiu      $2, $0, 0x1
/* AE1C 0010AD1C 2A00043C */  lui        $4, %hi(D_002A3C00)
/* AE20 0010AD20 11000B3C */  lui        $11, %hi(cd_callback)
/* AE24 0010AD24 8C0222AE */  sw         $2, (0x25028C & 0xFFFF)($17)
/* AE28 0010AD28 003C8424 */  addiu      $4, $4, %lo(D_002A3C00)
/* AE2C 0010AD2C 0000A3AF */  sw         $3, 0x0($sp)
/* AE30 0010AD30 48966B25 */  addiu      $11, $11, %lo(cd_callback)
/* AE34 0010AD34 08000524 */  addiu      $5, $0, 0x8
/* AE38 0010AD38 01000624 */  addiu      $6, $0, 0x1
/* AE3C 0010AD3C 2D380000 */  daddu      $7, $0, $0
/* AE40 0010AD40 2D400000 */  daddu      $8, $0, $0
/* AE44 0010AD44 2D480000 */  daddu      $9, $0, $0
/* AE48 0010AD48 2A5D040C */  jal        sceSifCallRpc
/* AE4C 0010AD4C 2D500000 */   daddu     $10, $0, $0
/* AE50 0010AD50 08004304 */  bgezl      $2, .L0010AD74
/* AE54 0010AD54 2500023C */   lui       $2, (0x250280 >> 16)
/* AE58 0010AD58 C00200AE */  sw         $0, (0x2502C0 & 0xFFFF)($16)
/* AE5C 0010AD5C 2500023C */  lui        $2, (0x250280 >> 16)
/* AE60 0010AD60 8C0220AE */  sw         $0, (0x25028C & 0xFFFF)($17)
/* AE64 0010AD64 D050040C */  jal        SignalSema
/* AE68 0010AD68 8002448C */   lw        $4, (0x250280 & 0xFFFF)($2)
.L0010AD6C:
/* AE6C 0010AD6C 05000010 */  b          .L0010AD84
/* AE70 0010AD70 2D100000 */   daddu     $2, $0, $0
.L0010AD74:
/* AE74 0010AD74 8002448C */  lw         $4, (0x250280 & 0xFFFF)($2)
/* AE78 0010AD78 D050040C */  jal        SignalSema
/* AE7C 0010AD7C 00000000 */   nop
/* AE80 0010AD80 01000224 */  addiu      $2, $0, 0x1
.L0010AD84:
/* AE84 0010AD84 3000BFDF */  ld         $31, 0x30($sp)
/* AE88 0010AD88 2000B1DF */  ld         $17, 0x20($sp)
/* AE8C 0010AD8C 1000B0DF */  ld         $16, 0x10($sp)
/* AE90 0010AD90 0800E003 */  jr         $31
/* AE94 0010AD94 4000BD27 */   addiu     $sp, $sp, 0x40
