.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SATRA_CHIP_GET__FP12RS_STACKDATAi
/* 095930 00195830 D0FFBD27 */  addiu       $29, $29, -0x30
/* 095934 00195834 2000BF7F */  sq          $31, 0x20($29)
/* 095938 00195838 1000B17F */  sq          $17, 0x10($29)
/* 09593C 0019583C 0000B07F */  sq          $16, 0x0($29)
/* 095940 00195840 08009124 */  addiu       $17, $4, 0x8
/* 095944 00195844 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 095948 00195848 00000000 */   nop
/* 09594C 0019584C FFFF5024 */  addiu       $16, $2, -0x1
/* 095950 00195850 28262072 */  paddub      $4, $17, $0
/* 095954 00195854 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 095958 00195858 00000000 */   nop
/* 09595C 0019585C 1C8D848F */  lw          $4, -0x72E4($28)
/* 095960 00195860 282E0072 */  paddub      $5, $16, $0
/* 095964 00195864 28364070 */  paddub      $6, $2, $0
/* 095968 00195868 D861050C */  jal         AtraChipGet__9CSaveDataFii
/* 09596C 0019586C 00000000 */   nop
/* 095970 00195870 2000BF7B */  lq          $31, 0x20($29)
/* 095974 00195874 1000B17B */  lq          $17, 0x10($29)
/* 095978 00195878 0000B07B */  lq          $16, 0x0($29)
/* 09597C 0019587C 3000BD27 */  addiu       $29, $29, 0x30
/* 095980 00195880 0800E003 */  jr          $31
/* 095984 00195884 00000000 */   nop
/* 095988 00195888 00000000 */  nop
/* 09598C 0019588C 00000000 */  nop
