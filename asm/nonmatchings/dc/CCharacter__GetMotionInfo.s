.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetMotionInfo__10CCharacterFi
/* 38570 00138470 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 38574 00138474 0000BF7F */  sq         $31, 0x0($sp)
/* 38578 00138478 1C00A627 */  addiu      $6, $sp, 0x1C
/* 3857C 0013847C 283E0070 */  paddub     $7, $0, $0
/* 38580 00138480 28460070 */  paddub     $8, $0, $0
/* 38584 00138484 284E0070 */  paddub     $9, $0, $0
/* 38588 00138488 ECE0040C */  jal        GetMotionParam__10CCharacterFiPiPiPiPi
/* 3858C 0013848C 00000000 */   nop
/* 38590 00138490 04004014 */  bnez       $2, .L001384A4
/* 38594 00138494 00000000 */   nop
/* 38598 00138498 28160070 */  paddub     $2, $0, $0
/* 3859C 0013849C 0A000010 */  b          .L001384C8
/* 385A0 001384A0 00000000 */   nop
.L001384A4:
/* 385A4 001384A4 6400438C */  lw         $3, 0x64($2)
/* 385A8 001384A8 04006014 */  bnez       $3, .L001384BC
/* 385AC 001384AC 00000000 */   nop
/* 385B0 001384B0 28160070 */  paddub     $2, $0, $0
/* 385B4 001384B4 04000010 */  b          .L001384C8
/* 385B8 001384B8 00000000 */   nop
.L001384BC:
/* 385BC 001384BC 1C00A28F */  lw         $2, 0x1C($sp)
/* 385C0 001384C0 00110200 */  sll        $2, $2, 4
/* 385C4 001384C4 21106200 */  addu       $2, $3, $2
.L001384C8:
/* 385C8 001384C8 0000BF7B */  lq         $31, 0x0($sp)
/* 385CC 001384CC 2000BD27 */  addiu      $sp, $sp, 0x20
/* 385D0 001384D0 0800E003 */  jr         $31
/* 385D4 001384D4 00000000 */   nop
/* 385D8 001384D8 00000000 */  nop
/* 385DC 001384DC 00000000 */  nop
