.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CheckBuyItemFunc2__Fv
/* 0EB8B0 001EB7B0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0EB8B4 001EB7B4 01000224 */  addiu       $2, $0, 0x1
/* 0EB8B8 001EB7B8 282E0070 */  paddub      $5, $0, $0
/* 0EB8BC 001EB7BC 0C000010 */  b           .L001EB7F0
/* 0EB8C0 001EB7C0 00000000 */   nop
.L001EB7C4:
/* 0EB8C4 001EB7C4 80200500 */  sll         $4, $5, 2
/* 0EB8C8 001EB7C8 9094838F */  lw          $3, -0x6B70($28)
/* 0EB8CC 001EB7CC 21186400 */  addu        $3, $3, $4
/* 0EB8D0 001EB7D0 0000648C */  lw          $4, 0x0($3)
/* 0EB8D4 001EB7D4 02000324 */  addiu       $3, $0, 0x2
/* 0EB8D8 001EB7D8 04008314 */  bne         $4, $3, .L001EB7EC
/* 0EB8DC 001EB7DC 00000000 */   nop
/* 0EB8E0 001EB7E0 02004234 */  ori         $2, $2, 0x2
/* 0EB8E4 001EB7E4 05000010 */  b           .L001EB7FC
/* 0EB8E8 001EB7E8 00000000 */   nop
.L001EB7EC:
/* 0EB8EC 001EB7EC 0100A524 */  addiu       $5, $5, 0x1
.L001EB7F0:
/* 0EB8F0 001EB7F0 1E00A328 */  slti        $3, $5, 0x1E
/* 0EB8F4 001EB7F4 F3FF6014 */  bnez        $3, .L001EB7C4
/* 0EB8F8 001EB7F8 00000000 */   nop
.L001EB7FC:
/* 0EB8FC 001EB7FC 281E0070 */  paddub      $3, $0, $0
/* 0EB900 001EB800 8494848F */  lw          $4, -0x6B7C($28)
/* 0EB904 001EB804 60438724 */  addiu       $7, $4, 0x4360
/* 0EB908 001EB808 28360070 */  paddub      $6, $0, $0
/* 0EB90C 001EB80C 0A000010 */  b           .L001EB838
/* 0EB910 001EB810 00000000 */   nop
.L001EB814:
/* 0EB914 001EB814 40200600 */  sll         $4, $6, 1
/* 0EB918 001EB818 21288700 */  addu        $5, $4, $7
/* 0EB91C 001EB81C 0200A484 */  lh          $4, 0x2($5)
/* 0EB920 001EB820 84008428 */  slti        $4, $4, 0x84
/* 0EB924 001EB824 03008014 */  bnez        $4, .L001EB834
/* 0EB928 001EB828 00000000 */   nop
/* 0EB92C 001EB82C 0800A484 */  lh          $4, 0x8($5)
/* 0EB930 001EB830 21186400 */  addu        $3, $3, $4
.L001EB834:
/* 0EB934 001EB834 0100C624 */  addiu       $6, $6, 0x1
.L001EB838:
/* 0EB938 001EB838 0300C428 */  slti        $4, $6, 0x3
/* 0EB93C 001EB83C F5FF8014 */  bnez        $4, .L001EB814
/* 0EB940 001EB840 00000000 */   nop
/* 0EB944 001EB844 28360070 */  paddub      $6, $0, $0
/* 0EB948 001EB848 09000010 */  b           .L001EB870
/* 0EB94C 001EB84C 00000000 */   nop
.L001EB850:
/* 0EB950 001EB850 40200600 */  sll         $4, $6, 1
/* 0EB954 001EB854 21208700 */  addu        $4, $4, $7
/* 0EB958 001EB858 0E008484 */  lh          $4, 0xE($4)
/* 0EB95C 001EB85C 84008428 */  slti        $4, $4, 0x84
/* 0EB960 001EB860 02008014 */  bnez        $4, .L001EB86C
/* 0EB964 001EB864 00000000 */   nop
/* 0EB968 001EB868 01006324 */  addiu       $3, $3, 0x1
.L001EB86C:
/* 0EB96C 001EB86C 0100C624 */  addiu       $6, $6, 0x1
.L001EB870:
/* 0EB970 001EB870 0000E480 */  lb          $4, 0x0($7)
/* 0EB974 001EB874 2A28C400 */  slt         $5, $6, $4
/* 0EB978 001EB878 F5FFA014 */  bnez        $5, .L001EB850
/* 0EB97C 001EB87C 00000000 */   nop
/* 0EB980 001EB880 2900053C */  lui         $5, %hi(LIT_1581__2)
/* 0EB984 001EB884 B027A724 */  addiu       $7, $5, %lo(LIT_1581__2)
/* 0EB988 001EB888 0000A627 */  addiu       $6, $29, 0x0
/* 0EB98C 001EB88C 0000E5DC */  ld          $5, 0x0($7)
/* 0EB990 001EB890 0800E0C4 */  lwc1        $f0, 0x8($7)
/* 0EB994 001EB894 0000C5FC */  sd          $5, 0x0($6)
/* 0EB998 001EB898 0800C0E4 */  swc1        $f0, 0x8($6)
/* 0EB99C 001EB89C 2900053C */  lui         $5, %hi(LIT_1582)
/* 0EB9A0 001EB8A0 C027A724 */  addiu       $7, $5, %lo(LIT_1582)
/* 0EB9A4 001EB8A4 1000A627 */  addiu       $6, $29, 0x10
/* 0EB9A8 001EB8A8 0000E5DC */  ld          $5, 0x0($7)
/* 0EB9AC 001EB8AC 0800E0C4 */  lwc1        $f0, 0x8($7)
/* 0EB9B0 001EB8B0 0000C5FC */  sd          $5, 0x0($6)
/* 0EB9B4 001EB8B4 0800C0E4 */  swc1        $f0, 0x8($6)
/* 0EB9B8 001EB8B8 9494858F */  lw          $5, -0x6B6C($28)
/* 0EB9BC 001EB8BC 1000A5AF */  sw          $5, 0x10($29)
/* 0EB9C0 001EB8C0 9894858F */  lw          $5, -0x6B68($28)
/* 0EB9C4 001EB8C4 1400A5AF */  sw          $5, 0x14($29)
/* 0EB9C8 001EB8C8 9C94858F */  lw          $5, -0x6B64($28)
/* 0EB9CC 001EB8CC 1800A5AF */  sw          $5, 0x18($29)
/* 0EB9D0 001EB8D0 283E0070 */  paddub      $7, $0, $0
/* 0EB9D4 001EB8D4 1A000010 */  b           .L001EB940
/* 0EB9D8 001EB8D8 00000000 */   nop
.L001EB8DC:
/* 0EB9DC 001EB8DC 28460070 */  paddub      $8, $0, $0
/* 0EB9E0 001EB8E0 0D000010 */  b           .L001EB918
/* 0EB9E4 001EB8E4 00000000 */   nop
.L001EB8E8:
/* 0EB9E8 001EB8E8 2128DD00 */  addu        $5, $6, $29
/* 0EB9EC 001EB8EC 80300800 */  sll         $6, $8, 2
/* 0EB9F0 001EB8F0 1000A58C */  lw          $5, 0x10($5)
/* 0EB9F4 001EB8F4 2128A600 */  addu        $5, $5, $6
/* 0EB9F8 001EB8F8 0000A68C */  lw          $6, 0x0($5)
/* 0EB9FC 001EB8FC 01000524 */  addiu       $5, $0, 0x1
/* 0EBA00 001EB900 0400C514 */  bne         $6, $5, .L001EB914
/* 0EBA04 001EB904 00000000 */   nop
/* 0EBA08 001EB908 04004234 */  ori         $2, $2, 0x4
/* 0EBA0C 001EB90C 08000010 */  b           .L001EB930
/* 0EBA10 001EB910 00000000 */   nop
.L001EB914:
/* 0EBA14 001EB914 01000825 */  addiu       $8, $8, 0x1
.L001EB918:
/* 0EBA18 001EB918 80300700 */  sll         $6, $7, 2
/* 0EBA1C 001EB91C 2128DD00 */  addu        $5, $6, $29
/* 0EBA20 001EB920 0000A58C */  lw          $5, 0x0($5)
/* 0EBA24 001EB924 2A280501 */  slt         $5, $8, $5
/* 0EBA28 001EB928 EFFFA014 */  bnez        $5, .L001EB8E8
/* 0EBA2C 001EB92C 00000000 */   nop
.L001EB930:
/* 0EBA30 001EB930 04004530 */  andi        $5, $2, 0x4
/* 0EBA34 001EB934 0500A014 */  bnez        $5, .L001EB94C
/* 0EBA38 001EB938 00000000 */   nop
/* 0EBA3C 001EB93C 0100E724 */  addiu       $7, $7, 0x1
.L001EB940:
/* 0EBA40 001EB940 0300E528 */  slti        $5, $7, 0x3
/* 0EBA44 001EB944 E5FFA014 */  bnez        $5, .L001EB8DC
/* 0EBA48 001EB948 00000000 */   nop
.L001EB94C:
/* 0EBA4C 001EB94C 04004530 */  andi        $5, $2, 0x4
/* 0EBA50 001EB950 0500A010 */  beqz        $5, .L001EB968
/* 0EBA54 001EB954 00000000 */   nop
/* 0EBA58 001EB958 2A088300 */  slt         $1, $4, $3
/* 0EBA5C 001EB95C 02002010 */  beqz        $1, .L001EB968
/* 0EBA60 001EB960 00000000 */   nop
/* 0EBA64 001EB964 08000224 */  addiu       $2, $0, 0x8
.L001EB968:
/* 0EBA68 001EB968 2000BD27 */  addiu       $29, $29, 0x20
/* 0EBA6C 001EB96C 0800E003 */  jr          $31
/* 0EBA70 001EB970 00000000 */   nop
/* 0EBA74 001EB974 00000000 */  nop
/* 0EBA78 001EB978 00000000 */  nop
/* 0EBA7C 001EB97C 00000000 */  nop
