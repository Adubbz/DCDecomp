.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdGetFadeColor__FPf
/* 089920 00189820 D401013C */  lui         $1, %hi(fade_col)
/* 089924 00189824 C0D120C4 */  lwc1        $f0, %lo(fade_col)($1)
/* 089928 00189828 000080E4 */  swc1        $f0, 0x0($4)
/* 08992C 0018982C D401013C */  lui         $1, %hi(fade_col + 0x4)
/* 089930 00189830 C4D120C4 */  lwc1        $f0, %lo(fade_col + 0x4)($1)
/* 089934 00189834 040080E4 */  swc1        $f0, 0x4($4)
/* 089938 00189838 D401013C */  lui         $1, %hi(fade_col + 0x8)
/* 08993C 0018983C C8D120C4 */  lwc1        $f0, %lo(fade_col + 0x8)($1)
/* 089940 00189840 080080E4 */  swc1        $f0, 0x8($4)
/* 089944 00189844 D401013C */  lui         $1, %hi(fade_col + 0xC)
/* 089948 00189848 CCD120C4 */  lwc1        $f0, %lo(fade_col + 0xC)($1)
/* 08994C 0018984C 0C0080E4 */  swc1        $f0, 0xC($4)
/* 089950 00189850 0800E003 */  jr          $31
/* 089954 00189854 00000000 */   nop
/* 089958 00189858 00000000 */  nop
/* 08995C 0018985C 00000000 */  nop
