.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SearchSlot__16CDungeonEventManFv
/* 0CCA40 001CC940 282E0070 */  paddub      $5, $0, $0
/* 0CCA44 001CC944 09000010 */  b           .L001CC96C
/* 0CCA48 001CC948 00000000 */   nop
.L001CC94C:
/* 0CCA4C 001CC94C 80110500 */  sll         $2, $5, 6
/* 0CCA50 001CC950 21104400 */  addu        $2, $2, $4
/* 0CCA54 001CC954 3C00438C */  lw          $3, 0x3C($2)
/* 0CCA58 001CC958 03006014 */  bnez        $3, .L001CC968
/* 0CCA5C 001CC95C 00000000 */   nop
/* 0CCA60 001CC960 06000010 */  b           .L001CC97C
/* 0CCA64 001CC964 00000000 */   nop
.L001CC968:
/* 0CCA68 001CC968 0100A524 */  addiu       $5, $5, 0x1
.L001CC96C:
/* 0CCA6C 001CC96C 4000A228 */  slti        $2, $5, 0x40
/* 0CCA70 001CC970 F6FF4014 */  bnez        $2, .L001CC94C
/* 0CCA74 001CC974 00000000 */   nop
/* 0CCA78 001CC978 28160070 */  paddub      $2, $0, $0
.L001CC97C:
/* 0CCA7C 001CC97C 0800E003 */  jr          $31
/* 0CCA80 001CC980 00000000 */   nop
/* 0CCA84 001CC984 00000000 */  nop
/* 0CCA88 001CC988 00000000 */  nop
/* 0CCA8C 001CC98C 00000000 */  nop
