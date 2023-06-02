.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetScene__Fi
/* 8B2B0 0018B1B0 D501023C */  lui        $2, %hi(SceneData)
/* 8B2B4 0018B1B4 B08F4224 */  addiu      $2, $2, %lo(SceneData)
/* 8B2B8 0018B1B8 0800E003 */  jr         $31
/* 8B2BC 0018B1BC 00000000 */   nop
