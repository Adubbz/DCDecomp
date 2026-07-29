.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetAlreadyGetMardanWeapon__Fi
/* 0F1390 001F1290 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0F1394 001F1294 0000BF7F */  sq          $31, 0x0($29)
/* 0F1398 001F1298 28368070 */  paddub      $6, $4, $0
/* 0F139C 001F129C 1C8D848F */  lw          $4, -0x72E4($28)
/* 0F13A0 001F12A0 CA000524 */  addiu       $5, $0, 0xCA
/* 0F13A4 001F12A4 A060050C */  jal         SetGameFlag__9CSaveDataFii
/* 0F13A8 001F12A8 00000000 */   nop
/* 0F13AC 001F12AC 0000BF7B */  lq          $31, 0x0($29)
/* 0F13B0 001F12B0 1000BD27 */  addiu       $29, $29, 0x10
/* 0F13B4 001F12B4 0800E003 */  jr          $31
/* 0F13B8 001F12B8 00000000 */   nop
/* 0F13BC 001F12BC 00000000 */  nop
