.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetWepStatus__12CSHOT_EFFECTFi
/* AE480 001AE380 0100013C */  lui        $at, (0x10000 >> 16)
/* AE484 001AE384 21088100 */  addu       $at, $4, $at
/* AE488 001AE388 50A1268C */  lw         $6, -0x5EB0($at)
/* AE48C 001AE38C FFFF0324 */  addiu      $3, $0, -0x1
/* AE490 001AE390 0600C310 */  beq        $6, $3, .L001AE3AC
/* AE494 001AE394 00000000 */   nop
/* AE498 001AE398 80180600 */  sll        $3, $6, 2
/* AE49C 001AE39C 21186400 */  addu       $3, $3, $4
/* AE4A0 001AE3A0 0100013C */  lui        $at, (0x10000 >> 16)
/* AE4A4 001AE3A4 21086100 */  addu       $at, $3, $at
/* AE4A8 001AE3A8 30A025AC */  sw         $5, -0x5FD0($at)
.L001AE3AC:
/* AE4AC 001AE3AC 0800E003 */  jr         $31
/* AE4B0 001AE3B0 00000000 */   nop
/* AE4B4 001AE3B4 00000000 */  nop
/* AE4B8 001AE3B8 00000000 */  nop
/* AE4BC 001AE3BC 00000000 */  nop
