.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetUserID2__12CSHOT_EFFECTFi
/* AE500 001AE400 0100013C */  lui        $at, (0x10000 >> 16)
/* AE504 001AE404 21088100 */  addu       $at, $4, $at
/* AE508 001AE408 50A1268C */  lw         $6, -0x5EB0($at)
/* AE50C 001AE40C FFFF0324 */  addiu      $3, $0, -0x1
/* AE510 001AE410 0600C310 */  beq        $6, $3, .L001AE42C
/* AE514 001AE414 00000000 */   nop
/* AE518 001AE418 40180600 */  sll        $3, $6, 1
/* AE51C 001AE41C 21186400 */  addu       $3, $3, $4
/* AE520 001AE420 0100013C */  lui        $at, (0x10000 >> 16)
/* AE524 001AE424 21086100 */  addu       $at, $3, $at
/* AE528 001AE428 60A025A4 */  sh         $5, -0x5FA0($at)
.L001AE42C:
/* AE52C 001AE42C 0800E003 */  jr         $31
/* AE530 001AE430 00000000 */   nop
/* AE534 001AE434 00000000 */  nop
/* AE538 001AE438 00000000 */  nop
/* AE53C 001AE43C 00000000 */  nop
