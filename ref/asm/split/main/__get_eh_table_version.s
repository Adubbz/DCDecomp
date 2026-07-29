.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __get_eh_table_version
/* 00DB28 0010DA28 0800E003 */  jr          $31
/* 00DB2C 0010DA2C 06008284 */   lh         $2, 0x6($4)
