.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel scePadStateIntToStr
/* 1FCD8 0011FBD8 0800822C */  sltiu      $2, $4, 0x8
/* 1FCDC 0011FBDC 08004010 */  beqz       $2, .L0011FC00
/* 1FCE0 0011FBE0 2A00023C */   lui       $2, (0x2A0000 >> 16)
/* 1FCE4 0011FBE4 2500023C */  lui        $2, %hi(PadStateStr)
/* 1FCE8 0011FBE8 80180400 */  sll        $3, $4, 2
/* 1FCEC 0011FBEC 580A4224 */  addiu      $2, $2, %lo(PadStateStr)
/* 1FCF0 0011FBF0 2D20A000 */  daddu      $4, $5, $0
/* 1FCF4 0011FBF4 21186200 */  addu       $3, $3, $2
/* 1FCF8 0011FBF8 5A150408 */  j          strcpy
/* 1FCFC 0011FBFC 0000658C */   lw        $5, 0x0($3)
.L0011FC00:
/* 1FD00 0011FC00 508C4390 */  lbu        $3, -0x73B0($2)
/* 1FD04 0011FC04 0800E003 */  jr         $31
/* 1FD08 0011FC08 0000A3A0 */   sb        $3, 0x0($5)
/* 1FD0C 0011FC0C 00000000 */  nop
