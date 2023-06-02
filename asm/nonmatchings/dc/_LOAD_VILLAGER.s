.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _LOAD_VILLAGER__FP12RS_STACKDATAi
/* 8D220 0018D120 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 8D224 0018D124 0000BF7F */  sq         $31, 0x0($sp)
/* 8D228 0018D128 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 8D22C 0018D12C 68B320AC */  sw         $0, -0x4C98($at)
/* 8D230 0018D130 D301023C */  lui        $2, %hi(EdVillagerInfo)
/* 8D234 0018D134 D0294424 */  addiu      $4, $2, %lo(EdVillagerInfo)
/* 8D238 0018D138 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8D23C 0018D13C F0D32CC4 */  lwc1       $f12, -0x2C10($at)
/* 8D240 0018D140 6090858F */  lw         $5, -0x6FA0($gp)
/* 8D244 0018D144 F815060C */  jal        EdSelectVillager__FP13VILLAGER_INFOfP13EDIT_MAP_INFO
/* 8D248 0018D148 00000000 */   nop
/* 8D24C 0018D14C D301023C */  lui        $2, %hi(EdVillagerInfo)
/* 8D250 0018D150 D0294424 */  addiu      $4, $2, %lo(EdVillagerInfo)
/* 8D254 0018D154 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8D258 0018D158 10D4258C */  lw         $5, -0x2BF0($at)
/* 8D25C 0018D15C 28360070 */  paddub     $6, $0, $0
/* 8D260 0018D160 D017060C */  jal        EdInitVilager__FP13VILLAGER_INFOP11CEditGroundP1
/* 8D264 0018D164 00000000 */   nop
/* 8D268 0018D168 D201023C */  lui        $2, %hi(EdVillager)
/* 8D26C 0018D16C 905B4424 */  addiu      $4, $2, %lo(EdVillager)
/* 8D270 0018D170 D301023C */  lui        $2, %hi(EdVillagerInfo)
/* 8D274 0018D174 D0294524 */  addiu      $5, $2, %lo(EdVillagerInfo)
/* 8D278 0018D178 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8D27C 0018D17C 10D4268C */  lw         $6, -0x2BF0($at)
/* 8D280 0018D180 283E0070 */  paddub     $7, $0, $0
/* 8D284 0018D184 4419060C */  jal        EdInitVilagerPosition__FP12CNPCharacterP13VILLAGER_INFOP11CEditGroundPA4_f
/* 8D288 0018D188 00000000 */   nop
/* 8D28C 0018D18C 01000224 */  addiu      $2, $0, 0x1
/* 8D290 0018D190 0000BF7B */  lq         $31, 0x0($sp)
/* 8D294 0018D194 1000BD27 */  addiu      $sp, $sp, 0x10
/* 8D298 0018D198 0800E003 */  jr         $31
/* 8D29C 0018D19C 00000000 */   nop
