.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel WepAttachHaveCancel__Fv
/* 0FF7B0 001FF6B0 C0FFBD27 */  addiu       $29, $29, -0x40
/* 0FF7B4 001FF6B4 3000BF7F */  sq          $31, 0x30($29)
/* 0FF7B8 001FF6B8 2000B27F */  sq          $18, 0x20($29)
/* 0FF7BC 001FF6BC 1000B17F */  sq          $17, 0x10($29)
/* 0FF7C0 001FF6C0 0000B07F */  sq          $16, 0x0($29)
/* 0FF7C4 001FF6C4 7495858F */  lw          $5, -0x6A8C($28)
/* 0FF7C8 001FF6C8 1000B184 */  lh          $17, 0x10($5)
/* 0FF7CC 001FF6CC 5100232A */  slti        $3, $17, 0x51
/* 0FF7D0 001FF6D0 31006014 */  bnez        $3, .L001FF798
/* 0FF7D4 001FF6D4 00000000 */   nop
/* 0FF7D8 001FF6D8 0400A48C */  lw          $4, 0x4($5)
/* 0FF7DC 001FF6DC 09000324 */  addiu       $3, $0, 0x9
/* 0FF7E0 001FF6E0 0E008310 */  beq         $4, $3, .L001FF71C
/* 0FF7E4 001FF6E4 00000000 */   nop
/* 0FF7E8 001FF6E8 0A000324 */  addiu       $3, $0, 0xA
/* 0FF7EC 001FF6EC 03008310 */  beq         $4, $3, .L001FF6FC
/* 0FF7F0 001FF6F0 00000000 */   nop
/* 0FF7F4 001FF6F4 14000010 */  b           .L001FF748
/* 0FF7F8 001FF6F8 00000000 */   nop
.L001FF6FC:
/* 0FF7FC 001FF6FC D494838F */  lw          $3, -0x6B2C($28)
/* 0FF800 001FF700 04056424 */  addiu       $4, $3, 0x504
/* 0FF804 001FF704 F87F8424 */  addiu       $4, $4, 0x7FF8
/* 0FF808 001FF708 0C00A38C */  lw          $3, 0xC($5)
/* 0FF80C 001FF70C 40190300 */  sll         $3, $3, 5
/* 0FF810 001FF710 21808300 */  addu        $16, $4, $3
/* 0FF814 001FF714 0C000010 */  b           .L001FF748
/* 0FF818 001FF718 00000000 */   nop
.L001FF71C:
/* 0FF81C 001FF71C DA01013C */  lui         $1, %hi(WepMenu + 0x4)
/* 0FF820 001FF720 74EA2480 */  lb          $4, %lo(WepMenu + 0x4)($1)
/* 0FF824 001FF724 40190400 */  sll         $3, $4, 5
/* 0FF828 001FF728 23186400 */  subu        $3, $3, $4
/* 0FF82C 001FF72C C0200300 */  sll         $4, $3, 3
/* 0FF830 001FF730 1495838F */  lw          $3, -0x6AEC($28)
/* 0FF834 001FF734 21206400 */  addu        $4, $3, $4
/* 0FF838 001FF738 0C00A38C */  lw          $3, 0xC($5)
/* 0FF83C 001FF73C 40190300 */  sll         $3, $3, 5
/* 0FF840 001FF740 21188300 */  addu        $3, $4, $3
/* 0FF844 001FF744 28007024 */  addiu       $16, $3, 0x28
.L001FF748:
/* 0FF848 001FF748 0A000012 */  beqz        $16, .L001FF774
/* 0FF84C 001FF74C 00000000 */   nop
/* 0FF850 001FF750 00001286 */  lh          $18, 0x0($16)
/* 0FF854 001FF754 28260072 */  paddub      $4, $16, $0
/* 0FF858 001FF758 DA01023C */  lui         $2, %hi(WepMenu + 0x150)
/* 0FF85C 001FF75C C0EB4524 */  addiu       $5, $2, %lo(WepMenu + 0x150)
/* 0FF860 001FF760 74B9080C */  jal         MenuDataSwap__FP11ATTACH_LISTP11ATTACH_LIST
/* 0FF864 001FF764 00000000 */   nop
/* 0FF868 001FF768 7495838F */  lw          $3, -0x6A8C($28)
/* 0FF86C 001FF76C 100072A4 */  sh          $18, 0x10($3)
/* 0FF870 001FF770 000011A6 */  sh          $17, 0x0($16)
.L001FF774:
/* 0FF874 001FF774 7495848F */  lw          $4, -0x6A8C($28)
/* 0FF878 001FF778 10008384 */  lh          $3, 0x10($4)
/* 0FF87C 001FF77C 51006128 */  slti        $1, $3, 0x51
/* 0FF880 001FF780 2A002010 */  beqz        $1, .L001FF82C
/* 0FF884 001FF784 00000000 */   nop
/* 0FF888 001FF788 10B9080C */  jal         InitHaveData__FP9IHAVEITEM
/* 0FF88C 001FF78C 00000000 */   nop
/* 0FF890 001FF790 26000010 */  b           .L001FF82C
/* 0FF894 001FF794 00000000 */   nop
.L001FF798:
/* 0FF898 001FF798 1C8D848F */  lw          $4, -0x72E4($28)
/* 0FF89C 001FF79C D05E050C */  jal         GetMenuCursor__9CSaveDataFv
/* 0FF8A0 001FF7A0 00000000 */   nop
/* 0FF8A4 001FF7A4 00004384 */  lh          $3, 0x0($2)
/* 0FF8A8 001FF7A8 07006014 */  bnez        $3, .L001FF7C8
/* 0FF8AC 001FF7AC 00000000 */   nop
/* 0FF8B0 001FF7B0 DA01013C */  lui         $1, %hi(WepMenu + 0x2)
/* 0FF8B4 001FF7B4 72EA2384 */  lh          $3, %lo(WepMenu + 0x2)($1)
/* 0FF8B8 001FF7B8 1A0043A4 */  sh          $3, 0x1A($2)
/* 0FF8BC 001FF7BC DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FF8C0 001FF7C0 90EA238C */  lw          $3, %lo(WepMenu + 0x20)($1)
/* 0FF8C4 001FF7C4 060043A4 */  sh          $3, 0x6($2)
.L001FF7C8:
/* 0FF8C8 001FF7C8 01000224 */  addiu       $2, $0, 0x1
/* 0FF8CC 001FF7CC DA01013C */  lui         $1, %hi(WepMenu + 0x2)
/* 0FF8D0 001FF7D0 72EA22A4 */  sh          $2, %lo(WepMenu + 0x2)($1)
/* 0FF8D4 001FF7D4 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FF8D8 001FF7D8 90EA22AC */  sw          $2, %lo(WepMenu + 0x20)($1)
/* 0FF8DC 001FF7DC DA01013C */  lui         $1, %hi(WepMenu + 0x6)
/* 0FF8E0 001FF7E0 76EA20A0 */  sb          $0, %lo(WepMenu + 0x6)($1)
/* 0FF8E4 001FF7E4 C0CF070C */  jal         GetNowSelectWeapon__Fv
/* 0FF8E8 001FF7E8 00000000 */   nop
/* 0FF8EC 001FF7EC D894838F */  lw          $3, -0x6B28($28)
/* 0FF8F0 001FF7F0 0E006014 */  bnez        $3, .L001FF82C
/* 0FF8F4 001FF7F4 00000000 */   nop
/* 0FF8F8 001FF7F8 D494838F */  lw          $3, -0x6B2C($28)
/* 0FF8FC 001FF7FC 04006380 */  lb          $3, 0x4($3)
/* 0FF900 001FF800 03000424 */  addiu       $4, $0, 0x3
/* 0FF904 001FF804 09006414 */  bne         $3, $4, .L001FF82C
/* 0FF908 001FF808 00000000 */   nop
/* 0FF90C 001FF80C DA01013C */  lui         $1, %hi(WepMenu + 0x5)
/* 0FF910 001FF810 75EA2380 */  lb          $3, %lo(WepMenu + 0x5)($1)
/* 0FF914 001FF814 05006414 */  bne         $3, $4, .L001FF82C
/* 0FF918 001FF818 00000000 */   nop
/* 0FF91C 001FF81C 30FB040C */  jal         StartReadBG__Fv
/* 0FF920 001FF820 00000000 */   nop
/* 0FF924 001FF824 2C34080C */  jal         DngWepEffectReadStart__Fv
/* 0FF928 001FF828 00000000 */   nop
.L001FF82C:
/* 0FF92C 001FF82C 3000BF7B */  lq          $31, 0x30($29)
/* 0FF930 001FF830 2000B27B */  lq          $18, 0x20($29)
/* 0FF934 001FF834 1000B17B */  lq          $17, 0x10($29)
/* 0FF938 001FF838 0000B07B */  lq          $16, 0x0($29)
/* 0FF93C 001FF83C 4000BD27 */  addiu       $29, $29, 0x40
/* 0FF940 001FF840 0800E003 */  jr          $31
/* 0FF944 001FF844 00000000 */   nop
/* 0FF948 001FF848 00000000 */  nop
/* 0FF94C 001FF84C 00000000 */  nop
