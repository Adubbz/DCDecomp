.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetNextPartsNum__14CEditPartsInfoFi
/* 9A280 0019A180 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 9A284 0019A184 3000BF7F */  sq         $31, 0x30($sp)
/* 9A288 0019A188 2000B27F */  sq         $18, 0x20($sp)
/* 9A28C 0019A18C 1000B17F */  sq         $17, 0x10($sp)
/* 9A290 0019A190 0000B07F */  sq         $16, 0x0($sp)
/* 9A294 0019A194 28968070 */  paddub     $18, $4, $0
/* 9A298 0019A198 28860070 */  paddub     $16, $0, $0
/* 9A29C 0019A19C 0100B124 */  addiu      $17, $5, 0x1
/* 9A2A0 0019A1A0 0E000010 */  b          .L0019A1DC
/* 9A2A4 0019A1A4 00000000 */   nop
.L0019A1A8:
/* 9A2A8 0019A1A8 28264072 */  paddub     $4, $18, $0
/* 9A2AC 0019A1AC 282E2072 */  paddub     $5, $17, $0
/* 9A2B0 0019A1B0 F467060C */  jal        GetPartsInfo__14CEditPartsInfoFi
/* 9A2B4 0019A1B4 00000000 */   nop
/* 9A2B8 0019A1B8 0B004010 */  beqz       $2, .L0019A1E8
/* 9A2BC 0019A1BC 00000000 */   nop
/* 9A2C0 0019A1C0 28264070 */  paddub     $4, $2, $0
/* 9A2C4 0019A1C4 E467060C */  jal        CheckPartsInfo__FP14EDITPARTS_INFO
/* 9A2C8 0019A1C8 00000000 */   nop
/* 9A2CC 0019A1CC 02004010 */  beqz       $2, .L0019A1D8
/* 9A2D0 0019A1D0 00000000 */   nop
/* 9A2D4 0019A1D4 01001026 */  addiu      $16, $16, 0x1
.L0019A1D8:
/* 9A2D8 0019A1D8 01003126 */  addiu      $17, $17, 0x1
.L0019A1DC:
/* 9A2DC 0019A1DC 1800222A */  slti       $2, $17, 0x18
/* 9A2E0 0019A1E0 F1FF4014 */  bnez       $2, .L0019A1A8
/* 9A2E4 0019A1E4 00000000 */   nop
.L0019A1E8:
/* 9A2E8 0019A1E8 28160072 */  paddub     $2, $16, $0
/* 9A2EC 0019A1EC 3000BF7B */  lq         $31, 0x30($sp)
/* 9A2F0 0019A1F0 2000B27B */  lq         $18, 0x20($sp)
/* 9A2F4 0019A1F4 1000B17B */  lq         $17, 0x10($sp)
/* 9A2F8 0019A1F8 0000B07B */  lq         $16, 0x0($sp)
/* 9A2FC 0019A1FC 4000BD27 */  addiu      $sp, $sp, 0x40
/* 9A300 0019A200 0800E003 */  jr         $31
/* 9A304 0019A204 00000000 */   nop
/* 9A308 0019A208 00000000 */  nop
/* 9A30C 0019A20C 00000000 */  nop
