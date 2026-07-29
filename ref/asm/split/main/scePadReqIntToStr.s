.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel scePadReqIntToStr
/* 01FDC8 0011FCC8 0400822C */  sltiu       $2, $4, 0x4
/* 01FDCC 0011FCCC 08004010 */  beqz        $2, .L0011FCF0
/* 01FDD0 0011FCD0 2A00023C */   lui        $2, %hi(RO_00298C50)
/* 01FDD4 0011FCD4 2500023C */  lui         $2, %hi(ReqStateStr)
/* 01FDD8 0011FCD8 80180400 */  sll         $3, $4, 2
/* 01FDDC 0011FCDC 780A4224 */  addiu       $2, $2, %lo(ReqStateStr)
/* 01FDE0 0011FCE0 2D20A000 */  daddu       $4, $5, $0
/* 01FDE4 0011FCE4 21186200 */  addu        $3, $3, $2
/* 01FDE8 0011FCE8 5A150408 */  j           strcpy
/* 01FDEC 0011FCEC 0000658C */   lw         $5, 0x0($3)
.L0011FCF0:
/* 01FDF0 0011FCF0 508C4390 */  lbu         $3, %lo(RO_00298C50)($2)
/* 01FDF4 0011FCF4 0800E003 */  jr          $31
/* 01FDF8 0011FCF8 0000A3A0 */   sb         $3, 0x0($5)
/* 01FDFC 0011FCFC 00000000 */  nop
