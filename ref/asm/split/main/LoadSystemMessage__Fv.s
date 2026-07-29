.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadSystemMessage__Fv
/* 041070 00140F70 A0FFBD27 */  addiu       $29, $29, -0x60
/* 041074 00140F74 0000BF7F */  sq          $31, 0x0($29)
/* 041078 00140F78 CD01013C */  lui         $1, %hi(SystemMesBuffer + 0x17700)
/* 04107C 00140F7C 004120AC */  sw          $0, %lo(SystemMesBuffer + 0x17700)($1)
/* 041080 00140F80 CC01023C */  lui         $2, %hi(SystemMesBuffer)
/* 041084 00140F84 00CA4424 */  addiu       $4, $2, %lo(SystemMesBuffer)
/* 041088 00140F88 E40D050C */  jal         Align64__18CDataAlloc_1_6000_Fv
/* 04108C 00140F8C 00000000 */   nop
/* 041090 00140F90 CD01013C */  lui         $1, %hi(SystemMesBuffer + 0x17700)
/* 041094 00140F94 0041228C */  lw          $2, %lo(SystemMesBuffer + 0x17700)($1)
/* 041098 00140F98 00190200 */  sll         $3, $2, 4
/* 04109C 00140F9C CC01023C */  lui         $2, %hi(SystemMesBuffer)
/* 0410A0 00140FA0 00CA4224 */  addiu       $2, $2, %lo(SystemMesBuffer)
/* 0410A4 00140FA4 21104300 */  addu        $2, $2, $3
/* 0410A8 00140FA8 388D82AF */  sw          $2, -0x72C8($28)
/* 0410AC 00140FAC 2500023C */  lui         $2, %hi(LIT_664)
/* 0410B0 00140FB0 101C4524 */  addiu       $5, $2, %lo(LIT_664)
/* 0410B4 00140FB4 1000A427 */  addiu       $4, $29, 0x10
/* 0410B8 00140FB8 04000324 */  addiu       $3, $0, 0x4
.L00140FBC:
/* 0410BC 00140FBC 0000A278 */  lq          $2, 0x0($5)
/* 0410C0 00140FC0 1000A524 */  addiu       $5, $5, 0x10
/* 0410C4 00140FC4 FFFF6324 */  addiu       $3, $3, -0x1
/* 0410C8 00140FC8 0000827C */  sq          $2, 0x0($4)
/* 0410CC 00140FCC 10008424 */  addiu       $4, $4, 0x10
/* 0410D0 00140FD0 FAFF601C */  bgtz        $3, .L00140FBC
/* 0410D4 00140FD4 00000000 */   nop
/* 0410D8 00140FD8 9886868F */  lw          $6, -0x7968($28)
/* 0410DC 00140FDC 0600C018 */  blez        $6, .L00140FF8
/* 0410E0 00140FE0 00000000 */   nop
/* 0410E4 00140FE4 1000A427 */  addiu       $4, $29, 0x10
/* 0410E8 00140FE8 2A00023C */  lui         $2, %hi(LIT_678)
/* 0410EC 00140FEC A0934524 */  addiu       $5, $2, %lo(LIT_678)
/* 0410F0 00140FF0 1614040C */  jal         sprintf
/* 0410F4 00140FF4 00000000 */   nop
.L00140FF8:
/* 0410F8 00140FF8 1000A427 */  addiu       $4, $29, 0x10
/* 0410FC 00140FFC 2A00023C */  lui         $2, %hi(LIT_679)
/* 041100 00141000 B8934524 */  addiu       $5, $2, %lo(LIT_679)
/* 041104 00141004 BC14040C */  jal         strcat
/* 041108 00141008 00000000 */   nop
/* 04110C 0014100C 1000A427 */  addiu       $4, $29, 0x10
/* 041110 00141010 388D858F */  lw          $5, -0x72C8($28)
/* 041114 00141014 5C00A627 */  addiu       $6, $29, 0x5C
/* 041118 00141018 283E0070 */  paddub      $7, $0, $0
/* 04111C 0014101C F4FC040C */  jal         LoadFile2__FPcPvPii
/* 041120 00141020 00000000 */   nop
/* 041124 00141024 07004014 */  bnez        $2, .L00141044
/* 041128 00141028 00000000 */   nop
/* 04112C 0014102C 2A00023C */  lui         $2, %hi(LIT_680)
/* 041130 00141030 C0934424 */  addiu       $4, $2, %lo(LIT_680)
/* 041134 00141034 388D858F */  lw          $5, -0x72C8($28)
/* 041138 00141038 5C00A627 */  addiu       $6, $29, 0x5C
/* 04113C 0014103C D8FC040C */  jal         LoadFile__FPcPvPi
/* 041140 00141040 00000000 */   nop
.L00141044:
/* 041144 00141044 5C00A28F */  lw          $2, 0x5C($29)
/* 041148 00141048 03110200 */  sra         $2, $2, 4
/* 04114C 0014104C 01004524 */  addiu       $5, $2, 0x1
/* 041150 00141050 CC01023C */  lui         $2, %hi(SystemMesBuffer)
/* 041154 00141054 00CA4424 */  addiu       $4, $2, %lo(SystemMesBuffer)
/* 041158 00141058 C80D050C */  jal         Alloc__18CDataAlloc_1_6000_Fi
/* 04115C 0014105C 00000000 */   nop
/* 041160 00141060 D47F050C */  jal         InitSystemMes__Fv
/* 041164 00141064 00000000 */   nop
/* 041168 00141068 0000BF7B */  lq          $31, 0x0($29)
/* 04116C 0014106C 6000BD27 */  addiu       $29, $29, 0x60
/* 041170 00141070 0800E003 */  jr          $31
/* 041174 00141074 00000000 */   nop
/* 041178 00141078 00000000 */  nop
/* 04117C 0014107C 00000000 */  nop
