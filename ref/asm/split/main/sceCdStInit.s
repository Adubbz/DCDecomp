.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceCdStInit
/* 00BFB0 0010BEB0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 00BFB4 0010BEB4 2500023C */  lui         $2, %hi(stm_status)
/* 00BFB8 0010BEB8 2500083C */  lui         $8, %hi(dum_mode)
/* 00BFBC 0010BEBC 0000BFFF */  sd          $31, 0x0($29)
/* 00BFC0 0010BEC0 B80240AC */  sw          $0, %lo(stm_status)($2)
/* 00BFC4 0010BEC4 C8020825 */  addiu       $8, $8, %lo(dum_mode)
/* 00BFC8 0010BEC8 8430040C */  jal         sceCdStream
/* 00BFCC 0010BECC 05000724 */   addiu      $7, $0, 0x5
/* 00BFD0 0010BED0 0000BFDF */  ld          $31, 0x0($29)
/* 00BFD4 0010BED4 0800E003 */  jr          $31
/* 00BFD8 0010BED8 1000BD27 */   addiu      $29, $29, 0x10
/* 00BFDC 0010BEDC 00000000 */  nop
