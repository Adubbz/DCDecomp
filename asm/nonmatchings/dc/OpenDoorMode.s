.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel OpenDoorMode__Fv
/* 7E750 0017E650 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7E754 0017E654 0000BF7F */  sq         $31, 0x0($sp)
/* 7E758 0017E658 1000A0AF */  sw         $0, 0x10($sp)
/* 7E75C 0017E65C 1400A0AF */  sw         $0, 0x14($sp)
/* 7E760 0017E660 1800A0AF */  sw         $0, 0x18($sp)
/* 7E764 0017E664 6487848F */  lw         $4, -0x789C($gp)
/* 7E768 0017E668 1000A527 */  addiu      $5, $sp, 0x10
/* 7E76C 0017E66C A000998C */  lw         $25, 0xA0($4)
/* 7E770 0017E670 1C00398F */  lw         $25, 0x1C($25)
/* 7E774 0017E674 09F82003 */  jalr       $25
/* 7E778 0017E678 00000000 */   nop
/* 7E77C 0017E67C 6487848F */  lw         $4, -0x789C($gp)
/* 7E780 0017E680 A000998C */  lw         $25, 0xA0($4)
/* 7E784 0017E684 0800398F */  lw         $25, 0x8($25)
/* 7E788 0017E688 09F82003 */  jalr       $25
/* 7E78C 0017E68C 00000000 */   nop
/* 7E790 0017E690 6487848F */  lw         $4, -0x789C($gp)
/* 7E794 0017E694 A000998C */  lw         $25, 0xA0($4)
/* 7E798 0017E698 9000398F */  lw         $25, 0x90($25)
/* 7E79C 0017E69C 09F82003 */  jalr       $25
/* 7E7A0 0017E6A0 00000000 */   nop
/* 7E7A4 0017E6A4 6487848F */  lw         $4, -0x789C($gp)
/* 7E7A8 0017E6A8 282E0070 */  paddub     $5, $0, $0
/* 7E7AC 0017E6AC A000998C */  lw         $25, 0xA0($4)
/* 7E7B0 0017E6B0 9400398F */  lw         $25, 0x94($25)
/* 7E7B4 0017E6B4 09F82003 */  jalr       $25
/* 7E7B8 0017E6B8 00000000 */   nop
/* 7E7BC 0017E6BC 3491838F */  lw         $3, -0x6ECC($gp)
/* 7E7C0 0017E6C0 26006010 */  beqz       $3, .L0017E75C
/* 7E7C4 0017E6C4 00000000 */   nop
/* 7E7C8 0017E6C8 6487848F */  lw         $4, -0x789C($gp)
/* 7E7CC 0017E6CC D301023C */  lui        $2, %hi(fix_chara_pos)
/* 7E7D0 0017E6D0 50594524 */  addiu      $5, $2, %lo(fix_chara_pos)
/* 7E7D4 0017E6D4 A000998C */  lw         $25, 0xA0($4)
/* 7E7D8 0017E6D8 1400398F */  lw         $25, 0x14($25)
/* 7E7DC 0017E6DC 09F82003 */  jalr       $25
/* 7E7E0 0017E6E0 00000000 */   nop
/* 7E7E4 0017E6E4 6487848F */  lw         $4, -0x789C($gp)
/* 7E7E8 0017E6E8 D301013C */  lui        $at, (0x1D35960 >> 16)
/* 7E7EC 0017E6EC 60592CC4 */  lwc1       $f12, (0x1D35960 & 0xFFFF)($at)
/* 7E7F0 0017E6F0 D301013C */  lui        $at, (0x1D35964 >> 16)
/* 7E7F4 0017E6F4 64592DC4 */  lwc1       $f13, (0x1D35964 & 0xFFFF)($at)
/* 7E7F8 0017E6F8 D301013C */  lui        $at, (0x1D35968 >> 16)
/* 7E7FC 0017E6FC 68592EC4 */  lwc1       $f14, (0x1D35968 & 0xFFFF)($at)
/* 7E800 0017E700 A000998C */  lw         $25, 0xA0($4)
/* 7E804 0017E704 3000398F */  lw         $25, 0x30($25)
/* 7E808 0017E708 09F82003 */  jalr       $25
/* 7E80C 0017E70C 00000000 */   nop
/* 7E810 0017E710 D301023C */  lui        $2, %hi(MainCamera)
/* 7E814 0017E714 40454424 */  addiu      $4, $2, %lo(MainCamera)
/* 7E818 0017E718 D301023C */  lui        $2, %hi(fix_camera_pos)
/* 7E81C 0017E71C 70594524 */  addiu      $5, $2, %lo(fix_camera_pos)
/* 7E820 0017E720 A490040C */  jal        SetPos__7CCameraFPf
/* 7E824 0017E724 00000000 */   nop
/* 7E828 0017E728 6041023C */  lui        $2, (0x41600000 >> 16)
/* 7E82C 0017E72C 00088244 */  mtc1       $2, $f1
/* 7E830 0017E730 D301013C */  lui        $at, (0x1D35954 >> 16)
/* 7E834 0017E734 545920C4 */  lwc1       $f0, (0x1D35954 & 0xFFFF)($at)
/* 7E838 0017E738 400B0046 */  add.s      $f13, $f1, $f0
/* 7E83C 0017E73C D301023C */  lui        $2, %hi(MainCamera)
/* 7E840 0017E740 40454424 */  addiu      $4, $2, %lo(MainCamera)
/* 7E844 0017E744 D301013C */  lui        $at, (0x1D35950 >> 16)
/* 7E848 0017E748 50592CC4 */  lwc1       $f12, (0x1D35950 & 0xFFFF)($at)
/* 7E84C 0017E74C D301013C */  lui        $at, (0x1D35958 >> 16)
/* 7E850 0017E750 58592EC4 */  lwc1       $f14, (0x1D35958 & 0xFFFF)($at)
/* 7E854 0017E754 D490040C */  jal        SetRef__7CCameraFfff
/* 7E858 0017E758 00000000 */   nop
.L0017E75C:
/* 7E85C 0017E75C 0000BF7B */  lq         $31, 0x0($sp)
/* 7E860 0017E760 2000BD27 */  addiu      $sp, $sp, 0x20
/* 7E864 0017E764 0800E003 */  jr         $31
/* 7E868 0017E768 00000000 */   nop
/* 7E86C 0017E76C 00000000 */  nop
