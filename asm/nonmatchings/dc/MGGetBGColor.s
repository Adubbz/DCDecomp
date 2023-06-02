.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MGGetBGColor__FPf
/* 2E340 0012E240 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 2E344 0012E244 0000BF7F */  sq         $31, 0x0($sp)
/* 2E348 0012E248 C701023C */  lui        $2, %hi(mgBackColor)
/* 2E34C 0012E24C 00554524 */  addiu      $5, $2, %lo(mgBackColor)
/* 2E350 0012E250 0C86040C */  jal        sceVu0CopyVector
/* 2E354 0012E254 00000000 */   nop
/* 2E358 0012E258 0000BF7B */  lq         $31, 0x0($sp)
/* 2E35C 0012E25C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 2E360 0012E260 0800E003 */  jr         $31
/* 2E364 0012E264 00000000 */   nop
/* 2E368 0012E268 00000000 */  nop
/* 2E36C 0012E26C 00000000 */  nop
