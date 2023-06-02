.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel NextAnimeSeq__10CActionSeqFv
/* 54EE0 00154DE0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 54EE4 00154DE4 1000BF7F */  sq         $31, 0x10($sp)
/* 54EE8 00154DE8 0000B07F */  sq         $16, 0x0($sp)
/* 54EEC 00154DEC 28868070 */  paddub     $16, $4, $0
/* 54EF0 00154DF0 0853050C */  jal        GetNextSeq__10CActionSeqFv
/* 54EF4 00154DF4 00000000 */   nop
/* 54EF8 00154DF8 04004014 */  bnez       $2, .L00154E0C
/* 54EFC 00154DFC 00000000 */   nop
/* 54F00 00154E00 28160070 */  paddub     $2, $0, $0
/* 54F04 00154E04 0B000010 */  b          .L00154E34
/* 54F08 00154E08 00000000 */   nop
.L00154E0C:
/* 54F0C 00154E0C C000038E */  lw         $3, 0xC0($16)
/* 54F10 00154E10 02006010 */  beqz       $3, .L00154E1C
/* 54F14 00154E14 00000000 */   nop
/* 54F18 00154E18 0C0062AC */  sw         $2, 0xC($3)
.L00154E1C:
/* 54F1C 00154E1C C00002AE */  sw         $2, 0xC0($16)
/* 54F20 00154E20 0C0040AC */  sw         $0, 0xC($2)
/* 54F24 00154E24 BC00038E */  lw         $3, 0xBC($16)
/* 54F28 00154E28 02006014 */  bnez       $3, .L00154E34
/* 54F2C 00154E2C 00000000 */   nop
/* 54F30 00154E30 BC0002AE */  sw         $2, 0xBC($16)
.L00154E34:
/* 54F34 00154E34 1000BF7B */  lq         $31, 0x10($sp)
/* 54F38 00154E38 0000B07B */  lq         $16, 0x0($sp)
/* 54F3C 00154E3C 2000BD27 */  addiu      $sp, $sp, 0x20
/* 54F40 00154E40 0800E003 */  jr         $31
/* 54F44 00154E44 00000000 */   nop
/* 54F48 00154E48 00000000 */  nop
/* 54F4C 00154E4C 00000000 */  nop
