.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_OBJHDL_DRAW_FLAG__FP12RS_STACKDATAi
/* BC130 001BC030 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* BC134 001BC034 2000BF7F */  sq         $31, 0x20($sp)
/* BC138 001BC038 1000B17F */  sq         $17, 0x10($sp)
/* BC13C 001BC03C 0000B07F */  sq         $16, 0x0($sp)
/* BC140 001BC040 08009124 */  addiu      $17, $4, 0x8
/* BC144 001BC044 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BC148 001BC048 00000000 */   nop
/* BC14C 001BC04C 28864070 */  paddub     $16, $2, $0
/* BC150 001BC050 28262072 */  paddub     $4, $17, $0
/* BC154 001BC054 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BC158 001BC058 00000000 */   nop
/* BC15C 001BC05C 288E4070 */  paddub     $17, $2, $0
/* BC160 001BC060 28260072 */  paddub     $4, $16, $0
/* BC164 001BC064 80EC060C */  jal        GetObjHDL__Fi
/* BC168 001BC068 00000000 */   nop
/* BC16C 001BC06C 0800438C */  lw         $3, 0x8($2)
/* BC170 001BC070 0A006014 */  bnez       $3, .L001BC09C
/* BC174 001BC074 00000000 */   nop
/* BC178 001BC078 0000438C */  lw         $3, 0x0($2)
/* BC17C 001BC07C 07006010 */  beqz       $3, .L001BC09C
/* BC180 001BC080 00000000 */   nop
/* BC184 001BC084 02000424 */  addiu      $4, $0, 0x2
/* BC188 001BC088 02002012 */  beqz       $17, .L001BC094
/* BC18C 001BC08C 00000000 */   nop
/* BC190 001BC090 01000424 */  addiu      $4, $0, 0x1
.L001BC094:
/* BC194 001BC094 B00064A4 */  sh         $4, 0xB0($3)
/* BC198 001BC098 000064AC */  sw         $4, 0x0($3)
.L001BC09C:
/* BC19C 001BC09C 0800448C */  lw         $4, 0x8($2)
/* BC1A0 001BC0A0 01000324 */  addiu      $3, $0, 0x1
/* BC1A4 001BC0A4 0C008314 */  bne        $4, $3, .L001BC0D8
/* BC1A8 001BC0A8 00000000 */   nop
/* BC1AC 001BC0AC 0400428C */  lw         $2, 0x4($2)
/* BC1B0 001BC0B0 09004010 */  beqz       $2, .L001BC0D8
/* BC1B4 001BC0B4 00000000 */   nop
/* BC1B8 001BC0B8 BC00428C */  lw         $2, 0xBC($2)
/* BC1BC 001BC0BC 06004010 */  beqz       $2, .L001BC0D8
/* BC1C0 001BC0C0 00000000 */   nop
/* BC1C4 001BC0C4 02000424 */  addiu      $4, $0, 0x2
/* BC1C8 001BC0C8 02002012 */  beqz       $17, .L001BC0D4
/* BC1CC 001BC0CC 00000000 */   nop
/* BC1D0 001BC0D0 28266070 */  paddub     $4, $3, $0
.L001BC0D4:
/* BC1D4 001BC0D4 B00044A4 */  sh         $4, 0xB0($2)
.L001BC0D8:
/* BC1D8 001BC0D8 01000224 */  addiu      $2, $0, 0x1
/* BC1DC 001BC0DC 2000BF7B */  lq         $31, 0x20($sp)
/* BC1E0 001BC0E0 1000B17B */  lq         $17, 0x10($sp)
/* BC1E4 001BC0E4 0000B07B */  lq         $16, 0x0($sp)
/* BC1E8 001BC0E8 3000BD27 */  addiu      $sp, $sp, 0x30
/* BC1EC 001BC0EC 0800E003 */  jr         $31
/* BC1F0 001BC0F0 00000000 */   nop
/* BC1F4 001BC0F4 00000000 */  nop
/* BC1F8 001BC0F8 00000000 */  nop
/* BC1FC 001BC0FC 00000000 */  nop
