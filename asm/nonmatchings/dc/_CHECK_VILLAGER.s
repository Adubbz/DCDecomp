.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _CHECK_VILLAGER__FP12RS_STACKDATAi
/* 90900 00190800 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 90904 00190804 1000BF7F */  sq         $31, 0x10($sp)
/* 90908 00190808 0000B07F */  sq         $16, 0x0($sp)
/* 9090C 0019080C 08009024 */  addiu      $16, $4, 0x8
/* 90910 00190810 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 90914 00190814 00000000 */   nop
/* 90918 00190818 C0180200 */  sll        $3, $2, 3
/* 9091C 0019081C 21186200 */  addu       $3, $3, $2
/* 90920 00190820 00210300 */  sll        $4, $3, 4
/* 90924 00190824 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 90928 00190828 CCD3238C */  lw         $3, -0x2C34($at)
/* 9092C 0019082C 21286400 */  addu       $5, $3, $4
/* 90930 00190830 28264070 */  paddub     $4, $2, $0
/* 90934 00190834 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 90938 00190838 10D4268C */  lw         $6, -0x2BF0($at)
/* 9093C 0019083C 1417060C */  jal        EdCheckVillager__FiP13VILLAGER_INFOP11CEditGround
/* 90940 00190840 00000000 */   nop
/* 90944 00190844 28260072 */  paddub     $4, $16, $0
/* 90948 00190848 282E4070 */  paddub     $5, $2, $0
/* 9094C 0019084C F828060C */  jal        SetStack__FP12RS_STACKDATAi
/* 90950 00190850 00000000 */   nop
/* 90954 00190854 01000224 */  addiu      $2, $0, 0x1
/* 90958 00190858 1000BF7B */  lq         $31, 0x10($sp)
/* 9095C 0019085C 0000B07B */  lq         $16, 0x0($sp)
/* 90960 00190860 2000BD27 */  addiu      $sp, $sp, 0x20
/* 90964 00190864 0800E003 */  jr         $31
/* 90968 00190868 00000000 */   nop
/* 9096C 0019086C 00000000 */  nop
