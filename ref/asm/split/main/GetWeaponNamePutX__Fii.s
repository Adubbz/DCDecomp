.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetWeaponNamePutX__Fii
/* 0F97C0 001F96C0 43100500 */  sra         $2, $5, 1
/* 0F97C4 001F96C4 23108200 */  subu        $2, $4, $2
/* 0F97C8 001F96C8 0800E003 */  jr          $31
/* 0F97CC 001F96CC 00000000 */   nop
