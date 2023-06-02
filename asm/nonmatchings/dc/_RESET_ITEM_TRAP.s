.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _RESET_ITEM_TRAP__FP12RS_STACKDATAi
/* BD330 001BD230 D501013C */  lui        $at, (0x1D567EC >> 16)
/* BD334 001BD234 EC67228C */  lw         $2, (0x1D567EC & 0xFFFF)($at)
/* BD338 001BD238 C89C838F */  lw         $3, -0x6338($gp)
/* BD33C 001BD23C 80110200 */  sll        $2, $2, 6
/* BD340 001BD240 21104300 */  addu       $2, $2, $3
/* BD344 001BD244 0100013C */  lui        $at, (0x10000 >> 16)
/* BD348 001BD248 21084100 */  addu       $at, $2, $at
/* BD34C 001BD24C 90B620AC */  sw         $0, -0x4970($at)
/* BD350 001BD250 D501013C */  lui        $at, (0x1D567EC >> 16)
/* BD354 001BD254 EC6720AC */  sw         $0, (0x1D567EC & 0xFFFF)($at)
/* BD358 001BD258 01000224 */  addiu      $2, $0, 0x1
/* BD35C 001BD25C 0800E003 */  jr         $31
/* BD360 001BD260 00000000 */   nop
/* BD364 001BD264 00000000 */  nop
/* BD368 001BD268 00000000 */  nop
/* BD36C 001BD26C 00000000 */  nop
