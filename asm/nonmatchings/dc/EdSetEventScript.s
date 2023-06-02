.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdSetEventScript__FPcPcP14CDataAlloc2_1_
/* 96DF0 00196CF0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 96DF4 00196CF4 4000BF7F */  sq         $31, 0x40($sp)
/* 96DF8 00196CF8 3000B37F */  sq         $19, 0x30($sp)
/* 96DFC 00196CFC 2000B27F */  sq         $18, 0x20($sp)
/* 96E00 00196D00 1000B17F */  sq         $17, 0x10($sp)
/* 96E04 00196D04 0000B07F */  sq         $16, 0x0($sp)
/* 96E08 00196D08 289E8070 */  paddub     $19, $4, $0
/* 96E0C 00196D0C 2896A070 */  paddub     $18, $5, $0
/* 96E10 00196D10 288EC070 */  paddub     $17, $6, $0
/* 96E14 00196D14 05006016 */  bnez       $19, .L00196D2C
/* 96E18 00196D18 00000000 */   nop
/* 96E1C 00196D1C 189280AF */  sw         $0, -0x6DE8($gp)
/* 96E20 00196D20 28160070 */  paddub     $2, $0, $0
/* 96E24 00196D24 6C000010 */  b          .L00196ED8
/* 96E28 00196D28 00000000 */   nop
.L00196D2C:
/* 96E2C 00196D2C 01000224 */  addiu      $2, $0, 0x1
/* 96E30 00196D30 189282AF */  sw         $2, -0x6DE8($gp)
/* 96E34 00196D34 28262072 */  paddub     $4, $17, $0
/* 96E38 00196D38 40000524 */  addiu      $5, $0, 0x40
/* 96E3C 00196D3C 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* 96E40 00196D40 00000000 */   nop
/* 96E44 00196D44 28864070 */  paddub     $16, $2, $0
/* 96E48 00196D48 28262072 */  paddub     $4, $17, $0
/* 96E4C 00196D4C 80010524 */  addiu      $5, $0, 0x180
/* 96E50 00196D50 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* 96E54 00196D54 00000000 */   nop
/* 96E58 00196D58 D501033C */  lui        $3, %hi(EdEventScript)
/* 96E5C 00196D5C 30A46424 */  addiu      $4, $3, %lo(EdEventScript)
/* 96E60 00196D60 282E6072 */  paddub     $5, $19, $0
/* 96E64 00196D64 28360072 */  paddub     $6, $16, $0
/* 96E68 00196D68 80000724 */  addiu      $7, $0, 0x80
/* 96E6C 00196D6C 28464070 */  paddub     $8, $2, $0
/* 96E70 00196D70 00020924 */  addiu      $9, $0, 0x200
/* 96E74 00196D74 70F7080C */  jal        load__10CRunScriptFP14RS_PROG_HEADERP12RS_STACKDATAiP11RS_CALLDATAi
/* 96E78 00196D78 00000000 */   nop
/* 96E7C 00196D7C 03004016 */  bnez       $18, .L00196D8C
/* 96E80 00196D80 00000000 */   nop
/* 96E84 00196D84 1400628E */  lw         $2, 0x14($19)
/* 96E88 00196D88 21906202 */  addu       $18, $19, $2
.L00196D8C:
/* 96E8C 00196D8C D401013C */  lui        $at, (0x1D40000 >> 16)
/* 96E90 00196D90 D4D3248C */  lw         $4, -0x2C2C($at)
/* 96E94 00196D94 04008010 */  beqz       $4, .L00196DA8
/* 96E98 00196D98 00000000 */   nop
/* 96E9C 00196D9C 282E4072 */  paddub     $5, $18, $0
/* 96EA0 00196DA0 8036050C */  jal        SetBuff__6ClsMesFPs
/* 96EA4 00196DA4 00000000 */   nop
.L00196DA8:
/* 96EA8 00196DA8 28860070 */  paddub     $16, $0, $0
/* 96EAC 00196DAC 07000010 */  b          .L00196DCC
/* 96EB0 00196DB0 00000000 */   nop
.L00196DB4:
/* 96EB4 00196DB4 80181000 */  sll        $3, $16, 2
/* 96EB8 00196DB8 D501023C */  lui        $2, %hi(ext_func_2)
/* 96EBC 00196DBC 30A64224 */  addiu      $2, $2, %lo(ext_func_2)
/* 96EC0 00196DC0 21104300 */  addu       $2, $2, $3
/* 96EC4 00196DC4 000040AC */  sw         $0, 0x0($2)
/* 96EC8 00196DC8 01001026 */  addiu      $16, $16, 0x1
.L00196DCC:
/* 96ECC 00196DCC DC05022A */  slti       $2, $16, 0x5DC
/* 96ED0 00196DD0 F8FF4014 */  bnez       $2, .L00196DB4
/* 96ED4 00196DD4 00000000 */   nop
/* 96ED8 00196DD8 28860070 */  paddub     $16, $0, $0
.L00196DDC:
/* 96EDC 00196DDC C0301000 */  sll        $6, $16, 3
/* 96EE0 00196DE0 2700023C */  lui        $2, %hi(ext_func_info)
/* 96EE4 00196DE4 509C4224 */  addiu      $2, $2, %lo(ext_func_info)
/* 96EE8 00196DE8 21104600 */  addu       $2, $2, $6
/* 96EEC 00196DEC 0000478C */  lw         $7, 0x0($2)
/* 96EF0 00196DF0 3000E010 */  beqz       $7, .L00196EB4
/* 96EF4 00196DF4 00000000 */   nop
/* 96EF8 00196DF8 282E0070 */  paddub     $5, $0, $0
/* 96EFC 00196DFC 13000010 */  b          .L00196E4C
/* 96F00 00196E00 00000000 */   nop
.L00196E04:
/* 96F04 00196E04 2700023C */  lui        $2, %hi(ext_func_info + 0x4)
/* 96F08 00196E08 549C4224 */  addiu      $2, $2, %lo(ext_func_info + 0x4)
/* 96F0C 00196E0C 21104600 */  addu       $2, $2, $6
/* 96F10 00196E10 0000448C */  lw         $4, 0x0($2)
/* 96F14 00196E14 C0180500 */  sll        $3, $5, 3
/* 96F18 00196E18 2700023C */  lui        $2, %hi(ext_func_info + 0x4)
/* 96F1C 00196E1C 549C4224 */  addiu      $2, $2, %lo(ext_func_info + 0x4)
/* 96F20 00196E20 21104300 */  addu       $2, $2, $3
/* 96F24 00196E24 0000428C */  lw         $2, 0x0($2)
/* 96F28 00196E28 07008214 */  bne        $4, $2, .L00196E48
/* 96F2C 00196E2C 00000000 */   nop
/* 96F30 00196E30 2A00023C */  lui        $2, %hi(_2288)
/* 96F34 00196E34 40B14424 */  addiu      $4, $2, %lo(_2288)
/* 96F38 00196E38 A611040C */  jal        printf
/* 96F3C 00196E3C 00000000 */   nop
.L00196E40:
/* 96F40 00196E40 FFFF0010 */  b          .L00196E40
/* 96F44 00196E44 00000000 */   nop
.L00196E48:
/* 96F48 00196E48 0100A524 */  addiu      $5, $5, 0x1
.L00196E4C:
/* 96F4C 00196E4C 2A10B000 */  slt        $2, $5, $16
/* 96F50 00196E50 ECFF4014 */  bnez       $2, .L00196E04
/* 96F54 00196E54 00000000 */   nop
/* 96F58 00196E58 2700023C */  lui        $2, %hi(ext_func_info + 0x4)
/* 96F5C 00196E5C 549C4224 */  addiu      $2, $2, %lo(ext_func_info + 0x4)
/* 96F60 00196E60 21104600 */  addu       $2, $2, $6
/* 96F64 00196E64 0000438C */  lw         $3, 0x0($2)
/* 96F68 00196E68 04006004 */  bltz       $3, .L00196E7C
/* 96F6C 00196E6C 00000000 */   nop
/* 96F70 00196E70 DC056228 */  slti       $2, $3, 0x5DC
/* 96F74 00196E74 07004014 */  bnez       $2, .L00196E94
/* 96F78 00196E78 00000000 */   nop
.L00196E7C:
/* 96F7C 00196E7C 2A00023C */  lui        $2, %hi(_2289)
/* 96F80 00196E80 60B14424 */  addiu      $4, $2, %lo(_2289)
/* 96F84 00196E84 A611040C */  jal        printf
/* 96F88 00196E88 00000000 */   nop
/* 96F8C 00196E8C 06000010 */  b          .L00196EA8
/* 96F90 00196E90 00000000 */   nop
.L00196E94:
/* 96F94 00196E94 80180300 */  sll        $3, $3, 2
/* 96F98 00196E98 D501023C */  lui        $2, %hi(ext_func_2)
/* 96F9C 00196E9C 30A64224 */  addiu      $2, $2, %lo(ext_func_2)
/* 96FA0 00196EA0 21104300 */  addu       $2, $2, $3
/* 96FA4 00196EA4 000047AC */  sw         $7, 0x0($2)
.L00196EA8:
/* 96FA8 00196EA8 01001026 */  addiu      $16, $16, 0x1
/* 96FAC 00196EAC CBFF0010 */  b          .L00196DDC
/* 96FB0 00196EB0 00000000 */   nop
.L00196EB4:
/* 96FB4 00196EB4 D501023C */  lui        $2, %hi(EdEventScript)
/* 96FB8 00196EB8 30A44424 */  addiu      $4, $2, %lo(EdEventScript)
/* 96FBC 00196EBC D501023C */  lui        $2, %hi(ext_func_2)
/* 96FC0 00196EC0 30A64524 */  addiu      $5, $2, %lo(ext_func_2)
/* 96FC4 00196EC4 DC050624 */  addiu      $6, $0, 0x5DC
/* 96FC8 00196EC8 8CF7080C */  jal        ext_func__10CRunScriptFPPFP12RS_STACKDATAi_ii
/* 96FCC 00196ECC 00000000 */   nop
/* 96FD0 00196ED0 149280AF */  sw         $0, -0x6DEC($gp)
/* 96FD4 00196ED4 01000224 */  addiu      $2, $0, 0x1
.L00196ED8:
/* 96FD8 00196ED8 4000BF7B */  lq         $31, 0x40($sp)
/* 96FDC 00196EDC 3000B37B */  lq         $19, 0x30($sp)
/* 96FE0 00196EE0 2000B27B */  lq         $18, 0x20($sp)
/* 96FE4 00196EE4 1000B17B */  lq         $17, 0x10($sp)
/* 96FE8 00196EE8 0000B07B */  lq         $16, 0x0($sp)
/* 96FEC 00196EEC 5000BD27 */  addiu      $sp, $sp, 0x50
/* 96FF0 00196EF0 0800E003 */  jr         $31
/* 96FF4 00196EF4 00000000 */   nop
/* 96FF8 00196EF8 00000000 */  nop
/* 96FFC 00196EFC 00000000 */  nop
