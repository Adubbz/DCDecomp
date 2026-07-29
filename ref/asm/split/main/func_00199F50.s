.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel func_00199F50
/* 09A050 00199F50 E0FFBD27 */  addiu       $29, $29, -0x20
/* 09A054 00199F54 1000BF7F */  sq          $31, 0x10($29)
/* 09A058 00199F58 0000B07F */  sq          $16, 0x0($29)
/* 09A05C 00199F5C 28868070 */  paddub      $16, $4, $0
/* 09A060 00199F60 38000426 */  addiu       $4, $16, 0x38
/* 09A064 00199F64 BCC3040C */  jal         __ct__8CTextureFv
/* 09A068 00199F68 00000000 */   nop
/* 09A06C 00199F6C 28160072 */  paddub      $2, $16, $0
/* 09A070 00199F70 1000BF7B */  lq          $31, 0x10($29)
/* 09A074 00199F74 0000B07B */  lq          $16, 0x0($29)
/* 09A078 00199F78 2000BD27 */  addiu       $29, $29, 0x20
/* 09A07C 00199F7C 0800E003 */  jr          $31
/* 09A080 00199F80 00000000 */   nop
/* 09A084 00199F84 00000000 */  nop
/* 09A088 00199F88 00000000 */  nop
/* 09A08C 00199F8C 00000000 */  nop
