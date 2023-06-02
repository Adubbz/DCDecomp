.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawBtlAtoraSelect__Fv
/* F5910 001F5810 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* F5914 001F5814 0000BF7F */  sq         $31, 0x0($sp)
/* F5918 001F5818 A06A080C */  jal        DrawMenuAtoraSelect__Fv
/* F591C 001F581C 00000000 */   nop
/* F5920 001F5820 0000BF7B */  lq         $31, 0x0($sp)
/* F5924 001F5824 1000BD27 */  addiu      $sp, $sp, 0x10
/* F5928 001F5828 0800E003 */  jr         $31
/* F592C 001F582C 00000000 */   nop
