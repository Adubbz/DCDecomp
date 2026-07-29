.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_CHARA_POS__FP12RS_STACKDATAi
/* 08E1A0 0018E0A0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 08E1A4 0018E0A4 0000BF7F */  sq          $31, 0x0($29)
/* 08E1A8 0018E0A8 1000A527 */  addiu       $5, $29, 0x10
/* 08E1AC 0018E0AC 7C2D060C */  jal         GetPosition__FP12RS_STACKDATAPf
/* 08E1B0 0018E0B0 00000000 */   nop
/* 08E1B4 0018E0B4 D401013C */  lui         $1, %hi(EdEventInfo + 0x4C)
/* 08E1B8 0018E0B8 1CD2248C */  lw          $4, %lo(EdEventInfo + 0x4C)($1)
/* 08E1BC 0018E0BC 1000A527 */  addiu       $5, $29, 0x10
/* 08E1C0 0018E0C0 A000998C */  lw          $25, 0xA0($4)
/* 08E1C4 0018E0C4 1400398F */  lw          $25, 0x14($25)
/* 08E1C8 0018E0C8 09F82003 */  jalr        $25
/* 08E1CC 0018E0CC 00000000 */   nop
/* 08E1D0 0018E0D0 01000224 */  addiu       $2, $0, 0x1
/* 08E1D4 0018E0D4 0000BF7B */  lq          $31, 0x0($29)
/* 08E1D8 0018E0D8 2000BD27 */  addiu       $29, $29, 0x20
/* 08E1DC 0018E0DC 0800E003 */  jr          $31
/* 08E1E0 0018E0E0 00000000 */   nop
/* 08E1E4 0018E0E4 00000000 */  nop
/* 08E1E8 0018E0E8 00000000 */  nop
/* 08E1EC 0018E0EC 00000000 */  nop
