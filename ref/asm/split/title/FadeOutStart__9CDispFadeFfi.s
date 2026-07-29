.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FadeOutStart__9CDispFadeFfi
/* 0014E0 01DAD1E0 04008CE4 */  swc1        $f12, 0x4($4)
/* 0014E4 01DAD1E4 01000324 */  addiu       $3, $0, 0x1
/* 0014E8 01DAD1E8 080083AC */  sw          $3, 0x8($4)
/* 0014EC 01DAD1EC 0C0085AC */  sw          $5, 0xC($4)
/* 0014F0 01DAD1F0 0800E003 */  jr          $31
/* 0014F4 01DAD1F4 00000000 */   nop
/* 0014F8 01DAD1F8 00000000 */  nop
/* 0014FC 01DAD1FC 00000000 */  nop
