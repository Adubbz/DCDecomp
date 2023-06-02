.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetWeaponDataInfo__Fi
/* D0E90 001D0D90 04008104 */  bgez       $4, .L001D0DA4
/* D0E94 001D0D94 00000000 */   nop
/* D0E98 001D0D98 28160070 */  paddub     $2, $0, $0
/* D0E9C 001D0D9C 09000010 */  b          .L001D0DC4
/* D0EA0 001D0DA0 00000000 */   nop
.L001D0DA4:
/* D0EA4 001D0DA4 C0100400 */  sll        $2, $4, 3
/* D0EA8 001D0DA8 21104400 */  addu       $2, $2, $4
/* D0EAC 001D0DAC 40100200 */  sll        $2, $2, 1
/* D0EB0 001D0DB0 21104400 */  addu       $2, $2, $4
/* D0EB4 001D0DB4 80180200 */  sll        $3, $2, 2
/* D0EB8 001D0DB8 2800023C */  lui        $2, %hi(WeaponList)
/* D0EBC 001D0DBC C0A64224 */  addiu      $2, $2, %lo(WeaponList)
/* D0EC0 001D0DC0 21104300 */  addu       $2, $2, $3
.L001D0DC4:
/* D0EC4 001D0DC4 0800E003 */  jr         $31
/* D0EC8 001D0DC8 00000000 */   nop
/* D0ECC 001D0DCC 00000000 */  nop
