.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetNoSound__12CSHOT_EFFECTFv
/* AE310 001AE210 0100013C */  lui        $at, (0x10000 >> 16)
/* AE314 001AE214 21088100 */  addu       $at, $4, $at
/* AE318 001AE218 50A1268C */  lw         $6, -0x5EB0($at)
/* AE31C 001AE21C FFFF0324 */  addiu      $3, $0, -0x1
/* AE320 001AE220 0600C310 */  beq        $6, $3, .L001AE23C
/* AE324 001AE224 00000000 */   nop
/* AE328 001AE228 01000524 */  addiu      $5, $0, 0x1
/* AE32C 001AE22C 2118C400 */  addu       $3, $6, $4
/* AE330 001AE230 0100013C */  lui        $at, (0x10000 >> 16)
/* AE334 001AE234 21086100 */  addu       $at, $3, $at
/* AE338 001AE238 30A125A0 */  sb         $5, -0x5ED0($at)
.L001AE23C:
/* AE33C 001AE23C 0800E003 */  jr         $31
/* AE340 001AE240 00000000 */   nop
/* AE344 001AE244 00000000 */  nop
/* AE348 001AE248 00000000 */  nop
/* AE34C 001AE24C 00000000 */  nop
