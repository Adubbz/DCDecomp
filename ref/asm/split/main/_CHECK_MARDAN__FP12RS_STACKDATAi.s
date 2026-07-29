.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _CHECK_MARDAN__FP12RS_STACKDATAi
/* 0BD500 001BD400 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0BD504 001BD404 0000BF7F */  sq          $31, 0x0($29)
/* 0BD508 001BD408 1C8D828F */  lw          $2, -0x72E4($28)
/* 0BD50C 001BD40C 0100013C */  lui         $1, (0x12F94 >> 16)
/* 0BD510 001BD410 21084100 */  addu        $1, $2, $1
/* 0BD514 001BD414 942F258C */  lw          $5, (0x12F94 & 0xFFFF)($1)
/* 0BD518 001BD418 70EE060C */  jal         SetStack__FP12RS_STACKDATAi__2
/* 0BD51C 001BD41C 00000000 */   nop
/* 0BD520 001BD420 01000224 */  addiu       $2, $0, 0x1
/* 0BD524 001BD424 0000BF7B */  lq          $31, 0x0($29)
/* 0BD528 001BD428 1000BD27 */  addiu       $29, $29, 0x10
/* 0BD52C 001BD42C 0800E003 */  jr          $31
/* 0BD530 001BD430 00000000 */   nop
/* 0BD534 001BD434 00000000 */  nop
/* 0BD538 001BD438 00000000 */  nop
/* 0BD53C 001BD43C 00000000 */  nop
