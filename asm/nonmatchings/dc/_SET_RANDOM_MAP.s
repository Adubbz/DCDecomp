.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_RANDOM_MAP__FP12RS_STACKDATAi
/* BC680 001BC580 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* BC684 001BC584 0000BF7F */  sq         $31, 0x0($sp)
/* BC688 001BC588 C89C828F */  lw         $2, -0x6338($gp)
/* BC68C 001BC58C 0100013C */  lui        $at, (0x10000 >> 16)
/* BC690 001BC590 21084100 */  addu       $at, $2, $at
/* BC694 001BC594 ECBD238C */  lw         $3, -0x4214($at)
/* BC698 001BC598 01000224 */  addiu      $2, $0, 0x1
/* BC69C 001BC59C 05006214 */  bne        $3, $2, .L001BC5B4
/* BC6A0 001BC5A0 00000000 */   nop
/* BC6A4 001BC5A4 E4E1760C */  jal        func_1DB8790
/* BC6A8 001BC5A8 00000000 */   nop
/* BC6AC 001BC5AC 03000010 */  b          .L001BC5BC
/* BC6B0 001BC5B0 00000000 */   nop
.L001BC5B4:
/* BC6B4 001BC5B4 70E4760C */  jal        func_1DB91C0
/* BC6B8 001BC5B8 00000000 */   nop
.L001BC5BC:
/* BC6BC 001BC5BC 01000224 */  addiu      $2, $0, 0x1
/* BC6C0 001BC5C0 0000BF7B */  lq         $31, 0x0($sp)
/* BC6C4 001BC5C4 1000BD27 */  addiu      $sp, $sp, 0x10
/* BC6C8 001BC5C8 0800E003 */  jr         $31
/* BC6CC 001BC5CC 00000000 */   nop
