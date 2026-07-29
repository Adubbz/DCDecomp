.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceGifPkAddGsAD
/* 020B20 00120A20 0000828C */  lw          $2, 0x0($4)
/* 020B24 00120A24 3C280500 */  dsll32      $5, $5, 0
/* 020B28 00120A28 3E280500 */  dsrl32      $5, $5, 0
/* 020B2C 00120A2C 000046FC */  sd          $6, 0x0($2)
/* 020B30 00120A30 08004224 */  addiu       $2, $2, 0x8
/* 020B34 00120A34 000045FC */  sd          $5, 0x0($2)
/* 020B38 00120A38 08004224 */  addiu       $2, $2, 0x8
/* 020B3C 00120A3C 0800E003 */  jr          $31
/* 020B40 00120A40 000082AC */   sw         $2, 0x0($4)
/* 020B44 00120A44 00000000 */  nop
