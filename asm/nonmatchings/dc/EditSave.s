.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EditSave__Fv
/* 77CF0 00177BF0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 77CF4 00177BF4 0000BF7F */  sq         $31, 0x0($sp)
/* 77CF8 00177BF8 288D838F */  lw         $3, -0x72D8($gp)
/* 77CFC 00177BFC 05006128 */  slti       $at, $3, 0x5
/* 77D00 00177C00 0E002010 */  beqz       $at, .L00177C3C
/* 77D04 00177C04 00000000 */   nop
/* 77D08 00177C08 0C006004 */  bltz       $3, .L00177C3C
/* 77D0C 00177C0C 00000000 */   nop
/* 77D10 00177C10 E890848F */  lw         $4, -0x6F18($gp)
/* 77D14 00177C14 2090858F */  lw         $5, -0x6FE0($gp)
/* 77D18 00177C18 1C8D868F */  lw         $6, -0x72E4($gp)
/* 77D1C 00177C1C 2493060C */  jal        Save__11CEditGroundFiP9CSaveData
/* 77D20 00177C20 00000000 */   nop
/* 77D24 00177C24 D201023C */  lui        $2, %hi(EditPartsInfo)
/* 77D28 00177C28 F09B4424 */  addiu      $4, $2, %lo(EditPartsInfo)
/* 77D2C 00177C2C 2090858F */  lw         $5, -0x6FE0($gp)
/* 77D30 00177C30 1C8D868F */  lw         $6, -0x72E4($gp)
/* 77D34 00177C34 B068060C */  jal        Save__14CEditPartsInfoFiP9CSaveData
/* 77D38 00177C38 00000000 */   nop
.L00177C3C:
/* 77D3C 00177C3C 6090838F */  lw         $3, -0x6FA0($gp)
/* 77D40 00177C40 08006010 */  beqz       $3, .L00177C64
/* 77D44 00177C44 00000000 */   nop
/* 77D48 00177C48 4000638C */  lw         $3, 0x40($3)
/* 77D4C 00177C4C 05006014 */  bnez       $3, .L00177C64
/* 77D50 00177C50 00000000 */   nop
/* 77D54 00177C54 1C8D848F */  lw         $4, -0x72E4($gp)
/* 77D58 00177C58 04918CC7 */  lwc1       $f12, -0x6EFC($gp)
/* 77D5C 00177C5C F05E050C */  jal        SetNowTime__9CSaveDataFf
/* 77D60 00177C60 00000000 */   nop
.L00177C64:
/* 77D64 00177C64 0000BF7B */  lq         $31, 0x0($sp)
/* 77D68 00177C68 1000BD27 */  addiu      $sp, $sp, 0x10
/* 77D6C 00177C6C 0800E003 */  jr         $31
/* 77D70 00177C70 00000000 */   nop
/* 77D74 00177C74 00000000 */  nop
/* 77D78 00177C78 00000000 */  nop
/* 77D7C 00177C7C 00000000 */  nop
