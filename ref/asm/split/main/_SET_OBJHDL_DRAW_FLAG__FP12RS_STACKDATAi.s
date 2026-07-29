.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_OBJHDL_DRAW_FLAG__FP12RS_STACKDATAi
/* 0BC130 001BC030 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0BC134 001BC034 2000BF7F */  sq          $31, 0x20($29)
/* 0BC138 001BC038 1000B17F */  sq          $17, 0x10($29)
/* 0BC13C 001BC03C 0000B07F */  sq          $16, 0x0($29)
/* 0BC140 001BC040 08009124 */  addiu       $17, $4, 0x8
/* 0BC144 001BC044 4CEE060C */  jal         GetStackInt__FP12RS_STACKDATA__2
/* 0BC148 001BC048 00000000 */   nop
/* 0BC14C 001BC04C 28864070 */  paddub      $16, $2, $0
/* 0BC150 001BC050 28262072 */  paddub      $4, $17, $0
/* 0BC154 001BC054 4CEE060C */  jal         GetStackInt__FP12RS_STACKDATA__2
/* 0BC158 001BC058 00000000 */   nop
/* 0BC15C 001BC05C 288E4070 */  paddub      $17, $2, $0
/* 0BC160 001BC060 28260072 */  paddub      $4, $16, $0
/* 0BC164 001BC064 80EC060C */  jal         GetObjHDL__Fi
/* 0BC168 001BC068 00000000 */   nop
/* 0BC16C 001BC06C 0800438C */  lw          $3, 0x8($2)
/* 0BC170 001BC070 0A006014 */  bnez        $3, .L001BC09C
/* 0BC174 001BC074 00000000 */   nop
/* 0BC178 001BC078 0000438C */  lw          $3, 0x0($2)
/* 0BC17C 001BC07C 07006010 */  beqz        $3, .L001BC09C
/* 0BC180 001BC080 00000000 */   nop
/* 0BC184 001BC084 02000424 */  addiu       $4, $0, 0x2
/* 0BC188 001BC088 02002012 */  beqz        $17, .L001BC094
/* 0BC18C 001BC08C 00000000 */   nop
/* 0BC190 001BC090 01000424 */  addiu       $4, $0, 0x1
.L001BC094:
/* 0BC194 001BC094 B00064A4 */  sh          $4, 0xB0($3)
/* 0BC198 001BC098 000064AC */  sw          $4, 0x0($3)
.L001BC09C:
/* 0BC19C 001BC09C 0800448C */  lw          $4, 0x8($2)
/* 0BC1A0 001BC0A0 01000324 */  addiu       $3, $0, 0x1
/* 0BC1A4 001BC0A4 0C008314 */  bne         $4, $3, .L001BC0D8
/* 0BC1A8 001BC0A8 00000000 */   nop
/* 0BC1AC 001BC0AC 0400428C */  lw          $2, 0x4($2)
/* 0BC1B0 001BC0B0 09004010 */  beqz        $2, .L001BC0D8
/* 0BC1B4 001BC0B4 00000000 */   nop
/* 0BC1B8 001BC0B8 BC00428C */  lw          $2, 0xBC($2)
/* 0BC1BC 001BC0BC 06004010 */  beqz        $2, .L001BC0D8
/* 0BC1C0 001BC0C0 00000000 */   nop
/* 0BC1C4 001BC0C4 02000424 */  addiu       $4, $0, 0x2
/* 0BC1C8 001BC0C8 02002012 */  beqz        $17, .L001BC0D4
/* 0BC1CC 001BC0CC 00000000 */   nop
/* 0BC1D0 001BC0D0 28266070 */  paddub      $4, $3, $0
.L001BC0D4:
/* 0BC1D4 001BC0D4 B00044A4 */  sh          $4, 0xB0($2)
.L001BC0D8:
/* 0BC1D8 001BC0D8 01000224 */  addiu       $2, $0, 0x1
/* 0BC1DC 001BC0DC 2000BF7B */  lq          $31, 0x20($29)
/* 0BC1E0 001BC0E0 1000B17B */  lq          $17, 0x10($29)
/* 0BC1E4 001BC0E4 0000B07B */  lq          $16, 0x0($29)
/* 0BC1E8 001BC0E8 3000BD27 */  addiu       $29, $29, 0x30
/* 0BC1EC 001BC0EC 0800E003 */  jr          $31
/* 0BC1F0 001BC0F0 00000000 */   nop
/* 0BC1F4 001BC0F4 00000000 */  nop
/* 0BC1F8 001BC0F8 00000000 */  nop
/* 0BC1FC 001BC0FC 00000000 */  nop
