.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawRaster__11CDungeonMapFP9CFrameVu1
/* C4710 001C4610 40FFBD27 */  addiu      $sp, $sp, -0xC0
/* C4714 001C4614 A000BF7F */  sq         $31, 0xA0($sp)
/* C4718 001C4618 9000B77F */  sq         $23, 0x90($sp)
/* C471C 001C461C 8000B67F */  sq         $22, 0x80($sp)
/* C4720 001C4620 7000B57F */  sq         $21, 0x70($sp)
/* C4724 001C4624 6000B47F */  sq         $20, 0x60($sp)
/* C4728 001C4628 5000B37F */  sq         $19, 0x50($sp)
/* C472C 001C462C 4000B27F */  sq         $18, 0x40($sp)
/* C4730 001C4630 3000B17F */  sq         $17, 0x30($sp)
/* C4734 001C4634 2000B07F */  sq         $16, 0x20($sp)
/* C4738 001C4638 1000B8E7 */  swc1       $f24, 0x10($sp)
/* C473C 001C463C 0C00B7E7 */  swc1       $f23, 0xC($sp)
/* C4740 001C4640 0800B6E7 */  swc1       $f22, 0x8($sp)
/* C4744 001C4644 0400B5E7 */  swc1       $f21, 0x4($sp)
/* C4748 001C4648 0000B4E7 */  swc1       $f20, 0x0($sp)
/* C474C 001C464C 28868070 */  paddub     $16, $4, $0
/* C4750 001C4650 B000A427 */  addiu      $4, $sp, 0xB0
/* C4754 001C4654 2002A524 */  addiu      $5, $5, 0x220
/* C4758 001C4658 0C86040C */  jal        sceVu0CopyVector
/* C475C 001C465C 00000000 */   nop
/* C4760 001C4660 2043023C */  lui        $2, (0x43200000 >> 16)
/* C4764 001C4664 00088244 */  mtc1       $2, $f1
/* C4768 001C4668 B000A0C7 */  lwc1       $f0, 0xB0($sp)
/* C476C 001C466C 03030146 */  div.s      $f12, $f0, $f1
/* C4770 001C4670 2C44040C */  jal        fptosi
/* C4774 001C4674 00000000 */   nop
/* C4778 001C4678 28BE4070 */  paddub     $23, $2, $0
/* C477C 001C467C 2043023C */  lui        $2, (0x43200000 >> 16)
/* C4780 001C4680 00088244 */  mtc1       $2, $f1
/* C4784 001C4684 B800A0C7 */  lwc1       $f0, 0xB8($sp)
/* C4788 001C4688 03030146 */  div.s      $f12, $f0, $f1
/* C478C 001C468C 2C44040C */  jal        fptosi
/* C4790 001C4690 00000000 */   nop
/* C4794 001C4694 28A64070 */  paddub     $20, $2, $0
/* C4798 001C4698 FCFF9326 */  addiu      $19, $20, -0x4
/* C479C 001C469C 90000010 */  b          .L001C48E0
/* C47A0 001C46A0 00000000 */   nop
.L001C46A4:
/* C47A4 001C46A4 FCFFF226 */  addiu      $18, $23, -0x4
/* C47A8 001C46A8 88000010 */  b          .L001C48CC
/* C47AC 001C46AC 00000000 */   nop
.L001C46B0:
/* C47B0 001C46B0 85006006 */  bltz       $19, .L001C48C8
/* C47B4 001C46B4 00000000 */   nop
/* C47B8 001C46B8 1400612A */  slti       $at, $19, 0x14
/* C47BC 001C46BC 82002010 */  beqz       $at, .L001C48C8
/* C47C0 001C46C0 00000000 */   nop
/* C47C4 001C46C4 80004006 */  bltz       $18, .L001C48C8
/* C47C8 001C46C8 00000000 */   nop
/* C47CC 001C46CC 1400412A */  slti       $at, $18, 0x14
/* C47D0 001C46D0 7D002010 */  beqz       $at, .L001C48C8
/* C47D4 001C46D4 00000000 */   nop
/* C47D8 001C46D8 80181300 */  sll        $3, $19, 2
/* C47DC 001C46DC 21187300 */  addu       $3, $3, $19
/* C47E0 001C46E0 80180300 */  sll        $3, $3, 2
/* C47E4 001C46E4 21184302 */  addu       $3, $18, $3
/* C47E8 001C46E8 00A90300 */  sll        $21, $3, 4
/* C47EC 001C46EC 2128B002 */  addu       $5, $21, $16
/* C47F0 001C46F0 581CB624 */  addiu      $22, $5, 0x1C58
/* C47F4 001C46F4 F87FD626 */  addiu      $22, $22, 0x7FF8
/* C47F8 001C46F8 0000C48E */  lw         $4, 0x0($22)
/* C47FC 001C46FC FFFF0324 */  addiu      $3, $0, -0x1
/* C4800 001C4700 71008310 */  beq        $4, $3, .L001C48C8
/* C4804 001C4704 00000000 */   nop
/* C4808 001C4708 0100013C */  lui        $at, (0x10000 >> 16)
/* C480C 001C470C 2108A100 */  addu       $at, $5, $at
/* C4810 001C4710 589C21C4 */  lwc1       $f1, -0x63A8($at)
/* C4814 001C4714 7043033C */  lui        $3, (0x43700000 >> 16)
/* C4818 001C4718 00008344 */  mtc1       $3, $f0
/* C481C 001C471C 00000000 */  nop
/* C4820 001C4720 36080046 */  c.le.s     $f1, $f0
/* C4824 001C4724 00000000 */  nop
/* C4828 001C4728 67000045 */  bc1f       .L001C48C8
/* C482C 001C472C 00000000 */   nop
/* C4830 001C4730 0100013C */  lui        $at, (0x10000 >> 16)
/* C4834 001C4734 2108A100 */  addu       $at, $5, $at
/* C4838 001C4738 5C9C248C */  lw         $4, -0x63A4($at)
/* C483C 001C473C 01000324 */  addiu      $3, $0, 0x1
/* C4840 001C4740 61008314 */  bne        $4, $3, .L001C48C8
/* C4844 001C4744 00000000 */   nop
/* C4848 001C4748 288E0070 */  paddub     $17, $0, $0
/* C484C 001C474C 52000010 */  b          .L001C4898
/* C4850 001C4750 00000000 */   nop
.L001C4754:
/* C4854 001C4754 00111100 */  sll        $2, $17, 4
/* C4858 001C4758 21104400 */  addu       $2, $2, $4
/* C485C 001C475C 200054C4 */  lwc1       $f20, 0x20($2)
/* C4860 001C4760 240055C4 */  lwc1       $f21, 0x24($2)
/* C4864 001C4764 280056C4 */  lwc1       $f22, 0x28($2)
/* C4868 001C4768 2110B002 */  addu       $2, $21, $16
/* C486C 001C476C 0100013C */  lui        $at, (0x10000 >> 16)
/* C4870 001C4770 21084100 */  addu       $at, $2, $at
/* C4874 001C4774 549C248C */  lw         $4, -0x63AC($at)
/* C4878 001C4778 04000224 */  addiu      $2, $0, 0x4
/* C487C 001C477C 23184400 */  subu       $3, $2, $4
/* C4880 001C4780 00110300 */  sll        $2, $3, 4
/* C4884 001C4784 23184300 */  subu       $3, $2, $3
/* C4888 001C4788 80100300 */  sll        $2, $3, 2
/* C488C 001C478C 23104300 */  subu       $2, $2, $3
/* C4890 001C4790 40100200 */  sll        $2, $2, 1
/* C4894 001C4794 00008244 */  mtc1       $2, $f0
/* C4898 001C4798 00000000 */  nop
/* C489C 001C479C 60008046 */  cvt.s.w    $f1, $f0
/* C48A0 001C47A0 B08080C7 */  lwc1       $f0, -0x7F50($gp)
/* C48A4 001C47A4 42000146 */  mul.s      $f1, $f0, $f1
/* C48A8 001C47A8 3443023C */  lui        $2, (0x43340000 >> 16)
/* C48AC 001C47AC 00008244 */  mtc1       $2, $f0
/* C48B0 001C47B0 00000000 */  nop
/* C48B4 001C47B4 030E0046 */  div.s      $f24, $f1, $f0
/* C48B8 001C47B8 1B008010 */  beqz       $4, .L001C4828
/* C48BC 001C47BC 00000000 */   nop
/* C48C0 001C47C0 06C30046 */  mov.s      $f12, $f24
/* C48C4 001C47C4 2876040C */  jal        sinf
/* C48C8 001C47C8 00000000 */   nop
/* C48CC 001C47CC 47B00046 */  neg.s      $f1, $f22
/* C48D0 001C47D0 C20D0046 */  mul.s      $f23, $f1, $f0
/* C48D4 001C47D4 06C30046 */  mov.s      $f12, $f24
/* C48D8 001C47D8 AC75040C */  jal        cosf
/* C48DC 001C47DC 00000000 */   nop
/* C48E0 001C47E0 02A00046 */  mul.s      $f0, $f20, $f0
/* C48E4 001C47E4 C1BD0046 */  sub.s      $f23, $f23, $f0
/* C48E8 001C47E8 06C30046 */  mov.s      $f12, $f24
/* C48EC 001C47EC 2876040C */  jal        sinf
/* C48F0 001C47F0 00000000 */   nop
/* C48F4 001C47F4 47A00046 */  neg.s      $f1, $f20
/* C48F8 001C47F8 020D0046 */  mul.s      $f20, $f1, $f0
/* C48FC 001C47FC 06C30046 */  mov.s      $f12, $f24
/* C4900 001C4800 AC75040C */  jal        cosf
/* C4904 001C4804 00000000 */   nop
/* C4908 001C4808 02B00046 */  mul.s      $f0, $f22, $f0
/* C490C 001C480C 80A50046 */  add.s      $f22, $f20, $f0
/* C4910 001C4810 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* C4914 001C4814 00008244 */  mtc1       $2, $f0
/* C4918 001C4818 00000000 */  nop
/* C491C 001C481C C2BD0046 */  mul.s      $f23, $f23, $f0
/* C4920 001C4820 02000010 */  b          .L001C482C
/* C4924 001C4824 00000000 */   nop
.L001C4828:
/* C4928 001C4828 C6A50046 */  mov.s      $f23, $f20
.L001C482C:
/* C492C 001C482C 8041023C */  lui        $2, (0x41800000 >> 16)
/* C4930 001C4830 00088244 */  mtc1       $2, $f1
/* C4934 001C4834 00009244 */  mtc1       $18, $f0
/* C4938 001C4838 00000000 */  nop
/* C493C 001C483C 20008046 */  cvt.s.w    $f0, $f0
/* C4940 001C4840 02080046 */  mul.s      $f0, $f1, $f0
/* C4944 001C4844 00BD0046 */  add.s      $f20, $f23, $f0
/* C4948 001C4848 00009344 */  mtc1       $19, $f0
/* C494C 001C484C 00000000 */  nop
/* C4950 001C4850 20008046 */  cvt.s.w    $f0, $f0
/* C4954 001C4854 02080046 */  mul.s      $f0, $f1, $f0
/* C4958 001C4858 80B50046 */  add.s      $f22, $f22, $f0
/* C495C 001C485C 2041023C */  lui        $2, (0x41200000 >> 16)
/* C4960 001C4860 00088244 */  mtc1       $2, $f1
/* C4964 001C4864 00000000 */  nop
/* C4968 001C4868 02081446 */  mul.s      $f0, $f1, $f20
/* C496C 001C486C 700000E6 */  swc1       $f0, 0x70($16)
/* C4970 001C4870 02081546 */  mul.s      $f0, $f1, $f21
/* C4974 001C4874 740000E6 */  swc1       $f0, 0x74($16)
/* C4978 001C4878 02081646 */  mul.s      $f0, $f1, $f22
/* C497C 001C487C 780000E6 */  swc1       $f0, 0x78($16)
/* C4980 001C4880 803F023C */  lui        $2, (0x3F800000 >> 16)
/* C4984 001C4884 7C0002AE */  sw         $2, 0x7C($16)
/* C4988 001C4888 50000426 */  addiu      $4, $16, 0x50
/* C498C 001C488C C488050C */  jal        DrawRaster__9CFireOmniFv
/* C4990 001C4890 00000000 */   nop
/* C4994 001C4894 01003126 */  addiu      $17, $17, 0x1
.L001C4898:
/* C4998 001C4898 0000C48E */  lw         $4, 0x0($22)
/* C499C 001C489C C0180400 */  sll        $3, $4, 3
/* C49A0 001C48A0 23186400 */  subu       $3, $3, $4
/* C49A4 001C48A4 80180300 */  sll        $3, $3, 2
/* C49A8 001C48A8 21186400 */  addu       $3, $3, $4
/* C49AC 001C48AC 00190300 */  sll        $3, $3, 4
/* C49B0 001C48B0 21180302 */  addu       $3, $16, $3
/* C49B4 001C48B4 90046424 */  addiu      $4, $3, 0x490
/* C49B8 001C48B8 A2046384 */  lh         $3, 0x4A2($3)
/* C49BC 001C48BC 2A182302 */  slt        $3, $17, $3
/* C49C0 001C48C0 A4FF6014 */  bnez       $3, .L001C4754
/* C49C4 001C48C4 00000000 */   nop
.L001C48C8:
/* C49C8 001C48C8 01005226 */  addiu      $18, $18, 0x1
.L001C48CC:
/* C49CC 001C48CC 0400E326 */  addiu      $3, $23, 0x4
/* C49D0 001C48D0 2A184302 */  slt        $3, $18, $3
/* C49D4 001C48D4 76FF6014 */  bnez       $3, .L001C46B0
/* C49D8 001C48D8 00000000 */   nop
/* C49DC 001C48DC 01007326 */  addiu      $19, $19, 0x1
.L001C48E0:
/* C49E0 001C48E0 04008326 */  addiu      $3, $20, 0x4
/* C49E4 001C48E4 2A186302 */  slt        $3, $19, $3
/* C49E8 001C48E8 6EFF6014 */  bnez       $3, .L001C46A4
/* C49EC 001C48EC 00000000 */   nop
/* C49F0 001C48F0 A000BF7B */  lq         $31, 0xA0($sp)
/* C49F4 001C48F4 9000B77B */  lq         $23, 0x90($sp)
/* C49F8 001C48F8 8000B67B */  lq         $22, 0x80($sp)
/* C49FC 001C48FC 7000B57B */  lq         $21, 0x70($sp)
/* C4A00 001C4900 6000B47B */  lq         $20, 0x60($sp)
/* C4A04 001C4904 5000B37B */  lq         $19, 0x50($sp)
/* C4A08 001C4908 4000B27B */  lq         $18, 0x40($sp)
/* C4A0C 001C490C 3000B17B */  lq         $17, 0x30($sp)
/* C4A10 001C4910 2000B07B */  lq         $16, 0x20($sp)
/* C4A14 001C4914 1000B8C7 */  lwc1       $f24, 0x10($sp)
/* C4A18 001C4918 0C00B7C7 */  lwc1       $f23, 0xC($sp)
/* C4A1C 001C491C 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* C4A20 001C4920 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* C4A24 001C4924 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* C4A28 001C4928 C000BD27 */  addiu      $sp, $sp, 0xC0
/* C4A2C 001C492C 0800E003 */  jr         $31
/* C4A30 001C4930 00000000 */   nop
/* C4A34 001C4934 00000000 */  nop
/* C4A38 001C4938 00000000 */  nop
/* C4A3C 001C493C 00000000 */  nop
