.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetSprite__Fi
/* 8A250 0018A150 04008004 */  bltz       $4, .L0018A164
/* 8A254 0018A154 00000000 */   nop
/* 8A258 0018A158 10008228 */  slti       $2, $4, 0x10
/* 8A25C 0018A15C 04004014 */  bnez       $2, .L0018A170
/* 8A260 0018A160 00000000 */   nop
.L0018A164:
/* 8A264 0018A164 28160070 */  paddub     $2, $0, $0
/* 8A268 0018A168 07000010 */  b          .L0018A188
/* 8A26C 0018A16C 00000000 */   nop
.L0018A170:
/* 8A270 0018A170 00110400 */  sll        $2, $4, 4
/* 8A274 0018A174 21104400 */  addu       $2, $2, $4
/* 8A278 0018A178 C0180200 */  sll        $3, $2, 3
/* 8A27C 0018A17C D401023C */  lui        $2, %hi(Sprite)
/* 8A280 0018A180 20DD4224 */  addiu      $2, $2, %lo(Sprite)
/* 8A284 0018A184 21104300 */  addu       $2, $2, $3
.L0018A188:
/* 8A288 0018A188 0800E003 */  jr         $31
/* 8A28C 0018A18C 00000000 */   nop
