.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MGSetBGColor__FPf
/* 2E310 0012E210 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 2E314 0012E214 0000BF7F */  sq         $31, 0x0($sp)
/* 2E318 0012E218 00008CC4 */  lwc1       $f12, 0x0($4)
/* 2E31C 0012E21C 04008DC4 */  lwc1       $f13, 0x4($4)
/* 2E320 0012E220 08008EC4 */  lwc1       $f14, 0x8($4)
/* 2E324 0012E224 0C008FC4 */  lwc1       $f15, 0xC($4)
/* 2E328 0012E228 24B8040C */  jal        MGSetBGColor__Fffff
/* 2E32C 0012E22C 00000000 */   nop
/* 2E330 0012E230 0000BF7B */  lq         $31, 0x0($sp)
/* 2E334 0012E234 1000BD27 */  addiu      $sp, $sp, 0x10
/* 2E338 0012E238 0800E003 */  jr         $31
/* 2E33C 0012E23C 00000000 */   nop
