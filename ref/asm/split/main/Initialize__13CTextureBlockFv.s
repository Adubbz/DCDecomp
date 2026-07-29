.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Initialize__13CTextureBlockFv
/* 031090 00130F90 000080A0 */  sb          $0, 0x0($4)
/* 031094 00130F94 240080AC */  sw          $0, 0x24($4)
/* 031098 00130F98 200080AC */  sw          $0, 0x20($4)
/* 03109C 00130F9C 300080AC */  sw          $0, 0x30($4)
/* 0310A0 00130FA0 380080AC */  sw          $0, 0x38($4)
/* 0310A4 00130FA4 340080AC */  sw          $0, 0x34($4)
/* 0310A8 00130FA8 280080AC */  sw          $0, 0x28($4)
/* 0310AC 00130FAC 2C0080AC */  sw          $0, 0x2C($4)
/* 0310B0 00130FB0 0800E003 */  jr          $31
/* 0310B4 00130FB4 00000000 */   nop
/* 0310B8 00130FB8 00000000 */  nop
/* 0310BC 00130FBC 00000000 */  nop
