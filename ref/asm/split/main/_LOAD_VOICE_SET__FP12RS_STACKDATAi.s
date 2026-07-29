.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _LOAD_VOICE_SET__FP12RS_STACKDATAi
/* 095D20 00195C20 E0FFBD27 */  addiu       $29, $29, -0x20
/* 095D24 00195C24 1000BF7F */  sq          $31, 0x10($29)
/* 095D28 00195C28 0000B07F */  sq          $16, 0x0($29)
/* 095D2C 00195C2C 28868070 */  paddub      $16, $4, $0
/* 095D30 00195C30 30FB040C */  jal         StartReadBG__Fv
/* 095D34 00195C34 00000000 */   nop
/* 095D38 00195C38 28260072 */  paddub      $4, $16, $0
/* 095D3C 00195C3C D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 095D40 00195C40 00000000 */   nop
/* 095D44 00195C44 28264070 */  paddub      $4, $2, $0
/* 095D48 00195C48 948B858F */  lw          $5, -0x746C($28)
/* 095D4C 00195C4C 28360070 */  paddub      $6, $0, $0
/* 095D50 00195C50 206D050C */  jal         SndVoiceLoadBG__FiPUiPi
/* 095D54 00195C54 00000000 */   nop
/* 095D58 00195C58 1000BF7B */  lq          $31, 0x10($29)
/* 095D5C 00195C5C 0000B07B */  lq          $16, 0x0($29)
/* 095D60 00195C60 2000BD27 */  addiu       $29, $29, 0x20
/* 095D64 00195C64 0800E003 */  jr          $31
/* 095D68 00195C68 00000000 */   nop
/* 095D6C 00195C6C 00000000 */  nop
