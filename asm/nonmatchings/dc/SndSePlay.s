.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndSePlay__Fiii
/* 5A7B0 0015A6B0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 5A7B4 0015A6B4 0000BF7F */  sq         $31, 0x0($sp)
/* 5A7B8 0015A6B8 2846A070 */  paddub     $8, $5, $0
/* 5A7BC 0015A6BC 284EC070 */  paddub     $9, $6, $0
/* 5A7C0 0015A6C0 2C68050C */  jal        GetSeInfo__Fi
/* 5A7C4 0015A6C4 00000000 */   nop
/* 5A7C8 0015A6C8 283E4070 */  paddub     $7, $2, $0
/* 5A7CC 0015A6CC 1D00E010 */  beqz       $7, .L0015A744
/* 5A7D0 0015A6D0 00000000 */   nop
/* 5A7D4 0015A6D4 0400E284 */  lh         $2, 0x4($7)
/* 5A7D8 0015A6D8 02004104 */  bgez       $2, .L0015A6E4
/* 5A7DC 0015A6DC 00000000 */   nop
/* 5A7E0 0015A6E0 7F000824 */  addiu      $8, $0, 0x7F
.L0015A6E4:
/* 5A7E4 0015A6E4 8068050C */  jal        GetPortNo__Fi
/* 5A7E8 0015A6E8 00000000 */   nop
/* 5A7EC 0015A6EC 608E8383 */  lb         $3, -0x71A0($gp)
/* 5A7F0 0015A6F0 04006014 */  bnez       $3, .L0015A704
/* 5A7F4 0015A6F4 00000000 */   nop
/* 5A7F8 0015A6F8 5C8E80AF */  sw         $0, -0x71A4($gp)
/* 5A7FC 0015A6FC 01000324 */  addiu      $3, $0, 0x1
/* 5A800 0015A700 608E83A3 */  sb         $3, -0x71A0($gp)
.L0015A704:
/* 5A804 0015A704 09000105 */  bgez       $8, .L0015A72C
/* 5A808 0015A708 00000000 */   nop
/* 5A80C 0015A70C 0400E684 */  lh         $6, 0x4($7)
/* 5A810 0015A710 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5A814 0015A714 282E4070 */  paddub     $5, $2, $0
/* 5A818 0015A718 283E2071 */  paddub     $7, $9, $0
/* 5A81C 0015A71C F015050C */  jal        SE_Play__6CSoundFiii
/* 5A820 0015A720 00000000 */   nop
/* 5A824 0015A724 07000010 */  b          .L0015A744
/* 5A828 0015A728 00000000 */   nop
.L0015A72C:
/* 5A82C 0015A72C 0000E680 */  lb         $6, 0x0($7)
/* 5A830 0015A730 0100E780 */  lb         $7, 0x1($7)
/* 5A834 0015A734 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5A838 0015A738 282E4070 */  paddub     $5, $2, $0
/* 5A83C 0015A73C 0816050C */  jal        SE_Play__6CSoundFiiiii
/* 5A840 0015A740 00000000 */   nop
.L0015A744:
/* 5A844 0015A744 0000BF7B */  lq         $31, 0x0($sp)
/* 5A848 0015A748 1000BD27 */  addiu      $sp, $sp, 0x10
/* 5A84C 0015A74C 0800E003 */  jr         $31
/* 5A850 0015A750 00000000 */   nop
/* 5A854 0015A754 00000000 */  nop
/* 5A858 0015A758 00000000 */  nop
/* 5A85C 0015A75C 00000000 */  nop
