.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetAttribute__12CSHOT_EFFECTFi
/* 0AE450 001AE350 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE454 001AE354 21088100 */  addu        $1, $4, $1
/* 0AE458 001AE358 50A1268C */  lw          $6, -0x5EB0($1)
/* 0AE45C 001AE35C FFFF0324 */  addiu       $3, $0, -0x1
/* 0AE460 001AE360 0300C310 */  beq         $6, $3, .L001AE370
/* 0AE464 001AE364 00000000 */   nop
/* 0AE468 001AE368 0000838C */  lw          $3, 0x0($4)
/* 0AE46C 001AE36C 400065AC */  sw          $5, 0x40($3)
.L001AE370:
/* 0AE470 001AE370 0800E003 */  jr          $31
/* 0AE474 001AE374 00000000 */   nop
/* 0AE478 001AE378 00000000 */  nop
/* 0AE47C 001AE37C 00000000 */  nop
