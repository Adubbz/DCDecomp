.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetMapParts__11CEditGroundFifffi
/* A0570 001A0470 00FFBD27 */  addiu      $sp, $sp, -0x100
/* A0574 001A0474 B000BF7F */  sq         $31, 0xB0($sp)
/* A0578 001A0478 A000BE7F */  sq         $fp, 0xA0($sp)
/* A057C 001A047C 9000B77F */  sq         $23, 0x90($sp)
/* A0580 001A0480 8000B67F */  sq         $22, 0x80($sp)
/* A0584 001A0484 7000B57F */  sq         $21, 0x70($sp)
/* A0588 001A0488 6000B47F */  sq         $20, 0x60($sp)
/* A058C 001A048C 5000B37F */  sq         $19, 0x50($sp)
/* A0590 001A0490 4000B27F */  sq         $18, 0x40($sp)
/* A0594 001A0494 3000B17F */  sq         $17, 0x30($sp)
/* A0598 001A0498 2000B07F */  sq         $16, 0x20($sp)
/* A059C 001A049C 1000B8E7 */  swc1       $f24, 0x10($sp)
/* A05A0 001A04A0 0C00B7E7 */  swc1       $f23, 0xC($sp)
/* A05A4 001A04A4 0800B6E7 */  swc1       $f22, 0x8($sp)
/* A05A8 001A04A8 0400B5E7 */  swc1       $f21, 0x4($sp)
/* A05AC 001A04AC 0000B4E7 */  swc1       $f20, 0x0($sp)
/* A05B0 001A04B0 28B68070 */  paddub     $22, $4, $0
/* A05B4 001A04B4 28AEA070 */  paddub     $21, $5, $0
/* A05B8 001A04B8 86650046 */  mov.s      $f22, $f12
/* A05BC 001A04BC 466D0046 */  mov.s      $f21, $f13
/* A05C0 001A04C0 06750046 */  mov.s      $f20, $f14
/* A05C4 001A04C4 28A6C070 */  paddub     $20, $6, $0
/* A05C8 001A04C8 7086060C */  jal        CheckEffect__11CEditGroundFv
/* A05CC 001A04CC 00000000 */   nop
/* A05D0 001A04D0 04004010 */  beqz       $2, .L001A04E4
/* A05D4 001A04D4 00000000 */   nop
/* A05D8 001A04D8 FFFF0224 */  addiu      $2, $0, -0x1
/* A05DC 001A04DC B9010010 */  b          .L001A0BC4
/* A05E0 001A04E0 00000000 */   nop
.L001A04E4:
/* A05E4 001A04E4 0400A006 */  bltz       $21, .L001A04F8
/* A05E8 001A04E8 00000000 */   nop
/* A05EC 001A04EC 1800A22A */  slti       $2, $21, 0x18
/* A05F0 001A04F0 04004014 */  bnez       $2, .L001A0504
/* A05F4 001A04F4 00000000 */   nop
.L001A04F8:
/* A05F8 001A04F8 FFFF0224 */  addiu      $2, $0, -0x1
/* A05FC 001A04FC B1010010 */  b          .L001A0BC4
/* A0600 001A0500 00000000 */   nop
.L001A0504:
/* A0604 001A0504 0100013C */  lui        $at, (0x15F30 >> 16)
/* A0608 001A0508 2108C102 */  addu       $at, $22, $at
/* A060C 001A050C 305F248C */  lw         $4, (0x15F30 & 0xFFFF)($at)
/* A0610 001A0510 04008014 */  bnez       $4, .L001A0524
/* A0614 001A0514 00000000 */   nop
/* A0618 001A0518 FFFF0224 */  addiu      $2, $0, -0x1
/* A061C 001A051C A9010010 */  b          .L001A0BC4
/* A0620 001A0520 00000000 */   nop
.L001A0524:
/* A0624 001A0524 C0101500 */  sll        $2, $21, 3
/* A0628 001A0528 23185500 */  subu       $3, $2, $21
/* A062C 001A052C 80100300 */  sll        $2, $3, 2
/* A0630 001A0530 23104300 */  subu       $2, $2, $3
/* A0634 001A0534 40110200 */  sll        $2, $2, 5
/* A0638 001A0538 21808200 */  addu       $16, $4, $2
/* A063C 001A053C E800028E */  lw         $2, 0xE8($16)
/* A0640 001A0540 04004104 */  bgez       $2, .L001A0554
/* A0644 001A0544 00000000 */   nop
/* A0648 001A0548 FFFF0224 */  addiu      $2, $0, -0x1
/* A064C 001A054C 9D010010 */  b          .L001A0BC4
/* A0650 001A0550 00000000 */   nop
.L001A0554:
/* A0654 001A0554 2826C072 */  paddub     $4, $22, $0
/* A0658 001A0558 06B30046 */  mov.s      $f12, $f22
/* A065C 001A055C 46AB0046 */  mov.s      $f13, $f21
/* A0660 001A0560 86A30046 */  mov.s      $f14, $f20
/* A0664 001A0564 AC85060C */  jal        GetAreaCode__11CEditGroundFfff
/* A0668 001A0568 00000000 */   nop
/* A066C 001A056C C400A2AF */  sw         $2, 0xC4($sp)
/* A0670 001A0570 C400A28F */  lw         $2, 0xC4($sp)
/* A0674 001A0574 04004104 */  bgez       $2, .L001A0588
/* A0678 001A0578 00000000 */   nop
/* A067C 001A057C FFFF0224 */  addiu      $2, $0, -0x1
/* A0680 001A0580 90010010 */  b          .L001A0BC4
/* A0684 001A0584 00000000 */   nop
.L001A0588:
/* A0688 001A0588 80100200 */  sll        $2, $2, 2
/* A068C 001A058C 21105600 */  addu       $2, $2, $22
/* A0690 001A0590 04005224 */  addiu      $18, $2, 0x4
/* A0694 001A0594 0400578C */  lw         $23, 0x4($2)
/* A0698 001A0598 0801028E */  lw         $2, 0x108($16)
/* A069C 001A059C 04004014 */  bnez       $2, .L001A05B0
/* A06A0 001A05A0 00000000 */   nop
/* A06A4 001A05A4 FFFF0224 */  addiu      $2, $0, -0x1
/* A06A8 001A05A8 86010010 */  b          .L001A0BC4
/* A06AC 001A05AC 00000000 */   nop
.L001A05B0:
/* A06B0 001A05B0 2826E072 */  paddub     $4, $23, $0
/* A06B4 001A05B4 282E0072 */  paddub     $5, $16, $0
/* A06B8 001A05B8 06B30046 */  mov.s      $f12, $f22
/* A06BC 001A05BC 46AB0046 */  mov.s      $f13, $f21
/* A06C0 001A05C0 86A30046 */  mov.s      $f14, $f20
/* A06C4 001A05C4 28368072 */  paddub     $6, $20, $0
/* A06C8 001A05C8 80BC050C */  jal        CheckParts__9CEditAreaFP9CMapPartsfffi
/* A06CC 001A05CC 00000000 */   nop
/* A06D0 001A05D0 28F64070 */  paddub     $fp, $2, $0
/* A06D4 001A05D4 3000D326 */  addiu      $19, $22, 0x30
/* A06D8 001A05D8 FFFF1124 */  addiu      $17, $0, -0x1
/* A06DC 001A05DC 1801038E */  lw         $3, 0x118($16)
/* A06E0 001A05E0 05000224 */  addiu      $2, $0, 0x5
/* A06E4 001A05E4 06006210 */  beq        $3, $2, .L001A0600
/* A06E8 001A05E8 00000000 */   nop
/* A06EC 001A05EC 03000224 */  addiu      $2, $0, 0x3
/* A06F0 001A05F0 03006210 */  beq        $3, $2, .L001A0600
/* A06F4 001A05F4 00000000 */   nop
/* A06F8 001A05F8 3B000010 */  b          .L001A06E8
/* A06FC 001A05FC 00000000 */   nop
.L001A0600:
/* A0700 001A0600 0000448E */  lw         $4, 0x0($18)
/* A0704 001A0604 06B30046 */  mov.s      $f12, $f22
/* A0708 001A0608 46AB0046 */  mov.s      $f13, $f21
/* A070C 001A060C 86A30046 */  mov.s      $f14, $f20
/* A0710 001A0610 F8BA050C */  jal        SearchPartsID__9CEditAreaFfff
/* A0714 001A0614 00000000 */   nop
/* A0718 001A0618 288E4070 */  paddub     $17, $2, $0
/* A071C 001A061C 2B002006 */  bltz       $17, .L001A06CC
/* A0720 001A0620 00000000 */   nop
/* A0724 001A0624 2826E072 */  paddub     $4, $23, $0
/* A0728 001A0628 282E0072 */  paddub     $5, $16, $0
/* A072C 001A062C 06B30046 */  mov.s      $f12, $f22
/* A0730 001A0630 46AB0046 */  mov.s      $f13, $f21
/* A0734 001A0634 86A30046 */  mov.s      $f14, $f20
/* A0738 001A0638 C896060C */  jal        CheckDelete__FP9CEditAreaP9CMapPartsfff
/* A073C 001A063C 00000000 */   nop
/* A0740 001A0640 22004014 */  bnez       $2, .L001A06CC
/* A0744 001A0644 00000000 */   nop
/* A0748 001A0648 C0101100 */  sll        $2, $17, 3
/* A074C 001A064C 23185100 */  subu       $3, $2, $17
/* A0750 001A0650 80100300 */  sll        $2, $3, 2
/* A0754 001A0654 23104300 */  subu       $2, $2, $3
/* A0758 001A0658 40110200 */  sll        $2, $2, 5
/* A075C 001A065C 21205600 */  addu       $4, $2, $22
/* A0760 001A0660 4801838C */  lw         $3, 0x148($4)
/* A0764 001A0664 02000224 */  addiu      $2, $0, 0x2
/* A0768 001A0668 15006214 */  bne        $3, $2, .L001A06C0
/* A076C 001A066C 00000000 */   nop
/* A0770 001A0670 1801838C */  lw         $3, 0x118($4)
/* A0774 001A0674 01000224 */  addiu      $2, $0, 0x1
/* A0778 001A0678 11006214 */  bne        $3, $2, .L001A06C0
/* A077C 001A067C 00000000 */   nop
/* A0780 001A0680 30009324 */  addiu      $19, $4, 0x30
/* A0784 001A0684 28266072 */  paddub     $4, $19, $0
/* A0788 001A0688 2C6A060C */  jal        GetRotY__9CMapPartsFv
/* A078C 001A068C 00000000 */   nop
/* A0790 001A0690 28A64070 */  paddub     $20, $2, $0
/* A0794 001A0694 1801038E */  lw         $3, 0x118($16)
/* A0798 001A0698 05000224 */  addiu      $2, $0, 0x5
/* A079C 001A069C 05006210 */  beq        $3, $2, .L001A06B4
/* A07A0 001A06A0 00000000 */   nop
/* A07A4 001A06A4 0100013C */  lui        $at, (0x15F34 >> 16)
/* A07A8 001A06A8 2108C102 */  addu       $at, $22, $at
/* A07AC 001A06AC 345F228C */  lw         $2, (0x15F34 & 0xFFFF)($at)
/* A07B0 001A06B0 C00F5024 */  addiu      $16, $2, 0xFC0
.L001A06B4:
/* A07B4 001A06B4 F000158E */  lw         $21, 0xF0($16)
/* A07B8 001A06B8 10000010 */  b          .L001A06FC
/* A07BC 001A06BC 00000000 */   nop
.L001A06C0:
/* A07C0 001A06C0 FFFF0224 */  addiu      $2, $0, -0x1
/* A07C4 001A06C4 3F010010 */  b          .L001A0BC4
/* A07C8 001A06C8 00000000 */   nop
.L001A06CC:
/* A07CC 001A06CC 1801038E */  lw         $3, 0x118($16)
/* A07D0 001A06D0 01000224 */  addiu      $2, $0, 0x1
/* A07D4 001A06D4 09006210 */  beq        $3, $2, .L001A06FC
/* A07D8 001A06D8 00000000 */   nop
/* A07DC 001A06DC FFFF0224 */  addiu      $2, $0, -0x1
/* A07E0 001A06E0 38010010 */  b          .L001A0BC4
/* A07E4 001A06E4 00000000 */   nop
.L001A06E8:
/* A07E8 001A06E8 0400C017 */  bnez       $fp, .L001A06FC
/* A07EC 001A06EC 00000000 */   nop
/* A07F0 001A06F0 28162072 */  paddub     $2, $17, $0
/* A07F4 001A06F4 33010010 */  b          .L001A0BC4
/* A07F8 001A06F8 00000000 */   nop
.L001A06FC:
/* A07FC 001A06FC 0100013C */  lui        $at, (0x15030 >> 16)
/* A0800 001A0700 2108C102 */  addu       $at, $22, $at
/* A0804 001A0704 3050248C */  lw         $4, (0x15030 & 0xFFFF)($at)
/* A0808 001A0708 0F008010 */  beqz       $4, .L001A0748
/* A080C 001A070C 00000000 */   nop
/* A0810 001A0710 282EA072 */  paddub     $5, $21, $0
/* A0814 001A0714 F467060C */  jal        GetPartsInfo__14CEditPartsInfoFi
/* A0818 001A0718 00000000 */   nop
/* A081C 001A071C 0A004010 */  beqz       $2, .L001A0748
/* A0820 001A0720 00000000 */   nop
/* A0824 001A0724 0C00448C */  lw         $4, 0xC($2)
/* A0828 001A0728 1800438C */  lw         $3, 0x18($2)
/* A082C 001A072C 04008314 */  bne        $4, $3, .L001A0740
/* A0830 001A0730 00000000 */   nop
/* A0834 001A0734 FFFF0224 */  addiu      $2, $0, -0x1
/* A0838 001A0738 22010010 */  b          .L001A0BC4
/* A083C 001A073C 00000000 */   nop
.L001A0740:
/* A0840 001A0740 01008324 */  addiu      $3, $4, 0x1
/* A0844 001A0744 0C0043AC */  sw         $3, 0xC($2)
.L001A0748:
/* A0848 001A0748 12002106 */  bgez       $17, .L001A0794
/* A084C 001A074C 00000000 */   nop
/* A0850 001A0750 288E0070 */  paddub     $17, $0, $0
/* A0854 001A0754 06000010 */  b          .L001A0770
/* A0858 001A0758 00000000 */   nop
.L001A075C:
/* A085C 001A075C E800628E */  lw         $2, 0xE8($19)
/* A0860 001A0760 06004004 */  bltz       $2, .L001A077C
/* A0864 001A0764 00000000 */   nop
/* A0868 001A0768 A0027326 */  addiu      $19, $19, 0x2A0
/* A086C 001A076C 01003126 */  addiu      $17, $17, 0x1
.L001A0770:
/* A0870 001A0770 8000222A */  slti       $2, $17, 0x80
/* A0874 001A0774 F9FF4014 */  bnez       $2, .L001A075C
/* A0878 001A0778 00000000 */   nop
.L001A077C:
/* A087C 001A077C 80000224 */  addiu      $2, $0, 0x80
/* A0880 001A0780 04002216 */  bne        $17, $2, .L001A0794
/* A0884 001A0784 00000000 */   nop
/* A0888 001A0788 FFFF0224 */  addiu      $2, $0, -0x1
/* A088C 001A078C 0D010010 */  b          .L001A0BC4
/* A0890 001A0790 00000000 */   nop
.L001A0794:
/* A0894 001A0794 4400C013 */  beqz       $fp, .L001A08A8
/* A0898 001A0798 00000000 */   nop
/* A089C 001A079C 1801038E */  lw         $3, 0x118($16)
/* A08A0 001A07A0 01000224 */  addiu      $2, $0, 0x1
/* A08A4 001A07A4 40006210 */  beq        $3, $2, .L001A08A8
/* A08A8 001A07A8 00000000 */   nop
/* A08AC 001A07AC 28260072 */  paddub     $4, $16, $0
/* A08B0 001A07B0 886A060C */  jal        GetWidth__9CMapPartsFv
/* A08B4 001A07B4 00000000 */   nop
/* A08B8 001A07B8 C800A2AF */  sw         $2, 0xC8($sp)
/* A08BC 001A07BC 28260072 */  paddub     $4, $16, $0
/* A08C0 001A07C0 A06A060C */  jal        GetHeight__9CMapPartsFv
/* A08C4 001A07C4 00000000 */   nop
/* A08C8 001A07C8 CC00A2AF */  sw         $2, 0xCC($sp)
/* A08CC 001A07CC 28F60070 */  paddub     $fp, $0, $0
/* A08D0 001A07D0 31000010 */  b          .L001A0898
/* A08D4 001A07D4 00000000 */   nop
.L001A07D8:
/* A08D8 001A07D8 28AE0070 */  paddub     $21, $0, $0
/* A08DC 001A07DC 29000010 */  b          .L001A0884
/* A08E0 001A07E0 00000000 */   nop
.L001A07E4:
/* A08E4 001A07E4 2826E072 */  paddub     $4, $23, $0
/* A08E8 001A07E8 80C0050C */  jal        GetUnitSize__9CEditAreaFv
/* A08EC 001A07EC 00000000 */   nop
/* A08F0 001A07F0 C800A28F */  lw         $2, 0xC8($sp)
/* A08F4 001A07F4 43100200 */  sra        $2, $2, 1
/* A08F8 001A07F8 23105E00 */  subu       $2, $2, $fp
/* A08FC 001A07FC 00088244 */  mtc1       $2, $f1
/* A0900 001A0800 00000000 */  nop
/* A0904 001A0804 60088046 */  cvt.s.w    $f1, $f1
/* A0908 001A0808 02080046 */  mul.s      $f0, $f1, $f0
/* A090C 001A080C C1B50046 */  sub.s      $f23, $f22, $f0
/* A0910 001A0810 2826E072 */  paddub     $4, $23, $0
/* A0914 001A0814 80C0050C */  jal        GetUnitSize__9CEditAreaFv
/* A0918 001A0818 00000000 */   nop
/* A091C 001A081C CC00A28F */  lw         $2, 0xCC($sp)
/* A0920 001A0820 43100200 */  sra        $2, $2, 1
/* A0924 001A0824 23105500 */  subu       $2, $2, $21
/* A0928 001A0828 00088244 */  mtc1       $2, $f1
/* A092C 001A082C 00000000 */  nop
/* A0930 001A0830 60088046 */  cvt.s.w    $f1, $f1
/* A0934 001A0834 02080046 */  mul.s      $f0, $f1, $f0
/* A0938 001A0838 01A60046 */  sub.s      $f24, $f20, $f0
/* A093C 001A083C 2826E072 */  paddub     $4, $23, $0
/* A0940 001A0840 06BB0046 */  mov.s      $f12, $f23
/* A0944 001A0844 46AB0046 */  mov.s      $f13, $f21
/* A0948 001A0848 86C30046 */  mov.s      $f14, $f24
/* A094C 001A084C 10BB050C */  jal        SearchPartsExtra__9CEditAreaFfff
/* A0950 001A0850 00000000 */   nop
/* A0954 001A0854 01000324 */  addiu      $3, $0, 0x1
/* A0958 001A0858 09004314 */  bne        $2, $3, .L001A0880
/* A095C 001A085C 00000000 */   nop
/* A0960 001A0860 2826C072 */  paddub     $4, $22, $0
/* A0964 001A0864 F800A527 */  addiu      $5, $sp, 0xF8
/* A0968 001A0868 FC00A627 */  addiu      $6, $sp, 0xFC
/* A096C 001A086C 06BB0046 */  mov.s      $f12, $f23
/* A0970 001A0870 46AB0046 */  mov.s      $f13, $f21
/* A0974 001A0874 86C30046 */  mov.s      $f14, $f24
/* A0978 001A0878 A484060C */  jal        DeleteMapParts__11CEditGroundFPiPifff
/* A097C 001A087C 00000000 */   nop
.L001A0880:
/* A0980 001A0880 0100B526 */  addiu      $21, $21, 0x1
.L001A0884:
/* A0984 001A0884 CC00A28F */  lw         $2, 0xCC($sp)
/* A0988 001A0888 2A10A202 */  slt        $2, $21, $2
/* A098C 001A088C D5FF4014 */  bnez       $2, .L001A07E4
/* A0990 001A0890 00000000 */   nop
/* A0994 001A0894 0100DE27 */  addiu      $fp, $fp, 0x1
.L001A0898:
/* A0998 001A0898 C800A28F */  lw         $2, 0xC8($sp)
/* A099C 001A089C 2A10C203 */  slt        $2, $fp, $2
/* A09A0 001A08A0 CDFF4014 */  bnez       $2, .L001A07D8
/* A09A4 001A08A4 00000000 */   nop
.L001A08A8:
/* A09A8 001A08A8 28266072 */  paddub     $4, $19, $0
/* A09AC 001A08AC 282E0072 */  paddub     $5, $16, $0
/* A09B0 001A08B0 A0020624 */  addiu      $6, $0, 0x2A0
/* A09B4 001A08B4 EC0C040C */  jal        memcpy
/* A09B8 001A08B8 00000000 */   nop
/* A09BC 001A08BC 28266072 */  paddub     $4, $19, $0
/* A09C0 001A08C0 282E8072 */  paddub     $5, $20, $0
/* A09C4 001A08C4 146A060C */  jal        SetRotY__9CMapPartsFi
/* A09C8 001A08C8 00000000 */   nop
/* A09CC 001A08CC 0000448E */  lw         $4, 0x0($18)
/* A09D0 001A08D0 D000A527 */  addiu      $5, $sp, 0xD0
/* A09D4 001A08D4 06B30046 */  mov.s      $f12, $f22
/* A09D8 001A08D8 46AB0046 */  mov.s      $f13, $f21
/* A09DC 001A08DC 86A30046 */  mov.s      $f14, $f20
/* A09E0 001A08E0 24BB050C */  jal        GetGrid__9CEditAreaFP11CVector3_f_fff
/* A09E4 001A08E4 00000000 */   nop
/* A09E8 001A08E8 28260072 */  paddub     $4, $16, $0
/* A09EC 001A08EC 886A060C */  jal        GetWidth__9CMapPartsFv
/* A09F0 001A08F0 00000000 */   nop
/* A09F4 001A08F4 28AE4070 */  paddub     $21, $2, $0
/* A09F8 001A08F8 28260072 */  paddub     $4, $16, $0
/* A09FC 001A08FC A06A060C */  jal        GetHeight__9CMapPartsFv
/* A0A00 001A0900 00000000 */   nop
/* A0A04 001A0904 28864070 */  paddub     $16, $2, $0
/* A0A08 001A0908 0100A332 */  andi       $3, $21, 0x1
/* A0A0C 001A090C 0400A106 */  bgez       $21, .L001A0920
/* A0A10 001A0910 00000000 */   nop
/* A0A14 001A0914 02006010 */  beqz       $3, .L001A0920
/* A0A18 001A0918 00000000 */   nop
/* A0A1C 001A091C FEFF6324 */  addiu      $3, $3, -0x2
.L001A0920:
/* A0A20 001A0920 01000224 */  addiu      $2, $0, 0x1
/* A0A24 001A0924 0B006214 */  bne        $3, $2, .L001A0954
/* A0A28 001A0928 00000000 */   nop
/* A0A2C 001A092C 0000448E */  lw         $4, 0x0($18)
/* A0A30 001A0930 80C0050C */  jal        GetUnitSize__9CEditAreaFv
/* A0A34 001A0934 00000000 */   nop
/* A0A38 001A0938 003F023C */  lui        $2, (0x3F000000 >> 16)
/* A0A3C 001A093C 00088244 */  mtc1       $2, $f1
/* A0A40 001A0940 00000000 */  nop
/* A0A44 001A0944 42080046 */  mul.s      $f1, $f1, $f0
/* A0A48 001A0948 D000A0C7 */  lwc1       $f0, 0xD0($sp)
/* A0A4C 001A094C 00000146 */  add.s      $f0, $f0, $f1
/* A0A50 001A0950 D000A0E7 */  swc1       $f0, 0xD0($sp)
.L001A0954:
/* A0A54 001A0954 01000332 */  andi       $3, $16, 0x1
/* A0A58 001A0958 04000106 */  bgez       $16, .L001A096C
/* A0A5C 001A095C 00000000 */   nop
/* A0A60 001A0960 02006010 */  beqz       $3, .L001A096C
/* A0A64 001A0964 00000000 */   nop
/* A0A68 001A0968 FEFF6324 */  addiu      $3, $3, -0x2
.L001A096C:
/* A0A6C 001A096C 01000224 */  addiu      $2, $0, 0x1
/* A0A70 001A0970 0B006214 */  bne        $3, $2, .L001A09A0
/* A0A74 001A0974 00000000 */   nop
/* A0A78 001A0978 0000448E */  lw         $4, 0x0($18)
/* A0A7C 001A097C 80C0050C */  jal        GetUnitSize__9CEditAreaFv
/* A0A80 001A0980 00000000 */   nop
/* A0A84 001A0984 003F023C */  lui        $2, (0x3F000000 >> 16)
/* A0A88 001A0988 00088244 */  mtc1       $2, $f1
/* A0A8C 001A098C 00000000 */  nop
/* A0A90 001A0990 42080046 */  mul.s      $f1, $f1, $f0
/* A0A94 001A0994 D800A0C7 */  lwc1       $f0, 0xD8($sp)
/* A0A98 001A0998 00000146 */  add.s      $f0, $f0, $f1
/* A0A9C 001A099C D800A0E7 */  swc1       $f0, 0xD8($sp)
.L001A09A0:
/* A0AA0 001A09A0 D400B027 */  addiu      $16, $sp, 0xD4
/* A0AA4 001A09A4 D800B527 */  addiu      $21, $sp, 0xD8
/* A0AA8 001A09A8 0000448E */  lw         $4, 0x0($18)
/* A0AAC 001A09AC D000ACC7 */  lwc1       $f12, 0xD0($sp)
/* A0AB0 001A09B0 00000DC6 */  lwc1       $f13, 0x0($16)
/* A0AB4 001A09B4 0000AEC6 */  lwc1       $f14, 0x0($21)
/* A0AB8 001A09B8 7CB7050C */  jal        GetAlt__9CEditAreaFfff
/* A0ABC 001A09BC 00000000 */   nop
/* A0AC0 001A09C0 000000E6 */  swc1       $f0, 0x0($16)
/* A0AC4 001A09C4 0000448E */  lw         $4, 0x0($18)
/* A0AC8 001A09C8 80C0050C */  jal        GetUnitSize__9CEditAreaFv
/* A0ACC 001A09CC 00000000 */   nop
/* A0AD0 001A09D0 D00160E6 */  swc1       $f0, 0x1D0($19)
/* A0AD4 001A09D4 2700023C */  lui        $2, %hi(_335_4)
/* A0AD8 001A09D8 40AE4224 */  addiu      $2, $2, %lo(_335_4)
/* A0ADC 001A09DC E000A527 */  addiu      $5, $sp, 0xE0
/* A0AE0 001A09E0 00004278 */  lq         $2, 0x0($2)
/* A0AE4 001A09E4 0000A27C */  sq         $2, 0x0($5)
/* A0AE8 001A09E8 D000A0C7 */  lwc1       $f0, 0xD0($sp)
/* A0AEC 001A09EC E000A0E7 */  swc1       $f0, 0xE0($sp)
/* A0AF0 001A09F0 000000C6 */  lwc1       $f0, 0x0($16)
/* A0AF4 001A09F4 E400A0E7 */  swc1       $f0, 0xE4($sp)
/* A0AF8 001A09F8 0000A0C6 */  lwc1       $f0, 0x0($21)
/* A0AFC 001A09FC E800A0E7 */  swc1       $f0, 0xE8($sp)
/* A0B00 001A0A00 28266072 */  paddub     $4, $19, $0
/* A0B04 001A0A04 A000798E */  lw         $25, 0xA0($19)
/* A0B08 001A0A08 1400398F */  lw         $25, 0x14($25)
/* A0B0C 001A0A0C 09F82003 */  jalr       $25
/* A0B10 001A0A10 00000000 */   nop
/* A0B14 001A0A14 28266072 */  paddub     $4, $19, $0
/* A0B18 001A0A18 282E8072 */  paddub     $5, $20, $0
/* A0B1C 001A0A1C 146A060C */  jal        SetRotY__9CMapPartsFi
/* A0B20 001A0A20 00000000 */   nop
/* A0B24 001A0A24 C400A28F */  lw         $2, 0xC4($sp)
/* A0B28 001A0A28 F40062AE */  sw         $2, 0xF4($19)
/* A0B2C 001A0A2C 0000448E */  lw         $4, 0x0($18)
/* A0B30 001A0A30 282E2072 */  paddub     $5, $17, $0
/* A0B34 001A0A34 3000C626 */  addiu      $6, $22, 0x30
/* A0B38 001A0A38 06B30046 */  mov.s      $f12, $f22
/* A0B3C 001A0A3C 46AB0046 */  mov.s      $f13, $f21
/* A0B40 001A0A40 86A30046 */  mov.s      $f14, $f20
/* A0B44 001A0A44 283E8072 */  paddub     $7, $20, $0
/* A0B48 001A0A48 04B8050C */  jal        SetMapParts__9CEditAreaFiP9CMapPartsfffi
/* A0B4C 001A0A4C 00000000 */   nop
/* A0B50 001A0A50 1801638E */  lw         $3, 0x118($19)
/* A0B54 001A0A54 02000224 */  addiu      $2, $0, 0x2
/* A0B58 001A0A58 2D006214 */  bne        $3, $2, .L001A0B10
/* A0B5C 001A0A5C 00000000 */   nop
/* A0B60 001A0A60 E800638E */  lw         $3, 0xE8($19)
/* A0B64 001A0A64 06000224 */  addiu      $2, $0, 0x6
/* A0B68 001A0A68 29006210 */  beq        $3, $2, .L001A0B10
/* A0B6C 001A0A6C 00000000 */   nop
/* A0B70 001A0A70 2826C072 */  paddub     $4, $22, $0
/* A0B74 001A0A74 06B30046 */  mov.s      $f12, $f22
/* A0B78 001A0A78 46AB0046 */  mov.s      $f13, $f21
/* A0B7C 001A0A7C 86A30046 */  mov.s      $f14, $f20
/* A0B80 001A0A80 282E0070 */  paddub     $5, $0, $0
/* A0B84 001A0A84 28360070 */  paddub     $6, $0, $0
/* A0B88 001A0A88 0483060C */  jal        SetRiverParts__11CEditGroundFfffii
/* A0B8C 001A0A8C 00000000 */   nop
/* A0B90 001A0A90 2826C072 */  paddub     $4, $22, $0
/* A0B94 001A0A94 06B30046 */  mov.s      $f12, $f22
/* A0B98 001A0A98 46AB0046 */  mov.s      $f13, $f21
/* A0B9C 001A0A9C 86A30046 */  mov.s      $f14, $f20
/* A0BA0 001A0AA0 01000524 */  addiu      $5, $0, 0x1
/* A0BA4 001A0AA4 28360070 */  paddub     $6, $0, $0
/* A0BA8 001A0AA8 0483060C */  jal        SetRiverParts__11CEditGroundFfffii
/* A0BAC 001A0AAC 00000000 */   nop
/* A0BB0 001A0AB0 2826C072 */  paddub     $4, $22, $0
/* A0BB4 001A0AB4 06B30046 */  mov.s      $f12, $f22
/* A0BB8 001A0AB8 46AB0046 */  mov.s      $f13, $f21
/* A0BBC 001A0ABC 86A30046 */  mov.s      $f14, $f20
/* A0BC0 001A0AC0 282E0070 */  paddub     $5, $0, $0
/* A0BC4 001A0AC4 01000624 */  addiu      $6, $0, 0x1
/* A0BC8 001A0AC8 0483060C */  jal        SetRiverParts__11CEditGroundFfffii
/* A0BCC 001A0ACC 00000000 */   nop
/* A0BD0 001A0AD0 2826C072 */  paddub     $4, $22, $0
/* A0BD4 001A0AD4 06B30046 */  mov.s      $f12, $f22
/* A0BD8 001A0AD8 46AB0046 */  mov.s      $f13, $f21
/* A0BDC 001A0ADC 86A30046 */  mov.s      $f14, $f20
/* A0BE0 001A0AE0 FFFF0524 */  addiu      $5, $0, -0x1
/* A0BE4 001A0AE4 28360070 */  paddub     $6, $0, $0
/* A0BE8 001A0AE8 0483060C */  jal        SetRiverParts__11CEditGroundFfffii
/* A0BEC 001A0AEC 00000000 */   nop
/* A0BF0 001A0AF0 2826C072 */  paddub     $4, $22, $0
/* A0BF4 001A0AF4 06B30046 */  mov.s      $f12, $f22
/* A0BF8 001A0AF8 46AB0046 */  mov.s      $f13, $f21
/* A0BFC 001A0AFC 86A30046 */  mov.s      $f14, $f20
/* A0C00 001A0B00 282E0070 */  paddub     $5, $0, $0
/* A0C04 001A0B04 FFFF0624 */  addiu      $6, $0, -0x1
/* A0C08 001A0B08 0483060C */  jal        SetRiverParts__11CEditGroundFfffii
/* A0C0C 001A0B0C 00000000 */   nop
.L001A0B10:
/* A0C10 001A0B10 1801638E */  lw         $3, 0x118($19)
/* A0C14 001A0B14 01000224 */  addiu      $2, $0, 0x1
/* A0C18 001A0B18 29006214 */  bne        $3, $2, .L001A0BC0
/* A0C1C 001A0B1C 00000000 */   nop
/* A0C20 001A0B20 2826C072 */  paddub     $4, $22, $0
/* A0C24 001A0B24 06B30046 */  mov.s      $f12, $f22
/* A0C28 001A0B28 46AB0046 */  mov.s      $f13, $f21
/* A0C2C 001A0B2C 86A30046 */  mov.s      $f14, $f20
/* A0C30 001A0B30 282E0070 */  paddub     $5, $0, $0
/* A0C34 001A0B34 28360070 */  paddub     $6, $0, $0
/* A0C38 001A0B38 F883060C */  jal        SetRoadParts__11CEditGroundFfffii
/* A0C3C 001A0B3C 00000000 */   nop
/* A0C40 001A0B40 2826C072 */  paddub     $4, $22, $0
/* A0C44 001A0B44 06B30046 */  mov.s      $f12, $f22
/* A0C48 001A0B48 46AB0046 */  mov.s      $f13, $f21
/* A0C4C 001A0B4C 86A30046 */  mov.s      $f14, $f20
/* A0C50 001A0B50 01000524 */  addiu      $5, $0, 0x1
/* A0C54 001A0B54 28360070 */  paddub     $6, $0, $0
/* A0C58 001A0B58 F883060C */  jal        SetRoadParts__11CEditGroundFfffii
/* A0C5C 001A0B5C 00000000 */   nop
/* A0C60 001A0B60 2826C072 */  paddub     $4, $22, $0
/* A0C64 001A0B64 06B30046 */  mov.s      $f12, $f22
/* A0C68 001A0B68 46AB0046 */  mov.s      $f13, $f21
/* A0C6C 001A0B6C 86A30046 */  mov.s      $f14, $f20
/* A0C70 001A0B70 282E0070 */  paddub     $5, $0, $0
/* A0C74 001A0B74 01000624 */  addiu      $6, $0, 0x1
/* A0C78 001A0B78 F883060C */  jal        SetRoadParts__11CEditGroundFfffii
/* A0C7C 001A0B7C 00000000 */   nop
/* A0C80 001A0B80 2826C072 */  paddub     $4, $22, $0
/* A0C84 001A0B84 06B30046 */  mov.s      $f12, $f22
/* A0C88 001A0B88 46AB0046 */  mov.s      $f13, $f21
/* A0C8C 001A0B8C 86A30046 */  mov.s      $f14, $f20
/* A0C90 001A0B90 FFFF0524 */  addiu      $5, $0, -0x1
/* A0C94 001A0B94 28360070 */  paddub     $6, $0, $0
/* A0C98 001A0B98 F883060C */  jal        SetRoadParts__11CEditGroundFfffii
/* A0C9C 001A0B9C 00000000 */   nop
/* A0CA0 001A0BA0 2826C072 */  paddub     $4, $22, $0
/* A0CA4 001A0BA4 06B30046 */  mov.s      $f12, $f22
/* A0CA8 001A0BA8 46AB0046 */  mov.s      $f13, $f21
/* A0CAC 001A0BAC 86A30046 */  mov.s      $f14, $f20
/* A0CB0 001A0BB0 282E0070 */  paddub     $5, $0, $0
/* A0CB4 001A0BB4 FFFF0624 */  addiu      $6, $0, -0x1
/* A0CB8 001A0BB8 F883060C */  jal        SetRoadParts__11CEditGroundFfffii
/* A0CBC 001A0BBC 00000000 */   nop
.L001A0BC0:
/* A0CC0 001A0BC0 28162072 */  paddub     $2, $17, $0
.L001A0BC4:
/* A0CC4 001A0BC4 B000BF7B */  lq         $31, 0xB0($sp)
/* A0CC8 001A0BC8 A000BE7B */  lq         $fp, 0xA0($sp)
/* A0CCC 001A0BCC 9000B77B */  lq         $23, 0x90($sp)
/* A0CD0 001A0BD0 8000B67B */  lq         $22, 0x80($sp)
/* A0CD4 001A0BD4 7000B57B */  lq         $21, 0x70($sp)
/* A0CD8 001A0BD8 6000B47B */  lq         $20, 0x60($sp)
/* A0CDC 001A0BDC 5000B37B */  lq         $19, 0x50($sp)
/* A0CE0 001A0BE0 4000B27B */  lq         $18, 0x40($sp)
/* A0CE4 001A0BE4 3000B17B */  lq         $17, 0x30($sp)
/* A0CE8 001A0BE8 2000B07B */  lq         $16, 0x20($sp)
/* A0CEC 001A0BEC 1000B8C7 */  lwc1       $f24, 0x10($sp)
/* A0CF0 001A0BF0 0C00B7C7 */  lwc1       $f23, 0xC($sp)
/* A0CF4 001A0BF4 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* A0CF8 001A0BF8 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* A0CFC 001A0BFC 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* A0D00 001A0C00 0001BD27 */  addiu      $sp, $sp, 0x100
/* A0D04 001A0C04 0800E003 */  jr         $31
/* A0D08 001A0C08 00000000 */   nop
/* A0D0C 001A0C0C 00000000 */  nop
