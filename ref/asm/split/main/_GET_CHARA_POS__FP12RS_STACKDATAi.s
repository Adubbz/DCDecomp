.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_CHARA_POS__FP12RS_STACKDATAi
/* 08E0B0 0018DFB0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 08E0B4 0018DFB4 1000BF7F */  sq          $31, 0x10($29)
/* 08E0B8 0018DFB8 0000B07F */  sq          $16, 0x0($29)
/* 08E0BC 0018DFBC 28868070 */  paddub      $16, $4, $0
/* 08E0C0 0018DFC0 0300A128 */  slti        $1, $5, 0x3
/* 08E0C4 0018DFC4 04002010 */  beqz        $1, .L0018DFD8
/* 08E0C8 0018DFC8 00000000 */   nop
/* 08E0CC 0018DFCC 28160070 */  paddub      $2, $0, $0
/* 08E0D0 0018DFD0 0D000010 */  b           .L0018E008
/* 08E0D4 0018DFD4 00000000 */   nop
.L0018DFD8:
/* 08E0D8 0018DFD8 D401013C */  lui         $1, %hi(EdEventInfo + 0x4C)
/* 08E0DC 0018DFDC 1CD2248C */  lw          $4, %lo(EdEventInfo + 0x4C)($1)
/* 08E0E0 0018DFE0 2000A527 */  addiu       $5, $29, 0x20
/* 08E0E4 0018DFE4 A000998C */  lw          $25, 0xA0($4)
/* 08E0E8 0018DFE8 A000398F */  lw          $25, 0xA0($25)
/* 08E0EC 0018DFEC 09F82003 */  jalr        $25
/* 08E0F0 0018DFF0 00000000 */   nop
/* 08E0F4 0018DFF4 28260072 */  paddub      $4, $16, $0
/* 08E0F8 0018DFF8 2000A527 */  addiu       $5, $29, 0x20
/* 08E0FC 0018DFFC 942D060C */  jal         SetPosition__FP12RS_STACKDATAPf
/* 08E100 0018E000 00000000 */   nop
/* 08E104 0018E004 01000224 */  addiu       $2, $0, 0x1
.L0018E008:
/* 08E108 0018E008 1000BF7B */  lq          $31, 0x10($29)
/* 08E10C 0018E00C 0000B07B */  lq          $16, 0x0($29)
/* 08E110 0018E010 3000BD27 */  addiu       $29, $29, 0x30
/* 08E114 0018E014 0800E003 */  jr          $31
/* 08E118 0018E018 00000000 */   nop
/* 08E11C 0018E01C 00000000 */  nop
