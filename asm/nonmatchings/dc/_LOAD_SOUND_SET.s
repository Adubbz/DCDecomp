.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _LOAD_SOUND_SET__FP12RS_STACKDATAi
/* 95CD0 00195BD0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 95CD4 00195BD4 1000BF7F */  sq         $31, 0x10($sp)
/* 95CD8 00195BD8 0000B07F */  sq         $16, 0x0($sp)
/* 95CDC 00195BDC 28868070 */  paddub     $16, $4, $0
/* 95CE0 00195BE0 30FB040C */  jal        StartReadBG__Fv
/* 95CE4 00195BE4 00000000 */   nop
/* 95CE8 00195BE8 28260072 */  paddub     $4, $16, $0
/* 95CEC 00195BEC D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 95CF0 00195BF0 00000000 */   nop
/* 95CF4 00195BF4 28264070 */  paddub     $4, $2, $0
/* 95CF8 00195BF8 948B858F */  lw         $5, -0x746C($gp)
/* 95CFC 00195BFC 28360070 */  paddub     $6, $0, $0
/* 95D00 00195C00 6069050C */  jal        SndSoundLoadBG__FiPUiPi
/* 95D04 00195C04 00000000 */   nop
/* 95D08 00195C08 1000BF7B */  lq         $31, 0x10($sp)
/* 95D0C 00195C0C 0000B07B */  lq         $16, 0x0($sp)
/* 95D10 00195C10 2000BD27 */  addiu      $sp, $sp, 0x20
/* 95D14 00195C14 0800E003 */  jr         $31
/* 95D18 00195C18 00000000 */   nop
/* 95D1C 00195C1C 00000000 */  nop
