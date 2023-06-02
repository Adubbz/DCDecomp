.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetEscapeDngFlag__Fi
/* F40A0 001F3FA0 649584A7 */  sh         $4, -0x6A9C($gp)
/* F40A4 001F3FA4 0800E003 */  jr         $31
/* F40A8 001F3FA8 00000000 */   nop
/* F40AC 001F3FAC 00000000 */  nop
