.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndBgmRePlay__Fv
/* 59D00 00159C00 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 59D04 00159C04 0000BF7F */  sq         $31, 0x0($sp)
/* 59D08 00159C08 048E838F */  lw         $3, -0x71FC($gp)
/* 59D0C 00159C0C 0B006004 */  bltz       $3, .L00159C3C
/* 59D10 00159C10 00000000 */   nop
/* 59D14 00159C14 088E848F */  lw         $4, -0x71F8($gp)
/* 59D18 00159C18 02000324 */  addiu      $3, $0, 0x2
/* 59D1C 00159C1C 07008314 */  bne        $4, $3, .L00159C3C
/* 59D20 00159C20 00000000 */   nop
/* 59D24 00159C24 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 59D28 00159C28 282E0070 */  paddub     $5, $0, $0
/* 59D2C 00159C2C 6815050C */  jal        SQ_RePlay__6CSoundFi
/* 59D30 00159C30 00000000 */   nop
/* 59D34 00159C34 01000324 */  addiu      $3, $0, 0x1
/* 59D38 00159C38 088E83AF */  sw         $3, -0x71F8($gp)
.L00159C3C:
/* 59D3C 00159C3C 0000BF7B */  lq         $31, 0x0($sp)
/* 59D40 00159C40 1000BD27 */  addiu      $sp, $sp, 0x10
/* 59D44 00159C44 0800E003 */  jr         $31
/* 59D48 00159C48 00000000 */   nop
/* 59D4C 00159C4C 00000000 */  nop
