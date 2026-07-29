.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetLifeTime__12CSHOT_EFFECTFi
/* 0AE390 001AE290 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE394 001AE294 21088100 */  addu        $1, $4, $1
/* 0AE398 001AE298 50A1268C */  lw          $6, -0x5EB0($1)
/* 0AE39C 001AE29C FFFF0324 */  addiu       $3, $0, -0x1
/* 0AE3A0 001AE2A0 0600C310 */  beq         $6, $3, .L001AE2BC
/* 0AE3A4 001AE2A4 00000000 */   nop
/* 0AE3A8 001AE2A8 80180600 */  sll         $3, $6, 2
/* 0AE3AC 001AE2AC 21186400 */  addu        $3, $3, $4
/* 0AE3B0 001AE2B0 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE3B4 001AE2B4 21086100 */  addu        $1, $3, $1
/* 0AE3B8 001AE2B8 F0A025AC */  sw          $5, -0x5F10($1)
.L001AE2BC:
/* 0AE3BC 001AE2BC 0800E003 */  jr          $31
/* 0AE3C0 001AE2C0 00000000 */   nop
/* 0AE3C4 001AE2C4 00000000 */  nop
/* 0AE3C8 001AE2C8 00000000 */  nop
/* 0AE3CC 001AE2CC 00000000 */  nop
