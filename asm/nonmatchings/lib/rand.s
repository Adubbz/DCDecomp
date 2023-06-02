.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel rand
/* 47F8 001046F8 2500023C */  lui        $2, (0x250000 >> 16)
/* 47FC 001046FC C641043C */  lui        $4, (0x41C64E6D >> 16)
/* 4800 00104700 ECFD458C */  lw         $5, -0x214($2)
/* 4804 00104704 6D4E8434 */  ori        $4, $4, (0x41C64E6D & 0xFFFF)
/* 4808 00104708 FF7F023C */  lui        $2, (0x7FFFFFFF >> 16)
/* 480C 0010470C 5800A38C */  lw         $3, 0x58($5)
/* 4810 00104710 FFFF4234 */  ori        $2, $2, (0x7FFFFFFF & 0xFFFF)
/* 4814 00104714 18186400 */  mult       $3, $3, $4
/* 4818 00104718 39306324 */  addiu      $3, $3, 0x3039
/* 481C 0010471C 24106200 */  and        $2, $3, $2
/* 4820 00104720 0800E003 */  jr         $31
/* 4824 00104724 5800A3AC */   sw        $3, 0x58($5)
