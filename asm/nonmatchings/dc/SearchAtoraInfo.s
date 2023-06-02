.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SearchAtoraInfo__Fi
/* 118570 00218470 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 118574 00218474 2000BF7F */  sq         $31, 0x20($sp)
/* 118578 00218478 1000B17F */  sq         $17, 0x10($sp)
/* 11857C 0021847C 0000B07F */  sq         $16, 0x0($sp)
/* 118580 00218480 288E8070 */  paddub     $17, $4, $0
/* 118584 00218484 DC96848F */  lw         $4, -0x6924($gp)
/* 118588 00218488 FFFF0524 */  addiu      $5, $0, -0x1
/* 11858C 0021848C 8468060C */  jal        GetNextParts__14CEditPartsInfoFi
/* 118590 00218490 00000000 */   nop
/* 118594 00218494 FFFF1024 */  addiu      $16, $0, -0x1
/* 118598 00218498 0E000010 */  b          .L002184D4
/* 11859C 0021849C 00000000 */   nop
.L002184A0:
/* 1185A0 002184A0 01001026 */  addiu      $16, $16, 0x1
/* 1185A4 002184A4 07003016 */  bne        $17, $16, .L002184C4
/* 1185A8 002184A8 00000000 */   nop
/* 1185AC 002184AC DC96848F */  lw         $4, -0x6924($gp)
/* 1185B0 002184B0 282E4070 */  paddub     $5, $2, $0
/* 1185B4 002184B4 F467060C */  jal        GetPartsInfo__14CEditPartsInfoFi
/* 1185B8 002184B8 00000000 */   nop
/* 1185BC 002184BC 09000010 */  b          .L002184E4
/* 1185C0 002184C0 00000000 */   nop
.L002184C4:
/* 1185C4 002184C4 DC96848F */  lw         $4, -0x6924($gp)
/* 1185C8 002184C8 282E4070 */  paddub     $5, $2, $0
/* 1185CC 002184CC 8468060C */  jal        GetNextParts__14CEditPartsInfoFi
/* 1185D0 002184D0 00000000 */   nop
.L002184D4:
/* 1185D4 002184D4 FFFF0324 */  addiu      $3, $0, -0x1
/* 1185D8 002184D8 F1FF4314 */  bne        $2, $3, .L002184A0
/* 1185DC 002184DC 00000000 */   nop
/* 1185E0 002184E0 28160070 */  paddub     $2, $0, $0
.L002184E4:
/* 1185E4 002184E4 2000BF7B */  lq         $31, 0x20($sp)
/* 1185E8 002184E8 1000B17B */  lq         $17, 0x10($sp)
/* 1185EC 002184EC 0000B07B */  lq         $16, 0x0($sp)
/* 1185F0 002184F0 3000BD27 */  addiu      $sp, $sp, 0x30
/* 1185F4 002184F4 0800E003 */  jr         $31
/* 1185F8 002184F8 00000000 */   nop
/* 1185FC 002184FC 00000000 */  nop
