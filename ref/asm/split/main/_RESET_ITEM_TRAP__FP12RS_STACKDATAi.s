.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _RESET_ITEM_TRAP__FP12RS_STACKDATAi
/* 0BD330 001BD230 D501013C */  lui         $1, %hi(BtEventInfo + 0xAC)
/* 0BD334 001BD234 EC67228C */  lw          $2, %lo(BtEventInfo + 0xAC)($1)
/* 0BD338 001BD238 C89C838F */  lw          $3, -0x6338($28)
/* 0BD33C 001BD23C 80110200 */  sll         $2, $2, 6
/* 0BD340 001BD240 21104300 */  addu        $2, $2, $3
/* 0BD344 001BD244 0100013C */  lui         $1, (0x10000 >> 16)
/* 0BD348 001BD248 21084100 */  addu        $1, $2, $1
/* 0BD34C 001BD24C 90B620AC */  sw          $0, -0x4970($1)
/* 0BD350 001BD250 D501013C */  lui         $1, %hi(BtEventInfo + 0xAC)
/* 0BD354 001BD254 EC6720AC */  sw          $0, %lo(BtEventInfo + 0xAC)($1)
/* 0BD358 001BD258 01000224 */  addiu       $2, $0, 0x1
/* 0BD35C 001BD25C 0800E003 */  jr          $31
/* 0BD360 001BD260 00000000 */   nop
/* 0BD364 001BD264 00000000 */  nop
/* 0BD368 001BD268 00000000 */  nop
/* 0BD36C 001BD26C 00000000 */  nop
