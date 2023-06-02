.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetFishMsgNo__Fi
/* F2F10 001F2E10 04008004 */  bltz       $4, .L001F2E24
/* F2F14 001F2E14 00000000 */   nop
/* F2F18 001F2E18 12008228 */  slti       $2, $4, 0x12
/* F2F1C 001F2E1C 04004014 */  bnez       $2, .L001F2E30
/* F2F20 001F2E20 00000000 */   nop
.L001F2E24:
/* F2F24 001F2E24 28160070 */  paddub     $2, $0, $0
/* F2F28 001F2E28 06000010 */  b          .L001F2E44
/* F2F2C 001F2E2C 00000000 */   nop
.L001F2E30:
/* F2F30 001F2E30 2900023C */  lui        $2, %hi(FishMsg)
/* F2F34 001F2E34 A02A4224 */  addiu      $2, $2, %lo(FishMsg)
/* F2F38 001F2E38 21104400 */  addu       $2, $2, $4
/* F2F3C 001F2E3C 00004280 */  lb         $2, 0x0($2)
/* F2F40 001F2E40 1E004224 */  addiu      $2, $2, 0x1E
.L001F2E44:
/* F2F44 001F2E44 0800E003 */  jr         $31
/* F2F48 001F2E48 00000000 */   nop
/* F2F4C 001F2E4C 00000000 */  nop
