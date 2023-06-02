.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _LOAD_VOICE_SET__FP12RS_STACKDATAi
/* 95D20 00195C20 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 95D24 00195C24 1000BF7F */  sq         $31, 0x10($sp)
/* 95D28 00195C28 0000B07F */  sq         $16, 0x0($sp)
/* 95D2C 00195C2C 28868070 */  paddub     $16, $4, $0
/* 95D30 00195C30 30FB040C */  jal        StartReadBG__Fv
/* 95D34 00195C34 00000000 */   nop
/* 95D38 00195C38 28260072 */  paddub     $4, $16, $0
/* 95D3C 00195C3C D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 95D40 00195C40 00000000 */   nop
/* 95D44 00195C44 28264070 */  paddub     $4, $2, $0
/* 95D48 00195C48 948B858F */  lw         $5, -0x746C($gp)
/* 95D4C 00195C4C 28360070 */  paddub     $6, $0, $0
/* 95D50 00195C50 206D050C */  jal        SndVoiceLoadBG__FiPUiPi
/* 95D54 00195C54 00000000 */   nop
/* 95D58 00195C58 1000BF7B */  lq         $31, 0x10($sp)
/* 95D5C 00195C5C 0000B07B */  lq         $16, 0x0($sp)
/* 95D60 00195C60 2000BD27 */  addiu      $sp, $sp, 0x20
/* 95D64 00195C64 0800E003 */  jr         $31
/* 95D68 00195C68 00000000 */   nop
/* 95D6C 00195C6C 00000000 */  nop
