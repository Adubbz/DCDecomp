.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_FLOOR_TITLE_OFF__FP12RS_STACKDATAi
/* BD170 001BD070 01000224 */  addiu      $2, $0, 0x1
/* BD174 001BD074 D501013C */  lui        $at, (0x1D567CC >> 16)
/* BD178 001BD078 CC6722AC */  sw         $2, (0x1D567CC & 0xFFFF)($at)
/* BD17C 001BD07C 0800E003 */  jr         $31
/* BD180 001BD080 00000000 */   nop
/* BD184 001BD084 00000000 */  nop
/* BD188 001BD088 00000000 */  nop
/* BD18C 001BD08C 00000000 */  nop
