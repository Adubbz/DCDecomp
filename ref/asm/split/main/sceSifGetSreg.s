.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceSifGetSreg
/* 016618 00116518 2A00023C */  lui         $2, %hi(soft_reg)
/* 01661C 0011651C 80200400 */  sll         $4, $4, 2
/* 016620 00116520 405A4224 */  addiu       $2, $2, %lo(soft_reg)
/* 016624 00116524 21208200 */  addu        $4, $4, $2
/* 016628 00116528 0800E003 */  jr          $31
/* 01662C 0011652C 0000828C */   lw         $2, 0x0($4)
