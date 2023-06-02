.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_LIMMIT_ZONE__FP12RS_STACKDATAi
/* BD030 001BCF30 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* BD034 001BCF34 0000BF7F */  sq         $31, 0x0($sp)
/* BD038 001BCF38 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BD03C 001BCF3C 00000000 */   nop
/* BD040 001BCF40 789C838F */  lw         $3, -0x6388($gp)
/* BD044 001BCF44 0100013C */  lui        $at, (0x10000 >> 16)
/* BD048 001BCF48 21086100 */  addu       $at, $3, $at
/* BD04C 001BCF4C 108B22AC */  sw         $2, -0x74F0($at)
/* BD050 001BCF50 1B000424 */  addiu      $4, $0, 0x1B
/* BD054 001BCF54 B46D050C */  jal        SndSPSeLoad__Fi
/* BD058 001BCF58 00000000 */   nop
/* BD05C 001BCF5C 01000224 */  addiu      $2, $0, 0x1
/* BD060 001BCF60 0000BF7B */  lq         $31, 0x0($sp)
/* BD064 001BCF64 1000BD27 */  addiu      $sp, $sp, 0x10
/* BD068 001BCF68 0800E003 */  jr         $31
/* BD06C 001BCF6C 00000000 */   nop
