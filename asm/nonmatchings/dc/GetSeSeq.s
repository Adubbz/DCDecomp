.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetSeSeq__FPiii
/* 5AF10 0015AE10 28460070 */  paddub     $8, $0, $0
/* 5AF14 0015AE14 000080AC */  sw         $0, 0x0($4)
/* 5AF18 0015AE18 283E0070 */  paddub     $7, $0, $0
/* 5AF1C 0015AE1C 0C000010 */  b          .L0015AE50
/* 5AF20 0015AE20 00000000 */   nop
.L0015AE24:
/* 5AF24 0015AE24 C0180700 */  sll        $3, $7, 3
/* 5AF28 0015AE28 D001023C */  lui        $2, %hi(se_seq)
/* 5AF2C 0015AE2C 30B54224 */  addiu      $2, $2, %lo(se_seq)
/* 5AF30 0015AE30 21184300 */  addu       $3, $2, $3
/* 5AF34 0015AE34 00006284 */  lh         $2, 0x0($3)
/* 5AF38 0015AE38 04004104 */  bgez       $2, .L0015AE4C
/* 5AF3C 0015AE3C 00000000 */   nop
/* 5AF40 0015AE40 28466070 */  paddub     $8, $3, $0
/* 5AF44 0015AE44 05000010 */  b          .L0015AE5C
/* 5AF48 0015AE48 00000000 */   nop
.L0015AE4C:
/* 5AF4C 0015AE4C 0100E724 */  addiu      $7, $7, 0x1
.L0015AE50:
/* 5AF50 0015AE50 2000E228 */  slti       $2, $7, 0x20
/* 5AF54 0015AE54 F3FF4014 */  bnez       $2, .L0015AE24
/* 5AF58 0015AE58 00000000 */   nop
.L0015AE5C:
/* 5AF5C 0015AE5C 1900A004 */  bltz       $5, .L0015AEC4
/* 5AF60 0015AE60 00000000 */   nop
/* 5AF64 0015AE64 283E0070 */  paddub     $7, $0, $0
/* 5AF68 0015AE68 13000010 */  b          .L0015AEB8
/* 5AF6C 0015AE6C 00000000 */   nop
.L0015AE70:
/* 5AF70 0015AE70 C0480700 */  sll        $9, $7, 3
/* 5AF74 0015AE74 D001023C */  lui        $2, %hi(se_seq)
/* 5AF78 0015AE78 30B54224 */  addiu      $2, $2, %lo(se_seq)
/* 5AF7C 0015AE7C 21104900 */  addu       $2, $2, $9
/* 5AF80 0015AE80 00004384 */  lh         $3, 0x0($2)
/* 5AF84 0015AE84 0B00A314 */  bne        $5, $3, .L0015AEB4
/* 5AF88 0015AE88 00000000 */   nop
/* 5AF8C 0015AE8C D001033C */  lui        $3, %hi(D_1CFB536)
/* 5AF90 0015AE90 36B56324 */  addiu      $3, $3, %lo(D_1CFB536)
/* 5AF94 0015AE94 21186900 */  addu       $3, $3, $9
/* 5AF98 0015AE98 00006384 */  lh         $3, 0x0($3)
/* 5AF9C 0015AE9C 0500C314 */  bne        $6, $3, .L0015AEB4
/* 5AFA0 0015AEA0 00000000 */   nop
/* 5AFA4 0015AEA4 01000324 */  addiu      $3, $0, 0x1
/* 5AFA8 0015AEA8 000083AC */  sw         $3, 0x0($4)
/* 5AFAC 0015AEAC 06000010 */  b          .L0015AEC8
/* 5AFB0 0015AEB0 00000000 */   nop
.L0015AEB4:
/* 5AFB4 0015AEB4 0100E724 */  addiu      $7, $7, 0x1
.L0015AEB8:
/* 5AFB8 0015AEB8 2000E228 */  slti       $2, $7, 0x20
/* 5AFBC 0015AEBC ECFF4014 */  bnez       $2, .L0015AE70
/* 5AFC0 0015AEC0 00000000 */   nop
.L0015AEC4:
/* 5AFC4 0015AEC4 28160071 */  paddub     $2, $8, $0
.L0015AEC8:
/* 5AFC8 0015AEC8 0800E003 */  jr         $31
/* 5AFCC 0015AECC 00000000 */   nop
