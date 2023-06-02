.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdGetDoorMotion__Fii
/* 722C0 001721C0 04008004 */  bltz       $4, .L001721D4
/* 722C4 001721C4 00000000 */   nop
/* 722C8 001721C8 08008228 */  slti       $2, $4, 0x8
/* 722CC 001721CC 04004014 */  bnez       $2, .L001721E0
/* 722D0 001721D0 00000000 */   nop
.L001721D4:
/* 722D4 001721D4 28160070 */  paddub     $2, $0, $0
/* 722D8 001721D8 0A000010 */  b          .L00172204
/* 722DC 001721DC 00000000 */   nop
.L001721E0:
/* 722E0 001721E0 C0180400 */  sll        $3, $4, 3
/* 722E4 001721E4 2600023C */  lui        $2, %hi(motion$520)
/* 722E8 001721E8 306F4224 */  addiu      $2, $2, %lo(motion$520)
/* 722EC 001721EC 21184300 */  addu       $3, $2, $3
/* 722F0 001721F0 2B100500 */  sltu       $2, $0, $5
/* 722F4 001721F4 80100200 */  sll        $2, $2, 2
/* 722F8 001721F8 21104300 */  addu       $2, $2, $3
/* 722FC 001721FC 0000428C */  lw         $2, 0x0($2)
/* 72300 00172200 00000000 */  nop
.L00172204:
/* 72304 00172204 0800E003 */  jr         $31
/* 72308 00172208 00000000 */   nop
/* 7230C 0017220C 00000000 */  nop