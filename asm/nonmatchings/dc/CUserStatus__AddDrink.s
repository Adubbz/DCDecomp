.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AddDrink__11CUserStatusFisf
/* BE610 001BE510 90FFBD27 */  addiu      $sp, $sp, -0x70
/* BE614 001BE514 6000BF7F */  sq         $31, 0x60($sp)
/* BE618 001BE518 5000B47F */  sq         $20, 0x50($sp)
/* BE61C 001BE51C 4000B37F */  sq         $19, 0x40($sp)
/* BE620 001BE520 3000B27F */  sq         $18, 0x30($sp)
/* BE624 001BE524 2000B17F */  sq         $17, 0x20($sp)
/* BE628 001BE528 1000B07F */  sq         $16, 0x10($sp)
/* BE62C 001BE52C 0000B4E7 */  swc1       $f20, 0x0($sp)
/* BE630 001BE530 28A68070 */  paddub     $20, $4, $0
/* BE634 001BE534 06650046 */  mov.s      $f20, $f12
/* BE638 001BE538 40800500 */  sll        $16, $5, 1
/* BE63C 001BE53C 21380402 */  addu       $7, $16, $4
/* BE640 001BE540 EA0AF124 */  addiu      $17, $7, 0xAEA
/* BE644 001BE544 F87F3126 */  addiu      $17, $17, 0x7FF8
/* BE648 001BE548 00002386 */  lh         $3, 0x0($17)
/* BE64C 001BE54C 0B006010 */  beqz       $3, .L001BE57C
/* BE650 001BE550 00000000 */   nop
/* BE654 001BE554 0100013C */  lui        $at, (0x10000 >> 16)
/* BE658 001BE558 2108E100 */  addu       $at, $7, $at
/* BE65C 001BE55C D68A2384 */  lh         $3, -0x752A($at)
/* BE660 001BE560 00008344 */  mtc1       $3, $f0
/* BE664 001BE564 00000000 */  nop
/* BE668 001BE568 20008046 */  cvt.s.w    $f0, $f0
/* BE66C 001BE56C 80180500 */  sll        $3, $5, 2
/* BE670 001BE570 21187400 */  addu       $3, $3, $20
/* BE674 001BE574 044360E4 */  swc1       $f0, 0x4304($3)
/* BE678 001BE578 000020A6 */  sh         $0, 0x0($17)
.L001BE57C:
/* BE67C 001BE57C 00008044 */  mtc1       $0, $f0
/* BE680 001BE580 00000000 */  nop
/* BE684 001BE584 32001446 */  c.eq.s     $f0, $f20
/* BE688 001BE588 00000000 */  nop
/* BE68C 001BE58C 13000045 */  bc1f       .L001BE5DC
/* BE690 001BE590 00000000 */   nop
/* BE694 001BE594 80180500 */  sll        $3, $5, 2
/* BE698 001BE598 21187400 */  addu       $3, $3, $20
/* BE69C 001BE59C 04436424 */  addiu      $4, $3, 0x4304
/* BE6A0 001BE5A0 044361C4 */  lwc1       $f1, 0x4304($3)
/* BE6A4 001BE5A4 00008644 */  mtc1       $6, $f0
/* BE6A8 001BE5A8 00000000 */  nop
/* BE6AC 001BE5AC 20008046 */  cvt.s.w    $f0, $f0
/* BE6B0 001BE5B0 00080046 */  add.s      $f0, $f1, $f0
/* BE6B4 001BE5B4 044360E4 */  swc1       $f0, 0x4304($3)
/* BE6B8 001BE5B8 EC4261C4 */  lwc1       $f1, 0x42EC($3)
/* BE6BC 001BE5BC 044360C4 */  lwc1       $f0, 0x4304($3)
/* BE6C0 001BE5C0 34000146 */  c.lt.s     $f0, $f1
/* BE6C4 001BE5C4 00000000 */  nop
/* BE6C8 001BE5C8 46000145 */  bc1t       .L001BE6E4
/* BE6CC 001BE5CC 00000000 */   nop
/* BE6D0 001BE5D0 000081E4 */  swc1       $f1, 0x0($4)
/* BE6D4 001BE5D4 43000010 */  b          .L001BE6E4
/* BE6D8 001BE5D8 00000000 */   nop
.L001BE5DC:
/* BE6DC 001BE5DC 80900500 */  sll        $18, $5, 2
/* BE6E0 001BE5E0 21105402 */  addu       $2, $18, $20
/* BE6E4 001BE5E4 04435324 */  addiu      $19, $2, 0x4304
/* BE6E8 001BE5E8 044341C4 */  lwc1       $f1, 0x4304($2)
/* BE6EC 001BE5EC 00008644 */  mtc1       $6, $f0
/* BE6F0 001BE5F0 00000000 */  nop
/* BE6F4 001BE5F4 20008046 */  cvt.s.w    $f0, $f0
/* BE6F8 001BE5F8 000B0046 */  add.s      $f12, $f1, $f0
/* BE6FC 001BE5FC 2C44040C */  jal        fptosi
/* BE700 001BE600 00000000 */   nop
/* BE704 001BE604 21181402 */  addu       $3, $16, $20
/* BE708 001BE608 DE0A7024 */  addiu      $16, $3, 0xADE
/* BE70C 001BE60C F87F1026 */  addiu      $16, $16, 0x7FF8
/* BE710 001BE610 000002A6 */  sh         $2, 0x0($16)
/* BE714 001BE614 00000286 */  lh         $2, 0x0($16)
/* BE718 001BE618 0200401C */  bgtz       $2, .L001BE624
/* BE71C 001BE61C 00000000 */   nop
/* BE720 001BE620 000000A6 */  sh         $0, 0x0($16)
.L001BE624:
/* BE724 001BE624 21105402 */  addu       $2, $18, $20
/* BE728 001BE628 EC424CC4 */  lwc1       $f12, 0x42EC($2)
/* BE72C 001BE62C 00000286 */  lh         $2, 0x0($16)
/* BE730 001BE630 00008244 */  mtc1       $2, $f0
/* BE734 001BE634 00000000 */  nop
/* BE738 001BE638 20008046 */  cvt.s.w    $f0, $f0
/* BE73C 001BE63C 34000C46 */  c.lt.s     $f0, $f12
/* BE740 001BE640 00000000 */  nop
/* BE744 001BE644 04000145 */  bc1t       .L001BE658
/* BE748 001BE648 00000000 */   nop
/* BE74C 001BE64C 2C44040C */  jal        fptosi
/* BE750 001BE650 00000000 */   nop
/* BE754 001BE654 000002A6 */  sh         $2, 0x0($16)
.L001BE658:
/* BE758 001BE658 00000286 */  lh         $2, 0x0($16)
/* BE75C 001BE65C 00008244 */  mtc1       $2, $f0
/* BE760 001BE660 00000000 */  nop
/* BE764 001BE664 60008046 */  cvt.s.w    $f1, $f0
/* BE768 001BE668 000060C6 */  lwc1       $f0, 0x0($19)
/* BE76C 001BE66C 41080046 */  sub.s      $f1, $f1, $f0
/* BE770 001BE670 C842023C */  lui        $2, (0x42C80000 >> 16)
/* BE774 001BE674 00008244 */  mtc1       $2, $f0
/* BE778 001BE678 00000000 */  nop
/* BE77C 001BE67C 03080046 */  div.s      $f0, $f1, $f0
/* BE780 001BE680 02A30046 */  mul.s      $f12, $f20, $f0
/* BE784 001BE684 2C44040C */  jal        fptosi
/* BE788 001BE688 00000000 */   nop
/* BE78C 001BE68C 000022A6 */  sh         $2, 0x0($17)
/* BE790 001BE690 00002386 */  lh         $3, 0x0($17)
/* BE794 001BE694 13006014 */  bnez       $3, .L001BE6E4
/* BE798 001BE698 00000000 */   nop
/* BE79C 001BE69C 00000386 */  lh         $3, 0x0($16)
/* BE7A0 001BE6A0 00008344 */  mtc1       $3, $f0
/* BE7A4 001BE6A4 00000000 */  nop
/* BE7A8 001BE6A8 60008046 */  cvt.s.w    $f1, $f0
/* BE7AC 001BE6AC 000060C6 */  lwc1       $f0, 0x0($19)
/* BE7B0 001BE6B0 41080046 */  sub.s      $f1, $f1, $f0
/* BE7B4 001BE6B4 00008044 */  mtc1       $0, $f0
/* BE7B8 001BE6B8 00000000 */  nop
/* BE7BC 001BE6BC 34080046 */  c.lt.s     $f1, $f0
/* BE7C0 001BE6C0 00000000 */  nop
/* BE7C4 001BE6C4 05000045 */  bc1f       .L001BE6DC
/* BE7C8 001BE6C8 00000000 */   nop
/* BE7CC 001BE6CC FFFF0324 */  addiu      $3, $0, -0x1
/* BE7D0 001BE6D0 000023A6 */  sh         $3, 0x0($17)
/* BE7D4 001BE6D4 03000010 */  b          .L001BE6E4
/* BE7D8 001BE6D8 00000000 */   nop
.L001BE6DC:
/* BE7DC 001BE6DC 01000324 */  addiu      $3, $0, 0x1
/* BE7E0 001BE6E0 000023A6 */  sh         $3, 0x0($17)
.L001BE6E4:
/* BE7E4 001BE6E4 6000BF7B */  lq         $31, 0x60($sp)
/* BE7E8 001BE6E8 5000B47B */  lq         $20, 0x50($sp)
/* BE7EC 001BE6EC 4000B37B */  lq         $19, 0x40($sp)
/* BE7F0 001BE6F0 3000B27B */  lq         $18, 0x30($sp)
/* BE7F4 001BE6F4 2000B17B */  lq         $17, 0x20($sp)
/* BE7F8 001BE6F8 1000B07B */  lq         $16, 0x10($sp)
/* BE7FC 001BE6FC 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* BE800 001BE700 7000BD27 */  addiu      $sp, $sp, 0x70
/* BE804 001BE704 0800E003 */  jr         $31
/* BE808 001BE708 00000000 */   nop
/* BE80C 001BE70C 00000000 */  nop
