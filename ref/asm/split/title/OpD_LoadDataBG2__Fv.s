.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel OpD_LoadDataBG2__Fv
/* 018400 01DC4100 E0FFBD27 */  addiu       $29, $29, -0x20
/* 018404 01DC4104 0000BF7F */  sq          $31, 0x0($29)
.L01DC4108_2C9908:
/* 018408 01DC4108 8CFB040C */  jal         ReadBGSync__Fv
/* 01840C 01DC410C 00000000 */   nop
/* 018410 01DC4110 FDFF4014 */  bnez        $2, .L01DC4108_2C9908
/* 018414 01DC4114 00000000 */   nop
/* 018418 01DC4118 948B858F */  lw          $5, -0x746C($28)
/* 01841C 01DC411C DE01023C */  lui         $2, %hi(LIT_371__7)
/* 018420 01DC4120 60FA4424 */  addiu       $4, $2, %lo(LIT_371__7)
/* 018424 01DC4124 1C00A627 */  addiu       $6, $29, 0x1C
/* 018428 01DC4128 ACFA040C */  jal         LoadFileBG__FPcP1Pi
/* 01842C 01DC412C 00000000 */   nop
/* 018430 01DC4130 1C00A28F */  lw          $2, 0x1C($29)
/* 018434 01DC4134 03110200 */  sra         $2, $2, 4
/* 018438 01DC4138 00190200 */  sll         $3, $2, 4
/* 01843C 01DC413C 948B828F */  lw          $2, -0x746C($28)
/* 018440 01DC4140 21104300 */  addu        $2, $2, $3
/* 018444 01DC4144 10004524 */  addiu       $5, $2, 0x10
/* 018448 01DC4148 28260070 */  paddub      $4, $0, $0
/* 01844C 01DC414C 28360070 */  paddub      $6, $0, $0
/* 018450 01DC4150 7C66050C */  jal         SndBgmLoadBG__FiPUiPi
/* 018454 01DC4154 00000000 */   nop
/* 018458 01DC4158 FFFF0324 */  addiu       $3, $0, -0x1
/* 01845C 01DC415C DE01013C */  lui         $1, %hi(CScript__2 + 0x1C)
/* 018460 01DC4160 1C1B23AC */  sw          $3, %lo(CScript__2 + 0x1C)($1)
/* 018464 01DC4164 0000BF7B */  lq          $31, 0x0($29)
/* 018468 01DC4168 2000BD27 */  addiu       $29, $29, 0x20
/* 01846C 01DC416C 0800E003 */  jr          $31
/* 018470 01DC4170 00000000 */   nop
/* 018474 01DC4174 00000000 */  nop
/* 018478 01DC4178 00000000 */  nop
/* 01847C 01DC417C 00000000 */  nop
