.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Draw__10CMainCharaFv
/* 039DA0 00139CA0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 039DA4 00139CA4 0000BF7F */  sq          $31, 0x0($29)
/* 039DA8 00139CA8 C4E4040C */  jal         Draw__10CCharacterFv
/* 039DAC 00139CAC 00000000 */   nop
/* 039DB0 00139CB0 0000BF7B */  lq          $31, 0x0($29)
/* 039DB4 00139CB4 1000BD27 */  addiu       $29, $29, 0x10
/* 039DB8 00139CB8 0800E003 */  jr          $31
/* 039DBC 00139CBC 00000000 */   nop
