.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceCdStandby
/* AC50 0010AB50 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* AC54 0010AB54 3000BFFF */  sd         $31, 0x30($sp)
/* AC58 0010AB58 2000B1FF */  sd         $17, 0x20($sp)
/* AC5C 0010AB5C 4228040C */  jal        sceCdNcmdDiskReady
/* AC60 0010AB60 1000B0FF */   sd        $16, 0x10($sp)
/* AC64 0010AB64 06000324 */  addiu      $3, $0, 0x6
/* AC68 0010AB68 24004310 */  beq        $2, $3, .L0010ABFC
/* AC6C 0010AB6C 2D100000 */   daddu     $2, $0, $0
/* AC70 0010AB70 E627040C */  jal        ncmd_prechk
/* AC74 0010AB74 0A000424 */   addiu     $4, $0, 0xA
/* AC78 0010AB78 1A004010 */  beqz       $2, .L0010ABE4
/* AC7C 0010AB7C 2500103C */   lui       $16, (0x2502C0 >> 16)
/* AC80 0010AB80 05000224 */  addiu      $2, $0, 0x5
/* AC84 0010AB84 C00202AE */  sw         $2, (0x2502C0 & 0xFFFF)($16)
/* AC88 0010AB88 C0020326 */  addiu      $3, $16, %lo(sceCdCbfunc_num)
/* AC8C 0010AB8C 2500113C */  lui        $17, (0x25028C >> 16)
/* AC90 0010AB90 01000224 */  addiu      $2, $0, 0x1
/* AC94 0010AB94 2A00043C */  lui        $4, %hi(D_002A3C00)
/* AC98 0010AB98 11000B3C */  lui        $11, %hi(cd_callback)
/* AC9C 0010AB9C 8C0222AE */  sw         $2, (0x25028C & 0xFFFF)($17)
/* ACA0 0010ABA0 003C8424 */  addiu      $4, $4, %lo(D_002A3C00)
/* ACA4 0010ABA4 0000A3AF */  sw         $3, 0x0($sp)
/* ACA8 0010ABA8 48966B25 */  addiu      $11, $11, %lo(cd_callback)
/* ACAC 0010ABAC 06000524 */  addiu      $5, $0, 0x6
/* ACB0 0010ABB0 01000624 */  addiu      $6, $0, 0x1
/* ACB4 0010ABB4 2D380000 */  daddu      $7, $0, $0
/* ACB8 0010ABB8 2D400000 */  daddu      $8, $0, $0
/* ACBC 0010ABBC 2D480000 */  daddu      $9, $0, $0
/* ACC0 0010ABC0 2A5D040C */  jal        sceSifCallRpc
/* ACC4 0010ABC4 2D500000 */   daddu     $10, $0, $0
/* ACC8 0010ABC8 08004304 */  bgezl      $2, .L0010ABEC
/* ACCC 0010ABCC 2500023C */   lui       $2, (0x250280 >> 16)
/* ACD0 0010ABD0 C00200AE */  sw         $0, (0x2502C0 & 0xFFFF)($16)
/* ACD4 0010ABD4 2500023C */  lui        $2, (0x250280 >> 16)
/* ACD8 0010ABD8 8C0220AE */  sw         $0, (0x25028C & 0xFFFF)($17)
/* ACDC 0010ABDC D050040C */  jal        SignalSema
/* ACE0 0010ABE0 8002448C */   lw        $4, (0x250280 & 0xFFFF)($2)
.L0010ABE4:
/* ACE4 0010ABE4 05000010 */  b          .L0010ABFC
/* ACE8 0010ABE8 2D100000 */   daddu     $2, $0, $0
.L0010ABEC:
/* ACEC 0010ABEC 8002448C */  lw         $4, (0x250280 & 0xFFFF)($2)
/* ACF0 0010ABF0 D050040C */  jal        SignalSema
/* ACF4 0010ABF4 00000000 */   nop
/* ACF8 0010ABF8 01000224 */  addiu      $2, $0, 0x1
.L0010ABFC:
/* ACFC 0010ABFC 3000BFDF */  ld         $31, 0x30($sp)
/* AD00 0010AC00 2000B1DF */  ld         $17, 0x20($sp)
/* AD04 0010AC04 1000B0DF */  ld         $16, 0x10($sp)
/* AD08 0010AC08 0800E003 */  jr         $31
/* AD0C 0010AC0C 4000BD27 */   addiu     $sp, $sp, 0x40
