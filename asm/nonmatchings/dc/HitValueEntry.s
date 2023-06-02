.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel HitValueEntry__FP9CHitValuePfiiP6CFrame
/* B6400 001B6300 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* B6404 001B6304 0000BF7F */  sq         $31, 0x0($sp)
/* B6408 001B6308 284E0070 */  paddub     $9, $0, $0
/* B640C 001B630C 0E000010 */  b          .L001B6348
/* B6410 001B6310 00000000 */   nop
.L001B6314:
/* B6414 001B6314 40180900 */  sll        $3, $9, 1
/* B6418 001B6318 21186900 */  addu       $3, $3, $9
/* B641C 001B631C 40510300 */  sll        $10, $3, 5
/* B6420 001B6320 21184401 */  addu       $3, $10, $4
/* B6424 001B6324 5C00638C */  lw         $3, 0x5C($3)
/* B6428 001B6328 06006014 */  bnez       $3, .L001B6344
/* B642C 001B632C 00000000 */   nop
/* B6430 001B6330 21208A00 */  addu       $4, $4, $10
/* B6434 001B6334 DCD8060C */  jal        EntryValue__9CHitValueFPfiiP6CFrame
/* B6438 001B6338 00000000 */   nop
/* B643C 001B633C 05000010 */  b          .L001B6354
/* B6440 001B6340 00000000 */   nop
.L001B6344:
/* B6444 001B6344 01002925 */  addiu      $9, $9, 0x1
.L001B6348:
/* B6448 001B6348 20002329 */  slti       $3, $9, 0x20
/* B644C 001B634C F1FF6014 */  bnez       $3, .L001B6314
/* B6450 001B6350 00000000 */   nop
.L001B6354:
/* B6454 001B6354 0000BF7B */  lq         $31, 0x0($sp)
/* B6458 001B6358 1000BD27 */  addiu      $sp, $sp, 0x10
/* B645C 001B635C 0800E003 */  jr         $31
/* B6460 001B6360 00000000 */   nop
/* B6464 001B6364 00000000 */  nop
/* B6468 001B6368 00000000 */  nop
/* B646C 001B636C 00000000 */  nop
