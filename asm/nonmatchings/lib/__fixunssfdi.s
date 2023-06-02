.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __fixunssfdi
/* E740 0010E640 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* E744 0010E644 1000B1FF */  sd         $17, 0x10($sp)
/* E748 0010E648 3000BFFF */  sd         $31, 0x30($sp)
/* E74C 0010E64C 2000B2FF */  sd         $18, 0x20($sp)
/* E750 0010E650 9044040C */  jal        fptodp
/* E754 0010E654 0000B0FF */   sd        $16, 0x0($sp)
/* E758 0010E658 2D884000 */  daddu      $17, $2, $0
/* E75C 0010E65C 2D280000 */  daddu      $5, $0, $0
/* E760 0010E660 E840040C */  jal        dpcmp
/* E764 0010E664 2D202002 */   daddu     $4, $17, $0
/* E768 0010E668 2C004004 */  bltz       $2, .L0010E71C
/* E76C 0010E66C 2D100000 */   daddu     $2, $0, $0
/* E770 0010E670 C0F70534 */  ori        $5, $0, 0xF7C0
/* E774 0010E674 BC2B0500 */  dsll32     $5, $5, 14
/* E778 0010E678 9E3F040C */  jal        dpmul
/* E77C 0010E67C 2D202002 */   daddu     $4, $17, $0
/* E780 0010E680 5041040C */  jal        dptoul
/* E784 0010E684 2D204000 */   daddu     $4, $2, $0
/* E788 0010E688 3C800200 */  dsll32     $16, $2, 0
/* E78C 0010E68C 05000006 */  bltz       $16, .L0010E6A4
/* E790 0010E690 01000232 */   andi      $2, $16, 0x1
/* E794 0010E694 CE39040C */  jal        __floatdidf
/* E798 0010E698 2D200002 */   daddu     $4, $16, $0
/* E79C 0010E69C 08000010 */  b          .L0010E6C0
/* E7A0 0010E6A0 2D202002 */   daddu     $4, $17, $0
.L0010E6A4:
/* E7A4 0010E6A4 7A201000 */  dsrl       $4, $16, 1
/* E7A8 0010E6A8 CE39040C */  jal        __floatdidf
/* E7AC 0010E6AC 25204400 */   or        $4, $2, $4
/* E7B0 0010E6B0 2D204000 */  daddu      $4, $2, $0
/* E7B4 0010E6B4 6E3F040C */  jal        dpadd
/* E7B8 0010E6B8 2D288000 */   daddu     $5, $4, $0
/* E7BC 0010E6BC 2D202002 */  daddu      $4, $17, $0
.L0010E6C0:
/* E7C0 0010E6C0 843F040C */  jal        dpsub
/* E7C4 0010E6C4 2D284000 */   daddu     $5, $2, $0
/* E7C8 0010E6C8 2D900000 */  daddu      $18, $0, $0
/* E7CC 0010E6CC 2D884000 */  daddu      $17, $2, $0
/* E7D0 0010E6D0 2D284002 */  daddu      $5, $18, $0
/* E7D4 0010E6D4 E840040C */  jal        dpcmp
/* E7D8 0010E6D8 2D202002 */   daddu     $4, $17, $0
/* E7DC 0010E6DC 09004104 */  bgez       $2, .L0010E704
/* E7E0 0010E6E0 2D204002 */   daddu     $4, $18, $0
/* E7E4 0010E6E4 843F040C */  jal        dpsub
/* E7E8 0010E6E8 2D282002 */   daddu     $5, $17, $0
/* E7EC 0010E6EC 5041040C */  jal        dptoul
/* E7F0 0010E6F0 2D204000 */   daddu     $4, $2, $0
/* E7F4 0010E6F4 3C100200 */  dsll32     $2, $2, 0
/* E7F8 0010E6F8 3E100200 */  dsrl32     $2, $2, 0
/* E7FC 0010E6FC 06000010 */  b          .L0010E718
/* E800 0010E700 2F800202 */   dsubu     $16, $16, $2
.L0010E704:
/* E804 0010E704 5041040C */  jal        dptoul
/* E808 0010E708 2D202002 */   daddu     $4, $17, $0
/* E80C 0010E70C 3C100200 */  dsll32     $2, $2, 0
/* E810 0010E710 3E100200 */  dsrl32     $2, $2, 0
/* E814 0010E714 2D800202 */  daddu      $16, $16, $2
.L0010E718:
/* E818 0010E718 2D100002 */  daddu      $2, $16, $0
.L0010E71C:
/* E81C 0010E71C 3000BFDF */  ld         $31, 0x30($sp)
/* E820 0010E720 2000B2DF */  ld         $18, 0x20($sp)
/* E824 0010E724 1000B1DF */  ld         $17, 0x10($sp)
/* E828 0010E728 0000B0DF */  ld         $16, 0x0($sp)
/* E82C 0010E72C 0800E003 */  jr         $31
/* E830 0010E730 4000BD27 */   addiu     $sp, $sp, 0x40
/* E834 0010E734 00000000 */  nop
