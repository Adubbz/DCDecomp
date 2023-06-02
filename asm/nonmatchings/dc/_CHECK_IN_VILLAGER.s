.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _CHECK_IN_VILLAGER__FP12RS_STACKDATAi
/* 8D2A0 0018D1A0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 8D2A4 0018D1A4 1000BF7F */  sq         $31, 0x10($sp)
/* 8D2A8 0018D1A8 0000B07F */  sq         $16, 0x0($sp)
/* 8D2AC 0018D1AC 08009024 */  addiu      $16, $4, 0x8
/* 8D2B0 0018D1B0 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8D2B4 0018D1B4 00000000 */   nop
/* 8D2B8 0018D1B8 C0180200 */  sll        $3, $2, 3
/* 8D2BC 0018D1BC 21186200 */  addu       $3, $3, $2
/* 8D2C0 0018D1C0 00210300 */  sll        $4, $3, 4
/* 8D2C4 0018D1C4 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8D2C8 0018D1C8 CCD3238C */  lw         $3, -0x2C34($at)
/* 8D2CC 0018D1CC 21286400 */  addu       $5, $3, $4
/* 8D2D0 0018D1D0 28264070 */  paddub     $4, $2, $0
/* 8D2D4 0018D1D4 BC16060C */  jal        EdCheckVillagerIn__FiP13VILLAGER_INFO
/* 8D2D8 0018D1D8 00000000 */   nop
/* 8D2DC 0018D1DC 282E4070 */  paddub     $5, $2, $0
/* 8D2E0 0018D1E0 28260072 */  paddub     $4, $16, $0
/* 8D2E4 0018D1E4 F828060C */  jal        SetStack__FP12RS_STACKDATAi
/* 8D2E8 0018D1E8 00000000 */   nop
/* 8D2EC 0018D1EC 01000224 */  addiu      $2, $0, 0x1
/* 8D2F0 0018D1F0 1000BF7B */  lq         $31, 0x10($sp)
/* 8D2F4 0018D1F4 0000B07B */  lq         $16, 0x0($sp)
/* 8D2F8 0018D1F8 2000BD27 */  addiu      $sp, $sp, 0x20
/* 8D2FC 0018D1FC 0800E003 */  jr         $31
/* 8D300 0018D200 00000000 */   nop
/* 8D304 0018D204 00000000 */  nop
/* 8D308 0018D208 00000000 */  nop
/* 8D30C 0018D20C 00000000 */  nop
