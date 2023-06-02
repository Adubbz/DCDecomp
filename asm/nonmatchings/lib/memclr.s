.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel memclr
/* C470 0010C370 0A00A010 */  beqz       $5, .L0010C39C
/* C474 0010C374 FFFFA224 */   addiu     $2, $5, -0x1
/* C478 0010C378 FFFF0324 */  addiu      $3, $0, -0x1
/* C47C 0010C37C 00000000 */  nop
.L0010C380:
/* C480 0010C380 000080A0 */  sb         $0, 0x0($4)
/* C484 0010C384 FFFF4224 */  addiu      $2, $2, -0x1
/* C488 0010C388 01008424 */  addiu      $4, $4, 0x1
/* C48C 0010C38C 00000000 */  nop
/* C490 0010C390 00000000 */  nop
/* C494 0010C394 FAFF4314 */  bne        $2, $3, .L0010C380
/* C498 0010C398 00000000 */   nop
.L0010C39C:
/* C49C 0010C39C 0800E003 */  jr         $31
/* C4A0 0010C3A0 00000000 */   nop
/* C4A4 0010C3A4 00000000 */  nop
