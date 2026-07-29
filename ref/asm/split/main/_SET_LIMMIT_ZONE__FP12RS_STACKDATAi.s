.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_LIMMIT_ZONE__FP12RS_STACKDATAi
/* 0BD030 001BCF30 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0BD034 001BCF34 0000BF7F */  sq          $31, 0x0($29)
/* 0BD038 001BCF38 4CEE060C */  jal         GetStackInt__FP12RS_STACKDATA__2
/* 0BD03C 001BCF3C 00000000 */   nop
/* 0BD040 001BCF40 789C838F */  lw          $3, -0x6388($28)
/* 0BD044 001BCF44 0100013C */  lui         $1, (0x10000 >> 16)
/* 0BD048 001BCF48 21086100 */  addu        $1, $3, $1
/* 0BD04C 001BCF4C 108B22AC */  sw          $2, -0x74F0($1)
/* 0BD050 001BCF50 1B000424 */  addiu       $4, $0, 0x1B
/* 0BD054 001BCF54 B46D050C */  jal         SndSPSeLoad__Fi
/* 0BD058 001BCF58 00000000 */   nop
/* 0BD05C 001BCF5C 01000224 */  addiu       $2, $0, 0x1
/* 0BD060 001BCF60 0000BF7B */  lq          $31, 0x0($29)
/* 0BD064 001BCF64 1000BD27 */  addiu       $29, $29, 0x10
/* 0BD068 001BCF68 0800E003 */  jr          $31
/* 0BD06C 001BCF6C 00000000 */   nop
