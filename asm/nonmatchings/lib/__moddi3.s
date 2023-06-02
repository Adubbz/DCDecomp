.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __moddi3
/* E8D0 0010E7D0 2D408000 */  daddu      $8, $4, $0
/* E8D4 0010E7D4 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* E8D8 0010E7D8 3000B0FF */  sd         $16, 0x30($sp)
/* E8DC 0010E7DC 3F500800 */  dsra32     $10, $8, 0
/* E8E0 0010E7E0 3C200A00 */  dsll32     $4, $10, 0
/* E8E4 0010E7E4 3F200400 */  dsra32     $4, $4, 0
/* E8E8 0010E7E8 16008104 */  bgez       $4, .L0010E844
/* E8EC 0010E7EC 2D800000 */   daddu     $16, $0, $0
/* E8F0 0010E7F0 3C100800 */  dsll32     $2, $8, 0
/* E8F4 0010E7F4 3F100200 */  dsra32     $2, $2, 0
/* E8F8 0010E7F8 FFFF0324 */  addiu      $3, $0, -0x1
/* E8FC 0010E7FC 3C180300 */  dsll32     $3, $3, 0
/* E900 0010E800 23100200 */  negu       $2, $2
/* E904 0010E804 2430C300 */  and        $6, $6, $3
/* E908 0010E808 3C100200 */  dsll32     $2, $2, 0
/* E90C 0010E80C 23180400 */  negu       $3, $4
/* E910 0010E810 3E100200 */  dsrl32     $2, $2, 0
/* E914 0010E814 FFFF043C */  lui        $4, (0xFFFF0000 >> 16)
/* E918 0010E818 3E200400 */  dsrl32     $4, $4, 0
/* E91C 0010E81C 2530C200 */  or         $6, $6, $2
/* E920 0010E820 FFFF1024 */  addiu      $16, $0, -0x1
/* E924 0010E824 3C100600 */  dsll32     $2, $6, 0
/* E928 0010E828 3F100200 */  dsra32     $2, $2, 0
/* E92C 0010E82C 2B100200 */  sltu       $2, $0, $2
/* E930 0010E830 2430C400 */  and        $6, $6, $4
/* E934 0010E834 23186200 */  subu       $3, $3, $2
/* E938 0010E838 3C180300 */  dsll32     $3, $3, 0
/* E93C 0010E83C 2540C300 */  or         $8, $6, $3
/* E940 0010E840 3F500800 */  dsra32     $10, $8, 0
.L0010E844:
/* E944 0010E844 3F200500 */  dsra32     $4, $5, 0
/* E948 0010E848 13008104 */  bgez       $4, .L0010E898
/* E94C 0010E84C 23200400 */   negu      $4, $4
/* E950 0010E850 3C100500 */  dsll32     $2, $5, 0
/* E954 0010E854 3F100200 */  dsra32     $2, $2, 0
/* E958 0010E858 FFFF0324 */  addiu      $3, $0, -0x1
/* E95C 0010E85C 3C180300 */  dsll32     $3, $3, 0
/* E960 0010E860 23100200 */  negu       $2, $2
/* E964 0010E864 2438E300 */  and        $7, $7, $3
/* E968 0010E868 3C100200 */  dsll32     $2, $2, 0
/* E96C 0010E86C 3E100200 */  dsrl32     $2, $2, 0
/* E970 0010E870 FFFF053C */  lui        $5, (0xFFFF0000 >> 16)
/* E974 0010E874 3E280500 */  dsrl32     $5, $5, 0
/* E978 0010E878 2538E200 */  or         $7, $7, $2
/* E97C 0010E87C 3C180700 */  dsll32     $3, $7, 0
/* E980 0010E880 3F180300 */  dsra32     $3, $3, 0
/* E984 0010E884 2B180300 */  sltu       $3, $0, $3
/* E988 0010E888 2438E500 */  and        $7, $7, $5
/* E98C 0010E88C 23208300 */  subu       $4, $4, $3
/* E990 0010E890 3C200400 */  dsll32     $4, $4, 0
/* E994 0010E894 2528E400 */  or         $5, $7, $4
.L0010E898:
/* E998 0010E898 3C600800 */  dsll32     $12, $8, 0
/* E99C 0010E89C 3F600C00 */  dsra32     $12, $12, 0
/* E9A0 0010E8A0 3F480500 */  dsra32     $9, $5, 0
/* E9A4 0010E8A4 3C500A00 */  dsll32     $10, $10, 0
/* E9A8 0010E8A8 3F500A00 */  dsra32     $10, $10, 0
/* E9AC 0010E8AC 3C400500 */  dsll32     $8, $5, 0
/* E9B0 0010E8B0 3F400800 */  dsra32     $8, $8, 0
/* E9B4 0010E8B4 B3002015 */  bnez       $9, .L0010EB84
/* E9B8 0010E8B8 2DC8A003 */   daddu     $25, $sp, $0
/* E9BC 0010E8BC 2B104801 */  sltu       $2, $10, $8
/* E9C0 0010E8C0 23004010 */  beqz       $2, .L0010E950
/* E9C4 0010E8C4 FFFF0234 */   ori       $2, $0, 0xFFFF
/* E9C8 0010E8C8 2B104800 */  sltu       $2, $2, $8
/* E9CC 0010E8CC 06004014 */  bnez       $2, .L0010E8E8
/* E9D0 0010E8D0 FF00023C */   lui       $2, (0xFFFFFF >> 16)
/* E9D4 0010E8D4 0001022D */  sltiu      $2, $8, 0x100
/* E9D8 0010E8D8 08000524 */  addiu      $5, $0, 0x8
/* E9DC 0010E8DC 08000010 */  b          .L0010E900
/* E9E0 0010E8E0 0B280200 */   movn      $5, $0, $2
/* E9E4 0010E8E4 00000000 */  nop
.L0010E8E8:
/* E9E8 0010E8E8 18000524 */  addiu      $5, $0, 0x18
/* E9EC 0010E8EC FFFF4234 */  ori        $2, $2, (0xFFFFFF & 0xFFFF)
/* E9F0 0010E8F0 10000324 */  addiu      $3, $0, 0x10
/* E9F4 0010E8F4 2B104800 */  sltu       $2, $2, $8
/* E9F8 0010E8F8 0A286200 */  movz       $5, $3, $2
/* E9FC 0010E8FC 00000000 */  nop
.L0010E900:
/* EA00 0010E900 2900023C */  lui        $2, %hi(__clz_tab_2)
/* EA04 0010E904 0620A800 */  srlv       $4, $8, $5
/* EA08 0010E908 70754224 */  addiu      $2, $2, %lo(__clz_tab_2)
/* EA0C 0010E90C 20000624 */  addiu      $6, $0, 0x20
/* EA10 0010E910 21208200 */  addu       $4, $4, $2
/* EA14 0010E914 00008390 */  lbu        $3, 0x0($4)
/* EA18 0010E918 21186500 */  addu       $3, $3, $5
/* EA1C 0010E91C 2368C300 */  subu       $13, $6, $3
/* EA20 0010E920 0600A011 */  beqz       $13, .L0010E93C
/* EA24 0010E924 2310CD00 */   subu      $2, $6, $13
/* EA28 0010E928 0418AA01 */  sllv       $3, $10, $13
/* EA2C 0010E92C 06104C00 */  srlv       $2, $12, $2
/* EA30 0010E930 0440A801 */  sllv       $8, $8, $13
/* EA34 0010E934 25506200 */  or         $10, $3, $2
/* EA38 0010E938 0460AC01 */  sllv       $12, $12, $13
.L0010E93C:
/* EA3C 0010E93C 022C0800 */  srl        $5, $8, 16
/* EA40 0010E940 FFFF0731 */  andi       $7, $8, 0xFFFF
/* EA44 0010E944 60000010 */  b          .L0010EAC8
/* EA48 0010E948 1B004501 */   divu      $0, $10, $5
/* EA4C 0010E94C 00000000 */  nop
.L0010E950:
/* EA50 0010E950 09000015 */  bnez       $8, .L0010E978
/* EA54 0010E954 2B104800 */   sltu      $2, $2, $8
/* EA58 0010E958 01000224 */  addiu      $2, $0, 0x1
/* EA5C 0010E95C 01000051 */  beql       $8, $0, .L0010E964
/* EA60 0010E960 CD010000 */   break     0, 7
.L0010E964:
/* EA64 0010E964 1B004900 */  divu       $0, $2, $9
/* EA68 0010E968 12100000 */  mflo       $2
/* EA6C 0010E96C 2D404000 */  daddu      $8, $2, $0
/* EA70 0010E970 FFFF0234 */  ori        $2, $0, 0xFFFF
/* EA74 0010E974 2B104800 */  sltu       $2, $2, $8
.L0010E978:
/* EA78 0010E978 05004014 */  bnez       $2, .L0010E990
/* EA7C 0010E97C FF00023C */   lui       $2, (0xFFFFFF >> 16)
/* EA80 0010E980 0001022D */  sltiu      $2, $8, 0x100
/* EA84 0010E984 08000524 */  addiu      $5, $0, 0x8
/* EA88 0010E988 07000010 */  b          .L0010E9A8
/* EA8C 0010E98C 0B280200 */   movn      $5, $0, $2
.L0010E990:
/* EA90 0010E990 18000524 */  addiu      $5, $0, 0x18
/* EA94 0010E994 FFFF4234 */  ori        $2, $2, (0xFFFFFF & 0xFFFF)
/* EA98 0010E998 10000324 */  addiu      $3, $0, 0x10
/* EA9C 0010E99C 2B104800 */  sltu       $2, $2, $8
/* EAA0 0010E9A0 0A286200 */  movz       $5, $3, $2
/* EAA4 0010E9A4 00000000 */  nop
.L0010E9A8:
/* EAA8 0010E9A8 2900023C */  lui        $2, %hi(__clz_tab_2)
/* EAAC 0010E9AC 0620A800 */  srlv       $4, $8, $5
/* EAB0 0010E9B0 70754224 */  addiu      $2, $2, %lo(__clz_tab_2)
/* EAB4 0010E9B4 20000624 */  addiu      $6, $0, 0x20
/* EAB8 0010E9B8 21208200 */  addu       $4, $4, $2
/* EABC 0010E9BC 00008390 */  lbu        $3, 0x0($4)
/* EAC0 0010E9C0 21186500 */  addu       $3, $3, $5
/* EAC4 0010E9C4 2368C300 */  subu       $13, $6, $3
/* EAC8 0010E9C8 0500A015 */  bnez       $13, .L0010E9E0
/* EACC 0010E9CC 2370CD00 */   subu      $14, $6, $13
/* EAD0 0010E9D0 23504801 */  subu       $10, $10, $8
/* EAD4 0010E9D4 022C0800 */  srl        $5, $8, 16
/* EAD8 0010E9D8 38000010 */  b          .L0010EABC
/* EADC 0010E9DC FFFF0931 */   andi      $9, $8, 0xFFFF
.L0010E9E0:
/* EAE0 0010E9E0 0418AA01 */  sllv       $3, $10, $13
/* EAE4 0010E9E4 0610CC01 */  srlv       $2, $12, $14
/* EAE8 0010E9E8 0638CA01 */  srlv       $7, $10, $14
/* EAEC 0010E9EC 25506200 */  or         $10, $3, $2
/* EAF0 0010E9F0 0440A801 */  sllv       $8, $8, $13
/* EAF4 0010E9F4 0460AC01 */  sllv       $12, $12, $13
/* EAF8 0010E9F8 022C0800 */  srl        $5, $8, 16
/* EAFC 0010E9FC 1B00E500 */  divu       $0, $7, $5
/* EB00 0010EA00 FFFF0931 */  andi       $9, $8, 0xFFFF
/* EB04 0010EA04 2D38A000 */  daddu      $7, $5, $0
/* EB08 0010EA08 02240A00 */  srl        $4, $10, 16
/* EB0C 0010EA0C 0100E050 */  beql       $7, $0, .L0010EA14
/* EB10 0010EA10 CD010000 */   break     0, 7
.L0010EA14:
/* EB14 0010EA14 2D582001 */  daddu      $11, $9, $0
/* EB18 0010EA18 12100000 */  mflo       $2
/* EB1C 0010EA1C 10180000 */  mfhi       $3
/* EB20 0010EA20 3C180300 */  dsll32     $3, $3, 0
/* EB24 0010EA24 381C0300 */  dsll       $3, $3, 16
/* EB28 0010EA28 3F180300 */  dsra32     $3, $3, 0
/* EB2C 0010EA2C 18304900 */  mult       $6, $2, $9
/* EB30 0010EA30 25186400 */  or         $3, $3, $4
/* EB34 0010EA34 2B106600 */  sltu       $2, $3, $6
/* EB38 0010EA38 0A004050 */  beql       $2, $0, .L0010EA64
/* EB3C 0010EA3C 23186600 */   subu      $3, $3, $6
/* EB40 0010EA40 21186800 */  addu       $3, $3, $8
/* EB44 0010EA44 2B106800 */  sltu       $2, $3, $8
/* EB48 0010EA48 06004054 */  bnel       $2, $0, .L0010EA64
/* EB4C 0010EA4C 23186600 */   subu      $3, $3, $6
/* EB50 0010EA50 2B106600 */  sltu       $2, $3, $6
/* EB54 0010EA54 02004054 */  bnel       $2, $0, .L0010EA60
/* EB58 0010EA58 21186800 */   addu      $3, $3, $8
/* EB5C 0010EA5C 00000000 */  nop
.L0010EA60:
/* EB60 0010EA60 23186600 */  subu       $3, $3, $6
.L0010EA64:
/* EB64 0010EA64 FFFF4431 */  andi       $4, $10, 0xFFFF
/* EB68 0010EA68 1B006700 */  divu       $0, $3, $7
/* EB6C 0010EA6C 0100E050 */  beql       $7, $0, .L0010EA74
/* EB70 0010EA70 CD010000 */   break     0, 7
.L0010EA74:
/* EB74 0010EA74 12100000 */  mflo       $2
/* EB78 0010EA78 10180000 */  mfhi       $3
/* EB7C 0010EA7C 3C180300 */  dsll32     $3, $3, 0
/* EB80 0010EA80 381C0300 */  dsll       $3, $3, 16
/* EB84 0010EA84 3F180300 */  dsra32     $3, $3, 0
/* EB88 0010EA88 18304B00 */  mult       $6, $2, $11
/* EB8C 0010EA8C 25186400 */  or         $3, $3, $4
/* EB90 0010EA90 2B106600 */  sltu       $2, $3, $6
/* EB94 0010EA94 09004050 */  beql       $2, $0, .L0010EABC
/* EB98 0010EA98 23506600 */   subu      $10, $3, $6
/* EB9C 0010EA9C 21186800 */  addu       $3, $3, $8
/* EBA0 0010EAA0 2B106800 */  sltu       $2, $3, $8
/* EBA4 0010EAA4 05004014 */  bnez       $2, .L0010EABC
/* EBA8 0010EAA8 23506600 */   subu      $10, $3, $6
/* EBAC 0010EAAC 2B106600 */  sltu       $2, $3, $6
/* EBB0 0010EAB0 01004054 */  bnel       $2, $0, .L0010EAB8
/* EBB4 0010EAB4 21186800 */   addu      $3, $3, $8
.L0010EAB8:
/* EBB8 0010EAB8 23506600 */  subu       $10, $3, $6
.L0010EABC:
/* EBBC 0010EABC 1B004501 */  divu       $0, $10, $5
/* EBC0 0010EAC0 2D382001 */  daddu      $7, $9, $0
/* EBC4 0010EAC4 00000000 */  nop
.L0010EAC8:
/* EBC8 0010EAC8 02240C00 */  srl        $4, $12, 16
/* EBCC 0010EACC 0100A050 */  beql       $5, $0, .L0010EAD4
/* EBD0 0010EAD0 CD010000 */   break     0, 7
.L0010EAD4:
/* EBD4 0010EAD4 12100000 */  mflo       $2
/* EBD8 0010EAD8 10180000 */  mfhi       $3
/* EBDC 0010EADC 3C180300 */  dsll32     $3, $3, 0
/* EBE0 0010EAE0 381C0300 */  dsll       $3, $3, 16
/* EBE4 0010EAE4 3F180300 */  dsra32     $3, $3, 0
/* EBE8 0010EAE8 18304700 */  mult       $6, $2, $7
/* EBEC 0010EAEC 25186400 */  or         $3, $3, $4
/* EBF0 0010EAF0 2B106600 */  sltu       $2, $3, $6
/* EBF4 0010EAF4 09004050 */  beql       $2, $0, .L0010EB1C
/* EBF8 0010EAF8 23186600 */   subu      $3, $3, $6
/* EBFC 0010EAFC 21186800 */  addu       $3, $3, $8
/* EC00 0010EB00 2B106800 */  sltu       $2, $3, $8
/* EC04 0010EB04 05004054 */  bnel       $2, $0, .L0010EB1C
/* EC08 0010EB08 23186600 */   subu      $3, $3, $6
/* EC0C 0010EB0C 2B106600 */  sltu       $2, $3, $6
/* EC10 0010EB10 01004054 */  bnel       $2, $0, .L0010EB18
/* EC14 0010EB14 21186800 */   addu      $3, $3, $8
.L0010EB18:
/* EC18 0010EB18 23186600 */  subu       $3, $3, $6
.L0010EB1C:
/* EC1C 0010EB1C FFFF8431 */  andi       $4, $12, 0xFFFF
/* EC20 0010EB20 1B006500 */  divu       $0, $3, $5
/* EC24 0010EB24 0100A050 */  beql       $5, $0, .L0010EB2C
/* EC28 0010EB28 CD010000 */   break     0, 7
.L0010EB2C:
/* EC2C 0010EB2C 12100000 */  mflo       $2
/* EC30 0010EB30 10180000 */  mfhi       $3
/* EC34 0010EB34 3C180300 */  dsll32     $3, $3, 0
/* EC38 0010EB38 381C0300 */  dsll       $3, $3, 16
/* EC3C 0010EB3C 3F180300 */  dsra32     $3, $3, 0
/* EC40 0010EB40 18304700 */  mult       $6, $2, $7
/* EC44 0010EB44 25186400 */  or         $3, $3, $4
/* EC48 0010EB48 2B106600 */  sltu       $2, $3, $6
/* EC4C 0010EB4C 07004010 */  beqz       $2, .L0010EB6C
/* EC50 0010EB50 00000000 */   nop
/* EC54 0010EB54 21186800 */  addu       $3, $3, $8
/* EC58 0010EB58 2B106800 */  sltu       $2, $3, $8
/* EC5C 0010EB5C 03004014 */  bnez       $2, .L0010EB6C
/* EC60 0010EB60 2B106600 */   sltu      $2, $3, $6
/* EC64 0010EB64 01004054 */  bnel       $2, $0, .L0010EB6C
/* EC68 0010EB68 21186800 */   addu      $3, $3, $8
.L0010EB6C:
/* EC6C 0010EB6C 97002013 */  beqz       $25, .L0010EDCC
/* EC70 0010EB70 23606600 */   subu      $12, $3, $6
/* EC74 0010EB74 0610AC01 */  srlv       $2, $12, $13
/* EC78 0010EB78 3C100200 */  dsll32     $2, $2, 0
/* EC7C 0010EB7C 92000010 */  b          .L0010EDC8
/* EC80 0010EB80 3E780200 */   dsrl32    $15, $2, 0
.L0010EB84:
/* EC84 0010EB84 2B104901 */  sltu       $2, $10, $9
/* EC88 0010EB88 06004010 */  beqz       $2, .L0010EBA4
/* EC8C 0010EB8C 3C100C00 */   dsll32    $2, $12, 0
/* EC90 0010EB90 3C180A00 */  dsll32     $3, $10, 0
/* EC94 0010EB94 3E780200 */  dsrl32     $15, $2, 0
/* EC98 0010EB98 2578E301 */  or         $15, $15, $3
/* EC9C 0010EB9C 8B000010 */  b          .L0010EDCC
/* ECA0 0010EBA0 0000AFFF */   sd        $15, 0x0($sp)
.L0010EBA4:
/* ECA4 0010EBA4 FFFF0234 */  ori        $2, $0, 0xFFFF
/* ECA8 0010EBA8 2B104900 */  sltu       $2, $2, $9
/* ECAC 0010EBAC 06004014 */  bnez       $2, .L0010EBC8
/* ECB0 0010EBB0 FF00023C */   lui       $2, (0xFFFFFF >> 16)
/* ECB4 0010EBB4 0001222D */  sltiu      $2, $9, 0x100
/* ECB8 0010EBB8 08000624 */  addiu      $6, $0, 0x8
/* ECBC 0010EBBC 08000010 */  b          .L0010EBE0
/* ECC0 0010EBC0 0B300200 */   movn      $6, $0, $2
/* ECC4 0010EBC4 00000000 */  nop
.L0010EBC8:
/* ECC8 0010EBC8 18000624 */  addiu      $6, $0, 0x18
/* ECCC 0010EBCC FFFF4234 */  ori        $2, $2, (0xFFFFFF & 0xFFFF)
/* ECD0 0010EBD0 10000324 */  addiu      $3, $0, 0x10
/* ECD4 0010EBD4 2B104900 */  sltu       $2, $2, $9
/* ECD8 0010EBD8 0A306200 */  movz       $6, $3, $2
/* ECDC 0010EBDC 00000000 */  nop
.L0010EBE0:
/* ECE0 0010EBE0 2900023C */  lui        $2, %hi(__clz_tab_2)
/* ECE4 0010EBE4 0620C900 */  srlv       $4, $9, $6
/* ECE8 0010EBE8 70754224 */  addiu      $2, $2, %lo(__clz_tab_2)
/* ECEC 0010EBEC 20000524 */  addiu      $5, $0, 0x20
/* ECF0 0010EBF0 21208200 */  addu       $4, $4, $2
/* ECF4 0010EBF4 00008390 */  lbu        $3, 0x0($4)
/* ECF8 0010EBF8 21186600 */  addu       $3, $3, $6
/* ECFC 0010EBFC 2368A300 */  subu       $13, $5, $3
/* ED00 0010EC00 1100A015 */  bnez       $13, .L0010EC48
/* ED04 0010EC04 2370AD00 */   subu      $14, $5, $13
/* ED08 0010EC08 2B102A01 */  sltu       $2, $9, $10
/* ED0C 0010EC0C 04004014 */  bnez       $2, .L0010EC20
/* ED10 0010EC10 23208801 */   subu      $4, $12, $8
/* ED14 0010EC14 2B108801 */  sltu       $2, $12, $8
/* ED18 0010EC18 05004014 */  bnez       $2, .L0010EC30
/* ED1C 0010EC1C 00000000 */   nop
.L0010EC20:
/* ED20 0010EC20 23184901 */  subu       $3, $10, $9
/* ED24 0010EC24 2B108401 */  sltu       $2, $12, $4
/* ED28 0010EC28 23506200 */  subu       $10, $3, $2
/* ED2C 0010EC2C 2D608000 */  daddu      $12, $4, $0
.L0010EC30:
/* ED30 0010EC30 66002013 */  beqz       $25, .L0010EDCC
/* ED34 0010EC34 3C100C00 */   dsll32    $2, $12, 0
/* ED38 0010EC38 3C180A00 */  dsll32     $3, $10, 0
/* ED3C 0010EC3C 3E780200 */  dsrl32     $15, $2, 0
/* ED40 0010EC40 61000010 */  b          .L0010EDC8
/* ED44 0010EC44 2578E301 */   or        $15, $15, $3
.L0010EC48:
/* ED48 0010EC48 0418AA01 */  sllv       $3, $10, $13
/* ED4C 0010EC4C 0620C801 */  srlv       $4, $8, $14
/* ED50 0010EC50 0638CA01 */  srlv       $7, $10, $14
/* ED54 0010EC54 0610CC01 */  srlv       $2, $12, $14
/* ED58 0010EC58 0428A901 */  sllv       $5, $9, $13
/* ED5C 0010EC5C 25506200 */  or         $10, $3, $2
/* ED60 0010EC60 2548A400 */  or         $9, $5, $4
/* ED64 0010EC64 0440A801 */  sllv       $8, $8, $13
/* ED68 0010EC68 0460AC01 */  sllv       $12, $12, $13
/* ED6C 0010EC6C 02340900 */  srl        $6, $9, 16
/* ED70 0010EC70 1B00E600 */  divu       $0, $7, $6
/* ED74 0010EC74 FFFF2531 */  andi       $5, $9, 0xFFFF
/* ED78 0010EC78 02240A00 */  srl        $4, $10, 16
/* ED7C 0010EC7C 0100C050 */  beql       $6, $0, .L0010EC84
/* ED80 0010EC80 CD010000 */   break     0, 7
.L0010EC84:
/* ED84 0010EC84 12100000 */  mflo       $2
/* ED88 0010EC88 10180000 */  mfhi       $3
/* ED8C 0010EC8C 2D584000 */  daddu      $11, $2, $0
/* ED90 0010EC90 3C180300 */  dsll32     $3, $3, 0
/* ED94 0010EC94 381C0300 */  dsll       $3, $3, 16
/* ED98 0010EC98 3F180300 */  dsra32     $3, $3, 0
/* ED9C 0010EC9C 18386501 */  mult       $7, $11, $5
/* EDA0 0010ECA0 25186400 */  or         $3, $3, $4
/* EDA4 0010ECA4 2B106700 */  sltu       $2, $3, $7
/* EDA8 0010ECA8 0C004050 */  beql       $2, $0, .L0010ECDC
/* EDAC 0010ECAC 23186700 */   subu      $3, $3, $7
/* EDB0 0010ECB0 21186900 */  addu       $3, $3, $9
/* EDB4 0010ECB4 2B106900 */  sltu       $2, $3, $9
/* EDB8 0010ECB8 07004014 */  bnez       $2, .L0010ECD8
/* EDBC 0010ECBC FFFF6B25 */   addiu     $11, $11, -0x1
/* EDC0 0010ECC0 2B106700 */  sltu       $2, $3, $7
/* EDC4 0010ECC4 05004050 */  beql       $2, $0, .L0010ECDC
/* EDC8 0010ECC8 23186700 */   subu      $3, $3, $7
/* EDCC 0010ECCC FFFF6B25 */  addiu      $11, $11, -0x1
/* EDD0 0010ECD0 21186900 */  addu       $3, $3, $9
/* EDD4 0010ECD4 00000000 */  nop
.L0010ECD8:
/* EDD8 0010ECD8 23186700 */  subu       $3, $3, $7
.L0010ECDC:
/* EDDC 0010ECDC 0100C050 */  beql       $6, $0, .L0010ECE4
/* EDE0 0010ECE0 CD010000 */   break     0, 7
.L0010ECE4:
/* EDE4 0010ECE4 1B006600 */  divu       $0, $3, $6
/* EDE8 0010ECE8 FFFF4431 */  andi       $4, $10, 0xFFFF
/* EDEC 0010ECEC 12100000 */  mflo       $2
/* EDF0 0010ECF0 10180000 */  mfhi       $3
/* EDF4 0010ECF4 2D304000 */  daddu      $6, $2, $0
/* EDF8 0010ECF8 3C180300 */  dsll32     $3, $3, 0
/* EDFC 0010ECFC 381C0300 */  dsll       $3, $3, 16
/* EE00 0010ED00 3F180300 */  dsra32     $3, $3, 0
/* EE04 0010ED04 1838C500 */  mult       $7, $6, $5
/* EE08 0010ED08 25286400 */  or         $5, $3, $4
/* EE0C 0010ED0C 2B10A700 */  sltu       $2, $5, $7
/* EE10 0010ED10 0B004010 */  beqz       $2, .L0010ED40
/* EE14 0010ED14 3C100B00 */   dsll32    $2, $11, 0
/* EE18 0010ED18 2128A900 */  addu       $5, $5, $9
/* EE1C 0010ED1C 2B10A900 */  sltu       $2, $5, $9
/* EE20 0010ED20 06004014 */  bnez       $2, .L0010ED3C
/* EE24 0010ED24 FFFFC624 */   addiu     $6, $6, -0x1
/* EE28 0010ED28 2B10A700 */  sltu       $2, $5, $7
/* EE2C 0010ED2C 04004010 */  beqz       $2, .L0010ED40
/* EE30 0010ED30 3C100B00 */   dsll32    $2, $11, 0
/* EE34 0010ED34 FFFFC624 */  addiu      $6, $6, -0x1
/* EE38 0010ED38 2128A900 */  addu       $5, $5, $9
.L0010ED3C:
/* EE3C 0010ED3C 3C100B00 */  dsll32     $2, $11, 0
.L0010ED40:
/* EE40 0010ED40 2328A700 */  subu       $5, $5, $7
/* EE44 0010ED44 38140200 */  dsll       $2, $2, 16
/* EE48 0010ED48 3F100200 */  dsra32     $2, $2, 0
/* EE4C 0010ED4C 2D50A000 */  daddu      $10, $5, $0
/* EE50 0010ED50 25104600 */  or         $2, $2, $6
/* EE54 0010ED54 19004800 */  multu      $2, $8
/* EE58 0010ED58 10380000 */  mfhi       $7
/* EE5C 0010ED5C 12300000 */  mflo       $6
/* EE60 0010ED60 2B184701 */  sltu       $3, $10, $7
/* EE64 0010ED64 06006014 */  bnez       $3, .L0010ED80
/* EE68 0010ED68 2320C800 */   subu      $4, $6, $8
/* EE6C 0010ED6C 0800EA14 */  bne        $7, $10, .L0010ED90
/* EE70 0010ED70 2B108601 */   sltu      $2, $12, $6
/* EE74 0010ED74 06004010 */  beqz       $2, .L0010ED90
/* EE78 0010ED78 00000000 */   nop
/* EE7C 0010ED7C 00000000 */  nop
.L0010ED80:
/* EE80 0010ED80 2318E900 */  subu       $3, $7, $9
/* EE84 0010ED84 2B10C400 */  sltu       $2, $6, $4
/* EE88 0010ED88 23386200 */  subu       $7, $3, $2
/* EE8C 0010ED8C 2D308000 */  daddu      $6, $4, $0
.L0010ED90:
/* EE90 0010ED90 0E002013 */  beqz       $25, .L0010EDCC
/* EE94 0010ED94 23208601 */   subu      $4, $12, $6
/* EE98 0010ED98 2318A700 */  subu       $3, $5, $7
/* EE9C 0010ED9C 2B108401 */  sltu       $2, $12, $4
/* EEA0 0010EDA0 23506200 */  subu       $10, $3, $2
/* EEA4 0010EDA4 0428CA01 */  sllv       $5, $10, $14
/* EEA8 0010EDA8 0620A401 */  srlv       $4, $4, $13
/* EEAC 0010EDAC 0610AA01 */  srlv       $2, $10, $13
/* EEB0 0010EDB0 2528A400 */  or         $5, $5, $4
/* EEB4 0010EDB4 3C100200 */  dsll32     $2, $2, 0
/* EEB8 0010EDB8 3C280500 */  dsll32     $5, $5, 0
/* EEBC 0010EDBC 3E780500 */  dsrl32     $15, $5, 0
/* EEC0 0010EDC0 2578E201 */  or         $15, $15, $2
/* EEC4 0010EDC4 00000000 */  nop
.L0010EDC8:
/* EEC8 0010EDC8 00002FFF */  sd         $15, 0x0($25)
.L0010EDCC:
/* EECC 0010EDCC 16000012 */  beqz       $16, .L0010EE28
/* EED0 0010EDD0 0000A3DF */   ld        $3, 0x0($sp)
/* EED4 0010EDD4 FFFF0424 */  addiu      $4, $0, -0x1
/* EED8 0010EDD8 3C200400 */  dsll32     $4, $4, 0
/* EEDC 0010EDDC 24C00403 */  and        $24, $24, $4
/* EEE0 0010EDE0 3C100300 */  dsll32     $2, $3, 0
/* EEE4 0010EDE4 3F100200 */  dsra32     $2, $2, 0
/* EEE8 0010EDE8 23100200 */  negu       $2, $2
/* EEEC 0010EDEC 3F180300 */  dsra32     $3, $3, 0
/* EEF0 0010EDF0 3C100200 */  dsll32     $2, $2, 0
/* EEF4 0010EDF4 23180300 */  negu       $3, $3
/* EEF8 0010EDF8 3E100200 */  dsrl32     $2, $2, 0
/* EEFC 0010EDFC 25C00203 */  or         $24, $24, $2
/* EF00 0010EE00 3C201800 */  dsll32     $4, $24, 0
/* EF04 0010EE04 3F200400 */  dsra32     $4, $4, 0
/* EF08 0010EE08 FFFF023C */  lui        $2, (0xFFFF0000 >> 16)
/* EF0C 0010EE0C 3E100200 */  dsrl32     $2, $2, 0
/* EF10 0010EE10 2B200400 */  sltu       $4, $0, $4
/* EF14 0010EE14 24C00203 */  and        $24, $24, $2
/* EF18 0010EE18 23186400 */  subu       $3, $3, $4
/* EF1C 0010EE1C 3C180300 */  dsll32     $3, $3, 0
/* EF20 0010EE20 25C00303 */  or         $24, $24, $3
/* EF24 0010EE24 0000B8FF */  sd         $24, 0x0($sp)
.L0010EE28:
/* EF28 0010EE28 0000A2DF */  ld         $2, 0x0($sp)
/* EF2C 0010EE2C 3000B0DF */  ld         $16, 0x30($sp)
/* EF30 0010EE30 0800E003 */  jr         $31
/* EF34 0010EE34 4000BD27 */   addiu     $sp, $sp, 0x40
