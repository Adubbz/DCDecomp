.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _CHECK_VILLAGER__FP12RS_STACKDATAi
/* 090900 00190800 E0FFBD27 */  addiu       $29, $29, -0x20
/* 090904 00190804 1000BF7F */  sq          $31, 0x10($29)
/* 090908 00190808 0000B07F */  sq          $16, 0x0($29)
/* 09090C 0019080C 08009024 */  addiu       $16, $4, 0x8
/* 090910 00190810 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 090914 00190814 00000000 */   nop
/* 090918 00190818 C0180200 */  sll         $3, $2, 3
/* 09091C 0019081C 21186200 */  addu        $3, $3, $2
/* 090920 00190820 00210300 */  sll         $4, $3, 4
/* 090924 00190824 D401013C */  lui         $1, %hi(EdEventInfo + 0x1FC)
/* 090928 00190828 CCD3238C */  lw          $3, %lo(EdEventInfo + 0x1FC)($1)
/* 09092C 0019082C 21286400 */  addu        $5, $3, $4
/* 090930 00190830 28264070 */  paddub      $4, $2, $0
/* 090934 00190834 D401013C */  lui         $1, %hi(EdEventInfo + 0x240)
/* 090938 00190838 10D4268C */  lw          $6, %lo(EdEventInfo + 0x240)($1)
/* 09093C 0019083C 1417060C */  jal         EdCheckVillager__FiP13VILLAGER_INFOP11CEditGround
/* 090940 00190840 00000000 */   nop
/* 090944 00190844 28260072 */  paddub      $4, $16, $0
/* 090948 00190848 282E4070 */  paddub      $5, $2, $0
/* 09094C 0019084C F828060C */  jal         SetStack__FP12RS_STACKDATAi
/* 090950 00190850 00000000 */   nop
/* 090954 00190854 01000224 */  addiu       $2, $0, 0x1
/* 090958 00190858 1000BF7B */  lq          $31, 0x10($29)
/* 09095C 0019085C 0000B07B */  lq          $16, 0x0($29)
/* 090960 00190860 2000BD27 */  addiu       $29, $29, 0x20
/* 090964 00190864 0800E003 */  jr          $31
/* 090968 00190868 00000000 */   nop
/* 09096C 0019086C 00000000 */  nop
