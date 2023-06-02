.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _CHECK_MARDAN__FP12RS_STACKDATAi
/* BD500 001BD400 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* BD504 001BD404 0000BF7F */  sq         $31, 0x0($sp)
/* BD508 001BD408 1C8D828F */  lw         $2, -0x72E4($gp)
/* BD50C 001BD40C 0100013C */  lui        $at, (0x12F94 >> 16)
/* BD510 001BD410 21084100 */  addu       $at, $2, $at
/* BD514 001BD414 942F258C */  lw         $5, (0x12F94 & 0xFFFF)($at)
/* BD518 001BD418 70EE060C */  jal        SetStack__FP12RS_STACKDATAi_2
/* BD51C 001BD41C 00000000 */   nop
/* BD520 001BD420 01000224 */  addiu      $2, $0, 0x1
/* BD524 001BD424 0000BF7B */  lq         $31, 0x0($sp)
/* BD528 001BD428 1000BD27 */  addiu      $sp, $sp, 0x10
/* BD52C 001BD42C 0800E003 */  jr         $31
/* BD530 001BD430 00000000 */   nop
/* BD534 001BD434 00000000 */  nop
/* BD538 001BD438 00000000 */  nop
/* BD53C 001BD43C 00000000 */  nop
