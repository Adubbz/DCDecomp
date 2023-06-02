.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishingFishKind__Fi
/* A97C0 001A96C0 07008104 */  bgez       $4, .L001A96E0
/* A97C4 001A96C4 00000000 */   nop
/* A97C8 001A96C8 06008228 */  slti       $2, $4, 0x6
/* A97CC 001A96CC 04004014 */  bnez       $2, .L001A96E0
/* A97D0 001A96D0 00000000 */   nop
/* A97D4 001A96D4 FFFF0224 */  addiu      $2, $0, -0x1
/* A97D8 001A96D8 0A000010 */  b          .L001A9704
/* A97DC 001A96DC 00000000 */   nop
.L001A96E0:
/* A97E0 001A96E0 C0100400 */  sll        $2, $4, 3
/* A97E4 001A96E4 21104400 */  addu       $2, $2, $4
/* A97E8 001A96E8 80110200 */  sll        $2, $2, 6
/* A97EC 001A96EC 21104400 */  addu       $2, $2, $4
/* A97F0 001A96F0 00190200 */  sll        $3, $2, 4
/* A97F4 001A96F4 6893828F */  lw         $2, -0x6C98($gp)
/* A97F8 001A96F8 21104300 */  addu       $2, $2, $3
/* A97FC 001A96FC 0000428C */  lw         $2, 0x0($2)
/* A9800 001A9700 00000000 */  nop
.L001A9704:
/* A9804 001A9704 0800E003 */  jr         $31
/* A9808 001A9708 00000000 */   nop
/* A980C 001A970C 00000000 */  nop
