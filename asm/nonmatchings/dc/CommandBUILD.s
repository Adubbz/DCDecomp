.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandBUILD__FPPv
/* 75640 00175540 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 75644 00175544 3000BF7F */  sq         $31, 0x30($sp)
/* 75648 00175548 2000B27F */  sq         $18, 0x20($sp)
/* 7564C 0017554C 1000B17F */  sq         $17, 0x10($sp)
/* 75650 00175550 0000B07F */  sq         $16, 0x0($sp)
/* 75654 00175554 28968070 */  paddub     $18, $4, $0
/* 75658 00175558 CC8F848F */  lw         $4, -0x7034($gp)
/* 7565C 0017555C D8020324 */  addiu      $3, $0, 0x2D8
/* 75660 00175560 18208300 */  mult       $4, $4, $3
/* 75664 00175564 C08F838F */  lw         $3, -0x7040($gp)
/* 75668 00175568 21206400 */  addu       $4, $3, $4
/* 7566C 0017556C A0259124 */  addiu      $17, $4, 0x25A0
/* 75670 00175570 02000324 */  addiu      $3, $0, 0x2
/* 75674 00175574 E82783AC */  sw         $3, 0x27E8($4)
/* 75678 00175578 28860070 */  paddub     $16, $0, $0
/* 7567C 0017557C 15000010 */  b          .L001755D4
/* 75680 00175580 00000000 */   nop
.L00175584:
/* 75684 00175584 80181000 */  sll        $3, $16, 2
/* 75688 00175588 21184302 */  addu       $3, $18, $3
/* 7568C 0017558C 0000678C */  lw         $7, 0x0($3)
/* 75690 00175590 0000E380 */  lb         $3, 0x0($7)
/* 75694 00175594 0B006010 */  beqz       $3, .L001755C4
/* 75698 00175598 00000000 */   nop
/* 7569C 0017559C 80111000 */  sll        $2, $16, 6
/* 756A0 001755A0 21202202 */  addu       $4, $17, $2
/* 756A4 001755A4 2A00023C */  lui        $2, %hi(_501_2)
/* 756A8 001755A8 E0A74524 */  addiu      $5, $2, %lo(_501_2)
/* 756AC 001755AC D201023C */  lui        $2, %hi(CurrentDir_2)
/* 756B0 001755B0 F09A4624 */  addiu      $6, $2, %lo(CurrentDir_2)
/* 756B4 001755B4 1614040C */  jal        sprintf
/* 756B8 001755B8 00000000 */   nop
/* 756BC 001755BC 04000010 */  b          .L001755D0
/* 756C0 001755C0 00000000 */   nop
.L001755C4:
/* 756C4 001755C4 80191000 */  sll        $3, $16, 6
/* 756C8 001755C8 21182302 */  addu       $3, $17, $3
/* 756CC 001755CC 000060A0 */  sb         $0, 0x0($3)
.L001755D0:
/* 756D0 001755D0 01001026 */  addiu      $16, $16, 0x1
.L001755D4:
/* 756D4 001755D4 0900032A */  slti       $3, $16, 0x9
/* 756D8 001755D8 EAFF6014 */  bnez       $3, .L00175584
/* 756DC 001755DC 00000000 */   nop
/* 756E0 001755E0 2000438E */  lw         $3, 0x20($18)
/* 756E4 001755E4 000060C4 */  lwc1       $f0, 0x0($3)
/* 756E8 001755E8 4C0220E6 */  swc1       $f0, 0x24C($17)
/* 756EC 001755EC 2400438E */  lw         $3, 0x24($18)
/* 756F0 001755F0 000060C4 */  lwc1       $f0, 0x0($3)
/* 756F4 001755F4 500220E6 */  swc1       $f0, 0x250($17)
/* 756F8 001755F8 2800438E */  lw         $3, 0x28($18)
/* 756FC 001755FC 000060C4 */  lwc1       $f0, 0x0($3)
/* 75700 00175600 540220E6 */  swc1       $f0, 0x254($17)
/* 75704 00175604 2C00438E */  lw         $3, 0x2C($18)
/* 75708 00175608 B08081C7 */  lwc1       $f1, -0x7F50($gp)
/* 7570C 0017560C 000060C4 */  lwc1       $f0, 0x0($3)
/* 75710 00175610 02080046 */  mul.s      $f0, $f1, $f0
/* 75714 00175614 3443033C */  lui        $3, (0x43340000 >> 16)
/* 75718 00175618 00108344 */  mtc1       $3, $f2
/* 7571C 0017561C 00000000 */  nop
/* 75720 00175620 03000246 */  div.s      $f0, $f0, $f2
/* 75724 00175624 580220E6 */  swc1       $f0, 0x258($17)
/* 75728 00175628 3000438E */  lw         $3, 0x30($18)
/* 7572C 0017562C B08081C7 */  lwc1       $f1, -0x7F50($gp)
/* 75730 00175630 000060C4 */  lwc1       $f0, 0x0($3)
/* 75734 00175634 02080046 */  mul.s      $f0, $f1, $f0
/* 75738 00175638 03000246 */  div.s      $f0, $f0, $f2
/* 7573C 0017563C 5C0220E6 */  swc1       $f0, 0x25C($17)
/* 75740 00175640 3400438E */  lw         $3, 0x34($18)
/* 75744 00175644 B08081C7 */  lwc1       $f1, -0x7F50($gp)
/* 75748 00175648 000060C4 */  lwc1       $f0, 0x0($3)
/* 7574C 0017564C 02080046 */  mul.s      $f0, $f1, $f0
/* 75750 00175650 03000246 */  div.s      $f0, $f0, $f2
/* 75754 00175654 600220E6 */  swc1       $f0, 0x260($17)
/* 75758 00175658 F88F80AF */  sw         $0, -0x7008($gp)
/* 7575C 0017565C FC8F91AF */  sw         $17, -0x7004($gp)
/* 75760 00175660 009080AF */  sw         $0, -0x7000($gp)
/* 75764 00175664 CC8F838F */  lw         $3, -0x7034($gp)
/* 75768 00175668 01006324 */  addiu      $3, $3, 0x1
/* 7576C 0017566C CC8F83AF */  sw         $3, -0x7034($gp)
/* 75770 00175670 3000BF7B */  lq         $31, 0x30($sp)
/* 75774 00175674 2000B27B */  lq         $18, 0x20($sp)
/* 75778 00175678 1000B17B */  lq         $17, 0x10($sp)
/* 7577C 0017567C 0000B07B */  lq         $16, 0x0($sp)
/* 75780 00175680 4000BD27 */  addiu      $sp, $sp, 0x40
/* 75784 00175684 0800E003 */  jr         $31
/* 75788 00175688 00000000 */   nop
/* 7578C 0017568C 00000000 */  nop