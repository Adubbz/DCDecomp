.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetRandomRate__12CSHOT_EFFECTFf
/* 0AE350 001AE250 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE354 001AE254 21088100 */  addu        $1, $4, $1
/* 0AE358 001AE258 50A1258C */  lw          $5, -0x5EB0($1)
/* 0AE35C 001AE25C FFFF0324 */  addiu       $3, $0, -0x1
/* 0AE360 001AE260 0600A310 */  beq         $5, $3, .L001AE27C
/* 0AE364 001AE264 00000000 */   nop
/* 0AE368 001AE268 80180500 */  sll         $3, $5, 2
/* 0AE36C 001AE26C 21186400 */  addu        $3, $3, $4
/* 0AE370 001AE270 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE374 001AE274 21086100 */  addu        $1, $3, $1
/* 0AE378 001AE278 D0A02CE4 */  swc1        $f12, -0x5F30($1)
.L001AE27C:
/* 0AE37C 001AE27C 0800E003 */  jr          $31
/* 0AE380 001AE280 00000000 */   nop
/* 0AE384 001AE284 00000000 */  nop
/* 0AE388 001AE288 00000000 */  nop
/* 0AE38C 001AE28C 00000000 */  nop
