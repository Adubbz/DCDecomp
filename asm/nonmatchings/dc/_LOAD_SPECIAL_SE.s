.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _LOAD_SPECIAL_SE__FP12RS_STACKDATAi
/* 96330 00196230 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 96334 00196234 1000BF7F */  sq         $31, 0x10($sp)
/* 96338 00196238 0000B07F */  sq         $16, 0x0($sp)
/* 9633C 0019623C 28868070 */  paddub     $16, $4, $0
/* 96340 00196240 30FB040C */  jal        StartReadBG__Fv
/* 96344 00196244 00000000 */   nop
/* 96348 00196248 28260072 */  paddub     $4, $16, $0
/* 9634C 0019624C D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 96350 00196250 00000000 */   nop
/* 96354 00196254 28264070 */  paddub     $4, $2, $0
/* 96358 00196258 948B858F */  lw         $5, -0x746C($gp)
/* 9635C 0019625C 28360070 */  paddub     $6, $0, $0
/* 96360 00196260 D86D050C */  jal        SndSPSeLoadBG__FiPUiPi
/* 96364 00196264 00000000 */   nop
/* 96368 00196268 01000224 */  addiu      $2, $0, 0x1
/* 9636C 0019626C 1000BF7B */  lq         $31, 0x10($sp)
/* 96370 00196270 0000B07B */  lq         $16, 0x0($sp)
/* 96374 00196274 2000BD27 */  addiu      $sp, $sp, 0x20
/* 96378 00196278 0800E003 */  jr         $31
/* 9637C 0019627C 00000000 */   nop
