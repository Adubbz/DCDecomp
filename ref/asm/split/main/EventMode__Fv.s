.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel EventMode__Fv
/* 07EA70 0017E970 B0FFBD27 */  addiu       $29, $29, -0x50
/* 07EA74 0017E974 2000BF7F */  sq          $31, 0x20($29)
/* 07EA78 0017E978 1000B17F */  sq          $17, 0x10($29)
/* 07EA7C 0017E97C 0000B07F */  sq          $16, 0x0($29)
/* 07EA80 0017E980 D301023C */  lui         $2, %hi(EventCamera)
/* 07EA84 0017E984 40514424 */  addiu       $4, $2, %lo(EventCamera)
/* 07EA88 0017E988 282E0070 */  paddub      $5, $0, $0
/* 07EA8C 0017E98C B45E060C */  jal         EdEventMode__FP13CCameraFollowi
/* 07EA90 0017E990 00000000 */   nop
/* 07EA94 0017E994 CB004010 */  beqz        $2, .L0017ECC4$b
/* 07EA98 0017E998 00000000 */   nop
/* 07EA9C 0017E99C FCFF4520 */  addi        $5, $2, -0x4 /* handwritten instruction */
/* 07EAA0 0017E9A0 0800A12C */  sltiu       $1, $5, 0x8
/* 07EAA4 0017E9A4 28002010 */  beqz        $1, .L0017EA48$b
/* 07EAA8 0017E9A8 00000000 */   nop
/* 07EAAC 0017E9AC 2A00033C */  lui         $3, %hi(LIT_2340)
/* 07EAB0 0017E9B0 30AC6424 */  addiu       $4, $3, %lo(LIT_2340)
/* 07EAB4 0017E9B4 80180500 */  sll         $3, $5, 2
/* 07EAB8 0017E9B8 21186400 */  addu        $3, $3, $4
/* 07EABC 0017E9BC 0000638C */  lw          $3, 0x0($3)
/* 07EAC0 0017E9C0 08006000 */  jr          $3
/* 07EAC4 0017E9C4 00000000 */   nop
jlabel .L0017E9C8
.L0017E9C8$b:
/* 07EAC8 0017E9C8 D401023C */  lui         $2, %hi(EdEventInfo + 0x2B0)
/* 07EACC 0017E9CC 80D44424 */  addiu       $4, $2, %lo(EdEventInfo + 0x2B0)
/* 07EAD0 0017E9D0 D401013C */  lui         $1, %hi(EdEventInfo + 0x2AC)
/* 07EAD4 0017E9D4 7CD4258C */  lw          $5, %lo(EdEventInfo + 0x2AC)($1)
/* 07EAD8 0017E9D8 28360070 */  paddub      $6, $0, $0
/* 07EADC 0017E9DC 283E0070 */  paddub      $7, $0, $0
/* 07EAE0 0017E9E0 D401013C */  lui         $1, %hi(EdEventInfo + 0x2D0)
/* 07EAE4 0017E9E4 A0D4288C */  lw          $8, %lo(EdEventInfo + 0x2D0)($1)
/* 07EAE8 0017E9E8 78FB050C */  jal         GotoInterior__FPciiP14ED_EVENT_PARAMi
/* 07EAEC 0017E9EC 00000000 */   nop
/* 07EAF0 0017E9F0 B4000010 */  b           .L0017ECC4$b
/* 07EAF4 0017E9F4 00000000 */   nop
jlabel .L0017E9F8
.L0017E9F8$b:
/* 07EAF8 0017E9F8 38FB050C */  jal         GotoDungeon__Fv
/* 07EAFC 0017E9FC 00000000 */   nop
/* 07EB00 0017EA00 B0000010 */  b           .L0017ECC4$b
/* 07EB04 0017EA04 00000000 */   nop
jlabel .L0017EA08
.L0017EA08$b:
/* 07EB08 0017EA08 44E0050C */  jal         EdExitLoop__Fv
/* 07EB0C 0017EA0C 00000000 */   nop
/* 07EB10 0017EA10 AC000010 */  b           .L0017ECC4$b
/* 07EB14 0017EA14 00000000 */   nop
jlabel .L0017EA18
.L0017EA18$b:
/* 07EB18 0017EA18 44E0050C */  jal         EdExitLoop__Fv
/* 07EB1C 0017EA1C 00000000 */   nop
/* 07EB20 0017EA20 A8000010 */  b           .L0017ECC4$b
/* 07EB24 0017EA24 00000000 */   nop
jlabel .L0017EA28
.L0017EA28$b:
/* 07EB28 0017EA28 02000324 */  addiu       $3, $0, 0x2
/* 07EB2C 0017EA2C 608783AF */  sw          $3, -0x78A0($28)
/* 07EB30 0017EA30 A4000010 */  b           .L0017ECC4$b
/* 07EB34 0017EA34 00000000 */   nop
jlabel .L0017EA38
.L0017EA38$b:
/* 07EB38 0017EA38 10000324 */  addiu       $3, $0, 0x10
/* 07EB3C 0017EA3C 608783AF */  sw          $3, -0x78A0($28)
/* 07EB40 0017EA40 A0000010 */  b           .L0017ECC4$b
/* 07EB44 0017EA44 00000000 */   nop
jlabel .L0017EA48
.L0017EA48$b:
/* 07EB48 0017EA48 01000324 */  addiu       $3, $0, 0x1
/* 07EB4C 0017EA4C 608783AF */  sw          $3, -0x78A0($28)
/* 07EB50 0017EA50 D401013C */  lui         $1, %hi(EdEventInfo + 0x44)
/* 07EB54 0017EA54 14D2238C */  lw          $3, %lo(EdEventInfo + 0x44)($1)
/* 07EB58 0017EA58 33006018 */  blez        $3, .L0017EB28
/* 07EB5C 0017EA5C 00000000 */   nop
/* 07EB60 0017EA60 6487848F */  lw          $4, -0x789C($28)
/* 07EB64 0017EA64 3000A527 */  addiu       $5, $29, 0x30
/* 07EB68 0017EA68 A000998C */  lw          $25, 0xA0($4)
/* 07EB6C 0017EA6C A000398F */  lw          $25, 0xA0($25)
/* 07EB70 0017EA70 09F82003 */  jalr        $25
/* 07EB74 0017EA74 00000000 */   nop
/* 07EB78 0017EA78 6487848F */  lw          $4, -0x789C($28)
/* 07EB7C 0017EA7C 4000A527 */  addiu       $5, $29, 0x40
/* 07EB80 0017EA80 A000998C */  lw          $25, 0xA0($4)
/* 07EB84 0017EA84 5800398F */  lw          $25, 0x58($25)
/* 07EB88 0017EA88 09F82003 */  jalr        $25
/* 07EB8C 0017EA8C 00000000 */   nop
/* 07EB90 0017EA90 D301023C */  lui         $2, %hi(MainCamera)
/* 07EB94 0017EA94 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 07EB98 0017EA98 C092040C */  jal         FollowOn__13CCameraFollowFv
/* 07EB9C 0017EA9C 00000000 */   nop
/* 07EBA0 0017EAA0 4400A1C7 */  lwc1        $f1, 0x44($29)
/* 07EBA4 0017EAA4 D401013C */  lui         $1, %hi(EdEventInfo + 0x48)
/* 07EBA8 0017EAA8 18D220C4 */  lwc1        $f0, %lo(EdEventInfo + 0x48)($1)
/* 07EBAC 0017EAAC 000B0046 */  add.s       $f12, $f1, $f0
/* 07EBB0 0017EAB0 F88E040C */  jal         AngleLimit__Ff
/* 07EBB4 0017EAB4 00000000 */   nop
/* 07EBB8 0017EAB8 06030046 */  mov.s       $f12, $f0
/* 07EBBC 0017EABC D301023C */  lui         $2, %hi(MainCamera)
/* 07EBC0 0017EAC0 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 07EBC4 0017EAC4 CC92040C */  jal         SetAngleSoon__13CCameraFollowFf
/* 07EBC8 0017EAC8 00000000 */   nop
/* 07EBCC 0017EACC 6487828F */  lw          $2, -0x789C($28)
/* 07EBD0 0017EAD0 B40041C4 */  lwc1        $f1, 0xB4($2)
/* 07EBD4 0017EAD4 3400A0C7 */  lwc1        $f0, 0x34($29)
/* 07EBD8 0017EAD8 40000146 */  add.s       $f1, $f0, $f1
/* 07EBDC 0017EADC 4040023C */  lui         $2, (0x40400000 >> 16)
/* 07EBE0 0017EAE0 00008244 */  mtc1        $2, $f0
/* 07EBE4 0017EAE4 00000000 */  nop
/* 07EBE8 0017EAE8 410B0046 */  sub.s       $f13, $f1, $f0
/* 07EBEC 0017EAEC D301023C */  lui         $2, %hi(MainCamera)
/* 07EBF0 0017EAF0 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 07EBF4 0017EAF4 3000ACC7 */  lwc1        $f12, 0x30($29)
/* 07EBF8 0017EAF8 3800AEC7 */  lwc1        $f14, 0x38($29)
/* 07EBFC 0017EAFC B892040C */  jal         SetFollow__13CCameraFollowFfff
/* 07EC00 0017EB00 00000000 */   nop
/* 07EC04 0017EB04 D301023C */  lui         $2, %hi(MainCamera)
/* 07EC08 0017EB08 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 07EC0C 0017EB0C E0A7050C */  jal         EdInitCameraParam__FP13CCameraFollow
/* 07EC10 0017EB10 00000000 */   nop
/* 07EC14 0017EB14 D301023C */  lui         $2, %hi(MainCamera)
/* 07EC18 0017EB18 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 07EC1C 0017EB1C FFFF0524 */  addiu       $5, $0, -0x1
/* 07EC20 0017EB20 F491040C */  jal         Step__13CCameraFollowFi
/* 07EC24 0017EB24 00000000 */   nop
.L0017EB28:
/* 07EC28 0017EB28 D401013C */  lui         $1, %hi(EdEventInfo + 0x44)
/* 07EC2C 0017EB2C 14D2238C */  lw          $3, %lo(EdEventInfo + 0x44)($1)
/* 07EC30 0017EB30 58006104 */  bgez        $3, .L0017EC94
/* 07EC34 0017EB34 00000000 */   nop
/* 07EC38 0017EB38 D301023C */  lui         $2, %hi(EventCamera)
/* 07EC3C 0017EB3C 40514424 */  addiu       $4, $2, %lo(EventCamera)
/* 07EC40 0017EB40 3000A527 */  addiu       $5, $29, 0x30
/* 07EC44 0017EB44 9C91040C */  jal         GetPos__7CCameraFPf
/* 07EC48 0017EB48 00000000 */   nop
/* 07EC4C 0017EB4C D301023C */  lui         $2, %hi(EventCamera)
/* 07EC50 0017EB50 40514424 */  addiu       $4, $2, %lo(EventCamera)
/* 07EC54 0017EB54 4000A527 */  addiu       $5, $29, 0x40
/* 07EC58 0017EB58 A891040C */  jal         GetRef__7CCameraFPf
/* 07EC5C 0017EB5C 00000000 */   nop
/* 07EC60 0017EB60 D301023C */  lui         $2, %hi(MainCamera)
/* 07EC64 0017EB64 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 07EC68 0017EB68 C492040C */  jal         FollowOff__13CCameraFollowFv
/* 07EC6C 0017EB6C 00000000 */   nop
/* 07EC70 0017EB70 D301023C */  lui         $2, %hi(MainCamera)
/* 07EC74 0017EB74 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 07EC78 0017EB78 3000A527 */  addiu       $5, $29, 0x30
/* 07EC7C 0017EB7C A490040C */  jal         SetPos__7CCameraFPf
/* 07EC80 0017EB80 00000000 */   nop
/* 07EC84 0017EB84 D301023C */  lui         $2, %hi(MainCamera)
/* 07EC88 0017EB88 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 07EC8C 0017EB8C 4000A527 */  addiu       $5, $29, 0x40
/* 07EC90 0017EB90 C490040C */  jal         SetRef__7CCameraFPf
/* 07EC94 0017EB94 00000000 */   nop
/* 07EC98 0017EB98 D301023C */  lui         $2, %hi(MainCamera)
/* 07EC9C 0017EB9C 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 07ECA0 0017EBA0 FFFF0524 */  addiu       $5, $0, -0x1
/* 07ECA4 0017EBA4 F491040C */  jal         Step__13CCameraFollowFi
/* 07ECA8 0017EBA8 00000000 */   nop
/* 07ECAC 0017EBAC D301023C */  lui         $2, %hi(MainCamera)
/* 07ECB0 0017EBB0 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 07ECB4 0017EBB4 01000524 */  addiu       $5, $0, 0x1
/* 07ECB8 0017EBB8 F491040C */  jal         Step__13CCameraFollowFi
/* 07ECBC 0017EBBC 00000000 */   nop
/* 07ECC0 0017EBC0 D301023C */  lui         $2, %hi(MainCamera)
/* 07ECC4 0017EBC4 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 07ECC8 0017EBC8 C092040C */  jal         FollowOn__13CCameraFollowFv
/* 07ECCC 0017EBCC 00000000 */   nop
/* 07ECD0 0017EBD0 3400A1C7 */  lwc1        $f1, 0x34($29)
/* 07ECD4 0017EBD4 4400B027 */  addiu       $16, $29, 0x44
/* 07ECD8 0017EBD8 000000C6 */  lwc1        $f0, 0x0($16)
/* 07ECDC 0017EBDC 010B0046 */  sub.s       $f12, $f1, $f0
/* 07ECE0 0017EBE0 D301023C */  lui         $2, %hi(MainCamera)
/* 07ECE4 0017EBE4 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 07ECE8 0017EBE8 EC92040C */  jal         SetHeight__13CCameraFollowFf
/* 07ECEC 0017EBEC 00000000 */   nop
/* 07ECF0 0017EBF0 4800B127 */  addiu       $17, $29, 0x48
/* 07ECF4 0017EBF4 D301023C */  lui         $2, %hi(MainCamera)
/* 07ECF8 0017EBF8 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 07ECFC 0017EBFC 4000ACC7 */  lwc1        $f12, 0x40($29)
/* 07ED00 0017EC00 00000DC6 */  lwc1        $f13, 0x0($16)
/* 07ED04 0017EC04 00002EC6 */  lwc1        $f14, 0x0($17)
/* 07ED08 0017EC08 B892040C */  jal         SetFollow__13CCameraFollowFfff
/* 07ED0C 0017EC0C 00000000 */   nop
/* 07ED10 0017EC10 3000A1C7 */  lwc1        $f1, 0x30($29)
/* 07ED14 0017EC14 4000A0C7 */  lwc1        $f0, 0x40($29)
/* 07ED18 0017EC18 010B0046 */  sub.s       $f12, $f1, $f0
/* 07ED1C 0017EC1C 9044040C */  jal         fptodp
/* 07ED20 0017EC20 00000000 */   nop
/* 07ED24 0017EC24 28864070 */  paddub      $16, $2, $0
/* 07ED28 0017EC28 3800A1C7 */  lwc1        $f1, 0x38($29)
/* 07ED2C 0017EC2C 000020C6 */  lwc1        $f0, 0x0($17)
/* 07ED30 0017EC30 010B0046 */  sub.s       $f12, $f1, $f0
/* 07ED34 0017EC34 9044040C */  jal         fptodp
/* 07ED38 0017EC38 00000000 */   nop
/* 07ED3C 0017EC3C 28260072 */  paddub      $4, $16, $0
/* 07ED40 0017EC40 282E4070 */  paddub      $5, $2, $0
/* 07ED44 0017EC44 8676040C */  jal         atan2
/* 07ED48 0017EC48 00000000 */   nop
/* 07ED4C 0017EC4C 28264070 */  paddub      $4, $2, $0
/* 07ED50 0017EC50 9241040C */  jal         dptofp
/* 07ED54 0017EC54 00000000 */   nop
/* 07ED58 0017EC58 D301023C */  lui         $2, %hi(MainCamera)
/* 07ED5C 0017EC5C 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 07ED60 0017EC60 06030046 */  mov.s       $f12, $f0
/* 07ED64 0017EC64 CC92040C */  jal         SetAngleSoon__13CCameraFollowFf
/* 07ED68 0017EC68 00000000 */   nop
/* 07ED6C 0017EC6C D301023C */  lui         $2, %hi(MainCamera)
/* 07ED70 0017EC70 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 07ED74 0017EC74 FFFF0524 */  addiu       $5, $0, -0x1
/* 07ED78 0017EC78 F491040C */  jal         Step__13CCameraFollowFi
/* 07ED7C 0017EC7C 00000000 */   nop
/* 07ED80 0017EC80 D301023C */  lui         $2, %hi(MainCamera)
/* 07ED84 0017EC84 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 07ED88 0017EC88 01000524 */  addiu       $5, $0, 0x1
/* 07ED8C 0017EC8C F491040C */  jal         Step__13CCameraFollowFi
/* 07ED90 0017EC90 00000000 */   nop
.L0017EC94:
/* 07ED94 0017EC94 D401013C */  lui         $1, %hi(EdEventInfo + 0x440)
/* 07ED98 0017EC98 10D6248C */  lw          $4, %lo(EdEventInfo + 0x440)($1)
/* 07ED9C 0017EC9C 04008004 */  bltz        $4, .L0017ECB0
/* 07EDA0 0017ECA0 00000000 */   nop
/* 07EDA4 0017ECA4 282E0070 */  paddub      $5, $0, $0
/* 07EDA8 0017ECA8 DCDE050C */  jal         FadeOutToEvent__Fii
/* 07EDAC 0017ECAC 00000000 */   nop
.L0017ECB0:
/* 07EDB0 0017ECB0 E890848F */  lw          $4, -0x6F18($28)
/* 07EDB4 0017ECB4 80BF033C */  lui         $3, (0xBF800000 >> 16)
/* 07EDB8 0017ECB8 0100013C */  lui         $1, (0x15F2C >> 16)
/* 07EDBC 0017ECBC 21088100 */  addu        $1, $4, $1
/* 07EDC0 0017ECC0 2C5F23AC */  sw          $3, (0x15F2C & 0xFFFF)($1)
jlabel .L0017ECC4
.L0017ECC4$b:
/* 07EDC4 0017ECC4 2000BF7B */  lq          $31, 0x20($29)
/* 07EDC8 0017ECC8 1000B17B */  lq          $17, 0x10($29)
/* 07EDCC 0017ECCC 0000B07B */  lq          $16, 0x0($29)
/* 07EDD0 0017ECD0 5000BD27 */  addiu       $29, $29, 0x50
/* 07EDD4 0017ECD4 0800E003 */  jr          $31
/* 07EDD8 0017ECD8 00000000 */   nop
/* 07EDDC 0017ECDC 00000000 */  nop
