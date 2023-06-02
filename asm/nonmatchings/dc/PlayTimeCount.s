.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PlayTimeCount__Fi
/* 41030 00140F30 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 41034 00140F34 0000BF7F */  sq         $31, 0x0($sp)
/* 41038 00140F38 A486838F */  lw         $3, -0x795C($gp)
/* 4103C 00140F3C 05006010 */  beqz       $3, .L00140F54
/* 41040 00140F40 00000000 */   nop
/* 41044 00140F44 1C8D848F */  lw         $4, -0x72E4($gp)
/* 41048 00140F48 01000524 */  addiu      $5, $0, 0x1
/* 4104C 00140F4C E45E050C */  jal        AddPlayTime__9CSaveDataFi
/* 41050 00140F50 00000000 */   nop
.L00140F54:
/* 41054 00140F54 0000BF7B */  lq         $31, 0x0($sp)
/* 41058 00140F58 1000BD27 */  addiu      $sp, $sp, 0x10
/* 4105C 00140F5C 0800E003 */  jr         $31
/* 41060 00140F60 00000000 */   nop
/* 41064 00140F64 00000000 */  nop
/* 41068 00140F68 00000000 */  nop
/* 4106C 00140F6C 00000000 */  nop
