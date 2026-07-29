.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdFadeInit__Fv
/* 0897D0 001896D0 D401013C */  lui         $1, %hi(fade_col + 0xC)
/* 0897D4 001896D4 CCD120AC */  sw          $0, %lo(fade_col + 0xC)($1)
/* 0897D8 001896D8 D401013C */  lui         $1, %hi(fade_col + 0x8)
/* 0897DC 001896DC C8D120AC */  sw          $0, %lo(fade_col + 0x8)($1)
/* 0897E0 001896E0 D401013C */  lui         $1, %hi(fade_col + 0x4)
/* 0897E4 001896E4 C4D120AC */  sw          $0, %lo(fade_col + 0x4)($1)
/* 0897E8 001896E8 D401013C */  lui         $1, %hi(fade_col)
/* 0897EC 001896EC C0D120AC */  sw          $0, %lo(fade_col)($1)
/* 0897F0 001896F0 089280AF */  sw          $0, -0x6DF8($28)
/* 0897F4 001896F4 109280AF */  sw          $0, -0x6DF0($28)
/* 0897F8 001896F8 0C9280AF */  sw          $0, -0x6DF4($28)
/* 0897FC 001896FC 0800E003 */  jr          $31
/* 089800 00189700 00000000 */   nop
/* 089804 00189704 00000000 */  nop
/* 089808 00189708 00000000 */  nop
/* 08980C 0018970C 00000000 */  nop
