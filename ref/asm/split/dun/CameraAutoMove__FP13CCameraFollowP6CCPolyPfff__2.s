.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CameraAutoMove__FP13CCameraFollowP6CCPolyPfff__2
/* 012A60 01DBE760 A0FFBD27 */  addiu       $29, $29, -0x60
/* 012A64 01DBE764 3000BF7F */  sq          $31, 0x30($29)
/* 012A68 01DBE768 2000B17F */  sq          $17, 0x20($29)
/* 012A6C 01DBE76C 1000B07F */  sq          $16, 0x10($29)
/* 012A70 01DBE770 0800B6E7 */  swc1        $f22, 0x8($29)
/* 012A74 01DBE774 0400B5E7 */  swc1        $f21, 0x4($29)
/* 012A78 01DBE778 0000B4E7 */  swc1        $f20, 0x0($29)
/* 012A7C 01DBE77C 28868070 */  paddub      $16, $4, $0
/* 012A80 01DBE780 288EC070 */  paddub      $17, $6, $0
/* 012A84 01DBE784 46650046 */  mov.s       $f21, $f12
/* 012A88 01DBE788 066D0046 */  mov.s       $f20, $f13
/* 012A8C 01DBE78C 4000A527 */  addiu       $5, $29, 0x40
/* 012A90 01DBE790 A891040C */  jal         GetRef__7CCameraFPf
/* 012A94 01DBE794 00000000 */   nop
/* 012A98 01DBE798 000021C6 */  lwc1        $f1, 0x0($17)
/* 012A9C 01DBE79C 4000A0C7 */  lwc1        $f0, 0x40($29)
/* 012AA0 01DBE7A0 01080046 */  sub.s       $f0, $f1, $f0
/* 012AA4 01DBE7A4 5000A0E7 */  swc1        $f0, 0x50($29)
/* 012AA8 01DBE7A8 080021C6 */  lwc1        $f1, 0x8($17)
/* 012AAC 01DBE7AC 4800A0C7 */  lwc1        $f0, 0x48($29)
/* 012AB0 01DBE7B0 01080046 */  sub.s       $f0, $f1, $f0
/* 012AB4 01DBE7B4 5800B127 */  addiu       $17, $29, 0x58
/* 012AB8 01DBE7B8 000020E6 */  swc1        $f0, 0x0($17)
/* 012ABC 01DBE7BC 5400A0AF */  sw          $0, 0x54($29)
/* 012AC0 01DBE7C0 5000A427 */  addiu       $4, $29, 0x50
/* 012AC4 01DBE7C4 588D040C */  jal         DistVector__FPf
/* 012AC8 01DBE7C8 00000000 */   nop
/* 012ACC 01DBE7CC 808081C7 */  lwc1        $f1, -0x7F80($28)
/* 012AD0 01DBE7D0 000B0046 */  add.s       $f12, $f1, $f0
/* 012AD4 01DBE7D4 28260072 */  paddub      $4, $16, $0
/* 012AD8 01DBE7D8 DC92040C */  jal         SetDistance__13CCameraFollowFf
/* 012ADC 01DBE7DC 00000000 */   nop
/* 012AE0 01DBE7E0 00B08044 */  mtc1        $0, $f22
/* 012AE4 01DBE7E4 28260072 */  paddub      $4, $16, $0
/* 012AE8 01DBE7E8 E092040C */  jal         GetDistance__13CCameraFollowFv
/* 012AEC 01DBE7EC 00000000 */   nop
/* 012AF0 01DBE7F0 088B81C7 */  lwc1        $f1, -0x74F8($28)
/* 012AF4 01DBE7F4 81000146 */  sub.s       $f2, $f0, $f1
/* 012AF8 01DBE7F8 06B00046 */  mov.s       $f0, $f22
/* 012AFC 01DBE7FC 34100046 */  c.lt.s      $f2, $f0
/* 012B00 01DBE800 00000000 */  nop
/* 012B04 01DBE804 06000045 */  bc1f        .L01DBE820_2F9E20
/* 012B08 01DBE808 00000000 */   nop
/* 012B0C 01DBE80C 47100046 */  neg.s       $f1, $f2
/* 012B10 01DBE810 A041023C */  lui         $2, (0x41A00000 >> 16)
/* 012B14 01DBE814 00008244 */  mtc1        $2, $f0
/* 012B18 01DBE818 00000000 */  nop
/* 012B1C 01DBE81C 830D0046 */  div.s       $f22, $f1, $f0
.L01DBE820_2F9E20:
/* 012B20 01DBE820 00008044 */  mtc1        $0, $f0
/* 012B24 01DBE824 00000000 */  nop
/* 012B28 01DBE828 36100046 */  c.le.s      $f2, $f0
/* 012B2C 01DBE82C 00000000 */  nop
/* 012B30 01DBE830 05000145 */  bc1t        .L01DBE848_2F9E48
/* 012B34 01DBE834 00000000 */   nop
/* 012B38 01DBE838 F041023C */  lui         $2, (0x41F00000 >> 16)
/* 012B3C 01DBE83C 00008244 */  mtc1        $2, $f0
/* 012B40 01DBE840 00000000 */  nop
/* 012B44 01DBE844 83150046 */  div.s       $f22, $f2, $f0
.L01DBE848_2F9E48:
/* 012B48 01DBE848 0040023C */  lui         $2, (0x40000000 >> 16)
/* 012B4C 01DBE84C 00008244 */  mtc1        $2, $f0
/* 012B50 01DBE850 00000000 */  nop
/* 012B54 01DBE854 36B00046 */  c.le.s      $f22, $f0
/* 012B58 01DBE858 00000000 */  nop
/* 012B5C 01DBE85C 02000145 */  bc1t        .L01DBE868_2F9E68
/* 012B60 01DBE860 00000000 */   nop
/* 012B64 01DBE864 86050046 */  mov.s       $f22, $f0
.L01DBE868_2F9E68:
/* 012B68 01DBE868 E08380C7 */  lwc1        $f0, -0x7C20($28)
/* 012B6C 01DBE86C 34B00046 */  c.lt.s      $f22, $f0
/* 012B70 01DBE870 00000000 */  nop
/* 012B74 01DBE874 02000045 */  bc1f        .L01DBE880_2F9E80
/* 012B78 01DBE878 00000000 */   nop
/* 012B7C 01DBE87C 86050046 */  mov.s       $f22, $f0
.L01DBE880_2F9E80:
/* 012B80 01DBE880 00008044 */  mtc1        $0, $f0
/* 012B84 01DBE884 00000000 */  nop
/* 012B88 01DBE888 34100046 */  c.lt.s      $f2, $f0
/* 012B8C 01DBE88C 00000000 */  nop
/* 012B90 01DBE890 05000045 */  bc1f        .L01DBE8A8_2F9EA8
/* 012B94 01DBE894 00000000 */   nop
/* 012B98 01DBE898 0040023C */  lui         $2, (0x40000000 >> 16)
/* 012B9C 01DBE89C 00008244 */  mtc1        $2, $f0
/* 012BA0 01DBE8A0 00000000 */  nop
/* 012BA4 01DBE8A4 82B50046 */  mul.s       $f22, $f22, $f0
.L01DBE8A8_2F9EA8:
/* 012BA8 01DBE8A8 5000ACC7 */  lwc1        $f12, 0x50($29)
/* 012BAC 01DBE8AC 00002DC6 */  lwc1        $f13, 0x0($17)
/* 012BB0 01DBE8B0 5077040C */  jal         atan2f
/* 012BB4 01DBE8B4 00000000 */   nop
/* 012BB8 01DBE8B8 A89C848F */  lw          $4, -0x6358($28)
/* 012BBC 01DBE8BC 06030046 */  mov.s       $f12, $f0
/* 012BC0 01DBE8C0 C892040C */  jal         SetAngle__13CCameraFollowFf
/* 012BC4 01DBE8C4 00000000 */   nop
/* 012BC8 01DBE8C8 34A81446 */  c.lt.s      $f21, $f20
/* 012BCC 01DBE8CC 00000000 */  nop
/* 012BD0 01DBE8D0 09000045 */  bc1f        .L01DBE8F8_2F9EF8
/* 012BD4 01DBE8D4 00000000 */   nop
/* 012BD8 01DBE8D8 47B00046 */  neg.s       $f1, $f22
/* 012BDC 01DBE8DC 9C8280C7 */  lwc1        $f0, -0x7D64($28)
/* 012BE0 01DBE8E0 02030146 */  mul.s       $f12, $f0, $f1
/* 012BE4 01DBE8E4 A89C848F */  lw          $4, -0x6358($28)
/* 012BE8 01DBE8E8 D492040C */  jal         AddAngle__13CCameraFollowFf
/* 012BEC 01DBE8EC 00000000 */   nop
/* 012BF0 01DBE8F0 06000010 */  b           .L01DBE90C_2F9F0C
/* 012BF4 01DBE8F4 00000000 */   nop
.L01DBE8F8_2F9EF8:
/* 012BF8 01DBE8F8 9C8280C7 */  lwc1        $f0, -0x7D64($28)
/* 012BFC 01DBE8FC 02031646 */  mul.s       $f12, $f0, $f22
/* 012C00 01DBE900 A89C848F */  lw          $4, -0x6358($28)
/* 012C04 01DBE904 D492040C */  jal         AddAngle__13CCameraFollowFf
/* 012C08 01DBE908 00000000 */   nop
.L01DBE90C_2F9F0C:
/* 012C0C 01DBE90C 28260072 */  paddub      $4, $16, $0
/* 012C10 01DBE910 E092040C */  jal         GetDistance__13CCameraFollowFv
/* 012C14 01DBE914 00000000 */   nop
/* 012C18 01DBE918 DC8382C7 */  lwc1        $f2, -0x7C24($28)
/* 012C1C 01DBE91C 088B81C7 */  lwc1        $f1, -0x74F8($28)
/* 012C20 01DBE920 42100146 */  mul.s       $f1, $f2, $f1
/* 012C24 01DBE924 34000146 */  c.lt.s      $f0, $f1
/* 012C28 01DBE928 00000000 */  nop
/* 012C2C 01DBE92C 06000045 */  bc1f        .L01DBE948_2F9F48
/* 012C30 01DBE930 00000000 */   nop
/* 012C34 01DBE934 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 012C38 01DBE938 00608244 */  mtc1        $2, $f12
/* 012C3C 01DBE93C 28260072 */  paddub      $4, $16, $0
/* 012C40 01DBE940 F492040C */  jal         AddHeight__13CCameraFollowFf
/* 012C44 01DBE944 00000000 */   nop
.L01DBE948_2F9F48:
/* 012C48 01DBE948 3000BF7B */  lq          $31, 0x30($29)
/* 012C4C 01DBE94C 2000B17B */  lq          $17, 0x20($29)
/* 012C50 01DBE950 1000B07B */  lq          $16, 0x10($29)
/* 012C54 01DBE954 0800B6C7 */  lwc1        $f22, 0x8($29)
/* 012C58 01DBE958 0400B5C7 */  lwc1        $f21, 0x4($29)
/* 012C5C 01DBE95C 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 012C60 01DBE960 6000BD27 */  addiu       $29, $29, 0x60
/* 012C64 01DBE964 0800E003 */  jr          $31
/* 012C68 01DBE968 00000000 */   nop
/* 012C6C 01DBE96C 00000000 */  nop
