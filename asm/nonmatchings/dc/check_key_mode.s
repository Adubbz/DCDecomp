.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel check_key_mode__Fi
/* 698C0 001697C0 FFFF0234 */  ori        $2, $0, 0xFFFF
/* 698C4 001697C4 04008214 */  bne        $4, $2, .L001697D8
/* 698C8 001697C8 00000000 */   nop
/* 698CC 001697CC 01000224 */  addiu      $2, $0, 0x1
/* 698D0 001697D0 04000010 */  b          .L001697E4
/* 698D4 001697D4 00000000 */   nop
.L001697D8:
/* 698D8 001697D8 2487828F */  lw         $2, -0x78DC($gp)
/* 698DC 001697DC 24104400 */  and        $2, $2, $4
/* 698E0 001697E0 2B100200 */  sltu       $2, $0, $2
.L001697E4:
/* 698E4 001697E4 0800E003 */  jr         $31
/* 698E8 001697E8 00000000 */   nop
/* 698EC 001697EC 00000000 */  nop
