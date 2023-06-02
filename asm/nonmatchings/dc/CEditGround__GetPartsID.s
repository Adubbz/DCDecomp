.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetPartsID__11CEditGroundFfff
/* A19D0 001A18D0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* A19D4 001A18D4 2000BF7F */  sq         $31, 0x20($sp)
/* A19D8 001A18D8 1000B07F */  sq         $16, 0x10($sp)
/* A19DC 001A18DC 0800B6E7 */  swc1       $f22, 0x8($sp)
/* A19E0 001A18E0 0400B5E7 */  swc1       $f21, 0x4($sp)
/* A19E4 001A18E4 0000B4E7 */  swc1       $f20, 0x0($sp)
/* A19E8 001A18E8 28868070 */  paddub     $16, $4, $0
/* A19EC 001A18EC 86650046 */  mov.s      $f22, $f12
/* A19F0 001A18F0 466D0046 */  mov.s      $f21, $f13
/* A19F4 001A18F4 06750046 */  mov.s      $f20, $f14
/* A19F8 001A18F8 AC85060C */  jal        GetAreaCode__11CEditGroundFfff
/* A19FC 001A18FC 00000000 */   nop
/* A1A00 001A1900 04004104 */  bgez       $2, .L001A1914
/* A1A04 001A1904 00000000 */   nop
/* A1A08 001A1908 FFFF0224 */  addiu      $2, $0, -0x1
/* A1A0C 001A190C 09000010 */  b          .L001A1934
/* A1A10 001A1910 00000000 */   nop
.L001A1914:
/* A1A14 001A1914 80100200 */  sll        $2, $2, 2
/* A1A18 001A1918 21105000 */  addu       $2, $2, $16
/* A1A1C 001A191C 0400448C */  lw         $4, 0x4($2)
/* A1A20 001A1920 06B30046 */  mov.s      $f12, $f22
/* A1A24 001A1924 46AB0046 */  mov.s      $f13, $f21
/* A1A28 001A1928 86A30046 */  mov.s      $f14, $f20
/* A1A2C 001A192C F8BA050C */  jal        SearchPartsID__9CEditAreaFfff
/* A1A30 001A1930 00000000 */   nop
.L001A1934:
/* A1A34 001A1934 2000BF7B */  lq         $31, 0x20($sp)
/* A1A38 001A1938 1000B07B */  lq         $16, 0x10($sp)
/* A1A3C 001A193C 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* A1A40 001A1940 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* A1A44 001A1944 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* A1A48 001A1948 3000BD27 */  addiu      $sp, $sp, 0x30
/* A1A4C 001A194C 0800E003 */  jr         $31
/* A1A50 001A1950 00000000 */   nop
/* A1A54 001A1954 00000000 */  nop
/* A1A58 001A1958 00000000 */  nop
/* A1A5C 001A195C 00000000 */  nop
