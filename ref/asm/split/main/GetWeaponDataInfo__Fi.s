.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetWeaponDataInfo__Fi
/* 0D0E90 001D0D90 04008104 */  bgez        $4, .L001D0DA4
/* 0D0E94 001D0D94 00000000 */   nop
/* 0D0E98 001D0D98 28160070 */  paddub      $2, $0, $0
/* 0D0E9C 001D0D9C 09000010 */  b           .L001D0DC4
/* 0D0EA0 001D0DA0 00000000 */   nop
.L001D0DA4:
/* 0D0EA4 001D0DA4 C0100400 */  sll         $2, $4, 3
/* 0D0EA8 001D0DA8 21104400 */  addu        $2, $2, $4
/* 0D0EAC 001D0DAC 40100200 */  sll         $2, $2, 1
/* 0D0EB0 001D0DB0 21104400 */  addu        $2, $2, $4
/* 0D0EB4 001D0DB4 80180200 */  sll         $3, $2, 2
/* 0D0EB8 001D0DB8 2800023C */  lui         $2, %hi(WeaponList)
/* 0D0EBC 001D0DBC C0A64224 */  addiu       $2, $2, %lo(WeaponList)
/* 0D0EC0 001D0DC0 21104300 */  addu        $2, $2, $3
.L001D0DC4:
/* 0D0EC4 001D0DC4 0800E003 */  jr          $31
/* 0D0EC8 001D0DC8 00000000 */   nop
/* 0D0ECC 001D0DCC 00000000 */  nop
