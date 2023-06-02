.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Init_Cold__14CWeaponElementFPf
/* B8580 001B8480 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* B8584 001B8484 5000BF7F */  sq         $31, 0x50($sp)
/* B8588 001B8488 4000B37F */  sq         $19, 0x40($sp)
/* B858C 001B848C 3000B27F */  sq         $18, 0x30($sp)
/* B8590 001B8490 2000B17F */  sq         $17, 0x20($sp)
/* B8594 001B8494 1000B07F */  sq         $16, 0x10($sp)
/* B8598 001B8498 0000B4E7 */  swc1       $f20, 0x0($sp)
/* B859C 001B849C 289E8070 */  paddub     $19, $4, $0
/* B85A0 001B84A0 4041023C */  lui        $2, (0x41400000 >> 16)
/* B85A4 001B84A4 00088244 */  mtc1       $2, $f1
/* B85A8 001B84A8 A80580C4 */  lwc1       $f0, 0x5A8($4)
/* B85AC 001B84AC 020B0046 */  mul.s      $f12, $f1, $f0
/* B85B0 001B84B0 2C44040C */  jal        fptosi
/* B85B4 001B84B4 00000000 */   nop
/* B85B8 001B84B8 02004224 */  addiu      $2, $2, 0x2
/* B85BC 001B84BC AE0562A6 */  sh         $2, 0x5AE($19)
/* B85C0 001B84C0 A041023C */  lui        $2, (0x41A00000 >> 16)
/* B85C4 001B84C4 00088244 */  mtc1       $2, $f1
/* B85C8 001B84C8 A80560C6 */  lwc1       $f0, 0x5A8($19)
/* B85CC 001B84CC 020B0046 */  mul.s      $f12, $f1, $f0
/* B85D0 001B84D0 2C44040C */  jal        fptosi
/* B85D4 001B84D4 00000000 */   nop
/* B85D8 001B84D8 0A004224 */  addiu      $2, $2, 0xA
/* B85DC 001B84DC B80662A6 */  sh         $2, 0x6B8($19)
/* B85E0 001B84E0 4040023C */  lui        $2, (0x40400000 >> 16)
/* B85E4 001B84E4 00088244 */  mtc1       $2, $f1
/* B85E8 001B84E8 A80560C6 */  lwc1       $f0, 0x5A8($19)
/* B85EC 001B84EC 020B0046 */  mul.s      $f12, $f1, $f0
/* B85F0 001B84F0 2C44040C */  jal        fptosi
/* B85F4 001B84F4 00000000 */   nop
/* B85F8 001B84F8 06000324 */  addiu      $3, $0, 0x6
/* B85FC 001B84FC 23106200 */  subu       $2, $3, $2
/* B8600 001B8500 B40662A6 */  sh         $2, 0x6B4($19)
/* B8604 001B8504 B60660A6 */  sh         $0, 0x6B6($19)
/* B8608 001B8508 04000224 */  addiu      $2, $0, 0x4
/* B860C 001B850C 3A0762A6 */  sh         $2, 0x73A($19)
/* B8610 001B8510 6C8381C7 */  lwc1       $f1, -0x7C94($gp)
/* B8614 001B8514 A80560C6 */  lwc1       $f0, 0x5A8($19)
/* B8618 001B8518 020B0046 */  mul.s      $f12, $f1, $f0
/* B861C 001B851C 9044040C */  jal        fptodp
/* B8620 001B8520 00000000 */   nop
/* B8624 001B8524 688084DF */  ld         $4, -0x7F98($gp)
/* B8628 001B8528 282E4070 */  paddub     $5, $2, $0
/* B862C 001B852C 6E3F040C */  jal        dpadd
/* B8630 001B8530 00000000 */   nop
/* B8634 001B8534 28264070 */  paddub     $4, $2, $0
/* B8638 001B8538 9241040C */  jal        dptofp
/* B863C 001B853C 00000000 */   nop
/* B8640 001B8540 A00561C6 */  lwc1       $f1, 0x5A0($19)
/* B8644 001B8544 02080046 */  mul.s      $f0, $f1, $f0
/* B8648 001B8548 A00560E6 */  swc1       $f0, 0x5A0($19)
/* B864C 001B854C D48081C7 */  lwc1       $f1, -0x7F2C($gp)
/* B8650 001B8550 A80560C6 */  lwc1       $f0, 0x5A8($19)
/* B8654 001B8554 42080046 */  mul.s      $f1, $f1, $f0
/* B8658 001B8558 003F033C */  lui        $3, (0x3F000000 >> 16)
/* B865C 001B855C 00008344 */  mtc1       $3, $f0
/* B8660 001B8560 00000000 */  nop
/* B8664 001B8564 00000146 */  add.s      $f0, $f0, $f1
/* B8668 001B8568 B00560E6 */  swc1       $f0, 0x5B0($19)
/* B866C 001B856C 28260070 */  paddub     $4, $0, $0
/* B8670 001B8570 06000010 */  b          .L001B858C
/* B8674 001B8574 00000000 */   nop
.L001B8578:
/* B8678 001B8578 80180400 */  sll        $3, $4, 2
/* B867C 001B857C 21187300 */  addu       $3, $3, $19
/* B8680 001B8580 A00460AC */  sw         $0, 0x4A0($3)
/* B8684 001B8584 200560AC */  sw         $0, 0x520($3)
/* B8688 001B8588 01008424 */  addiu      $4, $4, 0x1
.L001B858C:
/* B868C 001B858C 20008328 */  slti       $3, $4, 0x20
/* B8690 001B8590 F9FF6014 */  bnez       $3, .L001B8578
/* B8694 001B8594 00000000 */   nop
/* B8698 001B8598 28860070 */  paddub     $16, $0, $0
/* B869C 001B859C 7B000010 */  b          .L001B878C
/* B86A0 001B85A0 00000000 */   nop
.L001B85A4:
/* B86A4 001B85A4 BE11040C */  jal        rand
/* B86A8 001B85A8 00000000 */   nop
/* B86AC 001B85AC 00008244 */  mtc1       $2, $f0
/* B86B0 001B85B0 00000000 */  nop
/* B86B4 001B85B4 60008046 */  cvt.s.w    $f1, $f0
/* B86B8 001B85B8 C040023C */  lui        $2, (0x40C00000 >> 16)
/* B86BC 001B85BC 00008244 */  mtc1       $2, $f0
/* B86C0 001B85C0 00000000 */  nop
/* B86C4 001B85C4 42000146 */  mul.s      $f1, $f0, $f1
/* B86C8 001B85C8 004F023C */  lui        $2, (0x4F000000 >> 16)
/* B86CC 001B85CC 00008244 */  mtc1       $2, $f0
/* B86D0 001B85D0 00000000 */  nop
/* B86D4 001B85D4 43080046 */  div.s      $f1, $f1, $f0
/* B86D8 001B85D8 4040023C */  lui        $2, (0x40400000 >> 16)
/* B86DC 001B85DC 00008244 */  mtc1       $2, $f0
/* B86E0 001B85E0 00000000 */  nop
/* B86E4 001B85E4 00000146 */  add.s      $f0, $f0, $f1
/* B86E8 001B85E8 80881000 */  sll        $17, $16, 2
/* B86EC 001B85EC 21183302 */  addu       $3, $17, $19
/* B86F0 001B85F0 200460E4 */  swc1       $f0, 0x420($3)
/* B86F4 001B85F4 803F023C */  lui        $2, (0x3F800000 >> 16)
/* B86F8 001B85F8 A00462AC */  sw         $2, 0x4A0($3)
/* B86FC 001B85FC BE11040C */  jal        rand
/* B8700 001B8600 00000000 */   nop
/* B8704 001B8604 00008244 */  mtc1       $2, $f0
/* B8708 001B8608 00000000 */  nop
/* B870C 001B860C 60008046 */  cvt.s.w    $f1, $f0
/* B8710 001B8610 4042023C */  lui        $2, (0x42400000 >> 16)
/* B8714 001B8614 00008244 */  mtc1       $2, $f0
/* B8718 001B8618 00000000 */  nop
/* B871C 001B861C 42000146 */  mul.s      $f1, $f0, $f1
/* B8720 001B8620 004F023C */  lui        $2, (0x4F000000 >> 16)
/* B8724 001B8624 00008244 */  mtc1       $2, $f0
/* B8728 001B8628 00000000 */  nop
/* B872C 001B862C 43080046 */  div.s      $f1, $f1, $f0
/* B8730 001B8630 803F023C */  lui        $2, (0x3F800000 >> 16)
/* B8734 001B8634 00008244 */  mtc1       $2, $f0
/* B8738 001B8638 00000000 */  nop
/* B873C 001B863C 00000146 */  add.s      $f0, $f0, $f1
/* B8740 001B8640 21103302 */  addu       $2, $17, $19
/* B8744 001B8644 200540E4 */  swc1       $f0, 0x520($2)
/* B8748 001B8648 40901000 */  sll        $18, $16, 1
/* B874C 001B864C 21105302 */  addu       $2, $18, $19
/* B8750 001B8650 BA0640A4 */  sh         $0, 0x6BA($2)
/* B8754 001B8654 A00574C6 */  lwc1       $f20, 0x5A0($19)
/* B8758 001B8658 BE11040C */  jal        rand
/* B875C 001B865C 00000000 */   nop
/* B8760 001B8660 00008244 */  mtc1       $2, $f0
/* B8764 001B8664 00000000 */  nop
/* B8768 001B8668 20008046 */  cvt.s.w    $f0, $f0
/* B876C 001B866C 42A00046 */  mul.s      $f1, $f20, $f0
/* B8770 001B8670 0040023C */  lui        $2, (0x40000000 >> 16)
/* B8774 001B8674 00008244 */  mtc1       $2, $f0
/* B8778 001B8678 00000000 */  nop
/* B877C 001B867C 42000146 */  mul.s      $f1, $f0, $f1
/* B8780 001B8680 004F023C */  lui        $2, (0x4F000000 >> 16)
/* B8784 001B8684 00008244 */  mtc1       $2, $f0
/* B8788 001B8688 00000000 */  nop
/* B878C 001B868C 03080046 */  div.s      $f0, $f1, $f0
/* B8790 001B8690 01001446 */  sub.s      $f0, $f0, $f20
/* B8794 001B8694 00891000 */  sll        $17, $16, 4
/* B8798 001B8698 21103302 */  addu       $2, $17, $19
/* B879C 001B869C 200040E4 */  swc1       $f0, 0x20($2)
/* B87A0 001B86A0 A00574C6 */  lwc1       $f20, 0x5A0($19)
/* B87A4 001B86A4 BE11040C */  jal        rand
/* B87A8 001B86A8 00000000 */   nop
/* B87AC 001B86AC 00008244 */  mtc1       $2, $f0
/* B87B0 001B86B0 00000000 */  nop
/* B87B4 001B86B4 20008046 */  cvt.s.w    $f0, $f0
/* B87B8 001B86B8 42A00046 */  mul.s      $f1, $f20, $f0
/* B87BC 001B86BC 004F023C */  lui        $2, (0x4F000000 >> 16)
/* B87C0 001B86C0 00008244 */  mtc1       $2, $f0
/* B87C4 001B86C4 00000000 */  nop
/* B87C8 001B86C8 43080046 */  div.s      $f1, $f1, $f0
/* B87CC 001B86CC 0040023C */  lui        $2, (0x40000000 >> 16)
/* B87D0 001B86D0 00008244 */  mtc1       $2, $f0
/* B87D4 001B86D4 00000000 */  nop
/* B87D8 001B86D8 03A00046 */  div.s      $f0, $f20, $f0
/* B87DC 001B86DC 00000146 */  add.s      $f0, $f0, $f1
/* B87E0 001B86E0 21103302 */  addu       $2, $17, $19
/* B87E4 001B86E4 240040E4 */  swc1       $f0, 0x24($2)
/* B87E8 001B86E8 A00574C6 */  lwc1       $f20, 0x5A0($19)
/* B87EC 001B86EC BE11040C */  jal        rand
/* B87F0 001B86F0 00000000 */   nop
/* B87F4 001B86F4 00008244 */  mtc1       $2, $f0
/* B87F8 001B86F8 00000000 */  nop
/* B87FC 001B86FC 20008046 */  cvt.s.w    $f0, $f0
/* B8800 001B8700 42A00046 */  mul.s      $f1, $f20, $f0
/* B8804 001B8704 0040023C */  lui        $2, (0x40000000 >> 16)
/* B8808 001B8708 00008244 */  mtc1       $2, $f0
/* B880C 001B870C 00000000 */  nop
/* B8810 001B8710 42000146 */  mul.s      $f1, $f0, $f1
/* B8814 001B8714 004F023C */  lui        $2, (0x4F000000 >> 16)
/* B8818 001B8718 00008244 */  mtc1       $2, $f0
/* B881C 001B871C 00000000 */  nop
/* B8820 001B8720 03080046 */  div.s      $f0, $f1, $f0
/* B8824 001B8724 01001446 */  sub.s      $f0, $f0, $f20
/* B8828 001B8728 21183302 */  addu       $3, $17, $19
/* B882C 001B872C 280060E4 */  swc1       $f0, 0x28($3)
/* B8830 001B8730 803F023C */  lui        $2, (0x3F800000 >> 16)
/* B8834 001B8734 2C0062AC */  sw         $2, 0x2C($3)
/* B8838 001B8738 BE11040C */  jal        rand
/* B883C 001B873C 00000000 */   nop
/* B8840 001B8740 00008244 */  mtc1       $2, $f0
/* B8844 001B8744 00000000 */  nop
/* B8848 001B8748 60008046 */  cvt.s.w    $f1, $f0
/* B884C 001B874C A040023C */  lui        $2, (0x40A00000 >> 16)
/* B8850 001B8750 00008244 */  mtc1       $2, $f0
/* B8854 001B8754 00000000 */  nop
/* B8858 001B8758 42000146 */  mul.s      $f1, $f0, $f1
/* B885C 001B875C 004F023C */  lui        $2, (0x4F000000 >> 16)
/* B8860 001B8760 00008244 */  mtc1       $2, $f0
/* B8864 001B8764 00000000 */  nop
/* B8868 001B8768 030B0046 */  div.s      $f12, $f1, $f0
/* B886C 001B876C 2C44040C */  jal        fptosi
/* B8870 001B8770 00000000 */   nop
/* B8874 001B8774 40180200 */  sll        $3, $2, 1
/* B8878 001B8778 21186200 */  addu       $3, $3, $2
/* B887C 001B877C 00210300 */  sll        $4, $3, 4
/* B8880 001B8780 21185302 */  addu       $3, $18, $19
/* B8884 001B8784 FA0664A4 */  sh         $4, 0x6FA($3)
/* B8888 001B8788 01001026 */  addiu      $16, $16, 0x1
.L001B878C:
/* B888C 001B878C AE056386 */  lh         $3, 0x5AE($19)
/* B8890 001B8790 2A180302 */  slt        $3, $16, $3
/* B8894 001B8794 83FF6014 */  bnez       $3, .L001B85A4
/* B8898 001B8798 00000000 */   nop
/* B889C 001B879C 5000BF7B */  lq         $31, 0x50($sp)
/* B88A0 001B87A0 4000B37B */  lq         $19, 0x40($sp)
/* B88A4 001B87A4 3000B27B */  lq         $18, 0x30($sp)
/* B88A8 001B87A8 2000B17B */  lq         $17, 0x20($sp)
/* B88AC 001B87AC 1000B07B */  lq         $16, 0x10($sp)
/* B88B0 001B87B0 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* B88B4 001B87B4 6000BD27 */  addiu      $sp, $sp, 0x60
/* B88B8 001B87B8 0800E003 */  jr         $31
/* B88BC 001B87BC 00000000 */   nop