.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetSPSeFile__FiPUiPc
/* 5B770 0015B670 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 5B774 0015B674 1000BF7F */  sq         $31, 0x10($sp)
/* 5B778 0015B678 0000B07F */  sq         $16, 0x0($sp)
/* 5B77C 0015B67C 28868070 */  paddub     $16, $4, $0
/* 5B780 0015B680 2816A070 */  paddub     $2, $5, $0
/* 5B784 0015B684 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5B788 0015B688 282EC070 */  paddub     $5, $6, $0
/* 5B78C 0015B68C 28364070 */  paddub     $6, $2, $0
/* 5B790 0015B690 3410050C */  jal        LoadSoundFileFromPack__6CSoundFPcPUi
/* 5B794 0015B694 00000000 */   nop
/* 5B798 0015B698 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5B79C 0015B69C 0C000524 */  addiu      $5, $0, 0xC
/* 5B7A0 0015B6A0 00010624 */  addiu      $6, $0, 0x100
/* 5B7A4 0015B6A4 581A050C */  jal        SetVol__6CSoundFii
/* 5B7A8 0015B6A8 00000000 */   nop
/* 5B7AC 0015B6AC 2C8E90AF */  sw         $16, -0x71D4($gp)
/* 5B7B0 0015B6B0 1000BF7B */  lq         $31, 0x10($sp)
/* 5B7B4 0015B6B4 0000B07B */  lq         $16, 0x0($sp)
/* 5B7B8 0015B6B8 2000BD27 */  addiu      $sp, $sp, 0x20
/* 5B7BC 0015B6BC 0800E003 */  jr         $31
/* 5B7C0 0015B6C0 00000000 */   nop
/* 5B7C4 0015B6C4 00000000 */  nop
/* 5B7C8 0015B6C8 00000000 */  nop
/* 5B7CC 0015B6CC 00000000 */  nop
