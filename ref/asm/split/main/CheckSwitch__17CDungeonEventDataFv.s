.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CheckSwitch__17CDungeonEventDataFv
/* 0CC980 001CC880 0000828C */  lw          $2, 0x0($4)
/* 0CC984 001CC884 04004014 */  bnez        $2, .L001CC898
/* 0CC988 001CC888 00000000 */   nop
/* 0CC98C 001CC88C 28160070 */  paddub      $2, $0, $0
/* 0CC990 001CC890 0B000010 */  b           .L001CC8C0
/* 0CC994 001CC894 00000000 */   nop
.L001CC898:
/* 0CC998 001CC898 3800828C */  lw          $2, 0x38($4)
/* 0CC99C 001CC89C 07004010 */  beqz        $2, .L001CC8BC
/* 0CC9A0 001CC8A0 00000000 */   nop
/* 0CC9A4 001CC8A4 3400828C */  lw          $2, 0x34($4)
/* 0CC9A8 001CC8A8 04004010 */  beqz        $2, .L001CC8BC
/* 0CC9AC 001CC8AC 00000000 */   nop
/* 0CC9B0 001CC8B0 01000224 */  addiu       $2, $0, 0x1
/* 0CC9B4 001CC8B4 02000010 */  b           .L001CC8C0
/* 0CC9B8 001CC8B8 00000000 */   nop
.L001CC8BC:
/* 0CC9BC 001CC8BC 28160070 */  paddub      $2, $0, $0
.L001CC8C0:
/* 0CC9C0 001CC8C0 0800E003 */  jr          $31
/* 0CC9C4 001CC8C4 00000000 */   nop
/* 0CC9C8 001CC8C8 00000000 */  nop
/* 0CC9CC 001CC8CC 00000000 */  nop
