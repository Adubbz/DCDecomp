.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckBuyItemFunc2__Fv
/* EB8B0 001EB7B0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* EB8B4 001EB7B4 01000224 */  addiu      $2, $0, 0x1
/* EB8B8 001EB7B8 282E0070 */  paddub     $5, $0, $0
/* EB8BC 001EB7BC 0C000010 */  b          .L001EB7F0
/* EB8C0 001EB7C0 00000000 */   nop
.L001EB7C4:
/* EB8C4 001EB7C4 80200500 */  sll        $4, $5, 2
/* EB8C8 001EB7C8 9094838F */  lw         $3, -0x6B70($gp)
/* EB8CC 001EB7CC 21186400 */  addu       $3, $3, $4
/* EB8D0 001EB7D0 0000648C */  lw         $4, 0x0($3)
/* EB8D4 001EB7D4 02000324 */  addiu      $3, $0, 0x2
/* EB8D8 001EB7D8 04008314 */  bne        $4, $3, .L001EB7EC
/* EB8DC 001EB7DC 00000000 */   nop
/* EB8E0 001EB7E0 02004234 */  ori        $2, $2, 0x2
/* EB8E4 001EB7E4 05000010 */  b          .L001EB7FC
/* EB8E8 001EB7E8 00000000 */   nop
.L001EB7EC:
/* EB8EC 001EB7EC 0100A524 */  addiu      $5, $5, 0x1
.L001EB7F0:
/* EB8F0 001EB7F0 1E00A328 */  slti       $3, $5, 0x1E
/* EB8F4 001EB7F4 F3FF6014 */  bnez       $3, .L001EB7C4
/* EB8F8 001EB7F8 00000000 */   nop
.L001EB7FC:
/* EB8FC 001EB7FC 281E0070 */  paddub     $3, $0, $0
/* EB900 001EB800 8494848F */  lw         $4, -0x6B7C($gp)
/* EB904 001EB804 60438724 */  addiu      $7, $4, 0x4360
/* EB908 001EB808 28360070 */  paddub     $6, $0, $0
/* EB90C 001EB80C 0A000010 */  b          .L001EB838
/* EB910 001EB810 00000000 */   nop
.L001EB814:
/* EB914 001EB814 40200600 */  sll        $4, $6, 1
/* EB918 001EB818 21288700 */  addu       $5, $4, $7
/* EB91C 001EB81C 0200A484 */  lh         $4, 0x2($5)
/* EB920 001EB820 84008428 */  slti       $4, $4, 0x84
/* EB924 001EB824 03008014 */  bnez       $4, .L001EB834
/* EB928 001EB828 00000000 */   nop
/* EB92C 001EB82C 0800A484 */  lh         $4, 0x8($5)
/* EB930 001EB830 21186400 */  addu       $3, $3, $4
.L001EB834:
/* EB934 001EB834 0100C624 */  addiu      $6, $6, 0x1
.L001EB838:
/* EB938 001EB838 0300C428 */  slti       $4, $6, 0x3
/* EB93C 001EB83C F5FF8014 */  bnez       $4, .L001EB814
/* EB940 001EB840 00000000 */   nop
/* EB944 001EB844 28360070 */  paddub     $6, $0, $0
/* EB948 001EB848 09000010 */  b          .L001EB870
/* EB94C 001EB84C 00000000 */   nop
.L001EB850:
/* EB950 001EB850 40200600 */  sll        $4, $6, 1
/* EB954 001EB854 21208700 */  addu       $4, $4, $7
/* EB958 001EB858 0E008484 */  lh         $4, 0xE($4)
/* EB95C 001EB85C 84008428 */  slti       $4, $4, 0x84
/* EB960 001EB860 02008014 */  bnez       $4, .L001EB86C
/* EB964 001EB864 00000000 */   nop
/* EB968 001EB868 01006324 */  addiu      $3, $3, 0x1
.L001EB86C:
/* EB96C 001EB86C 0100C624 */  addiu      $6, $6, 0x1
.L001EB870:
/* EB970 001EB870 0000E480 */  lb         $4, 0x0($7)
/* EB974 001EB874 2A28C400 */  slt        $5, $6, $4
/* EB978 001EB878 F5FFA014 */  bnez       $5, .L001EB850
/* EB97C 001EB87C 00000000 */   nop
/* EB980 001EB880 2900053C */  lui        $5, %hi(_1581_2)
/* EB984 001EB884 B027A724 */  addiu      $7, $5, %lo(_1581_2)
/* EB988 001EB888 0000A627 */  addiu      $6, $sp, 0x0
/* EB98C 001EB88C 0000E5DC */  ld         $5, 0x0($7)
/* EB990 001EB890 0800E0C4 */  lwc1       $f0, 0x8($7)
/* EB994 001EB894 0000C5FC */  sd         $5, 0x0($6)
/* EB998 001EB898 0800C0E4 */  swc1       $f0, 0x8($6)
/* EB99C 001EB89C 2900053C */  lui        $5, %hi(_1582)
/* EB9A0 001EB8A0 C027A724 */  addiu      $7, $5, %lo(_1582)
/* EB9A4 001EB8A4 1000A627 */  addiu      $6, $sp, 0x10
/* EB9A8 001EB8A8 0000E5DC */  ld         $5, 0x0($7)
/* EB9AC 001EB8AC 0800E0C4 */  lwc1       $f0, 0x8($7)
/* EB9B0 001EB8B0 0000C5FC */  sd         $5, 0x0($6)
/* EB9B4 001EB8B4 0800C0E4 */  swc1       $f0, 0x8($6)
/* EB9B8 001EB8B8 9494858F */  lw         $5, -0x6B6C($gp)
/* EB9BC 001EB8BC 1000A5AF */  sw         $5, 0x10($sp)
/* EB9C0 001EB8C0 9894858F */  lw         $5, -0x6B68($gp)
/* EB9C4 001EB8C4 1400A5AF */  sw         $5, 0x14($sp)
/* EB9C8 001EB8C8 9C94858F */  lw         $5, -0x6B64($gp)
/* EB9CC 001EB8CC 1800A5AF */  sw         $5, 0x18($sp)
/* EB9D0 001EB8D0 283E0070 */  paddub     $7, $0, $0
/* EB9D4 001EB8D4 1A000010 */  b          .L001EB940
/* EB9D8 001EB8D8 00000000 */   nop
.L001EB8DC:
/* EB9DC 001EB8DC 28460070 */  paddub     $8, $0, $0
/* EB9E0 001EB8E0 0D000010 */  b          .L001EB918
/* EB9E4 001EB8E4 00000000 */   nop
.L001EB8E8:
/* EB9E8 001EB8E8 2128DD00 */  addu       $5, $6, $sp
/* EB9EC 001EB8EC 80300800 */  sll        $6, $8, 2
/* EB9F0 001EB8F0 1000A58C */  lw         $5, 0x10($5)
/* EB9F4 001EB8F4 2128A600 */  addu       $5, $5, $6
/* EB9F8 001EB8F8 0000A68C */  lw         $6, 0x0($5)
/* EB9FC 001EB8FC 01000524 */  addiu      $5, $0, 0x1
/* EBA00 001EB900 0400C514 */  bne        $6, $5, .L001EB914
/* EBA04 001EB904 00000000 */   nop
/* EBA08 001EB908 04004234 */  ori        $2, $2, 0x4
/* EBA0C 001EB90C 08000010 */  b          .L001EB930
/* EBA10 001EB910 00000000 */   nop
.L001EB914:
/* EBA14 001EB914 01000825 */  addiu      $8, $8, 0x1
.L001EB918:
/* EBA18 001EB918 80300700 */  sll        $6, $7, 2
/* EBA1C 001EB91C 2128DD00 */  addu       $5, $6, $sp
/* EBA20 001EB920 0000A58C */  lw         $5, 0x0($5)
/* EBA24 001EB924 2A280501 */  slt        $5, $8, $5
/* EBA28 001EB928 EFFFA014 */  bnez       $5, .L001EB8E8
/* EBA2C 001EB92C 00000000 */   nop
.L001EB930:
/* EBA30 001EB930 04004530 */  andi       $5, $2, 0x4
/* EBA34 001EB934 0500A014 */  bnez       $5, .L001EB94C
/* EBA38 001EB938 00000000 */   nop
/* EBA3C 001EB93C 0100E724 */  addiu      $7, $7, 0x1
.L001EB940:
/* EBA40 001EB940 0300E528 */  slti       $5, $7, 0x3
/* EBA44 001EB944 E5FFA014 */  bnez       $5, .L001EB8DC
/* EBA48 001EB948 00000000 */   nop
.L001EB94C:
/* EBA4C 001EB94C 04004530 */  andi       $5, $2, 0x4
/* EBA50 001EB950 0500A010 */  beqz       $5, .L001EB968
/* EBA54 001EB954 00000000 */   nop
/* EBA58 001EB958 2A088300 */  slt        $at, $4, $3
/* EBA5C 001EB95C 02002010 */  beqz       $at, .L001EB968
/* EBA60 001EB960 00000000 */   nop
/* EBA64 001EB964 08000224 */  addiu      $2, $0, 0x8
.L001EB968:
/* EBA68 001EB968 2000BD27 */  addiu      $sp, $sp, 0x20
/* EBA6C 001EB96C 0800E003 */  jr         $31
/* EBA70 001EB970 00000000 */   nop
/* EBA74 001EB974 00000000 */  nop
/* EBA78 001EB978 00000000 */  nop
/* EBA7C 001EB97C 00000000 */  nop
