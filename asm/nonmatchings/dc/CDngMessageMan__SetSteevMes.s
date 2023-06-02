.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetSteevMes__14CDngMessageManFi
/* B5E40 001B5D40 0400838C */  lw         $3, 0x4($4)
/* B5E44 001B5D44 1000601C */  bgtz       $3, .L001B5D88
/* B5E48 001B5D48 00000000 */   nop
/* B5E4C 001B5D4C 2000838C */  lw         $3, 0x20($4)
/* B5E50 001B5D50 2118A300 */  addu       $3, $5, $3
/* B5E54 001B5D54 240083AC */  sw         $3, 0x24($4)
/* B5E58 001B5D58 F0000324 */  addiu      $3, $0, 0xF0
/* B5E5C 001B5D5C 040083AC */  sw         $3, 0x4($4)
/* B5E60 001B5D60 01000324 */  addiu      $3, $0, 0x1
/* B5E64 001B5D64 1C0083AC */  sw         $3, 0x1C($4)
/* B5E68 001B5D68 2000838C */  lw         $3, 0x20($4)
/* B5E6C 001B5D6C 01006324 */  addiu      $3, $3, 0x1
/* B5E70 001B5D70 200083AC */  sw         $3, 0x20($4)
/* B5E74 001B5D74 2000838C */  lw         $3, 0x20($4)
/* B5E78 001B5D78 0A006128 */  slti       $at, $3, 0xA
/* B5E7C 001B5D7C 02002014 */  bnez       $at, .L001B5D88
/* B5E80 001B5D80 00000000 */   nop
/* B5E84 001B5D84 200080AC */  sw         $0, 0x20($4)
.L001B5D88:
/* B5E88 001B5D88 0800E003 */  jr         $31
/* B5E8C 001B5D8C 00000000 */   nop
