.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandTABLE__FPPv
/* 05BCE0 0015BBE0 0000838C */  lw          $3, 0x0($4)
/* 05BCE4 0015BBE4 0000658C */  lw          $5, 0x0($3)
/* 05BCE8 0015BBE8 688E838F */  lw          $3, -0x7198($28)
/* 05BCEC 0015BBEC 080065AC */  sw          $5, 0x8($3)
/* 05BCF0 0015BBF0 0400838C */  lw          $3, 0x4($4)
/* 05BCF4 0015BBF4 0000648C */  lw          $4, 0x0($3)
/* 05BCF8 0015BBF8 688E838F */  lw          $3, -0x7198($28)
/* 05BCFC 0015BBFC 0C0064AC */  sw          $4, 0xC($3)
/* 05BD00 0015BC00 0800E003 */  jr          $31
/* 05BD04 0015BC04 00000000 */   nop
/* 05BD08 0015BC08 00000000 */  nop
/* 05BD0C 0015BC0C 00000000 */  nop
