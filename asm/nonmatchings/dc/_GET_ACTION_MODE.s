.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_ACTION_MODE__FP12RS_STACKDATAi
/* BBBA0 001BBAA0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* BBBA4 001BBAA4 0000BF7F */  sq         $31, 0x0($sp)
/* BBBA8 001BBAA8 D501013C */  lui        $at, (0x1D56764 >> 16)
/* BBBAC 001BBAAC 6467258C */  lw         $5, (0x1D56764 & 0xFFFF)($at)
/* BBBB0 001BBAB0 70EE060C */  jal        SetStack__FP12RS_STACKDATAi_2
/* BBBB4 001BBAB4 00000000 */   nop
/* BBBB8 001BBAB8 01000224 */  addiu      $2, $0, 0x1
/* BBBBC 001BBABC 0000BF7B */  lq         $31, 0x0($sp)
/* BBBC0 001BBAC0 1000BD27 */  addiu      $sp, $sp, 0x10
/* BBBC4 001BBAC4 0800E003 */  jr         $31
/* BBBC8 001BBAC8 00000000 */   nop
/* BBBCC 001BBACC 00000000 */  nop
