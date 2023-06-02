.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _FADE_IN__FP12RS_STACKDATAi
/* 92D40 00192C40 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 92D44 00192C44 5000BF7F */  sq         $31, 0x50($sp)
/* 92D48 00192C48 4000B47F */  sq         $20, 0x40($sp)
/* 92D4C 00192C4C 3000B37F */  sq         $19, 0x30($sp)
/* 92D50 00192C50 2000B27F */  sq         $18, 0x20($sp)
/* 92D54 00192C54 1000B17F */  sq         $17, 0x10($sp)
/* 92D58 00192C58 0000B07F */  sq         $16, 0x0($sp)
/* 92D5C 00192C5C 289EA070 */  paddub     $19, $5, $0
/* 92D60 00192C60 08009424 */  addiu      $20, $4, 0x8
/* 92D64 00192C64 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 92D68 00192C68 00000000 */   nop
/* 92D6C 00192C6C 28964070 */  paddub     $18, $2, $0
/* 92D70 00192C70 28160070 */  paddub     $2, $0, $0
/* 92D74 00192C74 288E0070 */  paddub     $17, $0, $0
/* 92D78 00192C78 28860070 */  paddub     $16, $0, $0
/* 92D7C 00192C7C 04000324 */  addiu      $3, $0, 0x4
/* 92D80 00192C80 0E006316 */  bne        $19, $3, .L00192CBC
/* 92D84 00192C84 00000000 */   nop
/* 92D88 00192C88 28268072 */  paddub     $4, $20, $0
/* 92D8C 00192C8C 08009424 */  addiu      $20, $4, 0x8
/* 92D90 00192C90 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 92D94 00192C94 00000000 */   nop
/* 92D98 00192C98 28864070 */  paddub     $16, $2, $0
/* 92D9C 00192C9C 28268072 */  paddub     $4, $20, $0
/* 92DA0 00192CA0 08009424 */  addiu      $20, $4, 0x8
/* 92DA4 00192CA4 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 92DA8 00192CA8 00000000 */   nop
/* 92DAC 00192CAC 288E4070 */  paddub     $17, $2, $0
/* 92DB0 00192CB0 28268072 */  paddub     $4, $20, $0
/* 92DB4 00192CB4 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 92DB8 00192CB8 00000000 */   nop
.L00192CBC:
/* 92DBC 00192CBC 00009044 */  mtc1       $16, $f0
/* 92DC0 00192CC0 00000000 */  nop
/* 92DC4 00192CC4 20038046 */  cvt.s.w    $f12, $f0
/* 92DC8 00192CC8 00009144 */  mtc1       $17, $f0
/* 92DCC 00192CCC 00000000 */  nop
/* 92DD0 00192CD0 60038046 */  cvt.s.w    $f13, $f0
/* 92DD4 00192CD4 00008244 */  mtc1       $2, $f0
/* 92DD8 00192CD8 00000000 */  nop
/* 92DDC 00192CDC A0038046 */  cvt.s.w    $f14, $f0
/* 92DE0 00192CE0 28264072 */  paddub     $4, $18, $0
/* 92DE4 00192CE4 C425060C */  jal        EdFadeIn__Fifff
/* 92DE8 00192CE8 00000000 */   nop
/* 92DEC 00192CEC 01000224 */  addiu      $2, $0, 0x1
/* 92DF0 00192CF0 5000BF7B */  lq         $31, 0x50($sp)
/* 92DF4 00192CF4 4000B47B */  lq         $20, 0x40($sp)
/* 92DF8 00192CF8 3000B37B */  lq         $19, 0x30($sp)
/* 92DFC 00192CFC 2000B27B */  lq         $18, 0x20($sp)
/* 92E00 00192D00 1000B17B */  lq         $17, 0x10($sp)
/* 92E04 00192D04 0000B07B */  lq         $16, 0x0($sp)
/* 92E08 00192D08 6000BD27 */  addiu      $sp, $sp, 0x60
/* 92E0C 00192D0C 0800E003 */  jr         $31
/* 92E10 00192D10 00000000 */   nop
/* 92E14 00192D14 00000000 */  nop
/* 92E18 00192D18 00000000 */  nop
/* 92E1C 00192D1C 00000000 */  nop
