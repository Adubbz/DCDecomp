.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __get_eh_table_language
/* 00DB30 0010DA30 0800E003 */  jr          $31
/* 00DB34 0010DA34 04008284 */   lh         $2, 0x4($4)
