.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceCdGetReadPos
/* A2A0 0010A1A0 2500023C */  lui        $2, (0x2502C0 >> 16)
/* A2A4 0010A1A4 01000424 */  addiu      $4, $0, 0x1
/* A2A8 0010A1A8 C002438C */  lw         $3, (0x2502C0 & 0xFFFF)($2)
/* A2AC 0010A1AC 06006414 */  bne        $3, $4, .L0010A1C8
/* A2B0 0010A1B0 2A00033C */   lui       $3, %hi(D_002A40C0)
/* A2B4 0010A1B4 0020023C */  lui        $2, (0x20000000 >> 16)
/* A2B8 0010A1B8 C0406324 */  addiu      $3, $3, %lo(D_002A40C0)
/* A2BC 0010A1BC 25186200 */  or         $3, $3, $2
/* A2C0 0010A1C0 0800E003 */  jr         $31
/* A2C4 0010A1C4 0000628C */   lw        $2, (0x20000000 & 0xFFFF)($3)
.L0010A1C8:
/* A2C8 0010A1C8 0800E003 */  jr         $31
/* A2CC 0010A1CC 2D100000 */   daddu     $2, $0, $0
