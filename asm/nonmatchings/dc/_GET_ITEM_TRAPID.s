.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_ITEM_TRAPID__FP12RS_STACKDATAi
/* BD2E0 001BD1E0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* BD2E4 001BD1E4 0000BF7F */  sq         $31, 0x0($sp)
/* BD2E8 001BD1E8 D501013C */  lui        $at, (0x1D567EC >> 16)
/* BD2EC 001BD1EC EC67228C */  lw         $2, (0x1D567EC & 0xFFFF)($at)
/* BD2F0 001BD1F0 C89C838F */  lw         $3, -0x6338($gp)
/* BD2F4 001BD1F4 80110200 */  sll        $2, $2, 6
/* BD2F8 001BD1F8 21104300 */  addu       $2, $2, $3
/* BD2FC 001BD1FC 0100013C */  lui        $at, (0x10000 >> 16)
/* BD300 001BD200 21084100 */  addu       $at, $2, $at
/* BD304 001BD204 90B6258C */  lw         $5, -0x4970($at)
/* BD308 001BD208 70EE060C */  jal        SetStack__FP12RS_STACKDATAi_2
/* BD30C 001BD20C 00000000 */   nop
/* BD310 001BD210 01000224 */  addiu      $2, $0, 0x1
/* BD314 001BD214 0000BF7B */  lq         $31, 0x0($sp)
/* BD318 001BD218 1000BD27 */  addiu      $sp, $sp, 0x10
/* BD31C 001BD21C 0800E003 */  jr         $31
/* BD320 001BD220 00000000 */   nop
/* BD324 001BD224 00000000 */  nop
/* BD328 001BD228 00000000 */  nop
/* BD32C 001BD22C 00000000 */  nop
