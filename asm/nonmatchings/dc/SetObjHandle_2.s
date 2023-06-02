.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetObjHandle__FiP10CCharacterPc
/* 8A740 0018A640 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 8A744 0018A644 4000BF7F */  sq         $31, 0x40($sp)
/* 8A748 0018A648 3000B37F */  sq         $19, 0x30($sp)
/* 8A74C 0018A64C 2000B27F */  sq         $18, 0x20($sp)
/* 8A750 0018A650 1000B17F */  sq         $17, 0x10($sp)
/* 8A754 0018A654 0000B07F */  sq         $16, 0x0($sp)
/* 8A758 0018A658 289EA070 */  paddub     $19, $5, $0
/* 8A75C 0018A65C 2896C070 */  paddub     $18, $6, $0
/* 8A760 0018A660 0C29060C */  jal        GetObjHandle__Fi
/* 8A764 0018A664 00000000 */   nop
/* 8A768 0018A668 28864070 */  paddub     $16, $2, $0
/* 8A76C 0018A66C 04000016 */  bnez       $16, .L0018A680
/* 8A770 0018A670 00000000 */   nop
/* 8A774 0018A674 28160070 */  paddub     $2, $0, $0
/* 8A778 0018A678 38000010 */  b          .L0018A75C
/* 8A77C 0018A67C 00000000 */   nop
.L0018A680:
/* 8A780 0018A680 04006016 */  bnez       $19, .L0018A694
/* 8A784 0018A684 00000000 */   nop
/* 8A788 0018A688 28160070 */  paddub     $2, $0, $0
/* 8A78C 0018A68C 33000010 */  b          .L0018A75C
/* 8A790 0018A690 00000000 */   nop
.L0018A694:
/* 8A794 0018A694 04004016 */  bnez       $18, .L0018A6A8
/* 8A798 0018A698 00000000 */   nop
/* 8A79C 0018A69C 28160070 */  paddub     $2, $0, $0
/* 8A7A0 0018A6A0 2E000010 */  b          .L0018A75C
/* 8A7A4 0018A6A4 00000000 */   nop
.L0018A6A8:
/* 8A7A8 0018A6A8 28260072 */  paddub     $4, $16, $0
/* 8A7AC 0018A6AC 282E0070 */  paddub     $5, $0, $0
/* 8A7B0 0018A6B0 38000624 */  addiu      $6, $0, 0x38
/* 8A7B4 0018A6B4 5A0D040C */  jal        memset
/* 8A7B8 0018A6B8 00000000 */   nop
/* 8A7BC 0018A6BC 288E0070 */  paddub     $17, $0, $0
/* 8A7C0 0018A6C0 BC00628E */  lw         $2, 0xBC($19)
/* 8A7C4 0018A6C4 080002AE */  sw         $2, 0x8($16)
/* 8A7C8 0018A6C8 C000628E */  lw         $2, 0xC0($19)
/* 8A7CC 0018A6CC 0C0002AE */  sw         $2, 0xC($16)
/* 8A7D0 0018A6D0 02003126 */  addiu      $17, $17, 0x2
/* 8A7D4 0018A6D4 05000010 */  b          .L0018A6EC
/* 8A7D8 0018A6D8 00000000 */   nop
.L0018A6DC:
/* 8A7DC 0018A6DC 80101100 */  sll        $2, $17, 2
/* 8A7E0 0018A6E0 21105000 */  addu       $2, $2, $16
/* 8A7E4 0018A6E4 080040AC */  sw         $0, 0x8($2)
/* 8A7E8 0018A6E8 01003126 */  addiu      $17, $17, 0x1
.L0018A6EC:
/* 8A7EC 0018A6EC 0C00222A */  slti       $2, $17, 0xC
/* 8A7F0 0018A6F0 FAFF4014 */  bnez       $2, .L0018A6DC
/* 8A7F4 0018A6F4 00000000 */   nop
/* 8A7F8 0018A6F8 00004282 */  lb         $2, 0x0($18)
/* 8A7FC 0018A6FC 15004010 */  beqz       $2, .L0018A754
/* 8A800 0018A700 00000000 */   nop
/* 8A804 0018A704 288E0070 */  paddub     $17, $0, $0
/* 8A808 0018A708 0C000010 */  b          .L0018A73C
/* 8A80C 0018A70C 00000000 */   nop
.L0018A710:
/* 8A810 0018A710 80101100 */  sll        $2, $17, 2
/* 8A814 0018A714 21105000 */  addu       $2, $2, $16
/* 8A818 0018A718 08005324 */  addiu      $19, $2, 0x8
/* 8A81C 0018A71C 0800448C */  lw         $4, 0x8($2)
/* 8A820 0018A720 05008010 */  beqz       $4, .L0018A738
/* 8A824 0018A724 00000000 */   nop
/* 8A828 0018A728 282E4072 */  paddub     $5, $18, $0
/* 8A82C 0018A72C C0A1040C */  jal        SearchFrame__6CFrameFPc
/* 8A830 0018A730 00000000 */   nop
/* 8A834 0018A734 000062AE */  sw         $2, 0x0($19)
.L0018A738:
/* 8A838 0018A738 01003126 */  addiu      $17, $17, 0x1
.L0018A73C:
/* 8A83C 0018A73C 0C00222A */  slti       $2, $17, 0xC
/* 8A840 0018A740 F3FF4014 */  bnez       $2, .L0018A710
/* 8A844 0018A744 00000000 */   nop
/* 8A848 0018A748 000000AE */  sw         $0, 0x0($16)
/* 8A84C 0018A74C 02000010 */  b          .L0018A758
/* 8A850 0018A750 00000000 */   nop
.L0018A754:
/* 8A854 0018A754 040013AE */  sw         $19, 0x4($16)
.L0018A758:
/* 8A858 0018A758 01000224 */  addiu      $2, $0, 0x1
.L0018A75C:
/* 8A85C 0018A75C 4000BF7B */  lq         $31, 0x40($sp)
/* 8A860 0018A760 3000B37B */  lq         $19, 0x30($sp)
/* 8A864 0018A764 2000B27B */  lq         $18, 0x20($sp)
/* 8A868 0018A768 1000B17B */  lq         $17, 0x10($sp)
/* 8A86C 0018A76C 0000B07B */  lq         $16, 0x0($sp)
/* 8A870 0018A770 5000BD27 */  addiu      $sp, $sp, 0x50
/* 8A874 0018A774 0800E003 */  jr         $31
/* 8A878 0018A778 00000000 */   nop
/* 8A87C 0018A77C 00000000 */  nop