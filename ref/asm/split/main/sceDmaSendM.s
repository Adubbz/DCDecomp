.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceDmaSendM
/* 00CD48 0010CC48 2900043C */  lui         $4, (0x290000 >> 16)
/* 00CD4C 0010CC4C A6110408 */  j           printf
/* 00CD50 0010CC50 C8738424 */   addiu      $4, $4, 0x73C8
/* 00CD54 0010CC54 00000000 */  nop
