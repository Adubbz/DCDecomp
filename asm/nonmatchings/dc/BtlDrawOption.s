.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BtlDrawOption__Fv
/* F5930 001F5830 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* F5934 001F5834 0000BF7F */  sq         $31, 0x0($sp)
/* F5938 001F5838 AC7C080C */  jal        DrawMenuOption__Fv
/* F593C 001F583C 00000000 */   nop
/* F5940 001F5840 28260070 */  paddub     $4, $0, $0
/* F5944 001F5844 046F050C */  jal        setbilinear__Fi
/* F5948 001F5848 00000000 */   nop
/* F594C 001F584C 0000BF7B */  lq         $31, 0x0($sp)
/* F5950 001F5850 1000BD27 */  addiu      $sp, $sp, 0x10
/* F5954 001F5854 0800E003 */  jr         $31
/* F5958 001F5858 00000000 */   nop
/* F595C 001F585C 00000000 */  nop
