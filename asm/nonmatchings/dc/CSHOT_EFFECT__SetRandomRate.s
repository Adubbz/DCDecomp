.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetRandomRate__12CSHOT_EFFECTFf
/* AE350 001AE250 0100013C */  lui        $at, (0x10000 >> 16)
/* AE354 001AE254 21088100 */  addu       $at, $4, $at
/* AE358 001AE258 50A1258C */  lw         $5, -0x5EB0($at)
/* AE35C 001AE25C FFFF0324 */  addiu      $3, $0, -0x1
/* AE360 001AE260 0600A310 */  beq        $5, $3, .L001AE27C
/* AE364 001AE264 00000000 */   nop
/* AE368 001AE268 80180500 */  sll        $3, $5, 2
/* AE36C 001AE26C 21186400 */  addu       $3, $3, $4
/* AE370 001AE270 0100013C */  lui        $at, (0x10000 >> 16)
/* AE374 001AE274 21086100 */  addu       $at, $3, $at
/* AE378 001AE278 D0A02CE4 */  swc1       $f12, -0x5F30($at)
.L001AE27C:
/* AE37C 001AE27C 0800E003 */  jr         $31
/* AE380 001AE280 00000000 */   nop
/* AE384 001AE284 00000000 */  nop
/* AE388 001AE288 00000000 */  nop
/* AE38C 001AE28C 00000000 */  nop
