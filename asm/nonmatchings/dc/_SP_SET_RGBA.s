.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SP_SET_RGBA__FP12RS_STACKDATAi
/* 93DB0 00193CB0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 93DB4 00193CB4 3000BF7F */  sq         $31, 0x30($sp)
/* 93DB8 00193CB8 2000B27F */  sq         $18, 0x20($sp)
/* 93DBC 00193CBC 1000B17F */  sq         $17, 0x10($sp)
/* 93DC0 00193CC0 0000B07F */  sq         $16, 0x0($sp)
/* 93DC4 00193CC4 288EA070 */  paddub     $17, $5, $0
/* 93DC8 00193CC8 08009224 */  addiu      $18, $4, 0x8
/* 93DCC 00193CCC D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 93DD0 00193CD0 00000000 */   nop
/* 93DD4 00193CD4 28264070 */  paddub     $4, $2, $0
/* 93DD8 00193CD8 5428060C */  jal        GetSprite__Fi
/* 93DDC 00193CDC 00000000 */   nop
/* 93DE0 00193CE0 28864070 */  paddub     $16, $2, $0
/* 93DE4 00193CE4 04000016 */  bnez       $16, .L00193CF8
/* 93DE8 00193CE8 00000000 */   nop
/* 93DEC 00193CEC 28160070 */  paddub     $2, $0, $0
/* 93DF0 00193CF0 1A000010 */  b          .L00193D5C
/* 93DF4 00193CF4 00000000 */   nop
.L00193CF8:
/* 93DF8 00193CF8 28264072 */  paddub     $4, $18, $0
/* 93DFC 00193CFC 08009224 */  addiu      $18, $4, 0x8
/* 93E00 00193D00 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 93E04 00193D04 00000000 */   nop
/* 93E08 00193D08 1C0002A6 */  sh         $2, 0x1C($16)
/* 93E0C 00193D0C 28264072 */  paddub     $4, $18, $0
/* 93E10 00193D10 08009224 */  addiu      $18, $4, 0x8
/* 93E14 00193D14 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 93E18 00193D18 00000000 */   nop
/* 93E1C 00193D1C 1E0002A6 */  sh         $2, 0x1E($16)
/* 93E20 00193D20 28264072 */  paddub     $4, $18, $0
/* 93E24 00193D24 08009224 */  addiu      $18, $4, 0x8
/* 93E28 00193D28 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 93E2C 00193D2C 00000000 */   nop
/* 93E30 00193D30 200002A6 */  sh         $2, 0x20($16)
/* 93E34 00193D34 80000224 */  addiu      $2, $0, 0x80
/* 93E38 00193D38 220002A6 */  sh         $2, 0x22($16)
/* 93E3C 00193D3C 0500212A */  slti       $at, $17, 0x5
/* 93E40 00193D40 05002014 */  bnez       $at, .L00193D58
/* 93E44 00193D44 00000000 */   nop
/* 93E48 00193D48 28264072 */  paddub     $4, $18, $0
/* 93E4C 00193D4C D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 93E50 00193D50 00000000 */   nop
/* 93E54 00193D54 220002A6 */  sh         $2, 0x22($16)
.L00193D58:
/* 93E58 00193D58 01000224 */  addiu      $2, $0, 0x1
.L00193D5C:
/* 93E5C 00193D5C 3000BF7B */  lq         $31, 0x30($sp)
/* 93E60 00193D60 2000B27B */  lq         $18, 0x20($sp)
/* 93E64 00193D64 1000B17B */  lq         $17, 0x10($sp)
/* 93E68 00193D68 0000B07B */  lq         $16, 0x0($sp)
/* 93E6C 00193D6C 4000BD27 */  addiu      $sp, $sp, 0x40
/* 93E70 00193D70 0800E003 */  jr         $31
/* 93E74 00193D74 00000000 */   nop
/* 93E78 00193D78 00000000 */  nop
/* 93E7C 00193D7C 00000000 */  nop
