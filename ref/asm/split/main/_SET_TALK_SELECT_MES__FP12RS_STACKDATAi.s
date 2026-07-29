.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_TALK_SELECT_MES__FP12RS_STACKDATAi
/* 0919E0 001918E0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0919E4 001918E4 1000BF7F */  sq          $31, 0x10($29)
/* 0919E8 001918E8 0000B07F */  sq          $16, 0x0($29)
/* 0919EC 001918EC 08009024 */  addiu       $16, $4, 0x8
/* 0919F0 001918F0 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 0919F4 001918F4 00000000 */   nop
/* 0919F8 001918F8 D401013C */  lui         $1, %hi(EdEventInfo + 0x2A8)
/* 0919FC 001918FC 78D422AC */  sw          $2, %lo(EdEventInfo + 0x2A8)($1)
/* 091A00 00191900 28260072 */  paddub      $4, $16, $0
/* 091A04 00191904 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 091A08 00191908 00000000 */   nop
/* 091A0C 0019190C D401013C */  lui         $1, %hi(EdEventInfo + 0x2A4)
/* 091A10 00191910 74D422AC */  sw          $2, %lo(EdEventInfo + 0x2A4)($1)
/* 091A14 00191914 01000224 */  addiu       $2, $0, 0x1
/* 091A18 00191918 1000BF7B */  lq          $31, 0x10($29)
/* 091A1C 0019191C 0000B07B */  lq          $16, 0x0($29)
/* 091A20 00191920 2000BD27 */  addiu       $29, $29, 0x20
/* 091A24 00191924 0800E003 */  jr          $31
/* 091A28 00191928 00000000 */   nop
/* 091A2C 0019192C 00000000 */  nop
