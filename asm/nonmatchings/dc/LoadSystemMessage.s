.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadSystemMessage__Fv
/* 41070 00140F70 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 41074 00140F74 0000BF7F */  sq         $31, 0x0($sp)
/* 41078 00140F78 CD01013C */  lui        $at, (0x1CD4100 >> 16)
/* 4107C 00140F7C 004120AC */  sw         $0, (0x1CD4100 & 0xFFFF)($at)
/* 41080 00140F80 CC01023C */  lui        $2, %hi(SystemMesBuffer)
/* 41084 00140F84 00CA4424 */  addiu      $4, $2, %lo(SystemMesBuffer)
/* 41088 00140F88 E40D050C */  jal        Align64__18CDataAlloc_1_6000_Fv
/* 4108C 00140F8C 00000000 */   nop
/* 41090 00140F90 CD01013C */  lui        $at, (0x1CD4100 >> 16)
/* 41094 00140F94 0041228C */  lw         $2, (0x1CD4100 & 0xFFFF)($at)
/* 41098 00140F98 00190200 */  sll        $3, $2, 4
/* 4109C 00140F9C CC01023C */  lui        $2, %hi(SystemMesBuffer)
/* 410A0 00140FA0 00CA4224 */  addiu      $2, $2, %lo(SystemMesBuffer)
/* 410A4 00140FA4 21104300 */  addu       $2, $2, $3
/* 410A8 00140FA8 388D82AF */  sw         $2, -0x72C8($gp)
/* 410AC 00140FAC 2500023C */  lui        $2, %hi(_664)
/* 410B0 00140FB0 101C4524 */  addiu      $5, $2, %lo(_664)
/* 410B4 00140FB4 1000A427 */  addiu      $4, $sp, 0x10
/* 410B8 00140FB8 04000324 */  addiu      $3, $0, 0x4
.L00140FBC:
/* 410BC 00140FBC 0000A278 */  lq         $2, 0x0($5)
/* 410C0 00140FC0 1000A524 */  addiu      $5, $5, 0x10
/* 410C4 00140FC4 FFFF6324 */  addiu      $3, $3, -0x1
/* 410C8 00140FC8 0000827C */  sq         $2, 0x0($4)
/* 410CC 00140FCC 10008424 */  addiu      $4, $4, 0x10
/* 410D0 00140FD0 FAFF601C */  bgtz       $3, .L00140FBC
/* 410D4 00140FD4 00000000 */   nop
/* 410D8 00140FD8 9886868F */  lw         $6, -0x7968($gp)
/* 410DC 00140FDC 0600C018 */  blez       $6, .L00140FF8
/* 410E0 00140FE0 00000000 */   nop
/* 410E4 00140FE4 1000A427 */  addiu      $4, $sp, 0x10
/* 410E8 00140FE8 2A00023C */  lui        $2, %hi(_678)
/* 410EC 00140FEC A0934524 */  addiu      $5, $2, %lo(_678)
/* 410F0 00140FF0 1614040C */  jal        sprintf
/* 410F4 00140FF4 00000000 */   nop
.L00140FF8:
/* 410F8 00140FF8 1000A427 */  addiu      $4, $sp, 0x10
/* 410FC 00140FFC 2A00023C */  lui        $2, %hi(_679)
/* 41100 00141000 B8934524 */  addiu      $5, $2, %lo(_679)
/* 41104 00141004 BC14040C */  jal        strcat
/* 41108 00141008 00000000 */   nop
/* 4110C 0014100C 1000A427 */  addiu      $4, $sp, 0x10
/* 41110 00141010 388D858F */  lw         $5, -0x72C8($gp)
/* 41114 00141014 5C00A627 */  addiu      $6, $sp, 0x5C
/* 41118 00141018 283E0070 */  paddub     $7, $0, $0
/* 4111C 0014101C F4FC040C */  jal        LoadFile2__FPcPvPii
/* 41120 00141020 00000000 */   nop
/* 41124 00141024 07004014 */  bnez       $2, .L00141044
/* 41128 00141028 00000000 */   nop
/* 4112C 0014102C 2A00023C */  lui        $2, %hi(_680)
/* 41130 00141030 C0934424 */  addiu      $4, $2, %lo(_680)
/* 41134 00141034 388D858F */  lw         $5, -0x72C8($gp)
/* 41138 00141038 5C00A627 */  addiu      $6, $sp, 0x5C
/* 4113C 0014103C D8FC040C */  jal        LoadFile__FPcPvPi
/* 41140 00141040 00000000 */   nop
.L00141044:
/* 41144 00141044 5C00A28F */  lw         $2, 0x5C($sp)
/* 41148 00141048 03110200 */  sra        $2, $2, 4
/* 4114C 0014104C 01004524 */  addiu      $5, $2, 0x1
/* 41150 00141050 CC01023C */  lui        $2, %hi(SystemMesBuffer)
/* 41154 00141054 00CA4424 */  addiu      $4, $2, %lo(SystemMesBuffer)
/* 41158 00141058 C80D050C */  jal        Alloc__18CDataAlloc_1_6000_Fi
/* 4115C 0014105C 00000000 */   nop
/* 41160 00141060 D47F050C */  jal        InitSystemMes__Fv
/* 41164 00141064 00000000 */   nop
/* 41168 00141068 0000BF7B */  lq         $31, 0x0($sp)
/* 4116C 0014106C 6000BD27 */  addiu      $sp, $sp, 0x60
/* 41170 00141070 0800E003 */  jr         $31
/* 41174 00141074 00000000 */   nop
/* 41178 00141078 00000000 */  nop
/* 4117C 0014107C 00000000 */  nop
