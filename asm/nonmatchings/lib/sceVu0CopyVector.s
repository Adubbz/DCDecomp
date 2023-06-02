.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVu0CopyVector
/* 21930 00121830 0000A678 */  lq         $6, 0x0($5)
/* 21934 00121834 0800E003 */  jr         $31
/* 21938 00121838 0000867C */   sq        $6, 0x0($4)
/* 2193C 0012183C 00000000 */  nop
