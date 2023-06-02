.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __default_terminate
/* D680 0010D580 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* D684 0010D584 0000BFFF */  sd         $31, 0x0($sp)
/* D688 0010D588 6A00040C */  jal        abort
/* D68C 0010D58C 00000000 */   nop
