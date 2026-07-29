.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetPosition__7CObjectF11CVector3_f_
/* 056D90 00156C90 F0FFBD27 */  addiu       $29, $29, -0x10
/* 056D94 00156C94 0000A627 */  addiu       $6, $29, 0x0
/* 056D98 00156C98 0000A378 */  lq          $3, 0x0($5)
/* 056D9C 00156C9C 0000C37C */  sq          $3, 0x0($6)
/* 056DA0 00156CA0 0000A0C7 */  lwc1        $f0, 0x0($29)
/* 056DA4 00156CA4 100080E4 */  swc1        $f0, 0x10($4)
/* 056DA8 00156CA8 0400A0C7 */  lwc1        $f0, 0x4($29)
/* 056DAC 00156CAC 140080E4 */  swc1        $f0, 0x14($4)
/* 056DB0 00156CB0 0800A0C7 */  lwc1        $f0, 0x8($29)
/* 056DB4 00156CB4 180080E4 */  swc1        $f0, 0x18($4)
/* 056DB8 00156CB8 1000BD27 */  addiu       $29, $29, 0x10
/* 056DBC 00156CBC 0800E003 */  jr          $31
/* 056DC0 00156CC0 00000000 */   nop
/* 056DC4 00156CC4 00000000 */  nop
/* 056DC8 00156CC8 00000000 */  nop
/* 056DCC 00156CCC 00000000 */  nop
