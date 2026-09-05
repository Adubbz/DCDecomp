.include "macro.inc"

.set noat
.set noreorder

glabel what__Q23std9exceptionCFv
    /* 022700 00122600 2A00023C */  lui        $2, %hi("@245")
    /* 022704 00122604 0800E003 */  jr         $31
    /* 022708 00122608 C88C4224 */   addiu     $2, $2, %lo("@245")
    /* 02270C 0012260C 00000000 */  nop
