.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __floatdidf
/* E838 0010E738 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* E83C 0010E73C 0000B0FF */  sd         $16, 0x0($sp)
/* E840 0010E740 2D808000 */  daddu      $16, $4, $0
/* E844 0010E744 1000B1FF */  sd         $17, 0x10($sp)
/* E848 0010E748 E0811134 */  ori        $17, $0, 0x81E0
/* E84C 0010E74C FC8B1100 */  dsll32     $17, $17, 15
/* E850 0010E750 3F201000 */  dsra32     $4, $16, 0
/* E854 0010E754 2000BFFF */  sd         $31, 0x20($sp)
/* E858 0010E758 FC40040C */  jal        litodp
/* E85C 0010E75C 00000000 */   nop
/* E860 0010E760 2D282002 */  daddu      $5, $17, $0
/* E864 0010E764 9E3F040C */  jal        dpmul
/* E868 0010E768 2D204000 */   daddu     $4, $2, $0
/* E86C 0010E76C 2D282002 */  daddu      $5, $17, $0
/* E870 0010E770 9E3F040C */  jal        dpmul
/* E874 0010E774 2D204000 */   daddu     $4, $2, $0
/* E878 0010E778 2D884000 */  daddu      $17, $2, $0
/* E87C 0010E77C FFFF023C */  lui        $2, (0xFFFF0000 >> 16)
/* E880 0010E780 3E100200 */  dsrl32     $2, $2, 0
/* E884 0010E784 24800202 */  and        $16, $16, $2
/* E888 0010E788 3C801000 */  dsll32     $16, $16, 0
/* E88C 0010E78C 3F801000 */  dsra32     $16, $16, 0
/* E890 0010E790 FC40040C */  jal        litodp
/* E894 0010E794 2D200002 */   daddu     $4, $16, $0
/* E898 0010E798 06000106 */  bgez       $16, .L0010E7B4
/* E89C 0010E79C 2D202002 */   daddu     $4, $17, $0
/* E8A0 0010E7A0 E0830534 */  ori        $5, $0, 0x83E0
/* E8A4 0010E7A4 FC2B0500 */  dsll32     $5, $5, 15
/* E8A8 0010E7A8 6E3F040C */  jal        dpadd
/* E8AC 0010E7AC 2D204000 */   daddu     $4, $2, $0
/* E8B0 0010E7B0 2D202002 */  daddu      $4, $17, $0
.L0010E7B4:
/* E8B4 0010E7B4 6E3F040C */  jal        dpadd
/* E8B8 0010E7B8 2D284000 */   daddu     $5, $2, $0
/* E8BC 0010E7BC 2000BFDF */  ld         $31, 0x20($sp)
/* E8C0 0010E7C0 1000B1DF */  ld         $17, 0x10($sp)
/* E8C4 0010E7C4 0000B0DF */  ld         $16, 0x0($sp)
/* E8C8 0010E7C8 0800E003 */  jr         $31
/* E8CC 0010E7CC 3000BD27 */   addiu     $sp, $sp, 0x30
