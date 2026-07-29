.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndBgmRePlay__Fv
/* 059D00 00159C00 F0FFBD27 */  addiu       $29, $29, -0x10
/* 059D04 00159C04 0000BF7F */  sq          $31, 0x0($29)
/* 059D08 00159C08 048E838F */  lw          $3, -0x71FC($28)
/* 059D0C 00159C0C 0B006004 */  bltz        $3, .L00159C3C
/* 059D10 00159C10 00000000 */   nop
/* 059D14 00159C14 088E848F */  lw          $4, -0x71F8($28)
/* 059D18 00159C18 02000324 */  addiu       $3, $0, 0x2
/* 059D1C 00159C1C 07008314 */  bne         $4, $3, .L00159C3C
/* 059D20 00159C20 00000000 */   nop
/* 059D24 00159C24 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 059D28 00159C28 282E0070 */  paddub      $5, $0, $0
/* 059D2C 00159C2C 6815050C */  jal         SQ_RePlay__6CSoundFi
/* 059D30 00159C30 00000000 */   nop
/* 059D34 00159C34 01000324 */  addiu       $3, $0, 0x1
/* 059D38 00159C38 088E83AF */  sw          $3, -0x71F8($28)
.L00159C3C:
/* 059D3C 00159C3C 0000BF7B */  lq          $31, 0x0($29)
/* 059D40 00159C40 1000BD27 */  addiu       $29, $29, 0x10
/* 059D44 00159C44 0800E003 */  jr          $31
/* 059D48 00159C48 00000000 */   nop
/* 059D4C 00159C4C 00000000 */  nop
