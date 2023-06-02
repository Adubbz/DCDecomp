.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ieee754_atan2
/* 19758 00119658 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1975C 0011965C 2D588000 */  daddu      $11, $4, $0
/* 19760 00119660 1000BFFF */  sd         $31, 0x10($sp)
/* 19764 00119664 2D10A000 */  daddu      $2, $5, $0
/* 19768 00119668 3C380200 */  dsll32     $7, $2, 0
/* 1976C 0011966C 3F380700 */  dsra32     $7, $7, 0
/* 19770 00119670 3F600200 */  dsra32     $12, $2, 0
/* 19774 00119674 FF7F033C */  lui        $3, (0x7FFFFFFF >> 16)
/* 19778 00119678 FFFF6334 */  ori        $3, $3, (0x7FFFFFFF & 0xFFFF)
/* 1977C 0011967C 24508301 */  and        $10, $12, $3
/* 19780 00119680 2D106001 */  daddu      $2, $11, $0
/* 19784 00119684 3C300200 */  dsll32     $6, $2, 0
/* 19788 00119688 3F300600 */  dsra32     $6, $6, 0
/* 1978C 0011968C 3F480200 */  dsra32     $9, $2, 0
/* 19790 00119690 24402301 */  and        $8, $9, $3
/* 19794 00119694 23100700 */  negu       $2, $7
/* 19798 00119698 F07F033C */  lui        $3, (0x7FF00000 >> 16)
/* 1979C 0011969C 2510E200 */  or         $2, $7, $2
/* 197A0 001196A0 C2170200 */  srl        $2, $2, 31
/* 197A4 001196A4 25104201 */  or         $2, $10, $2
/* 197A8 001196A8 2B106200 */  sltu       $2, $3, $2
/* 197AC 001196AC 08004014 */  bnez       $2, .L001196D0
/* 197B0 001196B0 0000B0FF */   sd        $16, 0x0($sp)
/* 197B4 001196B4 23100600 */  negu       $2, $6
/* 197B8 001196B8 2510C200 */  or         $2, $6, $2
/* 197BC 001196BC C2170200 */  srl        $2, $2, 31
/* 197C0 001196C0 25100201 */  or         $2, $8, $2
/* 197C4 001196C4 2B106200 */  sltu       $2, $3, $2
/* 197C8 001196C8 06004010 */  beqz       $2, .L001196E4
/* 197CC 001196CC 10C0023C */   lui       $2, (0xC0100000 >> 16)
.L001196D0:
/* 197D0 001196D0 2D20A000 */  daddu      $4, $5, $0
/* 197D4 001196D4 6E3F040C */  jal        dpadd
/* 197D8 001196D8 2D286001 */   daddu     $5, $11, $0
/* 197DC 001196DC A8000010 */  b          .L00119980
/* 197E0 001196E0 1000BFDF */   ld        $31, 0x10($sp)
.L001196E4:
/* 197E4 001196E4 21108201 */  addu       $2, $12, $2
/* 197E8 001196E8 25104700 */  or         $2, $2, $7
/* 197EC 001196EC 05004014 */  bnez       $2, .L00119704
/* 197F0 001196F0 83170C00 */   sra       $2, $12, 30
/* 197F4 001196F4 F072040C */  jal        atan
/* 197F8 001196F8 2D206001 */   daddu     $4, $11, $0
/* 197FC 001196FC A0000010 */  b          .L00119980
/* 19800 00119700 1000BFDF */   ld        $31, 0x10($sp)
.L00119704:
/* 19804 00119704 C2270900 */  srl        $4, $9, 31
/* 19808 00119708 02004230 */  andi       $2, $2, 0x2
/* 1980C 0011970C 25180601 */  or         $3, $8, $6
/* 19810 00119710 0C006014 */  bnez       $3, .L00119744
/* 19814 00119714 25808200 */   or        $16, $4, $2
/* 19818 00119718 02000224 */  addiu      $2, $0, 0x2
/* 1981C 0011971C 49000212 */  beq        $16, $2, .L00119844
/* 19820 00119720 0300022A */   slti      $2, $16, 0x3
/* 19824 00119724 05004014 */  bnez       $2, .L0011973C
/* 19828 00119728 03000224 */   addiu     $2, $0, 0x3
/* 1982C 0011972C 49000212 */  beq        $16, $2, .L00119854
/* 19830 00119730 25104701 */   or        $2, $10, $7
/* 19834 00119734 04000010 */  b          .L00119748
/* 19838 00119738 00000000 */   nop
.L0011973C:
/* 1983C 0011973C 8F000106 */  bgez       $16, .L0011997C
/* 19840 00119740 2D106001 */   daddu     $2, $11, $0
.L00119744:
/* 19844 00119744 25104701 */  or         $2, $10, $7
.L00119748:
/* 19848 00119748 09004014 */  bnez       $2, .L00119770
/* 1984C 0011974C F07F023C */   lui       $2, (0x7FF00000 >> 16)
/* 19850 00119750 2A00013C */  lui        $at, (0x2A0000 >> 16)
/* 19854 00119754 E88022DC */  ld         $2, -0x7F18($at)
/* 19858 00119758 89002105 */  bgez       $9, .L00119980
/* 1985C 0011975C 1000BFDF */   ld        $31, 0x10($sp)
/* 19860 00119760 2A00013C */  lui        $at, (0x2A0000 >> 16)
/* 19864 00119764 F08022DC */  ld         $2, -0x7F10($at)
/* 19868 00119768 86000010 */  b          .L00119984
/* 1986C 0011976C 0000B0DF */   ld        $16, 0x0($sp)
.L00119770:
/* 19870 00119770 3C004215 */  bne        $10, $2, .L00119864
/* 19874 00119774 F07F023C */   lui       $2, (0x7FF00000 >> 16)
/* 19878 00119778 1F000A15 */  bne        $8, $10, .L001197F8
/* 1987C 0011977C 01000224 */   addiu     $2, $0, 0x1
/* 19880 00119780 11000212 */  beq        $16, $2, .L001197C8
/* 19884 00119784 0200022A */   slti      $2, $16, 0x2
/* 19888 00119788 05004010 */  beqz       $2, .L001197A0
/* 1988C 0011978C 02000224 */   addiu     $2, $0, 0x2
/* 19890 00119790 09000012 */  beqz       $16, .L001197B8
/* 19894 00119794 F07F023C */   lui       $2, (0x7FF00000 >> 16)
/* 19898 00119798 32000010 */  b          .L00119864
/* 1989C 0011979C 00000000 */   nop
.L001197A0:
/* 198A0 001197A0 0D000212 */  beq        $16, $2, .L001197D8
/* 198A4 001197A4 03000224 */   addiu     $2, $0, 0x3
/* 198A8 001197A8 0F000212 */  beq        $16, $2, .L001197E8
/* 198AC 001197AC F07F023C */   lui       $2, (0x7FF00000 >> 16)
/* 198B0 001197B0 2C000010 */  b          .L00119864
/* 198B4 001197B4 00000000 */   nop
.L001197B8:
/* 198B8 001197B8 2A00013C */  lui        $at, (0x2A0000 >> 16)
/* 198BC 001197BC F88022DC */  ld         $2, -0x7F08($at)
/* 198C0 001197C0 6F000010 */  b          .L00119980
/* 198C4 001197C4 1000BFDF */   ld        $31, 0x10($sp)
.L001197C8:
/* 198C8 001197C8 2A00013C */  lui        $at, (0x2A0000 >> 16)
/* 198CC 001197CC 008122DC */  ld         $2, -0x7F00($at)
/* 198D0 001197D0 6B000010 */  b          .L00119980
/* 198D4 001197D4 1000BFDF */   ld        $31, 0x10($sp)
.L001197D8:
/* 198D8 001197D8 2A00013C */  lui        $at, (0x2A0000 >> 16)
/* 198DC 001197DC 088122DC */  ld         $2, -0x7EF8($at)
/* 198E0 001197E0 67000010 */  b          .L00119980
/* 198E4 001197E4 1000BFDF */   ld        $31, 0x10($sp)
.L001197E8:
/* 198E8 001197E8 2A00013C */  lui        $at, (0x2A0000 >> 16)
/* 198EC 001197EC 108122DC */  ld         $2, -0x7EF0($at)
/* 198F0 001197F0 63000010 */  b          .L00119980
/* 198F4 001197F4 1000BFDF */   ld        $31, 0x10($sp)
.L001197F8:
/* 198F8 001197F8 0F000212 */  beq        $16, $2, .L00119838
/* 198FC 001197FC 0200022A */   slti      $2, $16, 0x2
/* 19900 00119800 05004010 */  beqz       $2, .L00119818
/* 19904 00119804 02000224 */   addiu     $2, $0, 0x2
/* 19908 00119808 09000012 */  beqz       $16, .L00119830
/* 1990C 0011980C F07F023C */   lui       $2, (0x7FF00000 >> 16)
/* 19910 00119810 14000010 */  b          .L00119864
/* 19914 00119814 00000000 */   nop
.L00119818:
/* 19918 00119818 0A000212 */  beq        $16, $2, .L00119844
/* 1991C 0011981C 03000224 */   addiu     $2, $0, 0x3
/* 19920 00119820 0C000212 */  beq        $16, $2, .L00119854
/* 19924 00119824 F07F023C */   lui       $2, (0x7FF00000 >> 16)
/* 19928 00119828 0E000010 */  b          .L00119864
/* 1992C 0011982C 00000000 */   nop
.L00119830:
/* 19930 00119830 52000010 */  b          .L0011997C
/* 19934 00119834 2D100000 */   daddu     $2, $0, $0
.L00119838:
/* 19938 00119838 2A00033C */  lui        $3, (0x2A0000 >> 16)
/* 1993C 0011983C 4F000010 */  b          .L0011997C
/* 19940 00119840 E08062DC */   ld        $2, -0x7F20($3)
.L00119844:
/* 19944 00119844 2A00013C */  lui        $at, (0x2A0000 >> 16)
/* 19948 00119848 188122DC */  ld         $2, -0x7EE8($at)
/* 1994C 0011984C 4C000010 */  b          .L00119980
/* 19950 00119850 1000BFDF */   ld        $31, 0x10($sp)
.L00119854:
/* 19954 00119854 2A00013C */  lui        $at, (0x2A0000 >> 16)
/* 19958 00119858 208122DC */  ld         $2, -0x7EE0($at)
/* 1995C 0011985C 48000010 */  b          .L00119980
/* 19960 00119860 1000BFDF */   ld        $31, 0x10($sp)
.L00119864:
/* 19964 00119864 09000215 */  bne        $8, $2, .L0011988C
/* 19968 00119868 23100A01 */   subu      $2, $8, $10
/* 1996C 0011986C 2A00013C */  lui        $at, (0x2A0000 >> 16)
/* 19970 00119870 288122DC */  ld         $2, -0x7ED8($at)
/* 19974 00119874 42002105 */  bgez       $9, .L00119980
/* 19978 00119878 1000BFDF */   ld        $31, 0x10($sp)
/* 1997C 0011987C 2A00013C */  lui        $at, (0x2A0000 >> 16)
/* 19980 00119880 308122DC */  ld         $2, -0x7ED0($at)
/* 19984 00119884 3F000010 */  b          .L00119984
/* 19988 00119888 0000B0DF */   ld        $16, 0x0($sp)
.L0011988C:
/* 1998C 0011988C 03150200 */  sra        $2, $2, 20
/* 19990 00119890 3D004328 */  slti       $3, $2, 0x3D
/* 19994 00119894 05006014 */  bnez       $3, .L001198AC
/* 19998 00119898 00000000 */   nop
/* 1999C 0011989C 2A00013C */  lui        $at, (0x2A0000 >> 16)
/* 199A0 001198A0 388123DC */  ld         $3, -0x7EC8($at)
/* 199A4 001198A4 0D000010 */  b          .L001198DC
/* 199A8 001198A8 01000224 */   addiu     $2, $0, 0x1
.L001198AC:
/* 199AC 001198AC 03008105 */  bgez       $12, .L001198BC
/* 199B0 001198B0 C4FF4228 */   slti      $2, $2, -0x3C
/* 199B4 001198B4 08004014 */  bnez       $2, .L001198D8
/* 199B8 001198B8 2D180000 */   daddu     $3, $0, $0
.L001198BC:
/* 199BC 001198BC 4840040C */  jal        dpdiv
/* 199C0 001198C0 2D206001 */   daddu     $4, $11, $0
/* 199C4 001198C4 3674040C */  jal        fabs
/* 199C8 001198C8 2D204000 */   daddu     $4, $2, $0
/* 199CC 001198CC F072040C */  jal        atan
/* 199D0 001198D0 2D204000 */   daddu     $4, $2, $0
/* 199D4 001198D4 2D184000 */  daddu      $3, $2, $0
.L001198D8:
/* 199D8 001198D8 01000224 */  addiu      $2, $0, 0x1
.L001198DC:
/* 199DC 001198DC 0C000212 */  beq        $16, $2, .L00119910
/* 199E0 001198E0 2D106000 */   daddu     $2, $3, $0
/* 199E4 001198E4 0200022A */  slti       $2, $16, 0x2
/* 199E8 001198E8 05004010 */  beqz       $2, .L00119900
/* 199EC 001198EC 02000224 */   addiu     $2, $0, 0x2
/* 199F0 001198F0 22000012 */  beqz       $16, .L0011997C
/* 199F4 001198F4 2D106000 */   daddu     $2, $3, $0
/* 199F8 001198F8 17000010 */  b          .L00119958
/* 199FC 001198FC 00000000 */   nop
.L00119900:
/* 19A00 00119900 0D000212 */  beq        $16, $2, .L00119938
/* 19A04 00119904 00000000 */   nop
/* 19A08 00119908 13000010 */  b          .L00119958
/* 19A0C 0011990C 00000000 */   nop
.L00119910:
/* 19A10 00119910 3F100200 */  dsra32     $2, $2, 0
/* 19A14 00119914 0080043C */  lui        $4, (0x80000000 >> 16)
/* 19A18 00119918 FFFF053C */  lui        $5, (0xFFFF0000 >> 16)
/* 19A1C 0011991C 3E280500 */  dsrl32     $5, $5, 0
/* 19A20 00119920 26104400 */  xor        $2, $2, $4
/* 19A24 00119924 24186500 */  and        $3, $3, $5
/* 19A28 00119928 3C100200 */  dsll32     $2, $2, 0
/* 19A2C 0011992C 25186200 */  or         $3, $3, $2
/* 19A30 00119930 12000010 */  b          .L0011997C
/* 19A34 00119934 2D106000 */   daddu     $2, $3, $0
.L00119938:
/* 19A38 00119938 2A00013C */  lui        $at, (0x2A0000 >> 16)
/* 19A3C 0011993C 408125DC */  ld         $5, -0x7EC0($at)
/* 19A40 00119940 843F040C */  jal        dpsub
/* 19A44 00119944 2D206000 */   daddu     $4, $3, $0
/* 19A48 00119948 2A00013C */  lui        $at, (0x2A0000 >> 16)
/* 19A4C 0011994C 488124DC */  ld         $4, -0x7EB8($at)
/* 19A50 00119950 08000010 */  b          .L00119974
/* 19A54 00119954 2D284000 */   daddu     $5, $2, $0
.L00119958:
/* 19A58 00119958 2A00013C */  lui        $at, (0x2A0000 >> 16)
/* 19A5C 0011995C 508125DC */  ld         $5, -0x7EB0($at)
/* 19A60 00119960 843F040C */  jal        dpsub
/* 19A64 00119964 2D206000 */   daddu     $4, $3, $0
/* 19A68 00119968 2A00013C */  lui        $at, (0x2A0000 >> 16)
/* 19A6C 0011996C 588125DC */  ld         $5, -0x7EA8($at)
/* 19A70 00119970 2D204000 */  daddu      $4, $2, $0
.L00119974:
/* 19A74 00119974 843F040C */  jal        dpsub
/* 19A78 00119978 00000000 */   nop
.L0011997C:
/* 19A7C 0011997C 1000BFDF */  ld         $31, 0x10($sp)
.L00119980:
/* 19A80 00119980 0000B0DF */  ld         $16, 0x0($sp)
.L00119984:
/* 19A84 00119984 0800E003 */  jr         $31
/* 19A88 00119988 2000BD27 */   addiu     $sp, $sp, 0x20
/* 19A8C 0011998C 00000000 */  nop
