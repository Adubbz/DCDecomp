.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _CLEAR_VILLAGER_BUFF__FP12RS_STACKDATAi
/* 08D5B0 0018D4B0 5892848F */  lw          $4, -0x6DA8($28)
/* 08D5B4 0018D4B4 0800858C */  lw          $5, 0x8($4)
/* 08D5B8 0018D4B8 00190500 */  sll         $3, $5, 4
/* 08D5BC 0018D4BC 0000828C */  lw          $2, 0x0($4)
/* 08D5C0 0018D4C0 21184300 */  addu        $3, $2, $3
/* 08D5C4 0018D4C4 0C00828C */  lw          $2, 0xC($4)
/* 08D5C8 0018D4C8 23104500 */  subu        $2, $2, $5
/* 08D5CC 0018D4CC D201013C */  lui         $1, %hi(EdVillagerBuffer)
/* 08D5D0 0018D4D0 60B323AC */  sw          $3, %lo(EdVillagerBuffer)($1)
/* 08D5D4 0018D4D4 D201013C */  lui         $1, %hi(EdVillagerBuffer + 0xC)
/* 08D5D8 0018D4D8 6CB322AC */  sw          $2, %lo(EdVillagerBuffer + 0xC)($1)
/* 08D5DC 0018D4DC D201013C */  lui         $1, %hi(EdVillagerBuffer + 0x8)
/* 08D5E0 0018D4E0 68B320AC */  sw          $0, %lo(EdVillagerBuffer + 0x8)($1)
/* 08D5E4 0018D4E4 01000224 */  addiu       $2, $0, 0x1
/* 08D5E8 0018D4E8 0800E003 */  jr          $31
/* 08D5EC 0018D4EC 00000000 */   nop
