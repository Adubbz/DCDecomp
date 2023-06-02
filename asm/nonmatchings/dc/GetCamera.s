.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetCamera__Fv
/* 91B00 00191A00 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 91B04 00191A04 1000BF7F */  sq         $31, 0x10($sp)
/* 91B08 00191A08 0000B07F */  sq         $16, 0x0($sp)
/* 91B0C 00191A0C D401013C */  lui        $at, (0x1D40000 >> 16)
/* 91B10 00191A10 10D2308C */  lw         $16, -0x2DF0($at)
/* 91B14 00191A14 04000016 */  bnez       $16, .L00191A28
/* 91B18 00191A18 00000000 */   nop
/* 91B1C 00191A1C 28160070 */  paddub     $2, $0, $0
/* 91B20 00191A20 05000010 */  b          .L00191A38
/* 91B24 00191A24 00000000 */   nop
.L00191A28:
/* 91B28 00191A28 28260072 */  paddub     $4, $16, $0
/* 91B2C 00191A2C C492040C */  jal        FollowOff__13CCameraFollowFv
/* 91B30 00191A30 00000000 */   nop
/* 91B34 00191A34 28160072 */  paddub     $2, $16, $0
.L00191A38:
/* 91B38 00191A38 1000BF7B */  lq         $31, 0x10($sp)
/* 91B3C 00191A3C 0000B07B */  lq         $16, 0x0($sp)
/* 91B40 00191A40 2000BD27 */  addiu      $sp, $sp, 0x20
/* 91B44 00191A44 0800E003 */  jr         $31
/* 91B48 00191A48 00000000 */   nop
/* 91B4C 00191A4C 00000000 */  nop
