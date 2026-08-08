.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __as__7CVisualFRC7CVisual
/* 0434F0 001433F0 0000A28C */  lw          $2, 0x0($5)
/* 0434F4 001433F4 000082AC */  sw          $2, 0x0($4)
/* 0434F8 001433F8 0400A28C */  lw          $2, 0x4($5)
/* 0434FC 001433FC 040082AC */  sw          $2, 0x4($4)
/* 043500 00143400 28168070 */  paddub      $2, $4, $0
/* 043504 00143404 0800E003 */  jr          $31
/* 043508 00143408 00000000 */   nop
/* 04350C 0014340C 00000000 */  nop
