.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetDir__7CObjectFR7CObjectPf
/* 56D10 00156C10 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 56D14 00156C14 2000BF7F */  sq         $31, 0x20($sp)
/* 56D18 00156C18 1000B17F */  sq         $17, 0x10($sp)
/* 56D1C 00156C1C 0000B07F */  sq         $16, 0x0($sp)
/* 56D20 00156C20 288E8070 */  paddub     $17, $4, $0
/* 56D24 00156C24 2886C070 */  paddub     $16, $6, $0
/* 56D28 00156C28 4000A427 */  addiu      $4, $sp, 0x40
/* 56D2C 00156C2C 1000A524 */  addiu      $5, $5, 0x10
/* 56D30 00156C30 0C86040C */  jal        sceVu0CopyVector
/* 56D34 00156C34 00000000 */   nop
/* 56D38 00156C38 3000A427 */  addiu      $4, $sp, 0x30
/* 56D3C 00156C3C 10002526 */  addiu      $5, $17, 0x10
/* 56D40 00156C40 0C86040C */  jal        sceVu0CopyVector
/* 56D44 00156C44 00000000 */   nop
/* 56D48 00156C48 28260072 */  paddub     $4, $16, $0
/* 56D4C 00156C4C 4000A527 */  addiu      $5, $sp, 0x40
/* 56D50 00156C50 3000A627 */  addiu      $6, $sp, 0x30
/* 56D54 00156C54 EE85040C */  jal        sceVu0SubVector
/* 56D58 00156C58 00000000 */   nop
/* 56D5C 00156C5C 2000BF7B */  lq         $31, 0x20($sp)
/* 56D60 00156C60 1000B17B */  lq         $17, 0x10($sp)
/* 56D64 00156C64 0000B07B */  lq         $16, 0x0($sp)
/* 56D68 00156C68 5000BD27 */  addiu      $sp, $sp, 0x50
/* 56D6C 00156C6C 0800E003 */  jr         $31
/* 56D70 00156C70 00000000 */   nop
/* 56D74 00156C74 00000000 */  nop
/* 56D78 00156C78 00000000 */  nop
/* 56D7C 00156C7C 00000000 */  nop
