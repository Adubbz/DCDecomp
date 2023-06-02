.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetAlt_i__11CEditGroundFfff
/* A18F0 001A17F0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* A18F4 001A17F4 2000BF7F */  sq         $31, 0x20($sp)
/* A18F8 001A17F8 1000B07F */  sq         $16, 0x10($sp)
/* A18FC 001A17FC 0800B6E7 */  swc1       $f22, 0x8($sp)
/* A1900 001A1800 0400B5E7 */  swc1       $f21, 0x4($sp)
/* A1904 001A1804 0000B4E7 */  swc1       $f20, 0x0($sp)
/* A1908 001A1808 28868070 */  paddub     $16, $4, $0
/* A190C 001A180C 86650046 */  mov.s      $f22, $f12
/* A1910 001A1810 466D0046 */  mov.s      $f21, $f13
/* A1914 001A1814 06750046 */  mov.s      $f20, $f14
/* A1918 001A1818 AC85060C */  jal        GetAreaCode__11CEditGroundFfff
/* A191C 001A181C 00000000 */   nop
/* A1920 001A1820 04004104 */  bgez       $2, .L001A1834
/* A1924 001A1824 00000000 */   nop
/* A1928 001A1828 28160070 */  paddub     $2, $0, $0
/* A192C 001A182C 09000010 */  b          .L001A1854
/* A1930 001A1830 00000000 */   nop
.L001A1834:
/* A1934 001A1834 80100200 */  sll        $2, $2, 2
/* A1938 001A1838 21105000 */  addu       $2, $2, $16
/* A193C 001A183C 0400448C */  lw         $4, 0x4($2)
/* A1940 001A1840 06B30046 */  mov.s      $f12, $f22
/* A1944 001A1844 46AB0046 */  mov.s      $f13, $f21
/* A1948 001A1848 86A30046 */  mov.s      $f14, $f20
/* A194C 001A184C 90B7050C */  jal        GetAlt_i__9CEditAreaFfff
/* A1950 001A1850 00000000 */   nop
.L001A1854:
/* A1954 001A1854 2000BF7B */  lq         $31, 0x20($sp)
/* A1958 001A1858 1000B07B */  lq         $16, 0x10($sp)
/* A195C 001A185C 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* A1960 001A1860 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* A1964 001A1864 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* A1968 001A1868 3000BD27 */  addiu      $sp, $sp, 0x30
/* A196C 001A186C 0800E003 */  jr         $31
/* A1970 001A1870 00000000 */   nop
/* A1974 001A1874 00000000 */  nop
/* A1978 001A1878 00000000 */  nop
/* A197C 001A187C 00000000 */  nop
