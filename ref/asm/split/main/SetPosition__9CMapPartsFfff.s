.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetPosition__9CMapPartsFfff
/* 09A910 0019A810 10008CE4 */  swc1        $f12, 0x10($4)
/* 09A914 0019A814 14008DE4 */  swc1        $f13, 0x14($4)
/* 09A918 0019A818 18008EE4 */  swc1        $f14, 0x18($4)
/* 09A91C 0019A81C 0800E003 */  jr          $31
/* 09A920 0019A820 00000000 */   nop
/* 09A924 0019A824 00000000 */  nop
/* 09A928 0019A828 00000000 */  nop
/* 09A92C 0019A82C 00000000 */  nop
