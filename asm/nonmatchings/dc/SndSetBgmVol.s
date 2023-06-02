.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndSetBgmVol__Fi
/* 59E20 00159D20 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 59E24 00159D24 0000BF7F */  sq         $31, 0x0($sp)
/* 59E28 00159D28 28368070 */  paddub     $6, $4, $0
/* 59E2C 00159D2C 048E838F */  lw         $3, -0x71FC($gp)
/* 59E30 00159D30 13006004 */  bltz       $3, .L00159D80
/* 59E34 00159D34 00000000 */   nop
/* 59E38 00159D38 0C8E838F */  lw         $3, -0x71F4($gp)
/* 59E3C 00159D3C 10006610 */  beq        $3, $6, .L00159D80
/* 59E40 00159D40 00000000 */   nop
/* 59E44 00159D44 0400C004 */  bltz       $6, .L00159D58
/* 59E48 00159D48 00000000 */   nop
/* 59E4C 00159D4C 8000C128 */  slti       $at, $6, 0x80
/* 59E50 00159D50 03002014 */  bnez       $at, .L00159D60
/* 59E54 00159D54 00000000 */   nop
.L00159D58:
/* 59E58 00159D58 09000010 */  b          .L00159D80
/* 59E5C 00159D5C 00000000 */   nop
.L00159D60:
/* 59E60 00159D60 088E838F */  lw         $3, -0x71F8($gp)
/* 59E64 00159D64 06006010 */  beqz       $3, .L00159D80
/* 59E68 00159D68 00000000 */   nop
/* 59E6C 00159D6C 0C8E86AF */  sw         $6, -0x71F4($gp)
/* 59E70 00159D70 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 59E74 00159D74 282E0070 */  paddub     $5, $0, $0
/* 59E78 00159D78 581A050C */  jal        SetVol__6CSoundFii
/* 59E7C 00159D7C 00000000 */   nop
.L00159D80:
/* 59E80 00159D80 0000BF7B */  lq         $31, 0x0($sp)
/* 59E84 00159D84 1000BD27 */  addiu      $sp, $sp, 0x10
/* 59E88 00159D88 0800E003 */  jr         $31
/* 59E8C 00159D8C 00000000 */   nop
