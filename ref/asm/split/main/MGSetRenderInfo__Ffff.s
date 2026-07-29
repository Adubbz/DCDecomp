.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MGSetRenderInfo__Ffff
/* 02D7E0 0012D6E0 A0FFBD27 */  addiu       $29, $29, -0x60
/* 02D7E4 0012D6E4 1000BF7F */  sq          $31, 0x10($29)
/* 02D7E8 0012D6E8 0800B6E7 */  swc1        $f22, 0x8($29)
/* 02D7EC 0012D6EC 0400B5E7 */  swc1        $f21, 0x4($29)
/* 02D7F0 0012D6F0 0000B4E7 */  swc1        $f20, 0x0($29)
/* 02D7F4 0012D6F4 42680E46 */  mul.s       $f1, $f13, $f14
/* 02D7F8 0012D6F8 FE00023C */  lui         $2, (0xFED260 >> 16)
/* 02D7FC 0012D6FC 5FD24334 */  ori         $3, $2, (0xFED25F & 0xFFFF)
/* 02D800 0012D700 00008344 */  mtc1        $3, $f0
/* 02D804 0012D704 00000000 */  nop
/* 02D808 0012D708 20008046 */  cvt.s.w     $f0, $f0
/* 02D80C 0012D70C 02080046 */  mul.s       $f0, $f1, $f0
/* 02D810 0012D710 41700D46 */  sub.s       $f1, $f14, $f13
/* 02D814 0012D714 83000146 */  div.s       $f2, $f0, $f1
/* 02D818 0012D718 60D24234 */  ori         $2, $2, (0xFED260 & 0xFFFF)
/* 02D81C 0012D71C 00008244 */  mtc1        $2, $f0
/* 02D820 0012D720 00000000 */  nop
/* 02D824 0012D724 20008046 */  cvt.s.w     $f0, $f0
/* 02D828 0012D728 1A000D46 */  mula.s      $f0, $f13
/* 02D82C 0012D72C 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 02D830 0012D730 00008244 */  mtc1        $2, $f0
/* 02D834 0012D734 00000000 */  nop
/* 02D838 0012D738 1D000E46 */  msub.s      $f0, $f0, $f14
/* 02D83C 0012D73C 07000046 */  neg.s       $f0, $f0
/* 02D840 0012D740 03000146 */  div.s       $f0, $f0, $f1
/* 02D844 0012D744 C701013C */  lui         $1, %hi(mgRenderInfo)
/* 02D848 0012D748 20552CE4 */  swc1        $f12, %lo(mgRenderInfo)($1)
/* 02D84C 0012D74C C701013C */  lui         $1, %hi(mgRenderInfo + 0x1A0)
/* 02D850 0012D750 C0562CE4 */  swc1        $f12, %lo(mgRenderInfo + 0x1A0)($1)
/* 02D854 0012D754 C701013C */  lui         $1, %hi(mgRenderInfo + 0x1A4)
/* 02D858 0012D758 C4562CE4 */  swc1        $f12, %lo(mgRenderInfo + 0x1A4)($1)
/* 02D85C 0012D75C C701013C */  lui         $1, %hi(mgRenderInfo + 0x1A8)
/* 02D860 0012D760 C85622E4 */  swc1        $f2, %lo(mgRenderInfo + 0x1A8)($1)
/* 02D864 0012D764 0045023C */  lui         $2, (0x45000000 >> 16)
/* 02D868 0012D768 C701013C */  lui         $1, %hi(mgRenderInfo + 0x1B0)
/* 02D86C 0012D76C D05622AC */  sw          $2, %lo(mgRenderInfo + 0x1B0)($1)
/* 02D870 0012D770 C701013C */  lui         $1, %hi(mgRenderInfo + 0x1B4)
/* 02D874 0012D774 D45622AC */  sw          $2, %lo(mgRenderInfo + 0x1B4)($1)
/* 02D878 0012D778 C701013C */  lui         $1, %hi(mgRenderInfo + 0x1B8)
/* 02D87C 0012D77C D85620E4 */  swc1        $f0, %lo(mgRenderInfo + 0x1B8)($1)
/* 02D880 0012D780 C701013C */  lui         $1, %hi(mgRenderInfo + 0x1C0)
/* 02D884 0012D784 E05620AC */  sw          $0, %lo(mgRenderInfo + 0x1C0)($1)
/* 02D888 0012D788 C701013C */  lui         $1, %hi(mgRenderInfo + 0x1C4)
/* 02D88C 0012D78C E45620AC */  sw          $0, %lo(mgRenderInfo + 0x1C4)($1)
/* 02D890 0012D790 C701013C */  lui         $1, %hi(mgRenderInfo + 0x1C8)
/* 02D894 0012D794 E8562DE4 */  swc1        $f13, %lo(mgRenderInfo + 0x1C8)($1)
/* 02D898 0012D798 B48081C7 */  lwc1        $f1, -0x7F4C($28)
/* 02D89C 0012D79C C701013C */  lui         $1, %hi(mgRenderInfo + 0x1D0)
/* 02D8A0 0012D7A0 F05621E4 */  swc1        $f1, %lo(mgRenderInfo + 0x1D0)($1)
/* 02D8A4 0012D7A4 C701013C */  lui         $1, %hi(mgRenderInfo + 0x1D4)
/* 02D8A8 0012D7A8 F45621E4 */  swc1        $f1, %lo(mgRenderInfo + 0x1D4)($1)
/* 02D8AC 0012D7AC C701013C */  lui         $1, %hi(mgRenderInfo + 0x1D8)
/* 02D8B0 0012D7B0 F8562EE4 */  swc1        $f14, %lo(mgRenderInfo + 0x1D8)($1)
/* 02D8B4 0012D7B4 C701013C */  lui         $1, %hi(mgRenderInfo + 0x220)
/* 02D8B8 0012D7B8 405720AC */  sw          $0, %lo(mgRenderInfo + 0x220)($1)
/* 02D8BC 0012D7BC C701013C */  lui         $1, %hi(mgRenderInfo + 0x224)
/* 02D8C0 0012D7C0 445720AC */  sw          $0, %lo(mgRenderInfo + 0x224)($1)
/* 02D8C4 0012D7C4 C701013C */  lui         $1, %hi(mgRenderInfo + 0x228)
/* 02D8C8 0012D7C8 485720AC */  sw          $0, %lo(mgRenderInfo + 0x228)($1)
/* 02D8CC 0012D7CC C701013C */  lui         $1, %hi(mgRenderInfo + 0x1C8)
/* 02D8D0 0012D7D0 E85620C4 */  lwc1        $f0, %lo(mgRenderInfo + 0x1C8)($1)
/* 02D8D4 0012D7D4 C701013C */  lui         $1, %hi(mgRenderInfo + 0x22C)
/* 02D8D8 0012D7D8 4C5720E4 */  swc1        $f0, %lo(mgRenderInfo + 0x22C)($1)
/* 02D8DC 0012D7DC C701013C */  lui         $1, %hi(mgRenderInfo + 0x210)
/* 02D8E0 0012D7E0 305721E4 */  swc1        $f1, %lo(mgRenderInfo + 0x210)($1)
/* 02D8E4 0012D7E4 C701013C */  lui         $1, %hi(mgRenderInfo + 0x214)
/* 02D8E8 0012D7E8 345721E4 */  swc1        $f1, %lo(mgRenderInfo + 0x214)($1)
/* 02D8EC 0012D7EC C701013C */  lui         $1, %hi(mgRenderInfo + 0x218)
/* 02D8F0 0012D7F0 385720AC */  sw          $0, %lo(mgRenderInfo + 0x218)($1)
/* 02D8F4 0012D7F4 C701013C */  lui         $1, %hi(mgRenderInfo + 0x1D8)
/* 02D8F8 0012D7F8 F85620C4 */  lwc1        $f0, %lo(mgRenderInfo + 0x1D8)($1)
/* 02D8FC 0012D7FC C701013C */  lui         $1, %hi(mgRenderInfo + 0x21C)
/* 02D900 0012D800 3C5720E4 */  swc1        $f0, %lo(mgRenderInfo + 0x21C)($1)
/* 02D904 0012D804 2000A427 */  addiu       $4, $29, 0x20
/* 02D908 0012D808 2A86040C */  jal         sceVu0UnitMatrix
/* 02D90C 0012D80C 00000000 */   nop
/* 02D910 0012D810 C701013C */  lui         $1, %hi(mgRenderInfo + 0x1C8)
/* 02D914 0012D814 E85634C4 */  lwc1        $f20, %lo(mgRenderInfo + 0x1C8)($1)
/* 02D918 0012D818 C701013C */  lui         $1, %hi(mgRenderInfo + 0x1D8)
/* 02D91C 0012D81C F85621C4 */  lwc1        $f1, %lo(mgRenderInfo + 0x1D8)($1)
/* 02D920 0012D820 C701013C */  lui         $1, %hi(mgRenderInfo + 0x1A0)
/* 02D924 0012D824 C05635C4 */  lwc1        $f21, %lo(mgRenderInfo + 0x1A0)($1)
/* 02D928 0012D828 FF070224 */  addiu       $2, $0, 0x7FF
/* 02D92C 0012D82C 00008244 */  mtc1        $2, $f0
/* 02D930 0012D830 00000000 */  nop
/* 02D934 0012D834 20008046 */  cvt.s.w     $f0, $f0
/* 02D938 0012D838 02001446 */  mul.s       $f0, $f0, $f20
/* 02D93C 0012D83C 83051546 */  div.s       $f22, $f0, $f21
/* 02D940 0012D840 0040023C */  lui         $2, (0x40000000 >> 16)
/* 02D944 0012D844 00008244 */  mtc1        $2, $f0
/* 02D948 0012D848 00000000 */  nop
/* 02D94C 0012D84C 82001446 */  mul.s       $f2, $f0, $f20
/* 02D950 0012D850 00B01646 */  add.s       $f0, $f22, $f22
/* 02D954 0012D854 03100046 */  div.s       $f0, $f2, $f0
/* 02D958 0012D858 2000A0E7 */  swc1        $f0, 0x20($29)
/* 02D95C 0012D85C 3400A0E7 */  swc1        $f0, 0x34($29)
/* 02D960 0012D860 00081446 */  add.s       $f0, $f1, $f20
/* 02D964 0012D864 81081446 */  sub.s       $f2, $f1, $f20
/* 02D968 0012D868 03000246 */  div.s       $f0, $f0, $f2
/* 02D96C 0012D86C 4800A0E7 */  swc1        $f0, 0x48($29)
/* 02D970 0012D870 42081446 */  mul.s       $f1, $f1, $f20
/* 02D974 0012D874 00C0023C */  lui         $2, (0xC0000000 >> 16)
/* 02D978 0012D878 00008244 */  mtc1        $2, $f0
/* 02D97C 0012D87C 00000000 */  nop
/* 02D980 0012D880 02000146 */  mul.s       $f0, $f0, $f1
/* 02D984 0012D884 03000246 */  div.s       $f0, $f0, $f2
/* 02D988 0012D888 5800A0E7 */  swc1        $f0, 0x58($29)
/* 02D98C 0012D88C 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 02D990 0012D890 4C00A2AF */  sw          $2, 0x4C($29)
/* 02D994 0012D894 5C00A0AF */  sw          $0, 0x5C($29)
/* 02D998 0012D898 C701023C */  lui         $2, %hi(mgRenderInfo + 0x230)
/* 02D99C 0012D89C 50574424 */  addiu       $4, $2, %lo(mgRenderInfo + 0x230)
/* 02D9A0 0012D8A0 2000A527 */  addiu       $5, $29, 0x20
/* 02D9A4 0012D8A4 1086040C */  jal         sceVu0CopyMatrix
/* 02D9A8 0012D8A8 00000000 */   nop
/* 02D9AC 0012D8AC C701023C */  lui         $2, %hi(mgRenderInfo + 0x270)
/* 02D9B0 0012D8B0 90574424 */  addiu       $4, $2, %lo(mgRenderInfo + 0x270)
/* 02D9B4 0012D8B4 2A86040C */  jal         sceVu0UnitMatrix
/* 02D9B8 0012D8B8 00000000 */   nop
/* 02D9BC 0012D8BC 803F043C */  lui         $4, (0x3F800000 >> 16)
/* 02D9C0 0012D8C0 00088444 */  mtc1        $4, $f1
/* 02D9C4 0012D8C4 00000000 */  nop
/* 02D9C8 0012D8C8 02A80146 */  mul.s       $f0, $f21, $f1
/* 02D9CC 0012D8CC 02B00046 */  mul.s       $f0, $f22, $f0
/* 02D9D0 0012D8D0 03001446 */  div.s       $f0, $f0, $f20
/* 02D9D4 0012D8D4 C701013C */  lui         $1, %hi(mgRenderInfo + 0x270)
/* 02D9D8 0012D8D8 905720E4 */  swc1        $f0, %lo(mgRenderInfo + 0x270)($1)
/* 02D9DC 0012D8DC C701013C */  lui         $1, %hi(mgRenderInfo + 0x284)
/* 02D9E0 0012D8E0 A45720E4 */  swc1        $f0, %lo(mgRenderInfo + 0x284)($1)
/* 02D9E4 0012D8E4 FE00033C */  lui         $3, (0xFED260 >> 16)
/* 02D9E8 0012D8E8 60D26334 */  ori         $3, $3, (0xFED260 & 0xFFFF)
/* 02D9EC 0012D8EC 00008344 */  mtc1        $3, $f0
/* 02D9F0 0012D8F0 00000000 */  nop
/* 02D9F4 0012D8F4 20008046 */  cvt.s.w     $f0, $f0
/* 02D9F8 0012D8F8 07000046 */  neg.s       $f0, $f0
/* 02D9FC 0012D8FC 40000146 */  add.s       $f1, $f0, $f1
/* 02DA00 0012D900 0040033C */  lui         $3, (0x40000000 >> 16)
/* 02DA04 0012D904 00008344 */  mtc1        $3, $f0
/* 02DA08 0012D908 00000000 */  nop
/* 02DA0C 0012D90C 03080046 */  div.s       $f0, $f1, $f0
/* 02DA10 0012D910 C701013C */  lui         $1, %hi(mgRenderInfo + 0x298)
/* 02DA14 0012D914 B85720E4 */  swc1        $f0, %lo(mgRenderInfo + 0x298)($1)
/* 02DA18 0012D918 B88080C7 */  lwc1        $f0, -0x7F48($28)
/* 02DA1C 0012D91C C701013C */  lui         $1, %hi(mgRenderInfo + 0x2A8)
/* 02DA20 0012D920 C85720E4 */  swc1        $f0, %lo(mgRenderInfo + 0x2A8)($1)
/* 02DA24 0012D924 0045033C */  lui         $3, (0x45000000 >> 16)
/* 02DA28 0012D928 C701013C */  lui         $1, %hi(mgRenderInfo + 0x2A0)
/* 02DA2C 0012D92C C05723AC */  sw          $3, %lo(mgRenderInfo + 0x2A0)($1)
/* 02DA30 0012D930 C701013C */  lui         $1, %hi(mgRenderInfo + 0x2A4)
/* 02DA34 0012D934 C45723AC */  sw          $3, %lo(mgRenderInfo + 0x2A4)($1)
/* 02DA38 0012D938 C701013C */  lui         $1, %hi(mgRenderInfo + 0x2AC)
/* 02DA3C 0012D93C CC5724AC */  sw          $4, %lo(mgRenderInfo + 0x2AC)($1)
/* 02DA40 0012D940 1000BF7B */  lq          $31, 0x10($29)
/* 02DA44 0012D944 0800B6C7 */  lwc1        $f22, 0x8($29)
/* 02DA48 0012D948 0400B5C7 */  lwc1        $f21, 0x4($29)
/* 02DA4C 0012D94C 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 02DA50 0012D950 6000BD27 */  addiu       $29, $29, 0x60
/* 02DA54 0012D954 0800E003 */  jr          $31
/* 02DA58 0012D958 00000000 */   nop
/* 02DA5C 0012D95C 00000000 */  nop
