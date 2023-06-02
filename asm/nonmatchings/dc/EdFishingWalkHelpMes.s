.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdFishingWalkHelpMes__Fi
/* 73AB0 001739B0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 73AB4 001739B4 0000BF7F */  sq         $31, 0x0($sp)
/* 73AB8 001739B8 848F80AF */  sw         $0, -0x707C($gp)
/* 73ABC 001739BC 888F80AF */  sw         $0, -0x7078($gp)
/* 73AC0 001739C0 2600023C */  lui        $2, %hi(_650_2)
/* 73AC4 001739C4 A06F4224 */  addiu      $2, $2, %lo(_650_2)
/* 73AC8 001739C8 1000A327 */  addiu      $3, $sp, 0x10
/* 73ACC 001739CC 00004278 */  lq         $2, 0x0($2)
/* 73AD0 001739D0 0000627C */  sq         $2, 0x0($3)
/* 73AD4 001739D4 64008224 */  addiu      $2, $4, 0x64
/* 73AD8 001739D8 1000A2AF */  sw         $2, 0x10($sp)
/* 73ADC 001739DC C8000224 */  addiu      $2, $0, 0xC8
/* 73AE0 001739E0 02008004 */  bltz       $4, .L001739EC
/* 73AE4 001739E4 00000000 */   nop
/* 73AE8 001739E8 01004224 */  addiu      $2, $2, 0x1
.L001739EC:
/* 73AEC 001739EC 28264070 */  paddub     $4, $2, $0
/* 73AF0 001739F0 02000524 */  addiu      $5, $0, 0x2
/* 73AF4 001739F4 09000624 */  addiu      $6, $0, 0x9
/* 73AF8 001739F8 1000A727 */  addiu      $7, $sp, 0x10
/* 73AFC 001739FC FFFF0824 */  addiu      $8, $0, -0x1
/* 73B00 00173A00 28CD050C */  jal        EdSetHelpMes__FiiiPii
/* 73B04 00173A04 00000000 */   nop
/* 73B08 00173A08 0000BF7B */  lq         $31, 0x0($sp)
/* 73B0C 00173A0C 2000BD27 */  addiu      $sp, $sp, 0x20
/* 73B10 00173A10 0800E003 */  jr         $31
/* 73B14 00173A14 00000000 */   nop
/* 73B18 00173A18 00000000 */  nop
/* 73B1C 00173A1C 00000000 */  nop
