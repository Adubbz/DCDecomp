.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel get_mem_info
/* 14C18 00114B18 2000023C */  lui        $2, (0x200000 >> 16)
/* 14C1C 00114B1C 080080AC */  sw         $0, 0x8($4)
/* 14C20 00114B20 000082AC */  sw         $2, 0x0($4)
/* 14C24 00114B24 0800E003 */  jr         $31
/* 14C28 00114B28 040080AC */   sw        $0, 0x4($4)
/* 14C2C 00114B2C 00000000 */  nop
