.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceVu0CopyVector
/* 021930 00121830 0000A678 */  lq          $6, 0x0($5)
/* 021934 00121834 0800E003 */  jr          $31
/* 021938 00121838 0000867C */   sq         $6, 0x0($4)
/* 02193C 0012183C 00000000 */  nop
