.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetObjAnime__Fi
/* 08A2F0 0018A1F0 04008004 */  bltz        $4, .L0018A204
/* 08A2F4 0018A1F4 00000000 */   nop
/* 08A2F8 0018A1F8 10008228 */  slti        $2, $4, 0x10
/* 08A2FC 0018A1FC 04004014 */  bnez        $2, .L0018A210
/* 08A300 0018A200 00000000 */   nop
.L0018A204:
/* 08A304 0018A204 28160070 */  paddub      $2, $0, $0
/* 08A308 0018A208 07000010 */  b           .L0018A228
/* 08A30C 0018A20C 00000000 */   nop
.L0018A210:
/* 08A310 0018A210 C0100400 */  sll         $2, $4, 3
/* 08A314 0018A214 21104400 */  addu        $2, $2, $4
/* 08A318 0018A218 00190200 */  sll         $3, $2, 4
/* 08A31C 0018A21C D401023C */  lui         $2, %hi(obj_anime)
/* 08A320 0018A220 A0E54224 */  addiu       $2, $2, %lo(obj_anime)
/* 08A324 0018A224 21104300 */  addu        $2, $2, $3
.L0018A228:
/* 08A328 0018A228 0800E003 */  jr          $31
/* 08A32C 0018A22C 00000000 */   nop
