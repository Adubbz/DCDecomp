.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __ct__5CLogoFv
/* 028100 01DD3E00 281E0070 */  paddub      $3, $0, $0
/* 028104 01DD3E04 05000010 */  b           .L01DD3E1C_2D961C
/* 028108 01DD3E08 00000000 */   nop
.L01DD3E0C_2D960C:
/* 02810C 01DD3E0C 80100300 */  sll         $2, $3, 2
/* 028110 01DD3E10 21108200 */  addu        $2, $4, $2
/* 028114 01DD3E14 000040AC */  sw          $0, 0x0($2)
/* 028118 01DD3E18 01006324 */  addiu       $3, $3, 0x1
.L01DD3E1C_2D961C:
/* 02811C 01DD3E1C 09006228 */  slti        $2, $3, 0x9
/* 028120 01DD3E20 FAFF4014 */  bnez        $2, .L01DD3E0C_2D960C
/* 028124 01DD3E24 00000000 */   nop
/* 028128 01DD3E28 480080AC */  sw          $0, 0x48($4)
/* 02812C 01DD3E2C 4C0080AC */  sw          $0, 0x4C($4)
/* 028130 01DD3E30 28168070 */  paddub      $2, $4, $0
/* 028134 01DD3E34 0800E003 */  jr          $31
/* 028138 01DD3E38 00000000 */   nop
/* 02813C 01DD3E3C 00000000 */  nop
