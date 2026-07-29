.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetRotY__9CMapPartsFi
/* 09A950 0019A850 F0FFBD27 */  addiu       $29, $29, -0x10
/* 09A954 0019A854 0000BF7F */  sq          $31, 0x0($29)
/* 09A958 0019A858 F80085AC */  sw          $5, 0xF8($4)
/* 09A95C 0019A85C 00008544 */  mtc1        $5, $f0
/* 09A960 0019A860 00000000 */  nop
/* 09A964 0019A864 60008046 */  cvt.s.w     $f1, $f0
/* 09A968 0019A868 B08080C7 */  lwc1        $f0, -0x7F50($28)
/* 09A96C 0019A86C 42000146 */  mul.s       $f1, $f0, $f1
/* 09A970 0019A870 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 09A974 0019A874 00008244 */  mtc1        $2, $f0
/* 09A978 0019A878 00000000 */  nop
/* 09A97C 0019A87C 42030146 */  mul.s       $f13, $f0, $f1
/* 09A980 0019A880 00708044 */  mtc1        $0, $f14
/* 09A984 0019A884 00000000 */  nop
/* 09A988 0019A888 06730046 */  mov.s       $f12, $f14
/* 09A98C 0019A88C A000998C */  lw          $25, 0xA0($4)
/* 09A990 0019A890 3000398F */  lw          $25, 0x30($25)
/* 09A994 0019A894 09F82003 */  jalr        $25
/* 09A998 0019A898 00000000 */   nop
/* 09A99C 0019A89C 0000BF7B */  lq          $31, 0x0($29)
/* 09A9A0 0019A8A0 1000BD27 */  addiu       $29, $29, 0x10
/* 09A9A4 0019A8A4 0800E003 */  jr          $31
/* 09A9A8 0019A8A8 00000000 */   nop
/* 09A9AC 0019A8AC 00000000 */  nop
