.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetPartsBox__9CEditAreaFP7CBoxVu0
/* 6EFD0 0016EED0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 6EFD4 0016EED4 0000BF7F */  sq         $31, 0x0($sp)
/* 6EFD8 0016EED8 28168070 */  paddub     $2, $4, $0
/* 6EFDC 0016EEDC 2826A070 */  paddub     $4, $5, $0
/* 6EFE0 0016EEE0 30204524 */  addiu      $5, $2, 0x2030
/* 6EFE4 0016EEE4 20000624 */  addiu      $6, $0, 0x20
/* 6EFE8 0016EEE8 EC0C040C */  jal        memcpy
/* 6EFEC 0016EEEC 00000000 */   nop
/* 6EFF0 0016EEF0 0000BF7B */  lq         $31, 0x0($sp)
/* 6EFF4 0016EEF4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 6EFF8 0016EEF8 0800E003 */  jr         $31
/* 6EFFC 0016EEFC 00000000 */   nop
