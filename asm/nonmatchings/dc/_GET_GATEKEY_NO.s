.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_GATEKEY_NO__FP12RS_STACKDATAi
/* BCED0 001BCDD0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* BCED4 001BCDD4 0000BF7F */  sq         $31, 0x0($sp)
/* BCED8 001BCDD8 C89C828F */  lw         $2, -0x6338($gp)
/* BCEDC 001BCDDC 6404458C */  lw         $5, 0x464($2)
/* BCEE0 001BCDE0 70EE060C */  jal        SetStack__FP12RS_STACKDATAi_2
/* BCEE4 001BCDE4 00000000 */   nop
/* BCEE8 001BCDE8 01000224 */  addiu      $2, $0, 0x1
/* BCEEC 001BCDEC 0000BF7B */  lq         $31, 0x0($sp)
/* BCEF0 001BCDF0 1000BD27 */  addiu      $sp, $sp, 0x10
/* BCEF4 001BCDF4 0800E003 */  jr         $31
/* BCEF8 001BCDF8 00000000 */   nop
/* BCEFC 001BCDFC 00000000 */  nop
