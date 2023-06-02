.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetPosition__9CMapPartsFfff
/* 9A910 0019A810 10008CE4 */  swc1       $f12, 0x10($4)
/* 9A914 0019A814 14008DE4 */  swc1       $f13, 0x14($4)
/* 9A918 0019A818 18008EE4 */  swc1       $f14, 0x18($4)
/* 9A91C 0019A81C 0800E003 */  jr         $31
/* 9A920 0019A820 00000000 */   nop
/* 9A924 0019A824 00000000 */  nop
/* 9A928 0019A828 00000000 */  nop
/* 9A92C 0019A82C 00000000 */  nop
