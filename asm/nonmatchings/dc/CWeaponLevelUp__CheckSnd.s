.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckSnd__14CWeaponLevelUpFv
/* 137090 00236F90 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 137094 00236F94 1000BF7F */  sq         $31, 0x10($sp)
/* 137098 00236F98 0000B07F */  sq         $16, 0x0($sp)
/* 13709C 00236F9C 28868070 */  paddub     $16, $4, $0
/* 1370A0 00236FA0 2A00023C */  lui        $2, %hi(_1062_2)
/* 1370A4 00236FA4 28F44424 */  addiu      $4, $2, %lo(_1062_2)
/* 1370A8 00236FA8 A611040C */  jal        printf
/* 1370AC 00236FAC 00000000 */   nop
/* 1370B0 00236FB0 18130286 */  lh         $2, 0x1318($16)
/* 1370B4 00236FB4 0400401C */  bgtz       $2, .L00236FC8
/* 1370B8 00236FB8 00000000 */   nop
/* 1370BC 00236FBC 1C130286 */  lh         $2, 0x131C($16)
/* 1370C0 00236FC0 09004010 */  beqz       $2, .L00236FE8
/* 1370C4 00236FC4 00000000 */   nop
.L00236FC8:
/* 1370C8 00236FC8 7867050C */  jal        SndGetBgmVol__Fv
/* 1370CC 00236FCC 00000000 */   nop
/* 1370D0 00236FD0 16130386 */  lh         $3, 0x1316($16)
/* 1370D4 00236FD4 04004310 */  beq        $2, $3, .L00236FE8
/* 1370D8 00236FD8 00000000 */   nop
/* 1370DC 00236FDC 28264070 */  paddub     $4, $2, $0
/* 1370E0 00236FE0 4867050C */  jal        SndSetBgmVol__Fi
/* 1370E4 00236FE4 00000000 */   nop
.L00236FE8:
/* 1370E8 00236FE8 28260072 */  paddub     $4, $16, $0
/* 1370EC 00236FEC A4DB080C */  jal        InitSnd__14CWeaponLevelUpFv
/* 1370F0 00236FF0 00000000 */   nop
/* 1370F4 00236FF4 1000BF7B */  lq         $31, 0x10($sp)
/* 1370F8 00236FF8 0000B07B */  lq         $16, 0x0($sp)
/* 1370FC 00236FFC 2000BD27 */  addiu      $sp, $sp, 0x20
/* 137100 00237000 0800E003 */  jr         $31
/* 137104 00237004 00000000 */   nop
/* 137108 00237008 00000000 */  nop
/* 13710C 0023700C 00000000 */  nop
