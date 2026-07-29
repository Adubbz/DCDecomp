.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _TURN_CHARA__FP12RS_STACKDATAi
/* 08E300 0018E200 D0FFBD27 */  addiu       $29, $29, -0x30
/* 08E304 0018E204 1000BF7F */  sq          $31, 0x10($29)
/* 08E308 0018E208 0000B07F */  sq          $16, 0x0($29)
/* 08E30C 0018E20C 28868070 */  paddub      $16, $4, $0
/* 08E310 0018E210 2000A527 */  addiu       $5, $29, 0x20
/* 08E314 0018E214 7C2D060C */  jal         GetPosition__FP12RS_STACKDATAPf
/* 08E318 0018E218 00000000 */   nop
/* 08E31C 0018E21C 18001026 */  addiu       $16, $16, 0x18
/* 08E320 0018E220 28260072 */  paddub      $4, $16, $0
/* 08E324 0018E224 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 08E328 0018E228 00000000 */   nop
/* 08E32C 0018E22C D401013C */  lui         $1, %hi(EdEventInfo + 0x4C)
/* 08E330 0018E230 1CD2248C */  lw          $4, %lo(EdEventInfo + 0x4C)($1)
/* 08E334 0018E234 2000A527 */  addiu       $5, $29, 0x20
/* 08E338 0018E238 06030046 */  mov.s       $f12, $f0
/* 08E33C 0018E23C 382C060C */  jal         turn_chara__FP10CCharacterPff
/* 08E340 0018E240 00000000 */   nop
/* 08E344 0018E244 01000224 */  addiu       $2, $0, 0x1
/* 08E348 0018E248 1000BF7B */  lq          $31, 0x10($29)
/* 08E34C 0018E24C 0000B07B */  lq          $16, 0x0($29)
/* 08E350 0018E250 3000BD27 */  addiu       $29, $29, 0x30
/* 08E354 0018E254 0800E003 */  jr          $31
/* 08E358 0018E258 00000000 */   nop
/* 08E35C 0018E25C 00000000 */  nop
