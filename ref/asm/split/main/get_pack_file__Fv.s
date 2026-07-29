.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel get_pack_file__Fv
/* 08C3A0 0018C2A0 5C92828F */  lw          $2, -0x6DA4($28)
/* 08C3A4 0018C2A4 80180200 */  sll         $3, $2, 2
/* 08C3A8 0018C2A8 D501023C */  lui         $2, %hi(chr_file)
/* 08C3AC 0018C2AC D0A44224 */  addiu       $2, $2, %lo(chr_file)
/* 08C3B0 0018C2B0 21104300 */  addu        $2, $2, $3
/* 08C3B4 0018C2B4 0000428C */  lw          $2, 0x0($2)
/* 08C3B8 0018C2B8 0800E003 */  jr          $31
/* 08C3BC 0018C2BC 00000000 */   nop
