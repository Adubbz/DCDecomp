.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetSeSeq__FPiii
/* 05AF10 0015AE10 28460070 */  paddub      $8, $0, $0
/* 05AF14 0015AE14 000080AC */  sw          $0, 0x0($4)
/* 05AF18 0015AE18 283E0070 */  paddub      $7, $0, $0
/* 05AF1C 0015AE1C 0C000010 */  b           .L0015AE50
/* 05AF20 0015AE20 00000000 */   nop
.L0015AE24:
/* 05AF24 0015AE24 C0180700 */  sll         $3, $7, 3
/* 05AF28 0015AE28 D001023C */  lui         $2, %hi(se_seq)
/* 05AF2C 0015AE2C 30B54224 */  addiu       $2, $2, %lo(se_seq)
/* 05AF30 0015AE30 21184300 */  addu        $3, $2, $3
/* 05AF34 0015AE34 00006284 */  lh          $2, 0x0($3)
/* 05AF38 0015AE38 04004104 */  bgez        $2, .L0015AE4C
/* 05AF3C 0015AE3C 00000000 */   nop
/* 05AF40 0015AE40 28466070 */  paddub      $8, $3, $0
/* 05AF44 0015AE44 05000010 */  b           .L0015AE5C
/* 05AF48 0015AE48 00000000 */   nop
.L0015AE4C:
/* 05AF4C 0015AE4C 0100E724 */  addiu       $7, $7, 0x1
.L0015AE50:
/* 05AF50 0015AE50 2000E228 */  slti        $2, $7, 0x20
/* 05AF54 0015AE54 F3FF4014 */  bnez        $2, .L0015AE24
/* 05AF58 0015AE58 00000000 */   nop
.L0015AE5C:
/* 05AF5C 0015AE5C 1900A004 */  bltz        $5, .L0015AEC4
/* 05AF60 0015AE60 00000000 */   nop
/* 05AF64 0015AE64 283E0070 */  paddub      $7, $0, $0
/* 05AF68 0015AE68 13000010 */  b           .L0015AEB8
/* 05AF6C 0015AE6C 00000000 */   nop
.L0015AE70:
/* 05AF70 0015AE70 C0480700 */  sll         $9, $7, 3
/* 05AF74 0015AE74 D001023C */  lui         $2, %hi(se_seq)
/* 05AF78 0015AE78 30B54224 */  addiu       $2, $2, %lo(se_seq)
/* 05AF7C 0015AE7C 21104900 */  addu        $2, $2, $9
/* 05AF80 0015AE80 00004384 */  lh          $3, 0x0($2)
/* 05AF84 0015AE84 0B00A314 */  bne         $5, $3, .L0015AEB4
/* 05AF88 0015AE88 00000000 */   nop
/* 05AF8C 0015AE8C D001033C */  lui         $3, %hi(se_seq + 0x6)
/* 05AF90 0015AE90 36B56324 */  addiu       $3, $3, %lo(se_seq + 0x6)
/* 05AF94 0015AE94 21186900 */  addu        $3, $3, $9
/* 05AF98 0015AE98 00006384 */  lh          $3, 0x0($3)
/* 05AF9C 0015AE9C 0500C314 */  bne         $6, $3, .L0015AEB4
/* 05AFA0 0015AEA0 00000000 */   nop
/* 05AFA4 0015AEA4 01000324 */  addiu       $3, $0, 0x1
/* 05AFA8 0015AEA8 000083AC */  sw          $3, 0x0($4)
/* 05AFAC 0015AEAC 06000010 */  b           .L0015AEC8
/* 05AFB0 0015AEB0 00000000 */   nop
.L0015AEB4:
/* 05AFB4 0015AEB4 0100E724 */  addiu       $7, $7, 0x1
.L0015AEB8:
/* 05AFB8 0015AEB8 2000E228 */  slti        $2, $7, 0x20
/* 05AFBC 0015AEBC ECFF4014 */  bnez        $2, .L0015AE70
/* 05AFC0 0015AEC0 00000000 */   nop
.L0015AEC4:
/* 05AFC4 0015AEC4 28160071 */  paddub      $2, $8, $0
.L0015AEC8:
/* 05AFC8 0015AEC8 0800E003 */  jr          $31
/* 05AFCC 0015AECC 00000000 */   nop
