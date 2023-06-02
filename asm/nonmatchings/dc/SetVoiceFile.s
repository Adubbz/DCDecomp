.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetVoiceFile__FiPUiPc
/* 5B490 0015B390 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 5B494 0015B394 1000BF7F */  sq         $31, 0x10($sp)
/* 5B498 0015B398 0000B07F */  sq         $16, 0x0($sp)
/* 5B49C 0015B39C 28868070 */  paddub     $16, $4, $0
/* 5B4A0 0015B3A0 2816A070 */  paddub     $2, $5, $0
/* 5B4A4 0015B3A4 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5B4A8 0015B3A8 282EC070 */  paddub     $5, $6, $0
/* 5B4AC 0015B3AC 28364070 */  paddub     $6, $2, $0
/* 5B4B0 0015B3B0 3410050C */  jal        LoadSoundFileFromPack__6CSoundFPcPUi
/* 5B4B4 0015B3B4 00000000 */   nop
/* 5B4B8 0015B3B8 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5B4BC 0015B3BC 0B000524 */  addiu      $5, $0, 0xB
/* 5B4C0 0015B3C0 00010624 */  addiu      $6, $0, 0x100
/* 5B4C4 0015B3C4 581A050C */  jal        SetVol__6CSoundFii
/* 5B4C8 0015B3C8 00000000 */   nop
/* 5B4CC 0015B3CC 008E90AF */  sw         $16, -0x7200($gp)
/* 5B4D0 0015B3D0 1000BF7B */  lq         $31, 0x10($sp)
/* 5B4D4 0015B3D4 0000B07B */  lq         $16, 0x0($sp)
/* 5B4D8 0015B3D8 2000BD27 */  addiu      $sp, $sp, 0x20
/* 5B4DC 0015B3DC 0800E003 */  jr         $31
/* 5B4E0 0015B3E0 00000000 */   nop
/* 5B4E4 0015B3E4 00000000 */  nop
/* 5B4E8 0015B3E8 00000000 */  nop
/* 5B4EC 0015B3EC 00000000 */  nop
