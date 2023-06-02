.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel buildRandomMap__11CDungeonMapFii
/* CB770 001CB670 50FFBD27 */  addiu      $sp, $sp, -0xB0
/* CB774 001CB674 9000BF7F */  sq         $31, 0x90($sp)
/* CB778 001CB678 8000BE7F */  sq         $fp, 0x80($sp)
/* CB77C 001CB67C 7000B77F */  sq         $23, 0x70($sp)
/* CB780 001CB680 6000B67F */  sq         $22, 0x60($sp)
/* CB784 001CB684 5000B57F */  sq         $21, 0x50($sp)
/* CB788 001CB688 4000B47F */  sq         $20, 0x40($sp)
/* CB78C 001CB68C 3000B37F */  sq         $19, 0x30($sp)
/* CB790 001CB690 2000B27F */  sq         $18, 0x20($sp)
/* CB794 001CB694 1000B17F */  sq         $17, 0x10($sp)
/* CB798 001CB698 0000B07F */  sq         $16, 0x0($sp)
/* CB79C 001CB69C 28AE8070 */  paddub     $21, $4, $0
/* CB7A0 001CB6A0 28F6A070 */  paddub     $fp, $5, $0
/* CB7A4 001CB6A4 28A6C070 */  paddub     $20, $6, $0
/* CB7A8 001CB6A8 12008012 */  beqz       $20, .L001CB6F4
/* CB7AC 001CB6AC 00000000 */   nop
/* CB7B0 001CB6B0 BE11040C */  jal        rand
/* CB7B4 001CB6B4 00000000 */   nop
/* CB7B8 001CB6B8 00008244 */  mtc1       $2, $f0
/* CB7BC 001CB6BC 00000000 */  nop
/* CB7C0 001CB6C0 60008046 */  cvt.s.w    $f1, $f0
/* CB7C4 001CB6C4 0100023C */  lui        $2, (0x186A0 >> 16)
/* CB7C8 001CB6C8 A0864234 */  ori        $2, $2, (0x186A0 & 0xFFFF)
/* CB7CC 001CB6CC 00008244 */  mtc1       $2, $f0
/* CB7D0 001CB6D0 00000000 */  nop
/* CB7D4 001CB6D4 20008046 */  cvt.s.w    $f0, $f0
/* CB7D8 001CB6D8 030B0046 */  div.s      $f12, $f1, $f0
/* CB7DC 001CB6DC 2C44040C */  jal        fptosi
/* CB7E0 001CB6E0 00000000 */   nop
/* CB7E4 001CB6E4 6804A2AE */  sw         $2, 0x468($21)
/* CB7E8 001CB6E8 6804A48E */  lw         $4, 0x468($21)
/* CB7EC 001CB6EC BA11040C */  jal        srand
/* CB7F0 001CB6F0 00000000 */   nop
.L001CB6F4:
/* CB7F4 001CB6F4 28260070 */  paddub     $4, $0, $0
/* CB7F8 001CB6F8 0D000010 */  b          .L001CB730
/* CB7FC 001CB6FC 00000000 */   nop
.L001CB700:
/* CB800 001CB700 FFFF0324 */  addiu      $3, $0, -0x1
/* CB804 001CB704 80100400 */  sll        $2, $4, 2
/* CB808 001CB708 21104400 */  addu       $2, $2, $4
/* CB80C 001CB70C 00110200 */  sll        $2, $2, 4
/* CB810 001CB710 21105500 */  addu       $2, $2, $21
/* CB814 001CB714 0100013C */  lui        $at, (0x10000 >> 16)
/* CB818 001CB718 21084100 */  addu       $at, $2, $at
/* CB81C 001CB71C 588D23AC */  sw         $3, -0x72A8($at)
/* CB820 001CB720 0100013C */  lui        $at, (0x10000 >> 16)
/* CB824 001CB724 21084100 */  addu       $at, $2, $at
/* CB828 001CB728 7C8D20AC */  sw         $0, -0x7284($at)
/* CB82C 001CB72C 01008424 */  addiu      $4, $4, 0x1
.L001CB730:
/* CB830 001CB730 30008228 */  slti       $2, $4, 0x30
/* CB834 001CB734 F2FF4014 */  bnez       $2, .L001CB700
/* CB838 001CB738 00000000 */   nop
/* CB83C 001CB73C 28260070 */  paddub     $4, $0, $0
/* CB840 001CB740 0D000010 */  b          .L001CB778
/* CB844 001CB744 00000000 */   nop
.L001CB748:
/* CB848 001CB748 80110400 */  sll        $2, $4, 6
/* CB84C 001CB74C 21105500 */  addu       $2, $2, $21
/* CB850 001CB750 0100013C */  lui        $at, (0x10000 >> 16)
/* CB854 001CB754 21084100 */  addu       $at, $2, $at
/* CB858 001CB758 60B620AC */  sw         $0, -0x49A0($at)
/* CB85C 001CB75C 0100013C */  lui        $at, (0x10000 >> 16)
/* CB860 001CB760 21084100 */  addu       $at, $2, $at
/* CB864 001CB764 8CB620AC */  sw         $0, -0x4974($at)
/* CB868 001CB768 0100013C */  lui        $at, (0x10000 >> 16)
/* CB86C 001CB76C 21084100 */  addu       $at, $2, $at
/* CB870 001CB770 90B620AC */  sw         $0, -0x4970($at)
/* CB874 001CB774 01008424 */  addiu      $4, $4, 0x1
.L001CB778:
/* CB878 001CB778 18008228 */  slti       $2, $4, 0x18
/* CB87C 001CB77C F2FF4014 */  bnez       $2, .L001CB748
/* CB880 001CB780 00000000 */   nop
/* CB884 001CB784 0100013C */  lui        $at, (0x10000 >> 16)
/* CB888 001CB788 2108A102 */  addu       $at, $21, $at
/* CB88C 001CB78C 60BC20AC */  sw         $0, -0x43A0($at)
/* CB890 001CB790 28260070 */  paddub     $4, $0, $0
/* CB894 001CB794 07000010 */  b          .L001CB7B4
/* CB898 001CB798 00000000 */   nop
.L001CB79C:
/* CB89C 001CB79C 40110400 */  sll        $2, $4, 5
/* CB8A0 001CB7A0 21105500 */  addu       $2, $2, $21
/* CB8A4 001CB7A4 0100013C */  lui        $at, (0x10000 >> 16)
/* CB8A8 001CB7A8 21084100 */  addu       $at, $2, $at
/* CB8AC 001CB7AC 94BC20AC */  sw         $0, -0x436C($at)
/* CB8B0 001CB7B0 01008424 */  addiu      $4, $4, 0x1
.L001CB7B4:
/* CB8B4 001CB7B4 08008228 */  slti       $2, $4, 0x8
/* CB8B8 001CB7B8 F8FF4014 */  bnez       $2, .L001CB79C
/* CB8BC 001CB7BC 00000000 */   nop
/* CB8C0 001CB7C0 0100013C */  lui        $at, (0x10000 >> 16)
/* CB8C4 001CB7C4 2108A102 */  addu       $at, $21, $at
/* CB8C8 001CB7C8 80BD20AC */  sw         $0, -0x4280($at)
/* CB8CC 001CB7CC 28260070 */  paddub     $4, $0, $0
/* CB8D0 001CB7D0 09000010 */  b          .L001CB7F8
/* CB8D4 001CB7D4 00000000 */   nop
.L001CB7D8:
/* CB8D8 001CB7D8 40100400 */  sll        $2, $4, 1
/* CB8DC 001CB7DC 21104400 */  addu       $2, $2, $4
/* CB8E0 001CB7E0 C0100200 */  sll        $2, $2, 3
/* CB8E4 001CB7E4 21105500 */  addu       $2, $2, $21
/* CB8E8 001CB7E8 0100013C */  lui        $at, (0x10000 >> 16)
/* CB8EC 001CB7EC 21084100 */  addu       $at, $2, $at
/* CB8F0 001CB7F0 9CBD20AC */  sw         $0, -0x4264($at)
/* CB8F4 001CB7F4 01008424 */  addiu      $4, $4, 0x1
.L001CB7F8:
/* CB8F8 001CB7F8 04008228 */  slti       $2, $4, 0x4
/* CB8FC 001CB7FC F6FF4014 */  bnez       $2, .L001CB7D8
/* CB900 001CB800 00000000 */   nop
/* CB904 001CB804 281E0070 */  paddub     $3, $0, $0
/* CB908 001CB808 31000010 */  b          .L001CB8D0
/* CB90C 001CB80C 00000000 */   nop
.L001CB810:
/* CB910 001CB810 28160070 */  paddub     $2, $0, $0
/* CB914 001CB814 2A000010 */  b          .L001CB8C0
/* CB918 001CB818 00000000 */   nop
.L001CB81C:
/* CB91C 001CB81C FFFF0624 */  addiu      $6, $0, -0x1
/* CB920 001CB820 80200300 */  sll        $4, $3, 2
/* CB924 001CB824 21208300 */  addu       $4, $4, $3
/* CB928 001CB828 80200400 */  sll        $4, $4, 2
/* CB92C 001CB82C 21204400 */  addu       $4, $2, $4
/* CB930 001CB830 C0280400 */  sll        $5, $4, 3
/* CB934 001CB834 2128A400 */  addu       $5, $5, $4
/* CB938 001CB838 40280500 */  sll        $5, $5, 1
/* CB93C 001CB83C 2128A400 */  addu       $5, $5, $4
/* CB940 001CB840 80380500 */  sll        $7, $5, 2
/* CB944 001CB844 D501053C */  lui        $5, %hi(buildMapDat)
/* CB948 001CB848 A06DA524 */  addiu      $5, $5, %lo(buildMapDat)
/* CB94C 001CB84C 2128A700 */  addu       $5, $5, $7
/* CB950 001CB850 0000A6AC */  sw         $6, 0x0($5)
/* CB954 001CB854 D501053C */  lui        $5, %hi(D_1D56DA4)
/* CB958 001CB858 A46DA524 */  addiu      $5, $5, %lo(D_1D56DA4)
/* CB95C 001CB85C 2128A700 */  addu       $5, $5, $7
/* CB960 001CB860 0000A0AC */  sw         $0, 0x0($5)
/* CB964 001CB864 28960070 */  paddub     $18, $0, $0
/* CB968 001CB868 08000010 */  b          .L001CB88C
/* CB96C 001CB86C 00000000 */   nop
.L001CB870:
/* CB970 001CB870 D501053C */  lui        $5, %hi(D_1D56DA8)
/* CB974 001CB874 A86DA524 */  addiu      $5, $5, %lo(D_1D56DA8)
/* CB978 001CB878 2130A700 */  addu       $6, $5, $7
/* CB97C 001CB87C 80281200 */  sll        $5, $18, 2
/* CB980 001CB880 2128A600 */  addu       $5, $5, $6
/* CB984 001CB884 0000A0AC */  sw         $0, 0x0($5)
/* CB988 001CB888 01005226 */  addiu      $18, $18, 0x1
.L001CB88C:
/* CB98C 001CB88C 1000452A */  slti       $5, $18, 0x10
/* CB990 001CB890 F7FFA014 */  bnez       $5, .L001CB870
/* CB994 001CB894 00000000 */   nop
/* CB998 001CB898 D501053C */  lui        $5, %hi(D_1D56DE8)
/* CB99C 001CB89C E86DA524 */  addiu      $5, $5, %lo(D_1D56DE8)
/* CB9A0 001CB8A0 2128A700 */  addu       $5, $5, $7
/* CB9A4 001CB8A4 0000A0AC */  sw         $0, 0x0($5)
/* CB9A8 001CB8A8 00210400 */  sll        $4, $4, 4
/* CB9AC 001CB8AC 21209500 */  addu       $4, $4, $21
/* CB9B0 001CB8B0 0100013C */  lui        $at, (0x10000 >> 16)
/* CB9B4 001CB8B4 21088100 */  addu       $at, $4, $at
/* CB9B8 001CB8B8 549C20AC */  sw         $0, -0x63AC($at)
/* CB9BC 001CB8BC 01004224 */  addiu      $2, $2, 0x1
.L001CB8C0:
/* CB9C0 001CB8C0 14004428 */  slti       $4, $2, 0x14
/* CB9C4 001CB8C4 D5FF8014 */  bnez       $4, .L001CB81C
/* CB9C8 001CB8C8 00000000 */   nop
/* CB9CC 001CB8CC 01006324 */  addiu      $3, $3, 0x1
.L001CB8D0:
/* CB9D0 001CB8D0 14006228 */  slti       $2, $3, 0x14
/* CB9D4 001CB8D4 CEFF4014 */  bnez       $2, .L001CB810
/* CB9D8 001CB8D8 00000000 */   nop
/* CB9DC 001CB8DC 049480AF */  sw         $0, -0x6BFC($gp)
/* CB9E0 001CB8E0 289E0070 */  paddub     $19, $0, $0
/* CB9E4 001CB8E4 71000010 */  b          .L001CBAAC
/* CB9E8 001CB8E8 00000000 */   nop
.L001CB8EC:
/* CB9EC 001CB8EC 28960070 */  paddub     $18, $0, $0
/* CB9F0 001CB8F0 289E0070 */  paddub     $19, $0, $0
/* CB9F4 001CB8F4 6B000010 */  b          .L001CBAA4
/* CB9F8 001CB8F8 00000000 */   nop
.L001CB8FC:
/* CB9FC 001CB8FC BE11040C */  jal        rand
/* CBA00 001CB900 00000000 */   nop
/* CBA04 001CB904 00008244 */  mtc1       $2, $f0
/* CBA08 001CB908 00000000 */  nop
/* CBA0C 001CB90C 60008046 */  cvt.s.w    $f1, $f0
/* CBA10 001CB910 0040023C */  lui        $2, (0x40000000 >> 16)
/* CBA14 001CB914 00008244 */  mtc1       $2, $f0
/* CBA18 001CB918 00000000 */  nop
/* CBA1C 001CB91C 42000146 */  mul.s      $f1, $f0, $f1
/* CBA20 001CB920 004F023C */  lui        $2, (0x4F000000 >> 16)
/* CBA24 001CB924 00008244 */  mtc1       $2, $f0
/* CBA28 001CB928 00000000 */  nop
/* CBA2C 001CB92C 030B0046 */  div.s      $f12, $f1, $f0
/* CBA30 001CB930 2C44040C */  jal        fptosi
/* CBA34 001CB934 00000000 */   nop
/* CBA38 001CB938 03005024 */  addiu      $16, $2, 0x3
/* CBA3C 001CB93C BE11040C */  jal        rand
/* CBA40 001CB940 00000000 */   nop
/* CBA44 001CB944 00008244 */  mtc1       $2, $f0
/* CBA48 001CB948 00000000 */  nop
/* CBA4C 001CB94C 60008046 */  cvt.s.w    $f1, $f0
/* CBA50 001CB950 0040023C */  lui        $2, (0x40000000 >> 16)
/* CBA54 001CB954 00008244 */  mtc1       $2, $f0
/* CBA58 001CB958 00000000 */  nop
/* CBA5C 001CB95C 42000146 */  mul.s      $f1, $f0, $f1
/* CBA60 001CB960 004F023C */  lui        $2, (0x4F000000 >> 16)
/* CBA64 001CB964 00008244 */  mtc1       $2, $f0
/* CBA68 001CB968 00000000 */  nop
/* CBA6C 001CB96C 030B0046 */  div.s      $f12, $f1, $f0
/* CBA70 001CB970 2C44040C */  jal        fptosi
/* CBA74 001CB974 00000000 */   nop
/* CBA78 001CB978 03005124 */  addiu      $17, $2, 0x3
/* CBA7C 001CB97C BE11040C */  jal        rand
/* CBA80 001CB980 00000000 */   nop
/* CBA84 001CB984 00008244 */  mtc1       $2, $f0
/* CBA88 001CB988 00000000 */  nop
/* CBA8C 001CB98C 60008046 */  cvt.s.w    $f1, $f0
/* CBA90 001CB990 10000224 */  addiu      $2, $0, 0x10
/* CBA94 001CB994 23105000 */  subu       $2, $2, $16
/* CBA98 001CB998 00008244 */  mtc1       $2, $f0
/* CBA9C 001CB99C 00000000 */  nop
/* CBAA0 001CB9A0 20008046 */  cvt.s.w    $f0, $f0
/* CBAA4 001CB9A4 42000146 */  mul.s      $f1, $f0, $f1
/* CBAA8 001CB9A8 004F023C */  lui        $2, (0x4F000000 >> 16)
/* CBAAC 001CB9AC 00008244 */  mtc1       $2, $f0
/* CBAB0 001CB9B0 00000000 */  nop
/* CBAB4 001CB9B4 030B0046 */  div.s      $f12, $f1, $f0
/* CBAB8 001CB9B8 2C44040C */  jal        fptosi
/* CBABC 001CB9BC 00000000 */   nop
/* CBAC0 001CB9C0 28B64070 */  paddub     $22, $2, $0
/* CBAC4 001CB9C4 BE11040C */  jal        rand
/* CBAC8 001CB9C8 00000000 */   nop
/* CBACC 001CB9CC 00008244 */  mtc1       $2, $f0
/* CBAD0 001CB9D0 00000000 */  nop
/* CBAD4 001CB9D4 60008046 */  cvt.s.w    $f1, $f0
/* CBAD8 001CB9D8 10000224 */  addiu      $2, $0, 0x10
/* CBADC 001CB9DC 23105100 */  subu       $2, $2, $17
/* CBAE0 001CB9E0 00008244 */  mtc1       $2, $f0
/* CBAE4 001CB9E4 00000000 */  nop
/* CBAE8 001CB9E8 20008046 */  cvt.s.w    $f0, $f0
/* CBAEC 001CB9EC 42000146 */  mul.s      $f1, $f0, $f1
/* CBAF0 001CB9F0 004F023C */  lui        $2, (0x4F000000 >> 16)
/* CBAF4 001CB9F4 00008244 */  mtc1       $2, $f0
/* CBAF8 001CB9F8 00000000 */  nop
/* CBAFC 001CB9FC 030B0046 */  div.s      $f12, $f1, $f0
/* CBB00 001CBA00 2C44040C */  jal        fptosi
/* CBB04 001CBA04 00000000 */   nop
/* CBB08 001CBA08 282E4070 */  paddub     $5, $2, $0
/* CBB0C 001CBA0C 2826C072 */  paddub     $4, $22, $0
/* CBB10 001CBA10 28360072 */  paddub     $6, $16, $0
/* CBB14 001CBA14 283E2072 */  paddub     $7, $17, $0
/* CBB18 001CBA18 0494888F */  lw         $8, -0x6BFC($gp)
/* CBB1C 001CBA1C F014070C */  jal        buildRoom__Fiiiii
/* CBB20 001CBA20 00000000 */   nop
/* CBB24 001CBA24 01000324 */  addiu      $3, $0, 0x1
/* CBB28 001CBA28 19004314 */  bne        $2, $3, .L001CBA90
/* CBB2C 001CBA2C 00000000 */   nop
/* CBB30 001CBA30 0494828F */  lw         $2, -0x6BFC($gp)
/* CBB34 001CBA34 00210200 */  sll        $4, $2, 4
/* CBB38 001CBA38 D601023C */  lui        $2, %hi(roomStack)
/* CBB3C 001CBA3C 205B4224 */  addiu      $2, $2, %lo(roomStack)
/* CBB40 001CBA40 21104400 */  addu       $2, $2, $4
/* CBB44 001CBA44 000056AC */  sw         $22, 0x0($2)
/* CBB48 001CBA48 D601023C */  lui        $2, %hi(D_1D65B24)
/* CBB4C 001CBA4C 245B4224 */  addiu      $2, $2, %lo(D_1D65B24)
/* CBB50 001CBA50 21104400 */  addu       $2, $2, $4
/* CBB54 001CBA54 000045AC */  sw         $5, 0x0($2)
/* CBB58 001CBA58 D601023C */  lui        $2, %hi(D_1D65B28)
/* CBB5C 001CBA5C 285B4224 */  addiu      $2, $2, %lo(D_1D65B28)
/* CBB60 001CBA60 21104400 */  addu       $2, $2, $4
/* CBB64 001CBA64 000050AC */  sw         $16, 0x0($2)
/* CBB68 001CBA68 D601023C */  lui        $2, %hi(D_1D65B2C)
/* CBB6C 001CBA6C 2C5B4224 */  addiu      $2, $2, %lo(D_1D65B2C)
/* CBB70 001CBA70 21104400 */  addu       $2, $2, $4
/* CBB74 001CBA74 000051AC */  sw         $17, 0x0($2)
/* CBB78 001CBA78 0494828F */  lw         $2, -0x6BFC($gp)
/* CBB7C 001CBA7C 01004224 */  addiu      $2, $2, 0x1
/* CBB80 001CBA80 049482AF */  sw         $2, -0x6BFC($gp)
/* CBB84 001CBA84 28966070 */  paddub     $18, $3, $0
/* CBB88 001CBA88 06000010 */  b          .L001CBAA4
/* CBB8C 001CBA8C 00000000 */   nop
.L001CBA90:
/* CBB90 001CBA90 01007326 */  addiu      $19, $19, 0x1
/* CBB94 001CBA94 4000622A */  slti       $2, $19, 0x40
/* CBB98 001CBA98 02004014 */  bnez       $2, .L001CBAA4
/* CBB9C 001CBA9C 00000000 */   nop
/* CBBA0 001CBAA0 28966070 */  paddub     $18, $3, $0
.L001CBAA4:
/* CBBA4 001CBAA4 95FF4012 */  beqz       $18, .L001CB8FC
/* CBBA8 001CBAA8 00000000 */   nop
.L001CBAAC:
/* CBBAC 001CBAAC 0494828F */  lw         $2, -0x6BFC($gp)
/* CBBB0 001CBAB0 02004128 */  slti       $at, $2, 0x2
/* CBBB4 001CBAB4 04002010 */  beqz       $at, .L001CBAC8
/* CBBB8 001CBAB8 00000000 */   nop
/* CBBBC 001CBABC 4000622A */  slti       $2, $19, 0x40
/* CBBC0 001CBAC0 8AFF4014 */  bnez       $2, .L001CB8EC
/* CBBC4 001CBAC4 00000000 */   nop
.L001CBAC8:
/* CBBC8 001CBAC8 28260070 */  paddub     $4, $0, $0
/* CBBCC 001CBACC 01000524 */  addiu      $5, $0, 0x1
/* CBBD0 001CBAD0 7018070C */  jal        joinRoom__Fii
/* CBBD4 001CBAD4 00000000 */   nop
/* CBBD8 001CBAD8 BB000010 */  b          .L001CBDC8
/* CBBDC 001CBADC 00000000 */   nop
.L001CBAE0:
/* CBBE0 001CBAE0 28960070 */  paddub     $18, $0, $0
/* CBBE4 001CBAE4 289E0070 */  paddub     $19, $0, $0
/* CBBE8 001CBAE8 B5000010 */  b          .L001CBDC0
/* CBBEC 001CBAEC 00000000 */   nop
.L001CBAF0:
/* CBBF0 001CBAF0 BE11040C */  jal        rand
/* CBBF4 001CBAF4 00000000 */   nop
/* CBBF8 001CBAF8 00008244 */  mtc1       $2, $f0
/* CBBFC 001CBAFC 00000000 */  nop
/* CBC00 001CBB00 60008046 */  cvt.s.w    $f1, $f0
/* CBC04 001CBB04 0040023C */  lui        $2, (0x40000000 >> 16)
/* CBC08 001CBB08 00008244 */  mtc1       $2, $f0
/* CBC0C 001CBB0C 00000000 */  nop
/* CBC10 001CBB10 42000146 */  mul.s      $f1, $f0, $f1
/* CBC14 001CBB14 004F023C */  lui        $2, (0x4F000000 >> 16)
/* CBC18 001CBB18 00008244 */  mtc1       $2, $f0
/* CBC1C 001CBB1C 00000000 */  nop
/* CBC20 001CBB20 030B0046 */  div.s      $f12, $f1, $f0
/* CBC24 001CBB24 2C44040C */  jal        fptosi
/* CBC28 001CBB28 00000000 */   nop
/* CBC2C 001CBB2C 03005024 */  addiu      $16, $2, 0x3
/* CBC30 001CBB30 BE11040C */  jal        rand
/* CBC34 001CBB34 00000000 */   nop
/* CBC38 001CBB38 00008244 */  mtc1       $2, $f0
/* CBC3C 001CBB3C 00000000 */  nop
/* CBC40 001CBB40 60008046 */  cvt.s.w    $f1, $f0
/* CBC44 001CBB44 0040023C */  lui        $2, (0x40000000 >> 16)
/* CBC48 001CBB48 00008244 */  mtc1       $2, $f0
/* CBC4C 001CBB4C 00000000 */  nop
/* CBC50 001CBB50 42000146 */  mul.s      $f1, $f0, $f1
/* CBC54 001CBB54 004F023C */  lui        $2, (0x4F000000 >> 16)
/* CBC58 001CBB58 00008244 */  mtc1       $2, $f0
/* CBC5C 001CBB5C 00000000 */  nop
/* CBC60 001CBB60 030B0046 */  div.s      $f12, $f1, $f0
/* CBC64 001CBB64 2C44040C */  jal        fptosi
/* CBC68 001CBB68 00000000 */   nop
/* CBC6C 001CBB6C 03005124 */  addiu      $17, $2, 0x3
/* CBC70 001CBB70 BE11040C */  jal        rand
/* CBC74 001CBB74 00000000 */   nop
/* CBC78 001CBB78 00008244 */  mtc1       $2, $f0
/* CBC7C 001CBB7C 00000000 */  nop
/* CBC80 001CBB80 60008046 */  cvt.s.w    $f1, $f0
/* CBC84 001CBB84 10000224 */  addiu      $2, $0, 0x10
/* CBC88 001CBB88 23105000 */  subu       $2, $2, $16
/* CBC8C 001CBB8C 00008244 */  mtc1       $2, $f0
/* CBC90 001CBB90 00000000 */  nop
/* CBC94 001CBB94 20008046 */  cvt.s.w    $f0, $f0
/* CBC98 001CBB98 42000146 */  mul.s      $f1, $f0, $f1
/* CBC9C 001CBB9C 004F023C */  lui        $2, (0x4F000000 >> 16)
/* CBCA0 001CBBA0 00008244 */  mtc1       $2, $f0
/* CBCA4 001CBBA4 00000000 */  nop
/* CBCA8 001CBBA8 030B0046 */  div.s      $f12, $f1, $f0
/* CBCAC 001CBBAC 2C44040C */  jal        fptosi
/* CBCB0 001CBBB0 00000000 */   nop
/* CBCB4 001CBBB4 28B64070 */  paddub     $22, $2, $0
/* CBCB8 001CBBB8 BE11040C */  jal        rand
/* CBCBC 001CBBBC 00000000 */   nop
/* CBCC0 001CBBC0 00008244 */  mtc1       $2, $f0
/* CBCC4 001CBBC4 00000000 */  nop
/* CBCC8 001CBBC8 60008046 */  cvt.s.w    $f1, $f0
/* CBCCC 001CBBCC 10000224 */  addiu      $2, $0, 0x10
/* CBCD0 001CBBD0 23105100 */  subu       $2, $2, $17
/* CBCD4 001CBBD4 00008244 */  mtc1       $2, $f0
/* CBCD8 001CBBD8 00000000 */  nop
/* CBCDC 001CBBDC 20008046 */  cvt.s.w    $f0, $f0
/* CBCE0 001CBBE0 42000146 */  mul.s      $f1, $f0, $f1
/* CBCE4 001CBBE4 004F023C */  lui        $2, (0x4F000000 >> 16)
/* CBCE8 001CBBE8 00008244 */  mtc1       $2, $f0
/* CBCEC 001CBBEC 00000000 */  nop
/* CBCF0 001CBBF0 030B0046 */  div.s      $f12, $f1, $f0
/* CBCF4 001CBBF4 2C44040C */  jal        fptosi
/* CBCF8 001CBBF8 00000000 */   nop
/* CBCFC 001CBBFC 282E4070 */  paddub     $5, $2, $0
/* CBD00 001CBC00 2826C072 */  paddub     $4, $22, $0
/* CBD04 001CBC04 28360072 */  paddub     $6, $16, $0
/* CBD08 001CBC08 283E2072 */  paddub     $7, $17, $0
/* CBD0C 001CBC0C 0494888F */  lw         $8, -0x6BFC($gp)
/* CBD10 001CBC10 F014070C */  jal        buildRoom__Fiiiii
/* CBD14 001CBC14 00000000 */   nop
/* CBD18 001CBC18 01000324 */  addiu      $3, $0, 0x1
/* CBD1C 001CBC1C 63004314 */  bne        $2, $3, .L001CBDAC
/* CBD20 001CBC20 00000000 */   nop
/* CBD24 001CBC24 0494828F */  lw         $2, -0x6BFC($gp)
/* CBD28 001CBC28 00190200 */  sll        $3, $2, 4
/* CBD2C 001CBC2C D601023C */  lui        $2, %hi(roomStack)
/* CBD30 001CBC30 205B4224 */  addiu      $2, $2, %lo(roomStack)
/* CBD34 001CBC34 21104300 */  addu       $2, $2, $3
/* CBD38 001CBC38 000056AC */  sw         $22, 0x0($2)
/* CBD3C 001CBC3C D601023C */  lui        $2, %hi(D_1D65B24)
/* CBD40 001CBC40 245B4224 */  addiu      $2, $2, %lo(D_1D65B24)
/* CBD44 001CBC44 21104300 */  addu       $2, $2, $3
/* CBD48 001CBC48 000045AC */  sw         $5, 0x0($2)
/* CBD4C 001CBC4C D601023C */  lui        $2, %hi(D_1D65B28)
/* CBD50 001CBC50 285B4224 */  addiu      $2, $2, %lo(D_1D65B28)
/* CBD54 001CBC54 21104300 */  addu       $2, $2, $3
/* CBD58 001CBC58 000050AC */  sw         $16, 0x0($2)
/* CBD5C 001CBC5C D601023C */  lui        $2, %hi(D_1D65B2C)
/* CBD60 001CBC60 2C5B4224 */  addiu      $2, $2, %lo(D_1D65B2C)
/* CBD64 001CBC64 21104300 */  addu       $2, $2, $3
/* CBD68 001CBC68 000051AC */  sw         $17, 0x0($2)
/* CBD6C 001CBC6C 0494828F */  lw         $2, -0x6BFC($gp)
/* CBD70 001CBC70 01004224 */  addiu      $2, $2, 0x1
/* CBD74 001CBC74 049482AF */  sw         $2, -0x6BFC($gp)
/* CBD78 001CBC78 FFFF1724 */  addiu      $23, $0, -0x1
/* CBD7C 001CBC7C 10271624 */  addiu      $22, $0, 0x2710
/* CBD80 001CBC80 28960070 */  paddub     $18, $0, $0
/* CBD84 001CBC84 3E000010 */  b          .L001CBD80
/* CBD88 001CBC88 00000000 */   nop
.L001CBC8C:
/* CBD8C 001CBC8C 00190300 */  sll        $3, $3, 4
/* CBD90 001CBC90 D601023C */  lui        $2, %hi(D_1D65B18)
/* CBD94 001CBC94 185B4224 */  addiu      $2, $2, %lo(D_1D65B18)
/* CBD98 001CBC98 21104300 */  addu       $2, $2, $3
/* CBD9C 001CBC9C 0000428C */  lw         $2, 0x0($2)
/* CBDA0 001CBCA0 43200200 */  sra        $4, $2, 1
/* CBDA4 001CBCA4 D601023C */  lui        $2, %hi(D_1D65B10)
/* CBDA8 001CBCA8 105B4224 */  addiu      $2, $2, %lo(D_1D65B10)
/* CBDAC 001CBCAC 21104300 */  addu       $2, $2, $3
/* CBDB0 001CBCB0 0000428C */  lw         $2, 0x0($2)
/* CBDB4 001CBCB4 21384400 */  addu       $7, $2, $4
/* CBDB8 001CBCB8 00111200 */  sll        $2, $18, 4
/* CBDBC 001CBCBC D601043C */  lui        $4, %hi(D_1D65B28)
/* CBDC0 001CBCC0 285B8424 */  addiu      $4, $4, %lo(D_1D65B28)
/* CBDC4 001CBCC4 21208200 */  addu       $4, $4, $2
/* CBDC8 001CBCC8 0000848C */  lw         $4, 0x0($4)
/* CBDCC 001CBCCC 43300400 */  sra        $6, $4, 1
/* CBDD0 001CBCD0 D601043C */  lui        $4, %hi(roomStack)
/* CBDD4 001CBCD4 205B8424 */  addiu      $4, $4, %lo(roomStack)
/* CBDD8 001CBCD8 21208200 */  addu       $4, $4, $2
/* CBDDC 001CBCDC 0000848C */  lw         $4, 0x0($4)
/* CBDE0 001CBCE0 21208600 */  addu       $4, $4, $6
/* CBDE4 001CBCE4 2380E400 */  subu       $16, $7, $4
/* CBDE8 001CBCE8 D601043C */  lui        $4, %hi(D_1D65B1C)
/* CBDEC 001CBCEC 1C5B8424 */  addiu      $4, $4, %lo(D_1D65B1C)
/* CBDF0 001CBCF0 21208300 */  addu       $4, $4, $3
/* CBDF4 001CBCF4 0000848C */  lw         $4, 0x0($4)
/* CBDF8 001CBCF8 43300400 */  sra        $6, $4, 1
/* CBDFC 001CBCFC D601043C */  lui        $4, %hi(D_1D65B14)
/* CBE00 001CBD00 145B8424 */  addiu      $4, $4, %lo(D_1D65B14)
/* CBE04 001CBD04 21188300 */  addu       $3, $4, $3
/* CBE08 001CBD08 0000638C */  lw         $3, 0x0($3)
/* CBE0C 001CBD0C 21306600 */  addu       $6, $3, $6
/* CBE10 001CBD10 D601033C */  lui        $3, %hi(D_1D65B2C)
/* CBE14 001CBD14 2C5B6324 */  addiu      $3, $3, %lo(D_1D65B2C)
/* CBE18 001CBD18 21186200 */  addu       $3, $3, $2
/* CBE1C 001CBD1C 0000638C */  lw         $3, 0x0($3)
/* CBE20 001CBD20 43200300 */  sra        $4, $3, 1
/* CBE24 001CBD24 D601033C */  lui        $3, %hi(D_1D65B24)
/* CBE28 001CBD28 245B6324 */  addiu      $3, $3, %lo(D_1D65B24)
/* CBE2C 001CBD2C 21106200 */  addu       $2, $3, $2
/* CBE30 001CBD30 0000428C */  lw         $2, 0x0($2)
/* CBE34 001CBD34 21104400 */  addu       $2, $2, $4
/* CBE38 001CBD38 2388C200 */  subu       $17, $6, $2
/* CBE3C 001CBD3C 18181002 */  mult       $3, $16, $16
/* CBE40 001CBD40 18103172 */  mult1      $2, $17, $17
/* CBE44 001CBD44 21206200 */  addu       $4, $3, $2
/* CBE48 001CBD48 FC40040C */  jal        litodp
/* CBE4C 001CBD4C 00000000 */   nop
/* CBE50 001CBD50 28264070 */  paddub     $4, $2, $0
/* CBE54 001CBD54 CC76040C */  jal        sqrt
/* CBE58 001CBD58 00000000 */   nop
/* CBE5C 001CBD5C 28264070 */  paddub     $4, $2, $0
/* CBE60 001CBD60 2A41040C */  jal        dptoli
/* CBE64 001CBD64 00000000 */   nop
/* CBE68 001CBD68 2A085600 */  slt        $at, $2, $22
/* CBE6C 001CBD6C 03002010 */  beqz       $at, .L001CBD7C
/* CBE70 001CBD70 00000000 */   nop
/* CBE74 001CBD74 28BE4072 */  paddub     $23, $18, $0
/* CBE78 001CBD78 28B64070 */  paddub     $22, $2, $0
.L001CBD7C:
/* CBE7C 001CBD7C 01005226 */  addiu      $18, $18, 0x1
.L001CBD80:
/* CBE80 001CBD80 0494838F */  lw         $3, -0x6BFC($gp)
/* CBE84 001CBD84 FFFF6424 */  addiu      $4, $3, -0x1
/* CBE88 001CBD88 2A104402 */  slt        $2, $18, $4
/* CBE8C 001CBD8C BFFF4014 */  bnez       $2, .L001CBC8C
/* CBE90 001CBD90 00000000 */   nop
/* CBE94 001CBD94 282EE072 */  paddub     $5, $23, $0
/* CBE98 001CBD98 7018070C */  jal        joinRoom__Fii
/* CBE9C 001CBD9C 00000000 */   nop
/* CBEA0 001CBDA0 01001224 */  addiu      $18, $0, 0x1
/* CBEA4 001CBDA4 06000010 */  b          .L001CBDC0
/* CBEA8 001CBDA8 00000000 */   nop
.L001CBDAC:
/* CBEAC 001CBDAC 01007326 */  addiu      $19, $19, 0x1
/* CBEB0 001CBDB0 0002622A */  slti       $2, $19, 0x200
/* CBEB4 001CBDB4 02004014 */  bnez       $2, .L001CBDC0
/* CBEB8 001CBDB8 00000000 */   nop
/* CBEBC 001CBDBC 28966070 */  paddub     $18, $3, $0
.L001CBDC0:
/* CBEC0 001CBDC0 4BFF4012 */  beqz       $18, .L001CBAF0
/* CBEC4 001CBDC4 00000000 */   nop
.L001CBDC8:
/* CBEC8 001CBDC8 0494838F */  lw         $3, -0x6BFC($gp)
/* CBECC 001CBDCC FFFFC227 */  addiu      $2, $fp, -0x1
/* CBED0 001CBDD0 2A084300 */  slt        $at, $2, $3
/* CBED4 001CBDD4 04002014 */  bnez       $at, .L001CBDE8
/* CBED8 001CBDD8 00000000 */   nop
/* CBEDC 001CBDDC 0002622A */  slti       $2, $19, 0x200
/* CBEE0 001CBDE0 3FFF4014 */  bnez       $2, .L001CBAE0
/* CBEE4 001CBDE4 00000000 */   nop
.L001CBDE8:
/* CBEE8 001CBDE8 901A070C */  jal        setRoomObject__Fv
/* CBEEC 001CBDEC 00000000 */   nop
/* CBEF0 001CBDF0 03008012 */  beqz       $20, .L001CBE00
/* CBEF4 001CBDF4 00000000 */   nop
/* CBEF8 001CBDF8 5C1B070C */  jal        setRoomDivid__Fv
/* CBEFC 001CBDFC 00000000 */   nop
.L001CBE00:
/* CBF00 001CBE00 05008012 */  beqz       $20, .L001CBE18
/* CBF04 001CBE04 00000000 */   nop
/* CBF08 001CBE08 A81C070C */  jal        setUnderDungeonStart__Fv
/* CBF0C 001CBE0C 00000000 */   nop
/* CBF10 001CBE10 03000010 */  b          .L001CBE20
/* CBF14 001CBE14 00000000 */   nop
.L001CBE18:
/* CBF18 001CBE18 A81C070C */  jal        setUnderDungeonStart__Fv
/* CBF1C 001CBE1C 00000000 */   nop
.L001CBE20:
/* CBF20 001CBE20 03008012 */  beqz       $20, .L001CBE30
/* CBF24 001CBE24 00000000 */   nop
/* CBF28 001CBE28 4C1D070C */  jal        setStair__Fv
/* CBF2C 001CBE2C 00000000 */   nop
.L001CBE30:
/* CBF30 001CBE30 5415070C */  jal        mapPartsFilter__Fv
/* CBF34 001CBE34 00000000 */   nop
/* CBF38 001CBE38 0494828F */  lw         $2, -0x6BFC($gp)
/* CBF3C 001CBE3C 0100013C */  lui        $at, (0x10000 >> 16)
/* CBF40 001CBE40 2108A102 */  addu       $at, $21, $at
/* CBF44 001CBE44 50B622AC */  sw         $2, -0x49B0($at)
/* CBF48 001CBE48 5835A426 */  addiu      $4, $21, 0x3558
/* CBF4C 001CBE4C F87F8424 */  addiu      $4, $4, 0x7FF8
/* CBF50 001CBE50 D601023C */  lui        $2, %hi(roomStack)
/* CBF54 001CBE54 205B4524 */  addiu      $5, $2, %lo(roomStack)
/* CBF58 001CBE58 00010624 */  addiu      $6, $0, 0x100
/* CBF5C 001CBE5C EC0C040C */  jal        memcpy
/* CBF60 001CBE60 00000000 */   nop
/* CBF64 001CBE64 281E0070 */  paddub     $3, $0, $0
/* CBF68 001CBE68 22000010 */  b          .L001CBEF4
/* CBF6C 001CBE6C 00000000 */   nop
.L001CBE70:
/* CBF70 001CBE70 28160070 */  paddub     $2, $0, $0
/* CBF74 001CBE74 1B000010 */  b          .L001CBEE4
/* CBF78 001CBE78 00000000 */   nop
.L001CBE7C:
/* CBF7C 001CBE7C 80200300 */  sll        $4, $3, 2
/* CBF80 001CBE80 21208300 */  addu       $4, $4, $3
/* CBF84 001CBE84 80200400 */  sll        $4, $4, 2
/* CBF88 001CBE88 21284400 */  addu       $5, $2, $4
/* CBF8C 001CBE8C C0200500 */  sll        $4, $5, 3
/* CBF90 001CBE90 21208500 */  addu       $4, $4, $5
/* CBF94 001CBE94 40200400 */  sll        $4, $4, 1
/* CBF98 001CBE98 21208500 */  addu       $4, $4, $5
/* CBF9C 001CBE9C 80300400 */  sll        $6, $4, 2
/* CBFA0 001CBEA0 D501043C */  lui        $4, %hi(buildMapDat)
/* CBFA4 001CBEA4 A06D8424 */  addiu      $4, $4, %lo(buildMapDat)
/* CBFA8 001CBEA8 21208600 */  addu       $4, $4, $6
/* CBFAC 001CBEAC 0000848C */  lw         $4, 0x0($4)
/* CBFB0 001CBEB0 00290500 */  sll        $5, $5, 4
/* CBFB4 001CBEB4 2128B500 */  addu       $5, $5, $21
/* CBFB8 001CBEB8 0100013C */  lui        $at, (0x10000 >> 16)
/* CBFBC 001CBEBC 2108A100 */  addu       $at, $5, $at
/* CBFC0 001CBEC0 509C24AC */  sw         $4, -0x63B0($at)
/* CBFC4 001CBEC4 D501043C */  lui        $4, %hi(D_1D56DA4)
/* CBFC8 001CBEC8 A46D8424 */  addiu      $4, $4, %lo(D_1D56DA4)
/* CBFCC 001CBECC 21208600 */  addu       $4, $4, $6
/* CBFD0 001CBED0 0000848C */  lw         $4, 0x0($4)
/* CBFD4 001CBED4 0100013C */  lui        $at, (0x10000 >> 16)
/* CBFD8 001CBED8 2108A100 */  addu       $at, $5, $at
/* CBFDC 001CBEDC 549C24AC */  sw         $4, -0x63AC($at)
/* CBFE0 001CBEE0 01004224 */  addiu      $2, $2, 0x1
.L001CBEE4:
/* CBFE4 001CBEE4 14004428 */  slti       $4, $2, 0x14
/* CBFE8 001CBEE8 E4FF8014 */  bnez       $4, .L001CBE7C
/* CBFEC 001CBEEC 00000000 */   nop
/* CBFF0 001CBEF0 01006324 */  addiu      $3, $3, 0x1
.L001CBEF4:
/* CBFF4 001CBEF4 14006228 */  slti       $2, $3, 0x14
/* CBFF8 001CBEF8 DDFF4014 */  bnez       $2, .L001CBE70
/* CBFFC 001CBEFC 00000000 */   nop
/* CC000 001CBF00 A49D838F */  lw         $3, -0x625C($gp)
/* CC004 001CBF04 04000224 */  addiu      $2, $0, 0x4
/* CC008 001CBF08 04006214 */  bne        $3, $2, .L001CBF1C
/* CC00C 001CBF0C 00000000 */   nop
/* CC010 001CBF10 2826A072 */  paddub     $4, $21, $0
/* CC014 001CBF14 0824070C */  jal        buildDummyModel__11CDungeonMapFv
/* CC018 001CBF18 00000000 */   nop
.L001CBF1C:
/* CC01C 001CBF1C BE11040C */  jal        rand
/* CC020 001CBF20 00000000 */   nop
/* CC024 001CBF24 00008244 */  mtc1       $2, $f0
/* CC028 001CBF28 00000000 */  nop
/* CC02C 001CBF2C 60008046 */  cvt.s.w    $f1, $f0
/* CC030 001CBF30 C842023C */  lui        $2, (0x42C80000 >> 16)
/* CC034 001CBF34 00008244 */  mtc1       $2, $f0
/* CC038 001CBF38 00000000 */  nop
/* CC03C 001CBF3C 42000146 */  mul.s      $f1, $f0, $f1
/* CC040 001CBF40 004F023C */  lui        $2, (0x4F000000 >> 16)
/* CC044 001CBF44 00008244 */  mtc1       $2, $f0
/* CC048 001CBF48 00000000 */  nop
/* CC04C 001CBF4C 030B0046 */  div.s      $f12, $f1, $f0
/* CC050 001CBF50 2C44040C */  jal        fptosi
/* CC054 001CBF54 00000000 */   nop
/* CC058 001CBF58 33004128 */  slti       $at, $2, 0x33
/* CC05C 001CBF5C 06002010 */  beqz       $at, .L001CBF78
/* CC060 001CBF60 00000000 */   nop
/* CC064 001CBF64 04008012 */  beqz       $20, .L001CBF78
/* CC068 001CBF68 00000000 */   nop
/* CC06C 001CBF6C 2826A072 */  paddub     $4, $21, $0
/* CC070 001CBF70 7425070C */  jal        GetRoomLinkInfo__11CDungeonMapFv
/* CC074 001CBF74 00000000 */   nop
.L001CBF78:
/* CC078 001CBF78 04008012 */  beqz       $20, .L001CBF8C
/* CC07C 001CBF7C 00000000 */   nop
/* CC080 001CBF80 2826A072 */  paddub     $4, $21, $0
/* CC084 001CBF84 2029070C */  jal        BuildCharaSpecialParts__11CDungeonMapFv
/* CC088 001CBF88 00000000 */   nop
.L001CBF8C:
/* CC08C 001CBF8C A49D848F */  lw         $4, -0x625C($gp)
/* CC090 001CBF90 0700812C */  sltiu      $at, $4, 0x7
/* CC094 001CBF94 1E002010 */  beqz       $at, .L001CC010
/* CC098 001CBF98 00000000 */   nop
/* CC09C 001CBF9C 2A00023C */  lui        $2, %hi(_3191)
/* CC0A0 001CBFA0 70BF4324 */  addiu      $3, $2, %lo(_3191)
/* CC0A4 001CBFA4 80100400 */  sll        $2, $4, 2
/* CC0A8 001CBFA8 21104300 */  addu       $2, $2, $3
/* CC0AC 001CBFAC 0000428C */  lw         $2, 0x0($2)
/* CC0B0 001CBFB0 08004000 */  jr         $2
/* CC0B4 001CBFB4 00000000 */   nop
/* CC0B8 001CBFB8 C3000224 */  addiu      $2, $0, 0xC3
/* CC0BC 001CBFBC 6404A2AE */  sw         $2, 0x464($21)
/* CC0C0 001CBFC0 13000010 */  b          .L001CC010
/* CC0C4 001CBFC4 00000000 */   nop
/* CC0C8 001CBFC8 C9000224 */  addiu      $2, $0, 0xC9
/* CC0CC 001CBFCC 6404A2AE */  sw         $2, 0x464($21)
/* CC0D0 001CBFD0 0F000010 */  b          .L001CC010
/* CC0D4 001CBFD4 00000000 */   nop
/* CC0D8 001CBFD8 CA000224 */  addiu      $2, $0, 0xCA
/* CC0DC 001CBFDC 6404A2AE */  sw         $2, 0x464($21)
/* CC0E0 001CBFE0 0B000010 */  b          .L001CC010
/* CC0E4 001CBFE4 00000000 */   nop
/* CC0E8 001CBFE8 CB000224 */  addiu      $2, $0, 0xCB
/* CC0EC 001CBFEC 6404A2AE */  sw         $2, 0x464($21)
/* CC0F0 001CBFF0 07000010 */  b          .L001CC010
/* CC0F4 001CBFF4 00000000 */   nop
/* CC0F8 001CBFF8 CC000224 */  addiu      $2, $0, 0xCC
/* CC0FC 001CBFFC 6404A2AE */  sw         $2, 0x464($21)
/* CC100 001CC000 03000010 */  b          .L001CC010
/* CC104 001CC004 00000000 */   nop
/* CC108 001CC008 CE000224 */  addiu      $2, $0, 0xCE
/* CC10C 001CC00C 6404A2AE */  sw         $2, 0x464($21)
.L001CC010:
/* CC110 001CC010 A49D838F */  lw         $3, -0x625C($gp)
/* CC114 001CC014 01000224 */  addiu      $2, $0, 0x1
/* CC118 001CC018 21006214 */  bne        $3, $2, .L001CC0A0
/* CC11C 001CC01C 00000000 */   nop
/* CC120 001CC020 BE11040C */  jal        rand
/* CC124 001CC024 00000000 */   nop
/* CC128 001CC028 00008244 */  mtc1       $2, $f0
/* CC12C 001CC02C 00000000 */  nop
/* CC130 001CC030 60008046 */  cvt.s.w    $f1, $f0
/* CC134 001CC034 4040023C */  lui        $2, (0x40400000 >> 16)
/* CC138 001CC038 00008244 */  mtc1       $2, $f0
/* CC13C 001CC03C 00000000 */  nop
/* CC140 001CC040 42000146 */  mul.s      $f1, $f0, $f1
/* CC144 001CC044 004F023C */  lui        $2, (0x4F000000 >> 16)
/* CC148 001CC048 00008244 */  mtc1       $2, $f0
/* CC14C 001CC04C 00000000 */  nop
/* CC150 001CC050 030B0046 */  div.s      $f12, $f1, $f0
/* CC154 001CC054 2C44040C */  jal        fptosi
/* CC158 001CC058 00000000 */   nop
/* CC15C 001CC05C 2800033C */  lui        $3, %hi(_3162)
/* CC160 001CC060 90A06524 */  addiu      $5, $3, %lo(_3162)
/* CC164 001CC064 A000A427 */  addiu      $4, $sp, 0xA0
/* CC168 001CC068 0000A3DC */  ld         $3, 0x0($5)
/* CC16C 001CC06C 0800A0C4 */  lwc1       $f0, 0x8($5)
/* CC170 001CC070 000083FC */  sd         $3, 0x0($4)
/* CC174 001CC074 080080E4 */  swc1       $f0, 0x8($4)
/* CC178 001CC078 04004004 */  bltz       $2, .L001CC08C
/* CC17C 001CC07C 00000000 */   nop
/* CC180 001CC080 03004128 */  slti       $at, $2, 0x3
/* CC184 001CC084 02002014 */  bnez       $at, .L001CC090
/* CC188 001CC088 00000000 */   nop
.L001CC08C:
/* CC18C 001CC08C 28160070 */  paddub     $2, $0, $0
.L001CC090:
/* CC190 001CC090 80100200 */  sll        $2, $2, 2
/* CC194 001CC094 21105D00 */  addu       $2, $2, $sp
/* CC198 001CC098 A000428C */  lw         $2, 0xA0($2)
/* CC19C 001CC09C 6404A2AE */  sw         $2, 0x464($21)
.L001CC0A0:
/* CC1A0 001CC0A0 2826A072 */  paddub     $4, $21, $0
/* CC1A4 001CC0A4 9028070C */  jal        SetUnderLoad__11CDungeonMapFv
/* CC1A8 001CC0A8 00000000 */   nop
/* CC1AC 001CC0AC 2A00023C */  lui        $2, %hi(_3190)
/* CC1B0 001CC0B0 50BF4424 */  addiu      $4, $2, %lo(_3190)
/* CC1B4 001CC0B4 A611040C */  jal        printf
/* CC1B8 001CC0B8 00000000 */   nop
/* CC1BC 001CC0BC 9000BF7B */  lq         $31, 0x90($sp)
/* CC1C0 001CC0C0 8000BE7B */  lq         $fp, 0x80($sp)
/* CC1C4 001CC0C4 7000B77B */  lq         $23, 0x70($sp)
/* CC1C8 001CC0C8 6000B67B */  lq         $22, 0x60($sp)
/* CC1CC 001CC0CC 5000B57B */  lq         $21, 0x50($sp)
/* CC1D0 001CC0D0 4000B47B */  lq         $20, 0x40($sp)
/* CC1D4 001CC0D4 3000B37B */  lq         $19, 0x30($sp)
/* CC1D8 001CC0D8 2000B27B */  lq         $18, 0x20($sp)
/* CC1DC 001CC0DC 1000B17B */  lq         $17, 0x10($sp)
/* CC1E0 001CC0E0 0000B07B */  lq         $16, 0x0($sp)
/* CC1E4 001CC0E4 B000BD27 */  addiu      $sp, $sp, 0xB0
/* CC1E8 001CC0E8 0800E003 */  jr         $31
/* CC1EC 001CC0EC 00000000 */   nop
