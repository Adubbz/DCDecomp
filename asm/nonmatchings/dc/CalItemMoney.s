.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CalItemMoney__Fii
/* EB3D0 001EB2D0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* EB3D4 001EB2D4 0000BF7F */  sq         $31, 0x0($sp)
/* EB3D8 001EB2D8 51008128 */  slti       $at, $4, 0x51
/* EB3DC 001EB2DC 04002010 */  beqz       $at, .L001EB2F0
/* EB3E0 001EB2E0 00000000 */   nop
/* EB3E4 001EB2E4 28160070 */  paddub     $2, $0, $0
/* EB3E8 001EB2E8 05000010 */  b          .L001EB300
/* EB3EC 001EB2EC 00000000 */   nop
.L001EB2F0:
/* EB3F0 001EB2F0 BC9B070C */  jal        GetItemMoney__Fii
/* EB3F4 001EB2F4 00000000 */   nop
/* EB3F8 001EB2F8 3C140200 */  dsll32     $2, $2, 16
/* EB3FC 001EB2FC 3F140200 */  dsra32     $2, $2, 16
.L001EB300:
/* EB400 001EB300 0000BF7B */  lq         $31, 0x0($sp)
/* EB404 001EB304 1000BD27 */  addiu      $sp, $sp, 0x10
/* EB408 001EB308 0800E003 */  jr         $31
/* EB40C 001EB30C 00000000 */   nop
