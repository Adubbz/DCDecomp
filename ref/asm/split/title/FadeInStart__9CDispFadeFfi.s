.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FadeInStart__9CDispFadeFfi
/* 001500 01DAD200 04008CE4 */  swc1        $f12, 0x4($4)
/* 001504 01DAD204 02000324 */  addiu       $3, $0, 0x2
/* 001508 01DAD208 080083AC */  sw          $3, 0x8($4)
/* 00150C 01DAD20C 0C0085AC */  sw          $5, 0xC($4)
/* 001510 01DAD210 0800E003 */  jr          $31
/* 001514 01DAD214 00000000 */   nop
/* 001518 01DAD218 00000000 */  nop
/* 00151C 01DAD21C 00000000 */  nop
