.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetNoSound__12CSHOT_EFFECTFv
/* 0AE310 001AE210 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE314 001AE214 21088100 */  addu        $1, $4, $1
/* 0AE318 001AE218 50A1268C */  lw          $6, -0x5EB0($1)
/* 0AE31C 001AE21C FFFF0324 */  addiu       $3, $0, -0x1
/* 0AE320 001AE220 0600C310 */  beq         $6, $3, .L001AE23C
/* 0AE324 001AE224 00000000 */   nop
/* 0AE328 001AE228 01000524 */  addiu       $5, $0, 0x1
/* 0AE32C 001AE22C 2118C400 */  addu        $3, $6, $4
/* 0AE330 001AE230 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE334 001AE234 21086100 */  addu        $1, $3, $1
/* 0AE338 001AE238 30A125A0 */  sb          $5, -0x5ED0($1)
.L001AE23C:
/* 0AE33C 001AE23C 0800E003 */  jr          $31
/* 0AE340 001AE240 00000000 */   nop
/* 0AE344 001AE244 00000000 */  nop
/* 0AE348 001AE248 00000000 */  nop
/* 0AE34C 001AE24C 00000000 */  nop
