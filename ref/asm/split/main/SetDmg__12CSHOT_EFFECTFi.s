.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetDmg__12CSHOT_EFFECTFi
/* 0AE410 001AE310 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE414 001AE314 21088100 */  addu        $1, $4, $1
/* 0AE418 001AE318 50A1268C */  lw          $6, -0x5EB0($1)
/* 0AE41C 001AE31C FFFF0324 */  addiu       $3, $0, -0x1
/* 0AE420 001AE320 0600C310 */  beq         $6, $3, .L001AE33C
/* 0AE424 001AE324 00000000 */   nop
/* 0AE428 001AE328 80180600 */  sll         $3, $6, 2
/* 0AE42C 001AE32C 21186400 */  addu        $3, $3, $4
/* 0AE430 001AE330 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE434 001AE334 21086100 */  addu        $1, $3, $1
/* 0AE438 001AE338 10A025AC */  sw          $5, -0x5FF0($1)
.L001AE33C:
/* 0AE43C 001AE33C 0800E003 */  jr          $31
/* 0AE440 001AE340 00000000 */   nop
/* 0AE444 001AE344 00000000 */  nop
/* 0AE448 001AE348 00000000 */  nop
/* 0AE44C 001AE34C 00000000 */  nop
