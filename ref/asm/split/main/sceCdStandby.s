.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceCdStandby
/* 00AC50 0010AB50 C0FFBD27 */  addiu       $29, $29, -0x40
/* 00AC54 0010AB54 3000BFFF */  sd          $31, 0x30($29)
/* 00AC58 0010AB58 2000B1FF */  sd          $17, 0x20($29)
/* 00AC5C 0010AB5C 4228040C */  jal         sceCdNcmdDiskReady
/* 00AC60 0010AB60 1000B0FF */   sd         $16, 0x10($29)
/* 00AC64 0010AB64 06000324 */  addiu       $3, $0, 0x6
/* 00AC68 0010AB68 24004310 */  beq         $2, $3, .L0010ABFC
/* 00AC6C 0010AB6C 2D100000 */   daddu      $2, $0, $0
/* 00AC70 0010AB70 E627040C */  jal         ncmd_prechk
/* 00AC74 0010AB74 0A000424 */   addiu      $4, $0, 0xA
/* 00AC78 0010AB78 1A004010 */  beqz        $2, .L0010ABE4
/* 00AC7C 0010AB7C 2500103C */   lui        $16, %hi(sceCdCbfunc_num)
/* 00AC80 0010AB80 05000224 */  addiu       $2, $0, 0x5
/* 00AC84 0010AB84 C00202AE */  sw          $2, %lo(sceCdCbfunc_num)($16)
/* 00AC88 0010AB88 C0020326 */  addiu       $3, $16, %lo(sceCdCbfunc_num)
/* 00AC8C 0010AB8C 2500113C */  lui         $17, %hi(c_cb_sem)
/* 00AC90 0010AB90 01000224 */  addiu       $2, $0, 0x1
/* 00AC94 0010AB94 2A00043C */  lui         $4, %hi(cdrd)
/* 00AC98 0010AB98 11000B3C */  lui         $11, %hi(cd_callback)
/* 00AC9C 0010AB9C 8C0222AE */  sw          $2, %lo(c_cb_sem)($17)
/* 00ACA0 0010ABA0 003C8424 */  addiu       $4, $4, %lo(cdrd)
/* 00ACA4 0010ABA4 0000A3AF */  sw          $3, 0x0($29)
/* 00ACA8 0010ABA8 48966B25 */  addiu       $11, $11, %lo(cd_callback)
/* 00ACAC 0010ABAC 06000524 */  addiu       $5, $0, 0x6
/* 00ACB0 0010ABB0 01000624 */  addiu       $6, $0, 0x1
/* 00ACB4 0010ABB4 2D380000 */  daddu       $7, $0, $0
/* 00ACB8 0010ABB8 2D400000 */  daddu       $8, $0, $0
/* 00ACBC 0010ABBC 2D480000 */  daddu       $9, $0, $0
/* 00ACC0 0010ABC0 2A5D040C */  jal         sceSifCallRpc
/* 00ACC4 0010ABC4 2D500000 */   daddu      $10, $0, $0
/* 00ACC8 0010ABC8 08004304 */  bgezl       $2, .L0010ABEC
/* 00ACCC 0010ABCC 2500023C */   lui        $2, %hi(ncmd_semid)
/* 00ACD0 0010ABD0 C00200AE */  sw          $0, %lo(sceCdCbfunc_num)($16)
/* 00ACD4 0010ABD4 2500023C */  lui         $2, %hi(ncmd_semid)
/* 00ACD8 0010ABD8 8C0220AE */  sw          $0, %lo(c_cb_sem)($17)
/* 00ACDC 0010ABDC D050040C */  jal         SignalSema
/* 00ACE0 0010ABE0 8002448C */   lw         $4, %lo(ncmd_semid)($2)
.L0010ABE4:
/* 00ACE4 0010ABE4 05000010 */  b           .L0010ABFC
/* 00ACE8 0010ABE8 2D100000 */   daddu      $2, $0, $0
.L0010ABEC:
/* 00ACEC 0010ABEC 8002448C */  lw          $4, %lo(ncmd_semid)($2)
/* 00ACF0 0010ABF0 D050040C */  jal         SignalSema
/* 00ACF4 0010ABF4 00000000 */   nop
/* 00ACF8 0010ABF8 01000224 */  addiu       $2, $0, 0x1
.L0010ABFC:
/* 00ACFC 0010ABFC 3000BFDF */  ld          $31, 0x30($29)
/* 00AD00 0010AC00 2000B1DF */  ld          $17, 0x20($29)
/* 00AD04 0010AC04 1000B0DF */  ld          $16, 0x10($29)
/* 00AD08 0010AC08 0800E003 */  jr          $31
/* 00AD0C 0010AC0C 4000BD27 */   addiu      $29, $29, 0x40
