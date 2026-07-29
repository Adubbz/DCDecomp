.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FadeOut__5CLogoFv
/* 028280 01DD3F80 282E0070 */  paddub      $5, $0, $0
/* 028284 01DD3F84 09000010 */  b           .L01DD3FAC_2D97AC
/* 028288 01DD3F88 00000000 */   nop
.L01DD3F8C_2D978C:
/* 02828C 01DD3F8C 80180500 */  sll         $3, $5, 2
/* 028290 01DD3F90 21308300 */  addu        $6, $4, $3
/* 028294 01DD3F94 0000C38C */  lw          $3, 0x0($6)
/* 028298 01DD3F98 03006018 */  blez        $3, .L01DD3FA8_2D97A8
/* 02829C 01DD3F9C 00000000 */   nop
/* 0282A0 01DD3FA0 FCFF6324 */  addiu       $3, $3, -0x4
/* 0282A4 01DD3FA4 0000C3AC */  sw          $3, 0x0($6)
.L01DD3FA8_2D97A8:
/* 0282A8 01DD3FA8 0100A524 */  addiu       $5, $5, 0x1
.L01DD3FAC_2D97AC:
/* 0282AC 01DD3FAC 0900A328 */  slti        $3, $5, 0x9
/* 0282B0 01DD3FB0 F6FF6014 */  bnez        $3, .L01DD3F8C_2D978C
/* 0282B4 01DD3FB4 00000000 */   nop
/* 0282B8 01DD3FB8 0800E003 */  jr          $31
/* 0282BC 01DD3FBC 00000000 */   nop
