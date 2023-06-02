.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdEventSkip__Fv
/* 978E0 001977E0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 978E4 001977E4 0000BF7F */  sq         $31, 0x0($sp)
/* 978E8 001977E8 D501023C */  lui        $2, %hi(EdEventScript)
/* 978EC 001977EC 30A44424 */  addiu      $4, $2, %lo(EdEventScript)
/* 978F0 001977F0 14F8080C */  jal        skip__10CRunScriptFv
/* 978F4 001977F4 00000000 */   nop
/* 978F8 001977F8 01000224 */  addiu      $2, $0, 0x1
/* 978FC 001977FC 0000BF7B */  lq         $31, 0x0($sp)
/* 97900 00197800 1000BD27 */  addiu      $sp, $sp, 0x10
/* 97904 00197804 0800E003 */  jr         $31
/* 97908 00197808 00000000 */   nop
/* 9790C 0019780C 00000000 */  nop
