.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _LOAD_VILLAGER__FP12RS_STACKDATAi
/* 08D220 0018D120 F0FFBD27 */  addiu       $29, $29, -0x10
/* 08D224 0018D124 0000BF7F */  sq          $31, 0x0($29)
/* 08D228 0018D128 D201013C */  lui         $1, %hi(EdVillagerBuffer + 0x8)
/* 08D22C 0018D12C 68B320AC */  sw          $0, %lo(EdVillagerBuffer + 0x8)($1)
/* 08D230 0018D130 D301023C */  lui         $2, %hi(EdVillagerInfo)
/* 08D234 0018D134 D0294424 */  addiu       $4, $2, %lo(EdVillagerInfo)
/* 08D238 0018D138 D401013C */  lui         $1, %hi(EdEventInfo + 0x220)
/* 08D23C 0018D13C F0D32CC4 */  lwc1        $f12, %lo(EdEventInfo + 0x220)($1)
/* 08D240 0018D140 6090858F */  lw          $5, -0x6FA0($28)
/* 08D244 0018D144 F815060C */  jal         EdSelectVillager__FP13VILLAGER_INFOfP13EDIT_MAP_INFO
/* 08D248 0018D148 00000000 */   nop
/* 08D24C 0018D14C D301023C */  lui         $2, %hi(EdVillagerInfo)
/* 08D250 0018D150 D0294424 */  addiu       $4, $2, %lo(EdVillagerInfo)
/* 08D254 0018D154 D401013C */  lui         $1, %hi(EdEventInfo + 0x240)
/* 08D258 0018D158 10D4258C */  lw          $5, %lo(EdEventInfo + 0x240)($1)
/* 08D25C 0018D15C 28360070 */  paddub      $6, $0, $0
/* 08D260 0018D160 D017060C */  jal         EdInitVilager__FP13VILLAGER_INFOP11CEditGroundP1
/* 08D264 0018D164 00000000 */   nop
/* 08D268 0018D168 D201023C */  lui         $2, %hi(EdVillager)
/* 08D26C 0018D16C 905B4424 */  addiu       $4, $2, %lo(EdVillager)
/* 08D270 0018D170 D301023C */  lui         $2, %hi(EdVillagerInfo)
/* 08D274 0018D174 D0294524 */  addiu       $5, $2, %lo(EdVillagerInfo)
/* 08D278 0018D178 D401013C */  lui         $1, %hi(EdEventInfo + 0x240)
/* 08D27C 0018D17C 10D4268C */  lw          $6, %lo(EdEventInfo + 0x240)($1)
/* 08D280 0018D180 283E0070 */  paddub      $7, $0, $0
/* 08D284 0018D184 4419060C */  jal         EdInitVilagerPosition__FP12CNPCharacterP13VILLAGER_INFOP11CEditGroundPA4_f
/* 08D288 0018D188 00000000 */   nop
/* 08D28C 0018D18C 01000224 */  addiu       $2, $0, 0x1
/* 08D290 0018D190 0000BF7B */  lq          $31, 0x0($29)
/* 08D294 0018D194 1000BD27 */  addiu       $29, $29, 0x10
/* 08D298 0018D198 0800E003 */  jr          $31
/* 08D29C 0018D19C 00000000 */   nop
