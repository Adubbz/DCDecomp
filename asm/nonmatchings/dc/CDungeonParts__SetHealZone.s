.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetHealZone__13CDungeonPartsFPfff
/* C1770 001C1670 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* C1774 001C1674 2000BF7F */  sq         $31, 0x20($sp)
/* C1778 001C1678 1000B07F */  sq         $16, 0x10($sp)
/* C177C 001C167C 0400B5E7 */  swc1       $f21, 0x4($sp)
/* C1780 001C1680 0000B4E7 */  swc1       $f20, 0x0($sp)
/* C1784 001C1684 28868070 */  paddub     $16, $4, $0
/* C1788 001C1688 46650046 */  mov.s      $f21, $f12
/* C178C 001C168C 066D0046 */  mov.s      $f20, $f13
/* C1790 001C1690 90010426 */  addiu      $4, $16, 0x190
/* C1794 001C1694 0C86040C */  jal        sceVu0CopyVector
/* C1798 001C1698 00000000 */   nop
/* C179C 001C169C A00115E6 */  swc1       $f21, 0x1A0($16)
/* C17A0 001C16A0 A40114E6 */  swc1       $f20, 0x1A4($16)
/* C17A4 001C16A4 01000324 */  addiu      $3, $0, 0x1
/* C17A8 001C16A8 A80103AE */  sw         $3, 0x1A8($16)
/* C17AC 001C16AC 2000BF7B */  lq         $31, 0x20($sp)
/* C17B0 001C16B0 1000B07B */  lq         $16, 0x10($sp)
/* C17B4 001C16B4 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* C17B8 001C16B8 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* C17BC 001C16BC 3000BD27 */  addiu      $sp, $sp, 0x30
/* C17C0 001C16C0 0800E003 */  jr         $31
/* C17C4 001C16C4 00000000 */   nop
/* C17C8 001C16C8 00000000 */  nop
/* C17CC 001C16CC 00000000 */  nop
