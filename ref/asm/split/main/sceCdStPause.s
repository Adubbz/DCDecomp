.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceCdStPause
/* 00C220 0010C120 2500023C */  lui         $2, %hi(CD_debug)
/* 00C224 0010C124 F0FFBD27 */  addiu       $29, $29, -0x10
/* 00C228 0010C128 2500033C */  lui         $3, %hi(stm_status)
/* 00C22C 0010C12C 7002448C */  lw          $4, %lo(CD_debug)($2)
/* 00C230 0010C130 0000BFFF */  sd          $31, 0x0($29)
/* 00C234 0010C134 04008018 */  blez        $4, .L0010C148
/* 00C238 0010C138 B80260AC */   sw         $0, %lo(stm_status)($3)
/* 00C23C 0010C13C 2900043C */  lui         $4, %hi(RO_00297338)
/* 00C240 0010C140 A611040C */  jal         printf
/* 00C244 0010C144 38738424 */   addiu      $4, $4, %lo(RO_00297338)
.L0010C148:
/* 00C248 0010C148 2500083C */  lui         $8, %hi(dum_mode)
/* 00C24C 0010C14C 2D200000 */  daddu       $4, $0, $0
/* 00C250 0010C150 C8020825 */  addiu       $8, $8, %lo(dum_mode)
/* 00C254 0010C154 2D280000 */  daddu       $5, $0, $0
/* 00C258 0010C158 2D300000 */  daddu       $6, $0, $0
/* 00C25C 0010C15C 8430040C */  jal         sceCdStream
/* 00C260 0010C160 07000724 */   addiu      $7, $0, 0x7
/* 00C264 0010C164 0000BFDF */  ld          $31, 0x0($29)
/* 00C268 0010C168 0800E003 */  jr          $31
/* 00C26C 0010C16C 1000BD27 */   addiu      $29, $29, 0x10
