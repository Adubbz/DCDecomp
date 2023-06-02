.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _LOAD_BGM__FP12RS_STACKDATAi
/* 95D70 00195C70 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 95D74 00195C74 1000BF7F */  sq         $31, 0x10($sp)
/* 95D78 00195C78 0000B07F */  sq         $16, 0x0($sp)
/* 95D7C 00195C7C 28868070 */  paddub     $16, $4, $0
/* 95D80 00195C80 30FB040C */  jal        StartReadBG__Fv
/* 95D84 00195C84 00000000 */   nop
/* 95D88 00195C88 28260072 */  paddub     $4, $16, $0
/* 95D8C 00195C8C D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 95D90 00195C90 00000000 */   nop
/* 95D94 00195C94 28264070 */  paddub     $4, $2, $0
/* 95D98 00195C98 948B858F */  lw         $5, -0x746C($gp)
/* 95D9C 00195C9C 28360070 */  paddub     $6, $0, $0
/* 95DA0 00195CA0 7C66050C */  jal        SndBgmLoadBG__FiPUiPi
/* 95DA4 00195CA4 00000000 */   nop
/* 95DA8 00195CA8 1000BF7B */  lq         $31, 0x10($sp)
/* 95DAC 00195CAC 0000B07B */  lq         $16, 0x0($sp)
/* 95DB0 00195CB0 2000BD27 */  addiu      $sp, $sp, 0x20
/* 95DB4 00195CB4 0800E003 */  jr         $31
/* 95DB8 00195CB8 00000000 */   nop
/* 95DBC 00195CBC 00000000 */  nop
