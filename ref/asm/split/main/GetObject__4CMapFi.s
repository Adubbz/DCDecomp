.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetObject__4CMapFi
/* 043A80 00143980 0A00A128 */  slti        $1, $5, 0xA
/* 043A84 00143984 03002010 */  beqz        $1, .L00143994
/* 043A88 00143988 00000000 */   nop
/* 043A8C 0014398C 0400A104 */  bgez        $5, .L001439A0
/* 043A90 00143990 00000000 */   nop
.L00143994:
/* 043A94 00143994 28160070 */  paddub      $2, $0, $0
/* 043A98 00143998 06000010 */  b           .L001439B4
/* 043A9C 0014399C 00000000 */   nop
.L001439A0:
/* 043AA0 001439A0 00110500 */  sll         $2, $5, 4
/* 043AA4 001439A4 23104500 */  subu        $2, $2, $5
/* 043AA8 001439A8 00110200 */  sll         $2, $2, 4
/* 043AAC 001439AC 21108200 */  addu        $2, $4, $2
/* 043AB0 001439B0 80014224 */  addiu       $2, $2, 0x180
.L001439B4:
/* 043AB4 001439B4 0800E003 */  jr          $31
/* 043AB8 001439B8 00000000 */   nop
/* 043ABC 001439BC 00000000 */  nop
