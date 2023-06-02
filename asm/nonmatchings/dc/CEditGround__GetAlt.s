.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetAlt__11CEditGroundFfff
/* A1860 001A1760 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* A1864 001A1764 2000BF7F */  sq         $31, 0x20($sp)
/* A1868 001A1768 1000B07F */  sq         $16, 0x10($sp)
/* A186C 001A176C 0800B6E7 */  swc1       $f22, 0x8($sp)
/* A1870 001A1770 0400B5E7 */  swc1       $f21, 0x4($sp)
/* A1874 001A1774 0000B4E7 */  swc1       $f20, 0x0($sp)
/* A1878 001A1778 28868070 */  paddub     $16, $4, $0
/* A187C 001A177C 86650046 */  mov.s      $f22, $f12
/* A1880 001A1780 466D0046 */  mov.s      $f21, $f13
/* A1884 001A1784 06750046 */  mov.s      $f20, $f14
/* A1888 001A1788 AC85060C */  jal        GetAreaCode__11CEditGroundFfff
/* A188C 001A178C 00000000 */   nop
/* A1890 001A1790 04004104 */  bgez       $2, .L001A17A4
/* A1894 001A1794 00000000 */   nop
/* A1898 001A1798 00008044 */  mtc1       $0, $f0
/* A189C 001A179C 09000010 */  b          .L001A17C4
/* A18A0 001A17A0 00000000 */   nop
.L001A17A4:
/* A18A4 001A17A4 80100200 */  sll        $2, $2, 2
/* A18A8 001A17A8 21105000 */  addu       $2, $2, $16
/* A18AC 001A17AC 0400448C */  lw         $4, 0x4($2)
/* A18B0 001A17B0 06B30046 */  mov.s      $f12, $f22
/* A18B4 001A17B4 46AB0046 */  mov.s      $f13, $f21
/* A18B8 001A17B8 86A30046 */  mov.s      $f14, $f20
/* A18BC 001A17BC 7CB7050C */  jal        GetAlt__9CEditAreaFfff
/* A18C0 001A17C0 00000000 */   nop
.L001A17C4:
/* A18C4 001A17C4 2000BF7B */  lq         $31, 0x20($sp)
/* A18C8 001A17C8 1000B07B */  lq         $16, 0x10($sp)
/* A18CC 001A17CC 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* A18D0 001A17D0 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* A18D4 001A17D4 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* A18D8 001A17D8 3000BD27 */  addiu      $sp, $sp, 0x30
/* A18DC 001A17DC 0800E003 */  jr         $31
/* A18E0 001A17E0 00000000 */   nop
/* A18E4 001A17E4 00000000 */  nop
/* A18E8 001A17E8 00000000 */  nop
/* A18EC 001A17EC 00000000 */  nop
