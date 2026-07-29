.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CheckID__11CRandomItemFv
/* 0D73D0 001D72D0 28160070 */  paddub      $2, $0, $0
/* 0D73D4 001D72D4 0A000010 */  b           .L001D7300
/* 0D73D8 001D72D8 00000000 */   nop
.L001D72DC:
/* 0D73DC 001D72DC 80180200 */  sll         $3, $2, 2
/* 0D73E0 001D72E0 21186400 */  addu        $3, $3, $4
/* 0D73E4 001D72E4 9002658C */  lw          $5, 0x290($3)
/* 0D73E8 001D72E8 FFFF0324 */  addiu       $3, $0, -0x1
/* 0D73EC 001D72EC 0300A314 */  bne         $5, $3, .L001D72FC
/* 0D73F0 001D72F0 00000000 */   nop
/* 0D73F4 001D72F4 07000010 */  b           .L001D7314
/* 0D73F8 001D72F8 00000000 */   nop
.L001D72FC:
/* 0D73FC 001D72FC 01004224 */  addiu       $2, $2, 0x1
.L001D7300:
/* 0D7400 001D7300 20004328 */  slti        $3, $2, 0x20
/* 0D7404 001D7304 F5FF6014 */  bnez        $3, .L001D72DC
/* 0D7408 001D7308 00000000 */   nop
/* 0D740C 001D730C 900480AC */  sw          $0, 0x490($4)
/* 0D7410 001D7310 FFFF0224 */  addiu       $2, $0, -0x1
.L001D7314:
/* 0D7414 001D7314 0800E003 */  jr          $31
/* 0D7418 001D7318 00000000 */   nop
/* 0D741C 001D731C 00000000 */  nop
