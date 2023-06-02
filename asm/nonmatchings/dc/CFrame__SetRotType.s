.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetRotType__6CFrameFi
/* 28F80 00128E80 480285AC */  sw         $5, 0x248($4)
/* 28F84 00128E84 0200A330 */  andi       $3, $5, 0x2
/* 28F88 00128E88 04006010 */  beqz       $3, .L00128E9C
/* 28F8C 00128E8C 00000000 */   nop
/* 28F90 00128E90 4802838C */  lw         $3, 0x248($4)
/* 28F94 00128E94 01006334 */  ori        $3, $3, 0x1
/* 28F98 00128E98 480283AC */  sw         $3, 0x248($4)
.L00128E9C:
/* 28F9C 00128E9C 0800E003 */  jr         $31
/* 28FA0 00128EA0 00000000 */   nop
/* 28FA4 00128EA4 00000000 */  nop
/* 28FA8 00128EA8 00000000 */  nop
/* 28FAC 00128EAC 00000000 */  nop
