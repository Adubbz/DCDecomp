.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WaterSplash_Init__Fv
/* AF460 001AF360 149D80AF */  sw         $0, -0x62EC($gp)
/* AF464 001AF364 D501013C */  lui        $at, (0x1D564F0 >> 16)
/* AF468 001AF368 F06420AC */  sw         $0, (0x1D564F0 & 0xFFFF)($at)
/* AF46C 001AF36C 282E0070 */  paddub     $5, $0, $0
/* AF470 001AF370 07000010 */  b          .L001AF390
/* AF474 001AF374 00000000 */   nop
.L001AF378:
/* AF478 001AF378 40210500 */  sll        $4, $5, 5
/* AF47C 001AF37C D501033C */  lui        $3, %hi(D_1D56514)
/* AF480 001AF380 14656324 */  addiu      $3, $3, %lo(D_1D56514)
/* AF484 001AF384 21186400 */  addu       $3, $3, $4
/* AF488 001AF388 000060AC */  sw         $0, 0x0($3)
/* AF48C 001AF38C 0100A524 */  addiu      $5, $5, 0x1
.L001AF390:
/* AF490 001AF390 0600A328 */  slti       $3, $5, 0x6
/* AF494 001AF394 F8FF6014 */  bnez       $3, .L001AF378
/* AF498 001AF398 00000000 */   nop
/* AF49C 001AF39C 949380AF */  sw         $0, -0x6C6C($gp)
/* AF4A0 001AF3A0 0800E003 */  jr         $31
/* AF4A4 001AF3A4 00000000 */   nop
/* AF4A8 001AF3A8 00000000 */  nop
/* AF4AC 001AF3AC 00000000 */  nop
