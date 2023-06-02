.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _MAP_JUMP_BGM_PLAY__FP12RS_STACKDATAi
/* 8C250 0018C150 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 8C254 0018C154 0000BF7F */  sq         $31, 0x0($sp)
/* 8C258 0018C158 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8C25C 0018C15C 00000000 */   nop
/* 8C260 0018C160 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8C264 0018C164 04D222AC */  sw         $2, -0x2DFC($at)
/* 8C268 0018C168 01000224 */  addiu      $2, $0, 0x1
/* 8C26C 0018C16C 0000BF7B */  lq         $31, 0x0($sp)
/* 8C270 0018C170 1000BD27 */  addiu      $sp, $sp, 0x10
/* 8C274 0018C174 0800E003 */  jr         $31
/* 8C278 0018C178 00000000 */   nop
/* 8C27C 0018C17C 00000000 */  nop
