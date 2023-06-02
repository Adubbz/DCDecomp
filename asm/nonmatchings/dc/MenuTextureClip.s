.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MenuTextureClip__FRiRiRiii
/* 12DF80 0022DE80 0000898C */  lw         $9, 0x0($4)
/* 12DF84 0022DE84 2A082701 */  slt        $at, $9, $7
/* 12DF88 0022DE88 0E002010 */  beqz       $at, .L0022DEC4
/* 12DF8C 0022DE8C 00000000 */   nop
/* 12DF90 0022DE90 0000C38C */  lw         $3, 0x0($6)
/* 12DF94 0022DE94 21182301 */  addu       $3, $9, $3
/* 12DF98 0022DE98 2A08E300 */  slt        $at, $7, $3
/* 12DF9C 0022DE9C 09002010 */  beqz       $at, .L0022DEC4
/* 12DFA0 0022DEA0 00000000 */   nop
/* 12DFA4 0022DEA4 23186700 */  subu       $3, $3, $7
/* 12DFA8 0022DEA8 0000C3AC */  sw         $3, 0x0($6)
/* 12DFAC 0022DEAC 0000838C */  lw         $3, 0x0($4)
/* 12DFB0 0022DEB0 2348E300 */  subu       $9, $7, $3
/* 12DFB4 0022DEB4 0000A38C */  lw         $3, 0x0($5)
/* 12DFB8 0022DEB8 21186900 */  addu       $3, $3, $9
/* 12DFBC 0022DEBC 0000A3AC */  sw         $3, 0x0($5)
/* 12DFC0 0022DEC0 000087AC */  sw         $7, 0x0($4)
.L0022DEC4:
/* 12DFC4 0022DEC4 0000848C */  lw         $4, 0x0($4)
/* 12DFC8 0022DEC8 2A088800 */  slt        $at, $4, $8
/* 12DFCC 0022DECC 08002010 */  beqz       $at, .L0022DEF0
/* 12DFD0 0022DED0 00000000 */   nop
/* 12DFD4 0022DED4 0000C38C */  lw         $3, 0x0($6)
/* 12DFD8 0022DED8 21188300 */  addu       $3, $4, $3
/* 12DFDC 0022DEDC 2A080301 */  slt        $at, $8, $3
/* 12DFE0 0022DEE0 03002010 */  beqz       $at, .L0022DEF0
/* 12DFE4 0022DEE4 00000000 */   nop
/* 12DFE8 0022DEE8 23180401 */  subu       $3, $8, $4
/* 12DFEC 0022DEEC 0000C3AC */  sw         $3, 0x0($6)
.L0022DEF0:
/* 12DFF0 0022DEF0 0800E003 */  jr         $31
/* 12DFF4 0022DEF4 00000000 */   nop
/* 12DFF8 0022DEF8 00000000 */  nop
/* 12DFFC 0022DEFC 00000000 */  nop
