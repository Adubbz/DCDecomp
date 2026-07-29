.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _OPEN_ESCAPE_WINDOW__FP12RS_STACKDATAi
/* 0BC520 001BC420 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0BC524 001BC424 0000BF7F */  sq          $31, 0x0($29)
/* 0BC528 001BC428 0000838C */  lw          $3, 0x0($4)
/* 0BC52C 001BC42C 03000224 */  addiu       $2, $0, 0x3
/* 0BC530 001BC430 04006210 */  beq         $3, $2, .L001BC444
/* 0BC534 001BC434 00000000 */   nop
/* 0BC538 001BC438 28160070 */  paddub      $2, $0, $0
/* 0BC53C 001BC43C 0A000010 */  b           .L001BC468
/* 0BC540 001BC440 00000000 */   nop
.L001BC444:
/* 0BC544 001BC444 0400828C */  lw          $2, 0x4($4)
/* 0BC548 001BC448 D501013C */  lui         $1, %hi(BtEventInfo + 0x88)
/* 0BC54C 001BC44C C86722AC */  sw          $2, %lo(BtEventInfo + 0x88)($1)
/* 0BC550 001BC450 90DD060C */  jal         BtBattleMusic_Stop__Fv
/* 0BC554 001BC454 00000000 */   nop
/* 0BC558 001BC458 06000224 */  addiu       $2, $0, 0x6
/* 0BC55C 001BC45C D501013C */  lui         $1, %hi(BtEventInfo + 0x98)
/* 0BC560 001BC460 D86722AC */  sw          $2, %lo(BtEventInfo + 0x98)($1)
/* 0BC564 001BC464 01000224 */  addiu       $2, $0, 0x1
.L001BC468:
/* 0BC568 001BC468 0000BF7B */  lq          $31, 0x0($29)
/* 0BC56C 001BC46C 1000BD27 */  addiu       $29, $29, 0x10
/* 0BC570 001BC470 0800E003 */  jr          $31
/* 0BC574 001BC474 00000000 */   nop
/* 0BC578 001BC478 00000000 */  nop
/* 0BC57C 001BC47C 00000000 */  nop
