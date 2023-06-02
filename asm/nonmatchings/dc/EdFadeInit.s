.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdFadeInit__Fv
/* 897D0 001896D0 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 897D4 001896D4 CCD120AC */  sw         $0, -0x2E34($at)
/* 897D8 001896D8 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 897DC 001896DC C8D120AC */  sw         $0, -0x2E38($at)
/* 897E0 001896E0 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 897E4 001896E4 C4D120AC */  sw         $0, -0x2E3C($at)
/* 897E8 001896E8 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 897EC 001896EC C0D120AC */  sw         $0, -0x2E40($at)
/* 897F0 001896F0 089280AF */  sw         $0, -0x6DF8($gp)
/* 897F4 001896F4 109280AF */  sw         $0, -0x6DF0($gp)
/* 897F8 001896F8 0C9280AF */  sw         $0, -0x6DF4($gp)
/* 897FC 001896FC 0800E003 */  jr         $31
/* 89800 00189700 00000000 */   nop
/* 89804 00189704 00000000 */  nop
/* 89808 00189708 00000000 */  nop
/* 8980C 0018970C 00000000 */  nop
