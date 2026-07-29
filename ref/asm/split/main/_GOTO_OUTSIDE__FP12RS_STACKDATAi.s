.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GOTO_OUTSIDE__FP12RS_STACKDATAi
/* 08C070 0018BF70 F0FFBD27 */  addiu       $29, $29, -0x10
/* 08C074 0018BF74 0000BF7F */  sq          $31, 0x0($29)
/* 08C078 0018BF78 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08C07C 0018BF7C 00000000 */   nop
/* 08C080 0018BF80 D401013C */  lui         $1, %hi(EdEventInfo + 0x2D4)
/* 08C084 0018BF84 A4D422AC */  sw          $2, %lo(EdEventInfo + 0x2D4)($1)
/* 08C088 0018BF88 07000224 */  addiu       $2, $0, 0x7
/* 08C08C 0018BF8C D401013C */  lui         $1, %hi(EdEventInfo + 0x448)
/* 08C090 0018BF90 18D622AC */  sw          $2, %lo(EdEventInfo + 0x448)($1)
/* 08C094 0018BF94 01000224 */  addiu       $2, $0, 0x1
/* 08C098 0018BF98 0000BF7B */  lq          $31, 0x0($29)
/* 08C09C 0018BF9C 1000BD27 */  addiu       $29, $29, 0x10
/* 08C0A0 0018BFA0 0800E003 */  jr          $31
/* 08C0A4 0018BFA4 00000000 */   nop
/* 08C0A8 0018BFA8 00000000 */  nop
/* 08C0AC 0018BFAC 00000000 */  nop
