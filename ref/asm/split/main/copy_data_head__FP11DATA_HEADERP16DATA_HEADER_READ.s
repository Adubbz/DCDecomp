.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel copy_data_head__FP11DATA_HEADERP16DATA_HEADER_READ
/* 03EA50 0013E950 0000A38C */  lw          $3, 0x0($5)
/* 03EA54 0013E954 000083AC */  sw          $3, 0x0($4)
/* 03EA58 0013E958 1000A38C */  lw          $3, 0x10($5)
/* 03EA5C 0013E95C 040083AC */  sw          $3, 0x4($4)
/* 03EA60 0013E960 1400A38C */  lw          $3, 0x14($5)
/* 03EA64 0013E964 080083AC */  sw          $3, 0x8($4)
/* 03EA68 0013E968 1800A38C */  lw          $3, 0x18($5)
/* 03EA6C 0013E96C 0C0083AC */  sw          $3, 0xC($4)
/* 03EA70 0013E970 1C00A38C */  lw          $3, 0x1C($5)
/* 03EA74 0013E974 100083AC */  sw          $3, 0x10($4)
/* 03EA78 0013E978 0800E003 */  jr          $31
/* 03EA7C 0013E97C 00000000 */   nop
