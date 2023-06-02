.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __kernel_sinf
/* 1C920 0011C820 2D288000 */  daddu      $5, $4, $0
/* 1C924 0011C824 00600244 */  mfc1       $2, $f12
/* 1C928 0011C828 2D204000 */  daddu      $4, $2, $0
/* 1C92C 0011C82C FF7F033C */  lui        $3, (0x7FFFFFFF >> 16)
/* 1C930 0011C830 FFFF6334 */  ori        $3, $3, (0x7FFFFFFF & 0xFFFF)
/* 1C934 0011C834 FF31023C */  lui        $2, (0x31FFFFFF >> 16)
/* 1C938 0011C838 24208300 */  and        $4, $4, $3
/* 1C93C 0011C83C FFFF4234 */  ori        $2, $2, (0x31FFFFFF & 0xFFFF)
/* 1C940 0011C840 2A104400 */  slt        $2, $2, $4
/* 1C944 0011C844 08004054 */  bnel       $2, $0, .L0011C868
/* 1C948 0011C848 42610C46 */   mul.s     $f5, $f12, $f12
/* 1C94C 0011C84C 24600046 */  .word      0x46006024                    # cvt.w.s    $f0, $f12 # 00000000
/* 1C950 0011C850 00000244 */  mfc1       $2, $f0
/* 1C954 0011C854 00000000 */  nop
/* 1C958 0011C858 03004054 */  bnel       $2, $0, .L0011C868
/* 1C95C 0011C85C 42610C46 */   mul.s     $f5, $f12, $f12
/* 1C960 0011C860 0800E003 */  jr         $31
/* 1C964 0011C864 06600046 */   mov.s     $f0, $f12
.L0011C868:
/* 1C968 0011C868 2E2F013C */  lui        $at, (0x2F2EC9D3 >> 16)
/* 1C96C 0011C86C D3C92134 */  ori        $at, $at, (0x2F2EC9D3 & 0xFFFF)
/* 1C970 0011C870 00008144 */  mtc1       $at, $f0
/* 1C974 0011C874 D7B2013C */  lui        $at, (0xB2D72F34 >> 16)
/* 1C978 0011C878 342F2134 */  ori        $at, $at, (0xB2D72F34 & 0xFFFF)
/* 1C97C 0011C87C 00088144 */  mtc1       $at, $f1
/* 1C980 0011C880 3836013C */  lui        $at, (0x3638EF1B >> 16)
/* 1C984 0011C884 1BEF2134 */  ori        $at, $at, (0x3638EF1B & 0xFFFF)
/* 1C988 0011C888 00108144 */  mtc1       $at, $f2
/* 1C98C 0011C88C 02280046 */  mul.s      $f0, $f5, $f0
/* 1C990 0011C890 50B9013C */  lui        $at, (0xB9500D01 >> 16)
/* 1C994 0011C894 010D2134 */  ori        $at, $at, (0xB9500D01 & 0xFFFF)
/* 1C998 0011C898 00188144 */  mtc1       $at, $f3
/* 1C99C 0011C89C 083C013C */  lui        $at, (0x3C088889 >> 16)
/* 1C9A0 0011C8A0 89882134 */  ori        $at, $at, (0x3C088889 & 0xFFFF)
/* 1C9A4 0011C8A4 00208144 */  mtc1       $at, $f4
/* 1C9A8 0011C8A8 82290C46 */  mul.s      $f6, $f5, $f12
/* 1C9AC 0011C8AC 00000146 */  add.s      $f0, $f0, $f1
/* 1C9B0 0011C8B0 02280046 */  mul.s      $f0, $f5, $f0
/* 1C9B4 0011C8B4 00000246 */  add.s      $f0, $f0, $f2
/* 1C9B8 0011C8B8 02280046 */  mul.s      $f0, $f5, $f0
/* 1C9BC 0011C8BC 00000346 */  add.s      $f0, $f0, $f3
/* 1C9C0 0011C8C0 02280046 */  mul.s      $f0, $f5, $f0
/* 1C9C4 0011C8C4 0900A014 */  bnez       $5, .L0011C8EC
/* 1C9C8 0011C8C8 40000446 */   add.s     $f1, $f0, $f4
/* 1C9CC 0011C8CC 02280146 */  mul.s      $f0, $f5, $f1
/* 1C9D0 0011C8D0 2ABE013C */  lui        $at, (0xBE2AAAAB >> 16)
/* 1C9D4 0011C8D4 ABAA2134 */  ori        $at, $at, (0xBE2AAAAB & 0xFFFF)
/* 1C9D8 0011C8D8 00088144 */  mtc1       $at, $f1
/* 1C9DC 0011C8DC 00000146 */  add.s      $f0, $f0, $f1
/* 1C9E0 0011C8E0 02300046 */  mul.s      $f0, $f6, $f0
/* 1C9E4 0011C8E4 0800E003 */  jr         $31
/* 1C9E8 0011C8E8 00600046 */   add.s     $f0, $f12, $f0
.L0011C8EC:
/* 1C9EC 0011C8EC 003F013C */  lui        $at, (0x3F000000 >> 16)
/* 1C9F0 0011C8F0 00008144 */  mtc1       $at, $f0
/* 1C9F4 0011C8F4 82300146 */  mul.s      $f2, $f6, $f1
/* 1C9F8 0011C8F8 2ABE013C */  lui        $at, (0xBE2AAAAB >> 16)
/* 1C9FC 0011C8FC ABAA2134 */  ori        $at, $at, (0xBE2AAAAB & 0xFFFF)
/* 1CA00 0011C900 00088144 */  mtc1       $at, $f1
/* 1CA04 0011C904 02680046 */  mul.s      $f0, $f13, $f0
/* 1CA08 0011C908 42300146 */  mul.s      $f1, $f6, $f1
/* 1CA0C 0011C90C 01000246 */  sub.s      $f0, $f0, $f2
/* 1CA10 0011C910 02280046 */  mul.s      $f0, $f5, $f0
/* 1CA14 0011C914 01000D46 */  sub.s      $f0, $f0, $f13
/* 1CA18 0011C918 01000146 */  sub.s      $f0, $f0, $f1
/* 1CA1C 0011C91C 0800E003 */  jr         $31
/* 1CA20 0011C920 01600046 */   sub.s     $f0, $f12, $f0
/* 1CA24 0011C924 00000000 */  nop
