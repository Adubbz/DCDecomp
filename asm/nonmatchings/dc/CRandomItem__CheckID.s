.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckID__11CRandomItemFv
/* D73D0 001D72D0 28160070 */  paddub     $2, $0, $0
/* D73D4 001D72D4 0A000010 */  b          .L001D7300
/* D73D8 001D72D8 00000000 */   nop
.L001D72DC:
/* D73DC 001D72DC 80180200 */  sll        $3, $2, 2
/* D73E0 001D72E0 21186400 */  addu       $3, $3, $4
/* D73E4 001D72E4 9002658C */  lw         $5, 0x290($3)
/* D73E8 001D72E8 FFFF0324 */  addiu      $3, $0, -0x1
/* D73EC 001D72EC 0300A314 */  bne        $5, $3, .L001D72FC
/* D73F0 001D72F0 00000000 */   nop
/* D73F4 001D72F4 07000010 */  b          .L001D7314
/* D73F8 001D72F8 00000000 */   nop
.L001D72FC:
/* D73FC 001D72FC 01004224 */  addiu      $2, $2, 0x1
.L001D7300:
/* D7400 001D7300 20004328 */  slti       $3, $2, 0x20
/* D7404 001D7304 F5FF6014 */  bnez       $3, .L001D72DC
/* D7408 001D7308 00000000 */   nop
/* D740C 001D730C 900480AC */  sw         $0, 0x490($4)
/* D7410 001D7310 FFFF0224 */  addiu      $2, $0, -0x1
.L001D7314:
/* D7414 001D7314 0800E003 */  jr         $31
/* D7418 001D7318 00000000 */   nop
/* D741C 001D731C 00000000 */  nop
