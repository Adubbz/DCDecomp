.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceVif1PkAddCode
/* 021110 00121010 0000828C */  lw          $2, 0x0($4)
/* 021114 00121014 000045AC */  sw          $5, 0x0($2)
/* 021118 00121018 04004224 */  addiu       $2, $2, 0x4
/* 02111C 0012101C 0800E003 */  jr          $31
/* 021120 00121020 000082AC */   sw         $2, 0x0($4)
/* 021124 00121024 00000000 */  nop
