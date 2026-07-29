.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _MAP_JUMP_BGM_PLAY__FP12RS_STACKDATAi
/* 08C250 0018C150 F0FFBD27 */  addiu       $29, $29, -0x10
/* 08C254 0018C154 0000BF7F */  sq          $31, 0x0($29)
/* 08C258 0018C158 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08C25C 0018C15C 00000000 */   nop
/* 08C260 0018C160 D401013C */  lui         $1, %hi(EdEventInfo + 0x34)
/* 08C264 0018C164 04D222AC */  sw          $2, %lo(EdEventInfo + 0x34)($1)
/* 08C268 0018C168 01000224 */  addiu       $2, $0, 0x1
/* 08C26C 0018C16C 0000BF7B */  lq          $31, 0x0($29)
/* 08C270 0018C170 1000BD27 */  addiu       $29, $29, 0x10
/* 08C274 0018C174 0800E003 */  jr          $31
/* 08C278 0018C178 00000000 */   nop
/* 08C27C 0018C17C 00000000 */  nop
