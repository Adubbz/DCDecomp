.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetReadBGFile__Fi
/* 03ED60 0013EC60 04008004 */  bltz        $4, .L0013EC74
/* 03ED64 0013EC64 00000000 */   nop
/* 03ED68 0013EC68 20008228 */  slti        $2, $4, 0x20
/* 03ED6C 0013EC6C 04004014 */  bnez        $2, .L0013EC80
/* 03ED70 0013EC70 00000000 */   nop
.L0013EC74:
/* 03ED74 0013EC74 28160070 */  paddub      $2, $0, $0
/* 03ED78 0013EC78 0D000010 */  b           .L0013ECB0
/* 03ED7C 0013EC7C 00000000 */   nop
.L0013EC80:
/* 03ED80 0013EC80 80100400 */  sll         $2, $4, 2
/* 03ED84 0013EC84 21104400 */  addu        $2, $2, $4
/* 03ED88 0013EC88 C0100200 */  sll         $2, $2, 3
/* 03ED8C 0013EC8C 23104400 */  subu        $2, $2, $4
/* 03ED90 0013EC90 80180200 */  sll         $3, $2, 2
/* 03ED94 0013EC94 CC01023C */  lui         $2, %hi(bg_read_info)
/* 03ED98 0013EC98 C0B04224 */  addiu       $2, $2, %lo(bg_read_info)
/* 03ED9C 0013EC9C 21104300 */  addu        $2, $2, $3
/* 03EDA0 0013ECA0 0000438C */  lw          $3, 0x0($2)
/* 03EDA4 0013ECA4 0A100300 */  movz        $2, $0, $3
/* 03EDA8 0013ECA8 01000010 */  b           .L0013ECB0
/* 03EDAC 0013ECAC 00000000 */   nop
.L0013ECB0:
/* 03EDB0 0013ECB0 0800E003 */  jr          $31
/* 03EDB4 0013ECB4 00000000 */   nop
/* 03EDB8 0013ECB8 00000000 */  nop
/* 03EDBC 0013ECBC 00000000 */  nop
