.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetSoundFile__FiPcPc
/* 05A340 0015A240 C0FFBD27 */  addiu       $29, $29, -0x40
/* 05A344 0015A244 2000BF7F */  sq          $31, 0x20($29)
/* 05A348 0015A248 1000B17F */  sq          $17, 0x10($29)
/* 05A34C 0015A24C 0000B07F */  sq          $16, 0x0($29)
/* 05A350 0015A250 281E8070 */  paddub      $3, $4, $0
/* 05A354 0015A254 288EA070 */  paddub      $17, $5, $0
/* 05A358 0015A258 2886C070 */  paddub      $16, $6, $0
/* 05A35C 0015A25C 3000A427 */  addiu       $4, $29, 0x30
/* 05A360 0015A260 2A00023C */  lui         $2, %hi(LIT_514)
/* 05A364 0015A264 B09F4524 */  addiu       $5, $2, %lo(LIT_514)
/* 05A368 0015A268 28366070 */  paddub      $6, $3, $0
/* 05A36C 0015A26C 1614040C */  jal         sprintf
/* 05A370 0015A270 00000000 */   nop
/* 05A374 0015A274 28262072 */  paddub      $4, $17, $0
/* 05A378 0015A278 2A00023C */  lui         $2, %hi(LIT_515)
/* 05A37C 0015A27C C09F4524 */  addiu       $5, $2, %lo(LIT_515)
/* 05A380 0015A280 3000A627 */  addiu       $6, $29, 0x30
/* 05A384 0015A284 1614040C */  jal         sprintf
/* 05A388 0015A288 00000000 */   nop
/* 05A38C 0015A28C 28260072 */  paddub      $4, $16, $0
/* 05A390 0015A290 2A00023C */  lui         $2, %hi(LIT_350)
/* 05A394 0015A294 789F4524 */  addiu       $5, $2, %lo(LIT_350)
/* 05A398 0015A298 3000A627 */  addiu       $6, $29, 0x30
/* 05A39C 0015A29C 1614040C */  jal         sprintf
/* 05A3A0 0015A2A0 00000000 */   nop
/* 05A3A4 0015A2A4 2000BF7B */  lq          $31, 0x20($29)
/* 05A3A8 0015A2A8 1000B17B */  lq          $17, 0x10($29)
/* 05A3AC 0015A2AC 0000B07B */  lq          $16, 0x0($29)
/* 05A3B0 0015A2B0 4000BD27 */  addiu       $29, $29, 0x40
/* 05A3B4 0015A2B4 0800E003 */  jr          $31
/* 05A3B8 0015A2B8 00000000 */   nop
/* 05A3BC 0015A2BC 00000000 */  nop
