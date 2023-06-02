.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel NextMoveSeq__10CActionSeqFv
/* 54E00 00154D00 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 54E04 00154D04 1000BF7F */  sq         $31, 0x10($sp)
/* 54E08 00154D08 0000B07F */  sq         $16, 0x0($sp)
/* 54E0C 00154D0C 28868070 */  paddub     $16, $4, $0
/* 54E10 00154D10 0853050C */  jal        GetNextSeq__10CActionSeqFv
/* 54E14 00154D14 00000000 */   nop
/* 54E18 00154D18 04004014 */  bnez       $2, .L00154D2C
/* 54E1C 00154D1C 00000000 */   nop
/* 54E20 00154D20 28160070 */  paddub     $2, $0, $0
/* 54E24 00154D24 0B000010 */  b          .L00154D54
/* 54E28 00154D28 00000000 */   nop
.L00154D2C:
/* 54E2C 00154D2C 0400038E */  lw         $3, 0x4($16)
/* 54E30 00154D30 02006010 */  beqz       $3, .L00154D3C
/* 54E34 00154D34 00000000 */   nop
/* 54E38 00154D38 0C0062AC */  sw         $2, 0xC($3)
.L00154D3C:
/* 54E3C 00154D3C 040002AE */  sw         $2, 0x4($16)
/* 54E40 00154D40 0C0040AC */  sw         $0, 0xC($2)
/* 54E44 00154D44 0000038E */  lw         $3, 0x0($16)
/* 54E48 00154D48 02006014 */  bnez       $3, .L00154D54
/* 54E4C 00154D4C 00000000 */   nop
/* 54E50 00154D50 000002AE */  sw         $2, 0x0($16)
.L00154D54:
/* 54E54 00154D54 1000BF7B */  lq         $31, 0x10($sp)
/* 54E58 00154D58 0000B07B */  lq         $16, 0x0($sp)
/* 54E5C 00154D5C 2000BD27 */  addiu      $sp, $sp, 0x20
/* 54E60 00154D60 0800E003 */  jr         $31
/* 54E64 00154D64 00000000 */   nop
/* 54E68 00154D68 00000000 */  nop
/* 54E6C 00154D6C 00000000 */  nop
