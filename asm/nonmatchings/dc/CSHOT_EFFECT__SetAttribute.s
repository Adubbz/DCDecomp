.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetAttribute__12CSHOT_EFFECTFi
/* AE450 001AE350 0100013C */  lui        $at, (0x10000 >> 16)
/* AE454 001AE354 21088100 */  addu       $at, $4, $at
/* AE458 001AE358 50A1268C */  lw         $6, -0x5EB0($at)
/* AE45C 001AE35C FFFF0324 */  addiu      $3, $0, -0x1
/* AE460 001AE360 0300C310 */  beq        $6, $3, .L001AE370
/* AE464 001AE364 00000000 */   nop
/* AE468 001AE368 0000838C */  lw         $3, 0x0($4)
/* AE46C 001AE36C 400065AC */  sw         $5, 0x40($3)
.L001AE370:
/* AE470 001AE370 0800E003 */  jr         $31
/* AE474 001AE374 00000000 */   nop
/* AE478 001AE378 00000000 */  nop
/* AE47C 001AE37C 00000000 */  nop
