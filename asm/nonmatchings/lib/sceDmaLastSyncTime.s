.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceDmaLastSyncTime
/* CF18 0010CE18 2900043C */  lui        $4, (0x290000 >> 16)
/* CF1C 0010CE1C A6110408 */  j          printf
/* CF20 0010CE20 18748424 */   addiu     $4, $4, 0x7418
/* CF24 0010CE24 00000000 */  nop
