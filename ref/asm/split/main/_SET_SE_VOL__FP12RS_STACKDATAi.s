.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_SE_VOL__FP12RS_STACKDATAi
/* 0962D0 001961D0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0962D4 001961D4 2000BF7F */  sq          $31, 0x20($29)
/* 0962D8 001961D8 1000B17F */  sq          $17, 0x10($29)
/* 0962DC 001961DC 0000B07F */  sq          $16, 0x0($29)
/* 0962E0 001961E0 08009124 */  addiu       $17, $4, 0x8
/* 0962E4 001961E4 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 0962E8 001961E8 00000000 */   nop
/* 0962EC 001961EC 28864070 */  paddub      $16, $2, $0
/* 0962F0 001961F0 28262072 */  paddub      $4, $17, $0
/* 0962F4 001961F4 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 0962F8 001961F8 00000000 */   nop
/* 0962FC 001961FC 28260072 */  paddub      $4, $16, $0
/* 096300 00196200 282E4070 */  paddub      $5, $2, $0
/* 096304 00196204 28360070 */  paddub      $6, $0, $0
/* 096308 00196208 406A050C */  jal         SndSetSeVol__Fiii
/* 09630C 0019620C 00000000 */   nop
/* 096310 00196210 01000224 */  addiu       $2, $0, 0x1
/* 096314 00196214 2000BF7B */  lq          $31, 0x20($29)
/* 096318 00196218 1000B17B */  lq          $17, 0x10($29)
/* 09631C 0019621C 0000B07B */  lq          $16, 0x0($29)
/* 096320 00196220 3000BD27 */  addiu       $29, $29, 0x30
/* 096324 00196224 0800E003 */  jr          $31
/* 096328 00196228 00000000 */   nop
/* 09632C 0019622C 00000000 */  nop
