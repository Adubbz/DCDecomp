.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _Bfree
/* 37E0 001036E0 0800A010 */  beqz       $5, .L00103704
/* 37E4 001036E4 00000000 */   nop
/* 37E8 001036E8 0400A28C */  lw         $2, 0x4($5)
/* 37EC 001036EC 4C00848C */  lw         $4, 0x4C($4)
/* 37F0 001036F0 80100200 */  sll        $2, $2, 2
/* 37F4 001036F4 21104400 */  addu       $2, $2, $4
/* 37F8 001036F8 0000438C */  lw         $3, 0x0($2)
/* 37FC 001036FC 0000A3AC */  sw         $3, 0x0($5)
/* 3800 00103700 000045AC */  sw         $5, 0x0($2)
.L00103704:
/* 3804 00103704 0800E003 */  jr         $31
/* 3808 00103708 00000000 */   nop
/* 380C 0010370C 00000000 */  nop
