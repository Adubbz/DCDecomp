.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadSndTxt__Fv
/* 040F90 00140E90 58C4BD27 */  addiu       $29, $29, -0x3BA8
/* 040F94 00140E94 0880BD27 */  addiu       $29, $29, -0x7FF8
/* 040F98 00140E98 1000BF7F */  sq          $31, 0x10($29)
/* 040F9C 00140E9C 0000B07F */  sq          $16, 0x0($29)
/* 040FA0 00140EA0 2000B027 */  addiu       $16, $29, 0x20
/* 040FA4 00140EA4 3F000332 */  andi        $3, $16, 0x3F
/* 040FA8 00140EA8 04000106 */  bgez        $16, .L00140EBC
/* 040FAC 00140EAC 00000000 */   nop
/* 040FB0 00140EB0 02006010 */  beqz        $3, .L00140EBC
/* 040FB4 00140EB4 00000000 */   nop
/* 040FB8 00140EB8 C0FF6324 */  addiu       $3, $3, -0x40
.L00140EBC:
/* 040FBC 00140EBC 04006010 */  beqz        $3, .L00140ED0
/* 040FC0 00140EC0 00000000 */   nop
/* 040FC4 00140EC4 40000224 */  addiu       $2, $0, 0x40
/* 040FC8 00140EC8 23104300 */  subu        $2, $2, $3
/* 040FCC 00140ECC 21800202 */  addu        $16, $16, $2
.L00140ED0:
/* 040FD0 00140ED0 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 040FD4 00140ED4 2A00023C */  lui         $2, %hi(LIT_657)
/* 040FD8 00140ED8 60934524 */  addiu       $5, $2, %lo(LIT_657)
/* 040FDC 00140EDC 28360072 */  paddub      $6, $16, $0
/* 040FE0 00140EE0 F012050C */  jal         LoadSeInf__6CSoundFPcPUi
/* 040FE4 00140EE4 00000000 */   nop
/* 040FE8 00140EE8 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 040FEC 00140EEC 2A00023C */  lui         $2, %hi(LIT_658)
/* 040FF0 00140EF0 80934524 */  addiu       $5, $2, %lo(LIT_658)
/* 040FF4 00140EF4 28360072 */  paddub      $6, $16, $0
/* 040FF8 00140EF8 A412050C */  jal         LoadSqInf__6CSoundFPcPUi
/* 040FFC 00140EFC 00000000 */   nop
/* 041000 00140F00 E464050C */  jal         SndInitSeTable__Fv
/* 041004 00140F04 00000000 */   nop
/* 041008 00140F08 1000BF7B */  lq          $31, 0x10($29)
/* 04100C 00140F0C 0000B07B */  lq          $16, 0x0($29)
/* 041010 00140F10 A83BBD27 */  addiu       $29, $29, 0x3BA8
/* 041014 00140F14 F87FBD27 */  addiu       $29, $29, 0x7FF8
/* 041018 00140F18 0800E003 */  jr          $31
/* 04101C 00140F1C 00000000 */   nop
