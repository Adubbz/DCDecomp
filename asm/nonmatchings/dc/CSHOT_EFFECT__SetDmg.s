.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetDmg__12CSHOT_EFFECTFi
/* AE410 001AE310 0100013C */  lui        $at, (0x10000 >> 16)
/* AE414 001AE314 21088100 */  addu       $at, $4, $at
/* AE418 001AE318 50A1268C */  lw         $6, -0x5EB0($at)
/* AE41C 001AE31C FFFF0324 */  addiu      $3, $0, -0x1
/* AE420 001AE320 0600C310 */  beq        $6, $3, .L001AE33C
/* AE424 001AE324 00000000 */   nop
/* AE428 001AE328 80180600 */  sll        $3, $6, 2
/* AE42C 001AE32C 21186400 */  addu       $3, $3, $4
/* AE430 001AE330 0100013C */  lui        $at, (0x10000 >> 16)
/* AE434 001AE334 21086100 */  addu       $at, $3, $at
/* AE438 001AE338 10A025AC */  sw         $5, -0x5FF0($at)
.L001AE33C:
/* AE43C 001AE33C 0800E003 */  jr         $31
/* AE440 001AE340 00000000 */   nop
/* AE444 001AE344 00000000 */  nop
/* AE448 001AE348 00000000 */  nop
/* AE44C 001AE34C 00000000 */  nop
