.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdSePlay__F11ED_SOUND_IDi
/* 08A210 0018A110 F0FFBD27 */  addiu       $29, $29, -0x10
/* 08A214 0018A114 0000BF7F */  sq          $31, 0x0($29)
/* 08A218 0018A118 04008004 */  bltz        $4, .L0018A12C
/* 08A21C 0018A11C 00000000 */   nop
/* 08A220 0018A120 0F008328 */  slti        $3, $4, 0xF
/* 08A224 0018A124 03006014 */  bnez        $3, .L0018A134
/* 08A228 0018A128 00000000 */   nop
.L0018A12C:
/* 08A22C 0018A12C 04000010 */  b           .L0018A140
/* 08A230 0018A130 00000000 */   nop
.L0018A134:
/* 08A234 0018A134 28360070 */  paddub      $6, $0, $0
/* 08A238 0018A138 AC69050C */  jal         SndSePlay__Fiii
/* 08A23C 0018A13C 00000000 */   nop
.L0018A140:
/* 08A240 0018A140 0000BF7B */  lq          $31, 0x0($29)
/* 08A244 0018A144 1000BD27 */  addiu       $29, $29, 0x10
/* 08A248 0018A148 0800E003 */  jr          $31
/* 08A24C 0018A14C 00000000 */   nop
