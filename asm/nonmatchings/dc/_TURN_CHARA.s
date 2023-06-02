.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _TURN_CHARA__FP12RS_STACKDATAi
/* 8E300 0018E200 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 8E304 0018E204 1000BF7F */  sq         $31, 0x10($sp)
/* 8E308 0018E208 0000B07F */  sq         $16, 0x0($sp)
/* 8E30C 0018E20C 28868070 */  paddub     $16, $4, $0
/* 8E310 0018E210 2000A527 */  addiu      $5, $sp, 0x20
/* 8E314 0018E214 7C2D060C */  jal        GetPosition__FP12RS_STACKDATAPf
/* 8E318 0018E218 00000000 */   nop
/* 8E31C 0018E21C 18001026 */  addiu      $16, $16, 0x18
/* 8E320 0018E220 28260072 */  paddub     $4, $16, $0
/* 8E324 0018E224 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 8E328 0018E228 00000000 */   nop
/* 8E32C 0018E22C D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8E330 0018E230 1CD2248C */  lw         $4, -0x2DE4($at)
/* 8E334 0018E234 2000A527 */  addiu      $5, $sp, 0x20
/* 8E338 0018E238 06030046 */  mov.s      $f12, $f0
/* 8E33C 0018E23C 382C060C */  jal        turn_chara__FP10CCharacterPff
/* 8E340 0018E240 00000000 */   nop
/* 8E344 0018E244 01000224 */  addiu      $2, $0, 0x1
/* 8E348 0018E248 1000BF7B */  lq         $31, 0x10($sp)
/* 8E34C 0018E24C 0000B07B */  lq         $16, 0x0($sp)
/* 8E350 0018E250 3000BD27 */  addiu      $sp, $sp, 0x30
/* 8E354 0018E254 0800E003 */  jr         $31
/* 8E358 0018E258 00000000 */   nop
/* 8E35C 0018E25C 00000000 */  nop
