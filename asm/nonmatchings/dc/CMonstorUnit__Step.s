.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Step__12CMonstorUnitFi
/* DD640 001DD540 80FEBD27 */  addiu      $sp, $sp, -0x180
/* DD644 001DD544 8000BF7F */  sq         $31, 0x80($sp)
/* DD648 001DD548 7000B67F */  sq         $22, 0x70($sp)
/* DD64C 001DD54C 6000B57F */  sq         $21, 0x60($sp)
/* DD650 001DD550 5000B47F */  sq         $20, 0x50($sp)
/* DD654 001DD554 4000B37F */  sq         $19, 0x40($sp)
/* DD658 001DD558 3000B27F */  sq         $18, 0x30($sp)
/* DD65C 001DD55C 2000B17F */  sq         $17, 0x20($sp)
/* DD660 001DD560 1000B07F */  sq         $16, 0x10($sp)
/* DD664 001DD564 0000B4E7 */  swc1       $f20, 0x0($sp)
/* DD668 001DD568 28AE8070 */  paddub     $21, $4, $0
/* DD66C 001DD56C 2886A070 */  paddub     $16, $5, $0
/* DD670 001DD570 6866070C */  jal        CheckViewLevel__12CMonstorUnitFv
/* DD674 001DD574 00000000 */   nop
/* DD678 001DD578 05000012 */  beqz       $16, .L001DD590
/* DD67C 001DD57C 00000000 */   nop
/* DD680 001DD580 01000324 */  addiu      $3, $0, 0x1
/* DD684 001DD584 9800A3AE */  sw         $3, 0x98($21)
/* DD688 001DD588 0A090010 */  b          .L001DF9B4
/* DD68C 001DD58C 00000000 */   nop
.L001DD590:
/* DD690 001DD590 9800A38E */  lw         $3, 0x98($21)
/* DD694 001DD594 A2006010 */  beqz       $3, .L001DD820
/* DD698 001DD598 00000000 */   nop
/* DD69C 001DD59C 281E0070 */  paddub     $3, $0, $0
/* DD6A0 001DD5A0 9B000010 */  b          .L001DD810
/* DD6A4 001DD5A4 00000000 */   nop
.L001DD5A8:
/* DD6A8 001DD5A8 80200300 */  sll        $4, $3, 2
/* DD6AC 001DD5AC 21288300 */  addu       $5, $4, $3
/* DD6B0 001DD5B0 80200500 */  sll        $4, $5, 2
/* DD6B4 001DD5B4 2120A400 */  addu       $4, $5, $4
/* DD6B8 001DD5B8 00210400 */  sll        $4, $4, 4
/* DD6BC 001DD5BC 21489500 */  addu       $9, $4, $21
/* DD6C0 001DD5C0 0200013C */  lui        $at, (0x20000 >> 16)
/* DD6C4 001DD5C4 21082101 */  addu       $at, $9, $at
/* DD6C8 001DD5C8 D0E3258C */  lw         $5, -0x1C30($at)
/* DD6CC 001DD5CC 02000824 */  addiu      $8, $0, 0x2
/* DD6D0 001DD5D0 8E00A814 */  bne        $5, $8, .L001DD80C
/* DD6D4 001DD5D4 00000000 */   nop
/* DD6D8 001DD5D8 0100013C */  lui        $at, (0x1E4BE >> 16)
/* DD6DC 001DD5DC BEE42134 */  ori        $at, $at, (0x1E4BE & 0xFFFF)
/* DD6E0 001DD5E0 21382101 */  addu       $7, $9, $at
/* DD6E4 001DD5E4 0000E684 */  lh         $6, 0x0($7)
/* DD6E8 001DD5E8 FBFF0524 */  addiu      $5, $0, -0x5
/* DD6EC 001DD5EC 2428C500 */  and        $5, $6, $5
/* DD6F0 001DD5F0 0000E5A4 */  sh         $5, 0x0($7)
/* DD6F4 001DD5F4 0000E584 */  lh         $5, 0x0($7)
/* DD6F8 001DD5F8 4400A814 */  bne        $5, $8, .L001DD70C
/* DD6FC 001DD5FC 00000000 */   nop
/* DD700 001DD600 0100013C */  lui        $at, (0x1E4BC >> 16)
/* DD704 001DD604 BCE42134 */  ori        $at, $at, (0x1E4BC & 0xFFFF)
/* DD708 001DD608 21582101 */  addu       $11, $9, $at
/* DD70C 001DD60C 00006785 */  lh         $7, 0x0($11)
/* DD710 001DD610 10350524 */  addiu      $5, $0, 0x3510
/* DD714 001DD614 18506500 */  mult       $10, $3, $5
/* DD718 001DD618 21305501 */  addu       $6, $10, $21
/* DD71C 001DD61C 0200013C */  lui        $at, (0x20938 >> 16)
/* DD720 001DD620 2108C100 */  addu       $at, $6, $at
/* DD724 001DD624 380927AC */  sw         $7, (0x20938 & 0xFFFF)($at)
/* DD728 001DD628 0200013C */  lui        $at, (0x20934 >> 16)
/* DD72C 001DD62C 2108C100 */  addu       $at, $6, $at
/* DD730 001DD630 340928AC */  sw         $8, (0x20934 & 0xFFFF)($at)
/* DD734 001DD634 80BF053C */  lui        $5, (0xBF800000 >> 16)
/* DD738 001DD638 0200013C */  lui        $at, (0x20930 >> 16)
/* DD73C 001DD63C 30092134 */  ori        $at, $at, (0x20930 & 0xFFFF)
/* DD740 001DD640 2130C100 */  addu       $6, $6, $at
/* DD744 001DD644 0000C5AC */  sw         $5, 0x0($6)
/* DD748 001DD648 0100013C */  lui        $at, (0x1E4C0 >> 16)
/* DD74C 001DD64C C0E42134 */  ori        $at, $at, (0x1E4C0 & 0xFFFF)
/* DD750 001DD650 21482101 */  addu       $9, $9, $at
/* DD754 001DD654 000021C5 */  lwc1       $f1, 0x0($9)
/* DD758 001DD658 00008044 */  mtc1       $0, $f0
/* DD75C 001DD65C 00000000 */  nop
/* DD760 001DD660 34080046 */  c.lt.s     $f1, $f0
/* DD764 001DD664 00000000 */  nop
/* DD768 001DD668 02000145 */  bc1t       .L001DD674
/* DD76C 001DD66C 00000000 */   nop
/* DD770 001DD670 0000C1E4 */  swc1       $f1, 0x0($6)
.L001DD674:
/* DD774 001DD674 28460070 */  paddub     $8, $0, $0
/* DD778 001DD678 1B000010 */  b          .L001DD6E8
/* DD77C 001DD67C 00000000 */   nop
.L001DD680:
/* DD780 001DD680 00006785 */  lh         $7, 0x0($11)
/* DD784 001DD684 21305501 */  addu       $6, $10, $21
/* DD788 001DD688 B0110524 */  addiu      $5, $0, 0x11B0
/* DD78C 001DD68C 18280501 */  mult       $5, $8, $5
/* DD790 001DD690 2130A600 */  addu       $6, $5, $6
/* DD794 001DD694 0200013C */  lui        $at, (0x21AE8 >> 16)
/* DD798 001DD698 2108C100 */  addu       $at, $6, $at
/* DD79C 001DD69C E81A27AC */  sw         $7, (0x21AE8 & 0xFFFF)($at)
/* DD7A0 001DD6A0 02000524 */  addiu      $5, $0, 0x2
/* DD7A4 001DD6A4 0200013C */  lui        $at, (0x21AE4 >> 16)
/* DD7A8 001DD6A8 2108C100 */  addu       $at, $6, $at
/* DD7AC 001DD6AC E41A25AC */  sw         $5, (0x21AE4 & 0xFFFF)($at)
/* DD7B0 001DD6B0 80BF053C */  lui        $5, (0xBF800000 >> 16)
/* DD7B4 001DD6B4 0200013C */  lui        $at, (0x21AE0 >> 16)
/* DD7B8 001DD6B8 E01A2134 */  ori        $at, $at, (0x21AE0 & 0xFFFF)
/* DD7BC 001DD6BC 2130C100 */  addu       $6, $6, $at
/* DD7C0 001DD6C0 0000C5AC */  sw         $5, 0x0($6)
/* DD7C4 001DD6C4 000021C5 */  lwc1       $f1, 0x0($9)
/* DD7C8 001DD6C8 00008044 */  mtc1       $0, $f0
/* DD7CC 001DD6CC 00000000 */  nop
/* DD7D0 001DD6D0 34080046 */  c.lt.s     $f1, $f0
/* DD7D4 001DD6D4 00000000 */  nop
/* DD7D8 001DD6D8 02000145 */  bc1t       .L001DD6E4
/* DD7DC 001DD6DC 00000000 */   nop
/* DD7E0 001DD6E0 0000C1E4 */  swc1       $f1, 0x0($6)
.L001DD6E4:
/* DD7E4 001DD6E4 01000825 */  addiu      $8, $8, 0x1
.L001DD6E8:
/* DD7E8 001DD6E8 21289500 */  addu       $5, $4, $21
/* DD7EC 001DD6EC 0200013C */  lui        $at, (0x20000 >> 16)
/* DD7F0 001DD6F0 2108A100 */  addu       $at, $5, $at
/* DD7F4 001DD6F4 84E42584 */  lh         $5, -0x1B7C($at)
/* DD7F8 001DD6F8 2A280501 */  slt        $5, $8, $5
/* DD7FC 001DD6FC E0FFA014 */  bnez       $5, .L001DD680
/* DD800 001DD700 00000000 */   nop
/* DD804 001DD704 41000010 */  b          .L001DD80C
/* DD808 001DD708 00000000 */   nop
.L001DD70C:
/* DD80C 001DD70C 0100013C */  lui        $at, (0x1E4BC >> 16)
/* DD810 001DD710 BCE42134 */  ori        $at, $at, (0x1E4BC & 0xFFFF)
/* DD814 001DD714 21582101 */  addu       $11, $9, $at
/* DD818 001DD718 00006785 */  lh         $7, 0x0($11)
/* DD81C 001DD71C 10350524 */  addiu      $5, $0, 0x3510
/* DD820 001DD720 18506500 */  mult       $10, $3, $5
/* DD824 001DD724 21305501 */  addu       $6, $10, $21
/* DD828 001DD728 0200013C */  lui        $at, (0x20938 >> 16)
/* DD82C 001DD72C 2108C100 */  addu       $at, $6, $at
/* DD830 001DD730 380927AC */  sw         $7, (0x20938 & 0xFFFF)($at)
/* DD834 001DD734 0200013C */  lui        $at, (0x20934 >> 16)
/* DD838 001DD738 2108C100 */  addu       $at, $6, $at
/* DD83C 001DD73C 340920AC */  sw         $0, (0x20934 & 0xFFFF)($at)
/* DD840 001DD740 80BF053C */  lui        $5, (0xBF800000 >> 16)
/* DD844 001DD744 0200013C */  lui        $at, (0x20930 >> 16)
/* DD848 001DD748 30092134 */  ori        $at, $at, (0x20930 & 0xFFFF)
/* DD84C 001DD74C 2130C100 */  addu       $6, $6, $at
/* DD850 001DD750 0000C5AC */  sw         $5, 0x0($6)
/* DD854 001DD754 0100013C */  lui        $at, (0x1E4C0 >> 16)
/* DD858 001DD758 C0E42134 */  ori        $at, $at, (0x1E4C0 & 0xFFFF)
/* DD85C 001DD75C 21482101 */  addu       $9, $9, $at
/* DD860 001DD760 000021C5 */  lwc1       $f1, 0x0($9)
/* DD864 001DD764 00008044 */  mtc1       $0, $f0
/* DD868 001DD768 00000000 */  nop
/* DD86C 001DD76C 34080046 */  c.lt.s     $f1, $f0
/* DD870 001DD770 00000000 */  nop
/* DD874 001DD774 02000145 */  bc1t       .L001DD780
/* DD878 001DD778 00000000 */   nop
/* DD87C 001DD77C 0000C1E4 */  swc1       $f1, 0x0($6)
.L001DD780:
/* DD880 001DD780 28460070 */  paddub     $8, $0, $0
/* DD884 001DD784 1A000010 */  b          .L001DD7F0
/* DD888 001DD788 00000000 */   nop
.L001DD78C:
/* DD88C 001DD78C 00006785 */  lh         $7, 0x0($11)
/* DD890 001DD790 21305501 */  addu       $6, $10, $21
/* DD894 001DD794 B0110524 */  addiu      $5, $0, 0x11B0
/* DD898 001DD798 18280501 */  mult       $5, $8, $5
/* DD89C 001DD79C 2130A600 */  addu       $6, $5, $6
/* DD8A0 001DD7A0 0200013C */  lui        $at, (0x21AE8 >> 16)
/* DD8A4 001DD7A4 2108C100 */  addu       $at, $6, $at
/* DD8A8 001DD7A8 E81A27AC */  sw         $7, (0x21AE8 & 0xFFFF)($at)
/* DD8AC 001DD7AC 0200013C */  lui        $at, (0x21AE4 >> 16)
/* DD8B0 001DD7B0 2108C100 */  addu       $at, $6, $at
/* DD8B4 001DD7B4 E41A20AC */  sw         $0, (0x21AE4 & 0xFFFF)($at)
/* DD8B8 001DD7B8 80BF053C */  lui        $5, (0xBF800000 >> 16)
/* DD8BC 001DD7BC 0200013C */  lui        $at, (0x21AE0 >> 16)
/* DD8C0 001DD7C0 E01A2134 */  ori        $at, $at, (0x21AE0 & 0xFFFF)
/* DD8C4 001DD7C4 2130C100 */  addu       $6, $6, $at
/* DD8C8 001DD7C8 0000C5AC */  sw         $5, 0x0($6)
/* DD8CC 001DD7CC 000021C5 */  lwc1       $f1, 0x0($9)
/* DD8D0 001DD7D0 00008044 */  mtc1       $0, $f0
/* DD8D4 001DD7D4 00000000 */  nop
/* DD8D8 001DD7D8 34080046 */  c.lt.s     $f1, $f0
/* DD8DC 001DD7DC 00000000 */  nop
/* DD8E0 001DD7E0 02000145 */  bc1t       .L001DD7EC
/* DD8E4 001DD7E4 00000000 */   nop
/* DD8E8 001DD7E8 0000C1E4 */  swc1       $f1, 0x0($6)
.L001DD7EC:
/* DD8EC 001DD7EC 01000825 */  addiu      $8, $8, 0x1
.L001DD7F0:
/* DD8F0 001DD7F0 21289500 */  addu       $5, $4, $21
/* DD8F4 001DD7F4 0200013C */  lui        $at, (0x20000 >> 16)
/* DD8F8 001DD7F8 2108A100 */  addu       $at, $5, $at
/* DD8FC 001DD7FC 84E42584 */  lh         $5, -0x1B7C($at)
/* DD900 001DD800 2A280501 */  slt        $5, $8, $5
/* DD904 001DD804 E1FFA014 */  bnez       $5, .L001DD78C
/* DD908 001DD808 00000000 */   nop
.L001DD80C:
/* DD90C 001DD80C 01006324 */  addiu      $3, $3, 0x1
.L001DD810:
/* DD910 001DD810 10006428 */  slti       $4, $3, 0x10
/* DD914 001DD814 64FF8014 */  bnez       $4, .L001DD5A8
/* DD918 001DD818 00000000 */   nop
/* DD91C 001DD81C 9800A0AE */  sw         $0, 0x98($21)
.L001DD820:
/* DD920 001DD820 FFFF0324 */  addiu      $3, $0, -0x1
/* DD924 001DD824 DC01013C */  lui        $at, (0x1DC4528 >> 16)
/* DD928 001DD828 284523AC */  sw         $3, (0x1DC4528 & 0xFFFF)($at)
/* DD92C 001DD82C 28860070 */  paddub     $16, $0, $0
/* DD930 001DD830 5D080010 */  b          .L001DF9A8
/* DD934 001DD834 00000000 */   nop
.L001DD838:
/* DD938 001DD838 80181000 */  sll        $3, $16, 2
/* DD93C 001DD83C 21207000 */  addu       $4, $3, $16
/* DD940 001DD840 80180400 */  sll        $3, $4, 2
/* DD944 001DD844 21188300 */  addu       $3, $4, $3
/* DD948 001DD848 00190300 */  sll        $3, $3, 4
/* DD94C 001DD84C 21187500 */  addu       $3, $3, $21
/* DD950 001DD850 0200013C */  lui        $at, (0x20000 >> 16)
/* DD954 001DD854 21086100 */  addu       $at, $3, $at
/* DD958 001DD858 D0E3248C */  lw         $4, -0x1C30($at)
/* DD95C 001DD85C 02000324 */  addiu      $3, $0, 0x2
/* DD960 001DD860 50088314 */  bne        $4, $3, .L001DF9A4
/* DD964 001DD864 00000000 */   nop
/* DD968 001DD868 9000B0AE */  sw         $16, 0x90($21)
/* DD96C 001DD86C 9000A58E */  lw         $5, 0x90($21)
/* DD970 001DD870 80200500 */  sll        $4, $5, 2
/* DD974 001DD874 21288500 */  addu       $5, $4, $5
/* DD978 001DD878 80200500 */  sll        $4, $5, 2
/* DD97C 001DD87C 2120A400 */  addu       $4, $5, $4
/* DD980 001DD880 00210400 */  sll        $4, $4, 4
/* DD984 001DD884 21309500 */  addu       $6, $4, $21
/* DD988 001DD888 0200013C */  lui        $at, (0x20000 >> 16)
/* DD98C 001DD88C 2108C100 */  addu       $at, $6, $at
/* DD990 001DD890 C4E42484 */  lh         $4, -0x1B3C($at)
/* DD994 001DD894 C6008010 */  beqz       $4, .L001DDBB0
/* DD998 001DD898 00000000 */   nop
/* DD99C 001DD89C 0200013C */  lui        $at, (0x20000 >> 16)
/* DD9A0 001DD8A0 2108C100 */  addu       $at, $6, $at
/* DD9A4 001DD8A4 BEE42584 */  lh         $5, -0x1B42($at)
/* DD9A8 001DD8A8 FBFF0424 */  addiu      $4, $0, -0x5
/* DD9AC 001DD8AC 2420A400 */  and        $4, $5, $4
/* DD9B0 001DD8B0 0200013C */  lui        $at, (0x20000 >> 16)
/* DD9B4 001DD8B4 2108C100 */  addu       $at, $6, $at
/* DD9B8 001DD8B8 BEE424A4 */  sh         $4, -0x1B42($at)
/* DD9BC 001DD8BC 9000A78E */  lw         $7, 0x90($21)
/* DD9C0 001DD8C0 80200700 */  sll        $4, $7, 2
/* DD9C4 001DD8C4 21288700 */  addu       $5, $4, $7
/* DD9C8 001DD8C8 80200500 */  sll        $4, $5, 2
/* DD9CC 001DD8CC 2120A400 */  addu       $4, $5, $4
/* DD9D0 001DD8D0 00210400 */  sll        $4, $4, 4
/* DD9D4 001DD8D4 21289500 */  addu       $5, $4, $21
/* DD9D8 001DD8D8 0200013C */  lui        $at, (0x20000 >> 16)
/* DD9DC 001DD8DC 2108A100 */  addu       $at, $5, $at
/* DD9E0 001DD8E0 BEE42484 */  lh         $4, -0x1B42($at)
/* DD9E4 001DD8E4 61008314 */  bne        $4, $3, .L001DDA6C
/* DD9E8 001DD8E8 00000000 */   nop
/* DD9EC 001DD8EC 0200013C */  lui        $at, (0x20000 >> 16)
/* DD9F0 001DD8F0 2108A100 */  addu       $at, $5, $at
/* DD9F4 001DD8F4 BCE42684 */  lh         $6, -0x1B44($at)
/* DD9F8 001DD8F8 10350524 */  addiu      $5, $0, 0x3510
/* DD9FC 001DD8FC 1820E500 */  mult       $4, $7, $5
/* DDA00 001DD900 2120A402 */  addu       $4, $21, $4
/* DDA04 001DD904 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* DDA08 001DD908 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* DDA0C 001DD90C 21208100 */  addu       $4, $4, $at
/* DDA10 001DD910 680C86AC */  sw         $6, 0xC68($4)
/* DDA14 001DD914 640C83AC */  sw         $3, 0xC64($4)
/* DDA18 001DD918 80BF033C */  lui        $3, (0xBF800000 >> 16)
/* DDA1C 001DD91C 600C83AC */  sw         $3, 0xC60($4)
/* DDA20 001DD920 9000A68E */  lw         $6, 0x90($21)
/* DDA24 001DD924 80180600 */  sll        $3, $6, 2
/* DDA28 001DD928 21206600 */  addu       $4, $3, $6
/* DDA2C 001DD92C 80180400 */  sll        $3, $4, 2
/* DDA30 001DD930 21188300 */  addu       $3, $4, $3
/* DDA34 001DD934 00190300 */  sll        $3, $3, 4
/* DDA38 001DD938 21187500 */  addu       $3, $3, $21
/* DDA3C 001DD93C 0200013C */  lui        $at, (0x20000 >> 16)
/* DDA40 001DD940 21086100 */  addu       $at, $3, $at
/* DDA44 001DD944 C0E421C4 */  lwc1       $f1, -0x1B40($at)
/* DDA48 001DD948 00008044 */  mtc1       $0, $f0
/* DDA4C 001DD94C 00000000 */  nop
/* DDA50 001DD950 34080046 */  c.lt.s     $f1, $f0
/* DDA54 001DD954 00000000 */  nop
/* DDA58 001DD958 07000145 */  bc1t       .L001DD978
/* DDA5C 001DD95C 00000000 */   nop
/* DDA60 001DD960 1818C500 */  mult       $3, $6, $5
/* DDA64 001DD964 2118A302 */  addu       $3, $21, $3
/* DDA68 001DD968 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* DDA6C 001DD96C D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* DDA70 001DD970 21186100 */  addu       $3, $3, $at
/* DDA74 001DD974 600C61E4 */  swc1       $f1, 0xC60($3)
.L001DD978:
/* DDA78 001DD978 281E0070 */  paddub     $3, $0, $0
/* DDA7C 001DD97C 2C000010 */  b          .L001DDA30
/* DDA80 001DD980 00000000 */   nop
.L001DD984:
/* DDA84 001DD984 2120B500 */  addu       $4, $5, $21
/* DDA88 001DD988 0200013C */  lui        $at, (0x20000 >> 16)
/* DDA8C 001DD98C 21088100 */  addu       $at, $4, $at
/* DDA90 001DD990 BCE42884 */  lh         $8, -0x1B44($at)
/* DDA94 001DD994 10350724 */  addiu      $7, $0, 0x3510
/* DDA98 001DD998 1820C700 */  mult       $4, $6, $7
/* DDA9C 001DD99C 2130A402 */  addu       $6, $21, $4
/* DDAA0 001DD9A0 01006524 */  addiu      $5, $3, 0x1
/* DDAA4 001DD9A4 B0110424 */  addiu      $4, $0, 0x11B0
/* DDAA8 001DD9A8 1848A470 */  mult1      $9, $5, $4
/* DDAAC 001DD9AC 2120C900 */  addu       $4, $6, $9
/* DDAB0 001DD9B0 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* DDAB4 001DD9B4 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* DDAB8 001DD9B8 21288100 */  addu       $5, $4, $at
/* DDABC 001DD9BC 680CA8AC */  sw         $8, 0xC68($5)
/* DDAC0 001DD9C0 02000424 */  addiu      $4, $0, 0x2
/* DDAC4 001DD9C4 640CA4AC */  sw         $4, 0xC64($5)
/* DDAC8 001DD9C8 80BF043C */  lui        $4, (0xBF800000 >> 16)
/* DDACC 001DD9CC 600CA4AC */  sw         $4, 0xC60($5)
/* DDAD0 001DD9D0 9000A68E */  lw         $6, 0x90($21)
/* DDAD4 001DD9D4 80200600 */  sll        $4, $6, 2
/* DDAD8 001DD9D8 21288600 */  addu       $5, $4, $6
/* DDADC 001DD9DC 80200500 */  sll        $4, $5, 2
/* DDAE0 001DD9E0 2120A400 */  addu       $4, $5, $4
/* DDAE4 001DD9E4 00210400 */  sll        $4, $4, 4
/* DDAE8 001DD9E8 21209500 */  addu       $4, $4, $21
/* DDAEC 001DD9EC 0200013C */  lui        $at, (0x20000 >> 16)
/* DDAF0 001DD9F0 21088100 */  addu       $at, $4, $at
/* DDAF4 001DD9F4 C0E421C4 */  lwc1       $f1, -0x1B40($at)
/* DDAF8 001DD9F8 00008044 */  mtc1       $0, $f0
/* DDAFC 001DD9FC 00000000 */  nop
/* DDB00 001DDA00 34080046 */  c.lt.s     $f1, $f0
/* DDB04 001DDA04 00000000 */  nop
/* DDB08 001DDA08 08000145 */  bc1t       .L001DDA2C
/* DDB0C 001DDA0C 00000000 */   nop
/* DDB10 001DDA10 1820C700 */  mult       $4, $6, $7
/* DDB14 001DDA14 2120A402 */  addu       $4, $21, $4
/* DDB18 001DDA18 21208900 */  addu       $4, $4, $9
/* DDB1C 001DDA1C 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* DDB20 001DDA20 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* DDB24 001DDA24 21208100 */  addu       $4, $4, $at
/* DDB28 001DDA28 600C81E4 */  swc1       $f1, 0xC60($4)
.L001DDA2C:
/* DDB2C 001DDA2C 01006324 */  addiu      $3, $3, 0x1
.L001DDA30:
/* DDB30 001DDA30 9000A68E */  lw         $6, 0x90($21)
/* DDB34 001DDA34 80200600 */  sll        $4, $6, 2
/* DDB38 001DDA38 21288600 */  addu       $5, $4, $6
/* DDB3C 001DDA3C 80200500 */  sll        $4, $5, 2
/* DDB40 001DDA40 2120A400 */  addu       $4, $5, $4
/* DDB44 001DDA44 00290400 */  sll        $5, $4, 4
/* DDB48 001DDA48 2120B500 */  addu       $4, $5, $21
/* DDB4C 001DDA4C 0200013C */  lui        $at, (0x20000 >> 16)
/* DDB50 001DDA50 21088100 */  addu       $at, $4, $at
/* DDB54 001DDA54 84E42484 */  lh         $4, -0x1B7C($at)
/* DDB58 001DDA58 2A206400 */  slt        $4, $3, $4
/* DDB5C 001DDA5C C9FF8014 */  bnez       $4, .L001DD984
/* DDB60 001DDA60 00000000 */   nop
/* DDB64 001DDA64 48000010 */  b          .L001DDB88
/* DDB68 001DDA68 00000000 */   nop
.L001DDA6C:
/* DDB6C 001DDA6C 0200013C */  lui        $at, (0x20000 >> 16)
/* DDB70 001DDA70 2108A100 */  addu       $at, $5, $at
/* DDB74 001DDA74 BCE42484 */  lh         $4, -0x1B44($at)
/* DDB78 001DDA78 10350324 */  addiu      $3, $0, 0x3510
/* DDB7C 001DDA7C 1818E300 */  mult       $3, $7, $3
/* DDB80 001DDA80 2118A302 */  addu       $3, $21, $3
/* DDB84 001DDA84 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* DDB88 001DDA88 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* DDB8C 001DDA8C 21286100 */  addu       $5, $3, $at
/* DDB90 001DDA90 680CA4AC */  sw         $4, 0xC68($5)
/* DDB94 001DDA94 640CA0AC */  sw         $0, 0xC64($5)
/* DDB98 001DDA98 80BF033C */  lui        $3, (0xBF800000 >> 16)
/* DDB9C 001DDA9C 600CA3AC */  sw         $3, 0xC60($5)
/* DDBA0 001DDAA0 281E0070 */  paddub     $3, $0, $0
/* DDBA4 001DDAA4 2B000010 */  b          .L001DDB54
/* DDBA8 001DDAA8 00000000 */   nop
.L001DDAAC:
/* DDBAC 001DDAAC 2120B500 */  addu       $4, $5, $21
/* DDBB0 001DDAB0 0200013C */  lui        $at, (0x20000 >> 16)
/* DDBB4 001DDAB4 21088100 */  addu       $at, $4, $at
/* DDBB8 001DDAB8 BCE42884 */  lh         $8, -0x1B44($at)
/* DDBBC 001DDABC 10350724 */  addiu      $7, $0, 0x3510
/* DDBC0 001DDAC0 1820C700 */  mult       $4, $6, $7
/* DDBC4 001DDAC4 2130A402 */  addu       $6, $21, $4
/* DDBC8 001DDAC8 01006524 */  addiu      $5, $3, 0x1
/* DDBCC 001DDACC B0110424 */  addiu      $4, $0, 0x11B0
/* DDBD0 001DDAD0 1848A470 */  mult1      $9, $5, $4
/* DDBD4 001DDAD4 2120C900 */  addu       $4, $6, $9
/* DDBD8 001DDAD8 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* DDBDC 001DDADC D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* DDBE0 001DDAE0 21288100 */  addu       $5, $4, $at
/* DDBE4 001DDAE4 680CA8AC */  sw         $8, 0xC68($5)
/* DDBE8 001DDAE8 640CA0AC */  sw         $0, 0xC64($5)
/* DDBEC 001DDAEC 80BF043C */  lui        $4, (0xBF800000 >> 16)
/* DDBF0 001DDAF0 600CA4AC */  sw         $4, 0xC60($5)
/* DDBF4 001DDAF4 9000A68E */  lw         $6, 0x90($21)
/* DDBF8 001DDAF8 80200600 */  sll        $4, $6, 2
/* DDBFC 001DDAFC 21288600 */  addu       $5, $4, $6
/* DDC00 001DDB00 80200500 */  sll        $4, $5, 2
/* DDC04 001DDB04 2120A400 */  addu       $4, $5, $4
/* DDC08 001DDB08 00210400 */  sll        $4, $4, 4
/* DDC0C 001DDB0C 21209500 */  addu       $4, $4, $21
/* DDC10 001DDB10 0200013C */  lui        $at, (0x20000 >> 16)
/* DDC14 001DDB14 21088100 */  addu       $at, $4, $at
/* DDC18 001DDB18 C0E421C4 */  lwc1       $f1, -0x1B40($at)
/* DDC1C 001DDB1C 00008044 */  mtc1       $0, $f0
/* DDC20 001DDB20 00000000 */  nop
/* DDC24 001DDB24 34080046 */  c.lt.s     $f1, $f0
/* DDC28 001DDB28 00000000 */  nop
/* DDC2C 001DDB2C 08000145 */  bc1t       .L001DDB50
/* DDC30 001DDB30 00000000 */   nop
/* DDC34 001DDB34 1820C700 */  mult       $4, $6, $7
/* DDC38 001DDB38 2120A402 */  addu       $4, $21, $4
/* DDC3C 001DDB3C 21208900 */  addu       $4, $4, $9
/* DDC40 001DDB40 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* DDC44 001DDB44 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* DDC48 001DDB48 21208100 */  addu       $4, $4, $at
/* DDC4C 001DDB4C 600C81E4 */  swc1       $f1, 0xC60($4)
.L001DDB50:
/* DDC50 001DDB50 01006324 */  addiu      $3, $3, 0x1
.L001DDB54:
/* DDC54 001DDB54 9000A68E */  lw         $6, 0x90($21)
/* DDC58 001DDB58 80200600 */  sll        $4, $6, 2
/* DDC5C 001DDB5C 21288600 */  addu       $5, $4, $6
/* DDC60 001DDB60 80200500 */  sll        $4, $5, 2
/* DDC64 001DDB64 2120A400 */  addu       $4, $5, $4
/* DDC68 001DDB68 00290400 */  sll        $5, $4, 4
/* DDC6C 001DDB6C 2120B500 */  addu       $4, $5, $21
/* DDC70 001DDB70 0200013C */  lui        $at, (0x20000 >> 16)
/* DDC74 001DDB74 21088100 */  addu       $at, $4, $at
/* DDC78 001DDB78 84E42484 */  lh         $4, -0x1B7C($at)
/* DDC7C 001DDB7C 2A206400 */  slt        $4, $3, $4
/* DDC80 001DDB80 CAFF8014 */  bnez       $4, .L001DDAAC
/* DDC84 001DDB84 00000000 */   nop
.L001DDB88:
/* DDC88 001DDB88 9000A48E */  lw         $4, 0x90($21)
/* DDC8C 001DDB8C 80180400 */  sll        $3, $4, 2
/* DDC90 001DDB90 21206400 */  addu       $4, $3, $4
/* DDC94 001DDB94 80180400 */  sll        $3, $4, 2
/* DDC98 001DDB98 21188300 */  addu       $3, $4, $3
/* DDC9C 001DDB9C 00190300 */  sll        $3, $3, 4
/* DDCA0 001DDBA0 21187500 */  addu       $3, $3, $21
/* DDCA4 001DDBA4 0200013C */  lui        $at, (0x20000 >> 16)
/* DDCA8 001DDBA8 21086100 */  addu       $at, $3, $at
/* DDCAC 001DDBAC C4E420A4 */  sh         $0, -0x1B3C($at)
.L001DDBB0:
/* DDCB0 001DDBB0 9000A48E */  lw         $4, 0x90($21)
/* DDCB4 001DDBB4 80180400 */  sll        $3, $4, 2
/* DDCB8 001DDBB8 21206400 */  addu       $4, $3, $4
/* DDCBC 001DDBBC 80180400 */  sll        $3, $4, 2
/* DDCC0 001DDBC0 21188300 */  addu       $3, $4, $3
/* DDCC4 001DDBC4 00190300 */  sll        $3, $3, 4
/* DDCC8 001DDBC8 21207500 */  addu       $4, $3, $21
/* DDCCC 001DDBCC 0200013C */  lui        $at, (0x20000 >> 16)
/* DDCD0 001DDBD0 21088100 */  addu       $at, $4, $at
/* DDCD4 001DDBD4 A4E42384 */  lh         $3, -0x1B5C($at)
/* DDCD8 001DDBD8 72076010 */  beqz       $3, .L001DF9A4
/* DDCDC 001DDBDC 00000000 */   nop
/* DDCE0 001DDBE0 4400A28E */  lw         $2, 0x44($21)
/* DDCE4 001DDBE4 05004010 */  beqz       $2, .L001DDBFC
/* DDCE8 001DDBE8 00000000 */   nop
/* DDCEC 001DDBEC B4000224 */  addiu      $2, $0, 0xB4
/* DDCF0 001DDBF0 0200013C */  lui        $at, (0x20000 >> 16)
/* DDCF4 001DDBF4 21088100 */  addu       $at, $4, $at
/* DDCF8 001DDBF8 E0E322AC */  sw         $2, -0x1C20($at)
.L001DDBFC:
/* DDCFC 001DDBFC 988B828F */  lw         $2, -0x7468($gp)
/* DDD00 001DDC00 080040AC */  sw         $0, 0x8($2)
/* DDD04 001DDC04 988B848F */  lw         $4, -0x7468($gp)
/* DDD08 001DDC08 D0070524 */  addiu      $5, $0, 0x7D0
/* DDD0C 001DDC0C 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* DDD10 001DDC10 00000000 */   nop
/* DDD14 001DDC14 9000A48E */  lw         $4, 0x90($21)
/* DDD18 001DDC18 80180400 */  sll        $3, $4, 2
/* DDD1C 001DDC1C 21206400 */  addu       $4, $3, $4
/* DDD20 001DDC20 80180400 */  sll        $3, $4, 2
/* DDD24 001DDC24 21188300 */  addu       $3, $4, $3
/* DDD28 001DDC28 00190300 */  sll        $3, $3, 4
/* DDD2C 001DDC2C 21187500 */  addu       $3, $3, $21
/* DDD30 001DDC30 0200013C */  lui        $at, (0x20000 >> 16)
/* DDD34 001DDC34 21086100 */  addu       $at, $3, $at
/* DDD38 001DDC38 1CE422AC */  sw         $2, -0x1BE4($at)
/* DDD3C 001DDC3C 9000A38E */  lw         $3, 0x90($21)
/* DDD40 001DDC40 10350224 */  addiu      $2, $0, 0x3510
/* DDD44 001DDC44 18106200 */  mult       $2, $3, $2
/* DDD48 001DDC48 2110A202 */  addu       $2, $21, $2
/* DDD4C 001DDC4C 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* DDD50 001DDC50 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* DDD54 001DDC54 21204100 */  addu       $4, $2, $at
/* DDD58 001DDC58 9000A527 */  addiu      $5, $sp, 0x90
/* DDD5C 001DDC5C A000998C */  lw         $25, 0xA0($4)
/* DDD60 001DDC60 A000398F */  lw         $25, 0xA0($25)
/* DDD64 001DDC64 09F82003 */  jalr       $25
/* DDD68 001DDC68 00000000 */   nop
/* DDD6C 001DDC6C A040023C */  lui        $2, (0x40A00000 >> 16)
/* DDD70 001DDC70 00688244 */  mtc1       $2, $f13
/* DDD74 001DDC74 9000A38E */  lw         $3, 0x90($21)
/* DDD78 001DDC78 80100300 */  sll        $2, $3, 2
/* DDD7C 001DDC7C 21184300 */  addu       $3, $2, $3
/* DDD80 001DDC80 80100300 */  sll        $2, $3, 2
/* DDD84 001DDC84 21106200 */  addu       $2, $3, $2
/* DDD88 001DDC88 00110200 */  sll        $2, $2, 4
/* DDD8C 001DDC8C 21185500 */  addu       $3, $2, $21
/* DDD90 001DDC90 F041023C */  lui        $2, (0x41F00000 >> 16)
/* DDD94 001DDC94 00608244 */  mtc1       $2, $f12
/* DDD98 001DDC98 C89C848F */  lw         $4, -0x6338($gp)
/* DDD9C 001DDC9C 0200013C */  lui        $at, (0x20000 >> 16)
/* DDDA0 001DDCA0 21086100 */  addu       $at, $3, $at
/* DDDA4 001DDCA4 1CE4258C */  lw         $5, -0x1BE4($at)
/* DDDA8 001DDCA8 9000A627 */  addiu      $6, $sp, 0x90
/* DDDAC 001DDCAC F003070C */  jal        setCollisionData__FP11CDungeonMapP6CCPolyPfff
/* DDDB0 001DDCB0 00000000 */   nop
/* DDDB4 001DDCB4 9000A48E */  lw         $4, 0x90($21)
/* DDDB8 001DDCB8 80180400 */  sll        $3, $4, 2
/* DDDBC 001DDCBC 21206400 */  addu       $4, $3, $4
/* DDDC0 001DDCC0 80180400 */  sll        $3, $4, 2
/* DDDC4 001DDCC4 21188300 */  addu       $3, $4, $3
/* DDDC8 001DDCC8 00190300 */  sll        $3, $3, 4
/* DDDCC 001DDCCC 21187500 */  addu       $3, $3, $21
/* DDDD0 001DDCD0 0200013C */  lui        $at, (0x20000 >> 16)
/* DDDD4 001DDCD4 21086100 */  addu       $at, $3, $at
/* DDDD8 001DDCD8 20E422AC */  sw         $2, -0x1BE0($at)
/* DDDDC 001DDCDC 9000A38E */  lw         $3, 0x90($21)
/* DDDE0 001DDCE0 80100300 */  sll        $2, $3, 2
/* DDDE4 001DDCE4 21184300 */  addu       $3, $2, $3
/* DDDE8 001DDCE8 80100300 */  sll        $2, $3, 2
/* DDDEC 001DDCEC 21106200 */  addu       $2, $3, $2
/* DDDF0 001DDCF0 00110200 */  sll        $2, $2, 4
/* DDDF4 001DDCF4 21105500 */  addu       $2, $2, $21
/* DDDF8 001DDCF8 0200013C */  lui        $at, (0x20000 >> 16)
/* DDDFC 001DDCFC 21084100 */  addu       $at, $2, $at
/* DDE00 001DDD00 20E4368C */  lw         $22, -0x1BE0($at)
/* DDE04 001DDD04 F041023C */  lui        $2, (0x41F00000 >> 16)
/* DDE08 001DDD08 00108244 */  mtc1       $2, $f2
/* DDE0C 001DDD0C 9000A3C7 */  lwc1       $f3, 0x90($sp)
/* DDE10 001DDD10 00100346 */  add.s      $f0, $f2, $f3
/* DDE14 001DDD14 C000A0E7 */  swc1       $f0, 0xC0($sp)
/* DDE18 001DDD18 9400B327 */  addiu      $19, $sp, 0x94
/* DDE1C 001DDD1C 000064C6 */  lwc1       $f4, 0x0($19)
/* DDE20 001DDD20 A042023C */  lui        $2, (0x42A00000 >> 16)
/* DDE24 001DDD24 00088244 */  mtc1       $2, $f1
/* DDE28 001DDD28 00000000 */  nop
/* DDE2C 001DDD2C 00080446 */  add.s      $f0, $f1, $f4
/* DDE30 001DDD30 C400A0E7 */  swc1       $f0, 0xC4($sp)
/* DDE34 001DDD34 9800B427 */  addiu      $20, $sp, 0x98
/* DDE38 001DDD38 000085C6 */  lwc1       $f5, 0x0($20)
/* DDE3C 001DDD3C 00100546 */  add.s      $f0, $f2, $f5
/* DDE40 001DDD40 C800A0E7 */  swc1       $f0, 0xC8($sp)
/* DDE44 001DDD44 01180246 */  sub.s      $f0, $f3, $f2
/* DDE48 001DDD48 D000A0E7 */  swc1       $f0, 0xD0($sp)
/* DDE4C 001DDD4C 01200146 */  sub.s      $f0, $f4, $f1
/* DDE50 001DDD50 D400A0E7 */  swc1       $f0, 0xD4($sp)
/* DDE54 001DDD54 01280246 */  sub.s      $f0, $f5, $f2
/* DDE58 001DDD58 D800A0E7 */  swc1       $f0, 0xD8($sp)
/* DDE5C 001DDD5C 288E0070 */  paddub     $17, $0, $0
/* DDE60 001DDD60 52000010 */  b          .L001DDEAC
/* DDE64 001DDD64 00000000 */   nop
.L001DDD68:
/* DDE68 001DDD68 9000A28E */  lw         $2, 0x90($21)
/* DDE6C 001DDD6C 4E002212 */  beq        $17, $2, .L001DDEA8
/* DDE70 001DDD70 00000000 */   nop
/* DDE74 001DDD74 80101100 */  sll        $2, $17, 2
/* DDE78 001DDD78 21185100 */  addu       $3, $2, $17
/* DDE7C 001DDD7C 80100300 */  sll        $2, $3, 2
/* DDE80 001DDD80 21106200 */  addu       $2, $3, $2
/* DDE84 001DDD84 00910200 */  sll        $18, $2, 4
/* DDE88 001DDD88 21105502 */  addu       $2, $18, $21
/* DDE8C 001DDD8C 0200013C */  lui        $at, (0x20000 >> 16)
/* DDE90 001DDD90 21084100 */  addu       $at, $2, $at
/* DDE94 001DDD94 D0E3238C */  lw         $3, -0x1C30($at)
/* DDE98 001DDD98 02000224 */  addiu      $2, $0, 0x2
/* DDE9C 001DDD9C 42006214 */  bne        $3, $2, .L001DDEA8
/* DDEA0 001DDDA0 00000000 */   nop
/* DDEA4 001DDDA4 10350224 */  addiu      $2, $0, 0x3510
/* DDEA8 001DDDA8 18102202 */  mult       $2, $17, $2
/* DDEAC 001DDDAC 2110A202 */  addu       $2, $21, $2
/* DDEB0 001DDDB0 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* DDEB4 001DDDB4 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* DDEB8 001DDDB8 21204100 */  addu       $4, $2, $at
/* DDEBC 001DDDBC E000A527 */  addiu      $5, $sp, 0xE0
/* DDEC0 001DDDC0 A000998C */  lw         $25, 0xA0($4)
/* DDEC4 001DDDC4 A000398F */  lw         $25, 0xA0($25)
/* DDEC8 001DDDC8 09F82003 */  jalr       $25
/* DDECC 001DDDCC 00000000 */   nop
/* DDED0 001DDDD0 4000A48E */  lw         $4, 0x40($21)
/* DDED4 001DDDD4 E000A527 */  addiu      $5, $sp, 0xE0
/* DDED8 001DDDD8 B89F040C */  jal        SetPosition__6CFrameFPf
/* DDEDC 001DDDDC 00000000 */   nop
/* DDEE0 001DDDE0 21105502 */  addu       $2, $18, $21
/* DDEE4 001DDDE4 808081C7 */  lwc1       $f1, -0x7F80($gp)
/* DDEE8 001DDDE8 0200013C */  lui        $at, (0x20000 >> 16)
/* DDEEC 001DDDEC 21084100 */  addu       $at, $2, $at
/* DDEF0 001DDDF0 18E420C4 */  lwc1       $f0, -0x1BE8($at)
/* DDEF4 001DDDF4 42080046 */  mul.s      $f1, $f1, $f0
/* DDEF8 001DDDF8 0040023C */  lui        $2, (0x40000000 >> 16)
/* DDEFC 001DDDFC 00008244 */  mtc1       $2, $f0
/* DDF00 001DDE00 00000000 */  nop
/* DDF04 001DDE04 02030146 */  mul.s      $f12, $f0, $f1
/* DDF08 001DDE08 4000A48E */  lw         $4, 0x40($21)
/* DDF0C 001DDE0C 46630046 */  mov.s      $f13, $f12
/* DDF10 001DDE10 86630046 */  mov.s      $f14, $f12
/* DDF14 001DDE14 D49F040C */  jal        SetScale__6CFrameFfff
/* DDF18 001DDE18 00000000 */   nop
/* DDF1C 001DDE1C 9000A38E */  lw         $3, 0x90($21)
/* DDF20 001DDE20 80100300 */  sll        $2, $3, 2
/* DDF24 001DDE24 21184300 */  addu       $3, $2, $3
/* DDF28 001DDE28 80100300 */  sll        $2, $3, 2
/* DDF2C 001DDE2C 21106200 */  addu       $2, $3, $2
/* DDF30 001DDE30 00110200 */  sll        $2, $2, 4
/* DDF34 001DDE34 21205500 */  addu       $4, $2, $21
/* DDF38 001DDE38 0200013C */  lui        $at, (0x20000 >> 16)
/* DDF3C 001DDE3C 21088100 */  addu       $at, $4, $at
/* DDF40 001DDE40 20E4238C */  lw         $3, -0x1BE0($at)
/* DDF44 001DDE44 80100300 */  sll        $2, $3, 2
/* DDF48 001DDE48 21104300 */  addu       $2, $2, $3
/* DDF4C 001DDE4C 00190200 */  sll        $3, $2, 4
/* DDF50 001DDE50 0200013C */  lui        $at, (0x20000 >> 16)
/* DDF54 001DDE54 21088100 */  addu       $at, $4, $at
/* DDF58 001DDE58 1CE4228C */  lw         $2, -0x1BE4($at)
/* DDF5C 001DDE5C 21284300 */  addu       $5, $2, $3
/* DDF60 001DDE60 4000A48E */  lw         $4, 0x40($21)
/* DDF64 001DDE64 C000A627 */  addiu      $6, $sp, 0xC0
/* DDF68 001DDE68 E4A8040C */  jal        PickUpNearPoly__6CFrameFP6CCPolyRC7CBoxVu0
/* DDF6C 001DDE6C 00000000 */   nop
/* DDF70 001DDE70 9000A48E */  lw         $4, 0x90($21)
/* DDF74 001DDE74 80180400 */  sll        $3, $4, 2
/* DDF78 001DDE78 21206400 */  addu       $4, $3, $4
/* DDF7C 001DDE7C 80180400 */  sll        $3, $4, 2
/* DDF80 001DDE80 21188300 */  addu       $3, $4, $3
/* DDF84 001DDE84 00190300 */  sll        $3, $3, 4
/* DDF88 001DDE88 21207500 */  addu       $4, $3, $21
/* DDF8C 001DDE8C 0200013C */  lui        $at, (0x20000 >> 16)
/* DDF90 001DDE90 21088100 */  addu       $at, $4, $at
/* DDF94 001DDE94 20E4238C */  lw         $3, -0x1BE0($at)
/* DDF98 001DDE98 21106200 */  addu       $2, $3, $2
/* DDF9C 001DDE9C 0200013C */  lui        $at, (0x20000 >> 16)
/* DDFA0 001DDEA0 21088100 */  addu       $at, $4, $at
/* DDFA4 001DDEA4 20E422AC */  sw         $2, -0x1BE0($at)
.L001DDEA8:
/* DDFA8 001DDEA8 01003126 */  addiu      $17, $17, 0x1
.L001DDEAC:
/* DDFAC 001DDEAC 1000222A */  slti       $2, $17, 0x10
/* DDFB0 001DDEB0 ADFF4014 */  bnez       $2, .L001DDD68
/* DDFB4 001DDEB4 00000000 */   nop
/* DDFB8 001DDEB8 9000A38E */  lw         $3, 0x90($21)
/* DDFBC 001DDEBC 80100300 */  sll        $2, $3, 2
/* DDFC0 001DDEC0 21184300 */  addu       $3, $2, $3
/* DDFC4 001DDEC4 80100300 */  sll        $2, $3, 2
/* DDFC8 001DDEC8 21106200 */  addu       $2, $3, $2
/* DDFCC 001DDECC 00110200 */  sll        $2, $2, 4
/* DDFD0 001DDED0 21105500 */  addu       $2, $2, $21
/* DDFD4 001DDED4 0200013C */  lui        $at, (0x20000 >> 16)
/* DDFD8 001DDED8 21084100 */  addu       $at, $2, $at
/* DDFDC 001DDEDC 20E4258C */  lw         $5, -0x1BE0($at)
/* DDFE0 001DDEE0 9001A228 */  slti       $2, $5, 0x190
/* DDFE4 001DDEE4 05004014 */  bnez       $2, .L001DDEFC
/* DDFE8 001DDEE8 00000000 */   nop
/* DDFEC 001DDEEC 2A00023C */  lui        $2, %hi(_2233_2)
/* DDFF0 001DDEF0 88CF4424 */  addiu      $4, $2, %lo(_2233_2)
/* DDFF4 001DDEF4 A611040C */  jal        printf
/* DDFF8 001DDEF8 00000000 */   nop
.L001DDEFC:
/* DDFFC 001DDEFC 2826A072 */  paddub     $4, $21, $0
/* DE000 001DDF00 C467070C */  jal        CheckDmg__12CMonstorUnitFv
/* DE004 001DDF04 00000000 */   nop
/* DE008 001DDF08 02000324 */  addiu      $3, $0, 0x2
/* DE00C 001DDF0C 1A004310 */  beq        $2, $3, .L001DDF78
/* DE010 001DDF10 00000000 */   nop
/* DE014 001DDF14 01000324 */  addiu      $3, $0, 0x1
/* DE018 001DDF18 05004310 */  beq        $2, $3, .L001DDF30
/* DE01C 001DDF1C 00000000 */   nop
/* DE020 001DDF20 25004010 */  beqz       $2, .L001DDFB8
/* DE024 001DDF24 00000000 */   nop
/* DE028 001DDF28 23000010 */  b          .L001DDFB8
/* DE02C 001DDF2C 00000000 */   nop
.L001DDF30:
/* DE030 001DDF30 9000A38E */  lw         $3, 0x90($21)
/* DE034 001DDF34 C0100300 */  sll        $2, $3, 3
/* DE038 001DDF38 21104300 */  addu       $2, $2, $3
/* DE03C 001DDF3C C0100200 */  sll        $2, $2, 3
/* DE040 001DDF40 2110A202 */  addu       $2, $21, $2
/* DE044 001DDF44 0500013C */  lui        $at, (0x54DD0 >> 16)
/* DE048 001DDF48 D04D2134 */  ori        $at, $at, (0x54DD0 & 0xFFFF)
/* DE04C 001DDF4C 21204100 */  addu       $4, $2, $at
/* DE050 001DDF50 6E000524 */  addiu      $5, $0, 0x6E
/* DE054 001DDF54 9CF7080C */  jal        run__10CRunScriptFi
/* DE058 001DDF58 00000000 */   nop
/* DE05C 001DDF5C 01000324 */  addiu      $3, $0, 0x1
/* DE060 001DDF60 9000A28E */  lw         $2, 0x90($21)
/* DE064 001DDF64 80100200 */  sll        $2, $2, 2
/* DE068 001DDF68 21105500 */  addu       $2, $2, $21
/* DE06C 001DDF6C 500043AC */  sw         $3, 0x50($2)
/* DE070 001DDF70 11000010 */  b          .L001DDFB8
/* DE074 001DDF74 00000000 */   nop
.L001DDF78:
/* DE078 001DDF78 9000A38E */  lw         $3, 0x90($21)
/* DE07C 001DDF7C C0100300 */  sll        $2, $3, 3
/* DE080 001DDF80 21104300 */  addu       $2, $2, $3
/* DE084 001DDF84 C0100200 */  sll        $2, $2, 3
/* DE088 001DDF88 2110A202 */  addu       $2, $21, $2
/* DE08C 001DDF8C 0500013C */  lui        $at, (0x54DD0 >> 16)
/* DE090 001DDF90 D04D2134 */  ori        $at, $at, (0x54DD0 & 0xFFFF)
/* DE094 001DDF94 21204100 */  addu       $4, $2, $at
/* DE098 001DDF98 78000524 */  addiu      $5, $0, 0x78
/* DE09C 001DDF9C 9CF7080C */  jal        run__10CRunScriptFi
/* DE0A0 001DDFA0 00000000 */   nop
/* DE0A4 001DDFA4 01000324 */  addiu      $3, $0, 0x1
/* DE0A8 001DDFA8 9000A28E */  lw         $2, 0x90($21)
/* DE0AC 001DDFAC 80100200 */  sll        $2, $2, 2
/* DE0B0 001DDFB0 21105500 */  addu       $2, $2, $21
/* DE0B4 001DDFB4 500043AC */  sw         $3, 0x50($2)
.L001DDFB8:
/* DE0B8 001DDFB8 9000A58E */  lw         $5, 0x90($21)
/* DE0BC 001DDFBC 80200500 */  sll        $4, $5, 2
/* DE0C0 001DDFC0 21188500 */  addu       $3, $4, $5
/* DE0C4 001DDFC4 80100300 */  sll        $2, $3, 2
/* DE0C8 001DDFC8 21106200 */  addu       $2, $3, $2
/* DE0CC 001DDFCC 00110200 */  sll        $2, $2, 4
/* DE0D0 001DDFD0 21185500 */  addu       $3, $2, $21
/* DE0D4 001DDFD4 0200013C */  lui        $at, (0x20000 >> 16)
/* DE0D8 001DDFD8 21086100 */  addu       $at, $3, $at
/* DE0DC 001DDFDC D8E3228C */  lw         $2, -0x1C28($at)
/* DE0E0 001DDFE0 15004018 */  blez       $2, .L001DE038
/* DE0E4 001DDFE4 00000000 */   nop
/* DE0E8 001DDFE8 2826A072 */  paddub     $4, $21, $0
/* DE0EC 001DDFEC 5C61070C */  jal        PalletStep__12CMonstorUnitFv
/* DE0F0 001DDFF0 00000000 */   nop
/* DE0F4 001DDFF4 9000A48E */  lw         $4, 0x90($21)
/* DE0F8 001DDFF8 80180400 */  sll        $3, $4, 2
/* DE0FC 001DDFFC 21206400 */  addu       $4, $3, $4
/* DE100 001DE000 80180400 */  sll        $3, $4, 2
/* DE104 001DE004 21188300 */  addu       $3, $4, $3
/* DE108 001DE008 00190300 */  sll        $3, $3, 4
/* DE10C 001DE00C 21187500 */  addu       $3, $3, $21
/* DE110 001DE010 0100013C */  lui        $at, (0x1E468 >> 16)
/* DE114 001DE014 68E42134 */  ori        $at, $at, (0x1E468 & 0xFFFF)
/* DE118 001DE018 21206100 */  addu       $4, $3, $at
/* DE11C 001DE01C 0000838C */  lw         $3, 0x0($4)
/* DE120 001DE020 60066018 */  blez       $3, .L001DF9A4
/* DE124 001DE024 00000000 */   nop
/* DE128 001DE028 FFFF6324 */  addiu      $3, $3, -0x1
/* DE12C 001DE02C 000083AC */  sw         $3, 0x0($4)
/* DE130 001DE030 5C060010 */  b          .L001DF9A4
/* DE134 001DE034 00000000 */   nop
.L001DE038:
/* DE138 001DE038 21109500 */  addu       $2, $4, $21
/* DE13C 001DE03C 5000428C */  lw         $2, 0x50($2)
/* DE140 001DE040 2F004014 */  bnez       $2, .L001DE100
/* DE144 001DE044 00000000 */   nop
/* DE148 001DE048 0200013C */  lui        $at, (0x20000 >> 16)
/* DE14C 001DE04C 21086100 */  addu       $at, $3, $at
/* DE150 001DE050 A4E42384 */  lh         $3, -0x1B5C($at)
/* DE154 001DE054 01000224 */  addiu      $2, $0, 0x1
/* DE158 001DE058 18006214 */  bne        $3, $2, .L001DE0BC
/* DE15C 001DE05C 00000000 */   nop
/* DE160 001DE060 C0100500 */  sll        $2, $5, 3
/* DE164 001DE064 21104500 */  addu       $2, $2, $5
/* DE168 001DE068 C0100200 */  sll        $2, $2, 3
/* DE16C 001DE06C 2110A202 */  addu       $2, $21, $2
/* DE170 001DE070 0500013C */  lui        $at, (0x54DD0 >> 16)
/* DE174 001DE074 D04D2134 */  ori        $at, $at, (0x54DD0 & 0xFFFF)
/* DE178 001DE078 21204100 */  addu       $4, $2, $at
/* DE17C 001DE07C 32000524 */  addiu      $5, $0, 0x32
/* DE180 001DE080 9CF7080C */  jal        run__10CRunScriptFi
/* DE184 001DE084 00000000 */   nop
/* DE188 001DE088 FFFF0424 */  addiu      $4, $0, -0x1
/* DE18C 001DE08C 9000A38E */  lw         $3, 0x90($21)
/* DE190 001DE090 80100300 */  sll        $2, $3, 2
/* DE194 001DE094 21184300 */  addu       $3, $2, $3
/* DE198 001DE098 80100300 */  sll        $2, $3, 2
/* DE19C 001DE09C 21106200 */  addu       $2, $3, $2
/* DE1A0 001DE0A0 00110200 */  sll        $2, $2, 4
/* DE1A4 001DE0A4 21105500 */  addu       $2, $2, $21
/* DE1A8 001DE0A8 0200013C */  lui        $at, (0x20000 >> 16)
/* DE1AC 001DE0AC 21084100 */  addu       $at, $2, $at
/* DE1B0 001DE0B0 A4E424A4 */  sh         $4, -0x1B5C($at)
/* DE1B4 001DE0B4 0B000010 */  b          .L001DE0E4
/* DE1B8 001DE0B8 00000000 */   nop
.L001DE0BC:
/* DE1BC 001DE0BC C0100500 */  sll        $2, $5, 3
/* DE1C0 001DE0C0 21104500 */  addu       $2, $2, $5
/* DE1C4 001DE0C4 C0100200 */  sll        $2, $2, 3
/* DE1C8 001DE0C8 2110A202 */  addu       $2, $21, $2
/* DE1CC 001DE0CC 0500013C */  lui        $at, (0x54DD0 >> 16)
/* DE1D0 001DE0D0 D04D2134 */  ori        $at, $at, (0x54DD0 & 0xFFFF)
/* DE1D4 001DE0D4 21204100 */  addu       $4, $2, $at
/* DE1D8 001DE0D8 64000524 */  addiu      $5, $0, 0x64
/* DE1DC 001DE0DC 9CF7080C */  jal        run__10CRunScriptFi
/* DE1E0 001DE0E0 00000000 */   nop
.L001DE0E4:
/* DE1E4 001DE0E4 01000324 */  addiu      $3, $0, 0x1
/* DE1E8 001DE0E8 9000A28E */  lw         $2, 0x90($21)
/* DE1EC 001DE0EC 80100200 */  sll        $2, $2, 2
/* DE1F0 001DE0F0 21105500 */  addu       $2, $2, $21
/* DE1F4 001DE0F4 500043AC */  sw         $3, 0x50($2)
/* DE1F8 001DE0F8 18000010 */  b          .L001DE15C
/* DE1FC 001DE0FC 00000000 */   nop
.L001DE100:
/* DE200 001DE100 C0100500 */  sll        $2, $5, 3
/* DE204 001DE104 21104500 */  addu       $2, $2, $5
/* DE208 001DE108 C0100200 */  sll        $2, $2, 3
/* DE20C 001DE10C 2110A202 */  addu       $2, $21, $2
/* DE210 001DE110 0500013C */  lui        $at, (0x54DD0 >> 16)
/* DE214 001DE114 D04D2134 */  ori        $at, $at, (0x54DD0 & 0xFFFF)
/* DE218 001DE118 21204100 */  addu       $4, $2, $at
/* DE21C 001DE11C 90F7080C */  jal        resume__10CRunScriptFv
/* DE220 001DE120 00000000 */   nop
/* DE224 001DE124 9000A38E */  lw         $3, 0x90($21)
/* DE228 001DE128 C0100300 */  sll        $2, $3, 3
/* DE22C 001DE12C 21104300 */  addu       $2, $2, $3
/* DE230 001DE130 C0100200 */  sll        $2, $2, 3
/* DE234 001DE134 2110A202 */  addu       $2, $21, $2
/* DE238 001DE138 0500013C */  lui        $at, (0x54DD0 >> 16)
/* DE23C 001DE13C D04D2134 */  ori        $at, $at, (0x54DD0 & 0xFFFF)
/* DE240 001DE140 21104100 */  addu       $2, $2, $at
/* DE244 001DE144 3400428C */  lw         $2, 0x34($2)
/* DE248 001DE148 04004010 */  beqz       $2, .L001DE15C
/* DE24C 001DE14C 00000000 */   nop
/* DE250 001DE150 80100300 */  sll        $2, $3, 2
/* DE254 001DE154 21105500 */  addu       $2, $2, $21
/* DE258 001DE158 500040AC */  sw         $0, 0x50($2)
.L001DE15C:
/* DE25C 001DE15C 9000A38E */  lw         $3, 0x90($21)
/* DE260 001DE160 10350224 */  addiu      $2, $0, 0x3510
/* DE264 001DE164 18106200 */  mult       $2, $3, $2
/* DE268 001DE168 2110A202 */  addu       $2, $21, $2
/* DE26C 001DE16C 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* DE270 001DE170 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* DE274 001DE174 21204100 */  addu       $4, $2, $at
/* DE278 001DE178 9000A527 */  addiu      $5, $sp, 0x90
/* DE27C 001DE17C A000998C */  lw         $25, 0xA0($4)
/* DE280 001DE180 A000398F */  lw         $25, 0xA0($25)
/* DE284 001DE184 09F82003 */  jalr       $25
/* DE288 001DE188 00000000 */   nop
/* DE28C 001DE18C 9000A38E */  lw         $3, 0x90($21)
/* DE290 001DE190 80100300 */  sll        $2, $3, 2
/* DE294 001DE194 21184300 */  addu       $3, $2, $3
/* DE298 001DE198 80100300 */  sll        $2, $3, 2
/* DE29C 001DE19C 21106200 */  addu       $2, $3, $2
/* DE2A0 001DE1A0 00110200 */  sll        $2, $2, 4
/* DE2A4 001DE1A4 21105500 */  addu       $2, $2, $21
/* DE2A8 001DE1A8 0200013C */  lui        $at, (0x20000 >> 16)
/* DE2AC 001DE1AC 21084100 */  addu       $at, $2, $at
/* DE2B0 001DE1B0 50E521C4 */  lwc1       $f1, -0x1AB0($at)
/* DE2B4 001DE1B4 00008044 */  mtc1       $0, $f0
/* DE2B8 001DE1B8 00000000 */  nop
/* DE2BC 001DE1BC 36080046 */  c.le.s     $f1, $f0
/* DE2C0 001DE1C0 00000000 */  nop
/* DE2C4 001DE1C4 43000145 */  bc1t       .L001DE2D4
/* DE2C8 001DE1C8 00000000 */   nop
/* DE2CC 001DE1CC 0100013C */  lui        $at, (0x1E430 >> 16)
/* DE2D0 001DE1D0 30E42134 */  ori        $at, $at, (0x1E430 & 0xFFFF)
/* DE2D4 001DE1D4 21204100 */  addu       $4, $2, $at
/* DE2D8 001DE1D8 0100013C */  lui        $at, (0x1E540 >> 16)
/* DE2DC 001DE1DC 40E52134 */  ori        $at, $at, (0x1E540 & 0xFFFF)
/* DE2E0 001DE1E0 21284100 */  addu       $5, $2, $at
/* DE2E4 001DE1E4 0C86040C */  jal        sceVu0CopyVector
/* DE2E8 001DE1E8 00000000 */   nop
/* DE2EC 001DE1EC 9000A38E */  lw         $3, 0x90($21)
/* DE2F0 001DE1F0 80100300 */  sll        $2, $3, 2
/* DE2F4 001DE1F4 21184300 */  addu       $3, $2, $3
/* DE2F8 001DE1F8 80100300 */  sll        $2, $3, 2
/* DE2FC 001DE1FC 21106200 */  addu       $2, $3, $2
/* DE300 001DE200 00110200 */  sll        $2, $2, 4
/* DE304 001DE204 21105500 */  addu       $2, $2, $21
/* DE308 001DE208 0200013C */  lui        $at, (0x20000 >> 16)
/* DE30C 001DE20C 21084100 */  addu       $at, $2, $at
/* DE310 001DE210 50E520C4 */  lwc1       $f0, -0x1AB0($at)
/* DE314 001DE214 0200013C */  lui        $at, (0x20000 >> 16)
/* DE318 001DE218 21084100 */  addu       $at, $2, $at
/* DE31C 001DE21C 50E420E4 */  swc1       $f0, -0x1BB0($at)
/* DE320 001DE220 9000A38E */  lw         $3, 0x90($21)
/* DE324 001DE224 80100300 */  sll        $2, $3, 2
/* DE328 001DE228 21184300 */  addu       $3, $2, $3
/* DE32C 001DE22C 80100300 */  sll        $2, $3, 2
/* DE330 001DE230 21106200 */  addu       $2, $3, $2
/* DE334 001DE234 00110200 */  sll        $2, $2, 4
/* DE338 001DE238 21105500 */  addu       $2, $2, $21
/* DE33C 001DE23C 0200013C */  lui        $at, (0x20000 >> 16)
/* DE340 001DE240 21084100 */  addu       $at, $2, $at
/* DE344 001DE244 54E521C4 */  lwc1       $f1, -0x1AAC($at)
/* DE348 001DE248 0200013C */  lui        $at, (0x20000 >> 16)
/* DE34C 001DE24C 21084100 */  addu       $at, $2, $at
/* DE350 001DE250 50E520C4 */  lwc1       $f0, -0x1AB0($at)
/* DE354 001DE254 01000146 */  sub.s      $f0, $f0, $f1
/* DE358 001DE258 0200013C */  lui        $at, (0x20000 >> 16)
/* DE35C 001DE25C 21084100 */  addu       $at, $2, $at
/* DE360 001DE260 50E520E4 */  swc1       $f0, -0x1AB0($at)
/* DE364 001DE264 9000A38E */  lw         $3, 0x90($21)
/* DE368 001DE268 80100300 */  sll        $2, $3, 2
/* DE36C 001DE26C 21184300 */  addu       $3, $2, $3
/* DE370 001DE270 80100300 */  sll        $2, $3, 2
/* DE374 001DE274 21106200 */  addu       $2, $3, $2
/* DE378 001DE278 00110200 */  sll        $2, $2, 4
/* DE37C 001DE27C 21105500 */  addu       $2, $2, $21
/* DE380 001DE280 0100013C */  lui        $at, (0x1E550 >> 16)
/* DE384 001DE284 50E52134 */  ori        $at, $at, (0x1E550 & 0xFFFF)
/* DE388 001DE288 21104100 */  addu       $2, $2, $at
/* DE38C 001DE28C 000041C4 */  lwc1       $f1, 0x0($2)
/* DE390 001DE290 00008044 */  mtc1       $0, $f0
/* DE394 001DE294 00000000 */  nop
/* DE398 001DE298 36080046 */  c.le.s     $f1, $f0
/* DE39C 001DE29C 00000000 */  nop
/* DE3A0 001DE2A0 0C000045 */  bc1f       .L001DE2D4
/* DE3A4 001DE2A4 00000000 */   nop
/* DE3A8 001DE2A8 000040AC */  sw         $0, 0x0($2)
/* DE3AC 001DE2AC 9000A38E */  lw         $3, 0x90($21)
/* DE3B0 001DE2B0 80100300 */  sll        $2, $3, 2
/* DE3B4 001DE2B4 21184300 */  addu       $3, $2, $3
/* DE3B8 001DE2B8 80100300 */  sll        $2, $3, 2
/* DE3BC 001DE2BC 21106200 */  addu       $2, $3, $2
/* DE3C0 001DE2C0 00110200 */  sll        $2, $2, 4
/* DE3C4 001DE2C4 21105500 */  addu       $2, $2, $21
/* DE3C8 001DE2C8 0200013C */  lui        $at, (0x20000 >> 16)
/* DE3CC 001DE2CC 21084100 */  addu       $at, $2, $at
/* DE3D0 001DE2D0 50E420AC */  sw         $0, -0x1BB0($at)
.L001DE2D4:
/* DE3D4 001DE2D4 9000A38E */  lw         $3, 0x90($21)
/* DE3D8 001DE2D8 80100300 */  sll        $2, $3, 2
/* DE3DC 001DE2DC 21184300 */  addu       $3, $2, $3
/* DE3E0 001DE2E0 80100300 */  sll        $2, $3, 2
/* DE3E4 001DE2E4 21106200 */  addu       $2, $3, $2
/* DE3E8 001DE2E8 00110200 */  sll        $2, $2, 4
/* DE3EC 001DE2EC 21105500 */  addu       $2, $2, $21
/* DE3F0 001DE2F0 0200013C */  lui        $at, (0x20000 >> 16)
/* DE3F4 001DE2F4 21084100 */  addu       $at, $2, $at
/* DE3F8 001DE2F8 78E4228C */  lw         $2, -0x1B88($at)
/* DE3FC 001DE2FC 0400401C */  bgtz       $2, .L001DE310
/* DE400 001DE300 00000000 */   nop
/* DE404 001DE304 2826A072 */  paddub     $4, $21, $0
/* DE408 001DE308 7473070C */  jal        MoveCheck2__12CMonstorUnitFv
/* DE40C 001DE30C 00000000 */   nop
.L001DE310:
/* DE410 001DE310 9000A38E */  lw         $3, 0x90($21)
/* DE414 001DE314 80100300 */  sll        $2, $3, 2
/* DE418 001DE318 21184300 */  addu       $3, $2, $3
/* DE41C 001DE31C 80100300 */  sll        $2, $3, 2
/* DE420 001DE320 21106200 */  addu       $2, $3, $2
/* DE424 001DE324 00110200 */  sll        $2, $2, 4
/* DE428 001DE328 21105500 */  addu       $2, $2, $21
/* DE42C 001DE32C 0200013C */  lui        $at, (0x20000 >> 16)
/* DE430 001DE330 21084100 */  addu       $at, $2, $at
/* DE434 001DE334 78E4228C */  lw         $2, -0x1B88($at)
/* DE438 001DE338 0400401C */  bgtz       $2, .L001DE34C
/* DE43C 001DE33C 00000000 */   nop
/* DE440 001DE340 2826A072 */  paddub     $4, $21, $0
/* DE444 001DE344 5074070C */  jal        MoveChecMonster__12CMonstorUnitFv
/* DE448 001DE348 00000000 */   nop
.L001DE34C:
/* DE44C 001DE34C 9000A38E */  lw         $3, 0x90($21)
/* DE450 001DE350 80100300 */  sll        $2, $3, 2
/* DE454 001DE354 21184300 */  addu       $3, $2, $3
/* DE458 001DE358 80100300 */  sll        $2, $3, 2
/* DE45C 001DE35C 21106200 */  addu       $2, $3, $2
/* DE460 001DE360 00110200 */  sll        $2, $2, 4
/* DE464 001DE364 21105500 */  addu       $2, $2, $21
/* DE468 001DE368 0200013C */  lui        $at, (0x20000 >> 16)
/* DE46C 001DE36C 21084100 */  addu       $at, $2, $at
/* DE470 001DE370 20E436AC */  sw         $22, -0x1BE0($at)
/* DE474 001DE374 9000A38E */  lw         $3, 0x90($21)
/* DE478 001DE378 80100300 */  sll        $2, $3, 2
/* DE47C 001DE37C 21184300 */  addu       $3, $2, $3
/* DE480 001DE380 80100300 */  sll        $2, $3, 2
/* DE484 001DE384 21106200 */  addu       $2, $3, $2
/* DE488 001DE388 00190200 */  sll        $3, $2, 4
/* DE48C 001DE38C 21107500 */  addu       $2, $3, $21
/* DE490 001DE390 0200013C */  lui        $at, (0x20000 >> 16)
/* DE494 001DE394 21084100 */  addu       $at, $2, $at
/* DE498 001DE398 50E421C4 */  lwc1       $f1, -0x1BB0($at)
/* DE49C 001DE39C 00008044 */  mtc1       $0, $f0
/* DE4A0 001DE3A0 00000000 */  nop
/* DE4A4 001DE3A4 32000146 */  c.eq.s     $f0, $f1
/* DE4A8 001DE3A8 00000000 */  nop
/* DE4AC 001DE3AC 0A000045 */  bc1f       .L001DE3D8
/* DE4B0 001DE3B0 00000000 */   nop
/* DE4B4 001DE3B4 0200013C */  lui        $at, (0x20000 >> 16)
/* DE4B8 001DE3B8 21084100 */  addu       $at, $2, $at
/* DE4BC 001DE3BC 58E4228C */  lw         $2, -0x1BA8($at)
/* DE4C0 001DE3C0 6F014010 */  beqz       $2, .L001DE980
/* DE4C4 001DE3C4 00000000 */   nop
/* DE4C8 001DE3C8 32000146 */  c.eq.s     $f0, $f1
/* DE4CC 001DE3CC 00000000 */  nop
/* DE4D0 001DE3D0 6B010045 */  bc1f       .L001DE980
/* DE4D4 001DE3D4 00000000 */   nop
.L001DE3D8:
/* DE4D8 001DE3D8 21187500 */  addu       $3, $3, $21
/* DE4DC 001DE3DC 2041023C */  lui        $2, (0x41200000 >> 16)
/* DE4E0 001DE3E0 00108244 */  mtc1       $2, $f2
/* DE4E4 001DE3E4 0200013C */  lui        $at, (0x20000 >> 16)
/* DE4E8 001DE3E8 21086100 */  addu       $at, $3, $at
/* DE4EC 001DE3EC 30E420C4 */  lwc1       $f0, -0x1BD0($at)
/* DE4F0 001DE3F0 42100046 */  mul.s      $f1, $f2, $f0
/* DE4F4 001DE3F4 9000A0C7 */  lwc1       $f0, 0x90($sp)
/* DE4F8 001DE3F8 00000146 */  add.s      $f0, $f0, $f1
/* DE4FC 001DE3FC A000A0E7 */  swc1       $f0, 0xA0($sp)
/* DE500 001DE400 9000A38E */  lw         $3, 0x90($21)
/* DE504 001DE404 80100300 */  sll        $2, $3, 2
/* DE508 001DE408 21184300 */  addu       $3, $2, $3
/* DE50C 001DE40C 80100300 */  sll        $2, $3, 2
/* DE510 001DE410 21106200 */  addu       $2, $3, $2
/* DE514 001DE414 00110200 */  sll        $2, $2, 4
/* DE518 001DE418 21105500 */  addu       $2, $2, $21
/* DE51C 001DE41C 0200013C */  lui        $at, (0x20000 >> 16)
/* DE520 001DE420 21084100 */  addu       $at, $2, $at
/* DE524 001DE424 34E420C4 */  lwc1       $f0, -0x1BCC($at)
/* DE528 001DE428 42100046 */  mul.s      $f1, $f2, $f0
/* DE52C 001DE42C 000060C6 */  lwc1       $f0, 0x0($19)
/* DE530 001DE430 00000146 */  add.s      $f0, $f0, $f1
/* DE534 001DE434 A400B127 */  addiu      $17, $sp, 0xA4
/* DE538 001DE438 000020E6 */  swc1       $f0, 0x0($17)
/* DE53C 001DE43C 9000A38E */  lw         $3, 0x90($21)
/* DE540 001DE440 80100300 */  sll        $2, $3, 2
/* DE544 001DE444 21184300 */  addu       $3, $2, $3
/* DE548 001DE448 80100300 */  sll        $2, $3, 2
/* DE54C 001DE44C 21106200 */  addu       $2, $3, $2
/* DE550 001DE450 00110200 */  sll        $2, $2, 4
/* DE554 001DE454 21105500 */  addu       $2, $2, $21
/* DE558 001DE458 0200013C */  lui        $at, (0x20000 >> 16)
/* DE55C 001DE45C 21084100 */  addu       $at, $2, $at
/* DE560 001DE460 38E420C4 */  lwc1       $f0, -0x1BC8($at)
/* DE564 001DE464 42100046 */  mul.s      $f1, $f2, $f0
/* DE568 001DE468 000080C6 */  lwc1       $f0, 0x0($20)
/* DE56C 001DE46C 00000146 */  add.s      $f0, $f0, $f1
/* DE570 001DE470 A800B227 */  addiu      $18, $sp, 0xA8
/* DE574 001DE474 000040E6 */  swc1       $f0, 0x0($18)
/* DE578 001DE478 000060C6 */  lwc1       $f0, 0x0($19)
/* DE57C 001DE47C A040023C */  lui        $2, (0x40A00000 >> 16)
/* DE580 001DE480 00088244 */  mtc1       $2, $f1
/* DE584 001DE484 00000000 */  nop
/* DE588 001DE488 00000146 */  add.s      $f0, $f0, $f1
/* DE58C 001DE48C 000060E6 */  swc1       $f0, 0x0($19)
/* DE590 001DE490 000020C6 */  lwc1       $f0, 0x0($17)
/* DE594 001DE494 00000146 */  add.s      $f0, $f0, $f1
/* DE598 001DE498 000020E6 */  swc1       $f0, 0x0($17)
/* DE59C 001DE49C 9000A38E */  lw         $3, 0x90($21)
/* DE5A0 001DE4A0 80100300 */  sll        $2, $3, 2
/* DE5A4 001DE4A4 21184300 */  addu       $3, $2, $3
/* DE5A8 001DE4A8 80100300 */  sll        $2, $3, 2
/* DE5AC 001DE4AC 21106200 */  addu       $2, $3, $2
/* DE5B0 001DE4B0 00110200 */  sll        $2, $2, 4
/* DE5B4 001DE4B4 21105500 */  addu       $2, $2, $21
/* DE5B8 001DE4B8 0200013C */  lui        $at, (0x20000 >> 16)
/* DE5BC 001DE4BC 21084100 */  addu       $at, $2, $at
/* DE5C0 001DE4C0 1CE4248C */  lw         $4, -0x1BE4($at)
/* DE5C4 001DE4C4 0200013C */  lui        $at, (0x20000 >> 16)
/* DE5C8 001DE4C8 21084100 */  addu       $at, $2, $at
/* DE5CC 001DE4CC 20E4258C */  lw         $5, -0x1BE0($at)
/* DE5D0 001DE4D0 9000A627 */  addiu      $6, $sp, 0x90
/* DE5D4 001DE4D4 A000A727 */  addiu      $7, $sp, 0xA0
/* DE5D8 001DE4D8 B000A827 */  addiu      $8, $sp, 0xB0
/* DE5DC 001DE4DC 284E0070 */  paddub     $9, $0, $0
/* DE5E0 001DE4E0 28560070 */  paddub     $10, $0, $0
/* DE5E4 001DE4E4 5427050C */  jal        CheckHit__FP6CCPolyiPfPfPfii
/* DE5E8 001DE4E8 00000000 */   nop
/* DE5EC 001DE4EC 2B004004 */  bltz       $2, .L001DE59C
/* DE5F0 001DE4F0 00000000 */   nop
/* DE5F4 001DE4F4 9000A38E */  lw         $3, 0x90($21)
/* DE5F8 001DE4F8 80100300 */  sll        $2, $3, 2
/* DE5FC 001DE4FC 21184300 */  addu       $3, $2, $3
/* DE600 001DE500 80100300 */  sll        $2, $3, 2
/* DE604 001DE504 21106200 */  addu       $2, $3, $2
/* DE608 001DE508 00110200 */  sll        $2, $2, 4
/* DE60C 001DE50C 21105500 */  addu       $2, $2, $21
/* DE610 001DE510 0200013C */  lui        $at, (0x20000 >> 16)
/* DE614 001DE514 21084100 */  addu       $at, $2, $at
/* DE618 001DE518 78E4228C */  lw         $2, -0x1B88($at)
/* DE61C 001DE51C 1F00401C */  bgtz       $2, .L001DE59C
/* DE620 001DE520 00000000 */   nop
/* DE624 001DE524 000061C6 */  lwc1       $f1, 0x0($19)
/* DE628 001DE528 A040023C */  lui        $2, (0x40A00000 >> 16)
/* DE62C 001DE52C 00008244 */  mtc1       $2, $f0
/* DE630 001DE530 00000000 */  nop
/* DE634 001DE534 01080046 */  sub.s      $f0, $f1, $f0
/* DE638 001DE538 000060E6 */  swc1       $f0, 0x0($19)
/* DE63C 001DE53C 9000A38E */  lw         $3, 0x90($21)
/* DE640 001DE540 80100300 */  sll        $2, $3, 2
/* DE644 001DE544 21184300 */  addu       $3, $2, $3
/* DE648 001DE548 80100300 */  sll        $2, $3, 2
/* DE64C 001DE54C 21106200 */  addu       $2, $3, $2
/* DE650 001DE550 00110200 */  sll        $2, $2, 4
/* DE654 001DE554 21105500 */  addu       $2, $2, $21
/* DE658 001DE558 0200013C */  lui        $at, (0x20000 >> 16)
/* DE65C 001DE55C 21084100 */  addu       $at, $2, $at
/* DE660 001DE560 50E420AC */  sw         $0, -0x1BB0($at)
/* DE664 001DE564 9000A38E */  lw         $3, 0x90($21)
/* DE668 001DE568 10350224 */  addiu      $2, $0, 0x3510
/* DE66C 001DE56C 18106200 */  mult       $2, $3, $2
/* DE670 001DE570 2110A202 */  addu       $2, $21, $2
/* DE674 001DE574 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* DE678 001DE578 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* DE67C 001DE57C 21204100 */  addu       $4, $2, $at
/* DE680 001DE580 9000A527 */  addiu      $5, $sp, 0x90
/* DE684 001DE584 A000998C */  lw         $25, 0xA0($4)
/* DE688 001DE588 1400398F */  lw         $25, 0x14($25)
/* DE68C 001DE58C 09F82003 */  jalr       $25
/* DE690 001DE590 00000000 */   nop
/* DE694 001DE594 BF000010 */  b          .L001DE894
/* DE698 001DE598 00000000 */   nop
.L001DE59C:
/* DE69C 001DE59C 000061C6 */  lwc1       $f1, 0x0($19)
/* DE6A0 001DE5A0 A040023C */  lui        $2, (0x40A00000 >> 16)
/* DE6A4 001DE5A4 00008244 */  mtc1       $2, $f0
/* DE6A8 001DE5A8 00000000 */  nop
/* DE6AC 001DE5AC 01080046 */  sub.s      $f0, $f1, $f0
/* DE6B0 001DE5B0 000060E6 */  swc1       $f0, 0x0($19)
/* DE6B4 001DE5B4 9000A38E */  lw         $3, 0x90($21)
/* DE6B8 001DE5B8 80100300 */  sll        $2, $3, 2
/* DE6BC 001DE5BC 21184300 */  addu       $3, $2, $3
/* DE6C0 001DE5C0 80100300 */  sll        $2, $3, 2
/* DE6C4 001DE5C4 21106200 */  addu       $2, $3, $2
/* DE6C8 001DE5C8 00210200 */  sll        $4, $2, 4
/* DE6CC 001DE5CC 21189500 */  addu       $3, $4, $21
/* DE6D0 001DE5D0 0200013C */  lui        $at, (0x20000 >> 16)
/* DE6D4 001DE5D4 21086100 */  addu       $at, $3, $at
/* DE6D8 001DE5D8 58E4228C */  lw         $2, -0x1BA8($at)
/* DE6DC 001DE5DC 39004010 */  beqz       $2, .L001DE6C4
/* DE6E0 001DE5E0 00000000 */   nop
/* DE6E4 001DE5E4 0200013C */  lui        $at, (0x20000 >> 16)
/* DE6E8 001DE5E8 21086100 */  addu       $at, $3, $at
/* DE6EC 001DE5EC 88E421C4 */  lwc1       $f1, -0x1B78($at)
/* DE6F0 001DE5F0 A88080C7 */  lwc1       $f0, -0x7F58($gp)
/* DE6F4 001DE5F4 36080046 */  c.le.s     $f1, $f0
/* DE6F8 001DE5F8 00000000 */  nop
/* DE6FC 001DE5FC 31000145 */  bc1t       .L001DE6C4
/* DE700 001DE600 00000000 */   nop
/* DE704 001DE604 0200013C */  lui        $at, (0x20000 >> 16)
/* DE708 001DE608 21086100 */  addu       $at, $3, $at
/* DE70C 001DE60C 30E421C4 */  lwc1       $f1, -0x1BD0($at)
/* DE710 001DE610 0200013C */  lui        $at, (0x20000 >> 16)
/* DE714 001DE614 21086100 */  addu       $at, $3, $at
/* DE718 001DE618 50E420C4 */  lwc1       $f0, -0x1BB0($at)
/* DE71C 001DE61C 42080046 */  mul.s      $f1, $f1, $f0
/* DE720 001DE620 9000A0C7 */  lwc1       $f0, 0x90($sp)
/* DE724 001DE624 00000146 */  add.s      $f0, $f0, $f1
/* DE728 001DE628 A000A0E7 */  swc1       $f0, 0xA0($sp)
/* DE72C 001DE62C 9000A38E */  lw         $3, 0x90($21)
/* DE730 001DE630 80100300 */  sll        $2, $3, 2
/* DE734 001DE634 21184300 */  addu       $3, $2, $3
/* DE738 001DE638 80100300 */  sll        $2, $3, 2
/* DE73C 001DE63C 21106200 */  addu       $2, $3, $2
/* DE740 001DE640 00110200 */  sll        $2, $2, 4
/* DE744 001DE644 21105500 */  addu       $2, $2, $21
/* DE748 001DE648 0200013C */  lui        $at, (0x20000 >> 16)
/* DE74C 001DE64C 21084100 */  addu       $at, $2, $at
/* DE750 001DE650 34E421C4 */  lwc1       $f1, -0x1BCC($at)
/* DE754 001DE654 0200013C */  lui        $at, (0x20000 >> 16)
/* DE758 001DE658 21084100 */  addu       $at, $2, $at
/* DE75C 001DE65C 50E420C4 */  lwc1       $f0, -0x1BB0($at)
/* DE760 001DE660 42080046 */  mul.s      $f1, $f1, $f0
/* DE764 001DE664 1C8580C7 */  lwc1       $f0, -0x7AE4($gp)
/* DE768 001DE668 41080046 */  sub.s      $f1, $f1, $f0
/* DE76C 001DE66C 000060C6 */  lwc1       $f0, 0x0($19)
/* DE770 001DE670 00000146 */  add.s      $f0, $f0, $f1
/* DE774 001DE674 000020E6 */  swc1       $f0, 0x0($17)
/* DE778 001DE678 9000A38E */  lw         $3, 0x90($21)
/* DE77C 001DE67C 80100300 */  sll        $2, $3, 2
/* DE780 001DE680 21184300 */  addu       $3, $2, $3
/* DE784 001DE684 80100300 */  sll        $2, $3, 2
/* DE788 001DE688 21106200 */  addu       $2, $3, $2
/* DE78C 001DE68C 00110200 */  sll        $2, $2, 4
/* DE790 001DE690 21105500 */  addu       $2, $2, $21
/* DE794 001DE694 0200013C */  lui        $at, (0x20000 >> 16)
/* DE798 001DE698 21084100 */  addu       $at, $2, $at
/* DE79C 001DE69C 38E421C4 */  lwc1       $f1, -0x1BC8($at)
/* DE7A0 001DE6A0 0200013C */  lui        $at, (0x20000 >> 16)
/* DE7A4 001DE6A4 21084100 */  addu       $at, $2, $at
/* DE7A8 001DE6A8 50E420C4 */  lwc1       $f0, -0x1BB0($at)
/* DE7AC 001DE6AC 42080046 */  mul.s      $f1, $f1, $f0
/* DE7B0 001DE6B0 000080C6 */  lwc1       $f0, 0x0($20)
/* DE7B4 001DE6B4 00000146 */  add.s      $f0, $f0, $f1
/* DE7B8 001DE6B8 000040E6 */  swc1       $f0, 0x0($18)
/* DE7BC 001DE6BC 2E000010 */  b          .L001DE778
/* DE7C0 001DE6C0 00000000 */   nop
.L001DE6C4:
/* DE7C4 001DE6C4 21109500 */  addu       $2, $4, $21
/* DE7C8 001DE6C8 0200013C */  lui        $at, (0x20000 >> 16)
/* DE7CC 001DE6CC 21084100 */  addu       $at, $2, $at
/* DE7D0 001DE6D0 30E421C4 */  lwc1       $f1, -0x1BD0($at)
/* DE7D4 001DE6D4 0200013C */  lui        $at, (0x20000 >> 16)
/* DE7D8 001DE6D8 21084100 */  addu       $at, $2, $at
/* DE7DC 001DE6DC 50E420C4 */  lwc1       $f0, -0x1BB0($at)
/* DE7E0 001DE6E0 42080046 */  mul.s      $f1, $f1, $f0
/* DE7E4 001DE6E4 9000A0C7 */  lwc1       $f0, 0x90($sp)
/* DE7E8 001DE6E8 00000146 */  add.s      $f0, $f0, $f1
/* DE7EC 001DE6EC A000A0E7 */  swc1       $f0, 0xA0($sp)
/* DE7F0 001DE6F0 9000A38E */  lw         $3, 0x90($21)
/* DE7F4 001DE6F4 80100300 */  sll        $2, $3, 2
/* DE7F8 001DE6F8 21184300 */  addu       $3, $2, $3
/* DE7FC 001DE6FC 80100300 */  sll        $2, $3, 2
/* DE800 001DE700 21106200 */  addu       $2, $3, $2
/* DE804 001DE704 00110200 */  sll        $2, $2, 4
/* DE808 001DE708 21105500 */  addu       $2, $2, $21
/* DE80C 001DE70C 0200013C */  lui        $at, (0x20000 >> 16)
/* DE810 001DE710 21084100 */  addu       $at, $2, $at
/* DE814 001DE714 34E421C4 */  lwc1       $f1, -0x1BCC($at)
/* DE818 001DE718 0200013C */  lui        $at, (0x20000 >> 16)
/* DE81C 001DE71C 21084100 */  addu       $at, $2, $at
/* DE820 001DE720 50E420C4 */  lwc1       $f0, -0x1BB0($at)
/* DE824 001DE724 42080046 */  mul.s      $f1, $f1, $f0
/* DE828 001DE728 000060C6 */  lwc1       $f0, 0x0($19)
/* DE82C 001DE72C 00000146 */  add.s      $f0, $f0, $f1
/* DE830 001DE730 000020E6 */  swc1       $f0, 0x0($17)
/* DE834 001DE734 9000A38E */  lw         $3, 0x90($21)
/* DE838 001DE738 80100300 */  sll        $2, $3, 2
/* DE83C 001DE73C 21184300 */  addu       $3, $2, $3
/* DE840 001DE740 80100300 */  sll        $2, $3, 2
/* DE844 001DE744 21106200 */  addu       $2, $3, $2
/* DE848 001DE748 00110200 */  sll        $2, $2, 4
/* DE84C 001DE74C 21105500 */  addu       $2, $2, $21
/* DE850 001DE750 0200013C */  lui        $at, (0x20000 >> 16)
/* DE854 001DE754 21084100 */  addu       $at, $2, $at
/* DE858 001DE758 38E421C4 */  lwc1       $f1, -0x1BC8($at)
/* DE85C 001DE75C 0200013C */  lui        $at, (0x20000 >> 16)
/* DE860 001DE760 21084100 */  addu       $at, $2, $at
/* DE864 001DE764 50E420C4 */  lwc1       $f0, -0x1BB0($at)
/* DE868 001DE768 42080046 */  mul.s      $f1, $f1, $f0
/* DE86C 001DE76C 000080C6 */  lwc1       $f0, 0x0($20)
/* DE870 001DE770 00000146 */  add.s      $f0, $f0, $f1
/* DE874 001DE774 000040E6 */  swc1       $f0, 0x0($18)
.L001DE778:
/* DE878 001DE778 9000A38E */  lw         $3, 0x90($21)
/* DE87C 001DE77C 10350224 */  addiu      $2, $0, 0x3510
/* DE880 001DE780 18106200 */  mult       $2, $3, $2
/* DE884 001DE784 2110A202 */  addu       $2, $21, $2
/* DE888 001DE788 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* DE88C 001DE78C D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* DE890 001DE790 21204100 */  addu       $4, $2, $at
/* DE894 001DE794 A000A527 */  addiu      $5, $sp, 0xA0
/* DE898 001DE798 A000998C */  lw         $25, 0xA0($4)
/* DE89C 001DE79C 1400398F */  lw         $25, 0x14($25)
/* DE8A0 001DE7A0 09F82003 */  jalr       $25
/* DE8A4 001DE7A4 00000000 */   nop
/* DE8A8 001DE7A8 9000A38E */  lw         $3, 0x90($21)
/* DE8AC 001DE7AC 80100300 */  sll        $2, $3, 2
/* DE8B0 001DE7B0 21184300 */  addu       $3, $2, $3
/* DE8B4 001DE7B4 80100300 */  sll        $2, $3, 2
/* DE8B8 001DE7B8 21106200 */  addu       $2, $3, $2
/* DE8BC 001DE7BC 00110200 */  sll        $2, $2, 4
/* DE8C0 001DE7C0 21185500 */  addu       $3, $2, $21
/* DE8C4 001DE7C4 0200013C */  lui        $at, (0x20000 >> 16)
/* DE8C8 001DE7C8 21086100 */  addu       $at, $3, $at
/* DE8CC 001DE7CC 58E4228C */  lw         $2, -0x1BA8($at)
/* DE8D0 001DE7D0 30004010 */  beqz       $2, .L001DE894
/* DE8D4 001DE7D4 00000000 */   nop
/* DE8D8 001DE7D8 0200013C */  lui        $at, (0x20000 >> 16)
/* DE8DC 001DE7DC 21086100 */  addu       $at, $3, $at
/* DE8E0 001DE7E0 88E421C4 */  lwc1       $f1, -0x1B78($at)
/* DE8E4 001DE7E4 A88080C7 */  lwc1       $f0, -0x7F58($gp)
/* DE8E8 001DE7E8 36080046 */  c.le.s     $f1, $f0
/* DE8EC 001DE7EC 00000000 */  nop
/* DE8F0 001DE7F0 28000145 */  bc1t       .L001DE894
/* DE8F4 001DE7F4 00000000 */   nop
/* DE8F8 001DE7F8 A000A427 */  addiu      $4, $sp, 0xA0
/* DE8FC 001DE7FC 9000A527 */  addiu      $5, $sp, 0x90
/* DE900 001DE800 648D040C */  jal        DistVector__FPfPf
/* DE904 001DE804 00000000 */   nop
/* DE908 001DE808 9000A38E */  lw         $3, 0x90($21)
/* DE90C 001DE80C 80100300 */  sll        $2, $3, 2
/* DE910 001DE810 21184300 */  addu       $3, $2, $3
/* DE914 001DE814 80100300 */  sll        $2, $3, 2
/* DE918 001DE818 21106200 */  addu       $2, $3, $2
/* DE91C 001DE81C 00110200 */  sll        $2, $2, 4
/* DE920 001DE820 21105500 */  addu       $2, $2, $21
/* DE924 001DE824 0200013C */  lui        $at, (0x20000 >> 16)
/* DE928 001DE828 21084100 */  addu       $at, $2, $at
/* DE92C 001DE82C 50E420E4 */  swc1       $f0, -0x1BB0($at)
/* DE930 001DE830 A000A1C7 */  lwc1       $f1, 0xA0($sp)
/* DE934 001DE834 9000A0C7 */  lwc1       $f0, 0x90($sp)
/* DE938 001DE838 01080046 */  sub.s      $f0, $f1, $f0
/* DE93C 001DE83C A000A0E7 */  swc1       $f0, 0xA0($sp)
/* DE940 001DE840 000021C6 */  lwc1       $f1, 0x0($17)
/* DE944 001DE844 000060C6 */  lwc1       $f0, 0x0($19)
/* DE948 001DE848 01080046 */  sub.s      $f0, $f1, $f0
/* DE94C 001DE84C 000020E6 */  swc1       $f0, 0x0($17)
/* DE950 001DE850 000041C6 */  lwc1       $f1, 0x0($18)
/* DE954 001DE854 000080C6 */  lwc1       $f0, 0x0($20)
/* DE958 001DE858 01080046 */  sub.s      $f0, $f1, $f0
/* DE95C 001DE85C 000040E6 */  swc1       $f0, 0x0($18)
/* DE960 001DE860 9000A38E */  lw         $3, 0x90($21)
/* DE964 001DE864 80100300 */  sll        $2, $3, 2
/* DE968 001DE868 21184300 */  addu       $3, $2, $3
/* DE96C 001DE86C 80100300 */  sll        $2, $3, 2
/* DE970 001DE870 21106200 */  addu       $2, $3, $2
/* DE974 001DE874 00110200 */  sll        $2, $2, 4
/* DE978 001DE878 2110A202 */  addu       $2, $21, $2
/* DE97C 001DE87C 0100013C */  lui        $at, (0x1E430 >> 16)
/* DE980 001DE880 30E42134 */  ori        $at, $at, (0x1E430 & 0xFFFF)
/* DE984 001DE884 21204100 */  addu       $4, $2, $at
/* DE988 001DE888 A000A527 */  addiu      $5, $sp, 0xA0
/* DE98C 001DE88C 9285040C */  jal        sceVu0Normalize
/* DE990 001DE890 00000000 */   nop
.L001DE894:
/* DE994 001DE894 9000A38E */  lw         $3, 0x90($21)
/* DE998 001DE898 10350224 */  addiu      $2, $0, 0x3510
/* DE99C 001DE89C 18106200 */  mult       $2, $3, $2
/* DE9A0 001DE8A0 2110A202 */  addu       $2, $21, $2
/* DE9A4 001DE8A4 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* DE9A8 001DE8A8 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* DE9AC 001DE8AC 21204100 */  addu       $4, $2, $at
/* DE9B0 001DE8B0 F000A527 */  addiu      $5, $sp, 0xF0
/* DE9B4 001DE8B4 A000998C */  lw         $25, 0xA0($4)
/* DE9B8 001DE8B8 A000398F */  lw         $25, 0xA0($25)
/* DE9BC 001DE8BC 09F82003 */  jalr       $25
/* DE9C0 001DE8C0 00000000 */   nop
/* DE9C4 001DE8C4 F400A1C7 */  lwc1       $f1, 0xF4($sp)
/* DE9C8 001DE8C8 A040023C */  lui        $2, (0x40A00000 >> 16)
/* DE9CC 001DE8CC 00008244 */  mtc1       $2, $f0
/* DE9D0 001DE8D0 00000000 */  nop
/* DE9D4 001DE8D4 00080046 */  add.s      $f0, $f1, $f0
/* DE9D8 001DE8D8 F400A0E7 */  swc1       $f0, 0xF4($sp)
/* DE9DC 001DE8DC 9000A38E */  lw         $3, 0x90($21)
/* DE9E0 001DE8E0 80100300 */  sll        $2, $3, 2
/* DE9E4 001DE8E4 21184300 */  addu       $3, $2, $3
/* DE9E8 001DE8E8 80100300 */  sll        $2, $3, 2
/* DE9EC 001DE8EC 21106200 */  addu       $2, $3, $2
/* DE9F0 001DE8F0 00110200 */  sll        $2, $2, 4
/* DE9F4 001DE8F4 21105500 */  addu       $2, $2, $21
/* DE9F8 001DE8F8 0200013C */  lui        $at, (0x20000 >> 16)
/* DE9FC 001DE8FC 21084100 */  addu       $at, $2, $at
/* DEA00 001DE900 1CE4248C */  lw         $4, -0x1BE4($at)
/* DEA04 001DE904 0200013C */  lui        $at, (0x20000 >> 16)
/* DEA08 001DE908 21084100 */  addu       $at, $2, $at
/* DEA0C 001DE90C 20E4258C */  lw         $5, -0x1BE0($at)
/* DEA10 001DE910 F000A627 */  addiu      $6, $sp, 0xF0
/* DEA14 001DE914 0200013C */  lui        $at, (0x20000 >> 16)
/* DEA18 001DE918 21084100 */  addu       $at, $2, $at
/* DEA1C 001DE91C 14E42CC4 */  lwc1       $f12, -0x1BEC($at)
/* DEA20 001DE920 0001A727 */  addiu      $7, $sp, 0x100
/* DEA24 001DE924 28460070 */  paddub     $8, $0, $0
/* DEA28 001DE928 DC2B050C */  jal        CheckWidth__FP6CCPolyiPffPfi
/* DEA2C 001DE92C 00000000 */   nop
/* DEA30 001DE930 13004010 */  beqz       $2, .L001DE980
/* DEA34 001DE934 00000000 */   nop
/* DEA38 001DE938 0401A1C7 */  lwc1       $f1, 0x104($sp)
/* DEA3C 001DE93C A040023C */  lui        $2, (0x40A00000 >> 16)
/* DEA40 001DE940 00008244 */  mtc1       $2, $f0
/* DEA44 001DE944 00000000 */  nop
/* DEA48 001DE948 01080046 */  sub.s      $f0, $f1, $f0
/* DEA4C 001DE94C 0401A0E7 */  swc1       $f0, 0x104($sp)
/* DEA50 001DE950 9000A38E */  lw         $3, 0x90($21)
/* DEA54 001DE954 10350224 */  addiu      $2, $0, 0x3510
/* DEA58 001DE958 18106200 */  mult       $2, $3, $2
/* DEA5C 001DE95C 2110A202 */  addu       $2, $21, $2
/* DEA60 001DE960 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* DEA64 001DE964 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* DEA68 001DE968 21204100 */  addu       $4, $2, $at
/* DEA6C 001DE96C 0001A527 */  addiu      $5, $sp, 0x100
/* DEA70 001DE970 A000998C */  lw         $25, 0xA0($4)
/* DEA74 001DE974 1400398F */  lw         $25, 0x14($25)
/* DEA78 001DE978 09F82003 */  jalr       $25
/* DEA7C 001DE97C 00000000 */   nop
.L001DE980:
/* DEA80 001DE980 9000A38E */  lw         $3, 0x90($21)
/* DEA84 001DE984 80100300 */  sll        $2, $3, 2
/* DEA88 001DE988 21184300 */  addu       $3, $2, $3
/* DEA8C 001DE98C 80100300 */  sll        $2, $3, 2
/* DEA90 001DE990 21106200 */  addu       $2, $3, $2
/* DEA94 001DE994 00110200 */  sll        $2, $2, 4
/* DEA98 001DE998 21105500 */  addu       $2, $2, $21
/* DEA9C 001DE99C 0200013C */  lui        $at, (0x20000 >> 16)
/* DEAA0 001DE9A0 21084100 */  addu       $at, $2, $at
/* DEAA4 001DE9A4 88E420AC */  sw         $0, -0x1B78($at)
/* DEAA8 001DE9A8 9000A38E */  lw         $3, 0x90($21)
/* DEAAC 001DE9AC 10350224 */  addiu      $2, $0, 0x3510
/* DEAB0 001DE9B0 18106200 */  mult       $2, $3, $2
/* DEAB4 001DE9B4 2110A202 */  addu       $2, $21, $2
/* DEAB8 001DE9B8 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* DEABC 001DE9BC D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* DEAC0 001DE9C0 21204100 */  addu       $4, $2, $at
/* DEAC4 001DE9C4 9000A527 */  addiu      $5, $sp, 0x90
/* DEAC8 001DE9C8 A000998C */  lw         $25, 0xA0($4)
/* DEACC 001DE9CC A000398F */  lw         $25, 0xA0($25)
/* DEAD0 001DE9D0 09F82003 */  jalr       $25
/* DEAD4 001DE9D4 00000000 */   nop
/* DEAD8 001DE9D8 000061C6 */  lwc1       $f1, 0x0($19)
/* DEADC 001DE9DC 2041023C */  lui        $2, (0x41200000 >> 16)
/* DEAE0 001DE9E0 00008244 */  mtc1       $2, $f0
/* DEAE4 001DE9E4 00000000 */  nop
/* DEAE8 001DE9E8 00080046 */  add.s      $f0, $f1, $f0
/* DEAEC 001DE9EC 000060E6 */  swc1       $f0, 0x0($19)
/* DEAF0 001DE9F0 9000A38E */  lw         $3, 0x90($21)
/* DEAF4 001DE9F4 80100300 */  sll        $2, $3, 2
/* DEAF8 001DE9F8 21184300 */  addu       $3, $2, $3
/* DEAFC 001DE9FC 80100300 */  sll        $2, $3, 2
/* DEB00 001DEA00 21106200 */  addu       $2, $3, $2
/* DEB04 001DEA04 00110200 */  sll        $2, $2, 4
/* DEB08 001DEA08 21185500 */  addu       $3, $2, $21
/* DEB0C 001DEA0C 02C3023C */  lui        $2, (0xC3020000 >> 16)
/* DEB10 001DEA10 00608244 */  mtc1       $2, $f12
/* DEB14 001DEA14 0200013C */  lui        $at, (0x20000 >> 16)
/* DEB18 001DEA18 21086100 */  addu       $at, $3, $at
/* DEB1C 001DEA1C 1CE4248C */  lw         $4, -0x1BE4($at)
/* DEB20 001DEA20 0200013C */  lui        $at, (0x20000 >> 16)
/* DEB24 001DEA24 21086100 */  addu       $at, $3, $at
/* DEB28 001DEA28 20E4258C */  lw         $5, -0x1BE0($at)
/* DEB2C 001DEA2C 9000A627 */  addiu      $6, $sp, 0x90
/* DEB30 001DEA30 B000A727 */  addiu      $7, $sp, 0xB0
/* DEB34 001DEA34 28460070 */  paddub     $8, $0, $0
/* DEB38 001DEA38 2028050C */  jal        CheckHitVertical__FP6CCPolyiPffPfi
/* DEB3C 001DEA3C 00000000 */   nop
/* DEB40 001DEA40 98004004 */  bltz       $2, .L001DECA4
/* DEB44 001DEA44 00000000 */   nop
/* DEB48 001DEA48 000061C6 */  lwc1       $f1, 0x0($19)
/* DEB4C 001DEA4C 2041023C */  lui        $2, (0x41200000 >> 16)
/* DEB50 001DEA50 00008244 */  mtc1       $2, $f0
/* DEB54 001DEA54 00000000 */  nop
/* DEB58 001DEA58 01080046 */  sub.s      $f0, $f1, $f0
/* DEB5C 001DEA5C 000060E6 */  swc1       $f0, 0x0($19)
/* DEB60 001DEA60 B400A227 */  addiu      $2, $sp, 0xB4
/* DEB64 001DEA64 000041C4 */  lwc1       $f1, 0x0($2)
/* DEB68 001DEA68 34000146 */  c.lt.s     $f0, $f1
/* DEB6C 001DEA6C 00000000 */  nop
/* DEB70 001DEA70 46000045 */  bc1f       .L001DEB8C
/* DEB74 001DEA74 00000000 */   nop
/* DEB78 001DEA78 000061E6 */  swc1       $f1, 0x0($19)
/* DEB7C 001DEA7C 9000A48E */  lw         $4, 0x90($21)
/* DEB80 001DEA80 80180400 */  sll        $3, $4, 2
/* DEB84 001DEA84 21206400 */  addu       $4, $3, $4
/* DEB88 001DEA88 80180400 */  sll        $3, $4, 2
/* DEB8C 001DEA8C 21188300 */  addu       $3, $4, $3
/* DEB90 001DEA90 00190300 */  sll        $3, $3, 4
/* DEB94 001DEA94 21207500 */  addu       $4, $3, $21
/* DEB98 001DEA98 0200013C */  lui        $at, (0x20000 >> 16)
/* DEB9C 001DEA9C 21088100 */  addu       $at, $4, $at
/* DEBA0 001DEAA0 58E4238C */  lw         $3, -0x1BA8($at)
/* DEBA4 001DEAA4 39006010 */  beqz       $3, .L001DEB8C
/* DEBA8 001DEAA8 00000000 */   nop
/* DEBAC 001DEAAC 80BF033C */  lui        $3, (0xBF800000 >> 16)
/* DEBB0 001DEAB0 00088344 */  mtc1       $3, $f1
/* DEBB4 001DEAB4 0200013C */  lui        $at, (0x20000 >> 16)
/* DEBB8 001DEAB8 21088100 */  addu       $at, $4, $at
/* DEBBC 001DEABC 34E420C4 */  lwc1       $f0, -0x1BCC($at)
/* DEBC0 001DEAC0 02000146 */  mul.s      $f0, $f0, $f1
/* DEBC4 001DEAC4 0200013C */  lui        $at, (0x20000 >> 16)
/* DEBC8 001DEAC8 21088100 */  addu       $at, $4, $at
/* DEBCC 001DEACC 34E420E4 */  swc1       $f0, -0x1BCC($at)
/* DEBD0 001DEAD0 9000A48E */  lw         $4, 0x90($21)
/* DEBD4 001DEAD4 80180400 */  sll        $3, $4, 2
/* DEBD8 001DEAD8 21206400 */  addu       $4, $3, $4
/* DEBDC 001DEADC 80180400 */  sll        $3, $4, 2
/* DEBE0 001DEAE0 21188300 */  addu       $3, $4, $3
/* DEBE4 001DEAE4 00190300 */  sll        $3, $3, 4
/* DEBE8 001DEAE8 21207500 */  addu       $4, $3, $21
/* DEBEC 001DEAEC 0200013C */  lui        $at, (0x20000 >> 16)
/* DEBF0 001DEAF0 21088100 */  addu       $at, $4, $at
/* DEBF4 001DEAF4 34E422C4 */  lwc1       $f2, -0x1BCC($at)
/* DEBF8 001DEAF8 00008044 */  mtc1       $0, $f0
/* DEBFC 001DEAFC 00000000 */  nop
/* DEC00 001DEB00 36100046 */  c.le.s     $f2, $f0
/* DEC04 001DEB04 00000000 */  nop
/* DEC08 001DEB08 20000145 */  bc1t       .L001DEB8C
/* DEC0C 001DEB0C 00000000 */   nop
/* DEC10 001DEB10 003F033C */  lui        $3, (0x3F000000 >> 16)
/* DEC14 001DEB14 00088344 */  mtc1       $3, $f1
/* DEC18 001DEB18 0040033C */  lui        $3, (0x40000000 >> 16)
/* DEC1C 001DEB1C 00008344 */  mtc1       $3, $f0
/* DEC20 001DEB20 00000000 */  nop
/* DEC24 001DEB24 01000246 */  sub.s      $f0, $f0, $f2
/* DEC28 001DEB28 42080046 */  mul.s      $f1, $f1, $f0
/* DEC2C 001DEB2C 0200013C */  lui        $at, (0x20000 >> 16)
/* DEC30 001DEB30 21088100 */  addu       $at, $4, $at
/* DEC34 001DEB34 50E420C4 */  lwc1       $f0, -0x1BB0($at)
/* DEC38 001DEB38 02000146 */  mul.s      $f0, $f0, $f1
/* DEC3C 001DEB3C 0200013C */  lui        $at, (0x20000 >> 16)
/* DEC40 001DEB40 21088100 */  addu       $at, $4, $at
/* DEC44 001DEB44 50E420E4 */  swc1       $f0, -0x1BB0($at)
/* DEC48 001DEB48 9000A48E */  lw         $4, 0x90($21)
/* DEC4C 001DEB4C 80180400 */  sll        $3, $4, 2
/* DEC50 001DEB50 21206400 */  addu       $4, $3, $4
/* DEC54 001DEB54 80180400 */  sll        $3, $4, 2
/* DEC58 001DEB58 21188300 */  addu       $3, $4, $3
/* DEC5C 001DEB5C 00190300 */  sll        $3, $3, 4
/* DEC60 001DEB60 21187500 */  addu       $3, $3, $21
/* DEC64 001DEB64 0100013C */  lui        $at, (0x1E450 >> 16)
/* DEC68 001DEB68 50E42134 */  ori        $at, $at, (0x1E450 & 0xFFFF)
/* DEC6C 001DEB6C 21186100 */  addu       $3, $3, $at
/* DEC70 001DEB70 000061C4 */  lwc1       $f1, 0x0($3)
/* DEC74 001DEB74 1C8580C7 */  lwc1       $f0, -0x7AE4($gp)
/* DEC78 001DEB78 34080046 */  c.lt.s     $f1, $f0
/* DEC7C 001DEB7C 00000000 */  nop
/* DEC80 001DEB80 02000045 */  bc1f       .L001DEB8C
/* DEC84 001DEB84 00000000 */   nop
/* DEC88 001DEB88 000060AC */  sw         $0, 0x0($3)
.L001DEB8C:
/* DEC8C 001DEB8C 000061C6 */  lwc1       $f1, 0x0($19)
/* DEC90 001DEB90 000040C4 */  lwc1       $f0, 0x0($2)
/* DEC94 001DEB94 01080046 */  sub.s      $f0, $f1, $f0
/* DEC98 001DEB98 9000A48E */  lw         $4, 0x90($21)
/* DEC9C 001DEB9C 80180400 */  sll        $3, $4, 2
/* DECA0 001DEBA0 21206400 */  addu       $4, $3, $4
/* DECA4 001DEBA4 80180400 */  sll        $3, $4, 2
/* DECA8 001DEBA8 21188300 */  addu       $3, $4, $3
/* DECAC 001DEBAC 00190300 */  sll        $3, $3, 4
/* DECB0 001DEBB0 21187500 */  addu       $3, $3, $21
/* DECB4 001DEBB4 0200013C */  lui        $at, (0x20000 >> 16)
/* DECB8 001DEBB8 21086100 */  addu       $at, $3, $at
/* DECBC 001DEBBC 88E420E4 */  swc1       $f0, -0x1B78($at)
/* DECC0 001DEBC0 000040C4 */  lwc1       $f0, 0x0($2)
/* DECC4 001DEBC4 9000A38E */  lw         $3, 0x90($21)
/* DECC8 001DEBC8 80100300 */  sll        $2, $3, 2
/* DECCC 001DEBCC 21184300 */  addu       $3, $2, $3
/* DECD0 001DEBD0 80100300 */  sll        $2, $3, 2
/* DECD4 001DEBD4 21106200 */  addu       $2, $3, $2
/* DECD8 001DEBD8 00110200 */  sll        $2, $2, 4
/* DECDC 001DEBDC 21105500 */  addu       $2, $2, $21
/* DECE0 001DEBE0 0200013C */  lui        $at, (0x20000 >> 16)
/* DECE4 001DEBE4 21084100 */  addu       $at, $2, $at
/* DECE8 001DEBE8 8CE420E4 */  swc1       $f0, -0x1B74($at)
/* DECEC 001DEBEC 9000A48E */  lw         $4, 0x90($21)
/* DECF0 001DEBF0 80100400 */  sll        $2, $4, 2
/* DECF4 001DEBF4 21184400 */  addu       $3, $2, $4
/* DECF8 001DEBF8 80100300 */  sll        $2, $3, 2
/* DECFC 001DEBFC 21106200 */  addu       $2, $3, $2
/* DED00 001DEC00 00110200 */  sll        $2, $2, 4
/* DED04 001DEC04 21105500 */  addu       $2, $2, $21
/* DED08 001DEC08 0200013C */  lui        $at, (0x20000 >> 16)
/* DED0C 001DEC0C 21084100 */  addu       $at, $2, $at
/* DED10 001DEC10 58E4228C */  lw         $2, -0x1BA8($at)
/* DED14 001DEC14 23004010 */  beqz       $2, .L001DECA4
/* DED18 001DEC18 00000000 */   nop
/* DED1C 001DEC1C 10350224 */  addiu      $2, $0, 0x3510
/* DED20 001DEC20 18108200 */  mult       $2, $4, $2
/* DED24 001DEC24 2110A202 */  addu       $2, $21, $2
/* DED28 001DEC28 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* DED2C 001DEC2C D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* DED30 001DEC30 21204100 */  addu       $4, $2, $at
/* DED34 001DEC34 9000A527 */  addiu      $5, $sp, 0x90
/* DED38 001DEC38 A000998C */  lw         $25, 0xA0($4)
/* DED3C 001DEC3C 1400398F */  lw         $25, 0x14($25)
/* DED40 001DEC40 09F82003 */  jalr       $25
/* DED44 001DEC44 00000000 */   nop
/* DED48 001DEC48 9000A48E */  lw         $4, 0x90($21)
/* DED4C 001DEC4C 80100400 */  sll        $2, $4, 2
/* DED50 001DEC50 21184400 */  addu       $3, $2, $4
/* DED54 001DEC54 80100300 */  sll        $2, $3, 2
/* DED58 001DEC58 21106200 */  addu       $2, $3, $2
/* DED5C 001DEC5C 00110200 */  sll        $2, $2, 4
/* DED60 001DEC60 21105500 */  addu       $2, $2, $21
/* DED64 001DEC64 0200013C */  lui        $at, (0x20000 >> 16)
/* DED68 001DEC68 21084100 */  addu       $at, $2, $at
/* DED6C 001DEC6C A6E42284 */  lh         $2, -0x1B5A($at)
/* DED70 001DEC70 0C004014 */  bnez       $2, .L001DECA4
/* DED74 001DEC74 00000000 */   nop
/* DED78 001DEC78 10350224 */  addiu      $2, $0, 0x3510
/* DED7C 001DEC7C 18108200 */  mult       $2, $4, $2
/* DED80 001DEC80 2110A202 */  addu       $2, $21, $2
/* DED84 001DEC84 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* DED88 001DEC88 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* DED8C 001DEC8C 21204100 */  addu       $4, $2, $at
/* DED90 001DEC90 B000A527 */  addiu      $5, $sp, 0xB0
/* DED94 001DEC94 A000998C */  lw         $25, 0xA0($4)
/* DED98 001DEC98 1400398F */  lw         $25, 0x14($25)
/* DED9C 001DEC9C 09F82003 */  jalr       $25
/* DEDA0 001DECA0 00000000 */   nop
.L001DECA4:
/* DEDA4 001DECA4 9000A48E */  lw         $4, 0x90($21)
/* DEDA8 001DECA8 80100400 */  sll        $2, $4, 2
/* DEDAC 001DECAC 21184400 */  addu       $3, $2, $4
/* DEDB0 001DECB0 80100300 */  sll        $2, $3, 2
/* DEDB4 001DECB4 21106200 */  addu       $2, $3, $2
/* DEDB8 001DECB8 00110200 */  sll        $2, $2, 4
/* DEDBC 001DECBC 21105500 */  addu       $2, $2, $21
/* DEDC0 001DECC0 0200013C */  lui        $at, (0x20000 >> 16)
/* DEDC4 001DECC4 21084100 */  addu       $at, $2, $at
/* DEDC8 001DECC8 54E421C4 */  lwc1       $f1, -0x1BAC($at)
/* DEDCC 001DECCC 00008044 */  mtc1       $0, $f0
/* DEDD0 001DECD0 00000000 */  nop
/* DEDD4 001DECD4 32000146 */  c.eq.s     $f0, $f1
/* DEDD8 001DECD8 00000000 */  nop
/* DEDDC 001DECDC 59000145 */  bc1t       .L001DEE44
/* DEDE0 001DECE0 00000000 */   nop
/* DEDE4 001DECE4 10350224 */  addiu      $2, $0, 0x3510
/* DEDE8 001DECE8 18108200 */  mult       $2, $4, $2
/* DEDEC 001DECEC 2110A202 */  addu       $2, $21, $2
/* DEDF0 001DECF0 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* DEDF4 001DECF4 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* DEDF8 001DECF8 21204100 */  addu       $4, $2, $at
/* DEDFC 001DECFC 1001A527 */  addiu      $5, $sp, 0x110
/* DEE00 001DED00 A000998C */  lw         $25, 0xA0($4)
/* DEE04 001DED04 A000398F */  lw         $25, 0xA0($25)
/* DEE08 001DED08 09F82003 */  jalr       $25
/* DEE0C 001DED0C 00000000 */   nop
/* DEE10 001DED10 9000A38E */  lw         $3, 0x90($21)
/* DEE14 001DED14 10350224 */  addiu      $2, $0, 0x3510
/* DEE18 001DED18 18106200 */  mult       $2, $3, $2
/* DEE1C 001DED1C 2110A202 */  addu       $2, $21, $2
/* DEE20 001DED20 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* DEE24 001DED24 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* DEE28 001DED28 21204100 */  addu       $4, $2, $at
/* DEE2C 001DED2C 2001A527 */  addiu      $5, $sp, 0x120
/* DEE30 001DED30 A000998C */  lw         $25, 0xA0($4)
/* DEE34 001DED34 5800398F */  lw         $25, 0x58($25)
/* DEE38 001DED38 09F82003 */  jalr       $25
/* DEE3C 001DED3C 00000000 */   nop
/* DEE40 001DED40 9000A38E */  lw         $3, 0x90($21)
/* DEE44 001DED44 80100300 */  sll        $2, $3, 2
/* DEE48 001DED48 21184300 */  addu       $3, $2, $3
/* DEE4C 001DED4C 80100300 */  sll        $2, $3, 2
/* DEE50 001DED50 21106200 */  addu       $2, $3, $2
/* DEE54 001DED54 00110200 */  sll        $2, $2, 4
/* DEE58 001DED58 2110A202 */  addu       $2, $21, $2
/* DEE5C 001DED5C 3001A427 */  addiu      $4, $sp, 0x130
/* DEE60 001DED60 0100013C */  lui        $at, (0x1E440 >> 16)
/* DEE64 001DED64 40E42134 */  ori        $at, $at, (0x1E440 & 0xFFFF)
/* DEE68 001DED68 21284100 */  addu       $5, $2, $at
/* DEE6C 001DED6C 1001A627 */  addiu      $6, $sp, 0x110
/* DEE70 001DED70 EE85040C */  jal        sceVu0SubVector
/* DEE74 001DED74 00000000 */   nop
/* DEE78 001DED78 3001ACC7 */  lwc1       $f12, 0x130($sp)
/* DEE7C 001DED7C 3801ADC7 */  lwc1       $f13, 0x138($sp)
/* DEE80 001DED80 5077040C */  jal        atan2f
/* DEE84 001DED84 00000000 */   nop
/* DEE88 001DED88 06050046 */  mov.s      $f20, $f0
/* DEE8C 001DED8C 2401B127 */  addiu      $17, $sp, 0x124
/* DEE90 001DED90 9000A38E */  lw         $3, 0x90($21)
/* DEE94 001DED94 80100300 */  sll        $2, $3, 2
/* DEE98 001DED98 21184300 */  addu       $3, $2, $3
/* DEE9C 001DED9C 80100300 */  sll        $2, $3, 2
/* DEEA0 001DEDA0 21106200 */  addu       $2, $3, $2
/* DEEA4 001DEDA4 00110200 */  sll        $2, $2, 4
/* DEEA8 001DEDA8 21105500 */  addu       $2, $2, $21
/* DEEAC 001DEDAC 00002CC6 */  lwc1       $f12, 0x0($17)
/* DEEB0 001DEDB0 46A30046 */  mov.s      $f13, $f20
/* DEEB4 001DEDB4 0200013C */  lui        $at, (0x20000 >> 16)
/* DEEB8 001DEDB8 21084100 */  addu       $at, $2, $at
/* DEEBC 001DEDBC 54E42EC4 */  lwc1       $f14, -0x1BAC($at)
/* DEEC0 001DEDC0 28260070 */  paddub     $4, $0, $0
/* DEEC4 001DEDC4 748E040C */  jal        AngleInterpolate__Ffffi
/* DEEC8 001DEDC8 00000000 */   nop
/* DEECC 001DEDCC 000020E6 */  swc1       $f0, 0x0($17)
/* DEED0 001DEDD0 9000A38E */  lw         $3, 0x90($21)
/* DEED4 001DEDD4 10350224 */  addiu      $2, $0, 0x3510
/* DEED8 001DEDD8 18106200 */  mult       $2, $3, $2
/* DEEDC 001DEDDC 2110A202 */  addu       $2, $21, $2
/* DEEE0 001DEDE0 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* DEEE4 001DEDE4 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* DEEE8 001DEDE8 21204100 */  addu       $4, $2, $at
/* DEEEC 001DEDEC 2001A527 */  addiu      $5, $sp, 0x120
/* DEEF0 001DEDF0 A000998C */  lw         $25, 0xA0($4)
/* DEEF4 001DEDF4 3400398F */  lw         $25, 0x34($25)
/* DEEF8 001DEDF8 09F82003 */  jalr       $25
/* DEEFC 001DEDFC 00000000 */   nop
/* DEF00 001DEE00 00002CC6 */  lwc1       $f12, 0x0($17)
/* DEF04 001DEE04 46A30046 */  mov.s      $f13, $f20
/* DEF08 001DEE08 9C858EC7 */  lwc1       $f14, -0x7A64($gp)
/* DEF0C 001DEE0C CC8E040C */  jal        AngleCmp__Ffff
/* DEF10 001DEE10 00000000 */   nop
/* DEF14 001DEE14 0B004014 */  bnez       $2, .L001DEE44
/* DEF18 001DEE18 00000000 */   nop
/* DEF1C 001DEE1C 9000A38E */  lw         $3, 0x90($21)
/* DEF20 001DEE20 80100300 */  sll        $2, $3, 2
/* DEF24 001DEE24 21184300 */  addu       $3, $2, $3
/* DEF28 001DEE28 80100300 */  sll        $2, $3, 2
/* DEF2C 001DEE2C 21106200 */  addu       $2, $3, $2
/* DEF30 001DEE30 00110200 */  sll        $2, $2, 4
/* DEF34 001DEE34 21105500 */  addu       $2, $2, $21
/* DEF38 001DEE38 0200013C */  lui        $at, (0x20000 >> 16)
/* DEF3C 001DEE3C 21084100 */  addu       $at, $2, $at
/* DEF40 001DEE40 54E420AC */  sw         $0, -0x1BAC($at)
.L001DEE44:
/* DEF44 001DEE44 9000A38E */  lw         $3, 0x90($21)
/* DEF48 001DEE48 80100300 */  sll        $2, $3, 2
/* DEF4C 001DEE4C 21184300 */  addu       $3, $2, $3
/* DEF50 001DEE50 80100300 */  sll        $2, $3, 2
/* DEF54 001DEE54 21106200 */  addu       $2, $3, $2
/* DEF58 001DEE58 00110200 */  sll        $2, $2, 4
/* DEF5C 001DEE5C 21105500 */  addu       $2, $2, $21
/* DEF60 001DEE60 0100013C */  lui        $at, (0x1E468 >> 16)
/* DEF64 001DEE64 68E42134 */  ori        $at, $at, (0x1E468 & 0xFFFF)
/* DEF68 001DEE68 21184100 */  addu       $3, $2, $at
/* DEF6C 001DEE6C 0000628C */  lw         $2, 0x0($3)
/* DEF70 001DEE70 03004018 */  blez       $2, .L001DEE80
/* DEF74 001DEE74 00000000 */   nop
/* DEF78 001DEE78 FFFF4224 */  addiu      $2, $2, -0x1
/* DEF7C 001DEE7C 000062AC */  sw         $2, 0x0($3)
.L001DEE80:
/* DEF80 001DEE80 9000A38E */  lw         $3, 0x90($21)
/* DEF84 001DEE84 80100300 */  sll        $2, $3, 2
/* DEF88 001DEE88 21184300 */  addu       $3, $2, $3
/* DEF8C 001DEE8C 80100300 */  sll        $2, $3, 2
/* DEF90 001DEE90 21106200 */  addu       $2, $3, $2
/* DEF94 001DEE94 00110200 */  sll        $2, $2, 4
/* DEF98 001DEE98 21105500 */  addu       $2, $2, $21
/* DEF9C 001DEE9C 0100013C */  lui        $at, (0x1E478 >> 16)
/* DEFA0 001DEEA0 78E42134 */  ori        $at, $at, (0x1E478 & 0xFFFF)
/* DEFA4 001DEEA4 21184100 */  addu       $3, $2, $at
/* DEFA8 001DEEA8 0000628C */  lw         $2, 0x0($3)
/* DEFAC 001DEEAC 03004018 */  blez       $2, .L001DEEBC
/* DEFB0 001DEEB0 00000000 */   nop
/* DEFB4 001DEEB4 FFFF4224 */  addiu      $2, $2, -0x1
/* DEFB8 001DEEB8 000062AC */  sw         $2, 0x0($3)
.L001DEEBC:
/* DEFBC 001DEEBC 9000A78E */  lw         $7, 0x90($21)
/* DEFC0 001DEEC0 40100700 */  sll        $2, $7, 1
/* DEFC4 001DEEC4 21104700 */  addu       $2, $2, $7
/* DEFC8 001DEEC8 00110200 */  sll        $2, $2, 4
/* DEFCC 001DEECC 21205500 */  addu       $4, $2, $21
/* DEFD0 001DEED0 0600013C */  lui        $at, (0x60000 >> 16)
/* DEFD4 001DEED4 21088100 */  addu       $at, $4, $at
/* DEFD8 001DEED8 74FF238C */  lw         $3, -0x8C($at)
/* DEFDC 001DEEDC 02000224 */  addiu      $2, $0, 0x2
/* DEFE0 001DEEE0 38006214 */  bne        $3, $2, .L001DEFC4
/* DEFE4 001DEEE4 00000000 */   nop
/* DEFE8 001DEEE8 0500013C */  lui        $at, (0x5FF50 >> 16)
/* DEFEC 001DEEEC 50FF2134 */  ori        $at, $at, (0x5FF50 & 0xFFFF)
/* DEFF0 001DEEF0 21308100 */  addu       $6, $4, $at
/* DEFF4 001DEEF4 0500013C */  lui        $at, (0x5FF60 >> 16)
/* DEFF8 001DEEF8 60FF2134 */  ori        $at, $at, (0x5FF60 & 0xFFFF)
/* DEFFC 001DEEFC 21288100 */  addu       $5, $4, $at
/* DF000 001DEF00 80100700 */  sll        $2, $7, 2
/* DF004 001DEF04 21184700 */  addu       $3, $2, $7
/* DF008 001DEF08 80100300 */  sll        $2, $3, 2
/* DF00C 001DEF0C 21106200 */  addu       $2, $3, $2
/* DF010 001DEF10 00110200 */  sll        $2, $2, 4
/* DF014 001DEF14 21105500 */  addu       $2, $2, $21
/* DF018 001DEF18 0200013C */  lui        $at, (0x20000 >> 16)
/* DF01C 001DEF1C 21084100 */  addu       $at, $2, $at
/* DF020 001DEF20 7CE43184 */  lh         $17, -0x1B84($at)
/* DF024 001DEF24 E89D928F */  lw         $18, -0x6218($gp)
/* DF028 001DEF28 60A10234 */  ori        $2, $0, 0xA160
/* DF02C 001DEF2C 18102202 */  mult       $2, $17, $2
/* DF030 001DEF30 21204202 */  addu       $4, $18, $2
/* DF034 001DEF34 FFFF0724 */  addiu      $7, $0, -0x1
/* DF038 001DEF38 2846E070 */  paddub     $8, $7, $0
/* DF03C 001DEF3C 284E0070 */  paddub     $9, $0, $0
/* DF040 001DEF40 28560070 */  paddub     $10, $0, $0
/* DF044 001DEF44 285EE070 */  paddub     $11, $7, $0
/* DF048 001DEF48 58B7060C */  jal        Set__12CSHOT_EFFECTFPfPfiiiP6CFramei
/* DF04C 001DEF4C 00000000 */   nop
/* DF050 001DEF50 0300013C */  lui        $at, (0x326E0 >> 16)
/* DF054 001DEF54 21084102 */  addu       $at, $18, $at
/* DF058 001DEF58 E02631AC */  sw         $17, (0x326E0 & 0xFFFF)($at)
/* DF05C 001DEF5C E89D848F */  lw         $4, -0x6218($gp)
/* DF060 001DEF60 9000A58E */  lw         $5, 0x90($21)
/* DF064 001DEF64 70B9060C */  jal        SetUserID2__17CSHOT_EFFECT_PACKFi
/* DF068 001DEF68 00000000 */   nop
/* DF06C 001DEF6C 9000A38E */  lw         $3, 0x90($21)
/* DF070 001DEF70 40100300 */  sll        $2, $3, 1
/* DF074 001DEF74 21104300 */  addu       $2, $2, $3
/* DF078 001DEF78 00110200 */  sll        $2, $2, 4
/* DF07C 001DEF7C 21105500 */  addu       $2, $2, $21
/* DF080 001DEF80 0600013C */  lui        $at, (0x60000 >> 16)
/* DF084 001DEF84 21084100 */  addu       $at, $2, $at
/* DF088 001DEF88 78FF258C */  lw         $5, -0x88($at)
/* DF08C 001DEF8C FFFF0224 */  addiu      $2, $0, -0x1
/* DF090 001DEF90 0400A210 */  beq        $5, $2, .L001DEFA4
/* DF094 001DEF94 00000000 */   nop
/* DF098 001DEF98 E89D848F */  lw         $4, -0x6218($gp)
/* DF09C 001DEF9C 84B9060C */  jal        SetDmg__17CSHOT_EFFECT_PACKFi
/* DF0A0 001DEFA0 00000000 */   nop
.L001DEFA4:
/* DF0A4 001DEFA4 9000A38E */  lw         $3, 0x90($21)
/* DF0A8 001DEFA8 40100300 */  sll        $2, $3, 1
/* DF0AC 001DEFAC 21104300 */  addu       $2, $2, $3
/* DF0B0 001DEFB0 00110200 */  sll        $2, $2, 4
/* DF0B4 001DEFB4 21105500 */  addu       $2, $2, $21
/* DF0B8 001DEFB8 0600013C */  lui        $at, (0x60000 >> 16)
/* DF0BC 001DEFBC 21084100 */  addu       $at, $2, $at
/* DF0C0 001DEFC0 74FF20AC */  sw         $0, -0x8C($at)
.L001DEFC4:
/* DF0C4 001DEFC4 9000A78E */  lw         $7, 0x90($21)
/* DF0C8 001DEFC8 40100700 */  sll        $2, $7, 1
/* DF0CC 001DEFCC 21104700 */  addu       $2, $2, $7
/* DF0D0 001DEFD0 00110200 */  sll        $2, $2, 4
/* DF0D4 001DEFD4 21205500 */  addu       $4, $2, $21
/* DF0D8 001DEFD8 0600013C */  lui        $at, (0x60274 >> 16)
/* DF0DC 001DEFDC 21088100 */  addu       $at, $4, $at
/* DF0E0 001DEFE0 7402238C */  lw         $3, (0x60274 & 0xFFFF)($at)
/* DF0E4 001DEFE4 02000224 */  addiu      $2, $0, 0x2
/* DF0E8 001DEFE8 38006214 */  bne        $3, $2, .L001DF0CC
/* DF0EC 001DEFEC 00000000 */   nop
/* DF0F0 001DEFF0 0600013C */  lui        $at, (0x60250 >> 16)
/* DF0F4 001DEFF4 50022134 */  ori        $at, $at, (0x60250 & 0xFFFF)
/* DF0F8 001DEFF8 21308100 */  addu       $6, $4, $at
/* DF0FC 001DEFFC 0600013C */  lui        $at, (0x60260 >> 16)
/* DF100 001DF000 60022134 */  ori        $at, $at, (0x60260 & 0xFFFF)
/* DF104 001DF004 21288100 */  addu       $5, $4, $at
/* DF108 001DF008 80100700 */  sll        $2, $7, 2
/* DF10C 001DF00C 21184700 */  addu       $3, $2, $7
/* DF110 001DF010 80100300 */  sll        $2, $3, 2
/* DF114 001DF014 21106200 */  addu       $2, $3, $2
/* DF118 001DF018 00110200 */  sll        $2, $2, 4
/* DF11C 001DF01C 21105500 */  addu       $2, $2, $21
/* DF120 001DF020 0200013C */  lui        $at, (0x20000 >> 16)
/* DF124 001DF024 21084100 */  addu       $at, $2, $at
/* DF128 001DF028 7EE43184 */  lh         $17, -0x1B82($at)
/* DF12C 001DF02C E89D928F */  lw         $18, -0x6218($gp)
/* DF130 001DF030 60A10234 */  ori        $2, $0, 0xA160
/* DF134 001DF034 18102202 */  mult       $2, $17, $2
/* DF138 001DF038 21204202 */  addu       $4, $18, $2
/* DF13C 001DF03C FFFF0724 */  addiu      $7, $0, -0x1
/* DF140 001DF040 2846E070 */  paddub     $8, $7, $0
/* DF144 001DF044 284E0070 */  paddub     $9, $0, $0
/* DF148 001DF048 28560070 */  paddub     $10, $0, $0
/* DF14C 001DF04C 285EE070 */  paddub     $11, $7, $0
/* DF150 001DF050 58B7060C */  jal        Set__12CSHOT_EFFECTFPfPfiiiP6CFramei
/* DF154 001DF054 00000000 */   nop
/* DF158 001DF058 0300013C */  lui        $at, (0x326E0 >> 16)
/* DF15C 001DF05C 21084102 */  addu       $at, $18, $at
/* DF160 001DF060 E02631AC */  sw         $17, (0x326E0 & 0xFFFF)($at)
/* DF164 001DF064 E89D848F */  lw         $4, -0x6218($gp)
/* DF168 001DF068 9000A58E */  lw         $5, 0x90($21)
/* DF16C 001DF06C 70B9060C */  jal        SetUserID2__17CSHOT_EFFECT_PACKFi
/* DF170 001DF070 00000000 */   nop
/* DF174 001DF074 9000A38E */  lw         $3, 0x90($21)
/* DF178 001DF078 40100300 */  sll        $2, $3, 1
/* DF17C 001DF07C 21104300 */  addu       $2, $2, $3
/* DF180 001DF080 00110200 */  sll        $2, $2, 4
/* DF184 001DF084 21105500 */  addu       $2, $2, $21
/* DF188 001DF088 0600013C */  lui        $at, (0x60278 >> 16)
/* DF18C 001DF08C 21084100 */  addu       $at, $2, $at
/* DF190 001DF090 7802258C */  lw         $5, (0x60278 & 0xFFFF)($at)
/* DF194 001DF094 FFFF0224 */  addiu      $2, $0, -0x1
/* DF198 001DF098 0400A210 */  beq        $5, $2, .L001DF0AC
/* DF19C 001DF09C 00000000 */   nop
/* DF1A0 001DF0A0 E89D848F */  lw         $4, -0x6218($gp)
/* DF1A4 001DF0A4 84B9060C */  jal        SetDmg__17CSHOT_EFFECT_PACKFi
/* DF1A8 001DF0A8 00000000 */   nop
.L001DF0AC:
/* DF1AC 001DF0AC 9000A38E */  lw         $3, 0x90($21)
/* DF1B0 001DF0B0 40100300 */  sll        $2, $3, 1
/* DF1B4 001DF0B4 21104300 */  addu       $2, $2, $3
/* DF1B8 001DF0B8 00110200 */  sll        $2, $2, 4
/* DF1BC 001DF0BC 21105500 */  addu       $2, $2, $21
/* DF1C0 001DF0C0 0600013C */  lui        $at, (0x60274 >> 16)
/* DF1C4 001DF0C4 21084100 */  addu       $at, $2, $at
/* DF1C8 001DF0C8 740220AC */  sw         $0, (0x60274 & 0xFFFF)($at)
.L001DF0CC:
/* DF1CC 001DF0CC 2826A072 */  paddub     $4, $21, $0
/* DF1D0 001DF0D0 5C61070C */  jal        PalletStep__12CMonstorUnitFv
/* DF1D4 001DF0D4 00000000 */   nop
/* DF1D8 001DF0D8 2826A072 */  paddub     $4, $21, $0
/* DF1DC 001DF0DC 6462070C */  jal        SoundCheck__12CMonstorUnitFv
/* DF1E0 001DF0E0 00000000 */   nop
/* DF1E4 001DF0E4 9000A48E */  lw         $4, 0x90($21)
/* DF1E8 001DF0E8 80180400 */  sll        $3, $4, 2
/* DF1EC 001DF0EC 21206400 */  addu       $4, $3, $4
/* DF1F0 001DF0F0 80180400 */  sll        $3, $4, 2
/* DF1F4 001DF0F4 21188300 */  addu       $3, $4, $3
/* DF1F8 001DF0F8 00190300 */  sll        $3, $3, 4
/* DF1FC 001DF0FC 21187500 */  addu       $3, $3, $21
/* DF200 001DF100 0200013C */  lui        $at, (0x20000 >> 16)
/* DF204 001DF104 21086100 */  addu       $at, $3, $at
/* DF208 001DF108 D0E3248C */  lw         $4, -0x1C30($at)
/* DF20C 001DF10C FFFF0324 */  addiu      $3, $0, -0x1
/* DF210 001DF110 24028314 */  bne        $4, $3, .L001DF9A4
/* DF214 001DF114 00000000 */   nop
/* DF218 001DF118 789C848F */  lw         $4, -0x6388($gp)
/* DF21C 001DF11C 04009180 */  lb         $17, 0x4($4)
/* DF220 001DF120 21102402 */  addu       $2, $17, $4
/* DF224 001DF124 40434380 */  lb         $3, 0x4340($2)
/* DF228 001DF128 40110300 */  sll        $2, $3, 5
/* DF22C 001DF12C 23104300 */  subu       $2, $2, $3
/* DF230 001DF130 C0180200 */  sll        $3, $2, 3
/* DF234 001DF134 A80A0224 */  addiu      $2, $0, 0xAA8
/* DF238 001DF138 18102202 */  mult       $2, $17, $2
/* DF23C 001DF13C 21108200 */  addu       $2, $4, $2
/* DF240 001DF140 21104300 */  addu       $2, $2, $3
/* DF244 001DF144 0C455324 */  addiu      $19, $2, 0x450C
/* DF248 001DF148 28960070 */  paddub     $18, $0, $0
/* DF24C 001DF14C 282E2072 */  paddub     $5, $17, $0
/* DF250 001DF150 2CF9060C */  jal        CheckDefaultWeapon__14CDngStatusDataFi
/* DF254 001DF154 00000000 */   nop
/* DF258 001DF158 02004014 */  bnez       $2, .L001DF164
/* DF25C 001DF15C 00000000 */   nop
/* DF260 001DF160 01001224 */  addiu      $18, $0, 0x1
.L001DF164:
/* DF264 001DF164 00006486 */  lh         $4, 0x0($19)
/* DF268 001DF168 0C010324 */  addiu      $3, $0, 0x10C
/* DF26C 001DF16C 08008314 */  bne        $4, $3, .L001DF190
/* DF270 001DF170 00000000 */   nop
/* DF274 001DF174 1C8D848F */  lw         $4, -0x72E4($gp)
/* DF278 001DF178 30000524 */  addiu      $5, $0, 0x30
/* DF27C 001DF17C 8060050C */  jal        GetGameFlag__9CSaveDataFi
/* DF280 001DF180 00000000 */   nop
/* DF284 001DF184 02004014 */  bnez       $2, .L001DF190
/* DF288 001DF188 00000000 */   nop
/* DF28C 001DF18C 01001224 */  addiu      $18, $0, 0x1
.L001DF190:
/* DF290 001DF190 9000A48E */  lw         $4, 0x90($21)
/* DF294 001DF194 80180400 */  sll        $3, $4, 2
/* DF298 001DF198 21206400 */  addu       $4, $3, $4
/* DF29C 001DF19C 80180400 */  sll        $3, $4, 2
/* DF2A0 001DF1A0 21188300 */  addu       $3, $4, $3
/* DF2A4 001DF1A4 00190300 */  sll        $3, $3, 4
/* DF2A8 001DF1A8 21187500 */  addu       $3, $3, $21
/* DF2AC 001DF1AC 0200013C */  lui        $at, (0x20000 >> 16)
/* DF2B0 001DF1B0 21086100 */  addu       $at, $3, $at
/* DF2B4 001DF1B4 D4E3238C */  lw         $3, -0x1C2C($at)
/* DF2B8 001DF1B8 56007114 */  bne        $3, $17, .L001DF314
/* DF2BC 001DF1BC 00000000 */   nop
/* DF2C0 001DF1C0 54004016 */  bnez       $18, .L001DF314
/* DF2C4 001DF1C4 00000000 */   nop
/* DF2C8 001DF1C8 28266072 */  paddub     $4, $19, $0
/* DF2CC 001DF1CC 20C8080C */  jal        GetWeaponMaxExp__FP11WEAPON_HAVE
/* DF2D0 001DF1D0 00000000 */   nop
/* DF2D4 001DF1D4 28964070 */  paddub     $18, $2, $0
/* DF2D8 001DF1D8 9000A88E */  lw         $8, 0x90($21)
/* DF2DC 001DF1DC 80180800 */  sll        $3, $8, 2
/* DF2E0 001DF1E0 21306800 */  addu       $6, $3, $8
/* DF2E4 001DF1E4 80180600 */  sll        $3, $6, 2
/* DF2E8 001DF1E8 2118C300 */  addu       $3, $6, $3
/* DF2EC 001DF1EC 00190300 */  sll        $3, $3, 4
/* DF2F0 001DF1F0 21187500 */  addu       $3, $3, $21
/* DF2F4 001DF1F4 0200013C */  lui        $at, (0x20000 >> 16)
/* DF2F8 001DF1F8 21086100 */  addu       $at, $3, $at
/* DF2FC 001DF1FC 80E4278C */  lw         $7, -0x1B80($at)
/* DF300 001DF200 4400A38E */  lw         $3, 0x44($21)
/* DF304 001DF204 02006010 */  beqz       $3, .L001DF210
/* DF308 001DF208 00000000 */   nop
/* DF30C 001DF20C 40380700 */  sll        $7, $7, 1
.L001DF210:
/* DF310 001DF210 C0180800 */  sll        $3, $8, 3
/* DF314 001DF214 21306800 */  addu       $6, $3, $8
/* DF318 001DF218 C0180600 */  sll        $3, $6, 3
/* DF31C 001DF21C 2118C300 */  addu       $3, $6, $3
/* DF320 001DF220 00190300 */  sll        $3, $3, 4
/* DF324 001DF224 21187500 */  addu       $3, $3, $21
/* DF328 001DF228 0500013C */  lui        $at, (0x55754 >> 16)
/* DF32C 001DF22C 21086100 */  addu       $at, $3, $at
/* DF330 001DF230 5457238C */  lw         $3, (0x55754 & 0xFFFF)($at)
/* DF334 001DF234 00206330 */  andi       $3, $3, 0x2000
/* DF338 001DF238 09006010 */  beqz       $3, .L001DF260
/* DF33C 001DF23C 00000000 */   nop
/* DF340 001DF240 00008744 */  mtc1       $7, $f0
/* DF344 001DF244 00000000 */  nop
/* DF348 001DF248 60008046 */  cvt.s.w    $f1, $f0
/* DF34C 001DF24C 088380C7 */  lwc1       $f0, -0x7CF8($gp)
/* DF350 001DF250 020B0046 */  mul.s      $f12, $f1, $f0
/* DF354 001DF254 2C44040C */  jal        fptosi
/* DF358 001DF258 00000000 */   nop
/* DF35C 001DF25C 283E4070 */  paddub     $7, $2, $0
.L001DF260:
/* DF360 001DF260 789C838F */  lw         $3, -0x6388($gp)
/* DF364 001DF264 0100013C */  lui        $at, (0x10000 >> 16)
/* DF368 001DF268 21086100 */  addu       $at, $3, $at
/* DF36C 001DF26C 108B248C */  lw         $4, -0x74F0($at)
/* DF370 001DF270 0A000324 */  addiu      $3, $0, 0xA
/* DF374 001DF274 0A008314 */  bne        $4, $3, .L001DF2A0
/* DF378 001DF278 00000000 */   nop
/* DF37C 001DF27C 14006386 */  lh         $3, 0x14($19)
/* DF380 001DF280 23186700 */  subu       $3, $3, $7
/* DF384 001DF284 140063A6 */  sh         $3, 0x14($19)
/* DF388 001DF288 14006386 */  lh         $3, 0x14($19)
/* DF38C 001DF28C 2100601C */  bgtz       $3, .L001DF314
/* DF390 001DF290 00000000 */   nop
/* DF394 001DF294 140060A6 */  sh         $0, 0x14($19)
/* DF398 001DF298 1E000010 */  b          .L001DF314
/* DF39C 001DF29C 00000000 */   nop
.L001DF2A0:
/* DF3A0 001DF2A0 14006386 */  lh         $3, 0x14($19)
/* DF3A4 001DF2A4 2A087200 */  slt        $at, $3, $18
/* DF3A8 001DF2A8 1A002010 */  beqz       $at, .L001DF314
/* DF3AC 001DF2AC 00000000 */   nop
/* DF3B0 001DF2B0 21206700 */  addu       $4, $3, $7
/* DF3B4 001DF2B4 2A189200 */  slt        $3, $4, $18
/* DF3B8 001DF2B8 15006014 */  bnez       $3, .L001DF310
/* DF3BC 001DF2BC 00000000 */   nop
/* DF3C0 001DF2C0 140072A6 */  sh         $18, 0x14($19)
/* DF3C4 001DF2C4 00006486 */  lh         $4, 0x0($19)
/* DF3C8 001DF2C8 0044070C */  jal        GetCommonItemDataSystemMsg__Fi
/* DF3CC 001DF2CC 00000000 */   nop
/* DF3D0 001DF2D0 EA01013C */  lui        $at, (0x1EA769C >> 16)
/* DF3D4 001DF2D4 9C7622AC */  sw         $2, (0x1EA769C & 0xFFFF)($at)
/* DF3D8 001DF2D8 02006386 */  lh         $3, 0x2($19)
/* DF3DC 001DF2DC EA01013C */  lui        $at, (0x1EA76A4 >> 16)
/* DF3E0 001DF2E0 A47623AC */  sw         $3, (0x1EA76A4 & 0xFFFF)($at)
/* DF3E4 001DF2E4 96000324 */  addiu      $3, $0, 0x96
/* DF3E8 001DF2E8 EA01013C */  lui        $at, (0x1EA76B4 >> 16)
/* DF3EC 001DF2EC B47623AC */  sw         $3, (0x1EA76B4 & 0xFFFF)($at)
/* DF3F0 001DF2F0 E0010324 */  addiu      $3, $0, 0x1E0
/* DF3F4 001DF2F4 EA01013C */  lui        $at, (0x1EA7694 >> 16)
/* DF3F8 001DF2F8 947623AC */  sw         $3, (0x1EA7694 & 0xFFFF)($at)
/* DF3FC 001DF2FC EA01013C */  lui        $at, (0x1EA76AC >> 16)
/* DF400 001DF300 AC7620AC */  sw         $0, (0x1EA76AC & 0xFFFF)($at)
/* DF404 001DF304 140072A6 */  sh         $18, 0x14($19)
/* DF408 001DF308 02000010 */  b          .L001DF314
/* DF40C 001DF30C 00000000 */   nop
.L001DF310:
/* DF410 001DF310 140064A6 */  sh         $4, 0x14($19)
.L001DF314:
/* DF414 001DF314 9000A48E */  lw         $4, 0x90($21)
/* DF418 001DF318 C0180400 */  sll        $3, $4, 3
/* DF41C 001DF31C 21206400 */  addu       $4, $3, $4
/* DF420 001DF320 C0180400 */  sll        $3, $4, 3
/* DF424 001DF324 21188300 */  addu       $3, $4, $3
/* DF428 001DF328 00190300 */  sll        $3, $3, 4
/* DF42C 001DF32C 21187500 */  addu       $3, $3, $21
/* DF430 001DF330 0500013C */  lui        $at, (0x55754 >> 16)
/* DF434 001DF334 21086100 */  addu       $at, $3, $at
/* DF438 001DF338 5457238C */  lw         $3, (0x55754 & 0xFFFF)($at)
/* DF43C 001DF33C 10006330 */  andi       $3, $3, 0x10
/* DF440 001DF340 08006010 */  beqz       $3, .L001DF364
/* DF444 001DF344 00000000 */   nop
/* DF448 001DF348 7F43023C */  lui        $2, (0x437F0000 >> 16)
/* DF44C 001DF34C 00608244 */  mtc1       $2, $f12
/* DF450 001DF350 789C848F */  lw         $4, -0x6388($gp)
/* DF454 001DF354 282E2072 */  paddub     $5, $17, $0
/* DF458 001DF358 0A000624 */  addiu      $6, $0, 0xA
/* DF45C 001DF35C 44F9060C */  jal        AddDrink__11CUserStatusFisf
/* DF460 001DF360 00000000 */   nop
.L001DF364:
/* DF464 001DF364 9000A58E */  lw         $5, 0x90($21)
/* DF468 001DF368 80180500 */  sll        $3, $5, 2
/* DF46C 001DF36C 21206500 */  addu       $4, $3, $5
/* DF470 001DF370 80180400 */  sll        $3, $4, 2
/* DF474 001DF374 21188300 */  addu       $3, $4, $3
/* DF478 001DF378 00190300 */  sll        $3, $3, 4
/* DF47C 001DF37C 21187500 */  addu       $3, $3, $21
/* DF480 001DF380 0200013C */  lui        $at, (0x20000 >> 16)
/* DF484 001DF384 21086100 */  addu       $at, $3, $at
/* DF488 001DF388 0CE4238C */  lw         $3, -0x1BF4($at)
/* DF48C 001DF38C 3C006018 */  blez       $3, .L001DF480
/* DF490 001DF390 00000000 */   nop
/* DF494 001DF394 10350224 */  addiu      $2, $0, 0x3510
/* DF498 001DF398 1810A200 */  mult       $2, $5, $2
/* DF49C 001DF39C 2110A202 */  addu       $2, $21, $2
/* DF4A0 001DF3A0 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* DF4A4 001DF3A4 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* DF4A8 001DF3A8 21204100 */  addu       $4, $2, $at
/* DF4AC 001DF3AC 4001A527 */  addiu      $5, $sp, 0x140
/* DF4B0 001DF3B0 A000998C */  lw         $25, 0xA0($4)
/* DF4B4 001DF3B4 A000398F */  lw         $25, 0xA0($25)
/* DF4B8 001DF3B8 09F82003 */  jalr       $25
/* DF4BC 001DF3BC 00000000 */   nop
/* DF4C0 001DF3C0 4001A0C7 */  lwc1       $f0, 0x140($sp)
/* DF4C4 001DF3C4 C03F023C */  lui        $2, (0x3FC00000 >> 16)
/* DF4C8 001DF3C8 00108244 */  mtc1       $2, $f2
/* DF4CC 001DF3CC 00000000 */  nop
/* DF4D0 001DF3D0 00000246 */  add.s      $f0, $f0, $f2
/* DF4D4 001DF3D4 4001A0E7 */  swc1       $f0, 0x140($sp)
/* DF4D8 001DF3D8 9000A38E */  lw         $3, 0x90($21)
/* DF4DC 001DF3DC 80100300 */  sll        $2, $3, 2
/* DF4E0 001DF3E0 21184300 */  addu       $3, $2, $3
/* DF4E4 001DF3E4 80100300 */  sll        $2, $3, 2
/* DF4E8 001DF3E8 21106200 */  addu       $2, $3, $2
/* DF4EC 001DF3EC 00110200 */  sll        $2, $2, 4
/* DF4F0 001DF3F0 21105500 */  addu       $2, $2, $21
/* DF4F4 001DF3F4 0200013C */  lui        $at, (0x20000 >> 16)
/* DF4F8 001DF3F8 21084100 */  addu       $at, $2, $at
/* DF4FC 001DF3FC 88E421C4 */  lwc1       $f1, -0x1B78($at)
/* DF500 001DF400 4401A0C7 */  lwc1       $f0, 0x144($sp)
/* DF504 001DF404 01000146 */  sub.s      $f0, $f0, $f1
/* DF508 001DF408 4401A0E7 */  swc1       $f0, 0x144($sp)
/* DF50C 001DF40C 4001A0C7 */  lwc1       $f0, 0x140($sp)
/* DF510 001DF410 00000246 */  add.s      $f0, $f0, $f2
/* DF514 001DF414 4001A0E7 */  swc1       $f0, 0x140($sp)
/* DF518 001DF418 9000A38E */  lw         $3, 0x90($21)
/* DF51C 001DF41C 80100300 */  sll        $2, $3, 2
/* DF520 001DF420 21184300 */  addu       $3, $2, $3
/* DF524 001DF424 80100300 */  sll        $2, $3, 2
/* DF528 001DF428 21106200 */  addu       $2, $3, $2
/* DF52C 001DF42C 00110200 */  sll        $2, $2, 4
/* DF530 001DF430 21105500 */  addu       $2, $2, $21
/* DF534 001DF434 089D848F */  lw         $4, -0x62F8($gp)
/* DF538 001DF438 4001A527 */  addiu      $5, $sp, 0x140
/* DF53C 001DF43C 01000624 */  addiu      $6, $0, 0x1
/* DF540 001DF440 0200013C */  lui        $at, (0x20000 >> 16)
/* DF544 001DF444 21084100 */  addu       $at, $2, $at
/* DF548 001DF448 0CE4278C */  lw         $7, -0x1BF4($at)
/* DF54C 001DF44C FFFF0824 */  addiu      $8, $0, -0x1
/* DF550 001DF450 7C5C070C */  jal        Set__11CRandomItemFPfiii
/* DF554 001DF454 00000000 */   nop
/* DF558 001DF458 9000A48E */  lw         $4, 0x90($21)
/* DF55C 001DF45C 80180400 */  sll        $3, $4, 2
/* DF560 001DF460 21206400 */  addu       $4, $3, $4
/* DF564 001DF464 80180400 */  sll        $3, $4, 2
/* DF568 001DF468 21188300 */  addu       $3, $4, $3
/* DF56C 001DF46C 00190300 */  sll        $3, $3, 4
/* DF570 001DF470 21187500 */  addu       $3, $3, $21
/* DF574 001DF474 0200013C */  lui        $at, (0x20000 >> 16)
/* DF578 001DF478 21086100 */  addu       $at, $3, $at
/* DF57C 001DF47C 08E420AC */  sw         $0, -0x1BF8($at)
.L001DF480:
/* DF580 001DF480 9000A48E */  lw         $4, 0x90($21)
/* DF584 001DF484 80180400 */  sll        $3, $4, 2
/* DF588 001DF488 21206400 */  addu       $4, $3, $4
/* DF58C 001DF48C 80180400 */  sll        $3, $4, 2
/* DF590 001DF490 21188300 */  addu       $3, $4, $3
/* DF594 001DF494 00190300 */  sll        $3, $3, 4
/* DF598 001DF498 21287500 */  addu       $5, $3, $21
/* DF59C 001DF49C 0200013C */  lui        $at, (0x20000 >> 16)
/* DF5A0 001DF4A0 2108A100 */  addu       $at, $5, $at
/* DF5A4 001DF4A4 10E42484 */  lh         $4, -0x1BF0($at)
/* DF5A8 001DF4A8 02000324 */  addiu      $3, $0, 0x2
/* DF5AC 001DF4AC 3D018310 */  beq        $4, $3, .L001DF9A4
/* DF5B0 001DF4B0 00000000 */   nop
/* DF5B4 001DF4B4 0200013C */  lui        $at, (0x20000 >> 16)
/* DF5B8 001DF4B8 2108A100 */  addu       $at, $5, $at
/* DF5BC 001DF4BC AAE42384 */  lh         $3, -0x1B56($at)
/* DF5C0 001DF4C0 38016010 */  beqz       $3, .L001DF9A4
/* DF5C4 001DF4C4 00000000 */   nop
/* DF5C8 001DF4C8 0200013C */  lui        $at, (0x20000 >> 16)
/* DF5CC 001DF4CC 2108A100 */  addu       $at, $5, $at
/* DF5D0 001DF4D0 70E42584 */  lh         $5, -0x1B90($at)
/* DF5D4 001DF4D4 2A00023C */  lui        $2, %hi(_2237_2)
/* DF5D8 001DF4D8 90CF4424 */  addiu      $4, $2, %lo(_2237_2)
/* DF5DC 001DF4DC A611040C */  jal        printf
/* DF5E0 001DF4E0 00000000 */   nop
/* DF5E4 001DF4E4 9000A38E */  lw         $3, 0x90($21)
/* DF5E8 001DF4E8 80100300 */  sll        $2, $3, 2
/* DF5EC 001DF4EC 21184300 */  addu       $3, $2, $3
/* DF5F0 001DF4F0 80100300 */  sll        $2, $3, 2
/* DF5F4 001DF4F4 21106200 */  addu       $2, $3, $2
/* DF5F8 001DF4F8 00110200 */  sll        $2, $2, 4
/* DF5FC 001DF4FC 21205500 */  addu       $4, $2, $21
/* DF600 001DF500 0200013C */  lui        $at, (0x20000 >> 16)
/* DF604 001DF504 21088100 */  addu       $at, $4, $at
/* DF608 001DF508 70E42284 */  lh         $2, -0x1B90($at)
/* DF60C 001DF50C FFFF0324 */  addiu      $3, $0, -0x1
/* DF610 001DF510 27004314 */  bne        $2, $3, .L001DF5B0
/* DF614 001DF514 00000000 */   nop
/* DF618 001DF518 0200013C */  lui        $at, (0x20000 >> 16)
/* DF61C 001DF51C 21088100 */  addu       $at, $4, $at
/* DF620 001DF520 B0E42284 */  lh         $2, -0x1B50($at)
/* DF624 001DF524 22004310 */  beq        $2, $3, .L001DF5B0
/* DF628 001DF528 00000000 */   nop
/* DF62C 001DF52C BE11040C */  jal        rand
/* DF630 001DF530 00000000 */   nop
/* DF634 001DF534 00008244 */  mtc1       $2, $f0
/* DF638 001DF538 00000000 */  nop
/* DF63C 001DF53C 60008046 */  cvt.s.w    $f1, $f0
/* DF640 001DF540 C842023C */  lui        $2, (0x42C80000 >> 16)
/* DF644 001DF544 00008244 */  mtc1       $2, $f0
/* DF648 001DF548 00000000 */  nop
/* DF64C 001DF54C 42000146 */  mul.s      $f1, $f0, $f1
/* DF650 001DF550 004F023C */  lui        $2, (0x4F000000 >> 16)
/* DF654 001DF554 00008244 */  mtc1       $2, $f0
/* DF658 001DF558 00000000 */  nop
/* DF65C 001DF55C 43080046 */  div.s      $f1, $f1, $f0
/* DF660 001DF560 2041023C */  lui        $2, (0x41200000 >> 16)
/* DF664 001DF564 00008244 */  mtc1       $2, $f0
/* DF668 001DF568 00000000 */  nop
/* DF66C 001DF56C 34080046 */  c.lt.s     $f1, $f0
/* DF670 001DF570 00000000 */  nop
/* DF674 001DF574 0E000045 */  bc1f       .L001DF5B0
/* DF678 001DF578 00000000 */   nop
/* DF67C 001DF57C 9000A38E */  lw         $3, 0x90($21)
/* DF680 001DF580 80100300 */  sll        $2, $3, 2
/* DF684 001DF584 21184300 */  addu       $3, $2, $3
/* DF688 001DF588 80100300 */  sll        $2, $3, 2
/* DF68C 001DF58C 21106200 */  addu       $2, $3, $2
/* DF690 001DF590 00110200 */  sll        $2, $2, 4
/* DF694 001DF594 21185500 */  addu       $3, $2, $21
/* DF698 001DF598 0200013C */  lui        $at, (0x20000 >> 16)
/* DF69C 001DF59C 21086100 */  addu       $at, $3, $at
/* DF6A0 001DF5A0 B0E42284 */  lh         $2, -0x1B50($at)
/* DF6A4 001DF5A4 0200013C */  lui        $at, (0x20000 >> 16)
/* DF6A8 001DF5A8 21086100 */  addu       $at, $3, $at
/* DF6AC 001DF5AC 70E422A4 */  sh         $2, -0x1B90($at)
.L001DF5B0:
/* DF6B0 001DF5B0 9000A38E */  lw         $3, 0x90($21)
/* DF6B4 001DF5B4 80100300 */  sll        $2, $3, 2
/* DF6B8 001DF5B8 21184300 */  addu       $3, $2, $3
/* DF6BC 001DF5BC 80100300 */  sll        $2, $3, 2
/* DF6C0 001DF5C0 21106200 */  addu       $2, $3, $2
/* DF6C4 001DF5C4 00110200 */  sll        $2, $2, 4
/* DF6C8 001DF5C8 21105500 */  addu       $2, $2, $21
/* DF6CC 001DF5CC 0200013C */  lui        $at, (0x20000 >> 16)
/* DF6D0 001DF5D0 21084100 */  addu       $at, $2, $at
/* DF6D4 001DF5D4 70E42484 */  lh         $4, -0x1B90($at)
/* DF6D8 001DF5D8 FFFF0224 */  addiu      $2, $0, -0x1
/* DF6DC 001DF5DC 30008210 */  beq        $4, $2, .L001DF6A0
/* DF6E0 001DF5E0 00000000 */   nop
/* DF6E4 001DF5E4 A0D5060C */  jal        SetGateKeyStack__Fi
/* DF6E8 001DF5E8 00000000 */   nop
/* DF6EC 001DF5EC 6F004010 */  beqz       $2, .L001DF7AC
/* DF6F0 001DF5F0 00000000 */   nop
/* DF6F4 001DF5F4 9000A38E */  lw         $3, 0x90($21)
/* DF6F8 001DF5F8 10350224 */  addiu      $2, $0, 0x3510
/* DF6FC 001DF5FC 18106200 */  mult       $2, $3, $2
/* DF700 001DF600 2110A202 */  addu       $2, $21, $2
/* DF704 001DF604 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* DF708 001DF608 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* DF70C 001DF60C 21204100 */  addu       $4, $2, $at
/* DF710 001DF610 5001A527 */  addiu      $5, $sp, 0x150
/* DF714 001DF614 A000998C */  lw         $25, 0xA0($4)
/* DF718 001DF618 A000398F */  lw         $25, 0xA0($25)
/* DF71C 001DF61C 09F82003 */  jalr       $25
/* DF720 001DF620 00000000 */   nop
/* DF724 001DF624 9000A38E */  lw         $3, 0x90($21)
/* DF728 001DF628 80100300 */  sll        $2, $3, 2
/* DF72C 001DF62C 21184300 */  addu       $3, $2, $3
/* DF730 001DF630 80100300 */  sll        $2, $3, 2
/* DF734 001DF634 21106200 */  addu       $2, $3, $2
/* DF738 001DF638 00110200 */  sll        $2, $2, 4
/* DF73C 001DF63C 21105500 */  addu       $2, $2, $21
/* DF740 001DF640 0200013C */  lui        $at, (0x20000 >> 16)
/* DF744 001DF644 21084100 */  addu       $at, $2, $at
/* DF748 001DF648 88E421C4 */  lwc1       $f1, -0x1B78($at)
/* DF74C 001DF64C 5401A0C7 */  lwc1       $f0, 0x154($sp)
/* DF750 001DF650 01000146 */  sub.s      $f0, $f0, $f1
/* DF754 001DF654 5401A0E7 */  swc1       $f0, 0x154($sp)
/* DF758 001DF658 9000A38E */  lw         $3, 0x90($21)
/* DF75C 001DF65C 80100300 */  sll        $2, $3, 2
/* DF760 001DF660 21184300 */  addu       $3, $2, $3
/* DF764 001DF664 80100300 */  sll        $2, $3, 2
/* DF768 001DF668 21106200 */  addu       $2, $3, $2
/* DF76C 001DF66C 00110200 */  sll        $2, $2, 4
/* DF770 001DF670 21105500 */  addu       $2, $2, $21
/* DF774 001DF674 0200013C */  lui        $at, (0x20000 >> 16)
/* DF778 001DF678 21084100 */  addu       $at, $2, $at
/* DF77C 001DF67C 70E42884 */  lh         $8, -0x1B90($at)
/* DF780 001DF680 089D848F */  lw         $4, -0x62F8($gp)
/* DF784 001DF684 5001A527 */  addiu      $5, $sp, 0x150
/* DF788 001DF688 01000624 */  addiu      $6, $0, 0x1
/* DF78C 001DF68C FFFF0724 */  addiu      $7, $0, -0x1
/* DF790 001DF690 7C5C070C */  jal        Set__11CRandomItemFPfiii
/* DF794 001DF694 00000000 */   nop
/* DF798 001DF698 44000010 */  b          .L001DF7AC
/* DF79C 001DF69C 00000000 */   nop
.L001DF6A0:
/* DF7A0 001DF6A0 2826A072 */  paddub     $4, $21, $0
/* DF7A4 001DF6A4 5867070C */  jal        SelectAttachi__12CMonstorUnitFv
/* DF7A8 001DF6A8 00000000 */   nop
/* DF7AC 001DF6AC 288E4070 */  paddub     $17, $2, $0
/* DF7B0 001DF6B0 9000A58E */  lw         $5, 0x90($21)
/* DF7B4 001DF6B4 80180500 */  sll        $3, $5, 2
/* DF7B8 001DF6B8 21206500 */  addu       $4, $3, $5
/* DF7BC 001DF6BC 80180400 */  sll        $3, $4, 2
/* DF7C0 001DF6C0 21188300 */  addu       $3, $4, $3
/* DF7C4 001DF6C4 00310300 */  sll        $6, $3, 4
/* DF7C8 001DF6C8 2118D500 */  addu       $3, $6, $21
/* DF7CC 001DF6CC 0200013C */  lui        $at, (0x20000 >> 16)
/* DF7D0 001DF6D0 21086100 */  addu       $at, $3, $at
/* DF7D4 001DF6D4 D4E3248C */  lw         $4, -0x1C2C($at)
/* DF7D8 001DF6D8 FFFF0324 */  addiu      $3, $0, -0x1
/* DF7DC 001DF6DC 2E008314 */  bne        $4, $3, .L001DF798
/* DF7E0 001DF6E0 00000000 */   nop
/* DF7E4 001DF6E4 2C002312 */  beq        $17, $3, .L001DF798
/* DF7E8 001DF6E8 00000000 */   nop
/* DF7EC 001DF6EC 10350224 */  addiu      $2, $0, 0x3510
/* DF7F0 001DF6F0 1810A200 */  mult       $2, $5, $2
/* DF7F4 001DF6F4 2110A202 */  addu       $2, $21, $2
/* DF7F8 001DF6F8 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* DF7FC 001DF6FC D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* DF800 001DF700 21204100 */  addu       $4, $2, $at
/* DF804 001DF704 6001A527 */  addiu      $5, $sp, 0x160
/* DF808 001DF708 A000998C */  lw         $25, 0xA0($4)
/* DF80C 001DF70C A000398F */  lw         $25, 0xA0($25)
/* DF810 001DF710 09F82003 */  jalr       $25
/* DF814 001DF714 00000000 */   nop
/* DF818 001DF718 9000A38E */  lw         $3, 0x90($21)
/* DF81C 001DF71C 80100300 */  sll        $2, $3, 2
/* DF820 001DF720 21184300 */  addu       $3, $2, $3
/* DF824 001DF724 80100300 */  sll        $2, $3, 2
/* DF828 001DF728 21106200 */  addu       $2, $3, $2
/* DF82C 001DF72C 00110200 */  sll        $2, $2, 4
/* DF830 001DF730 21105500 */  addu       $2, $2, $21
/* DF834 001DF734 0200013C */  lui        $at, (0x20000 >> 16)
/* DF838 001DF738 21084100 */  addu       $at, $2, $at
/* DF83C 001DF73C 88E421C4 */  lwc1       $f1, -0x1B78($at)
/* DF840 001DF740 6401A0C7 */  lwc1       $f0, 0x164($sp)
/* DF844 001DF744 01000146 */  sub.s      $f0, $f0, $f1
/* DF848 001DF748 6401A0E7 */  swc1       $f0, 0x164($sp)
/* DF84C 001DF74C 089D848F */  lw         $4, -0x62F8($gp)
/* DF850 001DF750 6001A527 */  addiu      $5, $sp, 0x160
/* DF854 001DF754 01000624 */  addiu      $6, $0, 0x1
/* DF858 001DF758 FFFF0724 */  addiu      $7, $0, -0x1
/* DF85C 001DF75C 28462072 */  paddub     $8, $17, $0
/* DF860 001DF760 7C5C070C */  jal        Set__11CRandomItemFPfiii
/* DF864 001DF764 00000000 */   nop
/* DF868 001DF768 9000A48E */  lw         $4, 0x90($21)
/* DF86C 001DF76C 80180400 */  sll        $3, $4, 2
/* DF870 001DF770 21206400 */  addu       $4, $3, $4
/* DF874 001DF774 80180400 */  sll        $3, $4, 2
/* DF878 001DF778 21188300 */  addu       $3, $4, $3
/* DF87C 001DF77C 00190300 */  sll        $3, $3, 4
/* DF880 001DF780 21187500 */  addu       $3, $3, $21
/* DF884 001DF784 0200013C */  lui        $at, (0x20000 >> 16)
/* DF888 001DF788 21086100 */  addu       $at, $3, $at
/* DF88C 001DF78C 70E431A4 */  sh         $17, -0x1B90($at)
/* DF890 001DF790 06000010 */  b          .L001DF7AC
/* DF894 001DF794 00000000 */   nop
.L001DF798:
/* DF898 001DF798 FFFF0424 */  addiu      $4, $0, -0x1
/* DF89C 001DF79C 2118D500 */  addu       $3, $6, $21
/* DF8A0 001DF7A0 0200013C */  lui        $at, (0x20000 >> 16)
/* DF8A4 001DF7A4 21086100 */  addu       $at, $3, $at
/* DF8A8 001DF7A8 70E424A4 */  sh         $4, -0x1B90($at)
.L001DF7AC:
/* DF8AC 001DF7AC 9000A48E */  lw         $4, 0x90($21)
/* DF8B0 001DF7B0 80180400 */  sll        $3, $4, 2
/* DF8B4 001DF7B4 21206400 */  addu       $4, $3, $4
/* DF8B8 001DF7B8 80180400 */  sll        $3, $4, 2
/* DF8BC 001DF7BC 21188300 */  addu       $3, $4, $3
/* DF8C0 001DF7C0 00190300 */  sll        $3, $3, 4
/* DF8C4 001DF7C4 21187500 */  addu       $3, $3, $21
/* DF8C8 001DF7C8 0200013C */  lui        $at, (0x20000 >> 16)
/* DF8CC 001DF7CC 21086100 */  addu       $at, $3, $at
/* DF8D0 001DF7D0 70E42484 */  lh         $4, -0x1B90($at)
/* DF8D4 001DF7D4 FFFF0324 */  addiu      $3, $0, -0x1
/* DF8D8 001DF7D8 72008314 */  bne        $4, $3, .L001DF9A4
/* DF8DC 001DF7DC 00000000 */   nop
/* DF8E0 001DF7E0 BE11040C */  jal        rand
/* DF8E4 001DF7E4 00000000 */   nop
/* DF8E8 001DF7E8 00008244 */  mtc1       $2, $f0
/* DF8EC 001DF7EC 00000000 */  nop
/* DF8F0 001DF7F0 60008046 */  cvt.s.w    $f1, $f0
/* DF8F4 001DF7F4 C842023C */  lui        $2, (0x42C80000 >> 16)
/* DF8F8 001DF7F8 00008244 */  mtc1       $2, $f0
/* DF8FC 001DF7FC 00000000 */  nop
/* DF900 001DF800 42000146 */  mul.s      $f1, $f0, $f1
/* DF904 001DF804 004F023C */  lui        $2, (0x4F000000 >> 16)
/* DF908 001DF808 00008244 */  mtc1       $2, $f0
/* DF90C 001DF80C 00000000 */  nop
/* DF910 001DF810 030B0046 */  div.s      $f12, $f1, $f0
/* DF914 001DF814 2C44040C */  jal        fptosi
/* DF918 001DF818 00000000 */   nop
/* DF91C 001DF81C 9000B28E */  lw         $18, 0x90($21)
/* DF920 001DF820 80181200 */  sll        $3, $18, 2
/* DF924 001DF824 21207200 */  addu       $4, $3, $18
/* DF928 001DF828 80180400 */  sll        $3, $4, 2
/* DF92C 001DF82C 21188300 */  addu       $3, $4, $3
/* DF930 001DF830 00190300 */  sll        $3, $3, 4
/* DF934 001DF834 21207500 */  addu       $4, $3, $21
/* DF938 001DF838 0200013C */  lui        $at, (0x20000 >> 16)
/* DF93C 001DF83C 21088100 */  addu       $at, $4, $at
/* DF940 001DF840 08E4238C */  lw         $3, -0x1BF8($at)
/* DF944 001DF844 2A084300 */  slt        $at, $2, $3
/* DF948 001DF848 56002010 */  beqz       $at, .L001DF9A4
/* DF94C 001DF84C 00000000 */   nop
/* DF950 001DF850 0200013C */  lui        $at, (0x20000 >> 16)
/* DF954 001DF854 21088100 */  addu       $at, $4, $at
/* DF958 001DF858 04E4318C */  lw         $17, -0x1BFC($at)
/* DF95C 001DF85C BE11040C */  jal        rand
/* DF960 001DF860 00000000 */   nop
/* DF964 001DF864 00008244 */  mtc1       $2, $f0
/* DF968 001DF868 00000000 */  nop
/* DF96C 001DF86C 60008046 */  cvt.s.w    $f1, $f0
/* DF970 001DF870 00009144 */  mtc1       $17, $f0
/* DF974 001DF874 00000000 */  nop
/* DF978 001DF878 20008046 */  cvt.s.w    $f0, $f0
/* DF97C 001DF87C 42000146 */  mul.s      $f1, $f0, $f1
/* DF980 001DF880 0040023C */  lui        $2, (0x40000000 >> 16)
/* DF984 001DF884 00008244 */  mtc1       $2, $f0
/* DF988 001DF888 00000000 */  nop
/* DF98C 001DF88C 43080046 */  div.s      $f1, $f1, $f0
/* DF990 001DF890 004F023C */  lui        $2, (0x4F000000 >> 16)
/* DF994 001DF894 00008244 */  mtc1       $2, $f0
/* DF998 001DF898 00000000 */  nop
/* DF99C 001DF89C 030B0046 */  div.s      $f12, $f1, $f0
/* DF9A0 001DF8A0 2C44040C */  jal        fptosi
/* DF9A4 001DF8A4 00000000 */   nop
/* DF9A8 001DF8A8 21882202 */  addu       $17, $17, $2
/* DF9AC 001DF8AC C0101200 */  sll        $2, $18, 3
/* DF9B0 001DF8B0 21185200 */  addu       $3, $2, $18
/* DF9B4 001DF8B4 C0100300 */  sll        $2, $3, 3
/* DF9B8 001DF8B8 21106200 */  addu       $2, $3, $2
/* DF9BC 001DF8BC 00110200 */  sll        $2, $2, 4
/* DF9C0 001DF8C0 21105500 */  addu       $2, $2, $21
/* DF9C4 001DF8C4 0500013C */  lui        $at, (0x55754 >> 16)
/* DF9C8 001DF8C8 21084100 */  addu       $at, $2, $at
/* DF9CC 001DF8CC 5457238C */  lw         $3, (0x55754 & 0xFFFF)($at)
/* DF9D0 001DF8D0 02006230 */  andi       $2, $3, 0x2
/* DF9D4 001DF8D4 02004010 */  beqz       $2, .L001DF8E0
/* DF9D8 001DF8D8 00000000 */   nop
/* DF9DC 001DF8DC 40881100 */  sll        $17, $17, 1
.L001DF8E0:
/* DF9E0 001DF8E0 04006230 */  andi       $2, $3, 0x4
/* DF9E4 001DF8E4 10004010 */  beqz       $2, .L001DF928
/* DF9E8 001DF8E8 00000000 */   nop
/* DF9EC 001DF8EC 0200222A */  slti       $2, $17, 0x2
/* DF9F0 001DF8F0 0D004014 */  bnez       $2, .L001DF928
/* DF9F4 001DF8F4 00000000 */   nop
/* DF9F8 001DF8F8 28262072 */  paddub     $4, $17, $0
/* DF9FC 001DF8FC FC40040C */  jal        litodp
/* DFA00 001DF900 00000000 */   nop
/* DFA04 001DF904 E03F033C */  lui        $3, (0x3FE00000 >> 16)
/* DFA08 001DF908 3C280300 */  dsll32     $5, $3, 0
/* DFA0C 001DF90C 28264070 */  paddub     $4, $2, $0
/* DFA10 001DF910 9E3F040C */  jal        dpmul
/* DFA14 001DF914 00000000 */   nop
/* DFA18 001DF918 28264070 */  paddub     $4, $2, $0
/* DFA1C 001DF91C 2A41040C */  jal        dptoli
/* DFA20 001DF920 00000000 */   nop
/* DFA24 001DF924 288E4070 */  paddub     $17, $2, $0
.L001DF928:
/* DFA28 001DF928 10350224 */  addiu      $2, $0, 0x3510
/* DFA2C 001DF92C 18104202 */  mult       $2, $18, $2
/* DFA30 001DF930 2110A202 */  addu       $2, $21, $2
/* DFA34 001DF934 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* DFA38 001DF938 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* DFA3C 001DF93C 21204100 */  addu       $4, $2, $at
/* DFA40 001DF940 7001A527 */  addiu      $5, $sp, 0x170
/* DFA44 001DF944 A000998C */  lw         $25, 0xA0($4)
/* DFA48 001DF948 A000398F */  lw         $25, 0xA0($25)
/* DFA4C 001DF94C 09F82003 */  jalr       $25
/* DFA50 001DF950 00000000 */   nop
/* DFA54 001DF954 9000A38E */  lw         $3, 0x90($21)
/* DFA58 001DF958 80100300 */  sll        $2, $3, 2
/* DFA5C 001DF95C 21184300 */  addu       $3, $2, $3
/* DFA60 001DF960 80100300 */  sll        $2, $3, 2
/* DFA64 001DF964 21106200 */  addu       $2, $3, $2
/* DFA68 001DF968 00110200 */  sll        $2, $2, 4
/* DFA6C 001DF96C 21105500 */  addu       $2, $2, $21
/* DFA70 001DF970 0200013C */  lui        $at, (0x20000 >> 16)
/* DFA74 001DF974 21084100 */  addu       $at, $2, $at
/* DFA78 001DF978 88E421C4 */  lwc1       $f1, -0x1B78($at)
/* DFA7C 001DF97C 7401A0C7 */  lwc1       $f0, 0x174($sp)
/* DFA80 001DF980 01000146 */  sub.s      $f0, $f0, $f1
/* DFA84 001DF984 7401A0E7 */  swc1       $f0, 0x174($sp)
/* DFA88 001DF988 089D848F */  lw         $4, -0x62F8($gp)
/* DFA8C 001DF98C 7001A527 */  addiu      $5, $sp, 0x170
/* DFA90 001DF990 01000624 */  addiu      $6, $0, 0x1
/* DFA94 001DF994 283E2072 */  paddub     $7, $17, $0
/* DFA98 001DF998 FFFF0824 */  addiu      $8, $0, -0x1
/* DFA9C 001DF99C 7C5C070C */  jal        Set__11CRandomItemFPfiii
/* DFAA0 001DF9A0 00000000 */   nop
.L001DF9A4:
/* DFAA4 001DF9A4 01001026 */  addiu      $16, $16, 0x1
.L001DF9A8:
/* DFAA8 001DF9A8 1000032A */  slti       $3, $16, 0x10
/* DFAAC 001DF9AC A2F76014 */  bnez       $3, .L001DD838
/* DFAB0 001DF9B0 00000000 */   nop
.L001DF9B4:
/* DFAB4 001DF9B4 8000BF7B */  lq         $31, 0x80($sp)
/* DFAB8 001DF9B8 7000B67B */  lq         $22, 0x70($sp)
/* DFABC 001DF9BC 6000B57B */  lq         $21, 0x60($sp)
/* DFAC0 001DF9C0 5000B47B */  lq         $20, 0x50($sp)
/* DFAC4 001DF9C4 4000B37B */  lq         $19, 0x40($sp)
/* DFAC8 001DF9C8 3000B27B */  lq         $18, 0x30($sp)
/* DFACC 001DF9CC 2000B17B */  lq         $17, 0x20($sp)
/* DFAD0 001DF9D0 1000B07B */  lq         $16, 0x10($sp)
/* DFAD4 001DF9D4 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* DFAD8 001DF9D8 8001BD27 */  addiu      $sp, $sp, 0x180
/* DFADC 001DF9DC 0800E003 */  jr         $31
/* DFAE0 001DF9E0 00000000 */   nop
/* DFAE4 001DF9E4 00000000 */  nop
/* DFAE8 001DF9E8 00000000 */  nop
/* DFAEC 001DF9EC 00000000 */  nop
