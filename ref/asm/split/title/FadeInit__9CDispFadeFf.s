.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FadeInit__9CDispFadeFf
/* 001520 01DAD220 00008CE4 */  swc1        $f12, 0x0($4)
/* 001524 01DAD224 FFFF0324 */  addiu       $3, $0, -0x1
/* 001528 01DAD228 080083AC */  sw          $3, 0x8($4)
/* 00152C 01DAD22C 0C0080AC */  sw          $0, 0xC($4)
/* 001530 01DAD230 0800E003 */  jr          $31
/* 001534 01DAD234 00000000 */   nop
/* 001538 01DAD238 00000000 */  nop
/* 00153C 01DAD23C 00000000 */  nop
