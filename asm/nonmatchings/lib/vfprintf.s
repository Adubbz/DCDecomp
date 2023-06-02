.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel vfprintf
/* 7D08 00107C08 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 7D0C 00107C0C 2000B2FF */  sd         $18, 0x20($sp)
/* 7D10 00107C10 1000B1FF */  sd         $17, 0x10($sp)
/* 7D14 00107C14 2D90C000 */  daddu      $18, $6, $0
/* 7D18 00107C18 0000B0FF */  sd         $16, 0x0($sp)
/* 7D1C 00107C1C 3000BFFF */  sd         $31, 0x30($sp)
/* 7D20 00107C20 2D808000 */  daddu      $16, $4, $0
/* 7D24 00107C24 5400038E */  lw         $3, 0x54($16)
/* 7D28 00107C28 05006014 */  bnez       $3, .L00107C40
/* 7D2C 00107C2C 2D88A000 */   daddu     $17, $5, $0
/* 7D30 00107C30 2500023C */  lui        $2, (0x250000 >> 16)
/* 7D34 00107C34 ECFD438C */  lw         $3, -0x214($2)
/* 7D38 00107C38 540003AE */  sw         $3, 0x54($16)
/* 7D3C 00107C3C 00000000 */  nop
.L00107C40:
/* 7D40 00107C40 3800628C */  lw         $2, 0x38($3)
/* 7D44 00107C44 04004054 */  bnel       $2, $0, .L00107C58
/* 7D48 00107C48 5400048E */   lw        $4, 0x54($16)
/* 7D4C 00107C4C BC06040C */  jal        __sinit
/* 7D50 00107C50 2D206000 */   daddu     $4, $3, $0
/* 7D54 00107C54 5400048E */  lw         $4, 0x54($16)
.L00107C58:
/* 7D58 00107C58 2D280002 */  daddu      $5, $16, $0
/* 7D5C 00107C5C 2D302002 */  daddu      $6, $17, $0
/* 7D60 00107C60 201F040C */  jal        _vfprintf_r
/* 7D64 00107C64 2D384002 */   daddu     $7, $18, $0
/* 7D68 00107C68 3000BFDF */  ld         $31, 0x30($sp)
/* 7D6C 00107C6C 2000B2DF */  ld         $18, 0x20($sp)
/* 7D70 00107C70 1000B1DF */  ld         $17, 0x10($sp)
/* 7D74 00107C74 0000B0DF */  ld         $16, 0x0($sp)
/* 7D78 00107C78 0800E003 */  jr         $31
/* 7D7C 00107C7C 4000BD27 */   addiu     $sp, $sp, 0x40
