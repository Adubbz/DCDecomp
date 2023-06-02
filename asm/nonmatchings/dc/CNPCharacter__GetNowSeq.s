.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetNowSeq__12CNPCharacterFv
/* 565B0 001564B0 B411838C */  lw         $3, 0x11B4($4)
/* 565B4 001564B4 80100300 */  sll        $2, $3, 2
/* 565B8 001564B8 21104300 */  addu       $2, $2, $3
/* 565BC 001564BC 00110200 */  sll        $2, $2, 4
/* 565C0 001564C0 21108200 */  addu       $2, $4, $2
/* 565C4 001564C4 C0114224 */  addiu      $2, $2, 0x11C0
/* 565C8 001564C8 0800E003 */  jr         $31
/* 565CC 001564CC 00000000 */   nop
