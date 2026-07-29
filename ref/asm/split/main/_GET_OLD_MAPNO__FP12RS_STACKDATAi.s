.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_OLD_MAPNO__FP12RS_STACKDATAi
/* 08C160 0018C060 F0FFBD27 */  addiu       $29, $29, -0x10
/* 08C164 0018C064 0000BF7F */  sq          $31, 0x0($29)
/* 08C168 0018C068 2C8D828F */  lw          $2, -0x72D4($28)
/* 08C16C 0018C06C 01004524 */  addiu       $5, $2, 0x1
/* 08C170 0018C070 F828060C */  jal         SetStack__FP12RS_STACKDATAi
/* 08C174 0018C074 00000000 */   nop
/* 08C178 0018C078 01000224 */  addiu       $2, $0, 0x1
/* 08C17C 0018C07C 0000BF7B */  lq          $31, 0x0($29)
/* 08C180 0018C080 1000BD27 */  addiu       $29, $29, 0x10
/* 08C184 0018C084 0800E003 */  jr          $31
/* 08C188 0018C088 00000000 */   nop
/* 08C18C 0018C08C 00000000 */  nop
