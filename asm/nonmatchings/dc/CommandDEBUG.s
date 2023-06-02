.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandDEBUG__FPPv
/* A0230 001A0130 01000324 */  addiu      $3, $0, 0x1
/* A0234 001A0134 209383AF */  sw         $3, -0x6CE0($gp)
/* A0238 001A0138 0800E003 */  jr         $31
/* A023C 001A013C 00000000 */   nop
