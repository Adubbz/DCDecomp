.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __throw_catch_compare
/* 22710 00122610 0000C0FC */  sd         $0, 0x0($6)
/* 22714 00122614 0300A014 */  bnez       $5, .L00122624
/* 22718 00122618 2816A070 */   paddub    $2, $5, $0
/* 2271C 0012261C 95000010 */  b          .L00122874
/* 22720 00122620 01000224 */   addiu     $2, $0, 0x1
.L00122624:
/* 22724 00122624 0000A780 */  lb         $7, 0x0($5)
/* 22728 00122628 50000324 */  addiu      $3, $0, 0x50
/* 2272C 0012262C 1B00E314 */  bne        $7, $3, .L0012269C
/* 22730 00122630 00000000 */   nop
/* 22734 00122634 01004224 */  addiu      $2, $2, 0x1
/* 22738 00122638 00004780 */  lb         $7, 0x0($2)
/* 2273C 0012263C 43000324 */  addiu      $3, $0, 0x43
/* 22740 00122640 0200E314 */  bne        $7, $3, .L0012264C
/* 22744 00122644 00000000 */   nop
/* 22748 00122648 01004224 */  addiu      $2, $2, 0x1
.L0012264C:
/* 2274C 0012264C 00004780 */  lb         $7, 0x0($2)
/* 22750 00122650 56000324 */  addiu      $3, $0, 0x56
/* 22754 00122654 0200E314 */  bne        $7, $3, .L00122660
/* 22758 00122658 00000000 */   nop
/* 2275C 0012265C 01004224 */  addiu      $2, $2, 0x1
.L00122660:
/* 22760 00122660 00004380 */  lb         $3, 0x0($2)
/* 22764 00122664 76000224 */  addiu      $2, $0, 0x76
/* 22768 00122668 0C006214 */  bne        $3, $2, .L0012269C
/* 2276C 0012266C 2816A070 */   paddub    $2, $5, $0
/* 22770 00122670 00008380 */  lb         $3, 0x0($4)
/* 22774 00122674 50000224 */  addiu      $2, $0, 0x50
/* 22778 00122678 05006210 */  beq        $3, $2, .L00122690
/* 2277C 0012267C 01000224 */   addiu     $2, $0, 0x1
/* 22780 00122680 2A000224 */  addiu      $2, $0, 0x2A
/* 22784 00122684 04006214 */  bne        $3, $2, .L00122698
/* 22788 00122688 00000000 */   nop
/* 2278C 0012268C 01000224 */  addiu      $2, $0, 0x1
.L00122690:
/* 22790 00122690 78000010 */  b          .L00122874
/* 22794 00122694 00000000 */   nop
.L00122698:
/* 22798 00122698 2816A070 */  paddub     $2, $5, $0
.L0012269C:
/* 2279C 0012269C 00008780 */  lb         $7, 0x0($4)
/* 227A0 001226A0 21000324 */  addiu      $3, $0, 0x21
/* 227A4 001226A4 0A00E310 */  beq        $7, $3, .L001226D0
/* 227A8 001226A8 281E8070 */   paddub    $3, $4, $0
/* 227AC 001226AC 2A000324 */  addiu      $3, $0, 0x2A
/* 227B0 001226B0 0600E310 */  beq        $7, $3, .L001226CC
/* 227B4 001226B4 00000000 */   nop
/* 227B8 001226B8 52000524 */  addiu      $5, $0, 0x52
/* 227BC 001226BC 43000924 */  addiu      $9, $0, 0x43
/* 227C0 001226C0 56000724 */  addiu      $7, $0, 0x56
/* 227C4 001226C4 55000010 */  b          .L0012281C
/* 227C8 001226C8 50000624 */   addiu     $6, $0, 0x50
.L001226CC:
/* 227CC 001226CC 281E8070 */  paddub     $3, $4, $0
.L001226D0:
/* 227D0 001226D0 00006780 */  lb         $7, 0x0($3)
/* 227D4 001226D4 01006424 */  addiu      $4, $3, 0x1
/* 227D8 001226D8 00004380 */  lb         $3, 0x0($2)
/* 227DC 001226DC 0300E310 */  beq        $7, $3, .L001226EC
/* 227E0 001226E0 01004224 */   addiu     $2, $2, 0x1
/* 227E4 001226E4 63000010 */  b          .L00122874
/* 227E8 001226E8 28160070 */   paddub    $2, $0, $0
.L001226EC:
/* 227EC 001226EC 00004380 */  lb         $3, 0x0($2)
.L001226F0:
/* 227F0 001226F0 00008880 */  lb         $8, 0x0($4)
/* 227F4 001226F4 14000315 */  bne        $8, $3, .L00122748
/* 227F8 001226F8 01004224 */   addiu     $2, $2, 0x1
/* 227FC 001226FC 21000724 */  addiu      $7, $0, 0x21
/* 22800 00122700 FAFF0715 */  bne        $8, $7, .L001226EC
/* 22804 00122704 01008424 */   addiu     $4, $4, 0x1
/* 22808 00122708 09000010 */  b          .L00122730
/* 2280C 0012270C 282E0070 */   paddub    $5, $0, $0
/* 22810 00122710 3C180200 */  dsll32     $3, $2, 0
.L00122714:
/* 22814 00122714 B8100500 */  dsll       $2, $5, 2
/* 22818 00122718 2D104500 */  daddu      $2, $2, $5
/* 2281C 0012271C 3F180300 */  dsra32     $3, $3, 0
/* 22820 00122720 78100200 */  dsll       $2, $2, 1
/* 22824 00122724 2D106200 */  daddu      $2, $3, $2
/* 22828 00122728 01008424 */  addiu      $4, $4, 0x1
/* 2282C 0012272C D0FF4564 */  daddiu     $5, $2, -0x30
.L00122730:
/* 22830 00122730 00008280 */  lb         $2, 0x0($4)
/* 22834 00122734 F7FF4714 */  bne        $2, $7, .L00122714
/* 22838 00122738 3C180200 */   dsll32    $3, $2, 0
/* 2283C 0012273C 01000224 */  addiu      $2, $0, 0x1
/* 22840 00122740 4C000010 */  b          .L00122874
/* 22844 00122744 0000C5FC */   sd        $5, 0x0($6)
.L00122748:
/* 22848 00122748 28168070 */  paddub     $2, $4, $0
/* 2284C 0012274C 01004424 */  addiu      $4, $2, 0x1
/* 22850 00122750 00004280 */  lb         $2, 0x0($2)
/* 22854 00122754 21000324 */  addiu      $3, $0, 0x21
/* 22858 00122758 00000000 */  nop
/* 2285C 0012275C FAFF4314 */  bne        $2, $3, .L00122748
/* 22860 00122760 00000000 */   nop
/* 22864 00122764 00000000 */  nop
.L00122768:
/* 22868 00122768 28168070 */  paddub     $2, $4, $0
/* 2286C 0012276C 01004424 */  addiu      $4, $2, 0x1
/* 22870 00122770 00004280 */  lb         $2, 0x0($2)
/* 22874 00122774 00000000 */  nop
/* 22878 00122778 00000000 */  nop
/* 2287C 0012277C FAFF4314 */  bne        $2, $3, .L00122768
/* 22880 00122780 00000000 */   nop
/* 22884 00122784 00008280 */  lb         $2, 0x0($4)
/* 22888 00122788 04004014 */  bnez       $2, .L0012279C
/* 2288C 0012278C 0100A224 */   addiu     $2, $5, 0x1
/* 22890 00122790 38000010 */  b          .L00122874
/* 22894 00122794 28160070 */   paddub    $2, $0, $0
/* 22898 00122798 0100A224 */  addiu      $2, $5, 0x1
.L0012279C:
/* 2289C 0012279C D4FF0010 */  b          .L001226F0
/* 228A0 001227A0 00004380 */   lb        $3, 0x0($2)
/* 228A4 001227A4 01004224 */  addiu      $2, $2, 0x1
.L001227A8:
/* 228A8 001227A8 00004380 */  lb         $3, 0x0($2)
/* 228AC 001227AC 08006914 */  bne        $3, $9, .L001227D0
/* 228B0 001227B0 01008424 */   addiu     $4, $4, 0x1
/* 228B4 001227B4 00008380 */  lb         $3, 0x0($4)
/* 228B8 001227B8 04006954 */  bnel       $3, $9, .L001227CC
/* 228BC 001227BC 01004224 */   addiu     $2, $2, 0x1
/* 228C0 001227C0 01008424 */  addiu      $4, $4, 0x1
/* 228C4 001227C4 00000000 */  nop
/* 228C8 001227C8 01004224 */  addiu      $2, $2, 0x1
.L001227CC:
/* 228CC 001227CC 00000000 */  nop
.L001227D0:
/* 228D0 001227D0 00008880 */  lb         $8, 0x0($4)
/* 228D4 001227D4 03000915 */  bne        $8, $9, .L001227E4
/* 228D8 001227D8 00000000 */   nop
/* 228DC 001227DC 25000010 */  b          .L00122874
/* 228E0 001227E0 28160070 */   paddub    $2, $0, $0
.L001227E4:
/* 228E4 001227E4 00004380 */  lb         $3, 0x0($2)
/* 228E8 001227E8 07006714 */  bne        $3, $7, .L00122808
/* 228EC 001227EC 00000000 */   nop
/* 228F0 001227F0 04000755 */  bnel       $8, $7, .L00122804
/* 228F4 001227F4 01004224 */   addiu     $2, $2, 0x1
/* 228F8 001227F8 01008424 */  addiu      $4, $4, 0x1
/* 228FC 001227FC 00000000 */  nop
/* 22900 00122800 01004224 */  addiu      $2, $2, 0x1
.L00122804:
/* 22904 00122804 00000000 */  nop
.L00122808:
/* 22908 00122808 00008380 */  lb         $3, 0x0($4)
/* 2290C 0012280C 03006714 */  bne        $3, $7, .L0012281C
/* 22910 00122810 00000000 */   nop
/* 22914 00122814 17000010 */  b          .L00122874
/* 22918 00122818 28160070 */   paddub    $2, $0, $0
.L0012281C:
/* 2291C 0012281C 00008880 */  lb         $8, 0x0($4)
/* 22920 00122820 03000611 */  beq        $8, $6, .L00122830
/* 22924 00122824 00000000 */   nop
/* 22928 00122828 0D000515 */  bne        $8, $5, .L00122860
/* 2292C 0012282C 00000000 */   nop
.L00122830:
/* 22930 00122830 00004380 */  lb         $3, 0x0($2)
/* 22934 00122834 DCFF0351 */  beql       $8, $3, .L001227A8
/* 22938 00122838 01004224 */   addiu     $2, $2, 0x1
/* 2293C 0012283C 09000010 */  b          .L00122864
/* 22940 00122840 00008580 */   lb        $5, 0x0($4)
.L00122844:
/* 22944 00122844 0400A054 */  bnel       $5, $0, .L00122858
/* 22948 00122848 01008424 */   addiu     $4, $4, 0x1
/* 2294C 0012284C 09000010 */  b          .L00122874
/* 22950 00122850 01000224 */   addiu     $2, $0, 0x1
/* 22954 00122854 01008424 */  addiu      $4, $4, 0x1
.L00122858:
/* 22958 00122858 01004224 */  addiu      $2, $2, 0x1
/* 2295C 0012285C 00000000 */  nop
.L00122860:
/* 22960 00122860 00008580 */  lb         $5, 0x0($4)
.L00122864:
/* 22964 00122864 00004380 */  lb         $3, 0x0($2)
/* 22968 00122868 F6FFA310 */  beq        $5, $3, .L00122844
/* 2296C 0012286C 00000000 */   nop
/* 22970 00122870 28160070 */  paddub     $2, $0, $0
.L00122874:
/* 22974 00122874 0800E003 */  jr         $31
/* 22978 00122878 00000000 */   nop
/* 2297C 0012287C 00000000 */  nop