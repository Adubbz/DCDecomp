.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_SE_VOL__FP12RS_STACKDATAi
/* 962D0 001961D0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 962D4 001961D4 2000BF7F */  sq         $31, 0x20($sp)
/* 962D8 001961D8 1000B17F */  sq         $17, 0x10($sp)
/* 962DC 001961DC 0000B07F */  sq         $16, 0x0($sp)
/* 962E0 001961E0 08009124 */  addiu      $17, $4, 0x8
/* 962E4 001961E4 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 962E8 001961E8 00000000 */   nop
/* 962EC 001961EC 28864070 */  paddub     $16, $2, $0
/* 962F0 001961F0 28262072 */  paddub     $4, $17, $0
/* 962F4 001961F4 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 962F8 001961F8 00000000 */   nop
/* 962FC 001961FC 28260072 */  paddub     $4, $16, $0
/* 96300 00196200 282E4070 */  paddub     $5, $2, $0
/* 96304 00196204 28360070 */  paddub     $6, $0, $0
/* 96308 00196208 406A050C */  jal        SndSetSeVol__Fiii
/* 9630C 0019620C 00000000 */   nop
/* 96310 00196210 01000224 */  addiu      $2, $0, 0x1
/* 96314 00196214 2000BF7B */  lq         $31, 0x20($sp)
/* 96318 00196218 1000B17B */  lq         $17, 0x10($sp)
/* 9631C 0019621C 0000B07B */  lq         $16, 0x0($sp)
/* 96320 00196220 3000BD27 */  addiu      $sp, $sp, 0x30
/* 96324 00196224 0800E003 */  jr         $31
/* 96328 00196228 00000000 */   nop
/* 9632C 0019622C 00000000 */  nop
