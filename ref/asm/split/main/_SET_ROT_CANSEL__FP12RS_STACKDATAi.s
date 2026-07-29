.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_ROT_CANSEL__FP12RS_STACKDATAi
/* 0E2BA0 001E2AA0 E09C848F */  lw          $4, -0x6320($28)
/* 0E2BA4 001E2AA4 9000838C */  lw          $3, 0x90($4)
/* 0E2BA8 001E2AA8 80100300 */  sll         $2, $3, 2
/* 0E2BAC 001E2AAC 21184300 */  addu        $3, $2, $3
/* 0E2BB0 001E2AB0 80100300 */  sll         $2, $3, 2
/* 0E2BB4 001E2AB4 21106200 */  addu        $2, $3, $2
/* 0E2BB8 001E2AB8 00110200 */  sll         $2, $2, 4
/* 0E2BBC 001E2ABC 21104400 */  addu        $2, $2, $4
/* 0E2BC0 001E2AC0 0200013C */  lui         $1, (0x20000 >> 16)
/* 0E2BC4 001E2AC4 21084100 */  addu        $1, $2, $1
/* 0E2BC8 001E2AC8 54E420AC */  sw          $0, -0x1BAC($1)
/* 0E2BCC 001E2ACC 01000224 */  addiu       $2, $0, 0x1
/* 0E2BD0 001E2AD0 0800E003 */  jr          $31
/* 0E2BD4 001E2AD4 00000000 */   nop
/* 0E2BD8 001E2AD8 00000000 */  nop
/* 0E2BDC 001E2ADC 00000000 */  nop
