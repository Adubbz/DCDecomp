.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _CLEAR_VILLAGER_BUFF__FP12RS_STACKDATAi
/* 8D5B0 0018D4B0 5892848F */  lw         $4, -0x6DA8($gp)
/* 8D5B4 0018D4B4 0800858C */  lw         $5, 0x8($4)
/* 8D5B8 0018D4B8 00190500 */  sll        $3, $5, 4
/* 8D5BC 0018D4BC 0000828C */  lw         $2, 0x0($4)
/* 8D5C0 0018D4C0 21184300 */  addu       $3, $2, $3
/* 8D5C4 0018D4C4 0C00828C */  lw         $2, 0xC($4)
/* 8D5C8 0018D4C8 23104500 */  subu       $2, $2, $5
/* 8D5CC 0018D4CC D201013C */  lui        $at, (0x1D20000 >> 16)
/* 8D5D0 0018D4D0 60B323AC */  sw         $3, -0x4CA0($at)
/* 8D5D4 0018D4D4 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 8D5D8 0018D4D8 6CB322AC */  sw         $2, -0x4C94($at)
/* 8D5DC 0018D4DC D201013C */  lui        $at, (0x1D20000 >> 16)
/* 8D5E0 0018D4E0 68B320AC */  sw         $0, -0x4C98($at)
/* 8D5E4 0018D4E4 01000224 */  addiu      $2, $0, 0x1
/* 8D5E8 0018D4E8 0800E003 */  jr         $31
/* 8D5EC 0018D4EC 00000000 */   nop
