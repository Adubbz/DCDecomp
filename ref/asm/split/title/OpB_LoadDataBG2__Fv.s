.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel OpB_LoadDataBG2__Fv
/* 00D720 01DB9420 F0FFBD27 */  addiu       $29, $29, -0x10
/* 00D724 01DB9424 0000BF7F */  sq          $31, 0x0($29)
.L01DB9428_2BEC28:
/* 00D728 01DB9428 8CFB040C */  jal         ReadBGSync__Fv
/* 00D72C 01DB942C 00000000 */   nop
/* 00D730 01DB9430 FDFF4014 */  bnez        $2, .L01DB9428_2BEC28
/* 00D734 01DB9434 00000000 */   nop
/* 00D738 01DB9438 948B858F */  lw          $5, -0x746C($28)
/* 00D73C 01DB943C DE01023C */  lui         $2, %hi(LIT_343__3)
/* 00D740 01DB9440 F0E34424 */  addiu       $4, $2, %lo(LIT_343__3)
/* 00D744 01DB9444 28360070 */  paddub      $6, $0, $0
/* 00D748 01DB9448 ACFA040C */  jal         LoadFileBG__FPcP1Pi
/* 00D74C 01DB944C 00000000 */   nop
/* 00D750 01DB9450 FFFF0324 */  addiu       $3, $0, -0x1
/* 00D754 01DB9454 DE01013C */  lui         $1, %hi(CScript__2 + 0x1C)
/* 00D758 01DB9458 1C1B23AC */  sw          $3, %lo(CScript__2 + 0x1C)($1)
/* 00D75C 01DB945C 0000BF7B */  lq          $31, 0x0($29)
/* 00D760 01DB9460 1000BD27 */  addiu       $29, $29, 0x10
/* 00D764 01DB9464 0800E003 */  jr          $31
/* 00D768 01DB9468 00000000 */   nop
/* 00D76C 01DB946C 00000000 */  nop
