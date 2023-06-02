.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __smakebuf
/* 27A0 001026A0 50FFBD27 */  addiu      $sp, $sp, -0xB0
/* 27A4 001026A4 7000B0FF */  sd         $16, 0x70($sp)
/* 27A8 001026A8 A000BFFF */  sd         $31, 0xA0($sp)
/* 27AC 001026AC 2D808000 */  daddu      $16, $4, $0
/* 27B0 001026B0 9000B2FF */  sd         $18, 0x90($sp)
/* 27B4 001026B4 8000B1FF */  sd         $17, 0x80($sp)
/* 27B8 001026B8 0C000396 */  lhu        $3, 0xC($16)
/* 27BC 001026BC 02006230 */  andi       $2, $3, 0x2
/* 27C0 001026C0 06004010 */  beqz       $2, .L001026DC
/* 27C4 001026C4 01000224 */   addiu     $2, $0, 0x1
/* 27C8 001026C8 43000326 */  addiu      $3, $16, 0x43
/* 27CC 001026CC 140002AE */  sw         $2, 0x14($16)
/* 27D0 001026D0 100003AE */  sw         $3, 0x10($16)
/* 27D4 001026D4 40000010 */  b          .L001027D8
/* 27D8 001026D8 000003AE */   sw        $3, 0x0($16)
.L001026DC:
/* 27DC 001026DC 0E000586 */  lh         $5, 0xE($16)
/* 27E0 001026E0 0800A004 */  bltz       $5, .L00102704
/* 27E4 001026E4 00086234 */   ori       $2, $3, 0x800
/* 27E8 001026E8 5400048E */  lw         $4, 0x54($16)
/* 27EC 001026EC 2008040C */  jal        _fstat_r
/* 27F0 001026F0 2D30A003 */   daddu     $6, $sp, $0
/* 27F4 001026F4 07004104 */  bgez       $2, .L00102714
/* 27F8 001026F8 0400A28F */   lw        $2, 0x4($sp)
/* 27FC 001026FC 0C000396 */  lhu        $3, 0xC($16)
/* 2800 00102700 00086234 */  ori        $2, $3, 0x800
.L00102704:
/* 2804 00102704 2D880000 */  daddu      $17, $0, $0
/* 2808 00102708 0C0002A6 */  sh         $2, 0xC($16)
/* 280C 0010270C 13000010 */  b          .L0010275C
/* 2810 00102710 00041224 */   addiu     $18, $0, 0x400
.L00102714:
/* 2814 00102714 00041224 */  addiu      $18, $0, 0x400
/* 2818 00102718 00800434 */  ori        $4, $0, 0x8000
/* 281C 0010271C 00F05130 */  andi       $17, $2, 0xF000
/* 2820 00102720 2D102002 */  daddu      $2, $17, $0
/* 2824 00102724 0020233A */  xori       $3, $17, 0x2000
/* 2828 00102728 09004414 */  bne        $2, $4, .L00102750
/* 282C 0010272C 0100712C */   sltiu     $17, $3, 0x1
/* 2830 00102730 1000023C */  lui        $2, %hi(__sseek)
/* 2834 00102734 2800038E */  lw         $3, 0x28($16)
/* 2838 00102738 B0514224 */  addiu      $2, $2, %lo(__sseek)
/* 283C 0010273C 05006214 */  bne        $3, $2, .L00102754
/* 2840 00102740 0C000296 */   lhu       $2, 0xC($16)
/* 2844 00102744 4C0012AE */  sw         $18, 0x4C($16)
/* 2848 00102748 03000010 */  b          .L00102758
/* 284C 0010274C 00044234 */   ori       $2, $2, 0x400
.L00102750:
/* 2850 00102750 0C000296 */  lhu        $2, 0xC($16)
.L00102754:
/* 2854 00102754 00084234 */  ori        $2, $2, 0x800
.L00102758:
/* 2858 00102758 0C0002A6 */  sh         $2, 0xC($16)
.L0010275C:
/* 285C 0010275C 5400048E */  lw         $4, 0x54($16)
/* 2860 00102760 A00A040C */  jal        _malloc_r
/* 2864 00102764 00040524 */   addiu     $5, $0, 0x400
/* 2868 00102768 2D284000 */  daddu      $5, $2, $0
/* 286C 0010276C 0900A014 */  bnez       $5, .L00102794
/* 2870 00102770 0C000296 */   lhu       $2, 0xC($16)
/* 2874 00102774 43000426 */  addiu      $4, $16, 0x43
/* 2878 00102778 01000324 */  addiu      $3, $0, 0x1
/* 287C 0010277C 100004AE */  sw         $4, 0x10($16)
/* 2880 00102780 02004234 */  ori        $2, $2, 0x2
/* 2884 00102784 140003AE */  sw         $3, 0x14($16)
/* 2888 00102788 0C0002A6 */  sh         $2, 0xC($16)
/* 288C 0010278C 12000010 */  b          .L001027D8
/* 2890 00102790 000004AE */   sw        $4, 0x0($16)
.L00102794:
/* 2894 00102794 1000033C */  lui        $3, %hi(_cleanup_r)
/* 2898 00102798 5400048E */  lw         $4, 0x54($16)
/* 289C 0010279C D01A6324 */  addiu      $3, $3, %lo(_cleanup_r)
/* 28A0 001027A0 80004234 */  ori        $2, $2, 0x80
/* 28A4 001027A4 100005AE */  sw         $5, 0x10($16)
/* 28A8 001027A8 3C0083AC */  sw         $3, 0x3C($4)
/* 28AC 001027AC 0C0002A6 */  sh         $2, 0xC($16)
/* 28B0 001027B0 140012AE */  sw         $18, 0x14($16)
/* 28B4 001027B4 08002012 */  beqz       $17, .L001027D8
/* 28B8 001027B8 000005AE */   sw        $5, 0x0($16)
/* 28BC 001027BC 8852040C */  jal        isatty
/* 28C0 001027C0 0E000486 */   lh        $4, 0xE($16)
/* 28C4 001027C4 05004010 */  beqz       $2, .L001027DC
/* 28C8 001027C8 A000BFDF */   ld        $31, 0xA0($sp)
/* 28CC 001027CC 0C000296 */  lhu        $2, 0xC($16)
/* 28D0 001027D0 01004234 */  ori        $2, $2, 0x1
/* 28D4 001027D4 0C0002A6 */  sh         $2, 0xC($16)
.L001027D8:
/* 28D8 001027D8 A000BFDF */  ld         $31, 0xA0($sp)
.L001027DC:
/* 28DC 001027DC 9000B2DF */  ld         $18, 0x90($sp)
/* 28E0 001027E0 8000B1DF */  ld         $17, 0x80($sp)
/* 28E4 001027E4 7000B0DF */  ld         $16, 0x70($sp)
/* 28E8 001027E8 0800E003 */  jr         $31
/* 28EC 001027EC B000BD27 */   addiu     $sp, $sp, 0xB0