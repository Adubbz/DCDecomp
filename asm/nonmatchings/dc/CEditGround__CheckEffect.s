.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckEffect__11CEditGroundFv
/* A1AC0 001A19C0 0100013C */  lui        $at, (0x15F00 >> 16)
/* A1AC4 001A19C4 21088100 */  addu       $at, $4, $at
/* A1AC8 001A19C8 005F228C */  lw         $2, (0x15F00 & 0xFFFF)($at)
/* A1ACC 001A19CC 2A100200 */  slt        $2, $0, $2
/* A1AD0 001A19D0 0800E003 */  jr         $31
/* A1AD4 001A19D4 00000000 */   nop
/* A1AD8 001A19D8 00000000 */  nop
/* A1ADC 001A19DC 00000000 */  nop
