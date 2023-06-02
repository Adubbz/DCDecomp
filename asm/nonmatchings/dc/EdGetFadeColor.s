.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdGetFadeColor__FPf
/* 89920 00189820 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 89924 00189824 C0D120C4 */  lwc1       $f0, -0x2E40($at)
/* 89928 00189828 000080E4 */  swc1       $f0, 0x0($4)
/* 8992C 0018982C D401013C */  lui        $at, (0x1D40000 >> 16)
/* 89930 00189830 C4D120C4 */  lwc1       $f0, -0x2E3C($at)
/* 89934 00189834 040080E4 */  swc1       $f0, 0x4($4)
/* 89938 00189838 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8993C 0018983C C8D120C4 */  lwc1       $f0, -0x2E38($at)
/* 89940 00189840 080080E4 */  swc1       $f0, 0x8($4)
/* 89944 00189844 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 89948 00189848 CCD120C4 */  lwc1       $f0, -0x2E34($at)
/* 8994C 0018984C 0C0080E4 */  swc1       $f0, 0xC($4)
/* 89950 00189850 0800E003 */  jr         $31
/* 89954 00189854 00000000 */   nop
/* 89958 00189858 00000000 */  nop
/* 8995C 0018985C 00000000 */  nop
