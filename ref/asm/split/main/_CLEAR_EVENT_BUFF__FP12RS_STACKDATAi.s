.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _CLEAR_EVENT_BUFF__FP12RS_STACKDATAi
/* 08D5F0 0018D4F0 D201013C */  lui         $1, %hi(EdVillagerBuffer + 0x8)
/* 08D5F4 0018D4F4 68B3248C */  lw          $4, %lo(EdVillagerBuffer + 0x8)($1)
/* 08D5F8 0018D4F8 00190400 */  sll         $3, $4, 4
/* 08D5FC 0018D4FC D201013C */  lui         $1, %hi(EdVillagerBuffer)
/* 08D600 0018D500 60B3228C */  lw          $2, %lo(EdVillagerBuffer)($1)
/* 08D604 0018D504 21184300 */  addu        $3, $2, $3
/* 08D608 0018D508 D201013C */  lui         $1, %hi(EdVillagerBuffer + 0xC)
/* 08D60C 0018D50C 6CB3228C */  lw          $2, %lo(EdVillagerBuffer + 0xC)($1)
/* 08D610 0018D510 23104400 */  subu        $2, $2, $4
/* 08D614 0018D514 D201013C */  lui         $1, %hi(EdEventBuffer)
/* 08D618 0018D518 70B323AC */  sw          $3, %lo(EdEventBuffer)($1)
/* 08D61C 0018D51C D201013C */  lui         $1, %hi(EdEventBuffer + 0xC)
/* 08D620 0018D520 7CB322AC */  sw          $2, %lo(EdEventBuffer + 0xC)($1)
/* 08D624 0018D524 D201013C */  lui         $1, %hi(EdEventBuffer + 0x8)
/* 08D628 0018D528 78B320AC */  sw          $0, %lo(EdEventBuffer + 0x8)($1)
/* 08D62C 0018D52C 01000224 */  addiu       $2, $0, 0x1
/* 08D630 0018D530 0800E003 */  jr          $31
/* 08D634 0018D534 00000000 */   nop
/* 08D638 0018D538 00000000 */  nop
/* 08D63C 0018D53C 00000000 */  nop
