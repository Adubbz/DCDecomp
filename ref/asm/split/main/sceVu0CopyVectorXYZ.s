.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceVu0CopyVectorXYZ
/* 0221C8 001220C8 0000A0C4 */  lwc1        $f0, 0x0($5)
/* 0221CC 001220CC 000080E4 */  swc1        $f0, 0x0($4)
/* 0221D0 001220D0 0400A1C4 */  lwc1        $f1, 0x4($5)
/* 0221D4 001220D4 040081E4 */  swc1        $f1, 0x4($4)
/* 0221D8 001220D8 0800A0C4 */  lwc1        $f0, 0x8($5)
/* 0221DC 001220DC 0800E003 */  jr          $31
/* 0221E0 001220E0 080080E4 */   swc1       $f0, 0x8($4)
/* 0221E4 001220E4 00000000 */  nop
