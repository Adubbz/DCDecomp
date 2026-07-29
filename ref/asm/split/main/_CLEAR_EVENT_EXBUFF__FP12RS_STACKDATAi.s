.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _CLEAR_EVENT_EXBUFF__FP12RS_STACKDATAi
/* 08D640 0018D540 D201013C */  lui         $1, %hi(EdEventBuffer + 0x8)
/* 08D644 0018D544 78B3248C */  lw          $4, %lo(EdEventBuffer + 0x8)($1)
/* 08D648 0018D548 00190400 */  sll         $3, $4, 4
/* 08D64C 0018D54C D201013C */  lui         $1, %hi(EdEventBuffer)
/* 08D650 0018D550 70B3228C */  lw          $2, %lo(EdEventBuffer)($1)
/* 08D654 0018D554 21184300 */  addu        $3, $2, $3
/* 08D658 0018D558 D201013C */  lui         $1, %hi(EdEventBuffer + 0xC)
/* 08D65C 0018D55C 7CB3228C */  lw          $2, %lo(EdEventBuffer + 0xC)($1)
/* 08D660 0018D560 23104400 */  subu        $2, $2, $4
/* 08D664 0018D564 D201013C */  lui         $1, %hi(EdEventExBuffer)
/* 08D668 0018D568 80B323AC */  sw          $3, %lo(EdEventExBuffer)($1)
/* 08D66C 0018D56C D201013C */  lui         $1, %hi(EdEventExBuffer + 0xC)
/* 08D670 0018D570 8CB322AC */  sw          $2, %lo(EdEventExBuffer + 0xC)($1)
/* 08D674 0018D574 D201013C */  lui         $1, %hi(EdEventExBuffer + 0x8)
/* 08D678 0018D578 88B320AC */  sw          $0, %lo(EdEventExBuffer + 0x8)($1)
/* 08D67C 0018D57C 01000224 */  addiu       $2, $0, 0x1
/* 08D680 0018D580 0800E003 */  jr          $31
/* 08D684 0018D584 00000000 */   nop
/* 08D688 0018D588 00000000 */  nop
/* 08D68C 0018D58C 00000000 */  nop
