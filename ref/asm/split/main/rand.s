.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel rand
/* 0047F8 001046F8 2500023C */  lui         $2, %hi(_impure_ptr)
/* 0047FC 001046FC C641043C */  lui         $4, (0x41C64E6D >> 16)
/* 004800 00104700 ECFD458C */  lw          $5, %lo(_impure_ptr)($2)
/* 004804 00104704 6D4E8434 */  ori         $4, $4, (0x41C64E6D & 0xFFFF)
/* 004808 00104708 FF7F023C */  lui         $2, (0x7FFFFFFF >> 16)
/* 00480C 0010470C 5800A38C */  lw          $3, 0x58($5)
/* 004810 00104710 FFFF4234 */  ori         $2, $2, (0x7FFFFFFF & 0xFFFF)
/* 004814 00104714 18186400 */  mult        $3, $3, $4
/* 004818 00104718 39306324 */  addiu       $3, $3, 0x3039
/* 00481C 0010471C 24106200 */  and         $2, $3, $2
/* 004820 00104720 0800E003 */  jr          $31
/* 004824 00104724 5800A3AC */   sw         $3, 0x58($5)
