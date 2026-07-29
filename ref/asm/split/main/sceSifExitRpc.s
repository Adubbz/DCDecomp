.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceSifExitRpc
/* 016F08 00116E08 F0FFBD27 */  addiu       $29, $29, -0x10
/* 016F0C 00116E0C 0000BFFF */  sd          $31, 0x0($29)
/* 016F10 00116E10 005A040C */  jal         sceSifExitCmd
/* 016F14 00116E14 00000000 */   nop
/* 016F18 00116E18 2500023C */  lui         $2, %hi(_sceSifInitCheck)
/* 016F1C 00116E1C 0000BFDF */  ld          $31, 0x0($29)
/* 016F20 00116E20 000A40AC */  sw          $0, %lo(_sceSifInitCheck)($2)
/* 016F24 00116E24 0800E003 */  jr          $31
/* 016F28 00116E28 1000BD27 */   addiu      $29, $29, 0x10
/* 016F2C 00116E2C 00000000 */  nop
