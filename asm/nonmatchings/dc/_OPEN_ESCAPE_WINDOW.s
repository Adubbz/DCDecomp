.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _OPEN_ESCAPE_WINDOW__FP12RS_STACKDATAi
/* BC520 001BC420 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* BC524 001BC424 0000BF7F */  sq         $31, 0x0($sp)
/* BC528 001BC428 0000838C */  lw         $3, 0x0($4)
/* BC52C 001BC42C 03000224 */  addiu      $2, $0, 0x3
/* BC530 001BC430 04006210 */  beq        $3, $2, .L001BC444
/* BC534 001BC434 00000000 */   nop
/* BC538 001BC438 28160070 */  paddub     $2, $0, $0
/* BC53C 001BC43C 0A000010 */  b          .L001BC468
/* BC540 001BC440 00000000 */   nop
.L001BC444:
/* BC544 001BC444 0400828C */  lw         $2, 0x4($4)
/* BC548 001BC448 D501013C */  lui        $at, (0x1D567C8 >> 16)
/* BC54C 001BC44C C86722AC */  sw         $2, (0x1D567C8 & 0xFFFF)($at)
/* BC550 001BC450 90DD060C */  jal        BtBattleMusic_Stop__Fv
/* BC554 001BC454 00000000 */   nop
/* BC558 001BC458 06000224 */  addiu      $2, $0, 0x6
/* BC55C 001BC45C D501013C */  lui        $at, (0x1D567D8 >> 16)
/* BC560 001BC460 D86722AC */  sw         $2, (0x1D567D8 & 0xFFFF)($at)
/* BC564 001BC464 01000224 */  addiu      $2, $0, 0x1
.L001BC468:
/* BC568 001BC468 0000BF7B */  lq         $31, 0x0($sp)
/* BC56C 001BC46C 1000BD27 */  addiu      $sp, $sp, 0x10
/* BC570 001BC470 0800E003 */  jr         $31
/* BC574 001BC474 00000000 */   nop
/* BC578 001BC478 00000000 */  nop
/* BC57C 001BC47C 00000000 */  nop
