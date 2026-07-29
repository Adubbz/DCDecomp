.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetSPSeFile__FiPUiPc
/* 05B770 0015B670 E0FFBD27 */  addiu       $29, $29, -0x20
/* 05B774 0015B674 1000BF7F */  sq          $31, 0x10($29)
/* 05B778 0015B678 0000B07F */  sq          $16, 0x0($29)
/* 05B77C 0015B67C 28868070 */  paddub      $16, $4, $0
/* 05B780 0015B680 2816A070 */  paddub      $2, $5, $0
/* 05B784 0015B684 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 05B788 0015B688 282EC070 */  paddub      $5, $6, $0
/* 05B78C 0015B68C 28364070 */  paddub      $6, $2, $0
/* 05B790 0015B690 3410050C */  jal         LoadSoundFileFromPack__6CSoundFPcPUi
/* 05B794 0015B694 00000000 */   nop
/* 05B798 0015B698 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 05B79C 0015B69C 0C000524 */  addiu       $5, $0, 0xC
/* 05B7A0 0015B6A0 00010624 */  addiu       $6, $0, 0x100
/* 05B7A4 0015B6A4 581A050C */  jal         SetVol__6CSoundFii
/* 05B7A8 0015B6A8 00000000 */   nop
/* 05B7AC 0015B6AC 2C8E90AF */  sw          $16, -0x71D4($28)
/* 05B7B0 0015B6B0 1000BF7B */  lq          $31, 0x10($29)
/* 05B7B4 0015B6B4 0000B07B */  lq          $16, 0x0($29)
/* 05B7B8 0015B6B8 2000BD27 */  addiu       $29, $29, 0x20
/* 05B7BC 0015B6BC 0800E003 */  jr          $31
/* 05B7C0 0015B6C0 00000000 */   nop
/* 05B7C4 0015B6C4 00000000 */  nop
/* 05B7C8 0015B6C8 00000000 */  nop
/* 05B7CC 0015B6CC 00000000 */  nop
