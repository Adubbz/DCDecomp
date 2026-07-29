.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceDmaPutStallAddr
/* 00C7D0 0010C6D0 0010023C */  lui         $2, (0x1000E060 >> 16)
/* 00C7D4 0010C6D4 FFFF033C */  lui         $3, (0xFFFFFFFF >> 16)
/* 00C7D8 0010C6D8 60E04234 */  ori         $2, $2, (0x1000E060 & 0xFFFF)
/* 00C7DC 0010C6DC FFFF6334 */  ori         $3, $3, (0xFFFFFFFF & 0xFFFF)
/* 00C7E0 0010C6E0 03008310 */  beq         $4, $3, .L0010C6F0
/* 00C7E4 0010C6E4 0000428C */   lw         $2, 0x0($2)
/* 00C7E8 0010C6E8 0110013C */  lui         $1, (0x10010000 >> 16)
/* 00C7EC 0010C6EC 60E024AC */  sw          $4, -0x1FA0($1)
.L0010C6F0:
/* 00C7F0 0010C6F0 0800E003 */  jr          $31
/* 00C7F4 0010C6F4 00000000 */   nop
