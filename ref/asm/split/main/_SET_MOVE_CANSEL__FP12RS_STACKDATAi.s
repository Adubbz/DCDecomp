.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_MOVE_CANSEL__FP12RS_STACKDATAi
/* 0E2B60 001E2A60 E09C848F */  lw          $4, -0x6320($28)
/* 0E2B64 001E2A64 9000838C */  lw          $3, 0x90($4)
/* 0E2B68 001E2A68 80100300 */  sll         $2, $3, 2
/* 0E2B6C 001E2A6C 21184300 */  addu        $3, $2, $3
/* 0E2B70 001E2A70 80100300 */  sll         $2, $3, 2
/* 0E2B74 001E2A74 21106200 */  addu        $2, $3, $2
/* 0E2B78 001E2A78 00110200 */  sll         $2, $2, 4
/* 0E2B7C 001E2A7C 21104400 */  addu        $2, $2, $4
/* 0E2B80 001E2A80 0200013C */  lui         $1, (0x20000 >> 16)
/* 0E2B84 001E2A84 21084100 */  addu        $1, $2, $1
/* 0E2B88 001E2A88 50E420AC */  sw          $0, -0x1BB0($1)
/* 0E2B8C 001E2A8C 01000224 */  addiu       $2, $0, 0x1
/* 0E2B90 001E2A90 0800E003 */  jr          $31
/* 0E2B94 001E2A94 00000000 */   nop
/* 0E2B98 001E2A98 00000000 */  nop
/* 0E2B9C 001E2A9C 00000000 */  nop
