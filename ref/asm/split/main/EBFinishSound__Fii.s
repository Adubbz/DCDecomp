.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EBFinishSound__Fii
/* 0682F0 001681F0 C48E84AF */  sw          $4, -0x713C($28)
/* 0682F4 001681F4 C88E85AF */  sw          $5, -0x7138($28)
/* 0682F8 001681F8 0800E003 */  jr          $31
/* 0682FC 001681FC 00000000 */   nop
