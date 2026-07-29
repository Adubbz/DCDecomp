.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceCdStResume
/* 00C270 0010C170 2500033C */  lui         $3, %hi(CD_debug)
/* 00C274 0010C174 F0FFBD27 */  addiu       $29, $29, -0x10
/* 00C278 0010C178 2500043C */  lui         $4, %hi(stm_status)
/* 00C27C 0010C17C 01000224 */  addiu       $2, $0, 0x1
/* 00C280 0010C180 7002658C */  lw          $5, %lo(CD_debug)($3)
/* 00C284 0010C184 0000BFFF */  sd          $31, 0x0($29)
/* 00C288 0010C188 0400A018 */  blez        $5, .L0010C19C
/* 00C28C 0010C18C B80282AC */   sw         $2, %lo(stm_status)($4)
/* 00C290 0010C190 2900043C */  lui         $4, %hi(RO_00297350)
/* 00C294 0010C194 A611040C */  jal         printf
/* 00C298 0010C198 50738424 */   addiu      $4, $4, %lo(RO_00297350)
.L0010C19C:
/* 00C29C 0010C19C 2500083C */  lui         $8, %hi(dum_mode)
/* 00C2A0 0010C1A0 2D200000 */  daddu       $4, $0, $0
/* 00C2A4 0010C1A4 C8020825 */  addiu       $8, $8, %lo(dum_mode)
/* 00C2A8 0010C1A8 2D280000 */  daddu       $5, $0, $0
/* 00C2AC 0010C1AC 2D300000 */  daddu       $6, $0, $0
/* 00C2B0 0010C1B0 8430040C */  jal         sceCdStream
/* 00C2B4 0010C1B4 08000724 */   addiu      $7, $0, 0x8
/* 00C2B8 0010C1B8 0000BFDF */  ld          $31, 0x0($29)
/* 00C2BC 0010C1BC 0800E003 */  jr          $31
/* 00C2C0 0010C1C0 1000BD27 */   addiu      $29, $29, 0x10
/* 00C2C4 0010C1C4 00000000 */  nop
