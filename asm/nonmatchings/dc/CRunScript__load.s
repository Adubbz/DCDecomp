.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel load__10CRunScriptFP14RS_PROG_HEADERP12RS_STACKDATAiP11RS_CALLDATAi
/* 13DEC0 0023DDC0 0C0086AC */  sw         $6, 0xC($4)
/* 13DEC4 0023DDC4 080087AC */  sw         $7, 0x8($4)
/* 13DEC8 0023DDC8 1C0088AC */  sw         $8, 0x1C($4)
/* 13DECC 0023DDCC 180089AC */  sw         $9, 0x18($4)
/* 13DED0 0023DDD0 C0300700 */  sll        $6, $7, 3
/* 13DED4 0023DDD4 0C00838C */  lw         $3, 0xC($4)
/* 13DED8 0023DDD8 21186600 */  addu       $3, $3, $6
/* 13DEDC 0023DDDC 140083AC */  sw         $3, 0x14($4)
/* 13DEE0 0023DDE0 40180900 */  sll        $3, $9, 1
/* 13DEE4 0023DDE4 21186900 */  addu       $3, $3, $9
/* 13DEE8 0023DDE8 80300300 */  sll        $6, $3, 2
/* 13DEEC 0023DDEC 1C00838C */  lw         $3, 0x1C($4)
/* 13DEF0 0023DDF0 21186600 */  addu       $3, $3, $6
/* 13DEF4 0023DDF4 240083AC */  sw         $3, 0x24($4)
/* 13DEF8 0023DDF8 3C0085AC */  sw         $5, 0x3C($4)
/* 13DEFC 0023DDFC 0800A38C */  lw         $3, 0x8($5)
/* 13DF00 0023DE00 2118A300 */  addu       $3, $5, $3
/* 13DF04 0023DE04 400083AC */  sw         $3, 0x40($4)
/* 13DF08 0023DE08 0800E003 */  jr         $31
/* 13DF0C 0023DE0C 00000000 */   nop
