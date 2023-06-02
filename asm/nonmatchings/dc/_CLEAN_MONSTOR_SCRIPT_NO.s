.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _CLEAN_MONSTOR_SCRIPT_NO__FP12RS_STACKDATAi
/* BCBB0 001BCAB0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* BCBB4 001BCAB4 3000BF7F */  sq         $31, 0x30($sp)
/* BCBB8 001BCAB8 2000B27F */  sq         $18, 0x20($sp)
/* BCBBC 001BCABC 1000B17F */  sq         $17, 0x10($sp)
/* BCBC0 001BCAC0 0000B07F */  sq         $16, 0x0($sp)
/* BCBC4 001BCAC4 288EA070 */  paddub     $17, $5, $0
/* BCBC8 001BCAC8 08009224 */  addiu      $18, $4, 0x8
/* BCBCC 001BCACC 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BCBD0 001BCAD0 00000000 */   nop
/* BCBD4 001BCAD4 28864070 */  paddub     $16, $2, $0
/* BCBD8 001BCAD8 D501013C */  lui        $at, (0x1D567E4 >> 16)
/* BCBDC 001BCADC E46720AC */  sw         $0, (0x1D567E4 & 0xFFFF)($at)
/* BCBE0 001BCAE0 0200212A */  slti       $at, $17, 0x2
/* BCBE4 001BCAE4 06002014 */  bnez       $at, .L001BCB00
/* BCBE8 001BCAE8 00000000 */   nop
/* BCBEC 001BCAEC 28264072 */  paddub     $4, $18, $0
/* BCBF0 001BCAF0 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BCBF4 001BCAF4 00000000 */   nop
/* BCBF8 001BCAF8 D501013C */  lui        $at, (0x1D567E4 >> 16)
/* BCBFC 001BCAFC E46722AC */  sw         $2, (0x1D567E4 & 0xFFFF)($at)
.L001BCB00:
/* BCC00 001BCB00 D501013C */  lui        $at, (0x1D567E0 >> 16)
/* BCC04 001BCB04 E06730AC */  sw         $16, (0x1D567E0 & 0xFFFF)($at)
/* BCC08 001BCB08 01000224 */  addiu      $2, $0, 0x1
/* BCC0C 001BCB0C 3000BF7B */  lq         $31, 0x30($sp)
/* BCC10 001BCB10 2000B27B */  lq         $18, 0x20($sp)
/* BCC14 001BCB14 1000B17B */  lq         $17, 0x10($sp)
/* BCC18 001BCB18 0000B07B */  lq         $16, 0x0($sp)
/* BCC1C 001BCB1C 4000BD27 */  addiu      $sp, $sp, 0x40
/* BCC20 001BCB20 0800E003 */  jr         $31
/* BCC24 001BCB24 00000000 */   nop
/* BCC28 001BCB28 00000000 */  nop
/* BCC2C 001BCB2C 00000000 */  nop
