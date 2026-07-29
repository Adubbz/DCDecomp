.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndSeSeqAllStop__Fv
/* 05B160 0015B060 D0FFBD27 */  addiu       $29, $29, -0x30
/* 05B164 0015B064 2000BF7F */  sq          $31, 0x20($29)
/* 05B168 0015B068 1000B17F */  sq          $17, 0x10($29)
/* 05B16C 0015B06C 0000B07F */  sq          $16, 0x0($29)
/* 05B170 0015B070 288E0070 */  paddub      $17, $0, $0
/* 05B174 0015B074 12000010 */  b           .L0015B0C0
/* 05B178 0015B078 00000000 */   nop
.L0015B07C:
/* 05B17C 0015B07C C0201100 */  sll         $4, $17, 3
/* 05B180 0015B080 D001033C */  lui         $3, %hi(se_seq)
/* 05B184 0015B084 30B56324 */  addiu       $3, $3, %lo(se_seq)
/* 05B188 0015B088 21806400 */  addu        $16, $3, $4
/* 05B18C 0015B08C 00000486 */  lh          $4, 0x0($16)
/* 05B190 0015B090 0A008004 */  bltz        $4, .L0015B0BC
/* 05B194 0015B094 00000000 */   nop
/* 05B198 0015B098 06000586 */  lh          $5, 0x6($16)
/* 05B19C 0015B09C 2C6A050C */  jal         SndSeStop__Fii
/* 05B1A0 0015B0A0 00000000 */   nop
/* 05B1A4 0015B0A4 28260072 */  paddub      $4, $16, $0
/* 05B1A8 0015B0A8 806B050C */  jal         InitSeSeq__FP10SND_SE_SEQ
/* 05B1AC 0015B0AC 00000000 */   nop
/* 05B1B0 0015B0B0 04000386 */  lh          $3, 0x4($16)
/* 05B1B4 0015B0B4 01006324 */  addiu       $3, $3, 0x1
/* 05B1B8 0015B0B8 040003A6 */  sh          $3, 0x4($16)
.L0015B0BC:
/* 05B1BC 0015B0BC 01003126 */  addiu       $17, $17, 0x1
.L0015B0C0:
/* 05B1C0 0015B0C0 2000232A */  slti        $3, $17, 0x20
/* 05B1C4 0015B0C4 EDFF6014 */  bnez        $3, .L0015B07C
/* 05B1C8 0015B0C8 00000000 */   nop
/* 05B1CC 0015B0CC 2000BF7B */  lq          $31, 0x20($29)
/* 05B1D0 0015B0D0 1000B17B */  lq          $17, 0x10($29)
/* 05B1D4 0015B0D4 0000B07B */  lq          $16, 0x0($29)
/* 05B1D8 0015B0D8 3000BD27 */  addiu       $29, $29, 0x30
/* 05B1DC 0015B0DC 0800E003 */  jr          $31
/* 05B1E0 0015B0E0 00000000 */   nop
/* 05B1E4 0015B0E4 00000000 */  nop
/* 05B1E8 0015B0E8 00000000 */  nop
/* 05B1EC 0015B0EC 00000000 */  nop
