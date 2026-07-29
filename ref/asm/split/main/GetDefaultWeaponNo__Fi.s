.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetDefaultWeaponNo__Fi
/* 0F3EA0 001F3DA0 40180400 */  sll         $3, $4, 1
/* 0F3EA4 001F3DA4 2900023C */  lui         $2, %hi(MenuDefaultWeaponNo)
/* 0F3EA8 001F3DA8 982B4224 */  addiu       $2, $2, %lo(MenuDefaultWeaponNo)
/* 0F3EAC 001F3DAC 21104300 */  addu        $2, $2, $3
/* 0F3EB0 001F3DB0 00004284 */  lh          $2, 0x0($2)
/* 0F3EB4 001F3DB4 0800E003 */  jr          $31
/* 0F3EB8 001F3DB8 00000000 */   nop
/* 0F3EBC 001F3DBC 00000000 */  nop
