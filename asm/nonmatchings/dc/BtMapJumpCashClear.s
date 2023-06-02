.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BtMapJumpCashClear__Fv
/* B21C0 001B20C0 D501013C */  lui        $at, (0x1D565C0 >> 16)
/* B21C4 001B20C4 C06520A0 */  sb         $0, (0x1D565C0 & 0xFFFF)($at)
/* B21C8 001B20C8 DC9380AF */  sw         $0, -0x6C24($gp)
/* B21CC 001B20CC FFFF0324 */  addiu      $3, $0, -0x1
/* B21D0 001B20D0 E09383AF */  sw         $3, -0x6C20($gp)
/* B21D4 001B20D4 0800E003 */  jr         $31
/* B21D8 001B20D8 00000000 */   nop
/* B21DC 001B20DC 00000000 */  nop
