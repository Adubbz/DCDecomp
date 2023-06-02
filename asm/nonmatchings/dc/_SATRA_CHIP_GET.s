.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SATRA_CHIP_GET__FP12RS_STACKDATAi
/* 95930 00195830 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 95934 00195834 2000BF7F */  sq         $31, 0x20($sp)
/* 95938 00195838 1000B17F */  sq         $17, 0x10($sp)
/* 9593C 0019583C 0000B07F */  sq         $16, 0x0($sp)
/* 95940 00195840 08009124 */  addiu      $17, $4, 0x8
/* 95944 00195844 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 95948 00195848 00000000 */   nop
/* 9594C 0019584C FFFF5024 */  addiu      $16, $2, -0x1
/* 95950 00195850 28262072 */  paddub     $4, $17, $0
/* 95954 00195854 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 95958 00195858 00000000 */   nop
/* 9595C 0019585C 1C8D848F */  lw         $4, -0x72E4($gp)
/* 95960 00195860 282E0072 */  paddub     $5, $16, $0
/* 95964 00195864 28364070 */  paddub     $6, $2, $0
/* 95968 00195868 D861050C */  jal        AtraChipGet__9CSaveDataFii
/* 9596C 0019586C 00000000 */   nop
/* 95970 00195870 2000BF7B */  lq         $31, 0x20($sp)
/* 95974 00195874 1000B17B */  lq         $17, 0x10($sp)
/* 95978 00195878 0000B07B */  lq         $16, 0x0($sp)
/* 9597C 0019587C 3000BD27 */  addiu      $sp, $sp, 0x30
/* 95980 00195880 0800E003 */  jr         $31
/* 95984 00195884 00000000 */   nop
/* 95988 00195888 00000000 */  nop
/* 9598C 0019588C 00000000 */  nop
