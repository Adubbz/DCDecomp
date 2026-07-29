.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetSprite__Fi
/* 08A250 0018A150 04008004 */  bltz        $4, .L0018A164
/* 08A254 0018A154 00000000 */   nop
/* 08A258 0018A158 10008228 */  slti        $2, $4, 0x10
/* 08A25C 0018A15C 04004014 */  bnez        $2, .L0018A170
/* 08A260 0018A160 00000000 */   nop
.L0018A164:
/* 08A264 0018A164 28160070 */  paddub      $2, $0, $0
/* 08A268 0018A168 07000010 */  b           .L0018A188
/* 08A26C 0018A16C 00000000 */   nop
.L0018A170:
/* 08A270 0018A170 00110400 */  sll         $2, $4, 4
/* 08A274 0018A174 21104400 */  addu        $2, $2, $4
/* 08A278 0018A178 C0180200 */  sll         $3, $2, 3
/* 08A27C 0018A17C D401023C */  lui         $2, %hi(Sprite)
/* 08A280 0018A180 20DD4224 */  addiu       $2, $2, %lo(Sprite)
/* 08A284 0018A184 21104300 */  addu        $2, $2, $3
.L0018A188:
/* 08A288 0018A188 0800E003 */  jr          $31
/* 08A28C 0018A18C 00000000 */   nop
