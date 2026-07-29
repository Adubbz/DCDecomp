.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetPartsBox__9CEditAreaFP7CBoxVu0
/* 06EFD0 0016EED0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 06EFD4 0016EED4 0000BF7F */  sq          $31, 0x0($29)
/* 06EFD8 0016EED8 28168070 */  paddub      $2, $4, $0
/* 06EFDC 0016EEDC 2826A070 */  paddub      $4, $5, $0
/* 06EFE0 0016EEE0 30204524 */  addiu       $5, $2, 0x2030
/* 06EFE4 0016EEE4 20000624 */  addiu       $6, $0, 0x20
/* 06EFE8 0016EEE8 EC0C040C */  jal         memcpy
/* 06EFEC 0016EEEC 00000000 */   nop
/* 06EFF0 0016EEF0 0000BF7B */  lq          $31, 0x0($29)
/* 06EFF4 0016EEF4 1000BD27 */  addiu       $29, $29, 0x10
/* 06EFF8 0016EEF8 0800E003 */  jr          $31
/* 06EFFC 0016EEFC 00000000 */   nop
