.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SP_SET_RGBA__FP12RS_STACKDATAi
/* 093DB0 00193CB0 C0FFBD27 */  addiu       $29, $29, -0x40
/* 093DB4 00193CB4 3000BF7F */  sq          $31, 0x30($29)
/* 093DB8 00193CB8 2000B27F */  sq          $18, 0x20($29)
/* 093DBC 00193CBC 1000B17F */  sq          $17, 0x10($29)
/* 093DC0 00193CC0 0000B07F */  sq          $16, 0x0($29)
/* 093DC4 00193CC4 288EA070 */  paddub      $17, $5, $0
/* 093DC8 00193CC8 08009224 */  addiu       $18, $4, 0x8
/* 093DCC 00193CCC D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 093DD0 00193CD0 00000000 */   nop
/* 093DD4 00193CD4 28264070 */  paddub      $4, $2, $0
/* 093DD8 00193CD8 5428060C */  jal         GetSprite__Fi
/* 093DDC 00193CDC 00000000 */   nop
/* 093DE0 00193CE0 28864070 */  paddub      $16, $2, $0
/* 093DE4 00193CE4 04000016 */  bnez        $16, .L00193CF8
/* 093DE8 00193CE8 00000000 */   nop
/* 093DEC 00193CEC 28160070 */  paddub      $2, $0, $0
/* 093DF0 00193CF0 1A000010 */  b           .L00193D5C
/* 093DF4 00193CF4 00000000 */   nop
.L00193CF8:
/* 093DF8 00193CF8 28264072 */  paddub      $4, $18, $0
/* 093DFC 00193CFC 08009224 */  addiu       $18, $4, 0x8
/* 093E00 00193D00 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 093E04 00193D04 00000000 */   nop
/* 093E08 00193D08 1C0002A6 */  sh          $2, 0x1C($16)
/* 093E0C 00193D0C 28264072 */  paddub      $4, $18, $0
/* 093E10 00193D10 08009224 */  addiu       $18, $4, 0x8
/* 093E14 00193D14 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 093E18 00193D18 00000000 */   nop
/* 093E1C 00193D1C 1E0002A6 */  sh          $2, 0x1E($16)
/* 093E20 00193D20 28264072 */  paddub      $4, $18, $0
/* 093E24 00193D24 08009224 */  addiu       $18, $4, 0x8
/* 093E28 00193D28 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 093E2C 00193D2C 00000000 */   nop
/* 093E30 00193D30 200002A6 */  sh          $2, 0x20($16)
/* 093E34 00193D34 80000224 */  addiu       $2, $0, 0x80
/* 093E38 00193D38 220002A6 */  sh          $2, 0x22($16)
/* 093E3C 00193D3C 0500212A */  slti        $1, $17, 0x5
/* 093E40 00193D40 05002014 */  bnez        $1, .L00193D58
/* 093E44 00193D44 00000000 */   nop
/* 093E48 00193D48 28264072 */  paddub      $4, $18, $0
/* 093E4C 00193D4C D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 093E50 00193D50 00000000 */   nop
/* 093E54 00193D54 220002A6 */  sh          $2, 0x22($16)
.L00193D58:
/* 093E58 00193D58 01000224 */  addiu       $2, $0, 0x1
.L00193D5C:
/* 093E5C 00193D5C 3000BF7B */  lq          $31, 0x30($29)
/* 093E60 00193D60 2000B27B */  lq          $18, 0x20($29)
/* 093E64 00193D64 1000B17B */  lq          $17, 0x10($29)
/* 093E68 00193D68 0000B07B */  lq          $16, 0x0($29)
/* 093E6C 00193D6C 4000BD27 */  addiu       $29, $29, 0x40
/* 093E70 00193D70 0800E003 */  jr          $31
/* 093E74 00193D74 00000000 */   nop
/* 093E78 00193D78 00000000 */  nop
/* 093E7C 00193D7C 00000000 */  nop
