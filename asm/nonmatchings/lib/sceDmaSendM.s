.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceDmaSendM
/* CD48 0010CC48 2900043C */  lui        $4, (0x290000 >> 16)
/* CD4C 0010CC4C A6110408 */  j          printf
/* CD50 0010CC50 C8738424 */   addiu     $4, $4, 0x73C8
/* CD54 0010CC54 00000000 */  nop
