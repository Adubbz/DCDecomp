.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Initialize__8CHitMarkFv
/* B36D0 001B35D0 282E0070 */  paddub     $5, $0, $0
/* B36D4 001B35D4 05000010 */  b          .L001B35EC
/* B36D8 001B35D8 00000000 */   nop
.L001B35DC:
/* B36DC 001B35DC 80180500 */  sll        $3, $5, 2
/* B36E0 001B35E0 21186400 */  addu       $3, $3, $4
/* B36E4 001B35E4 D40560AC */  sw         $0, 0x5D4($3)
/* B36E8 001B35E8 0100A524 */  addiu      $5, $5, 0x1
.L001B35EC:
/* B36EC 001B35EC 2000A328 */  slti       $3, $5, 0x20
/* B36F0 001B35F0 FAFF6014 */  bnez       $3, .L001B35DC
/* B36F4 001B35F4 00000000 */   nop
/* B36F8 001B35F8 20000324 */  addiu      $3, $0, 0x20
/* B36FC 001B35FC D00583AC */  sw         $3, 0x5D0($4)
/* B3700 001B3600 540680AC */  sw         $0, 0x654($4)
/* B3704 001B3604 0800E003 */  jr         $31
/* B3708 001B3608 00000000 */   nop
/* B370C 001B360C 00000000 */  nop
