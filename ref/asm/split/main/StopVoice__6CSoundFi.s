.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel StopVoice__6CSoundFi
/* 043CF0 00143BF0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 043CF4 00143BF4 1000BF7F */  sq          $31, 0x10($29)
/* 043CF8 00143BF8 0000B07F */  sq          $16, 0x0($29)
/* 043CFC 00143BFC 2886A070 */  paddub      $16, $5, $0
/* 043D00 00143C00 00160636 */  ori         $6, $16, 0x1600
/* 043D04 00143C04 01000424 */  addiu       $4, $0, 0x1
/* 043D08 00143C08 30800534 */  ori         $5, $0, 0x8030
/* 043D0C 00143C0C FF00023C */  lui         $2, (0xFFFFFF >> 16)
/* 043D10 00143C10 FFFF4734 */  ori         $7, $2, (0xFFFFFF & 0xFFFF)
/* 043D14 00143C14 E084040C */  jal         sceSdRemote
/* 043D18 00143C18 00000000 */   nop
/* 043D1C 00143C1C 2A00023C */  lui         $2, %hi(LIT_221__2)
/* 043D20 00143C20 D0964424 */  addiu       $4, $2, %lo(LIT_221__2)
/* 043D24 00143C24 282E0072 */  paddub      $5, $16, $0
/* 043D28 00143C28 A611040C */  jal         printf
/* 043D2C 00143C2C 00000000 */   nop
/* 043D30 00143C30 1000BF7B */  lq          $31, 0x10($29)
/* 043D34 00143C34 0000B07B */  lq          $16, 0x0($29)
/* 043D38 00143C38 2000BD27 */  addiu       $29, $29, 0x20
/* 043D3C 00143C3C 0800E003 */  jr          $31
/* 043D40 00143C40 00000000 */   nop
/* 043D44 00143C44 00000000 */  nop
/* 043D48 00143C48 00000000 */  nop
/* 043D4C 00143C4C 00000000 */  nop
