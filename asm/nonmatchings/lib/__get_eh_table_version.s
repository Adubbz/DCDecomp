.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __get_eh_table_version
/* DB28 0010DA28 0800E003 */  jr         $31
/* DB2C 0010DA2C 06008284 */   lh        $2, 0x6($4)
