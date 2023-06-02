.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RemakeData__13CVisualShadowFPUi
/* 36940 00136840 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 36944 00136844 0000BF7F */  sq         $31, 0x0($sp)
/* 36948 00136848 2000868C */  lw         $6, 0x20($4)
/* 3694C 0013684C 0400C014 */  bnez       $6, .L00136860
/* 36950 00136850 00000000 */   nop
/* 36954 00136854 28160070 */  paddub     $2, $0, $0
/* 36958 00136858 07000010 */  b          .L00136878
/* 3695C 0013685C 00000000 */   nop
.L00136860:
/* 36960 00136860 C08B828F */  lw         $2, -0x7440($gp)
/* 36964 00136864 80100200 */  sll        $2, $2, 2
/* 36968 00136868 21104400 */  addu       $2, $2, $4
/* 3696C 0013686C 2800458C */  lw         $5, 0x28($2)
/* 36970 00136870 4CD9040C */  jal        CreateVUdataShadow__13CVisualShadowFPUiPUi
/* 36974 00136874 00000000 */   nop
.L00136878:
/* 36978 00136878 0000BF7B */  lq         $31, 0x0($sp)
/* 3697C 0013687C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 36980 00136880 0800E003 */  jr         $31
/* 36984 00136884 00000000 */   nop
/* 36988 00136888 00000000 */  nop
/* 3698C 0013688C 00000000 */  nop
