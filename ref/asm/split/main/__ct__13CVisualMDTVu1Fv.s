.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __ct__13CVisualMDTVu1Fv
/* 0350B0 00134FB0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0350B4 00134FB4 1000BF7F */  sq          $31, 0x10($29)
/* 0350B8 00134FB8 0000B07F */  sq          $16, 0x0($29)
/* 0350BC 00134FBC 28868070 */  paddub      $16, $4, $0
/* 0350C0 00134FC0 C0D3040C */  jal         __ct__10CVisualVu1Fv
/* 0350C4 00134FC4 00000000 */   nop
/* 0350C8 00134FC8 2A00023C */  lui         $2, %hi(__vt__13CVisualMDTVu1)
/* 0350CC 00134FCC A0114224 */  addiu       $2, $2, %lo(__vt__13CVisualMDTVu1)
/* 0350D0 00134FD0 080002AE */  sw          $2, 0x8($16)
/* 0350D4 00134FD4 28260072 */  paddub      $4, $16, $0
/* 0350D8 00134FD8 DCD3040C */  jal         Initialize__13CVisualMDTVu1Fv
/* 0350DC 00134FDC 00000000 */   nop
/* 0350E0 00134FE0 28160072 */  paddub      $2, $16, $0
/* 0350E4 00134FE4 1000BF7B */  lq          $31, 0x10($29)
/* 0350E8 00134FE8 0000B07B */  lq          $16, 0x0($29)
/* 0350EC 00134FEC 2000BD27 */  addiu       $29, $29, 0x20
/* 0350F0 00134FF0 0800E003 */  jr          $31
/* 0350F4 00134FF4 00000000 */   nop
/* 0350F8 00134FF8 00000000 */  nop
/* 0350FC 00134FFC 00000000 */  nop
