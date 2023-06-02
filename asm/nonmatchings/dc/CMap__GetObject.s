.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetObject__4CMapFi
/* 43A80 00143980 0A00A128 */  slti       $at, $5, 0xA
/* 43A84 00143984 03002010 */  beqz       $at, .L00143994
/* 43A88 00143988 00000000 */   nop
/* 43A8C 0014398C 0400A104 */  bgez       $5, .L001439A0
/* 43A90 00143990 00000000 */   nop
.L00143994:
/* 43A94 00143994 28160070 */  paddub     $2, $0, $0
/* 43A98 00143998 06000010 */  b          .L001439B4
/* 43A9C 0014399C 00000000 */   nop
.L001439A0:
/* 43AA0 001439A0 00110500 */  sll        $2, $5, 4
/* 43AA4 001439A4 23104500 */  subu       $2, $2, $5
/* 43AA8 001439A8 00110200 */  sll        $2, $2, 4
/* 43AAC 001439AC 21108200 */  addu       $2, $4, $2
/* 43AB0 001439B0 80014224 */  addiu      $2, $2, 0x180
.L001439B4:
/* 43AB4 001439B4 0800E003 */  jr         $31
/* 43AB8 001439B8 00000000 */   nop
/* 43ABC 001439BC 00000000 */  nop
