.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MGSetBGColor__FPf
/* 02E310 0012E210 F0FFBD27 */  addiu       $29, $29, -0x10
/* 02E314 0012E214 0000BF7F */  sq          $31, 0x0($29)
/* 02E318 0012E218 00008CC4 */  lwc1        $f12, 0x0($4)
/* 02E31C 0012E21C 04008DC4 */  lwc1        $f13, 0x4($4)
/* 02E320 0012E220 08008EC4 */  lwc1        $f14, 0x8($4)
/* 02E324 0012E224 0C008FC4 */  lwc1        $f15, 0xC($4)
/* 02E328 0012E228 24B8040C */  jal         MGSetBGColor__Fffff
/* 02E32C 0012E22C 00000000 */   nop
/* 02E330 0012E230 0000BF7B */  lq          $31, 0x0($29)
/* 02E334 0012E234 1000BD27 */  addiu       $29, $29, 0x10
/* 02E338 0012E238 0800E003 */  jr          $31
/* 02E33C 0012E23C 00000000 */   nop
