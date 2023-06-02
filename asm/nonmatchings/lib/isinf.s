.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel isinf
/* 48D0 001047D0 3C100400 */  dsll32     $2, $4, 0
/* 48D4 001047D4 3F100200 */  dsra32     $2, $2, 0
/* 48D8 001047D8 3F200400 */  dsra32     $4, $4, 0
/* 48DC 001047DC FF7F033C */  lui        $3, (0x7FFFFFFF >> 16)
/* 48E0 001047E0 23280200 */  negu       $5, $2
/* 48E4 001047E4 FFFF6334 */  ori        $3, $3, (0x7FFFFFFF & 0xFFFF)
/* 48E8 001047E8 25104500 */  or         $2, $2, $5
/* 48EC 001047EC 24208300 */  and        $4, $4, $3
/* 48F0 001047F0 C2170200 */  srl        $2, $2, 31
/* 48F4 001047F4 F07F053C */  lui        $5, (0x7FF00000 >> 16)
/* 48F8 001047F8 25208200 */  or         $4, $4, $2
/* 48FC 001047FC 2320A400 */  subu       $4, $5, $4
/* 4900 00104800 01000224 */  addiu      $2, $0, 0x1
/* 4904 00104804 23180400 */  negu       $3, $4
/* 4908 00104808 25208300 */  or         $4, $4, $3
/* 490C 0010480C C2270400 */  srl        $4, $4, 31
/* 4910 00104810 0800E003 */  jr         $31
/* 4914 00104814 23104400 */   subu      $2, $2, $4