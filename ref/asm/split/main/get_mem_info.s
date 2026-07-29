.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel get_mem_info
/* 014C18 00114B18 2000023C */  lui         $2, (0x200000 >> 16)
/* 014C1C 00114B1C 080080AC */  sw          $0, 0x8($4)
/* 014C20 00114B20 000082AC */  sw          $2, 0x0($4)
/* 014C24 00114B24 0800E003 */  jr          $31
/* 014C28 00114B28 040080AC */   sw         $0, 0x4($4)
/* 014C2C 00114B2C 00000000 */  nop
