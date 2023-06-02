.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EditMode__Fv
/* 7DF60 0017DE60 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 7DF64 0017DE64 0000BF7F */  sq         $31, 0x0($sp)
/* 7DF68 0017DE68 E890848F */  lw         $4, -0x6F18($gp)
/* 7DF6C 0017DE6C C886060C */  jal        EffectTask__11CEditGroundFv
/* 7DF70 0017DE70 00000000 */   nop
/* 7DF74 0017DE74 E890848F */  lw         $4, -0x6F18($gp)
/* 7DF78 0017DE78 048B060C */  jal        MakePartsBox__11CEditGroundFv
/* 7DF7C 0017DE7C 00000000 */   nop
/* 7DF80 0017DE80 3000060C */  jal        MoveEditCursor__Fv
/* 7DF84 0017DE84 00000000 */   nop
/* 7DF88 0017DE88 6CF7050C */  jal        EditPartsObjectOnOff__Fv
/* 7DF8C 0017DE8C 00000000 */   nop
/* 7DF90 0017DE90 0000BF7B */  lq         $31, 0x0($sp)
/* 7DF94 0017DE94 1000BD27 */  addiu      $sp, $sp, 0x10
/* 7DF98 0017DE98 0800E003 */  jr         $31
/* 7DF9C 0017DE9C 00000000 */   nop
