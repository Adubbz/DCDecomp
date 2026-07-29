.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel IncludeBuyItem2__Fv
/* 0EB700 001EB600 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0EB704 001EB604 2000BF7F */  sq          $31, 0x20($29)
/* 0EB708 001EB608 1000B17F */  sq          $17, 0x10($29)
/* 0EB70C 001EB60C 0000B07F */  sq          $16, 0x0($29)
/* 0EB710 001EB610 E8AC070C */  jal         BuyMoneyCheck2__Fv
/* 0EB714 001EB614 00000000 */   nop
/* 0EB718 001EB618 28664070 */  paddub      $12, $2, $0
/* 0EB71C 001EB61C 50AD070C */  jal         SellMoneyCheck2__Fv
/* 0EB720 001EB620 00000000 */   nop
/* 0EB724 001EB624 23804C00 */  subu        $16, $2, $12
/* 0EB728 001EB628 288E0070 */  paddub      $17, $0, $0
/* 0EB72C 001EB62C 13000010 */  b           .L001EB67C
/* 0EB730 001EB630 00000000 */   nop
.L001EB634:
/* 0EB734 001EB634 80181100 */  sll         $3, $17, 2
/* 0EB738 001EB638 9094828F */  lw          $2, -0x6B70($28)
/* 0EB73C 001EB63C 21204300 */  addu        $4, $2, $3
/* 0EB740 001EB640 0000838C */  lw          $3, 0x0($4)
/* 0EB744 001EB644 02000224 */  addiu       $2, $0, 0x2
/* 0EB748 001EB648 0B006214 */  bne         $3, $2, .L001EB678
/* 0EB74C 001EB64C 00000000 */   nop
/* 0EB750 001EB650 000080AC */  sw          $0, 0x0($4)
/* 0EB754 001EB654 80111100 */  sll         $2, $17, 6
/* 0EB758 001EB658 23105100 */  subu        $2, $2, $17
/* 0EB75C 001EB65C 80180200 */  sll         $3, $2, 2
/* 0EB760 001EB660 A094828F */  lw          $2, -0x6B60($28)
/* 0EB764 001EB664 21204300 */  addu        $4, $2, $3
/* 0EB768 001EB668 282E0070 */  paddub      $5, $0, $0
/* 0EB76C 001EB66C FC000624 */  addiu       $6, $0, 0xFC
/* 0EB770 001EB670 5A0D040C */  jal         memset
/* 0EB774 001EB674 00000000 */   nop
.L001EB678:
/* 0EB778 001EB678 01003126 */  addiu       $17, $17, 0x1
.L001EB67C:
/* 0EB77C 001EB67C 1E00222A */  slti        $2, $17, 0x1E
/* 0EB780 001EB680 ECFF4014 */  bnez        $2, .L001EB634
/* 0EB784 001EB684 00000000 */   nop
/* 0EB788 001EB688 28260070 */  paddub      $4, $0, $0
/* 0EB78C 001EB68C 0B000010 */  b           .L001EB6BC
/* 0EB790 001EB690 00000000 */   nop
.L001EB694:
/* 0EB794 001EB694 80180400 */  sll         $3, $4, 2
/* 0EB798 001EB698 9494828F */  lw          $2, -0x6B6C($28)
/* 0EB79C 001EB69C 21284300 */  addu        $5, $2, $3
/* 0EB7A0 001EB6A0 0000A38C */  lw          $3, 0x0($5)
/* 0EB7A4 001EB6A4 01000224 */  addiu       $2, $0, 0x1
/* 0EB7A8 001EB6A8 03006214 */  bne         $3, $2, .L001EB6B8
/* 0EB7AC 001EB6AC 00000000 */   nop
/* 0EB7B0 001EB6B0 02000224 */  addiu       $2, $0, 0x2
/* 0EB7B4 001EB6B4 0000A2AC */  sw          $2, 0x0($5)
.L001EB6B8:
/* 0EB7B8 001EB6B8 01008424 */  addiu       $4, $4, 0x1
.L001EB6BC:
/* 0EB7BC 001EB6BC 64008228 */  slti        $2, $4, 0x64
/* 0EB7C0 001EB6C0 F4FF4014 */  bnez        $2, .L001EB694
/* 0EB7C4 001EB6C4 00000000 */   nop
/* 0EB7C8 001EB6C8 288E0070 */  paddub      $17, $0, $0
/* 0EB7CC 001EB6CC 0B000010 */  b           .L001EB6FC
/* 0EB7D0 001EB6D0 00000000 */   nop
.L001EB6D4:
/* 0EB7D4 001EB6D4 80181100 */  sll         $3, $17, 2
/* 0EB7D8 001EB6D8 9894828F */  lw          $2, -0x6B68($28)
/* 0EB7DC 001EB6DC 21204300 */  addu        $4, $2, $3
/* 0EB7E0 001EB6E0 0000838C */  lw          $3, 0x0($4)
/* 0EB7E4 001EB6E4 01000224 */  addiu       $2, $0, 0x1
/* 0EB7E8 001EB6E8 03006214 */  bne         $3, $2, .L001EB6F8
/* 0EB7EC 001EB6EC 00000000 */   nop
/* 0EB7F0 001EB6F0 02000224 */  addiu       $2, $0, 0x2
/* 0EB7F4 001EB6F4 000082AC */  sw          $2, 0x0($4)
.L001EB6F8:
/* 0EB7F8 001EB6F8 01003126 */  addiu       $17, $17, 0x1
.L001EB6FC:
/* 0EB7FC 001EB6FC 3C00222A */  slti        $2, $17, 0x3C
/* 0EB800 001EB700 F4FF4014 */  bnez        $2, .L001EB6D4
/* 0EB804 001EB704 00000000 */   nop
/* 0EB808 001EB708 288E0070 */  paddub      $17, $0, $0
/* 0EB80C 001EB70C 0B000010 */  b           .L001EB73C
/* 0EB810 001EB710 00000000 */   nop
.L001EB714:
/* 0EB814 001EB714 80181100 */  sll         $3, $17, 2
/* 0EB818 001EB718 9C94828F */  lw          $2, -0x6B64($28)
/* 0EB81C 001EB71C 21204300 */  addu        $4, $2, $3
/* 0EB820 001EB720 0000838C */  lw          $3, 0x0($4)
/* 0EB824 001EB724 01000224 */  addiu       $2, $0, 0x1
/* 0EB828 001EB728 03006214 */  bne         $3, $2, .L001EB738
/* 0EB82C 001EB72C 00000000 */   nop
/* 0EB830 001EB730 02000224 */  addiu       $2, $0, 0x2
/* 0EB834 001EB734 000082AC */  sw          $2, 0x0($4)
.L001EB738:
/* 0EB838 001EB738 01003126 */  addiu       $17, $17, 0x1
.L001EB73C:
/* 0EB83C 001EB73C 2800222A */  slti        $2, $17, 0x28
/* 0EB840 001EB740 F4FF4014 */  bnez        $2, .L001EB714
/* 0EB844 001EB744 00000000 */   nop
/* 0EB848 001EB748 8494858F */  lw          $5, -0x6B7C($28)
/* 0EB84C 001EB74C 4643A294 */  lhu         $2, 0x4346($5)
/* 0EB850 001EB750 21205000 */  addu        $4, $2, $16
/* 0EB854 001EB754 FFFF0334 */  ori         $3, $0, 0xFFFF
/* 0EB858 001EB758 2A108300 */  slt         $2, $4, $3
/* 0EB85C 001EB75C 04004014 */  bnez        $2, .L001EB770
/* 0EB860 001EB760 00000000 */   nop
/* 0EB864 001EB764 4643A3A4 */  sh          $3, 0x4346($5)
/* 0EB868 001EB768 02000010 */  b           .L001EB774
/* 0EB86C 001EB76C 00000000 */   nop
.L001EB770:
/* 0EB870 001EB770 4643A4A4 */  sh          $4, 0x4346($5)
.L001EB774:
/* 0EB874 001EB774 D901013C */  lui         $1, %hi(ShopMenu)
/* 0EB878 001EB778 D0002484 */  lh          $4, %lo(ShopMenu)($1)
/* 0EB87C 001EB77C A8B7070C */  jal         ItemShopGoodInitialize__Fi
/* 0EB880 001EB780 00000000 */   nop
/* 0EB884 001EB784 40B7070C */  jal         ItemPosInfoInit__Fv
/* 0EB888 001EB788 00000000 */   nop
/* 0EB88C 001EB78C 2000BF7B */  lq          $31, 0x20($29)
/* 0EB890 001EB790 1000B17B */  lq          $17, 0x10($29)
/* 0EB894 001EB794 0000B07B */  lq          $16, 0x0($29)
/* 0EB898 001EB798 3000BD27 */  addiu       $29, $29, 0x30
/* 0EB89C 001EB79C 0800E003 */  jr          $31
/* 0EB8A0 001EB7A0 00000000 */   nop
/* 0EB8A4 001EB7A4 00000000 */  nop
/* 0EB8A8 001EB7A8 00000000 */  nop
/* 0EB8AC 001EB7AC 00000000 */  nop
