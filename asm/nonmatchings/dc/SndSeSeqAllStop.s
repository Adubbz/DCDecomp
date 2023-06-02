.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndSeSeqAllStop__Fv
/* 5B160 0015B060 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 5B164 0015B064 2000BF7F */  sq         $31, 0x20($sp)
/* 5B168 0015B068 1000B17F */  sq         $17, 0x10($sp)
/* 5B16C 0015B06C 0000B07F */  sq         $16, 0x0($sp)
/* 5B170 0015B070 288E0070 */  paddub     $17, $0, $0
/* 5B174 0015B074 12000010 */  b          .L0015B0C0
/* 5B178 0015B078 00000000 */   nop
.L0015B07C:
/* 5B17C 0015B07C C0201100 */  sll        $4, $17, 3
/* 5B180 0015B080 D001033C */  lui        $3, %hi(se_seq)
/* 5B184 0015B084 30B56324 */  addiu      $3, $3, %lo(se_seq)
/* 5B188 0015B088 21806400 */  addu       $16, $3, $4
/* 5B18C 0015B08C 00000486 */  lh         $4, 0x0($16)
/* 5B190 0015B090 0A008004 */  bltz       $4, .L0015B0BC
/* 5B194 0015B094 00000000 */   nop
/* 5B198 0015B098 06000586 */  lh         $5, 0x6($16)
/* 5B19C 0015B09C 2C6A050C */  jal        SndSeStop__Fii
/* 5B1A0 0015B0A0 00000000 */   nop
/* 5B1A4 0015B0A4 28260072 */  paddub     $4, $16, $0
/* 5B1A8 0015B0A8 806B050C */  jal        InitSeSeq__FP10SND_SE_SEQ
/* 5B1AC 0015B0AC 00000000 */   nop
/* 5B1B0 0015B0B0 04000386 */  lh         $3, 0x4($16)
/* 5B1B4 0015B0B4 01006324 */  addiu      $3, $3, 0x1
/* 5B1B8 0015B0B8 040003A6 */  sh         $3, 0x4($16)
.L0015B0BC:
/* 5B1BC 0015B0BC 01003126 */  addiu      $17, $17, 0x1
.L0015B0C0:
/* 5B1C0 0015B0C0 2000232A */  slti       $3, $17, 0x20
/* 5B1C4 0015B0C4 EDFF6014 */  bnez       $3, .L0015B07C
/* 5B1C8 0015B0C8 00000000 */   nop
/* 5B1CC 0015B0CC 2000BF7B */  lq         $31, 0x20($sp)
/* 5B1D0 0015B0D0 1000B17B */  lq         $17, 0x10($sp)
/* 5B1D4 0015B0D4 0000B07B */  lq         $16, 0x0($sp)
/* 5B1D8 0015B0D8 3000BD27 */  addiu      $sp, $sp, 0x30
/* 5B1DC 0015B0DC 0800E003 */  jr         $31
/* 5B1E0 0015B0E0 00000000 */   nop
/* 5B1E4 0015B0E4 00000000 */  nop
/* 5B1E8 0015B0E8 00000000 */  nop
/* 5B1EC 0015B0EC 00000000 */  nop
