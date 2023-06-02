.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishImageIconDraw__Fiiii
/* F2520 001F2420 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* F2524 001F2424 0000BF7F */  sq         $31, 0x0($sp)
/* F2528 001F2428 2000A0AF */  sw         $0, 0x20($sp)
/* F252C 001F242C D0000224 */  addiu      $2, $0, 0xD0
/* F2530 001F2430 2400A2AF */  sw         $2, 0x24($sp)
/* F2534 001F2434 2800A6AF */  sw         $6, 0x28($sp)
/* F2538 001F2438 28000224 */  addiu      $2, $0, 0x28
/* F253C 001F243C 2C00A2AF */  sw         $2, 0x2C($sp)
/* F2540 001F2440 1000A4AF */  sw         $4, 0x10($sp)
/* F2544 001F2444 1400A5AF */  sw         $5, 0x14($sp)
/* F2548 001F2448 1800A6AF */  sw         $6, 0x18($sp)
/* F254C 001F244C 1C00A2AF */  sw         $2, 0x1C($sp)
/* F2550 001F2450 C894848F */  lw         $4, -0x6B38($gp)
/* F2554 001F2454 1000A527 */  addiu      $5, $sp, 0x10
/* F2558 001F2458 2000A627 */  addiu      $6, $sp, 0x20
/* F255C 001F245C C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* F2560 001F2460 00000000 */   nop
/* F2564 001F2464 0000BF7B */  lq         $31, 0x0($sp)
/* F2568 001F2468 3000BD27 */  addiu      $sp, $sp, 0x30
/* F256C 001F246C 0800E003 */  jr         $31
/* F2570 001F2470 00000000 */   nop
/* F2574 001F2474 00000000 */  nop
/* F2578 001F2478 00000000 */  nop
/* F257C 001F247C 00000000 */  nop
