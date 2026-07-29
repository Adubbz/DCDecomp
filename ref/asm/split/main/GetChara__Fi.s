.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetChara__Fi
/* 08B310 0018B210 FFFF0224 */  addiu       $2, $0, -0x1
/* 08B314 0018B214 05008214 */  bne         $4, $2, .L0018B22C
/* 08B318 0018B218 00000000 */   nop
/* 08B31C 0018B21C D401013C */  lui         $1, %hi(EdEventInfo + 0x4C)
/* 08B320 0018B220 1CD2228C */  lw          $2, %lo(EdEventInfo + 0x4C)($1)
/* 08B324 0018B224 13000010 */  b           .L0018B274
/* 08B328 0018B228 00000000 */   nop
.L0018B22C:
/* 08B32C 0018B22C 06008004 */  bltz        $4, .L0018B248
/* 08B330 0018B230 00000000 */   nop
/* 08B334 0018B234 D401013C */  lui         $1, %hi(EdEventInfo + 0x1F8)
/* 08B338 0018B238 C8D3228C */  lw          $2, %lo(EdEventInfo + 0x1F8)($1)
/* 08B33C 0018B23C 2A108200 */  slt         $2, $4, $2
/* 08B340 0018B240 04004014 */  bnez        $2, .L0018B254
/* 08B344 0018B244 00000000 */   nop
.L0018B248:
/* 08B348 0018B248 28160070 */  paddub      $2, $0, $0
/* 08B34C 0018B24C 09000010 */  b           .L0018B274
/* 08B350 0018B250 00000000 */   nop
.L0018B254:
/* 08B354 0018B254 40110400 */  sll         $2, $4, 5
/* 08B358 0018B258 21184400 */  addu        $3, $2, $4
/* 08B35C 0018B25C 80100300 */  sll         $2, $3, 2
/* 08B360 0018B260 21106200 */  addu        $2, $3, $2
/* 08B364 0018B264 40190200 */  sll         $3, $2, 5
/* 08B368 0018B268 D401013C */  lui         $1, %hi(EdEventInfo + 0x58)
/* 08B36C 0018B26C 28D2228C */  lw          $2, %lo(EdEventInfo + 0x58)($1)
/* 08B370 0018B270 21104300 */  addu        $2, $2, $3
.L0018B274:
/* 08B374 0018B274 0800E003 */  jr          $31
/* 08B378 0018B278 00000000 */   nop
/* 08B37C 0018B27C 00000000 */  nop
