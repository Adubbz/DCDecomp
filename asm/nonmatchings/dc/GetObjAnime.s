.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetObjAnime__Fi
/* 8A2F0 0018A1F0 04008004 */  bltz       $4, .L0018A204
/* 8A2F4 0018A1F4 00000000 */   nop
/* 8A2F8 0018A1F8 10008228 */  slti       $2, $4, 0x10
/* 8A2FC 0018A1FC 04004014 */  bnez       $2, .L0018A210
/* 8A300 0018A200 00000000 */   nop
.L0018A204:
/* 8A304 0018A204 28160070 */  paddub     $2, $0, $0
/* 8A308 0018A208 07000010 */  b          .L0018A228
/* 8A30C 0018A20C 00000000 */   nop
.L0018A210:
/* 8A310 0018A210 C0100400 */  sll        $2, $4, 3
/* 8A314 0018A214 21104400 */  addu       $2, $2, $4
/* 8A318 0018A218 00190200 */  sll        $3, $2, 4
/* 8A31C 0018A21C D401023C */  lui        $2, %hi(obj_anime)
/* 8A320 0018A220 A0E54224 */  addiu      $2, $2, %lo(obj_anime)
/* 8A324 0018A224 21104300 */  addu       $2, $2, $3
.L0018A228:
/* 8A328 0018A228 0800E003 */  jr         $31
/* 8A32C 0018A22C 00000000 */   nop
