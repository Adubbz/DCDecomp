.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_ITEM_TRAPID__FP12RS_STACKDATAi
/* 0BD2E0 001BD1E0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0BD2E4 001BD1E4 0000BF7F */  sq          $31, 0x0($29)
/* 0BD2E8 001BD1E8 D501013C */  lui         $1, %hi(BtEventInfo + 0xAC)
/* 0BD2EC 001BD1EC EC67228C */  lw          $2, %lo(BtEventInfo + 0xAC)($1)
/* 0BD2F0 001BD1F0 C89C838F */  lw          $3, -0x6338($28)
/* 0BD2F4 001BD1F4 80110200 */  sll         $2, $2, 6
/* 0BD2F8 001BD1F8 21104300 */  addu        $2, $2, $3
/* 0BD2FC 001BD1FC 0100013C */  lui         $1, (0x10000 >> 16)
/* 0BD300 001BD200 21084100 */  addu        $1, $2, $1
/* 0BD304 001BD204 90B6258C */  lw          $5, -0x4970($1)
/* 0BD308 001BD208 70EE060C */  jal         SetStack__FP12RS_STACKDATAi__2
/* 0BD30C 001BD20C 00000000 */   nop
/* 0BD310 001BD210 01000224 */  addiu       $2, $0, 0x1
/* 0BD314 001BD214 0000BF7B */  lq          $31, 0x0($29)
/* 0BD318 001BD218 1000BD27 */  addiu       $29, $29, 0x10
/* 0BD31C 001BD21C 0800E003 */  jr          $31
/* 0BD320 001BD220 00000000 */   nop
/* 0BD324 001BD224 00000000 */  nop
/* 0BD328 001BD228 00000000 */  nop
/* 0BD32C 001BD22C 00000000 */  nop
