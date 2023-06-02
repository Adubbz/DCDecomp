.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SYNC_SCENE_CHARA__FP12RS_STACKDATAi
/* 8D7A0 0018D6A0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 8D7A4 0018D6A4 3000BF7F */  sq         $31, 0x30($sp)
/* 8D7A8 0018D6A8 2000B27F */  sq         $18, 0x20($sp)
/* 8D7AC 0018D6AC 1000B17F */  sq         $17, 0x10($sp)
/* 8D7B0 0018D6B0 0000B07F */  sq         $16, 0x0($sp)
/* 8D7B4 0018D6B4 08009224 */  addiu      $18, $4, 0x8
/* 8D7B8 0018D6B8 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8D7BC 0018D6BC 00000000 */   nop
/* 8D7C0 0018D6C0 28264070 */  paddub     $4, $2, $0
/* 8D7C4 0018D6C4 6C2C060C */  jal        GetScene__Fi
/* 8D7C8 0018D6C8 00000000 */   nop
/* 8D7CC 0018D6CC 28864070 */  paddub     $16, $2, $0
/* 8D7D0 0018D6D0 04000016 */  bnez       $16, .L0018D6E4
/* 8D7D4 0018D6D4 00000000 */   nop
/* 8D7D8 0018D6D8 28160070 */  paddub     $2, $0, $0
/* 8D7DC 0018D6DC 35000010 */  b          .L0018D7B4
/* 8D7E0 0018D6E0 00000000 */   nop
.L0018D6E4:
/* 8D7E4 0018D6E4 28264072 */  paddub     $4, $18, $0
/* 8D7E8 0018D6E8 08009224 */  addiu      $18, $4, 0x8
/* 8D7EC 0018D6EC F428060C */  jal        GetStackString__FP12RS_STACKDATA
/* 8D7F0 0018D6F0 00000000 */   nop
/* 8D7F4 0018D6F4 288E4070 */  paddub     $17, $2, $0
/* 8D7F8 0018D6F8 28264072 */  paddub     $4, $18, $0
/* 8D7FC 0018D6FC D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8D800 0018D700 00000000 */   nop
/* 8D804 0018D704 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8D808 0018D708 1CD2328C */  lw         $18, -0x2DE4($at)
/* 8D80C 0018D70C 05004004 */  bltz       $2, .L0018D724
/* 8D810 0018D710 00000000 */   nop
/* 8D814 0018D714 28264070 */  paddub     $4, $2, $0
/* 8D818 0018D718 702C060C */  jal        GetNPC__Fi
/* 8D81C 0018D71C 00000000 */   nop
/* 8D820 0018D720 28964070 */  paddub     $18, $2, $0
.L0018D724:
/* 8D824 0018D724 04004016 */  bnez       $18, .L0018D738
/* 8D828 0018D728 00000000 */   nop
/* 8D82C 0018D72C 28160070 */  paddub     $2, $0, $0
/* 8D830 0018D730 20000010 */  b          .L0018D7B4
/* 8D834 0018D734 00000000 */   nop
.L0018D738:
/* 8D838 0018D738 BC00048E */  lw         $4, 0xBC($16)
/* 8D83C 0018D73C 04008014 */  bnez       $4, .L0018D750
/* 8D840 0018D740 00000000 */   nop
/* 8D844 0018D744 28160070 */  paddub     $2, $0, $0
/* 8D848 0018D748 1A000010 */  b          .L0018D7B4
/* 8D84C 0018D74C 00000000 */   nop
.L0018D750:
/* 8D850 0018D750 282E2072 */  paddub     $5, $17, $0
/* 8D854 0018D754 C0A1040C */  jal        SearchFrame__6CFrameFPc
/* 8D858 0018D758 00000000 */   nop
/* 8D85C 0018D75C 28864070 */  paddub     $16, $2, $0
/* 8D860 0018D760 04000016 */  bnez       $16, .L0018D774
/* 8D864 0018D764 00000000 */   nop
/* 8D868 0018D768 28160070 */  paddub     $2, $0, $0
/* 8D86C 0018D76C 11000010 */  b          .L0018D7B4
/* 8D870 0018D770 00000000 */   nop
.L0018D774:
/* 8D874 0018D774 BC00448E */  lw         $4, 0xBC($18)
/* 8D878 0018D778 04008014 */  bnez       $4, .L0018D78C
/* 8D87C 0018D77C 00000000 */   nop
/* 8D880 0018D780 28160070 */  paddub     $2, $0, $0
/* 8D884 0018D784 0B000010 */  b          .L0018D7B4
/* 8D888 0018D788 00000000 */   nop
.L0018D78C:
/* 8D88C 0018D78C 282E0072 */  paddub     $5, $16, $0
/* 8D890 0018D790 60A0040C */  jal        SetReference__6CFrameFP6CFrame
/* 8D894 0018D794 00000000 */   nop
/* 8D898 0018D798 C000448E */  lw         $4, 0xC0($18)
/* 8D89C 0018D79C 04008010 */  beqz       $4, .L0018D7B0
/* 8D8A0 0018D7A0 00000000 */   nop
/* 8D8A4 0018D7A4 282E0072 */  paddub     $5, $16, $0
/* 8D8A8 0018D7A8 60A0040C */  jal        SetReference__6CFrameFP6CFrame
/* 8D8AC 0018D7AC 00000000 */   nop
.L0018D7B0:
/* 8D8B0 0018D7B0 01000224 */  addiu      $2, $0, 0x1
.L0018D7B4:
/* 8D8B4 0018D7B4 3000BF7B */  lq         $31, 0x30($sp)
/* 8D8B8 0018D7B8 2000B27B */  lq         $18, 0x20($sp)
/* 8D8BC 0018D7BC 1000B17B */  lq         $17, 0x10($sp)
/* 8D8C0 0018D7C0 0000B07B */  lq         $16, 0x0($sp)
/* 8D8C4 0018D7C4 4000BD27 */  addiu      $sp, $sp, 0x40
/* 8D8C8 0018D7C8 0800E003 */  jr         $31
/* 8D8CC 0018D7CC 00000000 */   nop
