.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CheckBomb__15CItemBombEffectFv
/* 0D6260 001D6160 281E0070 */  paddub      $3, $0, $0
/* 0D6264 001D6164 0A000010 */  b           .L001D6190
/* 0D6268 001D6168 00000000 */   nop
.L001D616C:
/* 0D626C 001D616C 80100300 */  sll         $2, $3, 2
/* 0D6270 001D6170 21104400 */  addu        $2, $2, $4
/* 0D6274 001D6174 A000428C */  lw          $2, 0xA0($2)
/* 0D6278 001D6178 04004010 */  beqz        $2, .L001D618C
/* 0D627C 001D617C 00000000 */   nop
/* 0D6280 001D6180 01000224 */  addiu       $2, $0, 0x1
/* 0D6284 001D6184 06000010 */  b           .L001D61A0
/* 0D6288 001D6188 00000000 */   nop
.L001D618C:
/* 0D628C 001D618C 01006324 */  addiu       $3, $3, 0x1
.L001D6190:
/* 0D6290 001D6190 05006228 */  slti        $2, $3, 0x5
/* 0D6294 001D6194 F5FF4014 */  bnez        $2, .L001D616C
/* 0D6298 001D6198 00000000 */   nop
/* 0D629C 001D619C 28160070 */  paddub      $2, $0, $0
.L001D61A0:
/* 0D62A0 001D61A0 0800E003 */  jr          $31
/* 0D62A4 001D61A4 00000000 */   nop
/* 0D62A8 001D61A8 00000000 */  nop
/* 0D62AC 001D61AC 00000000 */  nop
