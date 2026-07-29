.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel NextMotionSeq__10CActionSeqFv
/* 054E70 00154D70 E0FFBD27 */  addiu       $29, $29, -0x20
/* 054E74 00154D74 1000BF7F */  sq          $31, 0x10($29)
/* 054E78 00154D78 0000B07F */  sq          $16, 0x0($29)
/* 054E7C 00154D7C 28868070 */  paddub      $16, $4, $0
/* 054E80 00154D80 0853050C */  jal         GetNextSeq__10CActionSeqFv
/* 054E84 00154D84 00000000 */   nop
/* 054E88 00154D88 04004014 */  bnez        $2, .L00154D9C
/* 054E8C 00154D8C 00000000 */   nop
/* 054E90 00154D90 28160070 */  paddub      $2, $0, $0
/* 054E94 00154D94 0B000010 */  b           .L00154DC4
/* 054E98 00154D98 00000000 */   nop
.L00154D9C:
/* 054E9C 00154D9C B800038E */  lw          $3, 0xB8($16)
/* 054EA0 00154DA0 02006010 */  beqz        $3, .L00154DAC
/* 054EA4 00154DA4 00000000 */   nop
/* 054EA8 00154DA8 0C0062AC */  sw          $2, 0xC($3)
.L00154DAC:
/* 054EAC 00154DAC B80002AE */  sw          $2, 0xB8($16)
/* 054EB0 00154DB0 0C0040AC */  sw          $0, 0xC($2)
/* 054EB4 00154DB4 B400038E */  lw          $3, 0xB4($16)
/* 054EB8 00154DB8 02006014 */  bnez        $3, .L00154DC4
/* 054EBC 00154DBC 00000000 */   nop
/* 054EC0 00154DC0 B40002AE */  sw          $2, 0xB4($16)
.L00154DC4:
/* 054EC4 00154DC4 1000BF7B */  lq          $31, 0x10($29)
/* 054EC8 00154DC8 0000B07B */  lq          $16, 0x0($29)
/* 054ECC 00154DCC 2000BD27 */  addiu       $29, $29, 0x20
/* 054ED0 00154DD0 0800E003 */  jr          $31
/* 054ED4 00154DD4 00000000 */   nop
/* 054ED8 00154DD8 00000000 */  nop
/* 054EDC 00154DDC 00000000 */  nop
