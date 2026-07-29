.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceCdStStop
/* 00C078 0010BF78 F0FFBD27 */  addiu       $29, $29, -0x10
/* 00C07C 0010BF7C 2500023C */  lui         $2, %hi(stm_status)
/* 00C080 0010BF80 2500083C */  lui         $8, %hi(dum_mode)
/* 00C084 0010BF84 0000BFFF */  sd          $31, 0x0($29)
/* 00C088 0010BF88 B80240AC */  sw          $0, %lo(stm_status)($2)
/* 00C08C 0010BF8C C8020825 */  addiu       $8, $8, %lo(dum_mode)
/* 00C090 0010BF90 2D200000 */  daddu       $4, $0, $0
/* 00C094 0010BF94 2D280000 */  daddu       $5, $0, $0
/* 00C098 0010BF98 2D300000 */  daddu       $6, $0, $0
/* 00C09C 0010BF9C 8430040C */  jal         sceCdStream
/* 00C0A0 0010BFA0 03000724 */   addiu      $7, $0, 0x3
/* 00C0A4 0010BFA4 0000BFDF */  ld          $31, 0x0($29)
/* 00C0A8 0010BFA8 0800E003 */  jr          $31
/* 00C0AC 0010BFAC 1000BD27 */   addiu      $29, $29, 0x10
