.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceVif1PkAddGsAD
/* 021128 00121028 0000828C */  lw          $2, 0x0($4)
/* 02112C 0012102C 3C180600 */  dsll32      $3, $6, 0
/* 021130 00121030 3F180300 */  dsra32      $3, $3, 0
/* 021134 00121034 3F300600 */  dsra32      $6, $6, 0
/* 021138 00121038 000043AC */  sw          $3, 0x0($2)
/* 02113C 0012103C 04004224 */  addiu       $2, $2, 0x4
/* 021140 00121040 0C004324 */  addiu       $3, $2, 0xC
/* 021144 00121044 000046AC */  sw          $6, 0x0($2)
/* 021148 00121048 000083AC */  sw          $3, 0x0($4)
/* 02114C 0012104C 040045AC */  sw          $5, 0x4($2)
/* 021150 00121050 0800E003 */  jr          $31
/* 021154 00121054 080040AC */   sw         $0, 0x8($2)
