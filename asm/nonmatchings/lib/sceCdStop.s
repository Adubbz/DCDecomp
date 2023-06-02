.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceCdStop
/* AD10 0010AC10 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* AD14 0010AC14 2000B1FF */  sd         $17, 0x20($sp)
/* AD18 0010AC18 4000BFFF */  sd         $31, 0x40($sp)
/* AD1C 0010AC1C 06001124 */  addiu      $17, $0, 0x6
/* AD20 0010AC20 3000B2FF */  sd         $18, 0x30($sp)
/* AD24 0010AC24 4228040C */  jal        sceCdNcmdDiskReady
/* AD28 0010AC28 1000B0FF */   sd        $16, 0x10($sp)
/* AD2C 0010AC2C 23005110 */  beq        $2, $17, .L0010ACBC
/* AD30 0010AC30 2D100000 */   daddu     $2, $0, $0
/* AD34 0010AC34 E627040C */  jal        ncmd_prechk
/* AD38 0010AC38 0B000424 */   addiu     $4, $0, 0xB
/* AD3C 0010AC3C 19004010 */  beqz       $2, .L0010ACA4
/* AD40 0010AC40 2500103C */   lui       $16, (0x2502C0 >> 16)
/* AD44 0010AC44 2500123C */  lui        $18, (0x25028C >> 16)
/* AD48 0010AC48 C00211AE */  sw         $17, (0x2502C0 & 0xFFFF)($16)
/* AD4C 0010AC4C C0020326 */  addiu      $3, $16, %lo(sceCdCbfunc_num)
/* AD50 0010AC50 01000224 */  addiu      $2, $0, 0x1
/* AD54 0010AC54 2A00043C */  lui        $4, %hi(D_002A3C00)
/* AD58 0010AC58 11000B3C */  lui        $11, %hi(cd_callback)
/* AD5C 0010AC5C 8C0242AE */  sw         $2, (0x25028C & 0xFFFF)($18)
/* AD60 0010AC60 0000A3AF */  sw         $3, 0x0($sp)
/* AD64 0010AC64 003C8424 */  addiu      $4, $4, %lo(D_002A3C00)
/* AD68 0010AC68 48966B25 */  addiu      $11, $11, %lo(cd_callback)
/* AD6C 0010AC6C 07000524 */  addiu      $5, $0, 0x7
/* AD70 0010AC70 01000624 */  addiu      $6, $0, 0x1
/* AD74 0010AC74 2D380000 */  daddu      $7, $0, $0
/* AD78 0010AC78 2D400000 */  daddu      $8, $0, $0
/* AD7C 0010AC7C 2D480000 */  daddu      $9, $0, $0
/* AD80 0010AC80 2A5D040C */  jal        sceSifCallRpc
/* AD84 0010AC84 2D500000 */   daddu     $10, $0, $0
/* AD88 0010AC88 08004304 */  bgezl      $2, .L0010ACAC
/* AD8C 0010AC8C 2500023C */   lui       $2, (0x250280 >> 16)
/* AD90 0010AC90 C00200AE */  sw         $0, (0x2502C0 & 0xFFFF)($16)
/* AD94 0010AC94 2500023C */  lui        $2, (0x250280 >> 16)
/* AD98 0010AC98 8C0240AE */  sw         $0, (0x25028C & 0xFFFF)($18)
/* AD9C 0010AC9C D050040C */  jal        SignalSema
/* ADA0 0010ACA0 8002448C */   lw        $4, (0x250280 & 0xFFFF)($2)
.L0010ACA4:
/* ADA4 0010ACA4 05000010 */  b          .L0010ACBC
/* ADA8 0010ACA8 2D100000 */   daddu     $2, $0, $0
.L0010ACAC:
/* ADAC 0010ACAC 8002448C */  lw         $4, (0x250280 & 0xFFFF)($2)
/* ADB0 0010ACB0 D050040C */  jal        SignalSema
/* ADB4 0010ACB4 00000000 */   nop
/* ADB8 0010ACB8 01000224 */  addiu      $2, $0, 0x1
.L0010ACBC:
/* ADBC 0010ACBC 4000BFDF */  ld         $31, 0x40($sp)
/* ADC0 0010ACC0 3000B2DF */  ld         $18, 0x30($sp)
/* ADC4 0010ACC4 2000B1DF */  ld         $17, 0x20($sp)
/* ADC8 0010ACC8 1000B0DF */  ld         $16, 0x10($sp)
/* ADCC 0010ACCC 0800E003 */  jr         $31
/* ADD0 0010ACD0 5000BD27 */   addiu     $sp, $sp, 0x50
/* ADD4 0010ACD4 00000000 */  nop
