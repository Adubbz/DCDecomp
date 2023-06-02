.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel skip__10CRunScriptFv
/* 13E150 0023E050 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 13E154 0023E054 0000BF7F */  sq         $31, 0x0($sp)
/* 13E158 0023E058 01000224 */  addiu      $2, $0, 0x1
/* 13E15C 0023E05C 380082AC */  sw         $2, 0x38($4)
/* 13E160 0023E060 90F7080C */  jal        resume__10CRunScriptFv
/* 13E164 0023E064 00000000 */   nop
/* 13E168 0023E068 0000BF7B */  lq         $31, 0x0($sp)
/* 13E16C 0023E06C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 13E170 0023E070 0800E003 */  jr         $31
/* 13E174 0023E074 00000000 */   nop
/* 13E178 0023E078 00000000 */  nop
/* 13E17C 0023E07C 00000000 */  nop
