.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetPos__7CCursolFv
/* 0293D0 01DD50D0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0293D4 01DD50D4 0000BF7F */  sq          $31, 0x0($29)
/* 0293D8 01DD50D8 00008CC4 */  lwc1        $f12, 0x0($4)
/* 0293DC 01DD50DC 2C44040C */  jal         fptosi
/* 0293E0 01DD50E0 00000000 */   nop
/* 0293E4 01DD50E4 0000BF7B */  lq          $31, 0x0($29)
/* 0293E8 01DD50E8 1000BD27 */  addiu       $29, $29, 0x10
/* 0293EC 01DD50EC 0800E003 */  jr          $31
/* 0293F0 01DD50F0 00000000 */   nop
/* 0293F4 01DD50F4 00000000 */  nop
/* 0293F8 01DD50F8 00000000 */  nop
/* 0293FC 01DD50FC 00000000 */  nop
