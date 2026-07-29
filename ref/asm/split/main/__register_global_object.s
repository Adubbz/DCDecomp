.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __register_global_object
/* 022A30 00122930 2B00013C */  lui         $1, %hi(__global_destructor_chain)
/* 022A34 00122934 00A0238C */  lw          $3, %lo(__global_destructor_chain)($1)
/* 022A38 00122938 28168070 */  paddub      $2, $4, $0
/* 022A3C 0012293C 0000C3AC */  sw          $3, 0x0($6)
/* 022A40 00122940 0400C5AC */  sw          $5, 0x4($6)
/* 022A44 00122944 0800C4AC */  sw          $4, 0x8($6)
/* 022A48 00122948 2B00013C */  lui         $1, %hi(__global_destructor_chain)
/* 022A4C 0012294C 0800E003 */  jr          $31
/* 022A50 00122950 00A026AC */   sw         $6, %lo(__global_destructor_chain)($1)
/* 022A54 00122954 00000000 */  nop
/* 022A58 00122958 00000000 */  nop
/* 022A5C 0012295C 00000000 */  nop
