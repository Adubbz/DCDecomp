.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadPackData2__10CCharacterFPUiPcP14CDataAlloc2_1_iP14CDataAlloc2_1_i
/* 39950 00139850 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 39954 00139854 1000BF7F */  sq         $31, 0x10($sp)
/* 39958 00139858 28160071 */  paddub     $2, $8, $0
/* 3995C 0013985C 285E2071 */  paddub     $11, $9, $0
/* 39960 00139860 0000AAFF */  sd         $10, 0x0($sp)
/* 39964 00139864 0800A0FF */  sd         $0, 0x8($sp)
/* 39968 00139868 2846E070 */  paddub     $8, $7, $0
/* 3996C 0013986C 284EE070 */  paddub     $9, $7, $0
/* 39970 00139870 28564070 */  paddub     $10, $2, $0
/* 39974 00139874 44E7040C */  jal        ReadInfo__FP10CCharacterPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_P14CDataAlloc2_1_iP14CDataAlloc2_1_ii
/* 39978 00139878 00000000 */   nop
/* 3997C 0013987C 1000BF7B */  lq         $31, 0x10($sp)
/* 39980 00139880 2000BD27 */  addiu      $sp, $sp, 0x20
/* 39984 00139884 0800E003 */  jr         $31
/* 39988 00139888 00000000 */   nop
/* 3998C 0013988C 00000000 */  nop
