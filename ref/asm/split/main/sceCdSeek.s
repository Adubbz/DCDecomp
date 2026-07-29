.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceCdSeek
/* 00AB68 0010AA68 B0FFBD27 */  addiu       $29, $29, -0x50
/* 00AB6C 0010AA6C 2000B1FF */  sd          $17, 0x20($29)
/* 00AB70 0010AA70 4000BFFF */  sd          $31, 0x40($29)
/* 00AB74 0010AA74 2D888000 */  daddu       $17, $4, $0
/* 00AB78 0010AA78 3000B2FF */  sd          $18, 0x30($29)
/* 00AB7C 0010AA7C 4228040C */  jal         sceCdNcmdDiskReady
/* 00AB80 0010AA80 1000B0FF */   sd         $16, 0x10($29)
/* 00AB84 0010AA84 06000324 */  addiu       $3, $0, 0x6
/* 00AB88 0010AA88 2A004310 */  beq         $2, $3, .L0010AB34
/* 00AB8C 0010AA8C 2D100000 */   daddu      $2, $0, $0
/* 00AB90 0010AA90 E627040C */  jal         ncmd_prechk
/* 00AB94 0010AA94 09000424 */   addiu      $4, $0, 0x9
/* 00AB98 0010AA98 20004010 */  beqz        $2, .L0010AB1C
/* 00AB9C 0010AA9C 2A00023C */   lui        $2, %hi(_lbn_prm)
/* 00ABA0 0010AAA0 04000524 */  addiu       $5, $0, 0x4
/* 00ABA4 0010AAA4 10495024 */  addiu       $16, $2, %lo(_lbn_prm)
/* 00ABA8 0010AAA8 104951AC */  sw          $17, %lo(_lbn_prm)($2)
/* 00ABAC 0010AAAC 2D200002 */  daddu       $4, $16, $0
/* 00ABB0 0010AAB0 E65A040C */  jal         sceSifWriteBackDCache
/* 00ABB4 0010AAB4 2500113C */   lui        $17, %hi(sceCdCbfunc_num)
/* 00ABB8 0010AAB8 2500123C */  lui         $18, %hi(c_cb_sem)
/* 00ABBC 0010AABC C0022526 */  addiu       $5, $17, %lo(sceCdCbfunc_num)
/* 00ABC0 0010AAC0 04000224 */  addiu       $2, $0, 0x4
/* 00ABC4 0010AAC4 C00222AE */  sw          $2, %lo(sceCdCbfunc_num)($17)
/* 00ABC8 0010AAC8 01000324 */  addiu       $3, $0, 0x1
/* 00ABCC 0010AACC 2A00043C */  lui         $4, %hi(cdrd)
/* 00ABD0 0010AAD0 11000B3C */  lui         $11, %hi(cd_callback)
/* 00ABD4 0010AAD4 0000A5AF */  sw          $5, 0x0($29)
/* 00ABD8 0010AAD8 003C8424 */  addiu       $4, $4, %lo(cdrd)
/* 00ABDC 0010AADC 8C0243AE */  sw          $3, %lo(c_cb_sem)($18)
/* 00ABE0 0010AAE0 2D380002 */  daddu       $7, $16, $0
/* 00ABE4 0010AAE4 48966B25 */  addiu       $11, $11, %lo(cd_callback)
/* 00ABE8 0010AAE8 05000524 */  addiu       $5, $0, 0x5
/* 00ABEC 0010AAEC 01000624 */  addiu       $6, $0, 0x1
/* 00ABF0 0010AAF0 04000824 */  addiu       $8, $0, 0x4
/* 00ABF4 0010AAF4 2D480000 */  daddu       $9, $0, $0
/* 00ABF8 0010AAF8 2A5D040C */  jal         sceSifCallRpc
/* 00ABFC 0010AAFC 2D500000 */   daddu      $10, $0, $0
/* 00AC00 0010AB00 08004304 */  bgezl       $2, .L0010AB24
/* 00AC04 0010AB04 2500023C */   lui        $2, %hi(ncmd_semid)
/* 00AC08 0010AB08 C00220AE */  sw          $0, %lo(sceCdCbfunc_num)($17)
/* 00AC0C 0010AB0C 2500023C */  lui         $2, %hi(ncmd_semid)
/* 00AC10 0010AB10 8C0240AE */  sw          $0, %lo(c_cb_sem)($18)
/* 00AC14 0010AB14 D050040C */  jal         SignalSema
/* 00AC18 0010AB18 8002448C */   lw         $4, %lo(ncmd_semid)($2)
.L0010AB1C:
/* 00AC1C 0010AB1C 05000010 */  b           .L0010AB34
/* 00AC20 0010AB20 2D100000 */   daddu      $2, $0, $0
.L0010AB24:
/* 00AC24 0010AB24 8002448C */  lw          $4, %lo(ncmd_semid)($2)
/* 00AC28 0010AB28 D050040C */  jal         SignalSema
/* 00AC2C 0010AB2C 00000000 */   nop
/* 00AC30 0010AB30 01000224 */  addiu       $2, $0, 0x1
.L0010AB34:
/* 00AC34 0010AB34 4000BFDF */  ld          $31, 0x40($29)
/* 00AC38 0010AB38 3000B2DF */  ld          $18, 0x30($29)
/* 00AC3C 0010AB3C 2000B1DF */  ld          $17, 0x20($29)
/* 00AC40 0010AB40 1000B0DF */  ld          $16, 0x10($29)
/* 00AC44 0010AB44 0800E003 */  jr          $31
/* 00AC48 0010AB48 5000BD27 */   addiu      $29, $29, 0x50
/* 00AC4C 0010AB4C 00000000 */  nop
