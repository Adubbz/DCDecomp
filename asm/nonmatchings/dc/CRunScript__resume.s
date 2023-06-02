.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel resume__10CRunScriptFv
/* 13DF40 0023DE40 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 13DF44 0023DE44 0000BF7F */  sq         $31, 0x0($sp)
/* 13DF48 0023DE48 3000858C */  lw         $5, 0x30($4)
/* 13DF4C 0023DE4C 0300A010 */  beqz       $5, .L0023DE5C
/* 13DF50 0023DE50 00000000 */   nop
/* 13DF54 0023DE54 20F8080C */  jal        exe__10CRunScriptFP8vmcode_t
/* 13DF58 0023DE58 00000000 */   nop
.L0023DE5C:
/* 13DF5C 0023DE5C 0000BF7B */  lq         $31, 0x0($sp)
/* 13DF60 0023DE60 1000BD27 */  addiu      $sp, $sp, 0x10
/* 13DF64 0023DE64 0800E003 */  jr         $31
/* 13DF68 0023DE68 00000000 */   nop
/* 13DF6C 0023DE6C 00000000 */  nop
