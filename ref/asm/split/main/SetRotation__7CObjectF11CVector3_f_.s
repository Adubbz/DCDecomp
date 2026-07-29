.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetRotation__7CObjectF11CVector3_f_
/* 056EB0 00156DB0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 056EB4 00156DB4 1000A627 */  addiu       $6, $29, 0x10
/* 056EB8 00156DB8 0000A378 */  lq          $3, 0x0($5)
/* 056EBC 00156DBC 0000C37C */  sq          $3, 0x0($6)
/* 056EC0 00156DC0 0000A527 */  addiu       $5, $29, 0x0
/* 056EC4 00156DC4 0000C378 */  lq          $3, 0x0($6)
/* 056EC8 00156DC8 0000A37C */  sq          $3, 0x0($5)
/* 056ECC 00156DCC 0000C378 */  lq          $3, 0x0($6)
/* 056ED0 00156DD0 6000837C */  sq          $3, 0x60($4)
/* 056ED4 00156DD4 2000BD27 */  addiu       $29, $29, 0x20
/* 056ED8 00156DD8 0800E003 */  jr          $31
/* 056EDC 00156DDC 00000000 */   nop
