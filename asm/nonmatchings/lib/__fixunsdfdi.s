.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __fixunsdfdi
/* E650 0010E550 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* E654 0010E554 2D280000 */  daddu      $5, $0, $0
/* E658 0010E558 1000B1FF */  sd         $17, 0x10($sp)
/* E65C 0010E55C 2D888000 */  daddu      $17, $4, $0
/* E660 0010E560 3000BFFF */  sd         $31, 0x30($sp)
/* E664 0010E564 2000B2FF */  sd         $18, 0x20($sp)
/* E668 0010E568 E840040C */  jal        dpcmp
/* E66C 0010E56C 0000B0FF */   sd        $16, 0x0($sp)
/* E670 0010E570 2C004004 */  bltz       $2, .L0010E624
/* E674 0010E574 2D100000 */   daddu     $2, $0, $0
/* E678 0010E578 C0F70534 */  ori        $5, $0, 0xF7C0
/* E67C 0010E57C BC2B0500 */  dsll32     $5, $5, 14
/* E680 0010E580 9E3F040C */  jal        dpmul
/* E684 0010E584 2D202002 */   daddu     $4, $17, $0
/* E688 0010E588 5041040C */  jal        dptoul
/* E68C 0010E58C 2D204000 */   daddu     $4, $2, $0
/* E690 0010E590 3C800200 */  dsll32     $16, $2, 0
/* E694 0010E594 05000006 */  bltz       $16, .L0010E5AC
/* E698 0010E598 01000232 */   andi      $2, $16, 0x1
/* E69C 0010E59C CE39040C */  jal        __floatdidf
/* E6A0 0010E5A0 2D200002 */   daddu     $4, $16, $0
/* E6A4 0010E5A4 08000010 */  b          .L0010E5C8
/* E6A8 0010E5A8 2D202002 */   daddu     $4, $17, $0
.L0010E5AC:
/* E6AC 0010E5AC 7A201000 */  dsrl       $4, $16, 1
/* E6B0 0010E5B0 CE39040C */  jal        __floatdidf
/* E6B4 0010E5B4 25204400 */   or        $4, $2, $4
/* E6B8 0010E5B8 2D204000 */  daddu      $4, $2, $0
/* E6BC 0010E5BC 6E3F040C */  jal        dpadd
/* E6C0 0010E5C0 2D288000 */   daddu     $5, $4, $0
/* E6C4 0010E5C4 2D202002 */  daddu      $4, $17, $0
.L0010E5C8:
/* E6C8 0010E5C8 843F040C */  jal        dpsub
/* E6CC 0010E5CC 2D284000 */   daddu     $5, $2, $0
/* E6D0 0010E5D0 2D900000 */  daddu      $18, $0, $0
/* E6D4 0010E5D4 2D884000 */  daddu      $17, $2, $0
/* E6D8 0010E5D8 2D284002 */  daddu      $5, $18, $0
/* E6DC 0010E5DC E840040C */  jal        dpcmp
/* E6E0 0010E5E0 2D202002 */   daddu     $4, $17, $0
/* E6E4 0010E5E4 09004104 */  bgez       $2, .L0010E60C
/* E6E8 0010E5E8 2D204002 */   daddu     $4, $18, $0
/* E6EC 0010E5EC 843F040C */  jal        dpsub
/* E6F0 0010E5F0 2D282002 */   daddu     $5, $17, $0
/* E6F4 0010E5F4 5041040C */  jal        dptoul
/* E6F8 0010E5F8 2D204000 */   daddu     $4, $2, $0
/* E6FC 0010E5FC 3C100200 */  dsll32     $2, $2, 0
/* E700 0010E600 3E100200 */  dsrl32     $2, $2, 0
/* E704 0010E604 06000010 */  b          .L0010E620
/* E708 0010E608 2F800202 */   dsubu     $16, $16, $2
.L0010E60C:
/* E70C 0010E60C 5041040C */  jal        dptoul
/* E710 0010E610 2D202002 */   daddu     $4, $17, $0
/* E714 0010E614 3C100200 */  dsll32     $2, $2, 0
/* E718 0010E618 3E100200 */  dsrl32     $2, $2, 0
/* E71C 0010E61C 2D800202 */  daddu      $16, $16, $2
.L0010E620:
/* E720 0010E620 2D100002 */  daddu      $2, $16, $0
.L0010E624:
/* E724 0010E624 3000BFDF */  ld         $31, 0x30($sp)
/* E728 0010E628 2000B2DF */  ld         $18, 0x20($sp)
/* E72C 0010E62C 1000B1DF */  ld         $17, 0x10($sp)
/* E730 0010E630 0000B0DF */  ld         $16, 0x0($sp)
/* E734 0010E634 0800E003 */  jr         $31
/* E738 0010E638 4000BD27 */   addiu     $sp, $sp, 0x40
/* E73C 0010E63C 00000000 */  nop
