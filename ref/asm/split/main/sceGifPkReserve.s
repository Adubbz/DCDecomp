.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceGifPkReserve
/* 020A50 00120950 0000828C */  lw          $2, 0x0($4)
/* 020A54 00120954 80280500 */  sll         $5, $5, 2
/* 020A58 00120958 21284500 */  addu        $5, $2, $5
/* 020A5C 0012095C 0800E003 */  jr          $31
/* 020A60 00120960 000085AC */   sw         $5, 0x0($4)
/* 020A64 00120964 00000000 */  nop
