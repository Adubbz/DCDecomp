.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetCamera__Fv
/* 091B00 00191A00 E0FFBD27 */  addiu       $29, $29, -0x20
/* 091B04 00191A04 1000BF7F */  sq          $31, 0x10($29)
/* 091B08 00191A08 0000B07F */  sq          $16, 0x0($29)
/* 091B0C 00191A0C D401013C */  lui         $1, %hi(EdEventInfo + 0x40)
/* 091B10 00191A10 10D2308C */  lw          $16, %lo(EdEventInfo + 0x40)($1)
/* 091B14 00191A14 04000016 */  bnez        $16, .L00191A28
/* 091B18 00191A18 00000000 */   nop
/* 091B1C 00191A1C 28160070 */  paddub      $2, $0, $0
/* 091B20 00191A20 05000010 */  b           .L00191A38
/* 091B24 00191A24 00000000 */   nop
.L00191A28:
/* 091B28 00191A28 28260072 */  paddub      $4, $16, $0
/* 091B2C 00191A2C C492040C */  jal         FollowOff__13CCameraFollowFv
/* 091B30 00191A30 00000000 */   nop
/* 091B34 00191A34 28160072 */  paddub      $2, $16, $0
.L00191A38:
/* 091B38 00191A38 1000BF7B */  lq          $31, 0x10($29)
/* 091B3C 00191A3C 0000B07B */  lq          $16, 0x0($29)
/* 091B40 00191A40 2000BD27 */  addiu       $29, $29, 0x20
/* 091B44 00191A44 0800E003 */  jr          $31
/* 091B48 00191A48 00000000 */   nop
/* 091B4C 00191A4C 00000000 */  nop
