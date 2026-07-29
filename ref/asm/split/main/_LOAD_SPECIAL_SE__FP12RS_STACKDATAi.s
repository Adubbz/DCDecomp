.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _LOAD_SPECIAL_SE__FP12RS_STACKDATAi
/* 096330 00196230 E0FFBD27 */  addiu       $29, $29, -0x20
/* 096334 00196234 1000BF7F */  sq          $31, 0x10($29)
/* 096338 00196238 0000B07F */  sq          $16, 0x0($29)
/* 09633C 0019623C 28868070 */  paddub      $16, $4, $0
/* 096340 00196240 30FB040C */  jal         StartReadBG__Fv
/* 096344 00196244 00000000 */   nop
/* 096348 00196248 28260072 */  paddub      $4, $16, $0
/* 09634C 0019624C D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 096350 00196250 00000000 */   nop
/* 096354 00196254 28264070 */  paddub      $4, $2, $0
/* 096358 00196258 948B858F */  lw          $5, -0x746C($28)
/* 09635C 0019625C 28360070 */  paddub      $6, $0, $0
/* 096360 00196260 D86D050C */  jal         SndSPSeLoadBG__FiPUiPi
/* 096364 00196264 00000000 */   nop
/* 096368 00196268 01000224 */  addiu       $2, $0, 0x1
/* 09636C 0019626C 1000BF7B */  lq          $31, 0x10($29)
/* 096370 00196270 0000B07B */  lq          $16, 0x0($29)
/* 096374 00196274 2000BD27 */  addiu       $29, $29, 0x20
/* 096378 00196278 0800E003 */  jr          $31
/* 09637C 0019627C 00000000 */   nop
