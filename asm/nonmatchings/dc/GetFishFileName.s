.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetFishFileName__Fi
/* 1413E0 002412E0 04008004 */  bltz       $4, .L002412F4
/* 1413E4 002412E4 00000000 */   nop
/* 1413E8 002412E8 12008228 */  slti       $2, $4, 0x12
/* 1413EC 002412EC 04004014 */  bnez       $2, .L00241300
/* 1413F0 002412F0 00000000 */   nop
.L002412F4:
/* 1413F4 002412F4 28160070 */  paddub     $2, $0, $0
/* 1413F8 002412F8 07000010 */  b          .L00241318
/* 1413FC 002412FC 00000000 */   nop
.L00241300:
/* 141400 00241300 80180400 */  sll        $3, $4, 2
/* 141404 00241304 2900023C */  lui        $2, %hi(name$419)
/* 141408 00241308 70654224 */  addiu      $2, $2, %lo(name$419)
/* 14140C 0024130C 21104300 */  addu       $2, $2, $3
/* 141410 00241310 0000428C */  lw         $2, 0x0($2)
/* 141414 00241314 00000000 */  nop
.L00241318:
/* 141418 00241318 0800E003 */  jr         $31
/* 14141C 0024131C 00000000 */   nop