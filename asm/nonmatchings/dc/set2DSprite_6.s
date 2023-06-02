.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_iif
/* 5E640 0015E540 00FFBD27 */  addiu      $sp, $sp, -0x100
/* 5E644 0015E544 B000BF7F */  sq         $31, 0xB0($sp)
/* 5E648 0015E548 A000BE7F */  sq         $fp, 0xA0($sp)
/* 5E64C 0015E54C 9000B77F */  sq         $23, 0x90($sp)
/* 5E650 0015E550 8000B67F */  sq         $22, 0x80($sp)
/* 5E654 0015E554 7000B57F */  sq         $21, 0x70($sp)
/* 5E658 0015E558 6000B47F */  sq         $20, 0x60($sp)
/* 5E65C 0015E55C 5000B37F */  sq         $19, 0x50($sp)
/* 5E660 0015E560 4000B27F */  sq         $18, 0x40($sp)
/* 5E664 0015E564 3000B17F */  sq         $17, 0x30($sp)
/* 5E668 0015E568 2000B07F */  sq         $16, 0x20($sp)
/* 5E66C 0015E56C 1000B8E7 */  swc1       $f24, 0x10($sp)
/* 5E670 0015E570 0C00B7E7 */  swc1       $f23, 0xC($sp)
/* 5E674 0015E574 0800B6E7 */  swc1       $f22, 0x8($sp)
/* 5E678 0015E578 0400B5E7 */  swc1       $f21, 0x4($sp)
/* 5E67C 0015E57C 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 5E680 0015E580 289E8070 */  paddub     $19, $4, $0
/* 5E684 0015E584 2896A070 */  paddub     $18, $5, $0
/* 5E688 0015E588 288EC070 */  paddub     $17, $6, $0
/* 5E68C 0015E58C 2886E070 */  paddub     $16, $7, $0
/* 5E690 0015E590 28AE0071 */  paddub     $21, $8, $0
/* 5E694 0015E594 28A62071 */  paddub     $20, $9, $0
/* 5E698 0015E598 06650046 */  mov.s      $f20, $f12
/* 5E69C 0015E59C 39014012 */  beqz       $18, .L0015EA84
/* 5E6A0 0015E5A0 00000000 */   nop
/* 5E6A4 0015E5A4 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 5E6A8 0015E5A8 FC00A2AF */  sw         $2, 0xFC($sp)
/* 5E6AC 0015E5AC 282E0070 */  paddub     $5, $0, $0
/* 5E6B0 0015E5B0 2083040C */  jal        sceVif1PkCnt
/* 5E6B4 0015E5B4 00000000 */   nop
/* 5E6B8 0015E5B8 28266072 */  paddub     $4, $19, $0
/* 5E6BC 0015E5BC 282E0070 */  paddub     $5, $0, $0
/* 5E6C0 0015E5C0 8E83040C */  jal        sceVif1PkOpenDirectCode
/* 5E6C4 0015E5C4 00000000 */   nop
/* 5E6C8 0015E5C8 C701023C */  lui        $2, %hi(GiftagAD)
/* 5E6CC 0015E5CC C0524224 */  addiu      $2, $2, %lo(GiftagAD)
/* 5E6D0 0015E5D0 28266072 */  paddub     $4, $19, $0
/* 5E6D4 0015E5D4 00004578 */  lq         $5, 0x0($2)
/* 5E6D8 0015E5D8 B083040C */  jal        sceVif1PkOpenGifTag
/* 5E6DC 0015E5DC 00000000 */   nop
/* 5E6E0 0015E5E0 F886828F */  lw         $2, -0x7908($gp)
/* 5E6E4 0015E5E4 78110200 */  dsll       $2, $2, 5
/* 5E6E8 0015E5E8 41004634 */  ori        $6, $2, 0x41
/* 5E6EC 0015E5EC 28266072 */  paddub     $4, $19, $0
/* 5E6F0 0015E5F0 14000524 */  addiu      $5, $0, 0x14
/* 5E6F4 0015E5F4 0A84040C */  jal        sceVif1PkAddGsAD
/* 5E6F8 0015E5F8 00000000 */   nop
/* 5E6FC 0015E5FC 28266072 */  paddub     $4, $19, $0
/* 5E700 0015E600 282E0070 */  paddub     $5, $0, $0
/* 5E704 0015E604 D4010624 */  addiu      $6, $0, 0x1D4
/* 5E708 0015E608 0A84040C */  jal        sceVif1PkAddGsAD
/* 5E70C 0015E60C 00000000 */   nop
/* 5E710 0015E610 E800A227 */  addiu      $2, $sp, 0xE8
/* 5E714 0015E614 E88B83DF */  ld         $3, -0x7418($gp)
/* 5E718 0015E618 000043FC */  sd         $3, 0x0($2)
/* 5E71C 0015E61C E800A393 */  lbu        $3, 0xE8($sp)
/* 5E720 0015E620 01000430 */  andi       $4, $0, 0x1
/* 5E724 0015E624 FEFF0624 */  addiu      $6, $0, -0x2
/* 5E728 0015E628 24186600 */  and        $3, $3, $6
/* 5E72C 0015E62C 25186400 */  or         $3, $3, $4
/* 5E730 0015E630 E800A3A3 */  sb         $3, 0xE8($sp)
/* 5E734 0015E634 E800A597 */  lhu        $5, 0xE8($sp)
/* 5E738 0015E638 FF000330 */  andi       $3, $0, 0xFF
/* 5E73C 0015E63C 00210300 */  sll        $4, $3, 4
/* 5E740 0015E640 0FF00324 */  addiu      $3, $0, -0xFF1
/* 5E744 0015E644 2418A300 */  and        $3, $5, $3
/* 5E748 0015E648 25186400 */  or         $3, $3, $4
/* 5E74C 0015E64C E800A3A7 */  sh         $3, 0xE8($sp)
/* 5E750 0015E650 E800A493 */  lbu        $4, 0xE8($sp)
/* 5E754 0015E654 02000564 */  daddiu     $5, $0, 0x2
/* 5E758 0015E658 F1FF0324 */  addiu      $3, $0, -0xF
/* 5E75C 0015E65C 24188300 */  and        $3, $4, $3
/* 5E760 0015E660 25186500 */  or         $3, $3, $5
/* 5E764 0015E664 E800A3A3 */  sb         $3, 0xE8($sp)
/* 5E768 0015E668 EA00A727 */  addiu      $7, $sp, 0xEA
/* 5E76C 0015E66C 0000E390 */  lbu        $3, 0x0($7)
/* 5E770 0015E670 01000464 */  daddiu     $4, $0, 0x1
/* 5E774 0015E674 24186600 */  and        $3, $3, $6
/* 5E778 0015E678 25186400 */  or         $3, $3, $4
/* 5E77C 0015E67C 0000E3A0 */  sb         $3, 0x0($7)
/* 5E780 0015E680 0000E490 */  lbu        $4, 0x0($7)
/* 5E784 0015E684 F9FF0324 */  addiu      $3, $0, -0x7
/* 5E788 0015E688 24188300 */  and        $3, $4, $3
/* 5E78C 0015E68C 25186500 */  or         $3, $3, $5
/* 5E790 0015E690 0000E3A0 */  sb         $3, 0x0($7)
/* 5E794 0015E694 28266072 */  paddub     $4, $19, $0
/* 5E798 0015E698 47000524 */  addiu      $5, $0, 0x47
/* 5E79C 0015E69C 000046DC */  ld         $6, 0x0($2)
/* 5E7A0 0015E6A0 0A84040C */  jal        sceVif1PkAddGsAD
/* 5E7A4 0015E6A4 00000000 */   nop
/* 5E7A8 0015E6A8 F000A327 */  addiu      $3, $sp, 0xF0
/* 5E7AC 0015E6AC F08B82DF */  ld         $2, -0x7410($gp)
/* 5E7B0 0015E6B0 000062FC */  sd         $2, 0x0($3)
/* 5E7B4 0015E6B4 F400A493 */  lbu        $4, 0xF4($sp)
/* 5E7B8 0015E6B8 01000364 */  daddiu     $3, $0, 0x1
/* 5E7BC 0015E6BC FEFF0224 */  addiu      $2, $0, -0x2
/* 5E7C0 0015E6C0 24108200 */  and        $2, $4, $2
/* 5E7C4 0015E6C4 25104300 */  or         $2, $2, $3
/* 5E7C8 0015E6C8 F400A2A3 */  sb         $2, 0xF4($sp)
/* 5E7CC 0015E6CC 23101500 */  negu       $2, $21
/* 5E7D0 0015E6D0 00008244 */  mtc1       $2, $f0
/* 5E7D4 0015E6D4 00000000 */  nop
/* 5E7D8 0015E6D8 20008046 */  cvt.s.w    $f0, $f0
/* 5E7DC 0015E6DC C800A227 */  addiu      $2, $sp, 0xC8
/* 5E7E0 0015E6E0 000040E4 */  swc1       $f0, 0x0($2)
/* 5E7E4 0015E6E4 C000A0E7 */  swc1       $f0, 0xC0($sp)
/* 5E7E8 0015E6E8 0000248E */  lw         $4, 0x0($17)
/* 5E7EC 0015E6EC 0800228E */  lw         $2, 0x8($17)
/* 5E7F0 0015E6F0 21108200 */  addu       $2, $4, $2
/* 5E7F4 0015E6F4 01004324 */  addiu      $3, $2, 0x1
/* 5E7F8 0015E6F8 21109500 */  addu       $2, $4, $21
/* 5E7FC 0015E6FC 23106200 */  subu       $2, $3, $2
/* 5E800 0015E700 00008244 */  mtc1       $2, $f0
/* 5E804 0015E704 00000000 */  nop
/* 5E808 0015E708 20008046 */  cvt.s.w    $f0, $f0
/* 5E80C 0015E70C CC00B727 */  addiu      $23, $sp, 0xCC
/* 5E810 0015E710 0000E0E6 */  swc1       $f0, 0x0($23)
/* 5E814 0015E714 C400A227 */  addiu      $2, $sp, 0xC4
/* 5E818 0015E718 000040E4 */  swc1       $f0, 0x0($2)
/* 5E81C 0015E71C 23101400 */  negu       $2, $20
/* 5E820 0015E720 00008244 */  mtc1       $2, $f0
/* 5E824 0015E724 00000000 */  nop
/* 5E828 0015E728 20008046 */  cvt.s.w    $f0, $f0
/* 5E82C 0015E72C D400A227 */  addiu      $2, $sp, 0xD4
/* 5E830 0015E730 000040E4 */  swc1       $f0, 0x0($2)
/* 5E834 0015E734 D000A0E7 */  swc1       $f0, 0xD0($sp)
/* 5E838 0015E738 0400248E */  lw         $4, 0x4($17)
/* 5E83C 0015E73C 0C00228E */  lw         $2, 0xC($17)
/* 5E840 0015E740 21108200 */  addu       $2, $4, $2
/* 5E844 0015E744 01004324 */  addiu      $3, $2, 0x1
/* 5E848 0015E748 21109400 */  addu       $2, $4, $20
/* 5E84C 0015E74C 23106200 */  subu       $2, $3, $2
/* 5E850 0015E750 00008244 */  mtc1       $2, $f0
/* 5E854 0015E754 00000000 */  nop
/* 5E858 0015E758 20008046 */  cvt.s.w    $f0, $f0
/* 5E85C 0015E75C DC00BE27 */  addiu      $fp, $sp, 0xDC
/* 5E860 0015E760 0000C0E7 */  swc1       $f0, 0x0($fp)
/* 5E864 0015E764 D800A227 */  addiu      $2, $sp, 0xD8
/* 5E868 0015E768 000040E4 */  swc1       $f0, 0x0($2)
/* 5E86C 0015E76C 28A60070 */  paddub     $20, $0, $0
/* 5E870 0015E770 31000010 */  b          .L0015E838
/* 5E874 0015E774 00000000 */   nop
.L0015E778:
/* 5E878 0015E778 80A81400 */  sll        $21, $20, 2
/* 5E87C 0015E77C 06A30046 */  mov.s      $f12, $f20
/* 5E880 0015E780 AC75040C */  jal        cosf
/* 5E884 0015E784 00000000 */   nop
/* 5E888 0015E788 2110BD02 */  addu       $2, $21, $sp
/* 5E88C 0015E78C D0005624 */  addiu      $22, $2, 0xD0
/* 5E890 0015E790 0000D7C6 */  lwc1       $f23, 0x0($22)
/* 5E894 0015E794 42BD0046 */  mul.s      $f21, $f23, $f0
/* 5E898 0015E798 06A30046 */  mov.s      $f12, $f20
/* 5E89C 0015E79C 2876040C */  jal        sinf
/* 5E8A0 0015E7A0 00000000 */   nop
/* 5E8A4 0015E7A4 2110BD02 */  addu       $2, $21, $sp
/* 5E8A8 0015E7A8 C0005524 */  addiu      $21, $2, 0xC0
/* 5E8AC 0015E7AC 0000B8C6 */  lwc1       $f24, 0x0($21)
/* 5E8B0 0015E7B0 02C00046 */  mul.s      $f0, $f24, $f0
/* 5E8B4 0015E7B4 80AD0046 */  add.s      $f22, $f21, $f0
/* 5E8B8 0015E7B8 06A30046 */  mov.s      $f12, $f20
/* 5E8BC 0015E7BC AC75040C */  jal        cosf
/* 5E8C0 0015E7C0 00000000 */   nop
/* 5E8C4 0015E7C4 42C50046 */  mul.s      $f21, $f24, $f0
/* 5E8C8 0015E7C8 06A30046 */  mov.s      $f12, $f20
/* 5E8CC 0015E7CC 2876040C */  jal        sinf
/* 5E8D0 0015E7D0 00000000 */   nop
/* 5E8D4 0015E7D4 02B80046 */  mul.s      $f0, $f23, $f0
/* 5E8D8 0015E7D8 41AD0046 */  sub.s      $f21, $f21, $f0
/* 5E8DC 0015E7DC 06B30046 */  mov.s      $f12, $f22
/* 5E8E0 0015E7E0 2C44040C */  jal        fptosi
/* 5E8E4 0015E7E4 00000000 */   nop
/* 5E8E8 0015E7E8 0000238E */  lw         $3, 0x0($17)
/* 5E8EC 0015E7EC 21104300 */  addu       $2, $2, $3
/* 5E8F0 0015E7F0 00110200 */  sll        $2, $2, 4
/* 5E8F4 0015E7F4 006C4224 */  addiu      $2, $2, 0x6C00
/* 5E8F8 0015E7F8 00008244 */  mtc1       $2, $f0
/* 5E8FC 0015E7FC 00000000 */  nop
/* 5E900 0015E800 20008046 */  cvt.s.w    $f0, $f0
/* 5E904 0015E804 0000A0E6 */  swc1       $f0, 0x0($21)
/* 5E908 0015E808 06AB0046 */  mov.s      $f12, $f21
/* 5E90C 0015E80C 2C44040C */  jal        fptosi
/* 5E910 0015E810 00000000 */   nop
/* 5E914 0015E814 0400238E */  lw         $3, 0x4($17)
/* 5E918 0015E818 21104300 */  addu       $2, $2, $3
/* 5E91C 0015E81C C0100200 */  sll        $2, $2, 3
/* 5E920 0015E820 00794224 */  addiu      $2, $2, 0x7900
/* 5E924 0015E824 00008244 */  mtc1       $2, $f0
/* 5E928 0015E828 00000000 */  nop
/* 5E92C 0015E82C 20008046 */  cvt.s.w    $f0, $f0
/* 5E930 0015E830 0000C0E6 */  swc1       $f0, 0x0($22)
/* 5E934 0015E834 01009426 */  addiu      $20, $20, 0x1
.L0015E838:
/* 5E938 0015E838 0400822A */  slti       $2, $20, 0x4
/* 5E93C 0015E83C CEFF4014 */  bnez       $2, .L0015E778
/* 5E940 0015E840 00000000 */   nop
/* 5E944 0015E844 F000A227 */  addiu      $2, $sp, 0xF0
/* 5E948 0015E848 28266072 */  paddub     $4, $19, $0
/* 5E94C 0015E84C 4E000524 */  addiu      $5, $0, 0x4E
/* 5E950 0015E850 000046DC */  ld         $6, 0x0($2)
/* 5E954 0015E854 0A84040C */  jal        sceVif1PkAddGsAD
/* 5E958 0015E858 00000000 */   nop
/* 5E95C 0015E85C FC00A227 */  addiu      $2, $sp, 0xFC
/* 5E960 0015E860 0000429C */  lwu        $2, 0x0($2)
/* 5E964 0015E864 3C180200 */  dsll32     $3, $2, 0
/* 5E968 0015E868 80800234 */  ori        $2, $0, 0x8080
/* 5E96C 0015E86C 38140200 */  dsll       $2, $2, 16
/* 5E970 0015E870 80804234 */  ori        $2, $2, 0x8080
/* 5E974 0015E874 25306200 */  or         $6, $3, $2
/* 5E978 0015E878 28266072 */  paddub     $4, $19, $0
/* 5E97C 0015E87C 01000524 */  addiu      $5, $0, 0x1
/* 5E980 0015E880 0A84040C */  jal        sceVif1PkAddGsAD
/* 5E984 0015E884 00000000 */   nop
/* 5E988 0015E888 28266072 */  paddub     $4, $19, $0
/* 5E98C 0015E88C 06000524 */  addiu      $5, $0, 0x6
/* 5E990 0015E890 280046DE */  ld         $6, 0x28($18)
/* 5E994 0015E894 0A84040C */  jal        sceVif1PkAddGsAD
/* 5E998 0015E898 00000000 */   nop
/* 5E99C 0015E89C 0400028E */  lw         $2, 0x4($16)
/* 5E9A0 0015E8A0 00110200 */  sll        $2, $2, 4
/* 5E9A4 0015E8A4 381C0200 */  dsll       $3, $2, 16
/* 5E9A8 0015E8A8 0000028E */  lw         $2, 0x0($16)
/* 5E9AC 0015E8AC 00110200 */  sll        $2, $2, 4
/* 5E9B0 0015E8B0 25304300 */  or         $6, $2, $3
/* 5E9B4 0015E8B4 28266072 */  paddub     $4, $19, $0
/* 5E9B8 0015E8B8 03000524 */  addiu      $5, $0, 0x3
/* 5E9BC 0015E8BC 0A84040C */  jal        sceVif1PkAddGsAD
/* 5E9C0 0015E8C0 00000000 */   nop
/* 5E9C4 0015E8C4 C000ACC7 */  lwc1       $f12, 0xC0($sp)
/* 5E9C8 0015E8C8 9039040C */  jal        __fixunssfdi
/* 5E9CC 0015E8CC 00000000 */   nop
/* 5E9D0 0015E8D0 28964070 */  paddub     $18, $2, $0
/* 5E9D4 0015E8D4 D000ACC7 */  lwc1       $f12, 0xD0($sp)
/* 5E9D8 0015E8D8 9039040C */  jal        __fixunssfdi
/* 5E9DC 0015E8DC 00000000 */   nop
/* 5E9E0 0015E8E0 38140200 */  dsll       $2, $2, 16
/* 5E9E4 0015E8E4 25304202 */  or         $6, $18, $2
/* 5E9E8 0015E8E8 28266072 */  paddub     $4, $19, $0
/* 5E9EC 0015E8EC 04000524 */  addiu      $5, $0, 0x4
/* 5E9F0 0015E8F0 0A84040C */  jal        sceVif1PkAddGsAD
/* 5E9F4 0015E8F4 00000000 */   nop
/* 5E9F8 0015E8F8 0400028E */  lw         $2, 0x4($16)
/* 5E9FC 0015E8FC 00110200 */  sll        $2, $2, 4
/* 5EA00 0015E900 38240200 */  dsll       $4, $2, 16
/* 5EA04 0015E904 0000038E */  lw         $3, 0x0($16)
/* 5EA08 0015E908 0800228E */  lw         $2, 0x8($17)
/* 5EA0C 0015E90C 21106200 */  addu       $2, $3, $2
/* 5EA10 0015E910 00110200 */  sll        $2, $2, 4
/* 5EA14 0015E914 25308200 */  or         $6, $4, $2
/* 5EA18 0015E918 28266072 */  paddub     $4, $19, $0
/* 5EA1C 0015E91C 03000524 */  addiu      $5, $0, 0x3
/* 5EA20 0015E920 0A84040C */  jal        sceVif1PkAddGsAD
/* 5EA24 0015E924 00000000 */   nop
/* 5EA28 0015E928 C400A227 */  addiu      $2, $sp, 0xC4
/* 5EA2C 0015E92C 00004CC4 */  lwc1       $f12, 0x0($2)
/* 5EA30 0015E930 9039040C */  jal        __fixunssfdi
/* 5EA34 0015E934 00000000 */   nop
/* 5EA38 0015E938 288E4070 */  paddub     $17, $2, $0
/* 5EA3C 0015E93C D400A227 */  addiu      $2, $sp, 0xD4
/* 5EA40 0015E940 00004CC4 */  lwc1       $f12, 0x0($2)
/* 5EA44 0015E944 9039040C */  jal        __fixunssfdi
/* 5EA48 0015E948 00000000 */   nop
/* 5EA4C 0015E94C 38140200 */  dsll       $2, $2, 16
/* 5EA50 0015E950 25302202 */  or         $6, $17, $2
/* 5EA54 0015E954 28266072 */  paddub     $4, $19, $0
/* 5EA58 0015E958 04000524 */  addiu      $5, $0, 0x4
/* 5EA5C 0015E95C 0A84040C */  jal        sceVif1PkAddGsAD
/* 5EA60 0015E960 00000000 */   nop
/* 5EA64 0015E964 0400038E */  lw         $3, 0x4($16)
/* 5EA68 0015E968 0C00028E */  lw         $2, 0xC($16)
/* 5EA6C 0015E96C 21106200 */  addu       $2, $3, $2
/* 5EA70 0015E970 00110200 */  sll        $2, $2, 4
/* 5EA74 0015E974 381C0200 */  dsll       $3, $2, 16
/* 5EA78 0015E978 0000028E */  lw         $2, 0x0($16)
/* 5EA7C 0015E97C 00110200 */  sll        $2, $2, 4
/* 5EA80 0015E980 25304300 */  or         $6, $2, $3
/* 5EA84 0015E984 28266072 */  paddub     $4, $19, $0
/* 5EA88 0015E988 03000524 */  addiu      $5, $0, 0x3
/* 5EA8C 0015E98C 0A84040C */  jal        sceVif1PkAddGsAD
/* 5EA90 0015E990 00000000 */   nop
/* 5EA94 0015E994 C800A227 */  addiu      $2, $sp, 0xC8
/* 5EA98 0015E998 00004CC4 */  lwc1       $f12, 0x0($2)
/* 5EA9C 0015E99C 9039040C */  jal        __fixunssfdi
/* 5EAA0 0015E9A0 00000000 */   nop
/* 5EAA4 0015E9A4 288E4070 */  paddub     $17, $2, $0
/* 5EAA8 0015E9A8 D800A227 */  addiu      $2, $sp, 0xD8
/* 5EAAC 0015E9AC 00004CC4 */  lwc1       $f12, 0x0($2)
/* 5EAB0 0015E9B0 9039040C */  jal        __fixunssfdi
/* 5EAB4 0015E9B4 00000000 */   nop
/* 5EAB8 0015E9B8 38140200 */  dsll       $2, $2, 16
/* 5EABC 0015E9BC 25302202 */  or         $6, $17, $2
/* 5EAC0 0015E9C0 28266072 */  paddub     $4, $19, $0
/* 5EAC4 0015E9C4 04000524 */  addiu      $5, $0, 0x4
/* 5EAC8 0015E9C8 0A84040C */  jal        sceVif1PkAddGsAD
/* 5EACC 0015E9CC 00000000 */   nop
/* 5EAD0 0015E9D0 0400038E */  lw         $3, 0x4($16)
/* 5EAD4 0015E9D4 0C00028E */  lw         $2, 0xC($16)
/* 5EAD8 0015E9D8 21106200 */  addu       $2, $3, $2
/* 5EADC 0015E9DC 00110200 */  sll        $2, $2, 4
/* 5EAE0 0015E9E0 38240200 */  dsll       $4, $2, 16
/* 5EAE4 0015E9E4 0000038E */  lw         $3, 0x0($16)
/* 5EAE8 0015E9E8 0800028E */  lw         $2, 0x8($16)
/* 5EAEC 0015E9EC 21106200 */  addu       $2, $3, $2
/* 5EAF0 0015E9F0 00110200 */  sll        $2, $2, 4
/* 5EAF4 0015E9F4 25304400 */  or         $6, $2, $4
/* 5EAF8 0015E9F8 28266072 */  paddub     $4, $19, $0
/* 5EAFC 0015E9FC 03000524 */  addiu      $5, $0, 0x3
/* 5EB00 0015EA00 0A84040C */  jal        sceVif1PkAddGsAD
/* 5EB04 0015EA04 00000000 */   nop
/* 5EB08 0015EA08 0000ECC6 */  lwc1       $f12, 0x0($23)
/* 5EB0C 0015EA0C 9039040C */  jal        __fixunssfdi
/* 5EB10 0015EA10 00000000 */   nop
/* 5EB14 0015EA14 28864070 */  paddub     $16, $2, $0
/* 5EB18 0015EA18 0000CCC7 */  lwc1       $f12, 0x0($fp)
/* 5EB1C 0015EA1C 9039040C */  jal        __fixunssfdi
/* 5EB20 0015EA20 00000000 */   nop
/* 5EB24 0015EA24 38140200 */  dsll       $2, $2, 16
/* 5EB28 0015EA28 25300202 */  or         $6, $16, $2
/* 5EB2C 0015EA2C 28266072 */  paddub     $4, $19, $0
/* 5EB30 0015EA30 04000524 */  addiu      $5, $0, 0x4
/* 5EB34 0015EA34 0A84040C */  jal        sceVif1PkAddGsAD
/* 5EB38 0015EA38 00000000 */   nop
/* 5EB3C 0015EA3C E88B8227 */  addiu      $2, $gp, -0x7418
/* 5EB40 0015EA40 28266072 */  paddub     $4, $19, $0
/* 5EB44 0015EA44 47000524 */  addiu      $5, $0, 0x47
/* 5EB48 0015EA48 000046DC */  ld         $6, 0x0($2)
/* 5EB4C 0015EA4C 0A84040C */  jal        sceVif1PkAddGsAD
/* 5EB50 0015EA50 00000000 */   nop
/* 5EB54 0015EA54 F08B8227 */  addiu      $2, $gp, -0x7410
/* 5EB58 0015EA58 28266072 */  paddub     $4, $19, $0
/* 5EB5C 0015EA5C 4E000524 */  addiu      $5, $0, 0x4E
/* 5EB60 0015EA60 000046DC */  ld         $6, 0x0($2)
/* 5EB64 0015EA64 0A84040C */  jal        sceVif1PkAddGsAD
/* 5EB68 0015EA68 00000000 */   nop
/* 5EB6C 0015EA6C 28266072 */  paddub     $4, $19, $0
/* 5EB70 0015EA70 B683040C */  jal        sceVif1PkCloseGifTag
/* 5EB74 0015EA74 00000000 */   nop
/* 5EB78 0015EA78 28266072 */  paddub     $4, $19, $0
/* 5EB7C 0015EA7C A483040C */  jal        sceVif1PkCloseDirectCode
/* 5EB80 0015EA80 00000000 */   nop
.L0015EA84:
/* 5EB84 0015EA84 B000BF7B */  lq         $31, 0xB0($sp)
/* 5EB88 0015EA88 A000BE7B */  lq         $fp, 0xA0($sp)
/* 5EB8C 0015EA8C 9000B77B */  lq         $23, 0x90($sp)
/* 5EB90 0015EA90 8000B67B */  lq         $22, 0x80($sp)
/* 5EB94 0015EA94 7000B57B */  lq         $21, 0x70($sp)
/* 5EB98 0015EA98 6000B47B */  lq         $20, 0x60($sp)
/* 5EB9C 0015EA9C 5000B37B */  lq         $19, 0x50($sp)
/* 5EBA0 0015EAA0 4000B27B */  lq         $18, 0x40($sp)
/* 5EBA4 0015EAA4 3000B17B */  lq         $17, 0x30($sp)
/* 5EBA8 0015EAA8 2000B07B */  lq         $16, 0x20($sp)
/* 5EBAC 0015EAAC 1000B8C7 */  lwc1       $f24, 0x10($sp)
/* 5EBB0 0015EAB0 0C00B7C7 */  lwc1       $f23, 0xC($sp)
/* 5EBB4 0015EAB4 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* 5EBB8 0015EAB8 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* 5EBBC 0015EABC 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 5EBC0 0015EAC0 0001BD27 */  addiu      $sp, $sp, 0x100
/* 5EBC4 0015EAC4 0800E003 */  jr         $31
/* 5EBC8 0015EAC8 00000000 */   nop
/* 5EBCC 0015EACC 00000000 */  nop
