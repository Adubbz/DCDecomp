.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetUserID2__12CSHOT_EFFECTFi
/* 0AE500 001AE400 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE504 001AE404 21088100 */  addu        $1, $4, $1
/* 0AE508 001AE408 50A1268C */  lw          $6, -0x5EB0($1)
/* 0AE50C 001AE40C FFFF0324 */  addiu       $3, $0, -0x1
/* 0AE510 001AE410 0600C310 */  beq         $6, $3, .L001AE42C
/* 0AE514 001AE414 00000000 */   nop
/* 0AE518 001AE418 40180600 */  sll         $3, $6, 1
/* 0AE51C 001AE41C 21186400 */  addu        $3, $3, $4
/* 0AE520 001AE420 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE524 001AE424 21086100 */  addu        $1, $3, $1
/* 0AE528 001AE428 60A025A4 */  sh          $5, -0x5FA0($1)
.L001AE42C:
/* 0AE52C 001AE42C 0800E003 */  jr          $31
/* 0AE530 001AE430 00000000 */   nop
/* 0AE534 001AE434 00000000 */  nop
/* 0AE538 001AE438 00000000 */  nop
/* 0AE53C 001AE43C 00000000 */  nop
