.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __get_eh_table_language
/* DB30 0010DA30 0800E003 */  jr         $31
/* DB34 0010DA34 04008284 */   lh        $2, 0x4($4)
